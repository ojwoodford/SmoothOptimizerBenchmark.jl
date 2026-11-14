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
NLLSModel.getvars(::ExpFitResidual, vars::AbstractVector) = (vars[1]::SVector{3, Float64},)
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
        :medium_dense,
        Any[64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536],
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
            nt = benchmark_numthreads()
            f_nlls, fdf_nlls!, _, _ = NLLSModel.optimvars(nlls_prob, nothing, nt)
            g_nlls = zeros(Float64, 3)
            H_nlls = zeros(Float64, 3, 3)
            m_nlls = ModelDefinition(
                "NLLSModel (Static)",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob, nt),
                () -> (fdf_nlls!(g_nlls, H_nlls, nlls_prob.variables[1]), H_nlls),
                () -> (nlls_prob.variables[1] = p0_static)
            )

            # Model 2: Standalone
            r_buf = zeros(Float64, n_points)
            J_buf = zeros(Float64, n_points, 3)
            g_buf = zeros(Float64, 3)
            H_buf = zeros(Float64, 3, 3)
            p_standalone = copy(p0_vec)
            f_res!(r, p) = exp_residuals!(r, p, t_pts, y_data)
            g_jac!(J, p) = exp_jacobian!(J, p, t_pts)
            lsp = LeastSquaresProblem(x=p_standalone, f! = f_res!, g! = g_jac!, output_length=n_points)
            m_standalone = ModelDefinition(
                "Standalone",
                lsp,
                () -> begin
                    f_res!(r_buf, p_standalone)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    f_res!(r_buf, p_standalone)
                    g_jac!(J_buf, p_standalone)
                    mul!(g_buf, J_buf', r_buf)
                    mul!(H_buf, J_buf', J_buf)
                    return (0.5 * sum(abs2, r_buf), (g_buf, H_buf))
                end,
                () -> copyto!(p_standalone, p0_vec)
            )

            return [m_nlls, m_standalone]
        end,
        get_standard_optimizers(),
        "Data Points m"
    )
end
