# Evaluation harness for SmoothOptimizerBenchmark
using BenchmarkTools
using Printf
using Statistics
using JSON

export run_model_benchmarks, select_best_model, run_optimizer_benchmarks
export run_problem_benchmark, run_scaling_benchmark, run_all_scaling_benchmarks
export save_benchmark_results, load_benchmark_results

"""
    benchmark_eval(f; samples=5, evals=1)

Runs a calibrated benchmark of an evaluation function and returns median time (ns), allocs, and bytes.
"""
function benchmark_eval(f::Function; samples=5, evals=1)
    # Warmup
    f()
    b = @benchmark $f() samples=samples evals=evals
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
        c_res = benchmark_eval(m.eval_cost; samples=samples, evals=evals)
        m.reset!()
        ls_res = benchmark_eval(m.eval_cost_and_linear_system; samples=samples, evals=evals)
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
    best_name = first(keys(results))
    best_time = results[best_name].linsys_time_ns
    for (name, res) in results
        if res.linsys_time_ns < best_time
            best_time = res.linsys_time_ns
            best_name = name
        end
    end
    idx = findfirst(m -> m.name == best_name, models)
    return models[idx]
end

"""
    find_common_model(models::Vector{<:ModelDefinition}) -> Union{ModelDefinition, Nothing}

Finds a universal Common Model (e.g. `LeastSquaresOptim` / `LeastSquaresProblem` / `NLSModel`).
"""
function find_common_model(models::Vector{<:ModelDefinition})
    idx = findfirst(m -> occursin("leastsquares", lowercase(m.name)) || m.model isa LeastSquaresProblem, models)
    return idx === nothing ? nothing : models[idx]
end

"""
    run_optimizer_benchmarks(optimizers::Vector{OptimizerDefinition}, target_model::ModelDefinition; samples=3, evals=1)

Runs all compatible optimizers on the target model, returning performance statistics.
"""
function run_optimizer_benchmarks(optimizers::Vector{OptimizerDefinition}, target_model::ModelDefinition; samples=3, evals=1)
    results = Dict{String, OptimizerResult}()
    for opt in optimizers
        target_model.reset!()
        # Warmup and initial run to capture iterations and costs
        init_res = nothing
        try
            init_res = opt.optimize(target_model)
        catch err
            results[opt.name] = OptimizerResult(NaN, 0, 0, 0, NaN, NaN, false)
            continue
        end

        if isnan(init_res.time_ns) || !init_res.converged
            results[opt.name] = init_res
            continue
        end

        times = Float64[init_res.time_ns]
        allocs = init_res.allocs
        bytes = init_res.bytes
        for _ in 1:(samples - 1)
            target_model.reset!()
            t_start = time_ns()
            timed = @timed opt.optimize(target_model)
            t_elapsed = time_ns() - t_start
            push!(times, Float64(t_elapsed))
            allocs = timed.gcstats.allocd
            bytes = timed.bytes
        end
        results[opt.name] = OptimizerResult(
            median(times),
            allocs,
            bytes,
            init_res.iterations,
            init_res.start_cost,
            init_res.final_cost,
            init_res.converged
        )
    end
    return results
end

