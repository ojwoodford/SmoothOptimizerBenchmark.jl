using Test
using SmoothOptimizerBenchmark

@testset "SmoothOptimizerBenchmark Suite" begin
    problems = get_all_problems()
    # 7 distinct problems (6 Euclidean non-manifold + 1 manifold; 2D Rosenbrock subsumed by sparse Rosenbrock at n=2)
    @test length(problems) == 7

    @testset "Problem Definition & >=10 Problem Sizes" begin
        for prob in problems
            @test !isempty(prob.name)
            @test prob.category in (:small_dense, :medium_dense, :large_dense, :large_sparse, :manifold)
            @test length(prob.default_sizes) >= 10
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

    @testset "Quick Single-Size Benchmark" begin
        for prob in problems
            sz = first(prob.default_sizes)
            res = run_problem_benchmark(prob, sz; samples=1, verbose=false)
            @test res.problem == prob.name
            @test res.size == sz
            @test !isempty(res.model_results)
            @test !isempty(res.best_model)
            @test !isempty(res.tier1_optimizer_results)
            @test haskey(res.model_results, res.best_model)

            # Harness must run optimizers on the fastest model (minimum linsys_time_ns)
            min_linsys = minimum(r.linsys_time_ns for (name, r) in res.model_results)
            @test res.model_results[res.best_model].linsys_time_ns == min_linsys
        end
    end

    @testset "Scaling Benchmark, JSON Serialization & Plotting" begin
        prob = create_rosenbrock_sparse_problem()
        test_sizes = Any[2, 5]
        scaling_res = run_scaling_benchmark(prob; sizes=test_sizes, samples=1, verbose=false)

        @test scaling_res.problem == prob.name
        @test length(scaling_res.size_results) == 2
        @test scaling_res.sizes == test_sizes

        # Test JSON serialization roundtrip
        tmp_json = joinpath(tempdir(), "test_bench_results.json")
        save_benchmark_results([scaling_res], tmp_json)
        @test isfile(tmp_json)

        loaded = load_benchmark_results(tmp_json)
        @test length(loaded) == 1
        @test loaded[1].problem == prob.name
        @test loaded[1].sizes == test_sizes
        @test length(loaded[1].size_results) == 2
        rm(tmp_json; force=true)

        # Test Plotting Pipeline
        tmp_plot_dir = joinpath(tempdir(), "test_plots")
        m_plot = plot_model_scaling(scaling_res; outdir=tmp_plot_dir)
        o_plot = plot_optimizer_scaling(scaling_res; outdir=tmp_plot_dir)
        @test isfile(m_plot)
        @test isfile(o_plot)
        rm(tmp_plot_dir; recursive=true, force=true)
    end
end
