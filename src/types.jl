# Core types for SmoothOptimizerBenchmark

export ModelEvaluationResult, ModelDefinition, OptimizerResult, OptimizerDefinition, ProblemDefinition
export SingleSizeBenchmarkResult, ProblemScalingBenchmarkResult
export OPTIMIZER_STATUSES, skipped_result, error_result
export set_benchmark_threads!, benchmark_threads, benchmark_numthreads
export DEFAULT_DOCS_DIR, DEFAULT_DATA_DIR, DEFAULT_PLOTS_DIR, SINGLE_THREADED_DATA_DIR, SINGLE_THREADED_PLOTS_DIR

const DEFAULT_DOCS_DIR = normpath(joinpath(@__DIR__, "..", "docs", "src"))
const DEFAULT_DATA_DIR = joinpath(DEFAULT_DOCS_DIR, "data")
const DEFAULT_PLOTS_DIR = joinpath(DEFAULT_DOCS_DIR, "assets", "plots")
# The single-threaded table (NLLSModel and BLAS on one thread) is stored and plotted beside the multi-threaded one, under
# the same file names
const SINGLE_THREADED_DATA_DIR = joinpath(DEFAULT_DATA_DIR, "single_threaded")
const SINGLE_THREADED_PLOTS_DIR = joinpath(DEFAULT_PLOTS_DIR, "single_threaded")

# -----------------------------------------------------------------------------
# Thread counts (M17)
# -----------------------------------------------------------------------------
# The number of threads NLLSModel may use, set by the harness before any model is built, so that a
# table does not depend on how Julia happened to be started. 0 means "not set": use Threads.nthreads().
const BENCHMARK_NUMTHREADS = Ref(0)

"""
    benchmark_numthreads() -> StaticInt

The thread count passed to NLLSModel (`optimvars`, `cost`, `optimize!`) by the models and adapters:
the one set by [`set_benchmark_threads!`](@ref), or `Threads.nthreads()` if none was set.
"""
benchmark_numthreads() = static(BENCHMARK_NUMTHREADS[] > 0 ? BENCHMARK_NUMTHREADS[] : Threads.nthreads())

"""
    set_benchmark_threads!(; numthreads=Threads.nthreads(), blas_threads=nothing) -> NamedTuple

Fixes the thread counts for a benchmark run: `numthreads` for NLLSModel's threaded evaluation (at most
`Threads.nthreads()`), and `blas_threads` for BLAS, set with `BLAS.set_num_threads`; `nothing` (the default) leaves BLAS
at the count it has, as the multi-threaded table does (IND7). Returns the counts in force,
`(; numthreads, julia_threads, blas_threads)`, for the results file.
"""
function set_benchmark_threads!(; numthreads::Integer=Threads.nthreads(), blas_threads::Union{Nothing, Integer}=nothing)
    1 <= numthreads <= Threads.nthreads() || throw(ArgumentError(
        "numthreads = $numthreads, but Julia was started with $(Threads.nthreads()) threads; start Julia with `-t $numthreads` or ask for fewer"))
    blas_threads === nothing || blas_threads >= 1 || throw(ArgumentError("blas_threads = $blas_threads must be at least 1"))
    BENCHMARK_NUMTHREADS[] = Int(numthreads)
    blas_threads === nothing || BLAS.set_num_threads(Int(blas_threads))
    return benchmark_threads()
end

