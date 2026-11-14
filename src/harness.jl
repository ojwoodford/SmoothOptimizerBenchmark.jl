# Evaluation harness for SmoothOptimizerBenchmark
using BenchmarkTools
using Statistics

export run_model_benchmarks, select_best_model, run_optimizer_benchmarks, get_standard_optimizer_model
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
    select_best_model(models::Vector{<:ModelDefinition}, results::Dict{String, ModelEvaluationResult})

Selects the model with the fastest cost+linear system evaluation time.
"""
function select_best_model(models::Vector{<:ModelDefinition}, results::Dict{String, ModelEvaluationResult})
    valid_models = filter(m -> haskey(results, m.name) && !isnan(results[m.name].linsys_time_ns) && !isinf(results[m.name].linsys_time_ns), models)
    if isempty(valid_models)
        return first(models)
    end
    return argmin(m -> results[m.name].linsys_time_ns, valid_models)
end

"""
    get_standard_optimizer_model(models::Vector{<:ModelDefinition}, category::Symbol)::ModelDefinition

Finds the designated standard baseline model from the generated models list for optimizer benchmarking.
- Manifold: Manifolds / Manopt formulation
- Bundle Adjustment: BundleAdjustmentModels (AbstractNLSModel / AbstractNLPModel)
- Euclidean: Standalone (LeastSquaresProblem / vector residual + Jacobian)
"""
function get_standard_optimizer_model(models::Vector{<:ModelDefinition}, category::Symbol)::ModelDefinition
    if category == :manifold
        idx = findfirst(m -> lowercase(m.name) == "manifolds" || occursin("manopt", lowercase(m.name)), models)
        if idx === nothing
            idx = findfirst(m -> occursin("manifold", lowercase(m.name)) && !occursin("nlls", lowercase(m.name)), models)
        end
        return idx !== nothing ? models[idx] : first(models)
    end

    # 1. Prefer Standalone / LeastSquares
    idx = findfirst(m -> occursin("standalone", lowercase(m.name)) || m.model isa LeastSquaresProblem, models)
    idx !== nothing && return models[idx]

    # 2. For Bundle Adjustment: prefer BundleAdjustmentModels
    idx = findfirst(m -> occursin("bundleadjustment", lowercase(m.name)) || occursin("bam", lowercase(m.name)), models)
    idx !== nothing && return models[idx]

    return first(models)
end

"""
    find_common_model(models::Vector{<:ModelDefinition}) -> Union{ModelDefinition, Nothing}

Finds a universal Common Model (e.g. `LeastSquaresOptim` / `LeastSquaresProblem` / `NLSModel`).
"""
function find_common_model(models::Vector{<:ModelDefinition})
    idx = findfirst(m -> occursin("standalone", lowercase(m.name)) || occursin("leastsquares", lowercase(m.name)) || m.model isa LeastSquaresProblem, models)
    return idx === nothing ? nothing : models[idx]
end

"""
    resolve_optimizer_model(opt::OptimizerDefinition, target_model::ModelDefinition, all_models::Vector{<:ModelDefinition}) -> ModelDefinition

Selects the model passed to `opt.optimize`:
Each optimizer is paired with its optimal model formulation to maximize performance:
- `SecondOrderOptimization`: uses `NLLSModel` (preferring specialized / static / sparse when present)
- `LeastSquaresOptim`: uses `Standalone` / `LeastSquaresProblem`
- `Manopt`: uses `Manifolds`
- `JSOSolvers`, `Ipopt`, `MadNLP`, `CaNNOLeS`: use `BundleAdjustmentModels` or `NLPModels`
- Fallback: uses `target_model`
"""
function resolve_optimizer_model(opt::OptimizerDefinition, target_model::ModelDefinition, all_models::Vector{<:ModelDefinition})
    name_lower = lowercase(opt.name)

    # 1. SecondOrderOptimization: thrives on NLLSModel
    if occursin("secondorder", name_lower) || occursin("soo", name_lower) || occursin("nllsmodel", name_lower)
        for flavour in ["specialized", "static", "sparse"]
            idx = findfirst(m -> m.model isa NLLSModel.Model && occursin(flavour, lowercase(m.name)), all_models)
            idx !== nothing && return all_models[idx]
        end
        nlls_idx = findfirst(m -> m.model isa NLLSModel.Model, all_models)
        nlls_idx !== nothing && return all_models[nlls_idx]
    end

    # 2. LeastSquaresOptim: thrives on LeastSquaresProblem (Standalone)
    if occursin("leastsquares", name_lower) || occursin("lso", name_lower)
        lso_idx = findfirst(m -> occursin("standalone", lowercase(m.name)) || m.model isa LeastSquaresProblem, all_models)
        lso_idx !== nothing && return all_models[lso_idx]
    end

    # 3. Manopt: thrives on Manifolds
    if occursin("manopt", name_lower)
        man_idx = findfirst(m -> lowercase(m.name) == "manifolds" || occursin("manopt", lowercase(m.name)) || occursin("manifold", lowercase(m.name)), all_models)
        man_idx !== nothing && return all_models[man_idx]
    end

    # 4. JSO and Interior-Point solvers: thrive on BundleAdjustmentModels or NLPModels
    if occursin("jsosolvers", name_lower) || occursin("ipopt", name_lower) || occursin("madnlp", name_lower) || occursin("cannoles", name_lower)
        bam_idx = findfirst(m -> occursin("bundleadjustment", lowercase(m.name)) || occursin("bam", lowercase(m.name)), all_models)
        bam_idx !== nothing && return all_models[bam_idx]
        nlp_idx = findfirst(m -> occursin("nlpmodels", lowercase(m.name)) || m.model isa AbstractNLPModel, all_models)
        nlp_idx !== nothing && return all_models[nlp_idx]
    end

    # Fallback to target_model
    return target_model
end

"""
    run_optimizer_benchmarks(optimizers::Vector{OptimizerDefinition}, target_model::ModelDefinition;
                             all_models=ModelDefinition[target_model], max_samples::Int=50,
                             target_total_time_sec::Float64=1.0, samples=nothing)

