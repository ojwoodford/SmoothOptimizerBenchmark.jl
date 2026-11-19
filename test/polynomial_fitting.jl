using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Ill-conditioned polynomial fit: excess cost over the reference minimum (N3, N4)" begin
    prob = create_polynomial_fitting_problem()
    sz = first(prob.default_sizes)
    ref = SmoothOptimizerBenchmark.polyfit_reference(sz)
    models = prob.generate_models(sz)
    target = get_standard_optimizer_model(models)
    res = run_optimizer_benchmarks(prob.compatible_optimizers, target; all_models=models, samples=1)
    # IND4c: the one SecondOrderOptimization row is NLLSModel's recommendation, the normal equations; the Jacobian path,
    # which was the "LM, tall" row, is the adapter's formulation = :jacobian, called directly on the same model
    r_norm = res["SecondOrderOptimization"]
    @test SmoothOptimizerBenchmark.POLYNOMIAL_FITTING_SOO.formulation === :hessian
    m_nlls = only(filter(m -> m.name == "NLLSModel (Static)", models))
    x_tall = Float64[]
    r_tall = optimize_soo(m_nlls; method=:lm, formulation=:jacobian, solution=x_tall)
    tall_excess = SmoothOptimizerBenchmark.polyfit_excess_cost(sz, x_tall)
    @test all(r -> !isnan(r.excess_cost), values(res))
    # The Jacobian path reaches the extended-precision minimum; the normal equations stop well above it
    @test 0 <= tall_excess <= 1e-12 * Float64(ref.minimum)
    @test r_norm.excess_cost > 1e-8 * Float64(ref.minimum)
    @test r_tall.iterations < r_norm.iterations
    # The excess survives the round trip through the results file
    dir = mktempdir()
    f = joinpath(dir, "polyfit.md")
    init_problem_markdown(f, prob.name, prob.category, prob.size_metric_name, target.name; derivatives=prob.derivatives)
    init_optimizer_section(f, target.name)
    for (k, r) in res
        append_optimizer_evaluation(f, sz, k, r)
    end
    loaded = load_problem_markdown(f).size_results[1].optimizer_results
    for (k, r) in res
        @test loaded[k].excess_cost ≈ r.excess_cost rtol=1e-3
        @test loaded[k].status === r.status
    end
end
