# Evaluation harness for SmoothOptimizerBenchmark
using BenchmarkTools
using Statistics

export run_model_benchmarks, run_optimizer_benchmarks, get_standard_optimizer_model
export run_problem_benchmark, run_scaling_benchmark, run_all_scaling_benchmarks
export load_benchmark_results

"""
    benchmark_eval(f; samples=5, evals=nothing)

Runs a calibrated benchmark of an evaluation function and returns median time (ns), allocs, and bytes.
Automatically calibrates `evals` for fast (< 10 μs) functions to prevent ~42 ns hardware timer quantization spikes.
"""
function benchmark_eval(f::Function; samples=5, evals=nothing)
    # Warmup first to exclude JIT compilation from calibration timing
    f()
    t0 = time_ns()
    f()
    dt = time_ns() - t0
    actual_evals = if evals !== nothing
        evals
    elseif dt < 10_000
        t1 = time_ns()
        for _ in 1:16
            f()
        end
        dt16 = max(1, (time_ns() - t1) ÷ 16)
        clamp(cld(20_000, Int(dt16)), 1, 1000)
    else
        1
    end
    actual_samples = dt < 1_000_000 ? max(samples, 9) : samples
    b = @benchmark $f() samples=actual_samples evals=actual_evals
    m = median(b)
    return (time_ns = Float64(m.time), allocs = b.allocs, bytes = b.memory)
end

"""
    run_model_benchmarks(models::Vector{<:ModelDefinition}; samples=5, evals=1)

Benchmarks cost and cost+linear-system evaluation across all provided model implementations.
"""
function run_model_benchmarks(models::Vector{<:ModelDefinition}; samples=5, evals=1)
    results = Dict{String, ModelEvaluationResult}()
    for m in models
        is_built(m) || continue
        m.reset!()
        reset_nlp_cache!(m.model)
        c_res = benchmark_eval(() -> begin
            reset_nlp_cache!(m.model)
            m.eval_cost()
        end; samples=samples, evals=evals)
        m.reset!()
        reset_nlp_cache!(m.model)
        ls_res = benchmark_eval(() -> begin
            reset_nlp_cache!(m.model)
            m.eval_cost_and_linear_system()
        end; samples=samples, evals=evals)
        results[m.name] = ModelEvaluationResult(
            c_res.time_ns, c_res.allocs, c_res.bytes,
            ls_res.time_ns, ls_res.allocs, ls_res.bytes
        )
    end
    return results
end

