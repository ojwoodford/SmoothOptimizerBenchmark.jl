# Procrustes Problem on SO(d) (Manifold, from Gist cad99d)
using LinearAlgebra, Manopt, Manifolds, Random, Static, StaticArrays, Dates
using NLLSModel, SecondOrderOptimization, OptimizationVariableInterface

# Generate deterministic data matrix A (d x n)
function generate_procrustes_data(d::Int)
    n = Int(d * (d + 1) / 2)
    A = zeros(d, n)
    A[1, 1] = 1.0
    k = 2
    dir = zeros(d)
    for i in 2:d
        dir[1:i] .= 1 / sqrt(i)
        dir[(i + 1):end] .= 0
        v = range(0.0, 1.0, i + 2)[2:(end - 1)]
        for vi in v
            A[:, k] .= vi * dir
            k += 1
        end
    end
    return A
end

function generate_procrustes_experiment(d::Int)
    A = generate_procrustes_data(d)
    n = size(A, 2)
    M = Rotations(d)
    Random.seed!(42 + d)
    e = Matrix{Float64}(I, d, d)
    p_star = exp(M, e, rand(M; vector_at=e, σ = 0.5/d))
    B = transpose(p_star) * A # Clean data, no outliers
    return A, B, M, p_star
end

# 1. ManifoldVar residual for NLLSModel
struct ProcrustesOVIResidual <: NLLSModel.AbstractResidual
    a::Vector{Float64}
    b::Vector{Float64}
end
Base.eltype(::ProcrustesOVIResidual) = Float64
NLLSModel.ndeps(::ProcrustesOVIResidual) = static(1)
NLLSModel.nres(res::ProcrustesOVIResidual) = length(res.a)
NLLSModel.varindices(::ProcrustesOVIResidual) = 1
NLLSModel.getvars(::ProcrustesOVIResidual, vars::AbstractVector) = (vars[1],)
NLLSModel.computeresidual(res::ProcrustesOVIResidual, v::ManifoldVar) = res.a - v.point * res.b

function NLLSModel.computeresjac(::StaticInt{1}, res::ProcrustesOVIResidual, v::ManifoldVar)
    r = res.a - v.point * res.b
    M = v.context.manifold
    dim_M = manifold_dimension(M)
    d = length(res.a)
    J = zeros(Float64, d, dim_M)
    B_basis = DefaultOrthonormalBasis()
    for l in 1:dim_M
        step_vec = [j == l ? 1.0 : 0.0 for j in 1:dim_M]
        X_l = get_vector(M, v.point, step_vec, B_basis)
        J[:, l] .= -v.point * X_l * res.b
    end
    return r, J
end

# 2. Specialized closed-form zero-allocation Rotation residual for NLLSModel
@inline function cayley_rot(v, start::Int, ::Val{N}) where N
    T = eltype(v)
    M_plus = MMatrix{N, N, T, N * N}(undef)
    M_minus = MMatrix{N, N, T, N * N}(undef)
    ind = start
    @inbounds for i in 1:N
        M_plus[i, i] = one(T)
        M_minus[i, i] = one(T)
        for j in (i + 1):N
            half_w = T(0.5) * v[ind]
            M_plus[i, j] = half_w
            M_plus[j, i] = -half_w
            M_minus[i, j] = -half_w
            M_minus[j, i] = half_w
            ind += 1
        end
    end
    return SMatrix(M_minus) \ SMatrix(M_plus)
end

struct SpecializedRotation{N, N2, T}
    R::SMatrix{N, N, T, N2}
end
OptimizationVariableInterface.nvars(::SpecializedRotation{N, N2, T}) where {N, N2, T} = StaticInt((N * (N - 1)) ÷ 2)
@inline OptimizationVariableInterface.update(var::SpecializedRotation{N, N2, T}, updatevec, start=1) where {N, N2, T} =
    SpecializedRotation(var.R * cayley_rot(updatevec, start, Val(N)))

struct ProcrustesScratchBuffers
    J::Matrix{Float64}
    g::Vector{Float64}
    H::Matrix{Float64}
