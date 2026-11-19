using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Plot Styling & Unsupported Sparse Solver Handling" begin
    @test SmoothOptimizerBenchmark.model_style("Manifolds")[1] == :blue
    # IND3a: the JuMP models keep the colour the "NLPModels (MathOptNLSModel)" models had
    @test SmoothOptimizerBenchmark.model_style("JuMP")[1] == :forestgreen
    @test SmoothOptimizerBenchmark.optimizer_style("Manopt (LevenbergMarquardt)")[1] == :blue
    @test SmoothOptimizerBenchmark.optimizer_style("CaNNOLeS")[1] == :chocolate
    @test SmoothOptimizerBenchmark.optimizer_style("MadNLP")[1] == :teal
    @test SmoothOptimizerBenchmark.optimizer_style("NonlinearSolve (LM)")[1] == :deeppink
    @test SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (LM)") == (:red, :solid, :circle)
    @test SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (Dogleg)") == (:red, :dash, :square)
    @test SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (Sparse LM)") == (:red, :solid, :circle)
    @test SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (Sparse Dogleg)") == (:red, :dash, :square)
    @test SmoothOptimizerBenchmark.optimizer_style("NLLSModel + SecondOrderOptimization (LM)") == (:red, :dot, :star5)
    @test SmoothOptimizerBenchmark.optimizer_style("NLLSModel + SecondOrderOptimization (Dogleg)") == (:red, :dashdot, :star5)
    @test SmoothOptimizerBenchmark.optimizer_style("NLLSModel + SecondOrderOptimization (Sparse LM)") == (:red, :dot, :star5)
    @test SmoothOptimizerBenchmark.optimizer_style("NLLSModel + SecondOrderOptimization (Sparse Dogleg)") == (:red, :dashdot, :star5)
    # B11: the tall row has a line of its own; the polynomial fit has an explicit slug
    tall_style = SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (LM, tall)")
    @test tall_style == (:red, :dashdotdot, :utriangle)
    @test tall_style != SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (LM)")
    # T4: the LSMR row has the tall row's line and a marker of its own
    lsmr_style = SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (LM, tall, LSMR)")
    @test lsmr_style == (:red, :dashdotdot, :dtriangle)
    @test lsmr_style != tall_style
    @test problem_slug(create_polynomial_fitting_problem().name) == "polynomial_fitting"
    @test length(unique(problem_slug(p.name) for p in problems)) == length(problems)

    # Optim NewtonTrustRegion on sparse problem must gracefully return converged=false & NaN time
    sp_prob = create_rosenbrock_sparse_problem()
    sp_models = sp_prob.generate_models(10)
    sp_target = get_standard_optimizer_model(sp_models, sp_prob.category)
    res_ntr = optimize_optim(sp_target; method=:newton_trust_region)
    @test isnan(res_ntr.time_ns)
    @test !res_ntr.converged
    @test res_ntr.status === :skipped
    @test !isempty(res_ntr.message)

    # SOO with maxiters=1 from non-optimal start must report converged=false
    res_soo_1 = optimize_soo(sp_target; method=:lm, maxiters=1)
    @test !res_soo_1.converged
    @test res_soo_1.status === :not_converged
    @test occursin("max_iters", res_soo_1.message)
end
