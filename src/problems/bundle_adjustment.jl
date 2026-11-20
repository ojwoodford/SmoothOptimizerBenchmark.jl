# Bundle Adjustment Problem (Large Sparse, 9-DOF BAL Camera Formulation)
using Static, StaticArrays, LinearAlgebra, Random
using NLLSModel, BundleAdjustmentModels, CaNNOLeS, SecondOrderOptimization, OptimizationVariableInterface

struct BALPoint{T}
    p::SVector{3, T}
end
OptimizationVariableInterface.nvars(::BALPoint) = static(3)
OptimizationVariableInterface.update(p::BALPoint, step, offset=1) = BALPoint(p.p + SVector(step[offset], step[offset+1], step[offset+2]))
OptimizationVariableInterface.iseliminable(::Type{<:BALPoint}) = static(true)
flat_point(p::BALPoint) = collect(Float64, p.p)

struct BALResidual <: NLLSModel.AbstractResidual
    obs::SVector{2, Float64}
    varind::SVector{2, Int} # (cam_idx, pnt_idx)
end
Base.eltype(::BALResidual) = Float64
NLLSModel.ndeps(::BALResidual) = static(2)
NLLSModel.nres(::BALResidual) = static(2)
NLLSModel.varindices(r::BALResidual) = r.varind
NLLSModel.getvars(r::BALResidual, vars::AbstractVector) = (
    @inbounds(vars[r.varind[1]])::SVector{9, Float64},
    @inbounds(vars[r.varind[2]])
)

@inline function bal_project(cam::SVector{9, TC}, X::SVector{3, TX}) where {TC, TX}
    T = promote_type(TC, TX)
    rx, ry, rz = T(cam[1]), T(cam[2]), T(cam[3])
    tx, ty, tz = T(cam[4]), T(cam[5]), T(cam[6])
    k1, k2, f  = T(cam[7]), T(cam[8]), T(cam[9])
    px, py, pz = T(X[1]), T(X[2]), T(X[3])

    theta2 = rx * rx + ry * ry + rz * rz
    if theta2 > 1e-24
        theta = sqrt(theta2)
        inv_theta = inv(theta)
        kx, ky, kz = rx * inv_theta, ry * inv_theta, rz * inv_theta
        st, ct = sin(theta), cos(theta)
        one_m_ct_kdp = (one(T) - ct) * (kx * px + ky * py + kz * pz)
        cx = ky * pz - kz * py
        cy = kz * px - kx * pz
        cz = kx * py - ky * px
        P1x = ct * px + st * cx + one_m_ct_kdp * kx + tx
        P1y = ct * py + st * cy + one_m_ct_kdp * ky + ty
        P1z = ct * pz + st * cz + one_m_ct_kdp * kz + tz
    else
        cx = ry * pz - rz * py
        cy = rz * px - rx * pz
        cz = rx * py - ry * px
        c2x = ry * cz - rz * cy
        c2y = rz * cx - rx * cz
        c2z = rx * cy - ry * cx
        P1x = px + cx + T(0.5) * c2x + tx
        P1y = py + cy + T(0.5) * c2y + ty
        P1z = pz + cz + T(0.5) * c2z + tz
    end
    inv_z = -inv(P1z)
    u = P1x * inv_z
    v = P1y * inv_z
    r2 = u * u + v * v
    fs = f * (one(T) + r2 * (k1 + k2 * r2))
    return SVector{2, T}(fs * u, fs * v)
end

@inline NLLSModel.computeresidual(res::BALResidual, cam, X::BALPoint) = bal_project(cam, X.p) - res.obs
@inline NLLSModel.computeresidual(res::BALResidual, cam, X::SVector{3}) = bal_project(cam, X) - res.obs
@inline NLLSModel.computeresidual(res::BALResidual, cam, X) = bal_project(cam, X) - res.obs

