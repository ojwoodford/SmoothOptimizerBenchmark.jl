# Robust Procrustes Problem on SO(d) (Manifold, from Gist cad99d)
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
    B = copy(A)
    # Outliers, when there are enough points
    if n >= 6 && d >= 3
        B[2, 4] += 0.1
        B[3, 1] += 0.1
        B[3, 2] += 0.1
        B[1, 6] += 0.1
    end
    B = transpose(p_star) * B
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

# Robust cost: each correspondence contributes 0.5 * rho(||a_i - R b_i||^2), with rho the Huber kernel
const PROCRUSTES_HUBER_WIDTH = 1e-5
const procrustes_huber_kernel = NLLSModel.Huber2oKernel(PROCRUSTES_HUBER_WIDTH)
NLLSModel.robustkernel(::ProcrustesOVIResidual) = procrustes_huber_kernel

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

# Above this dimension the Cayley transform uses heap-allocated matrices and a dynamic LU solve:
# StaticArrays' unrolled d×d solve and multiply have code size (and compile time) growing as O(d³).
const CAYLEY_STATIC_MAX_DIM = 16

# Fill M_minus = I - W/2 and M_plus = I + W/2, where W is the skew-symmetric matrix of the update
@inline function fill_cayley_factors!(M_minus, M_plus, v, start::Int, N::Int)
    T = eltype(M_plus)
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
    return M_minus, M_plus
end

# Cayley transform (I - W/2) \ (I + W/2): static for N <= CAYLEY_STATIC_MAX_DIM, dynamic above
@inline function cayley_rot(v, start::Int, ::Val{N}) where N
    T = eltype(v)
    if N <= CAYLEY_STATIC_MAX_DIM
        M_plus = MMatrix{N, N, T, N * N}(undef)
        M_minus = MMatrix{N, N, T, N * N}(undef)
        fill_cayley_factors!(M_minus, M_plus, v, start, N)
        return SMatrix(M_minus) \ SMatrix(M_plus)
    else
        M_plus = Matrix{T}(undef, N, N)
        M_minus = Matrix{T}(undef, N, N)
        fill_cayley_factors!(M_minus, M_plus, v, start, N)
        return ldiv!(lu!(M_minus), M_plus)
    end
end

struct SpecializedRotation{N, N2, T}
    R::SMatrix{N, N, T, N2}
end
OptimizationVariableInterface.nvars(::SpecializedRotation{N, N2, T}) where {N, N2, T} = StaticInt((N * (N - 1)) ÷ 2)
@inline function OptimizationVariableInterface.update(var::SpecializedRotation{N, N2, T}, updatevec, start=1) where {N, N2, T}
    C = cayley_rot(updatevec, start, Val(N))
    if N <= CAYLEY_STATIC_MAX_DIM
        return SpecializedRotation(var.R * C)
    else
        # Dynamic BLAS multiply, then repack into the static rotation storage
        return SpecializedRotation(SMatrix{N, N, T, N2}(Matrix(var.R) * C))
    end
end

struct ProcrustesThreadBuffers
    J::Matrix{Float64}
end
ProcrustesThreadBuffers(d::Int) = ProcrustesThreadBuffers(Matrix{Float64}(undef, d, (d * (d - 1)) ÷ 2))

# One set of buffers per thread: NLLSModel evaluates residuals concurrently, so a single shared
# buffer would be overwritten by other threads between being filled and being consumed.
struct ProcrustesScratchBuffers
    perthread::Vector{ProcrustesThreadBuffers}
end
ProcrustesScratchBuffers(d::Int) = ProcrustesScratchBuffers([ProcrustesThreadBuffers(d) for _ in 1:Threads.maxthreadid()])
@inline threadbuffers(s::ProcrustesScratchBuffers) = @inbounds s.perthread[Threads.threadid()]

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
NLLSModel.robustkernel(::SpecializedProcrustesResidual) = procrustes_huber_kernel
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
        return specialized_jac!(threadbuffers(res.scratch).J, res.B, var.R)
    end
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

