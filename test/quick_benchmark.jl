using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Quick Single-Size Benchmark" begin
    for prob in problems
        sz = first(prob.default_sizes)
        res = run_problem_benchmark(prob, sz; samples=1)
        @test res.problem == prob.name
        @test res.size == sz
        @test !isempty(res.model_results)
        @test !isempty(res.target_model)
        @test !isempty(res.optimizer_results)
        @test haskey(res.model_results, res.target_model)
    end
end
