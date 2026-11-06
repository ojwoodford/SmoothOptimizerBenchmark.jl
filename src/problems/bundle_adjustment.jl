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

function create_bundle_adjustment_problem()
    ProblemDefinition(
        "Sparse Bundle Adjustment",
        :large_sparse,
        Any[4, 6, 10, 16, 25, 40, 64, 100, 160, 256],
        sz -> begin
            if sz isa String
                bam_model = BundleAdjustmentModel(sz)
                x0_bam = copy(bam_model.meta.x0)
                m_bam = ModelDefinition(
                    "BundleAdjustmentModels",
                    bam_model,
                    () -> NLPModels.obj(bam_model, x0_bam),
                    () -> (NLPModels.obj(bam_model, x0_bam), nothing),
                    () -> copyto!(bam_model.meta.x0, x0_bam)
                )
                return [m_bam]
            else
                ncams = Int(sz)
                npts = ncams * 5
                nlls_prob = generate_synthetic_ba(ncams, npts)
                start_vars = copy(nlls_prob.variables)

                m_nlls = ModelDefinition(
                    "NLLSModel (Synthetic Sparse)",
                    nlls_prob,
                    () -> NLLSModel.cost(nlls_prob),
                    () -> (NLLSModel.cost(nlls_prob), nothing),
                    () -> copyto!(nlls_prob.variables, start_vars)
                )
                return [m_nlls]
            end
        end,
        [
            OptimizerDefinition("SecondOrderOptimization (Sparse LM)", m -> optimize_soo(m; method=:lm, linsolver=:ldl)),
            OptimizerDefinition("SecondOrderOptimization (Sparse Dogleg)", m -> optimize_soo(m; method=:dogleg, linsolver=:ldl)),
            OptimizerDefinition("JSOSolvers (trunk)", m -> optimize_jsosolvers(m; solver=:trunk)),
            OptimizerDefinition("Ipopt", m -> optimize_ipopt(m))
        ],
        "Cameras Ncam"
    )
end
