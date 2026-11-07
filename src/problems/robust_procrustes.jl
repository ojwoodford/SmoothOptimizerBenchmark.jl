# Robust Procrustes Problem on SO(d) (Manifold, from Gist cad99d)
using LinearAlgebra, Manopt, Manifolds, Random, Static, StaticArrays
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

# 2. Specialized closed-form Rotation residual for NLLSModel
function vec2skew(v, ind, N)
    M = MMatrix{N, N, eltype(v), N*N}(undef)
    for i = 1:N
        M[i, i] = 1.0
        for j = i+1:N
            M[i, j] = v[ind]
            M[j, i] = -v[ind]
            ind += 1
        end
    end
    return SMatrix(M)
end

function proj2rot(M)
    if !(eltype(M) <: AbstractFloat)
        return M
    end
    s = svd(M)
    res = s.U * s.V'
    if det(res) < 0.0
        res = s.U * diagm(convert(typeof(s.S), vcat(ones(length(s.S)-1), -1.0))) * s.V'
    end
    return res
end

struct SpecializedRotation{N, N2, T}
    R::SMatrix{N, N, T, N2}
end
OptimizationVariableInterface.nvars(::SpecializedRotation{N, N2, T}) where {N, N2, T} = StaticInt((N*(N-1)) ÷ 2)
OptimizationVariableInterface.update(var::SpecializedRotation{N, N2, T}, updatevec, start=1) where {N, N2, T} =
    SpecializedRotation(var.R * proj2rot(vec2skew(updatevec, start, N)))

struct SpecializedProcrustesResidual{N} <: NLLSModel.AbstractResidual
    A::SVector{N, Float64}
    B::SVector{N, Float64}
end
NLLSModel.ndeps(::SpecializedProcrustesResidual) = static(1)
NLLSModel.nres(::SpecializedProcrustesResidual{N}) where N = static(N)
NLLSModel.varindices(::SpecializedProcrustesResidual) = 1
NLLSModel.getvars(res::SpecializedProcrustesResidual, vars::AbstractVector) = (vars[1],)
NLLSModel.computeresidual(res::SpecializedProcrustesResidual, var::SpecializedRotation) = res.A - var.R * res.B
Base.eltype(::SpecializedProcrustesResidual) = Float64

function specialized_jac(res::SpecializedProcrustesResidual{N}, var::SpecializedRotation{N}) where N
    NV = (N * (N - 1)) ÷ 2
    J = Matrix{Float64}(undef, N, NV)
    col = 1
    @inbounds for i in 1:N
        for j in i+1:N
            for row in 1:N
                J[row, col] = res.B[i] * var.R[row, j] - res.B[j] * var.R[row, i]
            end
            col += 1
        end
    end
    return J
end

NLLSModel.computeresjac(::StaticInt{1}, res::SpecializedProcrustesResidual{N}, var::SpecializedRotation{N}) where N =
    (NLLSModel.computeresidual(res, var), specialized_jac(res, var))

function get_procrustes_dim(model)
    if model isa NLLSModel.Model
        v = model.variables[1]
        return hasfield(typeof(v), :point) ? size(v.point, 1) : size(v.R, 1)
    else
        return size(model.p0, 1)
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

function create_robust_procrustes_problem()
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
            nlls_spec = NLLSModel.Model([SpecializedRotation(R0_static)], SpecializedProcrustesResidual{d})
            for i in 1:n
                addcost!(nlls_spec, SpecializedProcrustesResidual{d}(SVector{d, Float64}(A[:, i]), SVector{d, Float64}(B[:, i])))
            end
            f_spec, fdf_spec!, _, _ = NLLSModel.optimvars(nlls_spec)
            nv_spec = (d * (d - 1)) ÷ 2
            g_spec = zeros(Float64, nv_spec)
            H_spec = zeros(Float64, nv_spec, nv_spec)
            m_spec = ModelDefinition(
                "NLLSModel (Specialized)",
                nlls_spec,
                () -> NLLSModel.cost(nlls_spec),
                () -> (fdf_spec!(g_spec, H_spec, nlls_spec.variables[1]), H_spec),
                () -> (nlls_spec.variables[1] = SpecializedRotation(R0_static))
            )

            # Model 3: Manifolds
            k_len = d * n
            dim_M = manifold_dimension(M)
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
            p_curr = copy(p0)
            g_manopt = zeros(Float64, dim_M)
            H_manopt = zeros(Float64, dim_M, dim_M)
            m_manopt = ModelDefinition(
                "Manifolds",
                (M = M, f = f_manopt, jac = jac_manopt, p0 = p0, k = k_len),
                () -> 0.5 * sum(abs2, f_manopt(M, p_curr)),
                () -> begin
                    r = f_manopt(M, p_curr)
                    J = jac_manopt(M, p_curr)
                    mul!(g_manopt, transpose(J), r)
                    mul!(H_manopt, transpose(J), J)
                    return (0.5 * sum(abs2, r), H_manopt)
                end,
                () -> copyto!(p_curr, p0)
            )

            return [m_ovi, m_spec, m_manopt]
        end,
        [
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
                M, f_res, jac_res, p0, k_len = get_procrustes_manopt_components(model_def)
                start_c = 0.5 * sum(abs2, f_res(M, p0))
                actual_maxiters = (time_limit !== nothing && time_limit <= 1.0) ? min(maxiters, 5) : maxiters
                stop_crit = (StopWhenGradientNormLess(gtol) | StopWhenChangeLess(M, xtol) | StopAfterIteration(actual_maxiters))
                t_start = time_ns()
                timed = @timed Manopt.LevenbergMarquardt(M, f_res, jac_res, copy(p0), k_len; return_state=true, stopping_criterion=stop_crit, max_iterations=actual_maxiters)
                t_total = time_ns() - t_start
                state = timed.value
                inner = state isa Manopt.DebugSolverState ? state.state : state
                p_sol = Manopt.get_solver_result(state)
                final_c = 0.5 * sum(abs2, f_res(M, p_sol))
                alloc_cnt = Base.gc_alloc_count(timed.gcstats)
                active = Manopt.get_active_stopping_criteria(stop_crit)
                converged = !isempty(active) && !all(c -> c isa StopAfterIteration, active)
                return OptimizerResult(Float64(t_total), alloc_cnt, timed.bytes, Manopt.get_count(inner, :Iterations), start_c, final_c, converged)
            end)
        ],
        "Matrix Dimension d"
    )
end
