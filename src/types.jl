# Core types for SmoothOptimizerBenchmark

export ModelEvaluationResult, ModelDefinition, OptimizerResult, OptimizerDefinition, ProblemDefinition

"""
    ModelEvaluationResult

Benchmark results for evaluating a model's cost and linear system:
- `cost_time_ns`: median evaluation time in nanoseconds for pure cost
- `cost_allocs`: allocations count for pure cost evaluation
- `cost_bytes`: allocated memory in bytes for pure cost evaluation
- `linsys_time_ns`: median evaluation time in nanoseconds for cost + linear system
- `linsys_allocs`: allocations count for cost + linear system
- `linsys_bytes`: allocated memory in bytes for cost + linear system
"""
struct ModelEvaluationResult
    cost_time_ns::Float64
    cost_allocs::Int
    cost_bytes::Int
    linsys_time_ns::Float64
    linsys_allocs::Int
    linsys_bytes::Int
end

"""
    ModelDefinition{T}

Encapsulates a model formulation for a problem:
- `name`: Human-readable identifier (e.g. "SecondOrderOpt (Static)", "LeastSquaresOptim")
- `model`: Underlying problem/model instance
- `eval_cost`: In-place or cached function `() -> Float64` computing pure cost
- `eval_cost_and_linear_system`: In-place or cached function `() -> (cost, linsys)` computing cost + derivatives/linear system
- `reset!`: Function `() -> nothing` resetting model parameters to initial configuration
"""
struct ModelDefinition{T}
    name::String
    model::T
    eval_cost::Function
    eval_cost_and_linear_system::Function
    reset!::Function
end

"""
    OptimizerResult

Results from running an optimizer on a benchmark model:
- `time_ns`: median runtime in nanoseconds
- `allocs`: memory allocation count
- `bytes`: allocated memory in bytes
- `iterations`: number of iterations performed
- `start_cost`: starting objective cost
- `final_cost`: final achieved objective cost
- `converged`: whether the optimizer converged within tolerance
"""
struct OptimizerResult
    time_ns::Float64
    allocs::Int
    bytes::Int
    iterations::Int
    start_cost::Float64
    final_cost::Float64
    converged::Bool
end

"""
    OptimizerDefinition

Defines a compatible optimizer for a problem:
- `name`: Human-readable identifier (e.g. "SecondOrderOptimization (LM)", "Ipopt", "JSOSolvers (tron)")
- `optimize`: Function `(model_def) -> OptimizerResult` executing optimization on the given model
"""
struct OptimizerDefinition
    name::String
    optimize::Function
end

"""
    ProblemDefinition

Defines a parameterized benchmark problem:
- `name`: Human-readable problem title
- `category`: Problem category (:small_dense, :large_dense, :large_sparse, :manifold)
- `default_sizes`: Collection of default benchmark sizes
- `generate_models`: Function `(size) -> Vector{ModelDefinition}` generating model formulations for given size
- `compatible_optimizers`: Vector of `OptimizerDefinition` capable of optimizing this problem
"""
struct ProblemDefinition
    name::String
    category::Symbol
    default_sizes::Vector{Any}
    generate_models::Function
    compatible_optimizers::Vector{OptimizerDefinition}
end