"""
    benchmark_threads() -> NamedTuple

The thread counts in force: `numthreads` (NLLSModel), `julia_threads` (`Threads.nthreads()`) and
`blas_threads` (`BLAS.get_num_threads()`).
"""
benchmark_threads() = (; numthreads=Int(dynamic(benchmark_numthreads())), julia_threads=Threads.nthreads(), blas_threads=BLAS.get_num_threads())

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
- `to_point`: Function from the point an adapter hands back for this model (the `solution` keyword, a flat
  `Vector{Float64}` in this model's layout) to the layout of the problem's point evaluator (IT1, `point_evaluator`). `identity`
  (the five-argument constructor) where the two layouts are the same.
"""
struct ModelDefinition{T}
    name::String
    model::T
    eval_cost::Function
    eval_cost_and_linear_system::Function
    reset!::Function
    to_point::Function
end
ModelDefinition(name::String, model, eval_cost::Function, eval_cost_and_linear_system::Function, reset!::Function) =
    ModelDefinition(name, model, eval_cost, eval_cost_and_linear_system, reset!, identity)

# PointEvaluator (internal)
"""
    PointEvaluator

The problem's own evaluation of a point (IT1), one per problem and size, the same for every row, so that rows differ
only by where they stopped. Built from the problem's standard model by `point_evaluator`. Internal:
- `cost`: Function `x -> Float64`, the cost at `x`, a `Vector{Float64}` in the standard model's layout
- `x0`: the start, in that layout
- `resjac`: Function `x -> (r, J)`, the residuals and their Jacobian at `x`, with a robust kernel's weights applied, so
  that `Jᵀr` is the gradient of the cost; for the stationarity test (IT4)
"""
struct PointEvaluator
    cost::Function
    x0::Vector{Float64}
    resjac::Function
end

const OPTIMIZER_STATUSES = (:ok, :wrong_solution, :local_minimum, :above_reference, :not_converged, :timeout, :skipped, :error)

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
- `status`: one of `OPTIMIZER_STATUSES` (IT4: the harness, not the solver, decides `:ok`):
  - `:ok`: the solver reports convergence and its final cost passes the cost test: at most
    `max(reference × (1 + 1e-4), 1e-8 × start cost)`, the reference being the problem's known minimum at that size, or
    else the lowest final cost of any row at that size in the same table; and, where the problem states its solution, the
    relative error in the solution is at most 1e-4;
  - `:wrong_solution`: the solver reports convergence and the cost test passes, but the solution error is above 1e-4:
    the cost cannot tell the point from the solution (the conditioning sweeps at large κ);
  - `:local_minimum`: the solver reports convergence and the cost test fails, but the point is stationary: the cost
    reduction the Gauss–Newton model predicts from it is below `1e-8 ×` its cost. A minimum of the Gauss–Newton model,
    so a saddle of the true cost would pass;
  - `:above_reference`: the solver reports convergence, and neither the cost test nor the stationarity test passes: the
    solver stopped early;
  - `:not_converged`: the solver ran and stopped without converging (iteration limit, stall, failure); the message
    ends "cost test passes" when its final cost passes the cost test;
  - `:timeout`: the solver stopped on the time limit without converging (the same note on the message);
  - `:skipped`: the run was deliberately not attempted (size cut-off, unsupported model or path);
  - `:error`: the adapter or solver threw an exception.
- `message`: why, in a few words (the solver's own status, the skip reason, or the exception)
- `excess_cost`: final cost minus the problem's least-squares minimum, both in extended precision,
  for problems that provide a reference minimum (`NaN` otherwise). Formulations are compared on this,
  not on the final gradient norm, which is rounding noise at an accurate minimum of an ill-conditioned problem.
- `solution_error`: the relative error in the solution, `‖x − x*‖ / ‖x*‖`, with `x` the point the row handed back (in the
  standard model's layout) and `x*` the solution the problem states (`ProblemDefinition`'s `reference_solution`); `NaN`
  where the problem states none, or the row handed back no point (a skip, an error). On a zero-residual problem the cost
  does not see the weak directions of an ill-conditioned Jacobian, so this, not the cost, compares rows there. It changes
  no status.
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
    excess_cost::Float64
    solution_error::Float64
    function OptimizerResult(time_ns, allocs, bytes, iterations, start_cost, final_cost, converged::Bool, status::Symbol, message::AbstractString, excess_cost::Real,
                             solution_error::Real)
        status in OPTIMIZER_STATUSES || throw(ArgumentError("Unknown optimizer status $(repr(status)); expected one of $(OPTIMIZER_STATUSES)"))
        converged == (status === :ok) || throw(ArgumentError("converged = $converged is inconsistent with status = $(repr(status))"))
        return new(time_ns, allocs, bytes, iterations, start_cost, final_cost, converged, status, String(message), Float64(excess_cost),
                   Float64(solution_error))
    end
end

OptimizerResult(time_ns, allocs, bytes, iterations, start_cost, final_cost, converged::Bool, status::Symbol, message::AbstractString, excess_cost::Real) =
    OptimizerResult(time_ns, allocs, bytes, iterations, start_cost, final_cost, converged, status, message, excess_cost, NaN)

OptimizerResult(time_ns, allocs, bytes, iterations, start_cost, final_cost, converged::Bool, status::Symbol, message::AbstractString) =
    OptimizerResult(time_ns, allocs, bytes, iterations, start_cost, final_cost, converged, status, message, NaN)

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
    OptimizerResult(time_ns, allocs, bytes, r.iterations, r.start_cost, r.final_cost, r.converged, r.status, r.message, r.excess_cost, r.solution_error)

# Copy of `r` with its status and message replaced (IT4)
with_status(r::OptimizerResult, status::Symbol, message::AbstractString) =
    OptimizerResult(r.time_ns, r.allocs, r.bytes, r.iterations, r.start_cost, r.final_cost, status === :ok, status, message, r.excess_cost, r.solution_error)

# Copy of `r` with the start and final costs replaced by the harness's evaluation (IT1)
with_costs(r::OptimizerResult, start_cost, final_cost) =
    OptimizerResult(r.time_ns, r.allocs, r.bytes, r.iterations, start_cost, final_cost, r.converged, r.status, r.message, r.excess_cost, r.solution_error)

# Copy of `r` with the excess cost over the reference minimum set
with_excess_cost(r::OptimizerResult, excess_cost) =
    OptimizerResult(r.time_ns, r.allocs, r.bytes, r.iterations, r.start_cost, r.final_cost, r.converged, r.status, r.message, excess_cost, r.solution_error)

# Copy of `r` with the relative error in the solution set
with_solution_error(r::OptimizerResult, solution_error) =
    OptimizerResult(r.time_ns, r.allocs, r.bytes, r.iterations, r.start_cost, r.final_cost, r.converged, r.status, r.message, r.excess_cost, solution_error)

"""
    OptimizerDefinition

Defines a compatible optimizer for a problem:
- `name`: Human-readable identifier (e.g. "SecondOrderOptimization (LM)", "Ipopt", "JSOSolvers (tron)")
- `optimize`: Function `(model_def) -> OptimizerResult` executing optimization on the given model
- `model_name`: `nothing` (the two-argument constructor), or the exact name of a model. When set, the row runs on the
  model of that name; otherwise on the model the pairing table gives the row's package (`resolve_optimizer_model`).
"""
struct OptimizerDefinition
    name::String
    optimize::Function
    model_name::Union{Nothing, String}
end
OptimizerDefinition(name::String, optimize::Function) = OptimizerDefinition(name, optimize, nothing)

"""
    ProblemDefinition

Defines a parameterized benchmark problem:
- `name`: Human-readable problem title
- `category`: Problem category (:small_dense, :large_dense, :large_sparse, :manifold)
- `default_sizes`: Collection of default benchmark sizes (at least 10 sizes for scaling evaluation)
- `generate_models`: Function `(size) -> Vector{ModelDefinition}` generating model formulations for given size
- `compatible_optimizers`: Vector of `OptimizerDefinition` capable of optimizing this problem
- `size_metric_name`: Human-readable label for the scaling parameter (e.g. "Dimension n", "Data Points m")
- `reference_cost`: Function `(size) -> Union{Nothing, Float64}`, the problem's known minimum cost at that size, the
  reference of the cost test that decides a row's status (IT4); `nothing` (the six-argument constructor) where none is
  known, and the lowest final cost of any row at that size is the reference
- `derivatives`: how the problem's NLLSModel and Standalone models compute their derivatives (a package's native model,
  JuMP's for instance, differentiates itself, as part of the package under test: item 27 as restated 2026-11-19), one of
  `:autodiff`, `:analytic` and `:mixed`, set by the required keyword `derivatives` of every constructor. The rule: a
  problem is `:autodiff` when every cost depends on at most 8 scalar inputs (the total `nvars` of the variables it depends
  on) at every size of its sweep, so that each cost's Jacobian is computed by NLLSModel's forward-mode automatic
  differentiation, and `:analytic` otherwise, each cost then having a hand-written Jacobian. `:mixed` is for a problem
  exempt from the rule, whose models do not share their per-cost derivatives (bundle adjustment).
- `reference_solution`: Function `(size) -> Union{Nothing, Vector{Float64}}`, the problem's solution at that size in the
  standard model's layout (the point evaluator's), set by the keyword `reference_solution` of every constructor; `nothing`
  (the default) where the problem states none. Where it is stated, each row's `solution_error` is measured
  (`OptimizerResult`); the status is still decided on the cost
