module SmoothOptimizerBenchmark

using BenchmarkTools
using Static
using StaticArrays
using LinearAlgebra
using Random
using SparseArrays
using Printf
using Statistics

using SecondOrderOptimization
using NLLSModel
using Optim
using LeastSquaresOptim
using NLPModels
using OptimizationVariableInterface

using Manopt
using Manifolds
using Distances
using JuMP
using Ipopt
using JSOSolvers
using NLPModelsJuMP
using BundleAdjustmentModels
using CaNNOLeS
using MadNLP
using NonlinearSolve

include("types.jl")
include("adapters.jl")
include("markdown_storage.jl")
include("harness.jl")
include("plotting.jl")

include("problems/curve_fitting.jl")
include("problems/affine_alignment.jl")
include("problems/rosenbrock_dense.jl")
include("problems/rosenbrock_sparse.jl")
include("problems/pose_chain.jl")
include("problems/procrustes.jl")
include("problems/bundle_adjustment.jl")

export get_all_problems
export create_curve_fitting_problem
export create_affine_alignment_problem
export create_rosenbrock_dense_problem
export create_rosenbrock_sparse_problem
export create_pose_chain_problem
export create_procrustes_problem
export create_bundle_adjustment_problem

export run_problem_benchmark, run_scaling_benchmark, run_all_scaling_benchmarks
export load_problem_markdown, load_all_problem_markdown, update_problem_plots
export init_problem_markdown, append_model_evaluation, init_optimizer_section, append_optimizer_evaluation
export load_benchmark_results
export problem_slug, plot_model_scaling, plot_optimizer_scaling, generate_all_plots

"""
    get_all_problems() -> Vector{ProblemDefinition}

Returns a vector of all registered benchmark problem definitions covering small dense,
large dense, large sparse, and non-Euclidean manifold problems.
"""
function get_all_problems()
    return ProblemDefinition[
        create_rosenbrock_sparse_problem(),
        create_curve_fitting_problem(),
        create_affine_alignment_problem(),
        create_rosenbrock_dense_problem(),
        create_pose_chain_problem(),
        create_procrustes_problem(),
        create_bundle_adjustment_problem()
    ]
end

"""
    run_all_benchmarks(; verbose=true, quick=false)

Executes benchmarks for all problem types across their default test sizes.
"""
function run_all_benchmarks(; verbose=true, quick=false)
    problems = get_all_problems()
    return harness_run_all(problems; verbose=verbose, quick=quick)
end

function harness_run_all(problems; verbose=true, quick=false)
    all_results = []
    for prob in problems
        sizes = quick ? [first(prob.default_sizes)] : prob.default_sizes
        for sz in sizes
            res = run_problem_benchmark(prob, sz; samples = quick ? 2 : 5, verbose=verbose)
            push!(all_results, res)
        end
    end
    return all_results
end

end # module