"""
    run_problem_benchmark(prob::ProblemDefinition, size; samples=5, verbose=true) -> SingleSizeBenchmarkResult

Executes the two-phase benchmark for a single problem and size:
1. Model evaluation comparison (cost vs linear system)
2. Best model selection
3. Tier 1 optimizer comparison on the best model
4. Tier 2 optimizer comparison on the universal common model (when available)
"""
function run_problem_benchmark(prob::ProblemDefinition, size; samples=5, verbose=true)
    if verbose
        println("\n" * "="^85)
        println("PROBLEM: $(prob.name) [Category: $(prob.category), $(prob.size_metric_name): $size]")
        println("="^85)
    end

    models = prob.generate_models(size)
    model_results = run_model_benchmarks(models; samples=samples)
    best_model = select_best_model(models, model_results)
    common_model = find_common_model(models)

    if verbose
        println("\n--- [Phase 1: Model Evaluation Benchmarks] ---")
        println(@sprintf("%-32s | %-16s | %-16s", "Model Implementation", "Cost Eval", "Cost + Linear Sys"))
        println("-"^85)
        for m in models
            r = model_results[m.name]
            cost_str = @sprintf("%.2f μs (%d b)", r.cost_time_ns / 1e3, r.cost_bytes)
            linsys_str = @sprintf("%.2f μs (%d b)", r.linsys_time_ns / 1e3, r.linsys_bytes)
            star = m.name == best_model.name ? " ★ (fastest)" : ""
            println(@sprintf("%-32s | %-16s | %-16s%s", m.name, cost_str, linsys_str, star))
        end
    end

    # Phase 2A: Tier 1 Optimizers on Best Model
    tier1_results = run_optimizer_benchmarks(prob.compatible_optimizers, best_model; samples=max(2, samples ÷ 2))

    if verbose
        println("\n--- [Phase 2A: Compatible Optimizers on Best Model: $(best_model.name)] ---")
        println(@sprintf("%-32s | %-14s | %-12s | %-8s | %-12s", "Optimizer", "Runtime", "Allocs", "Iters", "Final Cost"))
        println("-"^85)
        for opt in prob.compatible_optimizers
            if haskey(tier1_results, opt.name)
                r = tier1_results[opt.name]
                time_str = isnan(r.time_ns) ? "FAILED" : @sprintf("%.2f μs", r.time_ns / 1e3)
                alloc_str = @sprintf("%d (%d b)", r.allocs, r.bytes)
                iter_str = string(r.iterations)
                cost_str = isnan(r.final_cost) ? "NaN" : @sprintf("%.4e", r.final_cost)
                println(@sprintf("%-32s | %-14s | %-12s | %-8s | %-12s", opt.name, time_str, alloc_str, iter_str, cost_str))
            end
        end
    end

    # Phase 2B: Tier 2 Optimizers on Common Model (if available and different from best_model)
    tier2_results = Dict{String, OptimizerResult}()
    if common_model !== nothing && prob.category != :manifold
        t2_opts = get_tier2_optimizers()
        tier2_results = run_optimizer_benchmarks(t2_opts, common_model; samples=max(2, samples ÷ 2))

        if verbose
            println("\n--- [Phase 2B: Universal Comparison on Common Model: $(common_model.name)] ---")
            println(@sprintf("%-32s | %-14s | %-12s | %-8s | %-12s", "Optimizer", "Runtime", "Allocs", "Iters", "Final Cost"))
            println("-"^85)
            for opt in t2_opts
                if haskey(tier2_results, opt.name)
                    r = tier2_results[opt.name]
                    time_str = isnan(r.time_ns) ? "FAILED" : @sprintf("%.2f μs", r.time_ns / 1e3)
                    alloc_str = @sprintf("%d (%d b)", r.allocs, r.bytes)
                    iter_str = string(r.iterations)
                    cost_str = isnan(r.final_cost) ? "NaN" : @sprintf("%.4e", r.final_cost)
                    println(@sprintf("%-32s | %-14s | %-12s | %-8s | %-12s", opt.name, time_str, alloc_str, iter_str, cost_str))
                end
            end
        end
    end

    if verbose
        println("="^85)
    end

    return SingleSizeBenchmarkResult(
        prob.name,
        prob.category,
        size,
        prob.size_metric_name,
        model_results,
        best_model.name,
        tier1_results,
        tier2_results
    )
end

"""
    run_scaling_benchmark(prob::ProblemDefinition; sizes=prob.default_sizes, samples=3, verbose=true) -> ProblemScalingBenchmarkResult

Runs the benchmark across all specified problem sizes (collecting at least 10 problem sizes for scaling).
"""
function run_scaling_benchmark(prob::ProblemDefinition; sizes=prob.default_sizes, samples=3, verbose=true)
    if verbose
        println("\n>>> STARTING SCALING BENCHMARK FOR $(prob.name) [$(length(sizes)) SIZES] <<<")
    end
    size_results = SingleSizeBenchmarkResult[]
    for sz in sizes
        res = run_problem_benchmark(prob, sz; samples=samples, verbose=verbose)
        push!(size_results, res)
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
    run_all_scaling_benchmarks(; problems=get_all_problems(), quick=false, samples=quick ? 2 : 4, verbose=true) -> Vector{ProblemScalingBenchmarkResult}

