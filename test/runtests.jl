using Test
using SmoothOptimizerBenchmark
include("fixtures.jl")

# ET0: wall time and compile time of each second-level testset, from `@timed` (`compile_time` exists from Julia 1.11;
# NaN before). One line per testset, `TESTSET-TIME <name> | <total s> | <compile s>`, for the timing tables
function log_testset_time(name, stats)
    compile = hasproperty(stats, :compile_time) ? stats.compile_time : NaN
    println("TESTSET-TIME ", name, " | ", round(stats.time; digits=1), " | ", round(compile; digits=1))
    return stats.value
end

# One file per second-level testset (ET3); each also runs alone
const TEST_FILES = [
    "Problem Definition & >=10 Problem Sizes" => "problem_definitions.jl",
    "Plot Styling & Unsupported Sparse Solver Handling" => "plot_styling.jl",
    "Every SecondOrderOptimization termination mask has a name" => "termination_masks.jl",
    "Optimizer status (B3)" => "optimizer_status.jl",
    "An explicit model for a row (P2a)" => "explicit_model.jl",
    "Cold-Start NLLSModel + SecondOrderOptimization & BAL Equivalence" => "cold_start.jl",
    "Thread counts and NLLSModel threading thresholds (M17, F4)" => "thread_counts.jl",
    "Single-variable NLLSModel rows use the linear system's own buffer types (M18)" => "static_buffers.jl",
    "Robust exponential curve fitting (P2)" => "curve_fitting_robust.jl",
    "Multilateration (P1)" => "multilateration.jl",
    "Tall formulation (N1, N2, N5)" => "tall_formulation.jl",
    "Ill-conditioned polynomial fit: excess cost over the reference minimum (N3, N4)" => "polynomial_fitting.jl",
    "Quick Single-Size Benchmark" => "quick_benchmark.jl",
    "Scaling Benchmark, Markdown Serialization & Plotting" => "scaling_markdown_plotting.jl",
    "NLPModels Evaluation Recomputation and Cache Invalidation" => "nlpmodels_cache.jl",
]

@testset verbose = true "SmoothOptimizerBenchmark Suite" begin
    # 11 distinct problems (10 Euclidean non-manifold + 1 manifold)
    @test length(problems) == 11
    for (name, file) in TEST_FILES
        log_testset_time(name, @timed include(file))
    end
end
