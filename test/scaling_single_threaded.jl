using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# Moved here from scaling_markdown_plotting.jl (ET4): the single-threaded table's header records numthreads = 1 beside
# Julia's own thread count, which tests something only when Julia has more than one thread (the threaded group)
@testset "Scaling Benchmark: the single-threaded table" begin
    prob = create_rosenbrock_sparse_problem()
    # The single-threaded table: its own folder under the data folder, 1 thread in its header, ignored when the
    # threaded folder is loaded
    @test dirname(SINGLE_THREADED_DATA_DIR) == DEFAULT_DATA_DIR
    @test dirname(SINGLE_THREADED_PLOTS_DIR) == DEFAULT_PLOTS_DIR
    tmp_root = mktempdir()
    st_dir = joinpath(tmp_root, "single_threaded")
    st_res = run_scaling_benchmark(prob; sizes=Any[4], samples=1, data_dir=st_dir, numthreads=1, blas_threads=1)
    @test occursin("**Threads**: NLLSModel numthreads=1, Julia threads=$(Threads.nthreads()), BLAS threads=1", read(joinpath(st_dir, "rosenbrock_sparse.md"), String))
    # The threaded folder's file: the result in hand written with the package's own functions (ET5), not a second run
    sr = only(st_res.size_results)
    threaded_md = joinpath(tmp_root, "rosenbrock_sparse.md")
    init_problem_markdown(threaded_md, st_res.problem, st_res.category, st_res.size_metric_name, sr.target_model; derivatives=prob.derivatives)
    for (name, mr) in sr.model_results
        append_model_evaluation(threaded_md, sr.size, name, mr)
    end
    init_optimizer_section(threaded_md, sr.target_model)
    for (name, r) in sr.optimizer_results
        append_optimizer_evaluation(threaded_md, sr.size, name, r)
    end
    # IND7: the multi-threaded table passes no blas_threads, and its header records the BLAS count in force
    BLAS = SmoothOptimizerBenchmark.BLAS
    blas0 = BLAS.get_num_threads()
    BLAS.set_num_threads(3)
    mt_dir = joinpath(tmp_root, "multi")
    run_scaling_benchmark(prob; sizes=Any[4], samples=1, data_dir=mt_dir)
    @test occursin("Julia threads=$(Threads.nthreads()), BLAS threads=3", read(joinpath(mt_dir, "rosenbrock_sparse.md"), String))
    BLAS.set_num_threads(blas0)
    loaded_all = load_all_problem_markdown(tmp_root)
    @test length(loaded_all) == 1
    @test only(loaded_all).problem == prob.name
    st_plot = plot_optimizer_scaling(st_res; outdir=joinpath(tmp_root, "plots"), title_suffix=" (1 thread)")
    @test isfile(st_plot)
    set_benchmark_threads!()
    rm(tmp_root; recursive=true, force=true)
end
