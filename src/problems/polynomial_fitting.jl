# Ill-Conditioned Polynomial Fitting Problem (Medium Dense)
#
# A least-squares fit of n coefficients to m = 8n samples, the size swept being n, at the same condition number at every
# size (`improvements.md` item 30): the one ill-conditioned size sweep of the benchmark. The basis is the Chebyshev
# polynomials of an interval wider than the data, T_{k−1}(t/s) for data on [−1, 1], with the stretch s ≥ 1 chosen at each
# n so that cond(J) is POLYFIT_TARGET_COND (a contrivance, accepted as such: decision 3 of the specification). Below about
# 14 coefficients much of that ill-conditioning is in the columns' norms, so a diagonal scaling of the coefficients would
# remove part of it. The Jacobian (QR of J) and normal-equations (JᵀJ) formulations differ here: forming JᵀJ squares the
# condition number to about 1.6e19, beyond Float64. The residuals are scaled by POLYFIT_SCALE so that the smallest squared
# singular value of J is far above 1e-12, the absolute floor Levenberg–Marquardt once put on its damping.
#
# The problem is linear, so its least-squares minimum is computed once per size in extended precision
# (`polyfit_reference`), and each row records its excess cost over it, also in extended precision (N4): in Float64 the
# cost of an iterate is rounded at about 1e-8 relative, and the gradient norm is rounding noise at the minimum, so neither
# can compare formulations.
#
# One Vector{Float64} variable at every size, so that the static linear system's size limit (16) is not a second thing
# changing along the sweep. A cost has n inputs, more than 8 from n = 10: analytic (DM1), each cost with its Jacobian, its
# row of the basis, written by hand.
using Static, StaticArrays, LinearAlgebra
using SecondOrderOptimization, NLLSModel, LeastSquaresOptim

const POLYFIT_SCALE = 1e4
# The condition number of J at every size (the value the monomial fit of degree 13 on [0, 1] had); a choice, not a
# measured threshold
const POLYFIT_TARGET_COND = 4e9
# The data points per coefficient
const POLYFIT_POINTS_PER_COEFF = 8

# The Chebyshev polynomials T_0 … T_{n−1} at the points t, by their three-term recurrence: an m × n matrix
function chebyshev_basis(t::AbstractVector{Float64}, n::Int)
    V = Matrix{Float64}(undef, length(t), n)
    for (i, ti) in enumerate(t)
        a, b = 1.0, ti
        V[i, 1] = a
        n >= 2 && (V[i, 2] = b)
        for k in 3:n
            a, b = b, 2 * ti * b - a
            V[i, k] = b
        end
    end
    return V
end

polyfit_points(n::Int) = collect(range(-1.0, 1.0; length=POLYFIT_POINTS_PER_COEFF * n))
polyfit_basis(n::Int, s::Real) = POLYFIT_SCALE * chebyshev_basis(polyfit_points(n) ./ s, n)
polyfit_condition(n::Int, s::Real) = (σ = svdvals(polyfit_basis(n, s)); σ[1] / σ[end])

const POLYFIT_STRETCHES = Dict{Int, Float64}()

"""
    polyfit_stretch(n) -> Float64

The stretch s at which the fit with `n` coefficients has cond(J) = POLYFIT_TARGET_COND, from the singular values of the
Float64 basis: bisection on log s between 1 and 1e6, to a relative width of 1e-13. Computed once per n.
"""
function polyfit_stretch(n::Int)
    return get!(POLYFIT_STRETCHES, n) do
        lo, hi = 0.0, log(1e6)
        polyfit_condition(n, exp(lo)) < POLYFIT_TARGET_COND < polyfit_condition(n, exp(hi)) || throw(ArgumentError(
            "polyfit_stretch: at n = $n the target condition number $(POLYFIT_TARGET_COND) is not between those at s = 1 and 1e6"))
        while hi - lo > 1e-13
            mid = (lo + hi) / 2
            polyfit_condition(n, exp(mid)) < POLYFIT_TARGET_COND ? (lo = mid) : (hi = mid)
        end
        exp((lo + hi) / 2)
    end
