# Exponential Curve Fitting Problem (Small Dense)
using Static, StaticArrays, LinearAlgebra, Random
using SecondOrderOptimization, NLLSModels, LeastSquaresOptim

struct ExpFitResidual <: AbstractResidual
    t::Float64
    y::Float64
end
NLLSModels.ndeps(::ExpFitResidual) = static(1)
NLLSModels.nres(::ExpFitResidual) = static(1)
NLLSModels.varindices(::ExpFitResidual) = SVector(1)
NLLSModels.getvars(::ExpFitResidual, vars::Vector) = (vars[1]::SVector{3, Float64},)
NLLSModels.computeresidual(res::ExpFitResidual, p) = SVector(p[1] * exp(-p[2] * res.t) + p[3] - res.y)
Base.eltype(::ExpFitResidual) = Float64

function generate_exp_data(n_points::Int)
    rng = MersenneTwister(42)
    t_pts = range(0.0, 2.0, length=n_points)
    a_true, b_true, c_true = 2.0, 1.5, 0.5
    y_data = [a_true * exp(-b_true * t) + c_true + 0.02 * randn(rng) for t in t_pts]
    return collect(t_pts), y_data
end

function exp_residuals!(r, p, t_pts, y_data)
    @inbounds for i in eachindex(t_pts)
        r[i] = p[1] * exp(-p[2] * t_pts[i]) + p[3] - y_data[i]
    end
    return r
end

function exp_jacobian!(J, p, t_pts)
    @inbounds for i in eachindex(t_pts)
        e = exp(-p[2] * t_pts[i])
        J[i, 1] = e
        J[i, 2] = -p[1] * t_pts[i] * e
        J[i, 3] = 1.0
    end
    return J
end