Runs all compatible optimizers on the target model (routing `NLLSModel + ...` entries to the corresponding `NLLSModel` formulation), returning performance statistics.
Times the first (non-warmup) run with no run time limits, then calculates the number of further
samples needed for up to 1s total computation (or up to `max_samples`), collecting at least 1 sample.
"""
function run_optimizer_benchmarks(optimizers::Vector{OptimizerDefinition}, target_model::ModelDefinition;
                                 all_models::Vector{<:ModelDefinition}=ModelDefinition[target_model],
                                 max_samples::Int=50, target_total_time_sec::Float64=1.0, samples=nothing,
                                 on_result=nothing, warmed_signatures::Set{Any}=Set{Any}())
    results = Dict{String, OptimizerResult}()
    effective_max = samples !== nothing ? max(1, Int(samples)) : max_samples

    for opt in optimizers
        opt_model = resolve_optimizer_model(opt, target_model, all_models)
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
        t1_wall_start = time_ns()
        try
            init_res = opt.optimize(opt_model; time_limit=DEFAULT_MAXTIME)
        catch err
            @warn "Optimizer $(opt.name) threw on model $(opt_model.name)" exception=(err, catch_backtrace()) maxlog=3
            opt_model.reset!()
            res = error_result(err)
            results[opt.name] = res
            if on_result !== nothing
                on_result(opt.name, res)
            end
            continue
        end
        t1_wall_ns = Float64(time_ns() - t1_wall_start)
        t1_wall_sec = t1_wall_ns / 1e9

        if isnan(init_res.time_ns) || !init_res.converged
            res = init_res
            results[opt.name] = res
            if on_result !== nothing
                on_result(opt.name, res)
            end
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

        # 3. Collect further samples
        for _ in 1:further_samples
            if total_accumulated_wall_ns >= target_total_time_sec * 1e9
                break
            end
            opt_model.reset!()
            t_wall_start = time_ns()
            r_sample = opt.optimize(opt_model; time_limit=DEFAULT_MAXTIME)
            dt_wall = Float64(time_ns() - t_wall_start)
            total_accumulated_wall_ns += dt_wall
            if !isnan(r_sample.time_ns)
                push!(times, r_sample.time_ns)
                allocs = r_sample.allocs
                bytes = r_sample.bytes
            end
        end
        opt_model.reset!()

        res = with_timing(init_res, median(times), allocs, bytes)
        results[opt.name] = res
        if on_result !== nothing
            on_result(opt.name, res)
        end
    end
    return results
end

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
            idx !== nothing ? models[idx] : get_standard_optimizer_model(models, prob.category)
        else
            get_standard_optimizer_model(models, prob.category)
        end

        for opt in prob.compatible_optimizers
            opt_model = resolve_optimizer_model(opt, target, models)
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
    run_problem_benchmark(prob::ProblemDefinition, size; target_model_name=nothing, samples=nothing) -> SingleSizeBenchmarkResult

Executes the benchmark for a single problem and size:
1. Model evaluation comparison (cost vs linear system) across all implementations
2. Unified optimizer comparison on the standardized baseline model
"""
function run_problem_benchmark(prob::ProblemDefinition, size; target_model_name=nothing, samples=nothing)
    model_samples = samples !== nothing ? max(1, Int(samples)) : 5
    models = prob.generate_models(size)
    model_results = run_model_benchmarks(models; samples=model_samples)
    target_model = if target_model_name !== nothing
        idx = findfirst(m -> m.name == target_model_name, models)
        idx !== nothing ? models[idx] : get_standard_optimizer_model(models, prob.category)
    else
        get_standard_optimizer_model(models, prob.category)
    end

    # Phase 2: Optimizers (each on optimal model representation)
    optimizer_results = run_optimizer_benchmarks(prob.compatible_optimizers, target_model; all_models=models, samples=samples)

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
    run_scaling_benchmark(prob::ProblemDefinition; sizes=prob.default_sizes, target_model_name=nothing, samples=nothing, data_dir=DEFAULT_DATA_DIR) -> ProblemScalingBenchmarkResult