end

struct PolyFitResidual <: AbstractResidual
    v::Vector{Float64}     # the row of J: POLYFIT_SCALE · T_{k−1}(t/s), k = 1 … n
    y::Float64
    r::Vector{Float64}     # the residual
    J::Matrix{Float64}     # its Jacobian, 1 × n: the row v
end
PolyFitResidual(v::AbstractVector, y::Real) = PolyFitResidual(Vector{Float64}(v), Float64(y), zeros(1), reshape(Vector{Float64}(v), 1, :))
NLLSModel.ndeps(::PolyFitResidual) = static(1)
NLLSModel.nres(::PolyFitResidual) = 1
NLLSModel.varindices(::PolyFitResidual) = 1
NLLSModel.getvars(::PolyFitResidual, vars::AbstractVector) = (vars[1]::Vector{Float64},)
Base.eltype(::PolyFitResidual) = Float64
function NLLSModel.computeresidual(res::PolyFitResidual, p::Vector{Float64})
    acc = -res.y
    @inbounds for k in eachindex(res.v)
        acc += res.v[k] * p[k]
    end
    res.r[1] = acc
    return res.r
end
# The hand-written Jacobian (the problem is analytic, DM1): the residual is linear in the coefficients, so its Jacobian is
# the row v, which the cost holds as its 1 × n buffer
NLLSModel.computeresjac(::StaticInt{1}, res::PolyFitResidual, p::Vector{Float64}) = (NLLSModel.computeresidual(res, p), res.J)

"""
    polyfit_data(n) -> (V, y)

The scaled basis matrix (8n × n) and the data of the fit with `n` coefficients.
"""
function polyfit_data(n::Int)
    t = polyfit_points(n)
    V = polyfit_basis(n, polyfit_stretch(n))
    y = POLYFIT_SCALE * (@. sin(3t) + 0.01 * cos(17t))
    return V, y
end

const POLYFIT_PRECISION = 256
const POLYFIT_REFERENCES = Dict{Int, Any}()

"""
    polyfit_reference(n) -> (; V, y, minimum)

The data of the fit with `n` coefficients in extended precision (`BigFloat`, $(POLYFIT_PRECISION) bits, from the Float64
data), and its least-squares minimum cost. Computed once per size.
"""
function polyfit_reference(n::Int)
    return get!(POLYFIT_REFERENCES, n) do
        setprecision(BigFloat, POLYFIT_PRECISION) do
            V, y = polyfit_data(n)
            Vb, yb = big.(V), big.(y)
            xb = qr(Vb) \ yb
            (; V=Vb, y=yb, minimum=0.5 * sum(abs2, Vb * xb - yb))
        end
    end
end

"""
    polyfit_excess_cost(n, x) -> Float64

The cost at `x` (`n` coefficients) minus the least-squares minimum, both computed in extended precision.
"""
function polyfit_excess_cost(n::Int, x::AbstractVector{<:Real})
    length(x) == n || return NaN
    all(isfinite, x) || return NaN
    ref = polyfit_reference(n)
    return setprecision(BigFloat, POLYFIT_PRECISION) do
        Float64(0.5 * sum(abs2, ref.V * big.(x) - ref.y) - ref.minimum)
    end
end

# The number of coefficients of a model of this problem
polyfit_ncoeffs(m::ModelDefinition) = polyfit_ncoeffs(m.model)
polyfit_ncoeffs(m::LeastSquaresProblem) = length(m.x)
polyfit_ncoeffs(m::NLLSModel.Model) = length(m.variables[1])
polyfit_ncoeffs(m::AbstractNLSModel) = m.meta.nvar

# The JuMP model (IND3d): the residuals are affine in the coefficients, so they are JuMP affine expressions, V[i, :]·p − y[i]
function build_jump_polynomial_fitting(V::Matrix{Float64}, y::Vector{Float64})
    n = size(V, 2)
    model = JuMP.Model()
    @variable(model, p[k = 1:n], start = 0.0)
    F = [@expression(model, sum(V[i, k] * p[k] for k in 1:n) - y[i]) for i in eachindex(y)]
    return MathOptNLSModel(model, F)
