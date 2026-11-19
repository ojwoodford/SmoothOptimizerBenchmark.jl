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

# The JuMP model (IND3b): one residual expression per data point, the formula of ExpFitResidual, in p[1:3]
function build_jump_curve_fitting(t_pts::Vector{Float64}, y_data::Vector{Float64}, p0::Vector{Float64})
    model = JuMP.Model()
    @variable(model, p[i = 1:3], start = p0[i])
    F = [@NLexpression(model, p[1] * exp(-p[2] * t_pts[i]) + p[3] - y_data[i]) for i in eachindex(t_pts)]
    return MathOptNLSModel(model, F)
end

# The SecondOrderOptimization row's configuration (IND4): NLLSModel's recommendoptimizer at the largest size, m = 65536,
# with numthreads = 1, evaluated 2026-11-19 at NLLSModel 78a4ef5 (Julia 1.13.3); rules F_wellconditioned, RS_hessian, L_static, I_lm
const CURVE_FITTING_SOO = (; iterator = :levenbergmarquardt, linsolver = :cholesky, formulation = :hessian, reduction = :none, storage = :dense)

function create_curve_fitting_problem()
    ProblemDefinition(
        "Exponential Curve Fitting",
        :medium_dense,
        Any[64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536],
        n_points -> begin
            t_pts, y_data = generate_exp_data(n_points)
            p0_static = SVector(1.0, 1.0, 1.0)
            p0_vec = [1.0, 1.0, 1.0]

            # The costs, defined once: the NLLSModel model and the Standalone model are built from the same residuals
            costs = [ExpFitResidual(t_pts[i], y_data[i]) for i in 1:n_points]

            # Model 1: NLLSModel
            nlls_prob = NLLSModel.Model(SVector{3, Float64}, ExpFitResidual)
            addvariable!(nlls_prob, p0_static)
            for c in costs
                addcost!(nlls_prob, c)
            end
            nt = benchmark_numthreads()
            # Buffers of the types NLLSModel's linear system uses (MVector/MMatrix), so fdf! writes straight into them
            f_nlls, fdf_nlls!, _, H_proto_nlls = NLLSModel.optimvars(nlls_prob; unfixed=nothing, numthreads=nt)
            H_nlls = deepcopy(H_proto_nlls)
            g_nlls = zero(H_proto_nlls[:, 1])
            m_nlls = ModelDefinition(
                "NLLSModel (Static)",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob, nt),
                () -> (fdf_nlls!(g_nlls, H_nlls, nlls_prob.variables[1]), H_nlls),
                () -> (nlls_prob.variables[1] = p0_static)
            )

            # Model 2: Standalone, its residuals and Jacobian filled cost by cost by NLLSModel's computeresidual and
            # computeresjac (autodiff), in a plain loop (DM3)
            lsp = standalone_problem((costs,), [p0_static])
            p_standalone = lsp.x
            r_buf = zeros(Float64, n_points)
            J_buf = zeros(Float64, n_points, 3)
            g_buf = zeros(Float64, 3)
            H_buf = zeros(Float64, 3, 3)
            m_standalone = ModelDefinition(
                "Standalone",
                lsp,
                () -> begin
                    lsp.f!(r_buf, p_standalone)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    lsp.f!(r_buf, p_standalone)
                    lsp.g!(J_buf, p_standalone)
                    mul!(g_buf, J_buf', r_buf)
                    mul!(H_buf, J_buf', J_buf)
                    return (0.5 * sum(abs2, r_buf), (g_buf, H_buf))
                end,
                () -> copyto!(p_standalone, p0_vec)
            )

            # Model 3: JuMP, as a MathOptNLSModel (IND3b)
            m_jump = jump_model("JuMP", build_jump_curve_fitting(t_pts, y_data, p0_vec), p0_vec)

            return [m_nlls, m_standalone, m_jump]
        end,
        get_standard_optimizers(CURVE_FITTING_SOO),
        "Data Points m";
        # Derivatives (DM1): every cost has 3 inputs
        derivatives = :autodiff
    )
end
