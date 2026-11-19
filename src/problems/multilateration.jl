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
# A cost has d inputs, up to 16, so the problem is analytic (DM1): each residual has a hand-written Jacobian, (x − aᵢ)ᵀ/‖x − aᵢ‖,
# `computeresjac` below. Two models, both built from the same residuals and both using that Jacobian: NLLSModel with one
# static variable, and a Standalone LeastSquaresProblem (`standalone_problem`) that fills r and J cost by cost.
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
# The hand-written Jacobian: with δ = x − a and ρ = ‖δ‖, the residual ρ − range and its Jacobian δᵀ/ρ, ρ computed once.
# Returned as the types NLLSModel's automatic differentiation gives this residual (an SVector{1} and an SMatrix{1, D})
function NLLSModel.computeresjac(::StaticInt{1}, res::MultilaterationResidual{D}, x::SVector{D, Float64}) where {D}
    δ = x - res.anchor
    ρ = norm(δ)
    return SVector(ρ - res.range), SMatrix{1, D, Float64, D}(Tuple(δ / ρ))
end

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

# The costs, defined once (both models are built from them), behind a function barrier on the dimension so that the
# variable and residual types are concrete
multilateration_costs(::Val{D}, data) where {D} =
    [MultilaterationResidual{D}(SVector{D, Float64}(view(data.anchors, :, i)), data.ranges[i]) for i in eachindex(data.ranges)]

# Model 1
function multilateration_nlls_model(costs::Vector{MultilaterationResidual{D}}, data) where {D}
    x0_static = SVector{D, Float64}(data.x0)
    nlls_prob = NLLSModel.Model(SVector{D, Float64}, MultilaterationResidual{D})
    addvariable!(nlls_prob, x0_static)
    for c in costs
        addcost!(nlls_prob, c)
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

# Model 2: Standalone, its residuals and Jacobian filled cost by cost by the same computeresidual and computeresjac, in a
# plain loop (DM9)
function multilateration_standalone_model(costs::Vector{MultilaterationResidual{D}}, data) where {D}
    x0 = data.x0
    m = length(costs)
    lsp = standalone_problem((costs,), [SVector{D, Float64}(x0)])
    x_standalone = lsp.x
    r_buf = zeros(Float64, m)
    J_buf = zeros(Float64, m, D)
    g_buf = zeros(Float64, D)
    H_buf = zeros(Float64, D, D)
    return ModelDefinition(
        "Standalone",
        lsp,
        () -> begin
            lsp.f!(r_buf, x_standalone)
            return 0.5 * sum(abs2, r_buf)
        end,
        () -> begin
            lsp.f!(r_buf, x_standalone)
            lsp.g!(J_buf, x_standalone)
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
Two models, both from the same residuals and their hand-written Jacobian: "NLLSModel (Static)" (one `SVector{d}`
variable) and "Standalone" (a `LeastSquaresProblem` filled cost by cost). Data from `multilateration_data`.
"""
function create_multilateration_problem()
    ProblemDefinition(
        "Multilateration",
        :small_dense,
        Any[2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 16],
        d -> begin
            data = multilateration_data(d)
            costs = multilateration_costs(Val(d), data)
            return [multilateration_nlls_model(costs, data), multilateration_standalone_model(costs, data)]
        end,
        get_standard_optimizers(; tall=true),
        "Dimension d";
        # Derivatives (DM1): a cost has up to 16 inputs
        derivatives = :analytic
    )
end
