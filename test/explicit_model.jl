using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# The model every row of every problem runs on, at the problem's smallest size, from the pairing table (IND1): each
# package's native model, else the Standalone model. Model name => the rows that run on it
const PAIRED_MODELS = Dict(
    "Sparse Multi-dimensional Rosenbrock" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel" => ["SecondOrderOptimization (Dogleg)", "SecondOrderOptimization (LM)", "SecondOrderOptimization (Gauss-Newton)", "SecondOrderOptimization (LM, tall)", "SecondOrderOptimization (LM, tall, LSMR)"],
        "Standalone (Sparse)" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Exponential Curve Fitting" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel (Static)" => ["SecondOrderOptimization (Dogleg)", "SecondOrderOptimization (LM)", "SecondOrderOptimization (Gauss-Newton)", "SecondOrderOptimization (LM, tall)"],
        "Standalone" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Robust Exponential Curve Fitting" => Dict(
        "NLLSModel (Static)" => ["SecondOrderOptimization (Dogleg)", "SecondOrderOptimization (LM)", "SecondOrderOptimization (Gauss-Newton)", "SecondOrderOptimization (LM, tall)"],
        "JuMP (fudged)" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS (fudged)"],
        "Standalone (fudged)" => ["SecondOrderOptimization (LM, fudged)", "LeastSquaresOptim (Dogleg, fudged)", "LeastSquaresOptim (LM, fudged)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM, fudged)", "NonlinearSolve (TrustRegion, fudged)"],
    ),
    "Ill-Conditioned Polynomial Fitting" => Dict(
        "NLLSModel (Static)" => ["SecondOrderOptimization (LM)", "SecondOrderOptimization (LM, tall)"],
        "Standalone" => ["LeastSquaresOptim (LM)", "LeastSquaresOptim (Dogleg)"],
    ),
    "Dense Affine Alignment" => Dict(
        "NLLSModel" => ["SecondOrderOptimization (Dogleg)", "SecondOrderOptimization (LM)", "SecondOrderOptimization (Gauss-Newton)"],
        "Standalone" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)", "CaNNOLeS"],
    ),
    "Dense Multi-dimensional Rosenbrock" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel" => ["SecondOrderOptimization (Dogleg)", "SecondOrderOptimization (LM)", "SecondOrderOptimization (Gauss-Newton)", "SecondOrderOptimization (LM, tall)"],
        "Standalone" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Multilateration" => Dict(
        "NLLSModel (Static)" => ["SecondOrderOptimization (Dogleg)", "SecondOrderOptimization (LM)", "SecondOrderOptimization (Gauss-Newton)", "SecondOrderOptimization (LM, tall)"],
        "Standalone" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)", "CaNNOLeS"],
    ),
    "Nonlinear 3D Pose Chain" => Dict(
        "NLLSModel (Sparse)" => ["SecondOrderOptimization (Dogleg)", "SecondOrderOptimization (LM)", "SecondOrderOptimization (Gauss-Newton)", "SecondOrderOptimization (LM, tall)", "SecondOrderOptimization (LM, tall, LSMR)"],
        "Standalone (Sparse)" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (Newton)", "JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)", "CaNNOLeS"],
    ),
    "1D ODE Boundary Value Problem" => Dict(
        "JuMP" => ["JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "CaNNOLeS"],
        "NLLSModel (Sparse)" => ["SecondOrderOptimization (Dogleg)", "SecondOrderOptimization (LM)", "SecondOrderOptimization (Gauss-Newton)", "SecondOrderOptimization (LM, tall)"],
        "Standalone (Sparse)" => ["LeastSquaresOptim (Dogleg)", "LeastSquaresOptim (LM)", "Optim (NewtonTrustRegion)", "Optim (Newton)", "NonlinearSolve (LM)", "NonlinearSolve (TrustRegion)"],
    ),
    "Robust Procrustes on SO(d)" => Dict(
        "Manifolds" => ["Manopt (LevenbergMarquardt)"],
        "NLLSModel (Specialized)" => ["SecondOrderOptimization (LM)", "SecondOrderOptimization (LM, tall)", "SecondOrderOptimization (Dogleg)"],
    ),
    "Sparse Bundle Adjustment" => Dict(
        "BundleAdjustmentModels" => ["CaNNOLeS", "JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP"],
        "NLLSModel" => ["SecondOrderOptimization (LM)", "SecondOrderOptimization (Dogleg)", "SecondOrderOptimization (Gauss-Newton)", "SecondOrderOptimization (LM, tall)", "SecondOrderOptimization (LM, tall, LSMR)"],
    ),
)

# The rows of a problem grouped by the model each resolves to, at size `sz`
function paired_models(prob, sz)
    models = prob.generate_models(sz)
    groups = Dict{String, Vector{String}}()
    for o in prob.compatible_optimizers
        push!(get!(groups, SmoothOptimizerBenchmark.resolve_optimizer_model(o, models).name, String[]), o.name)
    end
    return groups
end

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
    # Only P2's control row sets a model name; every other row is paired by its package
    @test [(o.name, o.model_name) for p in problems for o in p.compatible_optimizers if o.model_name !== nothing] ==
        [("SecondOrderOptimization (LM, fudged)", "Standalone (fudged)")]

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
        @test paired_models(p, first(p.default_sizes)) == PAIRED_MODELS[p.name]
    end
    # The JuMP model is built at every size (decision 18: no build was near its limits, IND3), so the map is the same at
    # the largest size: sparse Rosenbrock's, the largest JuMP model
    sr = create_rosenbrock_sparse_problem()
    @test paired_models(sr, last(sr.default_sizes)) == PAIRED_MODELS[sr.name]
end