function build_nlls_from_bam(bam::BundleAdjustmentModel)
    prob = NLLSModel.Model(Union{SVector{9, Float64}, BALPoint{Float64}}, BALResidual)
    x0 = bam.meta.x0
    npnts = bam.npnts
    ncams = bam.ncams
    for c in 1:ncams
        off = 3 * npnts + 9 * (c - 1)
        addvariable!(prob, SVector{9, Float64}(ntuple(i -> @inbounds(x0[off + i]), Val(9))))
    end
    for p in 1:npnts
        off = 3 * (p - 1)
        addvariable!(prob, BALPoint(SVector{3, Float64}(@inbounds(x0[off + 1]), @inbounds(x0[off + 2]), @inbounds(x0[off + 3]))))
    end
    for obs_idx in 1:bam.nobs
        c_idx = @inbounds bam.cams_indices[obs_idx]
        p_idx = @inbounds bam.pnts_indices[obs_idx] + ncams
        obs = SVector{2, Float64}(@inbounds(bam.pt2d[2 * obs_idx - 1]), @inbounds(bam.pt2d[2 * obs_idx]))
        addcost!(prob, BALResidual(obs, SVector{2, Int}(c_idx, p_idx)))
    end
    return prob
end

function _make_nlls_ba_model_definition(bam_model::BundleAdjustmentModel)
    nlls_prob = build_nlls_from_bam(bam_model)
    start_vars = copy(nlls_prob.variables)
    f, fdf!, _, H_proto = NLLSModel.optimvars(nlls_prob; unfixed=nothing, numthreads=benchmark_numthreads(), reduction=:eliminate)
    n_tot_vars = 9 * bam_model.ncams + 3 * bam_model.npnts
    g = zeros(Float64, n_tot_vars)
    H = H_proto === nothing ? zeros(Float64, n_tot_vars, n_tot_vars) : deepcopy(H_proto)

    # The variables flattened (cameras, then points) to BundleAdjustmentModels' layout (points, then cameras), for the
    # point evaluator (IT1)
    ncam_vars = 9 * bam_model.ncams
    to_bam_layout(x) = vcat(view(x, ncam_vars+1:length(x)), view(x, 1:ncam_vars))

    return ModelDefinition(
        "NLLSModel",
        nlls_prob,
        () -> f(nlls_prob.variables),
        () -> (fdf!(g, H, nlls_prob.variables), H),
        () -> copyto!(nlls_prob.variables, start_vars),
        to_bam_layout
    )
end

# The synthetic scene (CN9): a ring of cameras around a ball of points. Starting values, measured on the sizes checked
# (rules.md 26): cond(J) without the 7 gauge directions stays within a factor of 2 from 8 cameras up
const BA_RING_RADIUS = 3.0         # the cameras' circle, in the x–z plane, centred on the scene
const BA_SCENE_RADIUS = 1.5        # the ball the points are drawn in
const BA_FOCAL_LENGTH = 1.0        # every camera's focal length
const BA_TRACK_FRACTION = 0.5      # the fraction of the cameras that sees each point
const BA_MIN_TRACK = 8             # but at least this many (or every camera, when there are fewer)

# The Rodrigues rotation `bal_project` applies, as a matrix
function bal_rotation(w::AbstractVector)
    θ = norm(w)
    θ < 1e-12 && return Matrix{Float64}(I, 3, 3)
    k = w / θ
    K = [0 -k[3] k[2]; k[3] 0 -k[1]; -k[2] k[1] 0]
    return I + sin(θ) * K + (1 - cos(θ)) * K * K
end

# The angle of camera c of `ncams` on the ring
ba_camera_angle(c::Int, ncams::Int) = -pi + 2pi * (c - 1) / ncams

# The cameras that see point p: the k nearest on the circle to its azimuth, ties by the lower camera index
function ba_visible_cameras(p::Int, ncams::Int)
    φ = -pi + 2pi * mod((p - 1) * 0.6180339887498949, 1.0)
    k = min(ncams, max(BA_MIN_TRACK, round(Int, BA_TRACK_FRACTION * ncams)))
    dist(c) = (d = abs(mod(ba_camera_angle(c, ncams) - φ + pi, 2pi) - pi); d)
    return sort(sort(1:ncams; by=c -> (dist(c), c))[1:k])
end

