# Robust Exponential Curve Fitting Problem (Medium Dense)
#
# Exponential curve fitting, a·exp(−b·t) + c − y with one SVector{3} variable, on the same data with 30 % of the points
# moved up by +1 (one-sided outliers, against noise of σ = 0.02), fitted with a Huber kernel of width 0.05 (2.5σ). Huber
# is convex in the residual, so the rows can be compared on cost (rules.md 31) without the extra local minima of a
# redescending kernel, and beyond the width its ρ″ is not zero, so the native path exercises the second-order (Triggs)
# correction as well as the reweighting. The inlier data, the residual formula and the sizes are curve fitting's.
#
# SecondOrderOptimization's three native rows (Dogleg, LM, LM tall) run the NLLSModel model, which declares the kernel
# (`robustkernel`). Every other row runs "Standalone (fudged)": the residuals are rewritten so that a plain least-squares
# solver minimizes the robust cost. With s = r² and ρ the kernel,
#     r̃ = sign(r)·√ρ(s),  dr̃/dr = ρ′(s)·|r| / √ρ(s)   (√ρ′(0) at r = 0, the limit),
# so ½r̃² = ½ρ(r²) exactly and J̃ᵀr̃ (row i of J scaled by dr̃ᵢ/drᵢ) is the robust cost's gradient. Only the Gauss–Newton
# Hessian J̃ᵀJ̃ differs from the native one. The residual-only packages' rows (LeastSquaresOptim, NonlinearSolve, CaNNOLeS)
# are named "fudged", as is the control row, SecondOrderOptimization (LM) on the fudged model, which holds the
# optimizer fixed and changes only the formulation. Optim, JSOSolvers, Ipopt and MadNLP run the same fudged model under
# their standard names: their objective and gradient are the robust cost's exactly; only their Hessian J̃ᵀJ̃ comes from
# the fudge.
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

function exp_fudged_residuals!(r, p, t_pts, y_data, kernel)
    exp_residuals!(r, p, t_pts, y_data)
    @inbounds for i in eachindex(r)
        r[i] = fudged_residual(kernel, r[i])
    end
    return r
end

function exp_fudged_jacobian!(J, p, t_pts, y_data, kernel)
    exp_jacobian!(J, p, t_pts)
    @inbounds for i in eachindex(t_pts)
        scale = fudged_scale(kernel, p[1] * exp(-p[2] * t_pts[i]) + p[3] - y_data[i])
        J[i, 1] *= scale
        J[i, 2] *= scale
        J[i, 3] *= scale
    end
    return J
end

# Rename a residual-only package's row: "X (a)" → "X (a, fudged)", "X" → "X (fudged)"
fudged_name(name::AbstractString) = endswith(name, ")") ? string(chop(name), ", fudged)") : string(name, " (fudged)")

const FUDGED_PACKAGES = ("LeastSquaresOptim", "NonlinearSolve", "CaNNOLeS")

function robust_curve_fitting_optimizers()
    standard = get_standard_optimizers(; tall=true)
    native = filter(o -> occursin("SecondOrderOptimization", o.name), standard)
    control = OptimizerDefinition("SecondOrderOptimization (LM, fudged)", (m; kwargs...) -> optimize_soo(m; method=:lm, kwargs...), "Standalone (fudged)")
    others = [any(pkg -> startswith(o.name, pkg), FUDGED_PACKAGES) ? OptimizerDefinition(fudged_name(o.name), o.optimize) : o
              for o in standard if !occursin("SecondOrderOptimization", o.name)]
    return OptimizerDefinition[native..., control, others...]
end

"""
    create_robust_curve_fitting_problem() -> ProblemDefinition

Exponential curve fitting with 30 % one-sided outliers (+1) and a Huber kernel of width 0.05, at curve fitting's sizes.
Two models: "NLLSModel (Static)", which declares the kernel (SecondOrderOptimization's native rows), and
"Standalone (fudged)", whose rewritten residuals make ½‖r̃‖² the robust cost (every other row, including the control row
"SecondOrderOptimization (LM, fudged)"). Data from `generate_exp_outlier_data`.
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

            # Model 1: NLLSModel, with the kernel declared
            nlls_prob = NLLSModel.Model(SVector{3, Float64}, RobustExpFitResidual)
            addvariable!(nlls_prob, p0_static)
            for i in 1:n_points
                addcost!(nlls_prob, RobustExpFitResidual(t_pts[i], y_data[i]))
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

            # Model 2: Standalone (fudged), the rewritten residuals and their Jacobian
            r_buf = zeros(Float64, n_points)
            J_buf = zeros(Float64, n_points, 3)
            g_buf = zeros(Float64, 3)
            H_buf = zeros(Float64, 3, 3)
            p_standalone = copy(p0_vec)
            f_res!(r, p) = exp_fudged_residuals!(r, p, t_pts, y_data, exp_huber_kernel)
            g_jac!(J, p) = exp_fudged_jacobian!(J, p, t_pts, y_data, exp_huber_kernel)
            lsp = LeastSquaresProblem(x=p_standalone, f! = f_res!, g! = g_jac!, output_length=n_points)
            m_standalone = ModelDefinition(
                "Standalone (fudged)",
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
        robust_curve_fitting_optimizers(),
        "Data Points m"
    )
end
