using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Every SecondOrderOptimization termination mask has a name" begin
    SOO = SmoothOptimizerBenchmark.SecondOrderOptimization
    exported = Set(getfield(SOO, n) for n in names(SOO) if startswith(String(n), "TERMINATION_"))
    named = Set(mask for (_, mask) in SmoothOptimizerBenchmark.SOO_TERMINATION_NAMES)
    @test named == exported
    @test allunique(first.(SmoothOptimizerBenchmark.SOO_TERMINATION_NAMES))
    @test SmoothOptimizerBenchmark.soo_termination_message(SOO.TERMINATION_GRAD_NAN | SOO.TERMINATION_START_NOT_FINITE) == "start_not_finite, grad_nan"
end
