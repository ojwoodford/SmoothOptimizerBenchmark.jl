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
    run_scaling_benchmark(prob; sizes=Any[4], samples=1, data_dir=tmp_root)
    st_res = run_scaling_benchmark(prob; sizes=Any[4], samples=1, data_dir=st_dir, numthreads=1, blas_threads=1)
    @test occursin("**Threads**: NLLSModel numthreads=1, Julia threads=$(Threads.nthreads()), BLAS threads=1", read(joinpath(st_dir, "rosenbrock_sparse.md"), String))
    @test length(load_all_problem_markdown(tmp_root)) == 1
    st_plot = plot_optimizer_scaling(st_res; outdir=joinpath(tmp_root, "plots"), title_suffix=" (1 thread)")
    @test isfile(st_plot)
    set_benchmark_threads!()
    rm(tmp_root; recursive=true, force=true)
end