"""
    make_synthetic_bam(ncams, npnts = 5ncams; rng = MersenneTwister(42 + ncams)) -> BundleAdjustmentModel

A synthetic scene (CN9): `ncams` cameras evenly spaced on a ring of radius $(BA_RING_RADIUS) in the x–z plane, each
looking at the centre, around `npnts` points drawn uniformly in a ball of radius $(BA_SCENE_RADIUS) at the centre; focal
length $(BA_FOCAL_LENGTH), no distortion. Each point is seen by the `min(ncams, max($(BA_MIN_TRACK), round(ncams/2)))`
cameras nearest its azimuth on the ring. The observations are the true scene's projections, without noise, so the minimum
cost is 0; the start is the true scene with 0.01·randn added to every point coordinate and to each camera's six
extrinsics. The draws, in order: the points, the cameras, the start's noise.
"""
function make_synthetic_bam(ncams::Int, npnts::Int=ncams * 5; rng=MersenneTwister(42 + ncams))
    x_true = zeros(Float64, 3 * npnts + 9 * ncams)
    # The points, uniform in the ball
    for p in 1:npnts
        dir = randn(rng, 3)
        x_true[3*(p-1)+1:3*p] .= (BA_SCENE_RADIUS * rand(rng)^(1 / 3) / norm(dir)) .* dir
    end
    # The cameras: centre C = −R·(sin θ, 0, cos θ) on the ring, looking at the origin (w = (0, −θ, 0) and a small
    # perturbation), translation t = −R(w)·C
    for c in 1:ncams
        θ = ba_camera_angle(c, ncams)
        C = -BA_RING_RADIUS * [sin(θ), 0.0, cos(θ)]
        w = [0.0, -θ, 0.0] .+ 0.02 .* randn(rng, 3)
        t = -bal_rotation(w) * C
        offset = 3 * npnts + 9 * (c - 1)
        x_true[offset+1:offset+3] .= w
        x_true[offset+4:offset+6] .= t
        x_true[offset+7] = 0.0 # k1
        x_true[offset+8] = 0.0 # k2
        x_true[offset+9] = BA_FOCAL_LENGTH
    end

    cams_indices = Int[]
    pnts_indices = Int[]
    for p in 1:npnts, c in ba_visible_cameras(p, ncams)
        push!(cams_indices, c)
        push!(pnts_indices, p)
    end
    nobs = length(cams_indices)

    pt2d = zeros(Float64, 2 * nobs)
    BundleAdjustmentModels.residuals!(x_true, pt2d, cams_indices, pnts_indices, nobs, npnts, zeros(Float64, 2 * nobs))

    x0 = copy(x_true)
    for i in 1:length(x0)
        if i <= 3 * npnts || (i - 3 * npnts - 1) % 9 < 6
            x0[i] += randn(rng) * 0.01
        end
    end

    nvar = 9 * ncams + 3 * npnts
    nequ = 2 * nobs
    meta = NLPModelMeta(nvar; x0=x0, name="BundleAdjustmentModel")
    nls_meta = NLSMeta(nequ, nvar; x0=x0, nnzj=2 * nobs * 12, nnzh=0)

    T = Float64
    S = Vector{Float64}

    k = similar(x0)
    P1 = similar(x0)
    JProdP321 = Matrix{T}(undef, 2, 12)
    JProdP32 = Matrix{T}(undef, 2, 6)
    JP1_mat = Matrix{T}(undef, 6, 12)
    JP2_mat = Matrix{T}(undef, 5, 6)
    JP3_mat = Matrix{T}(undef, 2, 5)
    P1_vec = S(undef, 3)
    P1_cross = S(undef, 3)
    P2_vec = S(undef, 2)

    return BundleAdjustmentModel(
        meta, nls_meta, NLSCounters(),
        cams_indices, pnts_indices, pt2d,
        nobs, npnts, ncams,
        k, P1, JProdP321, JProdP32,
        JP1_mat, JP2_mat, JP3_mat,
        P1_vec, P1_cross, P2_vec
    )
end

