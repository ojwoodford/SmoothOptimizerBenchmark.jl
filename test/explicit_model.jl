using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# The model every row of every problem runs on, at the problem's smallest size, from the pairing table (IND1): each
# package's native model, else the Standalone model. Model name => the rows that run on it
const PAIRED_MODELS = Dict(
    "Sparse Multi-dimensional Rosenbrock" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel" => ["SecondOrderOptimization"],
        "Standalone (Sparse)" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Exponential Curve Fitting" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel (Static)" => ["SecondOrderOptimization"],
        "Standalone" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Robust Exponential Curve Fitting" => Dict(
        "JuMP (fudged)" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS (fudged)"],
        "NLLSModel (Static)" => ["SecondOrderOptimization"],
        "Standalone (fudged)" => ["LeastSquaresOptim (Dogleg, fudged)", "LeastSquaresOptim (LM, fudged)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM, fudged)", "NonlinearSolve (TrustRegion, fudged)"],
    ),
    "Ill-Conditioned Polynomial Fitting" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel" => ["SecondOrderOptimization"],
        "Standalone" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Sparse Conditioning Sweep" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel (Sparse)" => ["SecondOrderOptimization"],
        "Standalone (Sparse)" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Dense Conditioning Sweep" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel" => ["SecondOrderOptimization"],
        "Standalone" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Dense Affine Alignment" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel" => ["SecondOrderOptimization"],
        "Standalone" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Dense Multi-dimensional Rosenbrock" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel" => ["SecondOrderOptimization"],
        "Standalone" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Multilateration" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel (Static)" => ["SecondOrderOptimization"],
        "Standalone" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Nonlinear 3D Pose Chain" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel (Sparse)" => ["SecondOrderOptimization"],
        "Standalone (Sparse)" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "1D ODE Boundary Value Problem" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel (Sparse)" => ["SecondOrderOptimization"],
        "Standalone (Sparse)" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Robust Procrustes on SO(d)" => Dict(
        "Manifolds" => ["Manopt (LevenbergMarquardt)"],
        "NLLSModel (Specialized)" => ["SecondOrderOptimization"],
    ),
    "Sparse Bundle Adjustment" => Dict(
        "BundleAdjustmentModels" => ["CaNNOLeS", "JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP"],
        "NLLSModel" => ["SecondOrderOptimization"],
    ),
)

# The rows of a problem grouped by the model each resolves to, at size `sz`
function paired_models(prob, sz)
    models = prob.generate_models(sz)
    groups = Dict{String, Vector{String}}()
    for o in prob.compatible_optimizers
        push!(get!(groups, SmoothOptimizerBenchmark.resolve_optimizer_model(o, models).name, String[]), o.name)
    end
    return Dict(k => sort(v) for (k, v) in groups)
end
# The pin with each list sorted, so that the comparison does not depend on the order of a problem's rows (IND8)
pinned_models(name) = Dict(k => sort(v) for (k, v) in PAIRED_MODELS[name])

@testset "An explicit model for a row (P2a)" begin
    SB = SmoothOptimizerBenchmark
    prob = create_curve_fitting_problem()
    models = prob.generate_models(64)
    resolve = SB.resolve_optimizer_model
    m_nlls = only(filter(m -> m.name == "NLLSModel (Static)", models))
    m_sa = only(filter(m -> m.name == "Standalone", models))
    f = (m; kwargs...) -> optimize_soo(m; method=:lm, kwargs...)
    # The two-argument constructor sets no model; the pairing table then decides
    plain = OptimizerDefinition("SecondOrderOptimization (LM)", f)
    @test plain.model_name === nothing
    @test resolve(plain, models) === m_nlls
    # A model name wins over the pairing table
    pinned = OptimizerDefinition("SecondOrderOptimization (LM)", f, "Standalone")
    @test resolve(pinned, models) === m_sa
    @test pinned.optimize(resolve(pinned, models)).status === :ok
    # A name no model has is an ArgumentError naming the row and the models
    missing_model = OptimizerDefinition("SecondOrderOptimization (LM)", f, "No such model")
    err = try resolve(missing_model, models); nothing catch e; e end
    @test err isa ArgumentError
    @test occursin("SecondOrderOptimization (LM)", err.msg) && occursin("No such model", err.msg)
    @test occursin("NLLSModel (Static)", err.msg) && occursin("Standalone", err.msg)
    # No row sets a model name (P2's control row went in IND4c): every row is paired by its package
    @test isempty([o.name for p in problems for o in p.compatible_optimizers if o.model_name !== nothing])

    # IND1: the pairing table. A row's package is the part of its name before " ("
    @test SB.row_package("SecondOrderOptimization (LM, tall)") == "SecondOrderOptimization"
    @test SB.row_package("Ipopt") == "Ipopt"
    @test SB.row_package("CaNNOLeS (fudged)") == "CaNNOLeS"
    # A package missing from the table is an ArgumentError, not a fallback
    stranger = OptimizerDefinition("NoSuchPackage (LM)", f)
    err = try resolve(stranger, models); nothing catch e; e end
    @test err isa ArgumentError && occursin("NoSuchPackage", err.msg) && occursin("pairing table", err.msg)
    # A row with neither a native model nor a Standalone model on the problem is an ArgumentError
    err = try resolve(OptimizerDefinition("Optim (Newton)", f), [m_nlls]); nothing catch e; e end
    @test err isa ArgumentError && occursin("Optim (Newton)", err.msg)
    # The standard model, by exact name; none is an ArgumentError
    @test get_standard_optimizer_model(models) === m_sa
    @test_throws ArgumentError get_standard_optimizer_model([m_nlls])

    # Every row of every problem, at the smallest size
    @test Set(keys(PAIRED_MODELS)) == Set(p.name for p in problems)
    for p in problems
        @test paired_models(p, first(p.default_sizes)) == pinned_models(p.name)
    end
    # IND4: one SecondOrderOptimization row per problem, named for the package alone, from the problem's hard-coded
    # configuration: the five choices NLLSModel's recommender made at the problem's largest size
    for p in problems
        soo = filter(o -> SB.row_package(o.name) == "SecondOrderOptimization", p.compatible_optimizers)
        @test [o.name for o in soo] == ["SecondOrderOptimization"]
    end
    configs = [SB.AFFINE_ALIGNMENT_SOO, SB.BUNDLE_ADJUSTMENT_SOO, SB.CURVE_FITTING_SOO, SB.DENSE_CONDITIONING_SOO, SB.MULTILATERATION_SOO, SB.ODE_BVP_SOO,
               SB.POLYNOMIAL_FITTING_SOO, SB.POSE_CHAIN_SOO, SB.ROBUST_CURVE_FITTING_SOO, SB.ROBUST_PROCRUSTES_SOO,
               SB.ROSENBROCK_DENSE_SOO, SB.ROSENBROCK_SPARSE_SOO, SB.SPARSE_CONDITIONING_SOO]
    @test all(c -> keys(c) == (:iterator, :linsolver, :formulation, :reduction, :storage), configs)
    @test SB.soo_optimizer(SB.POSE_CHAIN_SOO).name == "SecondOrderOptimization"
    @test_throws MethodError SB.soo_optimizer((; iterator = :dogleg))

    # The JuMP model is built at every size (decision 18: no build was near its limits, IND3), so the map is the same at
    # the largest size: sparse Rosenbrock's, the largest JuMP model
    sr = create_rosenbrock_sparse_problem()
    @test paired_models(sr, last(sr.default_sizes)) == pinned_models(sr.name)
end
