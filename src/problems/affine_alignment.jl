# Dense Affine Alignment Problem (Large Dense, from Gist 0af1c9)
#
# Find the affine map x ↦ M·x + t (M n × n, t of length n) under which the distances from 2n source points X[:, i] to 2n
# target points Y[:, j] match given distances D[i, j]: residuals D[i, j] − ‖M·X[:, i] + t − Y[:, j]‖. The unknown is one
# vector of length n(n + 1), M[k, c] = x[(c − 1)n + k] and t[k] = x[n² + k], and every residual depends on all of it, so a
# cost has n(n + 1) inputs (1056 at n = 32) and the problem is analytic (DM1): one cost per source point, its 2n residuals
# with a hand-written Jacobian (`AffinePointResidual`, DM10). Three models: two built from separate copies of those costs
# (each cost owns its buffers), "NLLSModel", which the SecondOrderOptimization rows run on, and "Standalone"
# (`standalone_problem`), which LeastSquaresOptim, NonlinearSolve and Optim run on; and "JuMP", the residuals as JuMP
# expressions, which JSOSolvers, Ipopt, MadNLP and CaNNOLeS run on and JuMP differentiates itself.
using Distances, LinearAlgebra, Random, Static, StaticArrays
using NLLSModel, LeastSquaresOptim, SecondOrderOptimization

safe_dist(X, Y) = [!iszero(z) ? sqrt(z) : z for z in pairwise(SqEuclidean(), X, Y; dims=2)]

function generate_affine_data(n::Int)
    rng = MersenneTwister(42 + n)
    num_points = 2 * n
    X = randn(rng, n, num_points)
    Y = randn(rng, n, num_points)
    M = randn(rng, n, n) * 0.1 + I
    T = randn(rng, n)
    D = safe_dist(M * X .+ T, Y)
    return X, Y, D
end

# One source point's costs: the residuals D[i, j] − ‖w − Y[:, j]‖, j = 1 … 2n, with w = M·X[:, i] + t. With
# u = (w − Y[:, j]) / d and d = ‖w − Y[:, j]‖, the derivative with respect to M[k, c] is −u[k]·X[c, i] and with respect to
# t[k] is −u[k]; where d == 0 the residual is D[i, j] and its derivatives are zero. Each cost owns its buffers (`w`, the
# residual and the Jacobian), as NLLSModel's contract for returned arrays requires, so costs can be evaluated on several
# threads at once. Loops, not broadcasts, so that nothing allocates (a broadcast here allocates on Julia 1.10 with
# --check-bounds=yes)
struct AffinePointResidual <: NLLSModel.AbstractResidual
    xi::Vector{Float64}    # X[:, i]
    Y::Matrix{Float64}     # the target points, one per column (read only, shared by the costs of a model)
    Di::Vector{Float64}    # D[i, :]
    w::Vector{Float64}     # M·X[:, i] + t
    r::Vector{Float64}     # the 2n residuals
    J::Matrix{Float64}     # their Jacobian, 2n × n(n + 1)
end
function AffinePointResidual(X::Matrix{Float64}, Y::Matrix{Float64}, D::Matrix{Float64}, i::Int)
    n, m = size(Y)
    return AffinePointResidual(X[:, i], Y, D[i, :], zeros(n), zeros(m), zeros(m, n * (n + 1)))
end
Base.eltype(::AffinePointResidual) = Float64
NLLSModel.ndeps(::AffinePointResidual) = static(1)
NLLSModel.nres(res::AffinePointResidual) = length(res.r)
NLLSModel.varindices(::AffinePointResidual) = 1
NLLSModel.getvars(::AffinePointResidual, vars::AbstractVector) = (vars[1]::Vector{Float64},)

# w = M·X[:, i] + t, in the order of the old whole-problem residual
function affine_point!(res::AffinePointResidual, x::Vector{Float64})
    n = length(res.w)
    @inbounds for k in 1:n
        acc = x[n * n + k]
        for c in 1:n
            acc += x[(c - 1) * n + k] * res.xi[c]
        end
        res.w[k] = acc
    end
    return res.w
end

# ‖w − Y[:, j]‖²
@inline function affine_sqdist(res::AffinePointResidual, j::Int)
    sq = 0.0
    @inbounds for k in eachindex(res.w)
        sq += abs2(res.w[k] - res.Y[k, j])
    end
    return sq
end

function NLLSModel.computeresidual(res::AffinePointResidual, x::Vector{Float64})
    affine_point!(res, x)
    @inbounds for j in eachindex(res.r)
        sq = affine_sqdist(res, j)
        res.r[j] = res.Di[j] - (iszero(sq) ? sq : sqrt(sq))
    end
    return res.r
end

function NLLSModel.computeresjac(::StaticInt{1}, res::AffinePointResidual, x::Vector{Float64})
    affine_point!(res, x)
    n = length(res.w)
    J = res.J
    @inbounds for j in eachindex(res.r)
        sq = affine_sqdist(res, j)
        if iszero(sq)
            res.r[j] = res.Di[j]
            for col in axes(J, 2)
                J[j, col] = 0.0
            end
        else
            d = sqrt(sq)
            res.r[j] = res.Di[j] - d
            for k in 1:n
                u = (res.w[k] - res.Y[k, j]) / d
                for c in 1:n
                    J[j, (c - 1) * n + k] = -u * res.xi[c]
                end
                J[j, n * n + k] = -u
            end
        end
    end
    return res.r, J
end

# The costs of one model, one per source point (each model has its own, since each cost owns its buffers)
affine_costs(X, Y, D) = [AffinePointResidual(X, Y, D, i) for i in axes(X, 2)]

