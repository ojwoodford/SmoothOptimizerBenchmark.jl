# Exponential Curve Fitting Problem (Small Dense)
using Static, StaticArrays, LinearAlgebra, Random
using SecondOrderOptimization, NLLSModel, LeastSquaresOptim

struct ExpFitResidual <: AbstractResidual
    t::Float64
    y::Float64
end
NLLSModel.ndeps(::ExpFitResidual) = static(1)
NLLSModel.nres(::ExpFitResidual) = static(1)
NLLSModel.varindices(::ExpFitResidual) = SVector(1)
NLLSModel.getvars(::ExpFitResidual, vars::Vector) = (vars[1]::SVector{3, Float64},)
NLLSModel.computeresidual(res::ExpFitResidual, p) = SVector(p[1] * exp(-p[2] * res.t) + p[3] - res.y)
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
        Any[10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000],
        n_points -> begin
            t_pts, y_data = generate_exp_data(n_points)
            p0_static = SVector(1.0, 1.0, 1.0)
            p0_vec = [1.0, 1.0, 1.0]

            # Model 1: NLLSModel
            nlls_prob = NLLSModel.Model(SVector{3, Float64}, ExpFitResidual)
            addvariable!(nlls_prob, p0_static)
            for i in 1:n_points
                addcost!(nlls_prob, ExpFitResidual(t_pts[i], y_data[i]))
            end
            m_nlls = ModelDefinition(
                "NLLSModel (Static)",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob),
                () -> (NLLSModel.cost(nlls_prob), nothing),
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
                lsp, # Using lsp allows all adapters to run on m_soo if needed
                () -> f_soo(p_soo),
                () -> (fdf_soo!(g_buf, H_buf, p_soo), (g_buf, H_buf)),
                () -> copyto!(p_soo, p0_vec)
            )

            return [m_nlls, m_lso, m_soo]
        end,
        get_tier1_optimizers(),
        "Data Points m"
    )
end
