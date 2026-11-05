# 2D Rosenbrock Problem (Small Dense)
using Static, StaticArrays, LinearAlgebra
using SecondOrderOptimization, NLLSModel, LeastSquaresOptim, Optim

function rosenbrock_cost(x)
    return (1.0 - x[1])^2 + 100.0 * (x[2] - x[1]^2)^2
end

function rosenbrock_fdf!(g, H, x)
    g[1] = -2.0 * (1.0 - x[1]) - 400.0 * x[1] * (x[2] - x[1]^2)
    g[2] = 200.0 * (x[2] - x[1]^2)
    H[1, 1] = 2.0 - 400.0 * x[2] + 1200.0 * x[1]^2
    H[1, 2] = -400.0 * x[1]
    H[2, 1] = -400.0 * x[1]
    H[2, 2] = 200.0
    return rosenbrock_cost(x)
end

function rosenbrock_residuals!(r, x)
    r[1] = 1.0 - x[1]
    r[2] = 10.0 * (x[2] - x[1]^2)
    return r
end

function rosenbrock_jacobian!(J, x)
    J[1, 1] = -1.0
    J[1, 2] = 0.0
    J[2, 1] = -20.0 * x[1]
    J[2, 2] = 10.0
    return J
end

struct Rosenbrock2DResidual1 <: AbstractResidual end
NLLSModel.ndeps(::Rosenbrock2DResidual1) = static(1)
NLLSModel.nres(::Rosenbrock2DResidual1) = static(1)
NLLSModel.varindices(::Rosenbrock2DResidual1) = SVector(1)
NLLSModel.getvars(::Rosenbrock2DResidual1, vars::Vector) = (vars[1]::SVector{2, Float64},)
NLLSModel.computeresidual(::Rosenbrock2DResidual1, x) = SVector(1.0 - x[1])
Base.eltype(::Rosenbrock2DResidual1) = Float64

struct Rosenbrock2DResidual2 <: AbstractResidual end
NLLSModel.ndeps(::Rosenbrock2DResidual2) = static(1)
NLLSModel.nres(::Rosenbrock2DResidual2) = static(1)
NLLSModel.varindices(::Rosenbrock2DResidual2) = SVector(1)
NLLSModel.getvars(::Rosenbrock2DResidual2, vars::Vector) = (vars[1]::SVector{2, Float64},)
NLLSModel.computeresidual(::Rosenbrock2DResidual2, x) = SVector(10.0 * (x[2] - x[1]^2))
Base.eltype(::Rosenbrock2DResidual2) = Float64