"""
    run_optimizer_benchmarks(optimizers::Vector{OptimizerDefinition}, target_model::ModelDefinition;
                             all_models=ModelDefinition[target_model], max_samples::Int=50,
                             target_total_time_sec::Float64=1.0, samples=nothing)

Runs each optimizer on the model of `all_models` that `resolve_optimizer_model` pairs it with (its package's native model,
or else the Standalone model), returning performance statistics.
Times the first (non-warmup) run with no run time limits, then calculates the number of further
samples needed for up to 1s total computation (or up to `max_samples`), collecting at least 1 sample.

The iterations, status and costs reported are the first run's (IT1). Its start and final costs are not the solver's own:
the adapter hands back the point it stopped at (the `solution` keyword), and `evaluator`, the problem's
`point_evaluator` built from its standard model (by default from `target_model`), evaluates the cost there, outside the
timed region. A row that hands back no point (a skip, an error) has a final cost of `NaN`.

A row named in `timed_out_at` (row name ⇒ the size at which it timed out) is not run: it is recorded `:timeout`, "timed
out at size N" (decision 17, from `run_scaling_benchmark`).

When every row has run, the harness decides each row's status (IT4, `assign_statuses!`): a row the solver says
converged is `:ok` only if its cost passes the cost test against `reference` (the problem's known minimum at this size,
`nothing` for the lowest cost of any row here), and `:local_minimum` or `:above_reference` otherwise. Only then is
`on_result` called, for each row in the order of `optimizers`: so a results file streamed from it holds whole sizes,
and an interrupted run leaves no row reading `ok` that was not tested.
"""
function run_optimizer_benchmarks(optimizers::Vector{OptimizerDefinition}, target_model::ModelDefinition;
                                 all_models::Vector{<:ModelDefinition}=ModelDefinition[target_model],
                                 max_samples::Int=50, target_total_time_sec::Float64=1.0, samples=nothing,
                                 on_result=nothing, warmed_signatures::Set{Any}=Set{Any}(),
                                 evaluator=point_evaluator(target_model), reference=nothing,
                                 timed_out_at::AbstractDict=Dict{String, Any}())
    results = Dict{String, OptimizerResult}()
    # The point each row handed back and the model it ran on, for the status test
    points = Dict{String, Tuple{Vector{Float64}, ModelDefinition}}()
    effective_max = samples !== nothing ? max(1, Int(samples)) : max_samples

    for opt in optimizers
        # A row that timed out at a smaller size of this table is not run again (decision 17)
        if haskey(timed_out_at, opt.name)
            results[opt.name] = timed_out_earlier_result(timed_out_at[opt.name])
            continue
        end
        opt_model = resolve_optimizer_model(opt, all_models)
        # A model not built at this size (decision 18): the row is skipped with its reason
        if !is_built(opt_model)
            results[opt.name] = skipped_result(opt_model.model.reason)
            continue
        end
        # Ensure this concrete (optimizer, model-type) specialization is JIT-compiled before timing
        sig = (opt.name, typeof(opt_model.model))
        if !(sig in warmed_signatures)
            push!(warmed_signatures, sig)
            try
                opt_model.reset!()
                opt.optimize(opt_model; maxiters=1, time_limit=1.0)
            catch err
                @warn "Warm-up of optimizer $(opt.name) threw on model $(opt_model.name)" exception=(err, catch_backtrace()) maxlog=3
            finally
                opt_model.reset!()
            end
        else
            opt_model.reset!()
        end

        # 1. First (non-warmup) run with standard run time limits
        init_res = nothing
        point = Float64[]
        t1_wall_start = time_ns()
        try
            init_res = opt.optimize(opt_model; time_limit=DEFAULT_MAXTIME, solution=point)
        catch err
            @warn "Optimizer $(opt.name) threw on model $(opt_model.name)" exception=(err, catch_backtrace()) maxlog=3
            opt_model.reset!()
            results[opt.name] = error_result(err)
            continue
        end
        t1_wall_ns = Float64(time_ns() - t1_wall_start)
        t1_wall_sec = t1_wall_ns / 1e9
        init_res = evaluated_result(init_res, point, opt_model, evaluator)
        points[opt.name] = (point, opt_model)

        if isnan(init_res.time_ns) || !init_res.converged
            results[opt.name] = init_res
            continue
        end

        # 2. Check runtime to estimate number of further samples needed
        # based on up to 50 samples, or number of samples required for 1s total computation (min 1 sample)
        samples_for_1s = t1_wall_sec > 0.0 ? ceil(Int, target_total_time_sec / t1_wall_sec) : effective_max
        total_samples = clamp(samples_for_1s, 1, effective_max)
        further_samples = total_samples - 1

        times = Float64[init_res.time_ns]
        allocs = init_res.allocs
        bytes = init_res.bytes
        total_accumulated_wall_ns = t1_wall_ns

        # 3. Collect further samples; a throw in any of them makes the row an :error, as in the first run (B10)
        sample_err = nothing
        for _ in 1:further_samples
            if total_accumulated_wall_ns >= target_total_time_sec * 1e9
                break
            end
            opt_model.reset!()
            t_wall_start = time_ns()
            r_sample = try
                opt.optimize(opt_model; time_limit=DEFAULT_MAXTIME)
            catch err
                @warn "Optimizer $(opt.name) threw in a timing sample on model $(opt_model.name)" exception=(err, catch_backtrace()) maxlog=3
                sample_err = err
                break
            end
            dt_wall = Float64(time_ns() - t_wall_start)
            total_accumulated_wall_ns += dt_wall
            if !isnan(r_sample.time_ns)
                push!(times, r_sample.time_ns)
                allocs = r_sample.allocs
                bytes = r_sample.bytes
            end
        end
        opt_model.reset!()

        results[opt.name] = sample_err === nothing ? with_timing(init_res, median(times), allocs, bytes) : error_result(sample_err)
    end
    assign_statuses!(results, points, evaluator, reference)
    if on_result !== nothing
        for opt in optimizers
            on_result(opt.name, results[opt.name])
        end
    end
    return results
