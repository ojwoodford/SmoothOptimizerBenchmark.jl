# Bundle Adjustment Problem (Large Sparse, from Gist d2d75b)
using Static, StaticArrays, LinearAlgebra, Random
using NLLSModel, BundleAdjustmentModels, CaNNOLeS, SecondOrderOptimization

NLLSModel.generatemeasurement(pose::SVector{6, T}, X::SVector{3, U}) where {T, U} =
    SVector(dot(@inbounds(view(pose, StaticArrays.SUnitRange(1, 3))), X), dot(@inbounds(view(pose, StaticArrays.SUnitRange(4, 6))), X))

function generate_synthetic_ba(ncameras::Int, nlandmarks::Int=ncameras * 5, propvisible::Float64=0.3)
    rng = MersenneTwister(42 + ncameras)
    prob = NLLSModel.Model(Union{SVector{6, Float64}, SVector{3, Float64}}, SimpleError2{2, Float64, SVector{6, Float64}, SVector{3, Float64}})

    camoffset = SVector(1.0, 0.0, 0.0, 0.0, 1.0, 0.0)
    for i in 1:ncameras
        addvariable!(prob, randn(rng, SVector{6, Float64}) .+ camoffset)
    end
    lmoffset = SVector(-0.5, -0.5, 10.0)
    for j in 1:nlandmarks
        addvariable!(prob, rand(rng, SVector{3, Float64}) .+ lmoffset)
    end

    visibility = abs.(repeat(vec(1:ncameras), outer=(1, nlandmarks)) .- LinRange(2, ncameras - 1, nlandmarks)')
    visibility = visibility .<= sort(vec(visibility))[Int(ceil(length(visibility) * propvisible))]
    for camind in 1:ncameras
        camera = prob.variables[camind]::SVector{6, Float64}
        for (landmark, tf) in enumerate(view(visibility, camind, :)')
            if tf
                landmarkind = landmark + ncameras
                meas = generatemeasurement(camera, prob.variables[landmarkind]::SVector{3, Float64})
                addcost!(prob, SimpleError2{SVector{6, Float64}, SVector{3, Float64}}(meas, camind, landmarkind))
            end
        end
    end

    # Perturb variables slightly
    for ind in eachindex(prob.variables)
        if prob.variables[ind] isa SVector{3, Float64}
            prob.variables[ind] = prob.variables[ind]::SVector{3, Float64} + randn(rng, SVector{3, Float64}) * 0.001
        else
            prob.variables[ind] = prob.variables[ind]::SVector{6, Float64} + randn(rng, SVector{6, Float64}) * 0.001
        end
    end

    return prob
end

function make_synthetic_bam(ncams::Int, npnts::Int=ncams * 5, propvisible::Float64=0.3; rng=MersenneTwister(42 + ncams))
    nobs = 0
    cams_indices = Int[]
    pnts_indices = Int[]

    visibility = abs.(repeat(vec(1:ncams), outer=(1, npnts)) .- transpose(LinRange(2, ncams - 1, npnts)))
    visibility = visibility .<= sort(vec(visibility))[Int(ceil(length(visibility) * propvisible))]
    for c in 1:ncams, p in 1:npnts
        if visibility[c, p]
            push!(cams_indices, c)
            push!(pnts_indices, p)
            nobs += 1
        end
    end

    x0 = randn(rng, 3 * npnts + 9 * ncams)
    for c in 1:ncams
        offset = 3 * npnts + 9 * (c - 1)
        x0[offset + 7] = 0.0 # k1
        x0[offset + 8] = 0.0 # k2
        x0[offset + 9] = 500.0 # f
    end

    pt2d = randn(rng, 2 * nobs)

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

function create_bundle_adjustment_problem()
    ProblemDefinition(
        "Sparse Bundle Adjustment",
        :large_sparse,
        Any[4, 6, 10, 16, 25, 40, 64, 100, 160, 256],
        sz -> begin
            if sz isa String
                bam_model = BundleAdjustmentModel(sz)
                start_bam_x0 = copy(bam_model.meta.x0)
                rx_bam = zeros(Float64, bam_model.nls_meta.nequ)
                vals_bam = zeros(Float64, bam_model.nls_meta.nnzj)
                m_bam = ModelDefinition(
                    "BundleAdjustmentModels",
                    bam_model,
                    () -> begin
                        NLPModels.residual!(bam_model, bam_model.meta.x0, rx_bam)
                        0.5 * dot(rx_bam, rx_bam)
                    end,
                    () -> begin
                        NLPModels.residual!(bam_model, bam_model.meta.x0, rx_bam)
                        NLPModels.jac_coord_residual!(bam_model, bam_model.meta.x0, vals_bam)
                        (0.5 * dot(rx_bam, rx_bam), vals_bam)
                    end,
                    () -> copyto!(bam_model.meta.x0, start_bam_x0)
                )
                return [m_bam]
            else
                ncams = Int(sz)
                npts = ncams * 5
                nlls_prob = generate_synthetic_ba(ncams, npts)
                start_vars = copy(nlls_prob.variables)
                f, fdf!, _, H_csc = NLLSModel.optimvars(nlls_prob)
                g = zeros(Float64, size(H_csc, 1))
                H = deepcopy(H_csc)

                m_nlls = ModelDefinition(
                    "NLLSModel",
                    nlls_prob,
                    () -> f(nlls_prob.variables),
                    () -> (fdf!(g, H, nlls_prob.variables), H),
                    () -> copyto!(nlls_prob.variables, start_vars)
                )

                bam_model = make_synthetic_bam(ncams, npts)
                start_bam_x0 = copy(bam_model.meta.x0)
                rx_bam = zeros(Float64, bam_model.nls_meta.nequ)
                vals_bam = zeros(Float64, bam_model.nls_meta.nnzj)

                m_bam = ModelDefinition(
                    "BundleAdjustmentModels",
                    bam_model,
                    () -> begin
                        NLPModels.residual!(bam_model, bam_model.meta.x0, rx_bam)
                        0.5 * dot(rx_bam, rx_bam)
                    end,
                    () -> begin
                        NLPModels.residual!(bam_model, bam_model.meta.x0, rx_bam)
                        NLPModels.jac_coord_residual!(bam_model, bam_model.meta.x0, vals_bam)
                        (0.5 * dot(rx_bam, rx_bam), vals_bam)
                    end,
                    () -> copyto!(bam_model.meta.x0, start_bam_x0)
                )
                return [m_nlls, m_bam]
            end
        end,
        [
            OptimizerDefinition("SecondOrderOptimization (Sparse LM)", (m; kwargs...) -> optimize_soo(m; method=:lm, linsolver=:ldl, kwargs...)),
            OptimizerDefinition("SecondOrderOptimization (Sparse Dogleg)", (m; kwargs...) -> optimize_soo(m; method=:dogleg, linsolver=:ldl, kwargs...)),
            OptimizerDefinition("JSOSolvers (trunk)", (m; kwargs...) -> optimize_jsosolvers(m; solver=:trunk, kwargs...)),
            OptimizerDefinition("Ipopt", (m; kwargs...) -> optimize_ipopt(m; kwargs...)),
            OptimizerDefinition("MadNLP", (m; kwargs...) -> optimize_madnlp(m; kwargs...))
        ],
        "Cameras Ncam"
    )
end