end
function ProcrustesScratchBuffers(d::Int)
    nv = (d * (d - 1)) ÷ 2
    return ProcrustesScratchBuffers(Matrix{Float64}(undef, d, nv), Vector{Float64}(undef, nv), Matrix{Float64}(undef, nv, nv))
end

struct SpecializedProcrustesResidual{N} <: NLLSModel.AbstractResidual
    A::SVector{N, Float64}
    B::SVector{N, Float64}
    scratch::ProcrustesScratchBuffers
end
SpecializedProcrustesResidual{N}(A::SVector{N, Float64}, B::SVector{N, Float64}) where N =
    SpecializedProcrustesResidual{N}(A, B, ProcrustesScratchBuffers(N))

NLLSModel.ndeps(::SpecializedProcrustesResidual) = static(1)
NLLSModel.nres(::SpecializedProcrustesResidual{N}) where N = static(N)
NLLSModel.varindices(::SpecializedProcrustesResidual) = 1
NLLSModel.getvars(::SpecializedProcrustesResidual, vars::AbstractVector) = (@inbounds(vars[1]),)
@inline NLLSModel.computeresidual(res::SpecializedProcrustesResidual, var::SpecializedRotation) = res.A - var.R * res.B
Base.eltype(::SpecializedProcrustesResidual) = Float64

@generated function specialized_jac_static(B::SVector{N, Float64}, R::SMatrix{N, N, Float64}) where N
    NV = (N * (N - 1)) ÷ 2
    MN = N * NV
    return quote
        J = MMatrix{$N, $NV, Float64, $MN}(undef)
        col = 1
        @inbounds for i in 1:$N
            Bi = B[i]
            for j in (i + 1):$N
                Bj = B[j]
                for row in 1:$N
                    J[row, col] = Bi * R[row, j] - Bj * R[row, i]
                end
                col += 1
            end
        end
        return SMatrix(J)
    end
end

function specialized_jac!(J::Matrix{Float64}, B::SVector{N, Float64}, R::SMatrix{N, N, Float64}) where N
    col = 1
    @inbounds for i in 1:N
        Bi = B[i]
        for j in (i + 1):N
            Bj = B[j]
            for row in 1:N
                J[row, col] = Bi * R[row, j] - Bj * R[row, i]
            end
            col += 1
        end
    end
    return J
end

function specialized_jac(res::SpecializedProcrustesResidual{N}, var::SpecializedRotation{N}) where N
    if N <= 6
        return specialized_jac_static(res.B, var.R)
    else
        return specialized_jac!(res.scratch.J, res.B, var.R)
    end
end

NLLSModel.computeresjac(::StaticInt{1}, res::SpecializedProcrustesResidual{N}, var::SpecializedRotation{N}) where N =
    (NLLSModel.computeresidual(res, var), specialized_jac(res, var))

@inline function NLLSModel.computecostgradhess(::StaticInt{1}, res::SpecializedProcrustesResidual{N}, var::SpecializedRotation{N}) where N
    r = NLLSModel.computeresidual(res, var)
    c = 0.5 * sum(abs2, r)
    if N <= 6
        J = specialized_jac_static(res.B, var.R)
        return c, J' * r, J' * J
    else
        J = specialized_jac!(res.scratch.J, res.B, var.R)
        g = res.scratch.g
        H = res.scratch.H
        mul!(g, transpose(J), r)
        mul!(H, transpose(J), J)
        return c, g, H
    end
end

function get_procrustes_dim(model)
    if model isa NLLSModel.Model
        v = model.variables[1]
        return hasfield(typeof(v), :point) ? size(v.point, 1) : size(v.R, 1)
    else
        return size(model.p0, 1)
    end
end