end

# The row of a size not run because the row timed out at a smaller size of the same table (decision 17)
timed_out_earlier_result(size) = OptimizerResult(NaN, 0, 0, 0, NaN, NaN, false, :timeout, "timed out at size $(size)")

# The sizes of a scaling run in increasing order (decision 17); sizes that are not all numbers (a BAL dataset's name) as given
ascending_sizes(sizes) = all(s -> s isa Real, sizes) ? sort(collect(Any, sizes)) : collect(Any, sizes)

"""
    warmup_problem_optimizers!(prob::ProblemDefinition, sizes; target_model_name=nothing, warmed_signatures=Set{Any}())

For each optimizer, performs a warmup run on both the smallest and largest problem size
with run time limited to 1s to trigger JIT compilation for both small and large code paths.
"""
function warmup_problem_optimizers!(prob::ProblemDefinition, sizes; target_model_name=nothing, warmed_signatures::Set{Any}=Set{Any}())
    isempty(sizes) && return warmed_signatures
    warmup_sizes = unique([first(sizes), last(sizes)])

    for sz in warmup_sizes
        models = prob.generate_models(sz)
        isempty(models) && continue

        # Warmup models
        for m in models
            is_built(m) || continue
            try
                m.reset!()
                reset_nlp_cache!(m.model)
                m.eval_cost()
                m.reset!()
                reset_nlp_cache!(m.model)
                m.eval_cost_and_linear_system()
            catch err
                @warn "Warm-up of model $(m.name) threw" exception=(err, catch_backtrace()) maxlog=3
            finally
                m.reset!()
                reset_nlp_cache!(m.model)
            end
        end

        # Pick standard target model
        target = if target_model_name !== nothing
            idx = findfirst(m -> m.name == target_model_name, models)
            idx !== nothing ? models[idx] : get_standard_optimizer_model(models)
        else
            get_standard_optimizer_model(models)
        end

        for opt in prob.compatible_optimizers
            opt_model = resolve_optimizer_model(opt, models)
            is_built(opt_model) || continue
            push!(warmed_signatures, (opt.name, typeof(opt_model.model)))
            try
                opt_model.reset!()
                opt.optimize(opt_model; time_limit=1.0)
            catch err
                @warn "Warm-up of optimizer $(opt.name) threw on model $(opt_model.name)" exception=(err, catch_backtrace()) maxlog=3
            finally
                opt_model.reset!()
            end
        end
    end
    return warmed_signatures
end

"""
    run_problem_benchmark(prob::ProblemDefinition, size; target_model_name=nothing, samples=nothing,
                          numthreads=Threads.nthreads(), blas_threads=numthreads) -> SingleSizeBenchmarkResult

Executes the benchmark for a single problem and size:
1. Model evaluation comparison (cost vs linear system) across all implementations
2. Unified optimizer comparison on the standardized baseline model

The thread counts are fixed first with [`set_benchmark_threads!`](@ref).
"""
function run_problem_benchmark(prob::ProblemDefinition, size; target_model_name=nothing, samples=nothing,
                               numthreads::Integer=Threads.nthreads(), blas_threads::Integer=numthreads)
    set_benchmark_threads!(; numthreads, blas_threads)
    model_samples = samples !== nothing ? max(1, Int(samples)) : 5
    models = prob.generate_models(size)
    model_results = run_model_benchmarks(models; samples=model_samples)
    target_model = if target_model_name !== nothing
        idx = findfirst(m -> m.name == target_model_name, models)
        idx !== nothing ? models[idx] : get_standard_optimizer_model(models)
    else
        get_standard_optimizer_model(models)
    end

    # Phase 2: Optimizers, each on the model the pairing gives it (`resolve_optimizer_model`), every row's costs evaluated by
    # the standard model's evaluator
    evaluator = point_evaluator(get_standard_optimizer_model(models))
    optimizer_results = run_optimizer_benchmarks(prob.compatible_optimizers, target_model; all_models=models, samples=samples, evaluator,
        reference=prob.reference_cost(size))

    return SingleSizeBenchmarkResult(
        prob.name,
        prob.category,
        size,
        prob.size_metric_name,
        model_results,
        target_model.name,
        optimizer_results
    )