function create_rosenbrock_2d_problem()
    ProblemDefinition(
        "2D Rosenbrock",
        :small_dense,
        [2],
        size -> begin
            x0_static = SVector(-1.2, 1.0)
            x0_vec = [-1.2, 1.0]

            # Model 1: SecondOrderOptimization Native Static
            g_buf = MVector{2, Float64}(undef)
            H_buf = MMatrix{2, 2, Float64}(undef)
            m_soo = ModelDefinition(
                "SecondOrderOpt (Static)",
                x0_static,
                () -> rosenbrock_cost(x0_static),
                () -> (rosenbrock_fdf!(g_buf, H_buf, x0_static), (g_buf, H_buf)),
                () -> nothing
            )

            # Model 2: LeastSquaresOptim (in-place)
            r_buf = zeros(Float64, 2)
            J_buf = zeros(Float64, 2, 2)
            x_lso = copy(x0_vec)
            lsp = LeastSquaresProblem(x=x_lso, f! = rosenbrock_residuals!, g! = rosenbrock_jacobian!, output_length=2)
            m_lso = ModelDefinition(
                "LeastSquaresOptim",
                lsp,
                () -> begin
                    rosenbrock_residuals!(r_buf, x_lso)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    rosenbrock_residuals!(r_buf, x_lso)
                    rosenbrock_jacobian!(J_buf, x_lso)
                    return (0.5 * sum(abs2, r_buf), (r_buf, J_buf))
                end,
                () -> copyto!(x_lso, x0_vec)
            )

            # Model 3: NLLSModel / NLLSModel
            nlls_prob = NLLSModel(SVector{2, Float64}, Union{Rosenbrock2DResidual1, Rosenbrock2DResidual2})
            addvariable!(nlls_prob, x0_static)
            addcost!(nlls_prob, Rosenbrock2DResidual1())
            addcost!(nlls_prob, Rosenbrock2DResidual2())
            m_nlls = ModelDefinition(
                "NLLSModel (Static)",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob),
                () -> (NLLSModel.cost(nlls_prob), nothing),
                () -> (nlls_prob.variables[1] = x0_static)
            )

            # Model 4: Optim Vector Form
            g_optim = zeros(Float64, 2)
            H_optim = zeros(Float64, 2, 2)
            x_opt = copy(x0_vec)
            m_optim = ModelDefinition(
                "Optim (Vector)",
                x_opt,
                () -> rosenbrock_cost(x_opt),
                () -> begin
                    rosenbrock_fdf!(g_optim, H_optim, x_opt)
                    return (rosenbrock_cost(x_opt), (g_optim, H_optim))
                end,
                () -> copyto!(x_opt, x0_vec)
            )

            return [m_soo, m_lso, m_nlls, m_optim]
        end,
        [
            OptimizerDefinition("SecondOrderOptimization (Dogleg)", model_def -> begin
                x0_static = SVector(-1.2, 1.0)
                opt = OptimizationOptions(iterator = :dogleg)
                ws = OptimizationWorkspace(rosenbrock_cost, rosenbrock_fdf!, x0_static, opt)
                _, res = SecondOrderOptimization.optimize(rosenbrock_cost, rosenbrock_fdf!, x0_static, opt; workspace=ws)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
            end),
            OptimizerDefinition("SecondOrderOptimization (LM)", model_def -> begin
                x0_static = SVector(-1.2, 1.0)
                opt = OptimizationOptions(iterator = :levenbergmarquardt)
                ws = OptimizationWorkspace(rosenbrock_cost, rosenbrock_fdf!, x0_static, opt)
                _, res = SecondOrderOptimization.optimize(rosenbrock_cost, rosenbrock_fdf!, x0_static, opt; workspace=ws)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
            end),
            OptimizerDefinition("Optim (NewtonTrustRegion)", model_def -> begin
                x0 = [-1.2, 1.0]
                g!(G, x) = rosenbrock_fdf!(G, zeros(2, 2), x)
                h!(H, x) = rosenbrock_fdf!(zeros(2), H, x)
                res = Optim.optimize(rosenbrock_cost, g!, h!, x0, NewtonTrustRegion())
                return OptimizerResult(0.0, 0, 0, res.iterations, rosenbrock_cost(x0), res.minimum, Optim.converged(res))
            end),
            OptimizerDefinition("Optim (Newton)", model_def -> begin
                x0 = [-1.2, 1.0]
                g!(G, x) = rosenbrock_fdf!(G, zeros(2, 2), x)
                h!(H, x) = rosenbrock_fdf!(zeros(2), H, x)
                res = Optim.optimize(rosenbrock_cost, g!, h!, x0, Newton())
                return OptimizerResult(0.0, 0, 0, res.iterations, rosenbrock_cost(x0), res.minimum, Optim.converged(res))
            end),
            OptimizerDefinition("LeastSquaresOptim (Dogleg)", model_def -> begin
                x0 = [-1.2, 1.0]
                lsp = LeastSquaresProblem(x=copy(x0), f! = rosenbrock_residuals!, g! = rosenbrock_jacobian!, output_length=2)
                res = LeastSquaresOptim.optimize!(lsp, LeastSquaresOptim.Dogleg())
                return OptimizerResult(0.0, 0, 0, res.iterations, rosenbrock_cost(x0), res.ssr * 0.5, res.converged)
            end),
            OptimizerDefinition("LeastSquaresOptim (LM)", model_def -> begin
                x0 = [-1.2, 1.0]
                lsp = LeastSquaresProblem(x=copy(x0), f! = rosenbrock_residuals!, g! = rosenbrock_jacobian!, output_length=2)
                res = LeastSquaresOptim.optimize!(lsp, LeastSquaresOptim.LevenbergMarquardt())
                return OptimizerResult(0.0, 0, 0, res.iterations, rosenbrock_cost(x0), res.ssr * 0.5, res.converged)
            end)
        ]
    )
end
