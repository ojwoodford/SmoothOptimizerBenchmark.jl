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

# One file per second-level testset (ET3), in groups (ET4): `threaded`, the tests whose behaviour depends on
# Threads.nthreads(); `integration`, the tests that run every compatible optimizer of a problem, where each third-party
# adapter is first compiled; `serial`, everything else. `julia test/runtests.jl <group>...` or
# `Pkg.test(test_args = [...])` runs the groups named, all of them when none is. Full check before a push: every group
# on 1 thread, then `threaded` on 4
const TEST_FILES = [
    ("Problem Definition & >=10 Problem Sizes", "problem_definitions.jl", :serial),
    ("Plot Styling & Unsupported Sparse Solver Handling", "plot_styling.jl", :serial),
    ("Every SecondOrderOptimization termination mask has a name", "termination_masks.jl", :serial),
    ("Optimizer status (B3)", "optimizer_status.jl", :serial),
    ("A row is ok only if its cost passes the test (IT4)", "row_status.jl", :serial),
    ("An explicit model for a row (P2a)", "explicit_model.jl", :serial),
    ("The Standalone model, built from the costs (DM2)", "standalone.jl", :serial),
    ("One derivative mode per problem (DM11)", "derivative_modes.jl", :serial),
    ("Cold-Start NLLSModel + SecondOrderOptimization & BAL Equivalence", "cold_start.jl", :serial),
    ("Thread counts and NLLSModel threading thresholds (M17, F4)", "thread_counts.jl", :threaded),
    ("Single-variable NLLSModel rows use the linear system's own buffer types (M18)", "static_buffers.jl", :serial),
    ("Robust exponential curve fitting (P2)", "curve_fitting_robust.jl", :serial),
    ("Robust exponential curve fitting: every row on the fudged model (P2)", "curve_fitting_robust_rows.jl", :integration),
    ("Multilateration (P1)", "multilateration.jl", :serial),
    ("Robust Procrustes: the first-order Huber kernel (IT3)", "robust_procrustes.jl", :serial),
    ("Tall formulation (N1, N2, N5)", "tall_formulation.jl", :serial),
    ("A Gauss-Newton row beside CaNNOLeS (IT2)", "gauss_newton.jl", :serial),
    ("Ill-conditioned polynomial fit: excess cost over the reference minimum (N3, N4)", "polynomial_fitting.jl", :integration),
    ("The harness evaluates every row's cost (IT1)", "point_evaluation.jl", :integration),
    ("Quick Single-Size Benchmark", "quick_benchmark.jl", :integration),
    ("Scaling Benchmark, Markdown Serialization & Plotting", "scaling_markdown_plotting.jl", :serial),
    ("Problem pages: header, The Problem section and its numbers (PP3)", "problem_pages.jl", :serial),
    ("Scaling Benchmark: the single-threaded table", "scaling_single_threaded.jl", :threaded),
    ("NLPModels Evaluation Recomputation and Cache Invalidation", "nlpmodels_cache.jl", :serial),
    ("The features page: every cell has a state and its evidence (FP3)", "features_page.jl", :serial),
]
const TEST_GROUPS = (:threaded, :integration, :serial)

const SELECTED_GROUPS = isempty(ARGS) ? TEST_GROUPS : Tuple(Symbol.(ARGS))
for g in SELECTED_GROUPS
    g in TEST_GROUPS || throw(ArgumentError("Unknown test group $(repr(String(g))); the groups are $(join(String.(TEST_GROUPS), ", "))"))
end

@testset verbose = true "SmoothOptimizerBenchmark Suite" begin
    if :serial in SELECTED_GROUPS
        # 11 distinct problems (10 Euclidean non-manifold + 1 manifold)
        @test length(problems) == 11
    end
    for (name, file, group) in TEST_FILES
        group in SELECTED_GROUPS && log_testset_time(name, @timed include(file))
    end
end