end

"""
    run_scaling_benchmark(prob::ProblemDefinition; sizes=prob.default_sizes, target_model_name=nothing, samples=nothing, data_dir=DEFAULT_DATA_DIR,
                          numthreads=Threads.nthreads(), blas_threads=numthreads) -> ProblemScalingBenchmarkResult

Runs the benchmark across all specified problem sizes (collecting at least 10 problem sizes for scaling), in increasing
order. A row that ends `:timeout` at one size is not run at the larger sizes: it is recorded `:timeout` there, "timed out
at size N" (decision 17), the same for every row.
Performs model evaluation across all sizes, and benchmarks optimizers across all sizes on the standardized baseline model.
Streams results into `<data_dir>/<slug>.md`: the model rows as they finish, each size's optimizer rows when the size
finishes (their statuses are decided then, IT4).

The thread counts are fixed with [`set_benchmark_threads!`](@ref) before any model is built, and written into the
file's header: `numthreads` for NLLSModel (at most `Threads.nthreads()`), `blas_threads` for BLAS.
"""
function run_scaling_benchmark(prob::ProblemDefinition; sizes=prob.default_sizes, target_model_name=nothing, samples=nothing, data_dir=DEFAULT_DATA_DIR,
                               numthreads::Integer=Threads.nthreads(), blas_threads::Integer=numthreads)
    set_benchmark_threads!(; numthreads, blas_threads)
    sizes = ascending_sizes(sizes)
    model_samples = samples !== nothing ? max(1, Int(samples)) : 5
    slug = problem_slug(prob.name)
    data_file = joinpath(data_dir, "$(slug).md")

    # 1. Determine target model from sample size
    sample_models = prob.generate_models(first(sizes))
    standard_m = get_standard_optimizer_model(sample_models)
    winning_model_name = target_model_name !== nothing ? target_model_name : standard_m.name

    has_phase1_models = count(is_built, sample_models) > 1

    if has_phase1_models
        # Initialize markdown file with metadata and Model Evaluation table header
        init_problem_markdown(data_file, prob.name, prob.category, prob.size_metric_name, winning_model_name; derivatives=prob.derivatives)
    else
        # Initialize markdown file with metadata, noting universal single model
        mkpath(dirname(data_file))
        open(data_file, "w") do io
            println(io, "# Benchmark Results: $(prob.name)")
            println(io)
            println(io, "- **Category**: $(prob.category)")
            println(io, "- **Scaling Metric**: $(prob.size_metric_name)")
            println(io, "- **Optimizer Target Model**: $(winning_model_name)")
            println(io, derivatives_line(prob.derivatives))
            println(io, convergence_criteria_line())
            println(io, "- **Benchmark Date**: $(Dates.format(Dates.now(), "yyyy-mm-ddTHH:MM:SS"))")
            println(io, "- **Host CPU**: $(Sys.CPU_NAME) ($(Sys.CPU_THREADS) cores)")
            println(io, "- **OS**: $(Sys.KERNEL) ($(Sys.MACHINE))")
            println(io, "- **Julia Version**: $(VERSION)")
            println(io, threads_line())
            println(io, "- **Git Commit**: $(SmoothOptimizerBenchmark.get_git_commit())")
            println(io, dependency_commits_line())
            println(io)
            println(io, "---")
            println(io)
            println(io, "## Model Evaluation Scaling")
            println(io)
            println(io, "This problem uses `$(winning_model_name)` universally across all optimizers; Phase 1 comparative model evaluation is omitted.")
            println(io)
            flush(io)
        end
    end

    # 2. Benchmark all models across all sizes and stream each model row to file immediately
    all_models = Vector{Vector{ModelDefinition}}(undef, length(sizes))
    all_model_results = Vector{Dict{String, ModelEvaluationResult}}(undef, length(sizes))
    for (i, sz) in enumerate(sizes)
        models = prob.generate_models(sz)
        all_models[i] = models
        m_results = Dict{String, ModelEvaluationResult}()
        if has_phase1_models
            for m in models
                is_built(m) || continue
                m.reset!()
                reset_nlp_cache!(m.model)
                c_res = benchmark_eval(() -> begin
                    reset_nlp_cache!(m.model)
                    m.eval_cost()
                end; samples=model_samples)
                m.reset!()
                reset_nlp_cache!(m.model)
                ls_res = benchmark_eval(() -> begin
                    reset_nlp_cache!(m.model)
                    m.eval_cost_and_linear_system()
                end; samples=model_samples)
                mr = ModelEvaluationResult(
                    c_res.time_ns, c_res.allocs, c_res.bytes,
                    ls_res.time_ns, ls_res.allocs, ls_res.bytes
                )
                m_results[m.name] = mr
                # Write every model performance immediately to file!
                append_model_evaluation(data_file, sz, m.name, mr)
            end
        end
        all_model_results[i] = m_results
    end

    # Initialize optimizer section in the markdown file
    init_optimizer_section(data_file, winning_model_name)

    # 3. Warmup both smallest and largest sizes for each optimizer (1s time limit)
    warmed_signatures = Set{Any}()
    warmup_problem_optimizers!(prob, sizes; target_model_name=winning_model_name, warmed_signatures=warmed_signatures)

    # 4. Benchmark optimizers across all sizes on the standardized model, streaming EVERY optimizer performance immediately to file!
    size_results = SingleSizeBenchmarkResult[]
    # Decision 17: a row that times out at one size is recorded as timed out at every larger size, without running
    timed_out_at = Dict{String, Any}()
    for (i, sz) in enumerate(sizes)
        models = all_models[i]
        m_results = all_model_results[i]
        target_idx = findfirst(m -> m.name == winning_model_name, models)
        target_model = target_idx !== nothing ? models[target_idx] : get_standard_optimizer_model(models)

        # Run each optimizer on the model the pairing gives it, streaming each size's rows to file once all have run
        optimizer_results = run_optimizer_benchmarks(prob.compatible_optimizers, target_model; all_models=models, samples=samples,
            warmed_signatures=warmed_signatures, evaluator=point_evaluator(get_standard_optimizer_model(models)),
            reference=prob.reference_cost(sz), timed_out_at,
            on_result = (opt_name, r) -> append_optimizer_evaluation(data_file, sz, opt_name, r)
        )
        for (name, r) in optimizer_results
            r.status === :timeout && !haskey(timed_out_at, name) && (timed_out_at[name] = sz)
        end

        s_res = SingleSizeBenchmarkResult(
            prob.name,
            prob.category,
            sz,
            prob.size_metric_name,
            m_results,
            target_model.name,
            optimizer_results
        )
        push!(size_results, s_res)
    end

    return ProblemScalingBenchmarkResult(
        prob.name,
        prob.category,
        prob.size_metric_name,
        sizes,
        size_results
    )