Runs the benchmark across all specified problem sizes (collecting at least 10 problem sizes for scaling).
Performs model evaluation across all sizes, and benchmarks optimizers across all sizes on the standardized baseline model.
Streams results into `<data_dir>/<slug>.md` after each size finishes.
"""
function run_scaling_benchmark(prob::ProblemDefinition; sizes=prob.default_sizes, target_model_name=nothing, samples=nothing, data_dir=DEFAULT_DATA_DIR)
    model_samples = samples !== nothing ? max(1, Int(samples)) : 5
    slug = problem_slug(prob.name)
    data_file = joinpath(data_dir, "$(slug).md")

    # 1. Determine target model from sample size
    sample_models = prob.generate_models(first(sizes))
    standard_m = get_standard_optimizer_model(sample_models, prob.category)
    winning_model_name = target_model_name !== nothing ? target_model_name : standard_m.name

    has_phase1_models = length(sample_models) > 1

    if has_phase1_models
        # Initialize markdown file with metadata and Model Evaluation table header
        init_problem_markdown(data_file, prob.name, prob.category, prob.size_metric_name, winning_model_name)
    else
        # Initialize markdown file with metadata, noting universal single model
        mkpath(dirname(data_file))
        open(data_file, "w") do io
            println(io, "# Benchmark Results: $(prob.name)")
            println(io)
            println(io, "- **Category**: $(prob.category)")
            println(io, "- **Scaling Metric**: $(prob.size_metric_name)")
            println(io, "- **Optimizer Target Model**: $(winning_model_name)")
            println(io, "- **Convergence Criteria**: gtol=$(DEFAULT_GTOL), xtol=$(DEFAULT_XTOL), ftol=$(DEFAULT_FTOL), maxiters=$(DEFAULT_MAXITERS), maxtime=$(DEFAULT_MAXTIME)s")
            println(io, "- **Benchmark Date**: $(Dates.format(Dates.now(), "yyyy-mm-ddTHH:MM:SS"))")
            println(io, "- **Host CPU**: $(Sys.CPU_NAME) ($(Sys.CPU_THREADS) cores)")
            println(io, "- **OS**: $(Sys.KERNEL) ($(Sys.MACHINE))")
            println(io, "- **Julia Version**: $(VERSION)")
            println(io, "- **Git Commit**: $(SmoothOptimizerBenchmark.get_git_commit())")
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
    for (i, sz) in enumerate(sizes)
        models = all_models[i]
        m_results = all_model_results[i]
        target_idx = findfirst(m -> m.name == winning_model_name, models)
        target_model = target_idx !== nothing ? models[target_idx] : get_standard_optimizer_model(models, prob.category)

        # Run optimizers on target model (routing NLLSModel + ... to NLLSModel), streaming each optimizer result immediately to file
        optimizer_results = run_optimizer_benchmarks(prob.compatible_optimizers, target_model; all_models=models, samples=samples,
            warmed_signatures=warmed_signatures,
            on_result = (opt_name, r) -> append_optimizer_evaluation(data_file, sz, opt_name, r)
        )

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
    run_all_scaling_benchmarks(; problems=get_all_problems(), quick=false, samples=nothing, data_dir=DEFAULT_DATA_DIR) -> Vector{ProblemScalingBenchmarkResult}

Executes scaling benchmarks across all registered problems, at the thread counts given (see [`run_scaling_benchmark`](@ref)).
"""
function run_all_scaling_benchmarks(; problems=get_all_problems(), quick=false, samples=nothing, data_dir=DEFAULT_DATA_DIR)
    scaling_results = ProblemScalingBenchmarkResult[]
    for prob in problems
        sizes = quick ? prob.default_sizes[1:min(3, length(prob.default_sizes))] : prob.default_sizes
        res = run_scaling_benchmark(prob; sizes=sizes, samples=samples, data_dir=data_dir)
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
