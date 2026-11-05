# Dense Affine Alignment Problem (Large Dense, from Gist 0af1c9)
using Distances, LinearAlgebra, Random, Static
using NLLSModels, LeastSquaresOptim, SecondOrderOptimization

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

struct AffineResidual <: NLLSModels.AbstractResidual
    X::Matrix{Float64}
    Y::Matrix{Float64}
    D::Matrix{Float64}
end
Base.eltype(::AffineResidual) = Float64
NLLSModels.ndeps(::AffineResidual) = static(1)
NLLSModels.nres(res::AffineResidual) = length(res.D)
NLLSModels.varindices(::AffineResidual) = 1
NLLSModels.getvars(::AffineResidual, vars::Vector) = (vars[1],)
NLLSModels.computeresidual(res::AffineResidual, x) = affine_resfun(x, res.X, res.Y, res.D)

function create_affine_alignment_problem()
    ProblemDefinition(
        "Dense Affine Alignment",
        :large_dense,
        [2, 4, 8],
        n -> begin
            X, Y, D = generate_affine_data(n)
            start_vec = zeros(n * n + n)
            start_vec[1:n+1:end] .= 1.0

            # Model 1: NLLSModels Problem
            nlls_prob = NLLSProblem(Vector{Float64}, AffineResidual)
            addvariable!(nlls_prob, copy(start_vec))
            addcost!(nlls_prob, AffineResidual(X, Y, D))
            m_nlls = ModelDefinition(
                "NLLSModels",
                nlls_prob,
                () -> NLLSModels.cost(nlls_prob),
                () -> (NLLSModels.cost(nlls_prob), nothing),
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
        [
            OptimizerDefinition("SecondOrderOptimization (LM)", model_def -> begin
                opt = OptimizationOptions(iterator = :levenbergmarquardt, maxiters = 5000)
                p = deepcopy(model_def.model)
                _, res = SecondOrderOptimization.optimize!(p, opt)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, res.bestcost < 1e-4)
            end),
            OptimizerDefinition("LeastSquaresOptim (LM)", model_def -> begin
                lsp = model_def.model isa LeastSquaresProblem ? deepcopy(model_def.model) : begin
                    n = size(model_def.model.costs.data[AffineResidual][1].X, 1)
                    X, Y, D = generate_affine_data(n)
                    start_vec = zeros(n*n+n)
                    start_vec[1:n+1:end] .= 1.0
                    LeastSquaresProblem(x=copy(start_vec), f! = (out, x) -> (out .= affine_resfun(x, X, Y, D)), output_length=length(D), autodiff=:forward)
                end
                start_c = 0.5 * sum(abs2, lsp.y)
                res = LeastSquaresOptim.optimize!(lsp, LeastSquaresOptim.LevenbergMarquardt(); iterations=5000)
                return OptimizerResult(0.0, 0, 0, res.iterations, start_c, res.ssr * 0.5, res.converged)
            end),
            OptimizerDefinition("SecondOrderOptimization (Dogleg)", model_def -> begin
                opt = OptimizationOptions(iterator = :dogleg, maxiters = 5000)
                p = deepcopy(model_def.model)
                _, res = SecondOrderOptimization.optimize!(p, opt)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, res.bestcost < 1e-4)
            end)
        ]
    )
end