"""
struct ProblemDefinition
    name::String
    category::Symbol
    default_sizes::Vector{Any}
    generate_models::Function
    compatible_optimizers::Vector{OptimizerDefinition}
    size_metric_name::String
    reference_cost::Function
    derivatives::Symbol
    reference_solution::Function
    function ProblemDefinition(name::String, category::Symbol, default_sizes::Vector{Any}, generate_models::Function,
                               compatible_optimizers::Vector{OptimizerDefinition}, size_metric_name::String,
                               reference_cost::Function; derivatives::Symbol, reference_solution::Function=no_reference_solution)
        derivatives in DERIVATIVE_MODES || throw(ArgumentError(
            "Unknown derivative mode $(repr(derivatives)); expected one of :autodiff, :analytic or :mixed"))
        return new(name, category, default_sizes, generate_models, compatible_optimizers, size_metric_name, reference_cost, derivatives,
                   reference_solution)
    end
end
ProblemDefinition(name::String, category::Symbol, default_sizes::Vector{Any}, generate_models::Function,
                  compatible_optimizers::Vector{OptimizerDefinition}, size_metric_name::String; derivatives::Symbol,
                  reference_solution::Function=no_reference_solution) =
    ProblemDefinition(name, category, default_sizes, generate_models, compatible_optimizers, size_metric_name, no_reference_cost;
                      derivatives, reference_solution)
no_reference_cost(_) = nothing
no_reference_solution(_) = nothing

# Backward-compatible constructor when size_metric_name is omitted
function ProblemDefinition(
    name::String,
    category::Symbol,
    default_sizes::Vector{Any},
    generate_models::Function,
    compatible_optimizers::Vector{OptimizerDefinition};
    derivatives::Symbol,
    reference_solution::Function=no_reference_solution
)
    return ProblemDefinition(name, category, default_sizes, generate_models, compatible_optimizers, "Size"; derivatives, reference_solution)
end

# The derivative modes a problem can declare (DM1); see `ProblemDefinition`
const DERIVATIVE_MODES = (:autodiff, :analytic, :mixed)

# The largest number of scalar inputs (the total `nvars` of the variables a cost depends on) for which a problem's costs
# are differentiated automatically; above it, a problem's costs have hand-written Jacobians (DM1). A starting value, not
# a measured threshold (rules.md 26): on multilateration, in the run of `7209fd6`, NLLSModel's linear-system time was
# 35 ns × d² up to d = 8, and 47, 74, 91, 112 ns × d² at d = 10, 12, 14, 16, for a reason not yet known. Listed for
# measurement in `improvements.md` item 27.
const AUTODIFF_MAX_INPUTS = 8

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
