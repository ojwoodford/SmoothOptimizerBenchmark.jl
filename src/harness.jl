# Evaluation harness for SmoothOptimizerBenchmark
using BenchmarkTools
using Printf
using Statistics

export run_model_benchmarks, select_best_model, run_optimizer_benchmarks
export run_problem_benchmark, run_all_benchmarks

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
    run_optimizer_benchmarks(optimizers::Vector{OptimizerDefinition}, best_model::ModelDefinition; samples=3, evals=1)

Runs all compatible optimizers on the selected best model, returning performance statistics.
"""
function run_optimizer_benchmarks(optimizers::Vector{OptimizerDefinition}, best_model::ModelDefinition; samples=3, evals=1)
    results = Dict{String, OptimizerResult}()
    for opt in optimizers
        best_model.reset!()
        # Warmup and initial run to capture iterations and costs
        init_res = nothing
        try
            init_res = opt.optimize(best_model)
        catch err
            @warn "Optimizer $(opt.name) failed during warmup: $err"
            results[opt.name] = OptimizerResult(NaN, 0, 0, 0, NaN, NaN, false)
            continue
        end

        # Timed benchmark run
        best_model.reset!()
        b = @benchmark $(opt.optimize)($best_model) setup=($(best_model.reset!)()) samples=samples evals=evals
        m = median(b)
        results[opt.name] = OptimizerResult(
            Float64(m.time),
            b.allocs,
            b.memory,
            init_res.iterations,
            init_res.start_cost,
            init_res.final_cost,
            init_res.converged
        )
    end
    return results
end

"""
    run_problem_benchmark(prob::ProblemDefinition, size; samples=5, verbose=true)

Executes the two-phase benchmark for a single problem and size:
1. Model evaluation comparison (cost vs linear system)
2. Best model selection
3. Compatible optimizer comparison on the best model
"""
function run_problem_benchmark(prob::ProblemDefinition, size; samples=5, verbose=true)
    if verbose
        println("\n" * "="^85)
        println("PROBLEM: $(prob.name) [Category: $(prob.category), Size: $size]")
        println("="^85)
    end

    models = prob.generate_models(size)
    model_results = run_model_benchmarks(models; samples=samples)
    best_model = select_best_model(models, model_results)

    if verbose
        println("\n--- [Phase 1: Model Evaluation Benchmarks] ---")
        println(@sprintf("%-32s | %-16s | %-16s", "Model Implementation", "Cost Eval", "Cost + Linear Sys"))
        println("-"^85)
        for m in models
            r = model_results[m.name]
            cost_str = @sprintf("%.2f μs (%d b)", r.cost_time_ns / 1e3, r.cost_bytes)
            linsys_str = @sprintf("%.2f μs (%d b)", r.linsys_time_ns / 1e3, r.linsys_bytes)
            star = m.name == best_model.name ? " ★ (selected)" : ""
            println(@sprintf("%-32s | %-16s | %-16s%s", m.name, cost_str, linsys_str, star))
        end
    end

    optimizer_results = run_optimizer_benchmarks(prob.compatible_optimizers, best_model; samples=max(3, samples ÷ 2))

    if verbose
        println("\n--- [Phase 2: Optimizer Benchmarks on Best Model: $(best_model.name)] ---")
        println(@sprintf("%-32s | %-14s | %-12s | %-8s | %-12s", "Optimizer", "Runtime", "Allocs", "Iters", "Final Cost"))
        println("-"^85)
        for opt in prob.compatible_optimizers
            if haskey(optimizer_results, opt.name)
                r = optimizer_results[opt.name]
                time_str = isnan(r.time_ns) ? "FAILED" : @sprintf("%.2f μs", r.time_ns / 1e3)
                alloc_str = @sprintf("%d (%d b)", r.allocs, r.bytes)
                iter_str = string(r.iterations)
                cost_str = isnan(r.final_cost) ? "NaN" : @sprintf("%.4e", r.final_cost)
                println(@sprintf("%-32s | %-14s | %-12s | %-8s | %-12s", opt.name, time_str, alloc_str, iter_str, cost_str))
            end
        end
        println("="^85)
    end

    return (
        problem = prob.name,
        size = size,
        model_results = model_results,
        best_model = best_model.name,
        optimizer_results = optimizer_results
    )
end

"""
    run_all_benchmarks(problems::Vector{ProblemDefinition}; verbose=true, quick=false)

Runs the complete benchmark suite across all registered problems.
"""
function run_all_benchmarks(problems::Vector{ProblemDefinition}; verbose=true, quick=false)
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
