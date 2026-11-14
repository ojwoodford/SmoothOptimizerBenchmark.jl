# Core types for SmoothOptimizerBenchmark

export ModelEvaluationResult, ModelDefinition, OptimizerResult, OptimizerDefinition, ProblemDefinition
export SingleSizeBenchmarkResult, ProblemScalingBenchmarkResult
export OPTIMIZER_STATUSES, skipped_result, error_result
export DEFAULT_DOCS_DIR, DEFAULT_DATA_DIR, DEFAULT_PLOTS_DIR

const DEFAULT_DOCS_DIR = normpath(joinpath(@__DIR__, "..", "docs", "src"))
const DEFAULT_DATA_DIR = joinpath(DEFAULT_DOCS_DIR, "data")
const DEFAULT_PLOTS_DIR = joinpath(DEFAULT_DOCS_DIR, "assets", "plots")

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
- `eval_cost`: In-place function `() -> Float64` computing pure cost (always recomputed, un-cached)
- `eval_cost_and_linear_system`: In-place function `() -> (cost, linsys)` computing cost + derivatives/linear system
- `reset!`: Function `() -> nothing` resetting model parameters to initial configuration
"""
struct ModelDefinition{T}
    name::String
    model::T
    eval_cost::Function
    eval_cost_and_linear_system::Function
    reset!::Function
end

const OPTIMIZER_STATUSES = (:ok, :not_converged, :timeout, :skipped, :error)

"""
    OptimizerResult

Results from running an optimizer on a benchmark model:
- `time_ns`: median runtime in nanoseconds
- `allocs`: memory allocation count
- `bytes`: allocated memory in bytes
- `iterations`: number of iterations performed
- `start_cost`: starting objective cost
- `final_cost`: final achieved objective cost
- `converged`: whether the optimizer converged within tolerance (true exactly when `status == :ok`)
- `status`: one of `OPTIMIZER_STATUSES`:
  - `:ok`: the solver reports convergence;
  - `:not_converged`: the solver ran and stopped without converging (iteration limit, stall, failure);
  - `:timeout`: the solver stopped on the time limit without converging;
  - `:skipped`: the run was deliberately not attempted (size cut-off, unsupported model or path);
  - `:error`: the adapter or solver threw an exception.
