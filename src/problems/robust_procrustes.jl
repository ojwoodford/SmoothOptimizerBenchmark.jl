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
    B = copy(A)
    # Generate outliers if n is sufficient
    if n >= 6 && d >= 3
        B[2, 4] += 0.1
        B[3, 1] += 0.1
        B[3, 2] += 0.1
        B[1, 6] += 0.1
    end
    B = p_star' * B
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
NLLSModel.getvars(::ProcrustesOVIResidual, vars::Vector) = (vars[1],)
NLLSModel.computeresidual(res::ProcrustesOVIResidual, v::ManifoldVar) = res.a - v.point * res.b
const procrustes_huber_kernel = NLLSModel.Huber2oKernel(1e-5)
NLLSModel.robustkernel(::ProcrustesOVIResidual) = procrustes_huber_kernel

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
NLLSModel.getvars(res::SpecializedProcrustesResidual, vars::Vector) = (vars[1],)
NLLSModel.computeresidual(res::SpecializedProcrustesResidual, var::SpecializedRotation) = res.A - var.R * res.B
NLLSModel.robustkernel(::SpecializedProcrustesResidual) = procrustes_huber_kernel
Base.eltype(::SpecializedProcrustesResidual) = Float64

function get_procrustes_dim(model)
    if model isa NLLSModel
        v = model.variables[1]
        return hasfield(typeof(v), :point) ? size(v.point, 1) : size(v.R, 1)
    else
        return size(model.p0, 1)
    end
end

function create_robust_procrustes_problem()
    ProblemDefinition(
        "Robust Procrustes on SO(d)",
        :manifold,
        [3, 4, 5],
        d -> begin
            A, B, M, _ = generate_procrustes_experiment(d)
            n = size(A, 2)
            p0 = Matrix{Float64}(I, d, d)

            # Model 1: NLLSModel with OptimizationVariableInterface.ManifoldVar
            var_ovi = ManifoldVar(copy(p0), M)
            nlls_ovi = NLLSModel(typeof(var_ovi), ProcrustesOVIResidual)
            addvariable!(nlls_ovi, var_ovi)
            for i in 1:n
                addcost!(nlls_ovi, ProcrustesOVIResidual(A[:, i], B[:, i]))
            end
            m_ovi = ModelDefinition(
                "NLLSModel (ManifoldVar)",
                nlls_ovi,
                () -> NLLSModel.cost(nlls_ovi),
                () -> (NLLSModel.cost(nlls_ovi), nothing),
                () -> (nlls_ovi.variables[1] = ManifoldVar(copy(p0), M))
            )

            # Model 2: NLLSModel with Specialized SMatrix Rotation
            R0_static = SMatrix{d, d, Float64, d * d}(p0)
            nlls_spec = NLLSModel([SpecializedRotation(R0_static)], SpecializedProcrustesResidual{d})
            for i in 1:n
                addcost!(nlls_spec, SpecializedProcrustesResidual{d}(SVector{d, Float64}(A[:, i]), SVector{d, Float64}(B[:, i])))
            end
            m_spec = ModelDefinition(
                "NLLSModel (Specialized)",
                nlls_spec,
                () -> NLLSModel.cost(nlls_spec),
                () -> (NLLSModel.cost(nlls_spec), nothing),
                () -> (nlls_spec.variables[1] = SpecializedRotation(R0_static))
            )

            # Model 3: Manopt
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
            m_manopt = ModelDefinition(
                "Manopt (Rotations)",
                (M = M, f = f_manopt, jac = jac_manopt, p0 = p0, k = k_len),
                () -> 0.5 * sum(abs2, f_manopt(M, p_curr)),
                () -> (0.5 * sum(abs2, f_manopt(M, p_curr)), jac_manopt(M, p_curr)),
                () -> copyto!(p_curr, p0)
            )

            return [m_ovi, m_spec, m_manopt]
        end,
        [
            OptimizerDefinition("SecondOrderOptimization (LM)", model_def -> begin
                prob = if model_def.model isa NLLSModel
                    deepcopy(model_def.model)
                else
                    d = get_procrustes_dim(model_def.model)
                    A, B, M, _ = generate_procrustes_experiment(d)
                    n = size(A, 2)
                    p0 = Matrix{Float64}(I, d, d)
                    var_ovi = ManifoldVar(copy(p0), M)
                    p = NLLSModel(typeof(var_ovi), ProcrustesOVIResidual)
                    addvariable!(p, var_ovi)
                    for i in 1:n; addcost!(p, ProcrustesOVIResidual(A[:, i], B[:, i])); end
                    p
                end
                opt = OptimizationOptions(iterator = :levenbergmarquardt, maxiters=500)
                _, res = SecondOrderOptimization.optimize!(prob, opt)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
            end),
            OptimizerDefinition("SecondOrderOptimization (Dogleg)", model_def -> begin
                prob = if model_def.model isa NLLSModel
                    deepcopy(model_def.model)
                else
                    d = get_procrustes_dim(model_def.model)
                    A, B, M, _ = generate_procrustes_experiment(d)
                    n = size(A, 2)
                    p0 = Matrix{Float64}(I, d, d)
                    var_ovi = ManifoldVar(copy(p0), M)
                    p = NLLSModel(typeof(var_ovi), ProcrustesOVIResidual)
                    addvariable!(p, var_ovi)
                    for i in 1:n; addcost!(p, ProcrustesOVIResidual(A[:, i], B[:, i])); end
                    p
                end
                opt = OptimizationOptions(iterator = :dogleg, maxiters=500)
                _, res = SecondOrderOptimization.optimize!(prob, opt)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
            end),
            OptimizerDefinition("Manopt (LevenbergMarquardt)", model_def -> begin
                d = get_procrustes_dim(model_def.model)
                A, B, M, _ = generate_procrustes_experiment(d)
                n = size(A, 2)
                k_len = d * n
                dim_M = manifold_dimension(M)
                p0 = Matrix{Float64}(I, d, d)
                f(M, p) = reduce(vcat, [A[:, i] - p * B[:, i] for i in 1:n])
                function jac_f(M, p)
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
                start_c = 0.5 * sum(abs2, f(M, p0))
                state = Manopt.LevenbergMarquardt(M, f, jac_f, copy(p0), k_len; return_state=true, max_iterations=500)
                inner = state isa Manopt.DebugSolverState ? state.state : state
                p_sol = Manopt.get_solver_result(state)
                final_c = 0.5 * sum(abs2, f(M, p_sol))
                return OptimizerResult(0.0, 0, 0, Manopt.get_count(inner, :Iterations), start_c, final_c, true)
            end)
        ]
    )
end
