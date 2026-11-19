# Dense Affine Alignment Problem (Large Dense, from Gist 0af1c9)
#
# Find the affine map x ↦ M·x + t (M n × n, t of length n) under which the distances from 2n source points X[:, i] to 2n
# target points Y[:, j] match given distances D[i, j]: residuals D[i, j] − ‖M·X[:, i] + t − Y[:, j]‖. The unknown is one
# vector of length n(n + 1), M[k, c] = x[(c − 1)n + k] and t[k] = x[n² + k], and every residual depends on all of it, so a
# cost has n(n + 1) inputs (1056 at n = 32) and the problem is analytic (DM1): one cost per source point, its 2n residuals
# with a hand-written Jacobian (`AffinePointResidual`, DM10). Two models, built from separate copies of those costs (each
# cost owns its buffers): "NLLSModel", which the SecondOrderOptimization rows run on, and "Standalone"
# (`standalone_problem`), which every other row runs on.
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

function get_affine_alignment_optimizers()
    return OptimizerDefinition[
        OptimizerDefinition("SecondOrderOptimization (Dogleg)", (m; kwargs...) -> optimize_soo(m; method=:dogleg, kwargs...)),
        OptimizerDefinition("SecondOrderOptimization (LM)", (m; kwargs...) -> optimize_soo(m; method=:lm, kwargs...)),
        soo_gauss_newton_optimizer(),
        OptimizerDefinition("LeastSquaresOptim (Dogleg)", (m; kwargs...) -> optimize_least_squares(m; method=:dogleg, kwargs...)),
        OptimizerDefinition("LeastSquaresOptim (LM)", (m; kwargs...) -> optimize_least_squares(m; method=:lm, kwargs...)),
        OptimizerDefinition("Optim (NewtonTrustRegion)", (m; kwargs...) -> optimize_optim(m; method=:newton_trust_region, kwargs...)),
        OptimizerDefinition("Optim (Newton)", (m; kwargs...) -> optimize_optim(m; method=:newton, kwargs...)),
        OptimizerDefinition("JSOSolvers (trunk)", (m; kwargs...) -> optimize_jsosolvers(m; solver=:trunk, kwargs...)),
        OptimizerDefinition("JSOSolvers (tron)", (m; kwargs...) -> optimize_jsosolvers(m; solver=:tron, kwargs...)),
        OptimizerDefinition("Ipopt", (m; kwargs...) -> optimize_ipopt(m; kwargs...)),
        OptimizerDefinition("MadNLP", (m; kwargs...) -> optimize_madnlp(m; kwargs...)),
        OptimizerDefinition("NonlinearSolve (LM)", (m; kwargs...) -> optimize_nonlinearsolve(m; method=:lm, kwargs...)),
        OptimizerDefinition("NonlinearSolve (TrustRegion)", (m; kwargs...) -> optimize_nonlinearsolve(m; method=:trust_region, kwargs...)),
        OptimizerDefinition("CaNNOLeS", (m; kwargs...) -> optimize_cannoles(m; kwargs...))
    ]
end

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

            return [m_nlls, m_lso]
        end,
        get_affine_alignment_optimizers(),
        "Dimension n",
        # Zero-residual: the distances are generated from an exact affine map of the points (IT4)
        _ -> 0.0;
        # Derivatives (DM1): a cost has n(n + 1) inputs, 1056 at n = 32
        derivatives = :analytic
    )
end