end

"""
    run_all_scaling_benchmarks(; problems=get_all_problems(), quick=false, samples=nothing, data_dir=DEFAULT_DATA_DIR,
                               numthreads=Threads.nthreads(), blas_threads=numthreads) -> Vector{ProblemScalingBenchmarkResult}

Executes scaling benchmarks across all registered problems, at the thread counts given (see [`run_scaling_benchmark`](@ref)).
"""
function run_all_scaling_benchmarks(; problems=get_all_problems(), quick=false, samples=nothing, data_dir=DEFAULT_DATA_DIR,
                                    numthreads::Integer=Threads.nthreads(), blas_threads::Integer=numthreads)
    scaling_results = ProblemScalingBenchmarkResult[]
    for prob in problems
        sizes = quick ? prob.default_sizes[1:min(3, length(prob.default_sizes))] : prob.default_sizes
        res = run_scaling_benchmark(prob; sizes=sizes, samples=samples, data_dir=data_dir, numthreads, blas_threads)
        push!(scaling_results, res)
    end
    return scaling_results
end

# -----------------------------------------------------------------------------
# Backwards Compatibility Aliases
# -----------------------------------------------------------------------------

function load_benchmark_results(filepath::String)
    dir = endswith(filepath, ".json") ? dirname(filepath) : filepath
    return load_all_problem_markdown(dir)
end
