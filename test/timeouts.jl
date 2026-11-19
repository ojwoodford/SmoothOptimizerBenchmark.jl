using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# Decision 17 (IND6): a row that times out at one size of a table is recorded as timed out at every larger size of that
# table, "timed out at size N", without being run; sizes are run in increasing order; other rows are unaffected
@testset "A row that times out is not run at larger sizes (IND6)" begin
    SB = SmoothOptimizerBenchmark
    cf = create_curve_fitting_problem()
    calls = Dict{Int, Int}()
    # A stub that times out on every size from 128 points, counting its runs (warm-ups included) by size; it names its
    # model, since its name names no package
    slow = OptimizerDefinition("Slow stub", (m; kwargs...) -> begin
        n = length(m.model.y)
        calls[n] = get(calls, n, 0) + 1
        OptimizerResult(1.0e3, 0, 0, 1, 1.0, 1.0, false; timed_out = n >= 128, message = n >= 128 ? "time limit" : "")
    end, "Standalone")
    lm = only(filter(o -> o.name == "SecondOrderOptimization", cf.compatible_optimizers))
    prob = ProblemDefinition("Timeout stub problem", cf.category, Any[512, 64, 256, 128], cf.generate_models, [slow, lm],
                             cf.size_metric_name; derivatives = cf.derivatives)
    dir = mktempdir()
    res = run_scaling_benchmark(prob; samples = 1, data_dir = dir)
    @test res.sizes == Any[64, 128, 256, 512]
    @test [sr.size for sr in res.size_results] == [64, 128, 256, 512]
    rows(name) = [sr.optimizer_results[name] for sr in res.size_results]
    @test [r.status for r in rows("Slow stub")] == [:not_converged, :timeout, :timeout, :timeout]
    @test rows("Slow stub")[2].message == "time limit"
    @test all(r -> r.message == "timed out at size 128", rows("Slow stub")[3:4])
    @test all(r -> isnan(r.time_ns), rows("Slow stub")[3:4])
    # Run at 64 and 128 (and the warm-ups at the smallest and largest sizes), never timed at 256
    @test !haskey(calls, 256)
    @test get(calls, 512, 0) == 1   # the warm-up only
    @test all(r -> r.status === :ok, rows("SecondOrderOptimization"))
    # The forfeited rows reach the results file
    loaded = load_all_problem_markdown(dir)
    @test only(loaded).size_results[end].optimizer_results["Slow stub"].message == "timed out at size 128"
    rm(dir; recursive = true, force = true)
end
