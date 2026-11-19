# Robust Exponential Curve Fitting Problem (Medium Dense)
#
# Exponential curve fitting, a·exp(−b·t) + c − y with one SVector{3} variable, on the same data with 30 % of the points
# moved up by +1 (one-sided outliers, against noise of σ = 0.02), fitted with a Huber kernel of width 0.05 (2.5σ). Huber
# is convex in the residual, so the rows can be compared on cost (rules.md 31) without the extra local minima of a
# redescending kernel, and beyond the width its ρ″ is not zero, so the native path exercises the second-order (Triggs)
# correction as well as the reweighting. The inlier data, the residual formula and the sizes are curve fitting's.
#
# Three models, and which rows run on each (IND1's pairing):
# - "NLLSModel (Static)" declares the kernel (`robustkernel`): SecondOrderOptimization's row.
# - "JuMP (fudged)" is the rewritten residuals below as JuMP expressions: JSOSolvers, Ipopt, MadNLP and CaNNOLeS, the
#   packages whose native model is JuMP. JuMP differentiates the rewritten cost itself, so those rows get its exact
#   Hessian, and JSOSolvers, Ipopt and MadNLP keep their standard names; CaNNOLeS, which has no kernel interface, is
#   "CaNNOLeS (fudged)".
# - "Standalone (fudged)": every other row (LeastSquaresOptim, NonlinearSolve and Optim, which have no native model).
#   The residual-only packages' rows (LeastSquaresOptim, NonlinearSolve) are named "fudged"; Optim
#   keeps its standard names: its objective and gradient are the robust cost's exactly, and only its Hessian J̃ᵀJ̃ comes
#   from the fudge.
# The fudge: the residuals are rewritten so that a plain least-squares solver minimizes the robust cost. With s = r² and
# ρ the kernel,
#     r̃ = sign(r)·√ρ(s),  dr̃/dr = ρ′(s)·|r| / √ρ(s)   (√ρ′(0) at r = 0, the limit),
# so ½r̃² = ½ρ(r²) exactly and J̃ᵀr̃ (row i of J scaled by dr̃ᵢ/drᵢ) is the robust cost's gradient. Only the Gauss–Newton
# Hessian J̃ᵀJ̃ differs from the native one. The fudged Standalone model is built by `standalone_problem(…; fudged = true)`
# from the same `RobustExpFitResidual`s as the native model: each cost's residual and its row of J come from NLLSModel's
# `computeresidual` and `computeresjac` (forward-mode automatic differentiation, the native model's own per-cost code),
# and the row is then scaled by dr̃/dr. The JuMP model writes r̃ in closed form for the Huber kernel (below).
using Static, StaticArrays, LinearAlgebra, Random
using SecondOrderOptimization, NLLSModel, LeastSquaresOptim

const EXP_OUTLIER_FRACTION = 0.3
const EXP_OUTLIER_OFFSET = 1.0
const EXP_HUBER_WIDTH = 0.05
# The seed of the generator that picks the outliers. MersenneTwister's streams differ between Julia 1.10 and 1.13, so the
# outlier set, and with it each solver's status, depends on the Julia version. 4245 is the smallest seed from 4242 up for
# which every row has the same status on both versions at 64 and 1024 points, and the native fit is within 0.1 of
# (2, 1.5, 0.5) on both (measured 2026-11-17; the first seed, 4242, gave MadNLP a different status on each version)
const EXP_OUTLIER_SEED = 4245

const exp_huber_kernel = NLLSModel.Huber2oKernel(EXP_HUBER_WIDTH)

struct RobustExpFitResidual <: AbstractResidual
    t::Float64
    y::Float64
end
NLLSModel.ndeps(::RobustExpFitResidual) = static(1)
NLLSModel.nres(::RobustExpFitResidual) = static(1)
NLLSModel.varindices(::RobustExpFitResidual) = SVector(1)
NLLSModel.getvars(::RobustExpFitResidual, vars::AbstractVector) = (vars[1]::SVector{3, Float64},)
NLLSModel.computeresidual(res::RobustExpFitResidual, p) = NLLSModel.computeresidual(ExpFitResidual(res.t, res.y), p)
NLLSModel.robustkernel(::RobustExpFitResidual) = exp_huber_kernel
Base.eltype(::RobustExpFitResidual) = Float64

"""
    generate_exp_outlier_data(n_points) -> (t, y, outliers)

Curve fitting's data (`generate_exp_data`) with exactly `round(Int, EXP_OUTLIER_FRACTION * n_points)` points, chosen by
a second generator (seed `EXP_OUTLIER_SEED`) and returned sorted in `outliers`, moved up by `EXP_OUTLIER_OFFSET`.
"""
function generate_exp_outlier_data(n_points::Int)
    t_pts, y_data = generate_exp_data(n_points)
    outliers = sort(randperm(MersenneTwister(EXP_OUTLIER_SEED), n_points)[1:round(Int, EXP_OUTLIER_FRACTION * n_points)])
    y_data[outliers] .+= EXP_OUTLIER_OFFSET
    return t_pts, y_data, outliers
end

# The rewritten ("fudged") residual r̃ = sign(r)·√ρ(r²), for which ½r̃² = ½ρ(r²)
function fudged_residual(kernel, r)
    rho, _, _ = robustifydcost(kernel, r * r)
    return copysign(sqrt(rho), r)
