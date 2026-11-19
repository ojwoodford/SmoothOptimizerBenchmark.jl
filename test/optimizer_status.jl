using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Optimizer status (B3)" begin
    @test_throws ArgumentError OptimizerResult(1.0, 0, 0, 1, 1.0, 0.5, true, :not_converged, "")
    @test_throws ArgumentError OptimizerResult(1.0, 0, 0, 1, 1.0, 0.5, false, :failed, "")
    @test OptimizerResult(1.0, 0, 0, 1, 1.0, 0.5, false; timed_out=true).status === :timeout

    # An adapter that throws is reported as :error with the exception text, not as a bare NaN row
    prob = create_curve_fitting_problem()
    models = prob.generate_models(64)
    target = get_standard_optimizer_model(models)
    # A stub's name names no package, so it names its model (IND1)
    bad = OptimizerDefinition("Broken adapter", (m; kwargs...) -> error("adapter exploded"), "Standalone")
    skip = OptimizerDefinition("Skipping adapter", (m; kwargs...) -> skipped_result("not applicable"), "Standalone")
    good = OptimizerDefinition("SecondOrderOptimization (LM)", (m; kwargs...) -> optimize_nlls_soo(m; method=:lm, kwargs...))
    res = @test_logs (:warn, r"Broken adapter") match_mode=:any run_optimizer_benchmarks([bad, skip, good], target; all_models=models, samples=1)
    @test res["Broken adapter"].status === :error
    @test occursin("adapter exploded", res["Broken adapter"].message)
    @test res["Skipping adapter"].status === :skipped
    @test res["SecondOrderOptimization (LM)"].status === :ok
    @test res["SecondOrderOptimization (LM)"].converged

    # B10: a throw in a later timing sample, after a converged first run, makes the row an :error too
    calls = Ref(0)
    flaky = OptimizerDefinition("Flaky adapter", (m; kwargs...) -> begin
        calls[] += 1
        calls[] >= 3 && error("sample exploded")   # call 1 is the warm-up, call 2 the first timed run
        OptimizerResult(1.0e3, 0, 0, 1, 1.0, 0.5, true)
    end, "Standalone")
    res_flaky = @test_logs (:warn, r"Flaky adapter threw in a timing sample") match_mode=:any run_optimizer_benchmarks([flaky], target; all_models=models, samples=3)
    @test calls[] == 3
    @test res_flaky["Flaky adapter"].status === :error
    @test occursin("sample exploded", res_flaky["Flaky adapter"].message)

    # Result files written before the status column still load
    legacy = joinpath(mktempdir(), "legacy.md")
    write(legacy, """
    # Benchmark Results: Legacy

    - **Category**: small_dense

    | Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
    |:---|:---|---:|---:|---:|---:|---:|:---|
    | 4 | A | 10.0 | 1 | 2 | 3 | 1.0000e-01 | true |
    | 4 | B | NaN | 0 | 0 | 0 | NaN | false |
    """)
    lr = load_problem_markdown(legacy)
    @test lr.size_results[1].optimizer_results["A"].status === :ok
    @test lr.size_results[1].optimizer_results["B"].status === :not_converged
end
