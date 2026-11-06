# Dense Affine Alignment Problem (Large Dense, from Gist 0af1c9)
using Distances, LinearAlgebra, Random, Static
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

function affine_resfun(x, X, Y, D)
    n = size(X, 1)
    M = reshape(x, n, n + 1)
    warped = view(M, :, 1:n) * X .+ view(M, :, n + 1)
    return vec(D - safe_dist(warped, Y))
end

struct AffineResidual <: NLLSModel.AbstractResidual
    X::Matrix{Float64}
    Y::Matrix{Float64}
    D::Matrix{Float64}
end
Base.eltype(::AffineResidual) = Float64
NLLSModel.ndeps(::AffineResidual) = static(1)
NLLSModel.nres(res::AffineResidual) = length(res.D)
NLLSModel.varindices(::AffineResidual) = 1
NLLSModel.getvars(::AffineResidual, vars::Vector) = (vars[1],)
NLLSModel.computeresidual(res::AffineResidual, x) = affine_resfun(x, res.X, res.Y, res.D)

function create_affine_alignment_problem()
    ProblemDefinition(
        "Dense Affine Alignment",
        :large_dense,
        Any[2, 3, 4, 5, 6, 7, 8, 9, 10, 12],
        n -> begin
            X, Y, D = generate_affine_data(n)
            start_vec = zeros(n * n + n)
            start_vec[1:n+1:end] .= 1.0

            # Model 1: NLLSModel Problem
            nlls_prob = NLLSModel.Model(Vector{Float64}, AffineResidual)
            addvariable!(nlls_prob, copy(start_vec))
            addcost!(nlls_prob, AffineResidual(X, Y, D))
            m_nlls = ModelDefinition(
                "NLLSModel",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob),
                () -> (NLLSModel.cost(nlls_prob), nothing),
                () -> begin
                    nlls_prob.variables[1] .= 0.0
                    nlls_prob.variables[1][1:n+1:end] .= 1.0
                end
            )

            # Model 2: LeastSquaresOptim Problem
            x_lso = copy(start_vec)
            r_len = length(D)
            r_buf = zeros(Float64, r_len)
            costfun!(out, x) = (out .= affine_resfun(x, X, Y, D))
            lsp = LeastSquaresProblem(x=x_lso, f! = costfun!, output_length=r_len, autodiff=:forward)
            m_lso = ModelDefinition(
                "LeastSquaresOptim",
                lsp,
                () -> begin
                    costfun!(r_buf, x_lso)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    costfun!(r_buf, x_lso)
                    return (0.5 * sum(abs2, r_buf), r_buf)
                end,
                () -> begin
                    x_lso .= 0.0
                    x_lso[1:n+1:end] .= 1.0
                end
            )

            return [m_nlls, m_lso]
        end,
        get_tier1_optimizers(),
        "Dimension n"
    )
end