- `message`: why, in a few words (the solver's own status, the skip reason, or the exception)
"""
struct OptimizerResult
    time_ns::Float64
    allocs::Int
    bytes::Int
    iterations::Int
    start_cost::Float64
    final_cost::Float64
    converged::Bool
    status::Symbol
    message::String
    function OptimizerResult(time_ns, allocs, bytes, iterations, start_cost, final_cost, converged::Bool, status::Symbol, message::AbstractString)
        status in OPTIMIZER_STATUSES || throw(ArgumentError("Unknown optimizer status $(repr(status)); expected one of $(OPTIMIZER_STATUSES)"))
        converged == (status === :ok) || throw(ArgumentError("converged = $converged is inconsistent with status = $(repr(status))"))
        return new(time_ns, allocs, bytes, iterations, start_cost, final_cost, converged, status, String(message))
    end
end

# A solver that ran: the status follows from convergence and whether the time limit stopped it
function OptimizerResult(time_ns, allocs, bytes, iterations, start_cost, final_cost, converged::Bool;
                         timed_out::Bool=false, message::AbstractString="")
    status = converged ? :ok : timed_out ? :timeout : :not_converged
    return OptimizerResult(time_ns, allocs, bytes, iterations, start_cost, final_cost, converged, status, message)
end

"""
    skipped_result(reason; start_cost=NaN) -> OptimizerResult

A row for a run that was deliberately not attempted.
"""
skipped_result(reason::AbstractString; start_cost=NaN) = OptimizerResult(NaN, 0, 0, 0, start_cost, NaN, false, :skipped, reason)

"""
    error_result(err) -> OptimizerResult

A row for a run whose adapter or solver threw `err`.
"""
error_result(err) = OptimizerResult(NaN, 0, 0, 0, NaN, NaN, false, :error, sprint(showerror, err))

# Copy of `r` with the timing fields replaced
with_timing(r::OptimizerResult, time_ns, allocs, bytes) =
    OptimizerResult(time_ns, allocs, bytes, r.iterations, r.start_cost, r.final_cost, r.converged, r.status, r.message)

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
- `default_sizes`: Collection of default benchmark sizes (at least 10 sizes for scaling evaluation)
- `generate_models`: Function `(size) -> Vector{ModelDefinition}` generating model formulations for given size
- `compatible_optimizers`: Vector of `OptimizerDefinition` capable of optimizing this problem
- `size_metric_name`: Human-readable label for the scaling parameter (e.g. "Dimension n", "Data Points m")
"""
struct ProblemDefinition
    name::String
    category::Symbol
    default_sizes::Vector{Any}
    generate_models::Function
    compatible_optimizers::Vector{OptimizerDefinition}
    size_metric_name::String
end

# Backward-compatible constructor when size_metric_name is omitted
function ProblemDefinition(
    name::String,
    category::Symbol,
    default_sizes::Vector{Any},
    generate_models::Function,
    compatible_optimizers::Vector{OptimizerDefinition}
)
    return ProblemDefinition(name, category, default_sizes, generate_models, compatible_optimizers, "Size")
end

"""
    SingleSizeBenchmarkResult

Complete benchmark results for a single problem at a specific size:
- `problem`: problem name
- `category`: problem category
- `size`: size value tested
- `size_metric_name`: metric name for size
- `model_results`: evaluation timings per model formulation (Dict{String, ModelEvaluationResult})
- `target_model`: name of the standardized model used for optimizer benchmarks (e.g. "Standalone")
- `optimizer_results`: results of all tested solvers on the target model (Dict{String, OptimizerResult})
"""
struct SingleSizeBenchmarkResult
    problem::String
    category::Symbol
    size::Any
    size_metric_name::String
    model_results::Dict{String, ModelEvaluationResult}
    target_model::String
    optimizer_results::Dict{String, OptimizerResult}
end

# Backwards compatibility constructors
function SingleSizeBenchmarkResult(
    problem::String,
    category::Symbol,
    size::Any,
    size_metric_name::String,
    model_results::Dict{String, ModelEvaluationResult},
    target_model::String,
    tier1_optimizer_results::Dict{String, OptimizerResult},
    tier2_optimizer_results::Dict{String, OptimizerResult}
)
    merged = merge(tier1_optimizer_results, tier2_optimizer_results)
    return SingleSizeBenchmarkResult(problem, category, size, size_metric_name, model_results, target_model, merged)
end

function SingleSizeBenchmarkResult(
    problem::String,
    size::Any,
    model_results::Dict{String, ModelEvaluationResult},
    target_model::String,
    optimizer_results::Dict{String, OptimizerResult}
)
    return SingleSizeBenchmarkResult(problem, :general, size, "Size", model_results, target_model, optimizer_results)
end

function Base.getproperty(res::SingleSizeBenchmarkResult, sym::Symbol)
    if sym === :best_model
        return getfield(res, :target_model)
    elseif sym === :tier1_optimizer_results || sym === :tier2_optimizer_results
        return getfield(res, :optimizer_results)
    end
    return getfield(res, sym)
end

"""
    ProblemScalingBenchmarkResult

Aggregated multi-size benchmark results across >= 10 problem sizes:
- `problem`: problem name
- `category`: category symbol
- `size_metric_name`: scaling parameter name
- `sizes`: vector of sizes tested
- `size_results`: vector of `SingleSizeBenchmarkResult`
"""
struct ProblemScalingBenchmarkResult
    problem::String
    category::Symbol
    size_metric_name::String
    sizes::Vector{Any}
    size_results::Vector{SingleSizeBenchmarkResult}
end