end

# An optimizer definition whose rows also carry the excess cost over the reference minimum, at the point the row hands
# back through the `solution` keyword: the harness's buffer when it passes one (IT1), else one of its own
function polyfit_optimizer(name::String, run)
    return OptimizerDefinition(name, (m; solution=Float64[], kwargs...) -> begin
        x = solution
        r = run(m; solution=x, kwargs...)
        return with_excess_cost(r, isempty(x) ? NaN : polyfit_excess_cost(polyfit_ncoeffs(m), x))
    end)
end

# The SecondOrderOptimization row's configuration (IND4, re-derived by CN10 for the sweep in n): NLLSModel's
# recommendoptimizer at the largest size, n = 64, with numthreads = 1, evaluated 2026-11-20 at NLLSModel d2e4374
# (Julia 1.13.3); rules F_illconditioned, RS_jacobian, L_jacobian, I_lm: the Jacobian path, QR of J
const POLYNOMIAL_FITTING_SOO = (; iterator = :levenbergmarquardt, linsolver = :qr, formulation = :jacobian, reduction = :none, storage = :dense)

function create_polynomial_fitting_problem()
    ProblemDefinition(
        "Ill-Conditioned Polynomial Fitting",
        :medium_dense,
        Any[4, 5, 7, 10, 14, 19, 25, 35, 47, 64],
        n -> begin
            V, y = polyfit_data(n)
            p0 = zeros(n)

            # Model 1: NLLSModel, one Vector{Float64} variable and one cost per data point
            nlls_prob = NLLSModel.Model(Vector{Float64}, PolyFitResidual)
            addvariable!(nlls_prob, copy(p0))
            for i in eachindex(y)
                addcost!(nlls_prob, PolyFitResidual(view(V, i, :), y[i]))
            end
            nt = benchmark_numthreads()
            f_nlls, fdf_nlls!, _, H_proto_nlls = NLLSModel.optimvars(nlls_prob; unfixed=nothing, numthreads=nt)
            H_nlls = deepcopy(H_proto_nlls)
            g_nlls = zero(H_proto_nlls[:, 1])
            m_nlls = ModelDefinition(
                "NLLSModel",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob, nt),
                () -> (fdf_nlls!(g_nlls, H_nlls, nlls_prob.variables[1]), H_nlls),
                () -> copyto!(nlls_prob.variables[1], p0)
            )

            # Model 2: Standalone, its own copy of the costs, filled cost by cost by the same computeresidual and the
            # hand-written computeresjac, in a plain loop (DM8)
            lsp = standalone_problem(([PolyFitResidual(view(V, i, :), y[i]) for i in eachindex(y)],), [copy(p0)])
            p_standalone = lsp.x
            m_pts = length(y)
            r_buf = zeros(Float64, m_pts)
            J_buf = zeros(Float64, m_pts, n)
            g_buf = zeros(Float64, n)
            H_buf = zeros(Float64, n, n)
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
                () -> copyto!(p_standalone, p0)
            )

            # Model 3: JuMP, as a MathOptNLSModel (IND3d)
            m_jump = jump_model("JuMP", build_jump_polynomial_fitting(V, y), copy(p0))

            return [m_jump, m_nlls, m_standalone]   # alphabetical (IND8)
        end,
        # The standard rows (decision 16, IND3d), each wrapped to record its excess cost
        OptimizerDefinition[polyfit_optimizer(o.name, o.optimize) for o in get_standard_optimizers(POLYNOMIAL_FITTING_SOO)],
        "Coefficients n",
        # The least-squares minimum in extended precision (IT4)
        n -> Float64(polyfit_reference(n).minimum);
        # Derivatives (DM1): a cost has n inputs, more than 8 from n = 10
        derivatives = :analytic
    )
end