function create_curve_fitting_problem()
    ProblemDefinition(
        "Exponential Curve Fitting",
        :small_dense,
        [20, 50, 100],
        n_points -> begin
            t_pts, y_data = generate_exp_data(n_points)
            p0_static = SVector(1.0, 1.0, 1.0)
            p0_vec = [1.0, 1.0, 1.0]

            # Model 1: NLLSModels
            nlls_prob = NLLSProblem(SVector{3, Float64}, ExpFitResidual)
            addvariable!(nlls_prob, p0_static)
            for i in 1:n_points
                addcost!(nlls_prob, ExpFitResidual(t_pts[i], y_data[i]))
            end
            m_nlls = ModelDefinition(
                "NLLSModels (Static)",
                nlls_prob,
                () -> NLLSModels.cost(nlls_prob),
                () -> (NLLSModels.cost(nlls_prob), nothing),
                () -> (nlls_prob.variables[1] = p0_static)
            )

            # Model 2: LeastSquaresOptim
            r_buf = zeros(Float64, n_points)
            J_buf = zeros(Float64, n_points, 3)
            p_lso = copy(p0_vec)
            f_lso!(r, p) = exp_residuals!(r, p, t_pts, y_data)
            g_lso!(J, p) = exp_jacobian!(J, p, t_pts)
            lsp = LeastSquaresProblem(x=p_lso, f! = f_lso!, g! = g_lso!, output_length=n_points)
            m_lso = ModelDefinition(
                "LeastSquaresOptim",
                lsp,
                () -> begin
                    f_lso!(r_buf, p_lso)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    f_lso!(r_buf, p_lso)
                    g_lso!(J_buf, p_lso)
                    return (0.5 * sum(abs2, r_buf), (r_buf, J_buf))
                end,
                () -> copyto!(p_lso, p0_vec)
            )

            # Model 3: SecondOrderOptimization Native
            g_buf = zeros(Float64, 3)
            H_buf = zeros(Float64, 3, 3)
            p_soo = copy(p0_vec)
            f_soo(p) = begin
                f_lso!(r_buf, p)
                return 0.5 * sum(abs2, r_buf)
            end
            fdf_soo!(g, H, p) = begin
                f_lso!(r_buf, p)
                g_lso!(J_buf, p)
                mul!(g, J_buf', r_buf)
                mul!(H, J_buf', J_buf)
                return 0.5 * sum(abs2, r_buf)
            end
            m_soo = ModelDefinition(
                "SecondOrderOpt",
                p_soo,
                () -> f_soo(p_soo),
                () -> (fdf_soo!(g_buf, H_buf, p_soo), (g_buf, H_buf)),
                () -> copyto!(p_soo, p0_vec)
            )

            return [m_nlls, m_lso, m_soo]
        end,
        [
            OptimizerDefinition("SecondOrderOptimization (Dogleg)", model_def -> begin
                opt = OptimizationOptions(iterator = :dogleg)
                if model_def.model isa NLLSProblem || model_def.model isa LeastSquaresProblem
                    p = deepcopy(model_def.model)
                    _, res = SecondOrderOptimization.optimize!(p, opt)
                    return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
                else
                    p0 = copy(model_def.model)
                    n_pts = 20
                    t_pts, y_data = generate_exp_data(n_pts)
                    r_buf = zeros(Float64, n_pts)
                    J_buf = zeros(Float64, n_pts, 3)
                    f(p) = (exp_residuals!(r_buf, p, t_pts, y_data); 0.5 * sum(abs2, r_buf))
                    fdf!(g, H, p) = begin
                        exp_residuals!(r_buf, p, t_pts, y_data)
                        exp_jacobian!(J_buf, p, t_pts)
                        mul!(g, J_buf', r_buf)
                        mul!(H, J_buf', J_buf)
                        return 0.5 * sum(abs2, r_buf)
                    end
                    _, res = SecondOrderOptimization.optimize(f, fdf!, p0, opt)
                    return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
                end
            end),
            OptimizerDefinition("SecondOrderOptimization (LM)", model_def -> begin
                opt = OptimizationOptions(iterator = :levenbergmarquardt)
                if model_def.model isa NLLSProblem || model_def.model isa LeastSquaresProblem
                    p = deepcopy(model_def.model)
                    _, res = SecondOrderOptimization.optimize!(p, opt)
                    return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
                else
                    p0 = copy(model_def.model)
                    n_pts = 20
                    t_pts, y_data = generate_exp_data(n_pts)
                    r_buf = zeros(Float64, n_pts)
                    J_buf = zeros(Float64, n_pts, 3)
                    f(p) = (exp_residuals!(r_buf, p, t_pts, y_data); 0.5 * sum(abs2, r_buf))
                    fdf!(g, H, p) = begin
                        exp_residuals!(r_buf, p, t_pts, y_data)
                        exp_jacobian!(J_buf, p, t_pts)
                        mul!(g, J_buf', r_buf)
                        mul!(H, J_buf', J_buf)
                        return 0.5 * sum(abs2, r_buf)
                    end
                    _, res = SecondOrderOptimization.optimize(f, fdf!, p0, opt)
                    return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
                end
            end),
            OptimizerDefinition("LeastSquaresOptim (Dogleg)", model_def -> begin
                lsp = if model_def.model isa LeastSquaresProblem
                    deepcopy(model_def.model)
                else
                    n_pts = model_def.model isa NLLSProblem ? length(model_def.model.costs.data[ExpFitResidual]) : 20
                    t_pts, y_data = generate_exp_data(n_pts)
                    LeastSquaresProblem(x=[1.0, 1.0, 1.0], f! = (r, p) -> exp_residuals!(r, p, t_pts, y_data), g! = (J, p) -> exp_jacobian!(J, p, t_pts), output_length=n_pts)
                end
                r0 = zeros(Float64, length(lsp.y))
                lsp.f!(r0, lsp.x)
                start_c = 0.5 * sum(abs2, r0)
                res = LeastSquaresOptim.optimize!(lsp, LeastSquaresOptim.Dogleg())
                return OptimizerResult(0.0, 0, 0, res.iterations, start_c, res.ssr * 0.5, res.converged)
            end),
            OptimizerDefinition("LeastSquaresOptim (LM)", model_def -> begin
                lsp = if model_def.model isa LeastSquaresProblem
                    deepcopy(model_def.model)
                else
                    n_pts = model_def.model isa NLLSProblem ? length(model_def.model.costs.data[ExpFitResidual]) : 20
                    t_pts, y_data = generate_exp_data(n_pts)
                    LeastSquaresProblem(x=[1.0, 1.0, 1.0], f! = (r, p) -> exp_residuals!(r, p, t_pts, y_data), g! = (J, p) -> exp_jacobian!(J, p, t_pts), output_length=n_pts)
                end
                r0 = zeros(Float64, length(lsp.y))
                lsp.f!(r0, lsp.x)
                start_c = 0.5 * sum(abs2, r0)
                res = LeastSquaresOptim.optimize!(lsp, LeastSquaresOptim.LevenbergMarquardt())
                return OptimizerResult(0.0, 0, 0, res.iterations, start_c, res.ssr * 0.5, res.converged)
            end)
        ]
    )
end