# Manopt formulation: one residual block per correspondence, r_i = a_i - p b_i, each with the same
# Huber robustifier as the NLLSModel residuals. `w ∘ HuberRobustifier()` evaluates w^2 rho(x / w^2),
# which equals NLLSModel's Huber2oKernel(w), and Manopt's cost is 0.5 * sum_i rho(||r_i||^2).
struct ProcrustesBlockResidual
    a::Vector{Float64}
    b::Vector{Float64}
end
function (f::ProcrustesBlockResidual)(M, r, p)
    mul!(r, p, f.b)
    @. r = f.a - r
    return r
end

# Jacobian in the DefaultOrthonormalBasis: column l is -p E_l b_i, where E_l is the l-th basis tangent
# vector (a skew-symmetric matrix, the same at every p). EB holds the precomputed E_l b_i columns.
struct ProcrustesBlockJacobian
    EB::Matrix{Float64}
end
function (f::ProcrustesBlockJacobian)(M, J, p)
    mul!(J, p, f.EB)
    J .*= -1
    return J
end

const procrustes_manopt_robustifier = PROCRUSTES_HUBER_WIDTH ∘ HuberRobustifier()

# Per-correspondence residual and Jacobian functors
function procrustes_block_functors(A, B, M)
    d, n = size(A)
    dim_M = manifold_dimension(M)
    e = Matrix{Float64}(I, d, d)
    E = [get_vector(M, e, [j == l ? 1.0 : 0.0 for j in 1:dim_M], DefaultOrthonormalBasis()) for l in 1:dim_M]
    fs = [ProcrustesBlockResidual(A[:, i], B[:, i]) for i in 1:n]
    Js = map(1:n) do i
        EB = zeros(d, dim_M)
        for l in 1:dim_M
            EB[:, l] .= E[l] * B[:, i]
        end
        ProcrustesBlockJacobian(EB)
    end
    return fs, Js
end

function procrustes_manopt_blocks(fs, Js, d)
    basis = DefaultOrthonormalBasis()
    return [VectorGradientFunction(f, J, d; evaluation = InplaceEvaluation(), function_type = FunctionVectorialType(),
                jacobian_type = CoefficientVectorialType(basis)) for (f, J) in zip(fs, Js)]
end

# Robust cost 0.5 * sum_i rho(||a_i - p b_i||^2), matching the NLLSModel residuals
function procrustes_robust_cost(A, B, p, r = zeros(size(A, 1)))
    c = 0.0
    @inbounds for i in axes(A, 2)
        mul!(r, p, view(B, :, i))
        s = 0.0
        for k in eachindex(r)
            s += abs2(A[k, i] - r[k])
        end
        c += NLLSModel.robustify(procrustes_huber_kernel, s)
    end
    return 0.5 * c
end

function get_procrustes_manopt_components(model_def)
    m = model_def.model
    if hasproperty(m, :blocks)
        return m.M, m.blocks, m.A, m.B, m.p0
    end
    d = get_procrustes_dim(m)
    A, B, M, _ = generate_procrustes_experiment(d)
    fs, Js = procrustes_block_functors(A, B, M)
    return M, procrustes_manopt_blocks(fs, Js, d), A, B, Matrix{Float64}(I, d, d)
end

