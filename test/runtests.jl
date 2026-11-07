using Test
using SmoothOptimizerBenchmark

@testset "SmoothOptimizerBenchmark Suite" begin
    problems = get_all_problems()
    # 7 distinct problems (6 Euclidean non-manifold + 1 manifold)
    @test length(problems) == 7

    @testset "Problem Definition & >=10 Problem Sizes" begin
        for prob in problems
            @test !isempty(prob.name)
            @test prob.category in (:small_dense, :medium_dense, :large_dense, :large_sparse, :manifold)
            @test length(prob.default_sizes) >= 10
            @test !isempty(prob.compatible_optimizers)
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

    @testset "Plot Styling & Unsupported Sparse Solver Handling" begin
        @test SmoothOptimizerBenchmark.model_style("Manifolds")[1] == :darkgoldenrod
        @test SmoothOptimizerBenchmark.optimizer_style("Manopt (LevenbergMarquardt)")[1] == :darkgoldenrod
        @test SmoothOptimizerBenchmark.optimizer_style("CaNNOLeS")[1] == :chocolate
        @test SmoothOptimizerBenchmark.optimizer_style("MadNLP")[1] == :teal
        @test SmoothOptimizerBenchmark.optimizer_style("NonlinearSolve (LM)")[1] == :deeppink

        # Optim NewtonTrustRegion on sparse problem must gracefully return converged=false & NaN time
        sp_prob = create_rosenbrock_sparse_problem()
        sp_models = sp_prob.generate_models(10)
        sp_target = get_standard_optimizer_model(sp_models, sp_prob.category)
        res_ntr = optimize_optim(sp_target; method=:newton_trust_region)
        @test isnan(res_ntr.time_ns)
        @test !res_ntr.converged

        # SOO with maxiters=1 from non-optimal start must report converged=false
        res_soo_1 = optimize_soo(sp_target; method=:lm, maxiters=1)
        @test !res_soo_1.converged
    end

    @testset "Quick Single-Size Benchmark" begin
        for prob in problems
            sz = first(prob.default_sizes)
            res = run_problem_benchmark(prob, sz; samples=1, verbose=false)
            @test res.problem == prob.name
            @test res.size == sz
            @test !isempty(res.model_results)
            @test !isempty(res.target_model)
            @test !isempty(res.optimizer_results)
            @test haskey(res.model_results, res.target_model)
        end
    end

    @testset "Scaling Benchmark, Markdown Serialization & Plotting" begin
        prob = create_rosenbrock_sparse_problem()
        test_sizes = Any[4, 8]
        tmp_data_dir = mktempdir()
        scaling_res = run_scaling_benchmark(prob; sizes=test_sizes, samples=1, data_dir=tmp_data_dir, verbose=false)

        @test scaling_res.problem == prob.name
        @test length(scaling_res.size_results) == 2
        @test scaling_res.sizes == test_sizes

        # Verify streaming markdown file exists and round-trips accurately
        streamed_md = joinpath(tmp_data_dir, "rosenbrock_sparse.md")
        @test isfile(streamed_md)
        md_text = read(streamed_md, String)
        @test !occursin("Git Commit: unknown", md_text)

        loaded = load_problem_markdown(streamed_md)
        @test loaded.problem == prob.name
        @test loaded.sizes == test_sizes
        @test length(loaded.size_results) == 2
        @test loaded.category == scaling_res.category
        @test loaded.size_metric_name == scaling_res.size_metric_name
        for (sr_orig, sr_load) in zip(scaling_res.size_results, loaded.size_results)
            for (opt_name, opt_orig) in sr_orig.optimizer_results
                opt_load = sr_load.optimizer_results[opt_name]
                @test opt_load.converged == opt_orig.converged
                @test opt_load.iterations == opt_orig.iterations
            end
        end
        rm(tmp_data_dir; recursive=true, force=true)

        # Test Plotting Pipeline
        tmp_plot_dir = mktempdir()
        m_plot = plot_model_scaling(scaling_res; outdir=tmp_plot_dir)
        o_plot = plot_optimizer_scaling(scaling_res; outdir=tmp_plot_dir)
        @test isfile(m_plot)
        @test isfile(o_plot)
        rm(tmp_plot_dir; recursive=true, force=true)
    end
end