# Model 3: JuMP (IND3f). The unknowns in the Standalone model's order, M by columns then t (M[k, c] = x[(c − 1)n + k],
# t[k] = x[n² + k]); the transformed source points w[k, i] = Σ_c M[k, c]·X[c, i] + t[k] as JuMP subexpressions, and one
# residual per pair of points, D[i, j] − √(Σ_k (w[k, i] − Y[k, j])²). JuMP differentiates it itself; its derivative is
# not finite at a zero distance, and that is not special-cased (the hand-written Jacobian sets the row to zero there)
# Decision 18, measured 2026-11-19 (Julia 1.13.3, one thread): the JuMP model's build took 16 s at n = 12 and 189 s at
# n = 16 (2.2 GB more peak memory), and had not finished after 330 s at n = 20, over the 300 s limit. It is built up to
# n = 16 and not above; there its rows are skipped
const AFFINE_JUMP_MAX_N = 16
affine_jump_skip_reason(n) = "the JuMP model is not built at n = $n: its build takes over 300 s from n = 20 (decision 18)"

function build_jump_affine_alignment(X::Matrix{Float64}, Y::Matrix{Float64}, D::Matrix{Float64})
    n, m = size(X)
    x0 = zeros(n * n + n)
    x0[1:n+1:n*n] .= 1.0
    model = JuMP.Model()
    @variable(model, x[l = 1:(n * n + n)], start = x0[l])
    @NLexpression(model, w[k = 1:n, i = 1:m], sum(x[(c - 1) * n + k] * X[c, i] for c in 1:n) + x[n * n + k])
    F = [@NLexpression(model, D[i, j] - sqrt(sum((w[k, i] - Y[k, j])^2 for k in 1:n))) for i in 1:m for j in 1:size(Y, 2)]
    return MathOptNLSModel(model, F)
end

# The SecondOrderOptimization row's configuration (IND4, re-derived by K1 of jacobian-normal-equations.md): NLLSModel's
# recommendoptimizer at the largest size, n = 32, with numthreads = 1, evaluated 2026-11-19 at NLLSModel 61a7bcd
# (Julia 1.13.3); rules F_normalequations, RS_jacobian_dense, L_jacobian_normal, I_lm: the Jacobian path, with the
# normal equations formed from the dense Jacobian
const AFFINE_ALIGNMENT_SOO = (; iterator = :levenbergmarquardt, linsolver = :cholesky, formulation = :jacobian, reduction = :none, storage = :dense)

function create_affine_alignment_problem()
    ProblemDefinition(
        "Dense Affine Alignment",
        :small_dense,
        Any[1, 2, 3, 4, 6, 8, 12, 16, 20, 24, 28, 32],
        n -> begin
            X, Y, D = generate_affine_data(n)
            start_vec = zeros(n * n + n)
            start_vec[1:n+1:end] .= 1.0

            # Model 1: NLLSModel, one Vector{Float64} variable and one cost per source point (DM10)
            nlls_prob = NLLSModel.Model(Vector{Float64}, AffinePointResidual)
            addvariable!(nlls_prob, copy(start_vec))
            for c in affine_costs(X, Y, D)
                addcost!(nlls_prob, c)
            end
            nt = benchmark_numthreads()
            # Buffers of the types the prototype has (a Vector and a Matrix here), so fdf! writes straight into them
            f_nlls, fdf_nlls!, _, H_proto_nlls = NLLSModel.optimvars(nlls_prob; unfixed=nothing, numthreads=nt)
            H_nlls = deepcopy(H_proto_nlls)
            g_nlls = zero(H_proto_nlls[:, 1])
            m_nlls = ModelDefinition(
                "NLLSModel",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob, nt),
                () -> (fdf_nlls!(g_nlls, H_nlls, nlls_prob.variables[1]), H_nlls),
                () -> copyto!(nlls_prob.variables[1], start_vec)
            )

            # Model 2: Standalone, its own copy of the costs, filled cost by cost by the same computeresidual and
            # computeresjac, in a plain loop (DM10)
            lsp = standalone_problem((affine_costs(X, Y, D),), [copy(start_vec)])
            x_lso = lsp.x
            r_len = length(D)
            r_buf = zeros(Float64, r_len)
            J_buf = deepcopy(lsp.J)
            g_buf = zeros(Float64, length(start_vec))
            H_buf = zeros(Float64, length(start_vec), length(start_vec))
            m_lso = ModelDefinition(
                "Standalone",
                lsp,
                () -> begin
                    lsp.f!(r_buf, x_lso)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    lsp.f!(r_buf, x_lso)
                    lsp.g!(J_buf, x_lso)
                    mul!(g_buf, J_buf', r_buf)
                    mul!(H_buf, J_buf', J_buf)
                    return (0.5 * sum(abs2, r_buf), H_buf)
                end,
                () -> copyto!(x_lso, start_vec)
            )

            m_jump = n <= AFFINE_JUMP_MAX_N ? jump_model("JuMP", build_jump_affine_alignment(X, Y, D), copy(start_vec)) :
                unbuilt_model("JuMP", affine_jump_skip_reason(n))

            return [m_jump, m_nlls, m_lso]   # alphabetical (IND8)
        end,
        get_standard_optimizers(AFFINE_ALIGNMENT_SOO),
        "Dimension n",
        # Zero-residual: the distances are generated from an exact affine map of the points (IT4)
        _ -> 0.0;
        # Derivatives (DM1): a cost has n(n + 1) inputs, 1056 at n = 32
        derivatives = :analytic
    )
end
