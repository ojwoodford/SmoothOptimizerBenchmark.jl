# Multilateration in R^d (Small Dense)
#
# Find a point x ∈ R^d from noisy ranges ρᵢ to m anchors aᵢ: residuals rᵢ(x) = ‖x − aᵢ‖ − ρᵢ. Every residual
# depends on every coordinate, so the natural model is one SVector{d} variable, whose linear system is a static
# d × d one at every size of the sweep: d = 2…16 covers exactly the sizes of SecondOrderOptimization's static
# system (a Hessian side of at most 16), which no other problem sweeps with a model that is natural for it.
#
# m = 4d anchors, so that accumulating JᵀJ (m·d²) and solving the system (d³) are both O(d³) and the timing line
# has one slope; a fixed m would mix d² and d³. The anchors are at radius 4 and the true point is on the unit
# sphere, so ‖x − aᵢ‖ ≥ 3 for every iterate of interest and the residuals are smooth there. At the start (x = 0)
# JᵀJ = Σ uᵢuᵢᵀ ≈ 4I: the problem is well conditioned.
#
# Two models: NLLSModel with one static variable (Jacobian by automatic differentiation, as curve fitting), and a
# Standalone LeastSquaresProblem on a Vector with an analytic Jacobian.
using Static, StaticArrays, LinearAlgebra, Random
using SecondOrderOptimization, NLLSModel, LeastSquaresOptim

struct MultilaterationResidual{D} <: AbstractResidual
    anchor::SVector{D, Float64}
    range::Float64
end
NLLSModel.ndeps(::MultilaterationResidual) = static(1)
NLLSModel.nres(::MultilaterationResidual) = static(1)
NLLSModel.varindices(::MultilaterationResidual) = SVector(1)
NLLSModel.getvars(::MultilaterationResidual{D}, vars::AbstractVector) where {D} = (vars[1]::SVector{D, Float64},)
NLLSModel.computeresidual(res::MultilaterationResidual, x) = SVector(norm(x - res.anchor) - res.range)
Base.eltype(::MultilaterationResidual) = Float64

# A random unit vector in R^d
random_unit_vector(rng, d) = normalize(randn(rng, d))

"""
    multilateration_data(d::Int) -> (; anchors, ranges, xtrue, x0)

The deterministic data of the multilateration problem in `R^d`: `m = 4d` anchors at radius 4 (a `d × m` matrix
`anchors`, one anchor per column), a true point `xtrue` on the unit sphere, the ranges
`ranges[i] = ‖xtrue − anchors[:, i]‖ + 0.01·randn`, and the start `x0 = zeros(d)`. Seeded by `42 + d`.
"""
function multilateration_data(d::Int)
    rng = MersenneTwister(42 + d)
    m = 4d
    xtrue = random_unit_vector(rng, d)
    anchors = reduce(hcat, [4 .* random_unit_vector(rng, d) for _ in 1:m])
    ranges = [norm(xtrue - anchors[:, i]) + 0.01 * randn(rng) for i in 1:m]
    return (; anchors, ranges, xtrue, x0 = zeros(d))
end

function multilateration_residuals!(r, x, anchors, ranges)
    d = size(anchors, 1)
    @inbounds for i in eachindex(ranges)
        s = 0.0
        for k in 1:d
            s += abs2(x[k] - anchors[k, i])
        end
        r[i] = sqrt(s) - ranges[i]
    end
    return r
end

# Row i of J is (x − aᵢ)ᵀ / ‖x − aᵢ‖
function multilateration_jacobian!(J, x, anchors)
    d = size(anchors, 1)
    @inbounds for i in axes(anchors, 2)
        s = 0.0
        for k in 1:d
            s += abs2(x[k] - anchors[k, i])
        end
        inv_dist = 1 / sqrt(s)
        for k in 1:d
            J[i, k] = (x[k] - anchors[k, i]) * inv_dist
        end
    end
    return J
end

# Model 1, behind a function barrier on the dimension so that the variable and residual types are concrete
function multilateration_nlls_model(::Val{D}, data) where {D}
    x0_static = SVector{D, Float64}(data.x0)
    nlls_prob = NLLSModel.Model(SVector{D, Float64}, MultilaterationResidual{D})
    addvariable!(nlls_prob, x0_static)
    for i in eachindex(data.ranges)
        addcost!(nlls_prob, MultilaterationResidual{D}(SVector{D, Float64}(view(data.anchors, :, i)), data.ranges[i]))
    end
    nt = benchmark_numthreads()
    # Buffers of the types NLLSModel's linear system uses (MVector/MMatrix), so fdf! writes straight into them
    f_nlls, fdf_nlls!, _, H_proto_nlls = NLLSModel.optimvars(nlls_prob; unfixed=nothing, numthreads=nt)
    H_nlls = deepcopy(H_proto_nlls)
    g_nlls = zero(H_proto_nlls[:, 1])
    return ModelDefinition(
        "NLLSModel (Static)",
        nlls_prob,
        () -> NLLSModel.cost(nlls_prob, nt),
        () -> (fdf_nlls!(g_nlls, H_nlls, nlls_prob.variables[1]), H_nlls),
        () -> (nlls_prob.variables[1] = x0_static)
    )
end

# Model 2: Standalone
function multilateration_standalone_model(data)
    anchors, ranges, x0 = data.anchors, data.ranges, data.x0
    m, d = length(ranges), length(x0)
    r_buf = zeros(Float64, m)
    J_buf = zeros(Float64, m, d)
    g_buf = zeros(Float64, d)
    H_buf = zeros(Float64, d, d)
    x_standalone = copy(x0)
    f_res!(r, x) = multilateration_residuals!(r, x, anchors, ranges)
    g_jac!(J, x) = multilateration_jacobian!(J, x, anchors)
    lsp = LeastSquaresProblem(x=x_standalone, f! = f_res!, g! = g_jac!, output_length=m)
    return ModelDefinition(
        "Standalone",
        lsp,
        () -> begin
            f_res!(r_buf, x_standalone)
            return 0.5 * sum(abs2, r_buf)
        end,
        () -> begin
            f_res!(r_buf, x_standalone)
            g_jac!(J_buf, x_standalone)
            mul!(g_buf, J_buf', r_buf)
            mul!(H_buf, J_buf', J_buf)
            return (0.5 * sum(abs2, r_buf), (g_buf, H_buf))
        end,
        () -> copyto!(x_standalone, x0)
    )
end

"""
    create_multilateration_problem() -> ProblemDefinition

Multilateration in `R^d`: the point whose distances to `m = 4d` anchors best match noisy ranges, at
`d = 2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 16`, the sizes of SecondOrderOptimization's static linear system.
Two models: "NLLSModel (Static)" (one `SVector{d}` variable) and "Standalone" (a `LeastSquaresProblem` with an
analytic Jacobian). Data from `multilateration_data`.
"""
function create_multilateration_problem()
    ProblemDefinition(
        "Multilateration",
        :small_dense,
        Any[2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 16],
        d -> begin
            data = multilateration_data(d)
            return [multilateration_nlls_model(Val(d), data), multilateration_standalone_model(data)]
        end,
        get_standard_optimizers(; tall=true),
        "Dimension d"
    )
end
