using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Thread counts and NLLSModel threading thresholds (M17, F4)" begin
    @test_throws ArgumentError set_benchmark_threads!(; numthreads=Threads.nthreads() + 1)
    t = set_benchmark_threads!(; numthreads=1, blas_threads=1)
    @test t == (; numthreads=1, julia_threads=Threads.nthreads(), blas_threads=1)
    @test benchmark_numthreads() === SmoothOptimizerBenchmark.static(1)
    # IND7: without blas_threads, BLAS is left at the count it has (the multi-threaded table)
    BLAS = SmoothOptimizerBenchmark.BLAS
    blas0 = BLAS.get_num_threads()
    BLAS.set_num_threads(2)
    @test set_benchmark_threads!(; numthreads=1).blas_threads == 2
    @test BLAS.get_num_threads() == 2
    @test_throws ArgumentError set_benchmark_threads!(; blas_threads=0)
    BLAS.set_num_threads(blas0)

    # min_work and min_work_cost reach NLLSModel: forcing threading on or off changes nothing but the schedule
    set_benchmark_threads!()
    cf = first(filter(m -> occursin("nllsmodel", lowercase(m.name)), create_curve_fitting_problem().generate_models(256)))
    r_default = optimize_soo(cf; method=:lm)
    r_forced = optimize_soo(cf; method=:lm, min_work=0, min_work_cost=0)
    r_serial = optimize_soo(cf; method=:lm, min_work=typemax(Int), min_work_cost=typemax(Int))
    @test r_forced.status === :ok && r_serial.status === :ok
    @test r_forced.final_cost ≈ r_default.final_cost rtol=1e-10
    @test r_serial.final_cost ≈ r_default.final_cost rtol=1e-10
    @test_throws TypeError optimize_soo(cf; method=:lm, min_work="a lot")   # forwarded to optimize!, which types it
end