function create_robust_procrustes_problem()
    ProblemDefinition(
        "Robust Procrustes on SO(d)",
        :manifold,
        Any[3, 4, 5, 6, 8, 10, 13, 16, 20, 26, 32],
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

            # Model 3: Manifolds, one Huber-robustified block per correspondence
            block_fs, block_Js = procrustes_block_functors(A, B, M)
            blocks = procrustes_manopt_blocks(block_fs, block_Js, d)
            dim_M = manifold_dimension(M)
            p_curr = copy(p0)
            r_i = zeros(Float64, d)
            J_i = zeros(Float64, d, dim_M)
            gu = zeros(Float64, dim_M)
            g_manopt = zeros(Float64, dim_M)
            H_manopt = zeros(Float64, dim_M, dim_M)
            m_manopt = ModelDefinition(
                "Manifolds",
                (M = M, blocks = blocks, A = A, B = B, p0 = p0),
                () -> procrustes_robust_cost(A, B, p_curr, r_i),
                () -> begin
                    # Robustified Gauss-Newton system, weighted per block as NLLSModel does
                    fill!(g_manopt, 0.0)
                    fill!(H_manopt, 0.0)
                    c = 0.0
                    for (f_i, Jf_i) in zip(block_fs, block_Js)
                        f_i(M, r_i, p_curr)
                        Jf_i(M, J_i, p_curr)
                        sq = sum(abs2, r_i)
                        rho, dc, d2c = NLLSModel.robustifydcost(procrustes_huber_kernel, sq)
                        c += rho
                        c2 = d2c == 0 ? 0.0 : max(2 * d2c, -dc / (3 * sq))
                        mul!(gu, transpose(J_i), r_i)
                        g_manopt .+= dc .* gu
                        mul!(H_manopt, transpose(J_i), J_i, dc, 1.0)
                        mul!(H_manopt, gu, transpose(gu), c2, 1.0)
                    end
                    return (0.5 * c, H_manopt)
                end,
                () -> copyto!(p_curr, p0)
            )

            return [m_ovi, m_spec, m_manopt]
        end,
        [
            OptimizerDefinition("SecondOrderOptimization (LM)", (model_def; kwargs...) -> optimize_soo(model_def; method=:lm, kwargs...)),
            OptimizerDefinition("SecondOrderOptimization (Dogleg)", (model_def; kwargs...) -> optimize_soo(model_def; method=:dogleg, kwargs...)),
            OptimizerDefinition("Manopt (LevenbergMarquardt)", (model_def; gtol=DEFAULT_GTOL, xtol=DEFAULT_XTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...) -> begin
                M, blocks, A, B, p0 = get_procrustes_manopt_components(model_def)
                start_c = procrustes_robust_cost(A, B, p0)
                actual_maxiters = (time_limit !== nothing && time_limit <= 1.0) ? min(maxiters, 5) : maxiters
                actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime
                stop_time = Manopt.StopAfter(Dates.Millisecond(max(1, round(Int, actual_maxtime * 1000))))
                stop_crit = (StopWhenGradientNormLess(gtol) | StopWhenChangeLess(M, xtol) | StopAfterIteration(actual_maxiters) | stop_time)
                t_start = time_ns()
                timed = @timed Manopt.LevenbergMarquardt(M, blocks, copy(p0);
                    evaluation = InplaceEvaluation(),
                    robustifier = fill(procrustes_manopt_robustifier, length(blocks)),
                    return_state = true,
                    stopping_criterion = stop_crit,
                    # Manopt >= 0.6 defaults to a matrix-free conjugate-residual subsolver; use the
                    # direct normal-equations solve in a single coordinate basis instead.
                    use_unified_basis = true
                )
                t_total = time_ns() - t_start
                state = timed.value
                inner = state isa Manopt.DebugSolverState ? state.state : state
                p_sol = Manopt.get_solver_result(state)
                final_c = procrustes_robust_cost(A, B, p_sol)
                alloc_cnt = Base.gc_alloc_count(timed.gcstats)
                active = Manopt.get_active_stopping_criteria(stop_crit)
                converged = !isempty(active) && !all(c -> c isa StopAfterIteration || c isa Manopt.StopAfter, active)
                timed_out = !converged && any(c -> c isa Manopt.StopAfter, active)
                return OptimizerResult(Float64(t_total), alloc_cnt, timed.bytes, Manopt.get_count(inner, :Iterations), start_c, final_c, converged;
                    timed_out, message=join(string.(nameof.(typeof.(active))), ", "))
            end)
        ],
        "Matrix Dimension d"
    )
end
