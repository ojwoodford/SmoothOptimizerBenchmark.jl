using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Scaling Benchmark, Markdown Serialization & Plotting" begin
    prob = create_rosenbrock_sparse_problem()
    test_sizes = Any[4, 8]
    tmp_data_dir = mktempdir()
    scaling_res = run_scaling_benchmark(prob; sizes=test_sizes, samples=1, data_dir=tmp_data_dir)

    @test scaling_res.problem == prob.name
    @test length(scaling_res.size_results) == 2
    @test scaling_res.sizes == test_sizes

    # Verify streaming markdown file exists and round-trips accurately
    streamed_md = joinpath(tmp_data_dir, "rosenbrock_sparse.md")
    @test isfile(streamed_md)
    md_text = read(streamed_md, String)
    @test occursin("**Threads**: NLLSModel numthreads=$(Threads.nthreads()), Julia threads=$(Threads.nthreads()), BLAS threads=$(Threads.nthreads())", md_text)
    @test !occursin("Git Commit: unknown", md_text)
    # Every header records the commit of each sibling package it ran against
    for dep in SmoothOptimizerBenchmark.RECORDED_DEPENDENCIES
        @test occursin(Regex("Dependency Commits\\*\\*: .*\\b$(dep) [0-9a-f]{7,}"), md_text)
    end

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
            @test opt_load.status === opt_orig.status
            @test opt_load.message == SmoothOptimizerBenchmark.table_message(opt_orig.message)
        end
    end
    # D3: BlockLinearSystems is no longer recorded, and a header written before then, which names it, still loads
    @test !occursin("BlockLinearSystems", md_text)
    old_md = joinpath(tmp_data_dir, "old_header", "rosenbrock_sparse.md")
    mkpath(dirname(old_md))
    write(old_md, replace(md_text, "**Dependency Commits**: " => "**Dependency Commits**: BlockLinearSystems d38552c, "))
    @test occursin("BlockLinearSystems d38552c", read(old_md, String))
    loaded_old = load_problem_markdown(old_md)
    @test loaded_old.problem == loaded.problem
    @test loaded_old.sizes == loaded.sizes
    @test loaded_old.category == loaded.category
    for (sr_new, sr_old) in zip(loaded.size_results, loaded_old.size_results)
        @test keys(sr_old.optimizer_results) == keys(sr_new.optimizer_results)
        @test keys(sr_old.model_results) == keys(sr_new.model_results)
    end
    # DM12: the header records the problem's derivative mode, after the target model; a file without the line still loads
    @test occursin("- **Optimizer Target Model**: Standalone (Sparse)\n- **Derivatives**: autodiff\n", md_text)
    no_mode_md = joinpath(tmp_data_dir, "no_mode", "rosenbrock_sparse.md")
    mkpath(dirname(no_mode_md))
    write(no_mode_md, replace(md_text, "- **Derivatives**: autodiff\n" => ""))
    loaded_no_mode = load_problem_markdown(no_mode_md)
    @test !occursin("Derivatives", read(no_mode_md, String))
    @test loaded_no_mode.sizes == loaded.sizes
    for (sr_new, sr_old) in zip(loaded.size_results, loaded_no_mode.size_results)
        @test keys(sr_old.optimizer_results) == keys(sr_new.optimizer_results)
        @test keys(sr_old.model_results) == keys(sr_new.model_results)
    end
    @test_throws ArgumentError init_problem_markdown(joinpath(tmp_data_dir, "x.md"), "P", :small_dense, "n", "Standalone"; derivatives=:numeric)
    rm(tmp_data_dir; recursive=true, force=true)

    # Test Plotting Pipeline
    tmp_plot_dir = mktempdir()
    m_plot = plot_model_scaling(scaling_res; outdir=tmp_plot_dir)
    o_plot = plot_optimizer_scaling(scaling_res; outdir=tmp_plot_dir)
    @test isfile(m_plot)
    @test isfile(o_plot)
    rm(tmp_plot_dir; recursive=true, force=true)

    # The single-threaded table is in scaling_single_threaded.jl (the threaded group)
end