function _make_bam_model_definition(bam_model::BundleAdjustmentModel)
    start_bam_x0 = copy(bam_model.meta.x0)
    rx_bam = zeros(Float64, bam_model.nls_meta.nequ)
    vals_bam = zeros(Float64, bam_model.nls_meta.nnzj)
    rows_bam = Vector{Int}(undef, bam_model.nls_meta.nnzj)
    cols_bam = Vector{Int}(undef, bam_model.nls_meta.nnzj)
    NLPModels.jac_structure_residual!(bam_model, rows_bam, cols_bam)
    idx_sp = sparse(rows_bam, cols_bam, collect(1:bam_model.nls_meta.nnzj), bam_model.nls_meta.nequ, bam_model.meta.nvar)
    perm_bam = copy(nonzeros(idx_sp))
    J_bam = sparse(rows_bam, cols_bam, ones(Float64, bam_model.nls_meta.nnzj), bam_model.nls_meta.nequ, bam_model.meta.nvar)
    g_bam = zeros(Float64, bam_model.meta.nvar)

    return ModelDefinition(
        "BundleAdjustmentModels",
        bam_model,
        () -> begin
            NLPModels.residual!(bam_model, bam_model.meta.x0, rx_bam)
            0.5 * dot(rx_bam, rx_bam)
        end,
        () -> begin
            NLPModels.residual!(bam_model, bam_model.meta.x0, rx_bam)
            NLPModels.jac_coord_residual!(bam_model, bam_model.meta.x0, vals_bam)
            @inbounds for k in eachindex(perm_bam)
                J_bam.nzval[k] = vals_bam[perm_bam[k]]
            end
            mul!(g_bam, J_bam', rx_bam)
            H_bam = J_bam' * J_bam
            (0.5 * dot(rx_bam, rx_bam), H_bam)
        end,
        () -> copyto!(bam_model.meta.x0, start_bam_x0)
    )
end

# The SecondOrderOptimization row's configuration (IND4, re-derived by CN9 for the ring of cameras): NLLSModel's
# recommendoptimizer at the largest size, 256 cameras, with numthreads = 1, evaluated 2026-11-20 at NLLSModel d2e4374
# (Julia 1.13.3); rules F_rankdeficient (the gauge), RS_hessian, L_schur, I_lm. No model keywords were passed: the
# recommender decided
const BUNDLE_ADJUSTMENT_SOO = (; iterator = :levenbergmarquardt, linsolver = :cholesky, formulation = :hessian, reduction = :eliminate, storage = :sparse)

function create_bundle_adjustment_problem()
    ProblemDefinition(
        "Sparse Bundle Adjustment",
        :large_sparse,
        Any[4, 8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 256],
        sz -> begin
            bam_model = if sz isa String
                BundleAdjustmentModel(sz)
            else
                ncams = Int(sz)
                make_synthetic_bam(ncams, ncams * 5)
            end
            m_nlls = _make_nlls_ba_model_definition(bam_model)
            m_bam = _make_bam_model_definition(bam_model)
            return [m_bam, m_nlls]   # alphabetical (IND8)
        end,
        [
            OptimizerDefinition("CaNNOLeS", (m; kwargs...) -> optimize_cannoles(m; kwargs...)),
            OptimizerDefinition("Ipopt", (m; kwargs...) -> optimize_ipopt(m; kwargs...)),
            OptimizerDefinition("JSOSolvers (tron)", (m; kwargs...) -> optimize_jsosolvers(m; solver=:tron, kwargs...)),
            OptimizerDefinition("JSOSolvers (trunk)", (m; kwargs...) -> optimize_jsosolvers(m; solver=:trunk, kwargs...)),
            OptimizerDefinition("MadNLP", (m; kwargs...) -> optimize_madnlp(m; kwargs...)),
            soo_optimizer(BUNDLE_ADJUSTMENT_SOO)
        ],
        "Cameras Ncam",
        # The synthetic problems' observations are generated without noise: zero residuals at the true scene (IT4). A BAL
        # dataset (a size given by name) has no known minimum
        sz -> sz isa String ? nothing : 0.0;
        # Derivatives (DM1): exempt from the rule: its two models do not share their derivatives
        derivatives = :mixed
    )
end
