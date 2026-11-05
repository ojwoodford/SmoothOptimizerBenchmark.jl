# Bundle Adjustment Problem (Large Sparse, from Gist d2d75b)
using Static, StaticArrays, LinearAlgebra, Random
using NLLSModels, BundleAdjustmentModels, CaNNOLeS, SecondOrderOptimization

NLLSModels.generatemeasurement(pose::SVector{6, T}, X::SVector{3, U}) where {T, U} =
    SVector(dot(@inbounds(view(pose, StaticArrays.SUnitRange(1, 3))), X), dot(@inbounds(view(pose, StaticArrays.SUnitRange(4, 6))), X))

function generate_synthetic_ba(ncameras::Int, nlandmarks::Int=ncameras * 5, propvisible::Float64=0.3)
    rng = MersenneTwister(42 + ncameras)
    prob = NLLSProblem(Union{SVector{6, Float64}, SVector{3, Float64}}, SimpleError2{2, Float64, SVector{6, Float64}, SVector{3, Float64}})

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
        [10, 20],
        sz -> begin
            if sz isa String
                # Dataset name from BAM
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
                    "NLLSModels (Synthetic Sparse)",
                    nlls_prob,
                    () -> NLLSModels.cost(nlls_prob),
                    () -> (NLLSModels.cost(nlls_prob), nothing),
                    () -> copyto!(nlls_prob.variables, start_vars)
                )
                return [m_nlls]
            end
        end,
        [
            OptimizerDefinition("SecondOrderOptimization (Sparse LM)", model_def -> begin
                prob = deepcopy(model_def.model isa NLLSProblem ? model_def.model : generate_synthetic_ba(10, 50))
                opt = OptimizationOptions(iterator = :levenbergmarquardt, linsolver = :ldl)
                _, res = SecondOrderOptimization.optimize!(prob, opt)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
            end),
            OptimizerDefinition("SecondOrderOptimization (Sparse Dogleg)", model_def -> begin
                prob = deepcopy(model_def.model isa NLLSProblem ? model_def.model : generate_synthetic_ba(10, 50))
                opt = OptimizationOptions(iterator = :dogleg, linsolver = :ldl)
                _, res = SecondOrderOptimization.optimize!(prob, opt)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
            end),
            OptimizerDefinition("SecondOrderOptimization (Landmarks singles)", model_def -> begin
                prob = deepcopy(model_def.model isa NLLSProblem ? model_def.model : generate_synthetic_ba(10, 50))
                opt = OptimizationOptions(iterator = :levenbergmarquardt)
                start_c = NLLSModels.cost(prob)
                for j in eachindex(prob.variables)
                    if prob.variables[j] isa SVector{3, Float64}
                        f_j, fdf_j!, x0_j, H_j = NLLSModels.optimvars(prob, j)
                        x_opt, _ = SecondOrderOptimization.optimize!(f_j, fdf_j!, x0_j, opt; H=H_j)
                        prob.variables[j] = x_opt
                    end
                end
                end_c = NLLSModels.cost(prob)
                return OptimizerResult(0.0, 0, 0, 1, start_c, end_c, true)
            end),
            OptimizerDefinition("CaNNOLeS", model_def -> begin
                # Can run directly on BundleAdjustmentModel or fallback
                bam = model_def.model isa BundleAdjustmentModel ? model_def.model : BundleAdjustmentModel("problem-49-7776")
                start_c = NLPModels.obj(bam, bam.meta.x0)
                stats = cannoles(bam, method=:Newton_noFHess, max_iter=5, max_time=10.0)
                return OptimizerResult(0.0, 0, 0, stats.iter, start_c, stats.objective, stats.status == :first_order)
            end)
        ]
    )
end