function get_procrustes_manopt_inplace_components(model_def)
    if hasproperty(model_def.model, :f!)
        m = model_def.model
        return m.M, m.f!, m.jac!, m.p0, m.k, m.f
    else
        d = get_procrustes_dim(model_def.model)
        A, B, M, _ = generate_procrustes_experiment(d)
        n = size(A, 2)
        k_len = d * n
        dim_M = manifold_dimension(M)
        p0 = Matrix{Float64}(I, d, d)
        function f_inplace!(M, r, p)
            @inbounds for i in 1:n
                for k in 1:d
                    r[(i-1)*d + k] = A[k, i] - dot(view(p, k, :), view(B, :, i))
                end
            end
            return r
        end
        B_basis = DefaultOrthonormalBasis()
        step_vecs = [[j == l ? 1.0 : 0.0 for j in 1:dim_M] for l in 1:dim_M]
        X_buf = zeros(d, d)
        p_X_l = zeros(d, d)
        function jac_inplace!(M, J, p)
            @inbounds for l in 1:dim_M
                get_vector!(M, X_buf, p, step_vecs[l], B_basis)
                mul!(p_X_l, p, X_buf)
                for i in 1:n
                    for k in 1:d
                        val = 0.0
                        for m_dim in 1:d
                            val += p_X_l[k, m_dim] * B[m_dim, i]
                        end
                        J[(i-1)*d + k, l] = -val
                    end
                end
            end
            return J
        end
        f_oop(M, p) = f_inplace!(M, zeros(Float64, k_len), p)
        return M, f_inplace!, jac_inplace!, p0, k_len, f_oop
    end
end

function get_procrustes_manopt_components(model_def)
    if hasproperty(model_def.model, :M)
        return model_def.model.M, model_def.model.f, model_def.model.jac, model_def.model.p0, model_def.model.k
    else
        d = get_procrustes_dim(model_def.model)
        A, B, M, _ = generate_procrustes_experiment(d)
        n = size(A, 2)
        k_len = d * n
        dim_M = manifold_dimension(M)
        p0 = Matrix{Float64}(I, d, d)
        f_manopt(M, p) = reduce(vcat, [A[:, i] - p * B[:, i] for i in 1:n])
        function jac_manopt(M, p)
            B_basis = DefaultOrthonormalBasis()
            J = zeros(k_len, dim_M)
            for l in 1:dim_M
                step_vec = [j == l ? 1.0 : 0.0 for j in 1:dim_M]
                X_l = get_vector(M, p, step_vec, B_basis)
                for i in 1:n
                    dFi = -p * X_l * B[:, i]
                    J[(i-1)*d+1 : i*d, l] .= dFi
                end
            end
            return J
        end
        return M, f_manopt, jac_manopt, p0, k_len
    end
end

