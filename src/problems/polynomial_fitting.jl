# Ill-Conditioned Polynomial Fitting Problem (Medium Dense)
#
# A degree-13 monomial fit on [0, 1], cond(J) ≈ 4e9. The tall (QR of J) and normal-equations (JᵀJ)
# formulations of SecondOrderOptimization differ here: forming JᵀJ squares the condition number to
# about 1e19, beyond Float64. The residuals are scaled by POLYFIT_SCALE so that the smallest squared
# singular value of J is far above 1e-12, the absolute floor Levenberg–Marquardt once put on its
# damping; unscaled, that floor held both formulations back equally.
#
# The problem is linear, so its least-squares minimum is computed once per size in extended precision
# (`polyfit_reference`), and each row records its excess cost over it, also in extended precision
# (N4): in Float64 the cost of an iterate with coefficients this large is rounded at about 1e-8
# relative, and the gradient norm is rounding noise at the minimum, so neither can compare formulations.
using Static, StaticArrays, LinearAlgebra
using SecondOrderOptimization, NLLSModel, LeastSquaresOptim

const POLYFIT_DEGREE = 13
const POLYFIT_NCOEFFS = POLYFIT_DEGREE + 1
const POLYFIT_SCALE = 1e4

struct PolyFitResidual <: AbstractResidual
    v::SVector{POLYFIT_NCOEFFS, Float64}   # the row of J: POLYFIT_SCALE * t^k, k = 0:degree
    y::Float64
end
NLLSModel.ndeps(::PolyFitResidual) = static(1)
NLLSModel.nres(::PolyFitResidual) = static(1)
NLLSModel.varindices(::PolyFitResidual) = SVector(1)
NLLSModel.getvars(::PolyFitResidual, vars::AbstractVector) = (vars[1]::SVector{POLYFIT_NCOEFFS, Float64},)
NLLSModel.computeresidual(res::PolyFitResidual, p) = SVector(dot(res.v, p) - res.y)
Base.eltype(::PolyFitResidual) = Float64

"""
    polyfit_data(n_points) -> (V, y)

The scaled Vandermonde matrix and data of the ill-conditioned fit with `n_points` points.
"""
function polyfit_data(n_points::Int)
    t = collect(range(0.0, 1.0; length=n_points))
    V = POLYFIT_SCALE * hcat((t .^ k for k in 0:POLYFIT_DEGREE)...)
    y = POLYFIT_SCALE * (@. sin(3t) + 0.01 * cos(17t))
    return V, y
end

const POLYFIT_PRECISION = 256
const POLYFIT_REFERENCES = Dict{Int, Any}()

"""
    polyfit_reference(n_points) -> (; V, y, minimum)

The data of the fit with `n_points` points in extended precision (`BigFloat`, $(POLYFIT_PRECISION) bits), and its
least-squares minimum cost. Computed once per size.
"""
function polyfit_reference(n_points::Int)
    return get!(POLYFIT_REFERENCES, n_points) do
        setprecision(BigFloat, POLYFIT_PRECISION) do
            V, y = polyfit_data(n_points)
            Vb, yb = big.(V), big.(y)
            xb = qr(Vb) \ yb
            (; V=Vb, y=yb, minimum=0.5 * sum(abs2, Vb * xb - yb))
        end
    end
end

"""
    polyfit_excess_cost(n_points, x) -> Float64

The cost at `x` minus the least-squares minimum, both computed in extended precision.
"""
function polyfit_excess_cost(n_points::Int, x::AbstractVector{<:Real})
    length(x) == POLYFIT_NCOEFFS || return NaN
    all(isfinite, x) || return NaN
    ref = polyfit_reference(n_points)
    return setprecision(BigFloat, POLYFIT_PRECISION) do
        Float64(0.5 * sum(abs2, ref.V * big.(x) - ref.y) - ref.minimum)
    end
end

# The number of data points of a model of this problem
polyfit_npoints(m::ModelDefinition) = polyfit_npoints(m.model)
polyfit_npoints(m::LeastSquaresProblem) = length(m.y)
polyfit_npoints(m::NLLSModel.Model) = NLLSModel.nresiduals(m)

# An optimizer definition whose rows also carry the excess cost over the reference minimum
function polyfit_optimizer(name::String, run)
    return OptimizerDefinition(name, (m; kwargs...) -> begin
        x = Float64[]
        r = run(m; solution=x, kwargs...)
        return with_excess_cost(r, isempty(x) ? NaN : polyfit_excess_cost(polyfit_npoints(m), x))
    end)
end

function create_polynomial_fitting_problem()
    ProblemDefinition(
        "Ill-Conditioned Polynomial Fitting",
        :medium_dense,
        Any[60, 100, 160, 250, 400, 640, 1000, 1600, 2500, 4000, 6400],
        n_points -> begin
            V, y = polyfit_data(n_points)
            p0_static = zero(SVector{POLYFIT_NCOEFFS, Float64})
            p0_vec = zeros(POLYFIT_NCOEFFS)

            # Model 1: NLLSModel
            nlls_prob = NLLSModel.Model(SVector{POLYFIT_NCOEFFS, Float64}, PolyFitResidual)
            addvariable!(nlls_prob, p0_static)
            for i in 1:n_points
                addcost!(nlls_prob, PolyFitResidual(SVector{POLYFIT_NCOEFFS}(view(V, i, :)), y[i]))
            end
            nt = benchmark_numthreads()
            f_nlls, fdf_nlls!, _, _ = NLLSModel.optimvars(nlls_prob, nothing, nt)
            g_nlls = zeros(Float64, POLYFIT_NCOEFFS)
            H_nlls = zeros(Float64, POLYFIT_NCOEFFS, POLYFIT_NCOEFFS)
            m_nlls = ModelDefinition(
                "NLLSModel (Static)",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob, nt),
                () -> (fdf_nlls!(g_nlls, H_nlls, nlls_prob.variables[1]), H_nlls),
                () -> (nlls_prob.variables[1] = p0_static)
            )

            # Model 2: Standalone
            r_buf = zeros(Float64, n_points)
            J_buf = zeros(Float64, n_points, POLYFIT_NCOEFFS)
            g_buf = zeros(Float64, POLYFIT_NCOEFFS)
            H_buf = zeros(Float64, POLYFIT_NCOEFFS, POLYFIT_NCOEFFS)
            p_standalone = copy(p0_vec)
            f_res!(r, p) = (mul!(r, V, p); r .-= y; r)
            g_jac!(J, p) = copyto!(J, V)
            lsp = LeastSquaresProblem(x=p_standalone, f! = f_res!, g! = g_jac!, J=zeros(Float64, n_points, POLYFIT_NCOEFFS), output_length=n_points)
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
        OptimizerDefinition[
            polyfit_optimizer("SecondOrderOptimization (LM)", (m; kwargs...) -> optimize_soo(m; method=:lm, kwargs...)),
            polyfit_optimizer("SecondOrderOptimization (LM, tall)", (m; kwargs...) -> optimize_soo(m; method=:lm, formulation=:tall, kwargs...)),
            polyfit_optimizer("LeastSquaresOptim (LM)", (m; kwargs...) -> optimize_least_squares(m; method=:lm, kwargs...)),
            polyfit_optimizer("LeastSquaresOptim (Dogleg)", (m; kwargs...) -> optimize_least_squares(m; method=:dogleg, kwargs...)),
        ],
        "Data Points m"
    )
end
