# Shared setup for the test files, loaded once per session: each test file includes it when it is run alone, and
# runtests.jl before the files. No @testset here.
using Test
using SmoothOptimizerBenchmark

const SMOOTHBENCH_TEST_FIXTURES = true

problems = get_all_problems()