function create_procrustes_problem()
    ProblemDefinition(
        "Procrustes on SO(d)",
        :manifold,
        Any[2, 3, 4, 5, 6, 8, 10, 12, 15, 18, 21, 24],
        d -> begin
            A, B, M, _ = generate_procrustes_experiment(d)
            n = size(A, 2)
            p0 = Matrix{Float64}(I, d, d)

            # Model 1: NLLSModel with OptimizationVariableInterface.ManifoldVar
            var_ovi = ManifoldVar(copy(p0), M)
            nlls_ovi = NLLSModel.Model(typeof(var_ovi), ProcrustesOVIResidual)
            addvariable!(nlls_ovi, var_ovi)
            for i in 1:n
                addcost!(nlls_ovi, ProcrustesOVIResidual(A[:, i], B[:, i]))
            end
            f_ovi, fdf_ovi!, _, _ = NLLSModel.optimvars(nlls_ovi)
            nv_ovi = (d * (d - 1)) ÷ 2
            g_ovi = zeros(Float64, nv_ovi)
            H_ovi = zeros(Float64, nv_ovi, nv_ovi)
            m_ovi = ModelDefinition(
                "NLLSModel (ManifoldVar)",
                nlls_ovi,
                () -> NLLSModel.cost(nlls_ovi),
                () -> (fdf_ovi!(g_ovi, H_ovi, nlls_ovi.variables[1]), H_ovi),
                () -> (nlls_ovi.variables[1] = ManifoldVar(copy(p0), M))
            )

            # Model 2: NLLSModel with Specialized SMatrix Rotation
            R0_static = SMatrix{d, d, Float64, d * d}(p0)
            spec_scratch = ProcrustesScratchBuffers(d)
            nlls_spec = NLLSModel.Model([SpecializedRotation(R0_static)], SpecializedProcrustesResidual{d})
            for i in 1:n
                addcost!(nlls_spec, SpecializedProcrustesResidual{d}(SVector{d, Float64}(A[:, i]), SVector{d, Float64}(B[:, i]), spec_scratch))
            end
            f_spec, fdf_spec!, _, _ = NLLSModel.optimvars(nlls_spec, nothing, StaticInt(1))
            nv_spec = (d * (d - 1)) ÷ 2
            g_spec = zeros(Float64, nv_spec)
            H_spec = zeros(Float64, nv_spec, nv_spec)
            m_spec = ModelDefinition(
                "NLLSModel (Specialized)",
                nlls_spec,
                () -> NLLSModel.cost(nlls_spec, StaticInt(1)),
                () -> (fdf_spec!(g_spec, H_spec, nlls_spec.variables[1]), H_spec),
                () -> (nlls_spec.variables[1] = SpecializedRotation(R0_static))
            )

            # Model 3: Manifolds
            k_len = d * n
            dim_M = manifold_dimension(M)
            function f_manopt!(M, r, p)
                @inbounds for i in 1:n
                    for k in 1:d
                        r[(i-1)*d + k] = A[k, i] - dot(view(p, k, :), view(B, :, i))
                    end
                end
                return r
            end
            B_basis = DefaultOrthonormalBasis()
            step_vecs = [[j == l ? 1.0 : 0.0 for j in 1:dim_M] for l in 1:dim_M]
            X_buf = zeros(d, d)
            p_X_l = zeros(d, d)
            function jac_manopt!(M, J, p)
                @inbounds for l in 1:dim_M
                    get_vector!(M, X_buf, p, step_vecs[l], B_basis)
                    mul!(p_X_l, p, X_buf)
                    for i in 1:n
                        for k in 1:d
                            val = 0.0
                            for m_dim in 1:d
                                val += p_X_l[k, m_dim] * B[m_dim, i]
                            end
                            J[(i-1)*d + k, l] = -val
                        end
                    end
                end
                return J
            end
            f_manopt(M, p) = f_manopt!(M, zeros(Float64, k_len), p)
            jac_manopt(M, p) = jac_manopt!(M, zeros(Float64, k_len, dim_M), p)

            p_curr = copy(p0)
            r_manopt = zeros(Float64, k_len)
            J_manopt = zeros(Float64, k_len, dim_M)
            g_manopt = zeros(Float64, dim_M)
            H_manopt = zeros(Float64, dim_M, dim_M)
            m_manopt = ModelDefinition(
                "Manifolds",
                (M = M, f = f_manopt, jac = jac_manopt, f! = f_manopt!, jac! = jac_manopt!, p0 = p0, k = k_len),
                () -> begin
                    f_manopt!(M, r_manopt, p_curr)
                    0.5 * sum(abs2, r_manopt)
                end,
                () -> begin
                    f_manopt!(M, r_manopt, p_curr)
                    jac_manopt!(M, J_manopt, p_curr)
                    mul!(g_manopt, transpose(J_manopt), r_manopt)
                    mul!(H_manopt, transpose(J_manopt), J_manopt)
                    return (0.5 * sum(abs2, r_manopt), H_manopt)
                end,
                () -> copyto!(p_curr, p0)
            )

            return [m_ovi, m_spec, m_manopt]
        end,
        [
            OptimizerDefinition("NLLSModel + SecondOrderOptimization (LM)", (model_def; kwargs...) -> optimize_nlls_soo(model_def; method=:lm, kwargs...)),
            OptimizerDefinition("NLLSModel + SecondOrderOptimization (Dogleg)", (model_def; kwargs...) -> optimize_nlls_soo(model_def; method=:dogleg, kwargs...)),
            OptimizerDefinition("SecondOrderOptimization (LM)", (model_def; gtol=DEFAULT_GTOL, xtol=DEFAULT_XTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...) -> begin
                M, f_res, jac_res, p0, _ = get_procrustes_manopt_components(model_def)
                var0 = ManifoldVar(copy(p0), M)
                f_soo(v::ManifoldVar) = 0.5 * sum(abs2, f_res(M, v.point))
                function fdf_soo!(g, H, v::ManifoldVar)
                    r = f_res(M, v.point)
                    J = jac_res(M, v.point)
                    mul!(g, transpose(J), r)
                    mul!(H, transpose(J), J)
                    return 0.5 * sum(abs2, r)
                end

                actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime
                opt = OptimizationOptions(iterator = :levenbergmarquardt, gtol=gtol, dstep=xtol, reldcost=ftol, maxiters=maxiters, maxtime=actual_maxtime; kwargs...)
                t_start = time_ns()
                timed = @timed SecondOrderOptimization.optimize(f_soo, fdf_soo!, var0, opt)
                t_total = time_ns() - t_start
                _, res = timed.value
                alloc_cnt = Base.gc_alloc_count(timed.gcstats)
                converged = soo_converged(res.termination)
                return OptimizerResult(Float64(t_total), alloc_cnt, timed.bytes, res.niterations, res.startcost, res.bestcost, converged)
            end),
            OptimizerDefinition("SecondOrderOptimization (Dogleg)", (model_def; gtol=DEFAULT_GTOL, xtol=DEFAULT_XTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...) -> begin
                M, f_res, jac_res, p0, _ = get_procrustes_manopt_components(model_def)
                var0 = ManifoldVar(copy(p0), M)
                f_soo(v::ManifoldVar) = 0.5 * sum(abs2, f_res(M, v.point))
                function fdf_soo!(g, H, v::ManifoldVar)
                    r = f_res(M, v.point)
                    J = jac_res(M, v.point)
                    mul!(g, transpose(J), r)
                    mul!(H, transpose(J), J)
                    return 0.5 * sum(abs2, r)
                end

                actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime
                opt = OptimizationOptions(iterator = :dogleg, gtol=gtol, dstep=xtol, reldcost=ftol, maxiters=maxiters, maxtime=actual_maxtime; kwargs...)
                t_start = time_ns()
                timed = @timed SecondOrderOptimization.optimize(f_soo, fdf_soo!, var0, opt)
                t_total = time_ns() - t_start
                _, res = timed.value
                alloc_cnt = Base.gc_alloc_count(timed.gcstats)
                converged = soo_converged(res.termination)
                return OptimizerResult(Float64(t_total), alloc_cnt, timed.bytes, res.niterations, res.startcost, res.bestcost, converged)
            end),
            OptimizerDefinition("Manopt (LevenbergMarquardt)", (model_def; gtol=DEFAULT_GTOL, xtol=DEFAULT_XTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...) -> begin
                M, f_res!, jac_res!, p0, k_len, _ = get_procrustes_manopt_inplace_components(model_def)
                r_scratch = zeros(Float64, k_len)
                f_res!(M, r_scratch, p0)
                start_c = 0.5 * sum(abs2, r_scratch)
                actual_maxiters = (time_limit !== nothing && time_limit <= 1.0) ? min(maxiters, 5) : maxiters
                actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime
                stop_time = Manopt.StopAfter(Dates.Millisecond(max(1, round(Int, actual_maxtime * 1000))))
                stop_crit = (StopWhenGradientNormLess(gtol) | StopWhenChangeLess(M, xtol) | StopAfterIteration(actual_maxiters) | stop_time)
                t_start = time_ns()
                timed = @timed Manopt.LevenbergMarquardt(M, f_res!, jac_res!, copy(p0), k_len;
                    evaluation = InplaceEvaluation(),
                    return_state = true,
                    stopping_criterion = stop_crit,
                    max_iterations = actual_maxiters
                )
                t_total = time_ns() - t_start
                state = timed.value
                inner = state isa Manopt.DebugSolverState ? state.state : state
                p_sol = Manopt.get_solver_result(state)
                f_res!(M, r_scratch, p_sol)
                final_c = 0.5 * sum(abs2, r_scratch)
                alloc_cnt = Base.gc_alloc_count(timed.gcstats)
                active = Manopt.get_active_stopping_criteria(stop_crit)
                converged = !isempty(active) && !all(c -> c isa StopAfterIteration || c isa Manopt.StopAfter, active)
                return OptimizerResult(Float64(t_total), alloc_cnt, timed.bytes, Manopt.get_count(inner, :Iterations), start_c, final_c, converged)
            end)
        ],
        "Matrix Dimension d"
    )
end
