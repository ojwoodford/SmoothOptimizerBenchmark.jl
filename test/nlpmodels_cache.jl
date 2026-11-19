using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "NLPModels Evaluation Recomputation and Cache Invalidation" begin
    prob = create_rosenbrock_sparse_problem()
    models = prob.generate_models(16)
    nlp_m = only(filter(m -> m.name == "JuMP", models))
    nls = nlp_m.model

    # Ensure cost evaluation computes finite cost
    cost1 = nlp_m.eval_cost()
    @test isfinite(cost1)

    # reset_nlp_cache! sets last_x back to NaN
    reset_nlp_cache!(nls)
    if hasproperty(nls, :ceval) && hasproperty(nls.ceval, :backend)
        @test any(isnan, nls.ceval.backend.last_x)
    end

    # eval_cost recomputes and returns consistent cost
    cost2 = nlp_m.eval_cost()
    @test isapprox(cost1, cost2)

    # run_model_benchmarks accurately measures recomputed cost
    res = run_model_benchmarks([nlp_m]; samples=3)
    @test res[nlp_m.name].cost_time_ns > 0
end
