using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Problem Definition & >=10 Problem Sizes" begin
    for prob in problems
        @test !isempty(prob.name)
        @test prob.category in (:small_dense, :medium_dense, :large_dense, :large_sparse, :manifold)
        @test length(prob.default_sizes) >= 10
        @test !isempty(prob.compatible_optimizers)
        @test any(opt -> occursin("secondorder", lowercase(opt.name)), prob.compatible_optimizers)
        @test !isempty(prob.size_metric_name)

        # Test model generation on smallest size
        sz = first(prob.default_sizes)
        models = prob.generate_models(sz)
        @test !isempty(models)

        for m in models
            @test !isempty(m.name)
            # Test cost evaluation
            c = m.eval_cost()
            @test c isa Real
            @test !isnan(c)

            # Test linear system / derivative evaluation
            c_ls, ls = m.eval_cost_and_linear_system()
            @test c_ls isa Real
            @test !isnan(c_ls)
            @test isapprox(c, c_ls; rtol=1e-10, atol=1e-12)

            # Test reset
            m.reset!()
        end
    end
end
