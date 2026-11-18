using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "An explicit model for a row (P2a)" begin
    prob = create_curve_fitting_problem()
    models = prob.generate_models(64)
    target = get_standard_optimizer_model(models, prob.category)
    resolve = SmoothOptimizerBenchmark.resolve_optimizer_model
    m_nlls = only(filter(m -> m.name == "NLLSModel (Static)", models))
    m_sa = only(filter(m -> m.name == "Standalone", models))
    f = (m; kwargs...) -> optimize_soo(m; method=:lm, kwargs...)
    # The two-argument constructor sets no model; the name then decides, as before
    plain = OptimizerDefinition("SecondOrderOptimization (LM)", f)
    @test plain.model_name === nothing
    @test resolve(plain, target, models) === m_nlls
    # A model name wins over a row name that would route elsewhere
    pinned = OptimizerDefinition("SecondOrderOptimization (LM)", f, "Standalone")
    @test resolve(pinned, target, models) === m_sa
    @test pinned.optimize(resolve(pinned, target, models)).status === :ok
    # A name no model has is an ArgumentError naming the row and the models
    missing_model = OptimizerDefinition("SecondOrderOptimization (LM)", f, "No such model")
    err = try resolve(missing_model, target, models); nothing catch e; e end
    @test err isa ArgumentError
    @test occursin("SecondOrderOptimization (LM)", err.msg) && occursin("No such model", err.msg)
    @test occursin("NLLSModel (Static)", err.msg) && occursin("Standalone", err.msg)
    # Only P2's control row sets a model name; every other row is routed by its name, as before
    @test [(o.name, o.model_name) for p in problems for o in p.compatible_optimizers if o.model_name !== nothing] ==
        [("SecondOrderOptimization (LM, fudged)", "Standalone (fudged)")]
end
