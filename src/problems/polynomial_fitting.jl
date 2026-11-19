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
# The hand-written Jacobian (the problem is analytic, DM1): the residual is linear in the coefficients, so its Jacobian is
# the row v. Returned as the types NLLSModel's automatic differentiation gives this residual (an SVector{1} and an
# SMatrix{1, POLYFIT_NCOEFFS}), so the kernels downstream are the same
NLLSModel.computeresjac(::StaticInt{1}, res::PolyFitResidual, p::SVector{POLYFIT_NCOEFFS, Float64}) =
    (SVector(dot(res.v, p) - res.y), SMatrix{1, POLYFIT_NCOEFFS, Float64, POLYFIT_NCOEFFS}(Tuple(res.v)))

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
polyfit_npoints(m::AbstractNLSModel) = m.nls_meta.nequ

# The JuMP model (IND3d): the residuals are affine in the coefficients, so they are JuMP affine expressions, V[i, :]·p − y[i]
function build_jump_polynomial_fitting(V::Matrix{Float64}, y::Vector{Float64})
    model = JuMP.Model()
    @variable(model, p[k = 1:POLYFIT_NCOEFFS], start = 0.0)
    F = [@expression(model, sum(V[i, k] * p[k] for k in 1:POLYFIT_NCOEFFS) - y[i]) for i in eachindex(y)]
    return MathOptNLSModel(model, F)
end

# An optimizer definition whose rows also carry the excess cost over the reference minimum, at the point the row hands
# back through the `solution` keyword: the harness's buffer when it passes one (IT1), else one of its own
function polyfit_optimizer(name::String, run)
    return OptimizerDefinition(name, (m; solution=Float64[], kwargs...) -> begin
        x = solution
        r = run(m; solution=x, kwargs...)
        return with_excess_cost(r, isempty(x) ? NaN : polyfit_excess_cost(polyfit_npoints(m), x))
    end)
end

# The SecondOrderOptimization row's configuration (IND4): NLLSModel's recommendoptimizer at the largest size, m = 6400,
# with numthreads = 1, evaluated 2026-11-19 at NLLSModel 78a4ef5 (Julia 1.13.3); rules F_singular, RS_hessian, L_static, I_lm (the
# Cholesky probe of JᵀJ fails, so F keeps the Hessian path). With 8 threads Julia 1.10's probe succeeded, with condition
# estimate 9.7e15, and F_illconditioned chose the Jacobian path; the 1-thread answer is used (decision 14)
const POLYNOMIAL_FITTING_SOO = (; iterator = :levenbergmarquardt, linsolver = :cholesky, formulation = :hessian, reduction = :none, storage = :dense)

function create_polynomial_fitting_problem()
    ProblemDefinition(
        "Ill-Conditioned Polynomial Fitting",
        :medium_dense,
        Any[60, 100, 160, 250, 400, 640, 1000, 1600, 2500, 4000, 6400],
        n_points -> begin
            V, y = polyfit_data(n_points)
            p0_static = zero(SVector{POLYFIT_NCOEFFS, Float64})
            p0_vec = zeros(POLYFIT_NCOEFFS)

            # The costs, defined once: both models are built from the same residuals
            costs = [PolyFitResidual(SVector{POLYFIT_NCOEFFS}(view(V, i, :)), y[i]) for i in 1:n_points]

            # Model 1: NLLSModel
            nlls_prob = NLLSModel.Model(SVector{POLYFIT_NCOEFFS, Float64}, PolyFitResidual)
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

            # Model 2: Standalone, its residuals and Jacobian filled cost by cost by the same computeresidual and the
            # hand-written computeresjac, in a plain loop (DM8)
            lsp = standalone_problem((costs,), [p0_static])
            p_standalone = lsp.x
            r_buf = zeros(Float64, n_points)
            J_buf = zeros(Float64, n_points, POLYFIT_NCOEFFS)
            g_buf = zeros(Float64, POLYFIT_NCOEFFS)
            H_buf = zeros(Float64, POLYFIT_NCOEFFS, POLYFIT_NCOEFFS)
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

            # Model 3: JuMP, as a MathOptNLSModel (IND3d)
            m_jump = jump_model("JuMP", build_jump_polynomial_fitting(V, y), p0_vec)

            return [m_jump, m_nlls, m_standalone]   # alphabetical (IND8)
        end,
        # The standard rows (decision 16, IND3d), each wrapped to record its excess cost
        OptimizerDefinition[polyfit_optimizer(o.name, o.optimize) for o in get_standard_optimizers(POLYNOMIAL_FITTING_SOO)],
        "Data Points m",
        # The least-squares minimum in extended precision (IT4)
        n_points -> Float64(polyfit_reference(n_points).minimum);
        # Derivatives (DM1): every cost has 14 inputs
        derivatives = :analytic
    )
end