Executes scaling benchmarks across all registered problems.
"""
function run_all_scaling_benchmarks(; problems=get_all_problems(), quick=false, samples=quick ? 2 : 4, verbose=true)
    scaling_results = ProblemScalingBenchmarkResult[]
    for prob in problems
        sizes = quick ? prob.default_sizes[1:min(3, length(prob.default_sizes))] : prob.default_sizes
        res = run_scaling_benchmark(prob; sizes=sizes, samples=samples, verbose=verbose)
        push!(scaling_results, res)
    end
    return scaling_results
end

# -----------------------------------------------------------------------------
# JSON Serialization
# -----------------------------------------------------------------------------

clean_num(x::Real) = (isnan(x) || isinf(x)) ? nothing : Float64(x)
clean_num(x) = x

parse_num(x) = x === nothing ? NaN : Float64(x)

function serialize_result(res::ProblemScalingBenchmarkResult)
    return Dict(
        "problem" => res.problem,
        "category" => string(res.category),
        "size_metric_name" => res.size_metric_name,
        "sizes" => res.sizes,
        "size_results" => [
            Dict(
                "problem" => s.problem,
                "category" => string(s.category),
                "size" => s.size,
                "size_metric_name" => s.size_metric_name,
                "best_model" => s.best_model,
                "model_results" => Dict(
                    k => Dict(
                        "cost_time_ns" => clean_num(v.cost_time_ns),
                        "cost_allocs" => v.cost_allocs,
                        "cost_bytes" => v.cost_bytes,
                        "linsys_time_ns" => clean_num(v.linsys_time_ns),
                        "linsys_allocs" => v.linsys_allocs,
                        "linsys_bytes" => v.linsys_bytes
                    ) for (k, v) in s.model_results
                ),
                "tier1_optimizer_results" => Dict(
                    k => Dict(
                        "time_ns" => clean_num(v.time_ns),
                        "allocs" => v.allocs,
                        "bytes" => v.bytes,
                        "iterations" => v.iterations,
                        "start_cost" => clean_num(v.start_cost),
                        "final_cost" => clean_num(v.final_cost),
                        "converged" => v.converged
                    ) for (k, v) in s.tier1_optimizer_results
                ),
                "tier2_optimizer_results" => Dict(
                    k => Dict(
                        "time_ns" => clean_num(v.time_ns),
                        "allocs" => v.allocs,
                        "bytes" => v.bytes,
                        "iterations" => v.iterations,
                        "start_cost" => clean_num(v.start_cost),
                        "final_cost" => clean_num(v.final_cost),
                        "converged" => v.converged
                    ) for (k, v) in s.tier2_optimizer_results
                )
            ) for s in res.size_results
        ]
    )
end

function deserialize_result(d::AbstractDict)
    size_results = SingleSizeBenchmarkResult[]
    for s in d["size_results"]
        m_res = Dict{String, ModelEvaluationResult}()
        for (k, v) in s["model_results"]
            m_res[k] = ModelEvaluationResult(
                parse_num(v["cost_time_ns"]),
                Int(v["cost_allocs"]),
                Int(v["cost_bytes"]),
                parse_num(v["linsys_time_ns"]),
                Int(v["linsys_allocs"]),
                Int(v["linsys_bytes"])
            )
        end
        t1_res = Dict{String, OptimizerResult}()
        for (k, v) in s["tier1_optimizer_results"]
            t1_res[k] = OptimizerResult(
                parse_num(v["time_ns"]),
                Int(v["allocs"]),
                Int(v["bytes"]),
                Int(v["iterations"]),
                parse_num(v["start_cost"]),
                parse_num(v["final_cost"]),
                Bool(v["converged"])
            )
        end
        t2_res = Dict{String, OptimizerResult}()
        for (k, v) in s["tier2_optimizer_results"]
            t2_res[k] = OptimizerResult(
                parse_num(v["time_ns"]),
                Int(v["allocs"]),
                Int(v["bytes"]),
                Int(v["iterations"]),
                parse_num(v["start_cost"]),
                parse_num(v["final_cost"]),
                Bool(v["converged"])
            )
        end
        push!(size_results, SingleSizeBenchmarkResult(
            String(s["problem"]),
            Symbol(s["category"]),
            s["size"],
            String(s["size_metric_name"]),
            m_res,
            String(s["best_model"]),
            t1_res,
            t2_res
        ))
    end
    return ProblemScalingBenchmarkResult(
        String(d["problem"]),
        Symbol(d["category"]),
        String(d["size_metric_name"]),
        Vector{Any}(d["sizes"]),
        size_results
    )
end

"""
    save_benchmark_results(results::Vector{ProblemScalingBenchmarkResult}, filepath::String)

Serializes multi-size benchmark results to a JSON file.
"""
function save_benchmark_results(results::Vector{ProblemScalingBenchmarkResult}, filepath::String)
    mkpath(dirname(filepath))
    open(filepath, "w") do io
        JSON.print(io, [serialize_result(r) for r in results], 2)
    end
    return filepath
end

"""
    load_benchmark_results(filepath::String) -> Vector{ProblemScalingBenchmarkResult}

Loads benchmark results from a JSON file.
"""
function load_benchmark_results(filepath::String)
    raw = JSON.parsefile(filepath)
    return ProblemScalingBenchmarkResult[deserialize_result(d) for d in raw]
end