end

# dr̃/dr = ρ′(s)·|r| / √ρ(s), the factor that scales the residual's row of J; √ρ′(0) at r = 0, where the formula is 0/0
function fudged_scale(kernel, r)
    s = r * r
    rho, drho, _ = robustifydcost(kernel, s)
    return s == 0 ? sqrt(drho) : drho * abs(r) / sqrt(rho)
end

# Rename a residual-only package's row: "X (a)" → "X (a, fudged)", "X" → "X (fudged)"
fudged_name(name::AbstractString) = endswith(name, ")") ? string(chop(name), ", fudged)") : string(name, " (fudged)")

const FUDGED_PACKAGES = ("LeastSquaresOptim", "NonlinearSolve", "CaNNOLeS")

function robust_curve_fitting_optimizers()
    standard = get_standard_optimizers(ROBUST_CURVE_FITTING_SOO)
    return OptimizerDefinition[any(pkg -> startswith(o.name, pkg), FUDGED_PACKAGES) ? OptimizerDefinition(fudged_name(o.name), o.optimize) : o
                               for o in standard]
end

# The JuMP model (IND3c): with r curve fitting's residual and w the kernel's width, the fudged residual of the Huber
# kernel in closed form, r̃ = ifelse(|r| ≤ w, r, sign(r)·√max(2w|r| − w², w²)). Where the second branch is taken, its
# argument 2w|r| − w² is the Huber ρ(r²); the max keeps the branch that is not taken finite
function build_jump_curve_fitting_robust(t_pts::Vector{Float64}, y_data::Vector{Float64}, p0::Vector{Float64}; w::Float64=EXP_HUBER_WIDTH)
    model = JuMP.Model()
    @variable(model, p[i = 1:3], start = p0[i])
    r = [@NLexpression(model, p[1] * exp(-p[2] * t_pts[i]) + p[3] - y_data[i]) for i in eachindex(t_pts)]
    F = [@NLexpression(model, ifelse(abs(ri) <= w, ri, sign(ri) * sqrt(max(2w * abs(ri) - w^2, w^2)))) for ri in r]
    return MathOptNLSModel(model, F)
end

# The SecondOrderOptimization row's configuration (IND4): NLLSModel's recommendoptimizer at the largest size, m = 65536,
# with numthreads = 1, evaluated 2026-11-19 at NLLSModel 78a4ef5 (Julia 1.13.3); rules F_wellconditioned, RS_hessian, L_static, I_lm
const ROBUST_CURVE_FITTING_SOO = (; iterator = :levenbergmarquardt, linsolver = :cholesky, formulation = :hessian, reduction = :none, storage = :dense)

"""
    create_robust_curve_fitting_problem() -> ProblemDefinition

Exponential curve fitting with 30 % one-sided outliers (+1) and a Huber kernel of width 0.05, at curve fitting's sizes.
Three models: "NLLSModel (Static)", which declares the kernel (SecondOrderOptimization's row); "JuMP (fudged)", the
rewritten residuals as JuMP expressions, so that ½‖r̃‖² is the robust cost (JSOSolvers, Ipopt, MadNLP and
"CaNNOLeS (fudged)"); and "Standalone (fudged)", the same rewritten residuals (LeastSquaresOptim, NonlinearSolve and
Optim). The NLLSModel and Standalone models are built from
the same `RobustExpFitResidual`s: the fudged model's Jacobian is each cost's autodiff row (NLLSModel's `computeresjac`)
scaled by dr̃/dr. Data from `generate_exp_outlier_data`.
"""
function create_robust_curve_fitting_problem()
    ProblemDefinition(
        "Robust Exponential Curve Fitting",
        :medium_dense,
        Any[64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536],
        n_points -> begin
            t_pts, y_data, _ = generate_exp_outlier_data(n_points)
            p0_static = SVector(1.0, 1.0, 1.0)
            p0_vec = [1.0, 1.0, 1.0]

            # The costs, defined once: both models are built from the same residuals
            costs = [RobustExpFitResidual(t_pts[i], y_data[i]) for i in 1:n_points]

            # Model 1: NLLSModel, with the kernel declared
            nlls_prob = NLLSModel.Model(SVector{3, Float64}, RobustExpFitResidual)
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

            # Model 2: Standalone (fudged): each cost's residual and autodiff row, rewritten (DM4)
            lsp = standalone_problem((costs,), [p0_static]; fudged=true)
            p_standalone = lsp.x
            r_buf = zeros(Float64, n_points)
            J_buf = zeros(Float64, n_points, 3)
            g_buf = zeros(Float64, 3)
            H_buf = zeros(Float64, 3, 3)
            m_standalone = ModelDefinition(
                "Standalone (fudged)",
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

            # Model 3: JuMP (fudged), as a MathOptNLSModel (IND3c)
            m_jump = jump_model("JuMP (fudged)", build_jump_curve_fitting_robust(t_pts, y_data, p0_vec), p0_vec)

            return [m_nlls, m_standalone, m_jump]
        end,
        robust_curve_fitting_optimizers(),
        "Data Points m";
        # Derivatives (DM1): every cost has 3 inputs
        derivatives = :autodiff
    )
end
