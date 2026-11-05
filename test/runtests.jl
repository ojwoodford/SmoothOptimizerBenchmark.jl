using Test
using SmoothOptimizerBenchmark

@testset "SmoothOptimizerBenchmark Suite" begin
    problems = get_all_problems()
    @test length(problems) == 8

    @testset "Problem Definition & Model Generation" begin
        for prob in problems
            @test !isempty(prob.name)
            @test prob.category in (:small_dense, :large_dense, :large_sparse, :manifold)
            @test !isempty(prob.default_sizes)
            @test !isempty(prob.compatible_optimizers)

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

                # Test reset
                m.reset!()
            end
        end
    end

    @testset "Two-Phase Problem Benchmark (Quick)" begin
        for prob in problems
            sz = first(prob.default_sizes)
            res = run_problem_benchmark(prob, sz; samples=2, verbose=true)
            @test res.problem == prob.name
            @test res.size == sz
            @test !isempty(res.model_results)
            @test !isempty(res.best_model)
            @test !isempty(res.optimizer_results)

            # Check that best model is one of the generated models
            @test haskey(res.model_results, res.best_model)
        end
    end
end
