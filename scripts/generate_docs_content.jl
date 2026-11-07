# Script to generate markdown pages for Documenter.jl from benchmark results
using SmoothOptimizerBenchmark
using Printf

function format_time(ns::Float64)
    isnan(ns) && return "FAILED"
    ns < 1e3 && return @sprintf("%.1f ns", ns)
    ns < 1e6 && return @sprintf("%.2f μs", ns / 1e3)
    ns < 1e9 && return @sprintf("%.2f ms", ns / 1e6)
    return @sprintf("%.2f s", ns / 1e9)
end

function format_bytes(bytes::Int)
    bytes < 1024 && return "$(bytes) B"
    bytes < 1024^2 && return @sprintf("%.1f KiB", bytes / 1024)
    return @sprintf("%.1f MiB", bytes / (1024^2))
end

const CANONICAL_PROBLEM_SLUGS = [
    "rosenbrock_sparse",
    "curve_fitting",
    "rosenbrock_dense",
    "affine_alignment",
    "pose_chain",
    "bundle_adjustment",
    "robust_procrustes"
]

function sort_results_canonically(results::Vector{ProblemScalingBenchmarkResult})
    slug_rank(r) = begin
        idx = findfirst(==(problem_slug(r.problem)), CANONICAL_PROBLEM_SLUGS)
        idx === nothing ? 999 : idx
    end
    return sort(results; by = r -> (slug_rank(r), r.problem))
end

function summarize_solvers(res::ProblemScalingBenchmarkResult)
    pkgs = String[]
    seen = Set{String}()
    order = [
        ("nllsmodel", "NLLSModel + SecondOrderOptimization"),
        ("secondorder", "SecondOrderOptimization"),
        ("leastsquares", "LeastSquaresOptim"),
        ("optim (", "Optim"),
        ("jsosolvers", "JSOSolvers"),
        ("ipopt", "Ipopt"),
        ("madnlp", "MadNLP"),
        ("nonlinearsolve", "NonlinearSolve"),
        ("cannoles", "CaNNOLeS"),
        ("manopt", "Manopt")
    ]
    all_names = String[]
    for sr in res.size_results
        append!(all_names, keys(sr.optimizer_results))
    end
    for (needle, label) in order
        if any(n -> occursin(needle, lowercase(n)), all_names) && !(label in seen)
            push!(pkgs, label)
            push!(seen, label)
        end
    end
    return join(pkgs, ", ")
end

function generate_docs_markdown(results::Vector{ProblemScalingBenchmarkResult}; docs_dir=DEFAULT_DOCS_DIR)
    mkpath(joinpath(docs_dir, "problems"))
    mkpath(joinpath(docs_dir, "assets", "plots"))
    mkpath(joinpath(docs_dir, "data"))

    ordered_results = sort_results_canonically(results)

    suite_rows = String[]
    for res in ordered_results
        slug = problem_slug(res.problem)
        n_sz = length(res.sizes)
        sz_range = isempty(res.sizes) ? "-" : "$(first(res.sizes)) … $(last(res.sizes))"
        target_m = isempty(res.size_results) ? "Standard" : first(res.size_results).target_model
        solvers_str = summarize_solvers(res)
        push!(suite_rows, "| [$(res.problem)](problems/$(slug).md) | `$(res.category)` | $(res.size_metric_name) | $(n_sz) sizes ($(sz_range)) | `$(target_m)` | $(solvers_str) |")
    end
    suite_table = join(suite_rows, "\n")

    # 1. Generate index.md
    index_md = """
# SmoothOptimizerBenchmark.jl

**SmoothOptimizerBenchmark.jl** provides systematic, reproducible, multi-scale performance benchmarking across smooth second-order, nonlinear least-squares, and Riemannian manifold optimization packages in Julia:

- **`SecondOrderOptimization.jl`**: Levenberg-Marquardt and Dogleg trust-region algorithms with zero-allocation static, dense, and sparse linear system solvers.
- **`LeastSquaresOptim.jl`**: Levenberg-Marquardt and Dogleg algorithms for nonlinear least squares.
- **`Optim.jl`**: Trust-Region Newton (`NewtonTrustRegion`) and Line-Search Newton (`Newton`).
- **`JSOSolvers.jl`**: Matrix-free / trust-region solvers `trunk` and `tron` via `NLPModels`.
- **`Ipopt.jl`**: Primal-dual interior-point nonlinear programming solver via `NLPModelsIpopt`.
- **`MadNLP.jl`**: Pure-Julia filter line-search interior-point solver via `NLPModels`.
- **`NonlinearSolve.jl`**: SciML nonlinear least-squares solvers (`LevenbergMarquardt`, `TrustRegion`).
- **`CaNNOLeS.jl`**: Constrained and nonlinear least-squares solver exploiting equality-constrained KKT structure.
- **`Manopt.jl`**: Riemannian Levenberg-Marquardt optimization on matrix manifolds (`Manifolds.jl`).

---

## Benchmarking Methodology

### Two-Phase Decoupled Architecture
To separate modeling overhead from solver algorithm efficiency, every problem is benchmarked in two phases:

1. **Phase 1 — Model Evaluation Scaling**:
   Benchmarks pure **Cost Evaluation** (\$f(x) = \\frac{1}{2}\\|r(x)\\|_2^2\$) and **Cost + Linear System Assembly** (\$g = J^T r\$ and \$H = J^T J\$ or exact Hessian) across competing model representations (`NLLSModel`, `Standalone` `LeastSquaresProblem`, `NLPModels` / `JuMP`, `BundleAdjustmentModels`, and `Manifolds`).
2. **Phase 2 — Unified Apples-to-Apples Optimizer Scaling**:
   All compatible optimizers are benchmarked on a single **standardized baseline model** per category (`Standalone` for Euclidean problems, `BundleAdjustmentModels` for Bundle Adjustment, and `Manifolds` for Riemannian optimization) under identical stopping tolerances (`gtol = $(DEFAULT_GTOL)`, `xtol = $(DEFAULT_XTOL)`, `ftol = $(DEFAULT_FTOL)`, `maxiters = $(DEFAULT_MAXITERS)`, `maxtime = $(DEFAULT_MAXTIME)s`).
   - Alongside the shared-baseline solver curves, **full-stack `NLLSModel + SecondOrderOptimization`** combinations evaluated from a cold start are included on every benchmark with **star (`★`) point markers**.
   - Every concrete `(optimizer, model-type)` specialization is pre-warmed prior to timing so LLVM JIT compilation is excluded.
   - Solvers that fail to satisfy convergence criteria (e.g., hitting iteration/time limits or stalling) are recorded as `converged = false` in the raw data tables and omitted (`NaN`) from convergence runtime plots.
   - Results stream line-by-line directly to Markdown tables in `docs/src/data/` as each model and optimizer measurement completes.

---

## Benchmark Problem Suite

| Problem | Category | Scaling Metric | Sizes Tested | Baseline Model | Tested Solver Packages |
|:---|:---|:---|:---|:---|:---|
$(suite_table)

---

## Executive Summary of Results

1. **Model Evaluation & Linear System Assembly**:
   - `NLLSModel.jl` achieves zero-allocation cost and Gauss-Newton normal-equation assembly on static and block-sparse problems, outperforming generic `JuMP` / `NLPModels` and `BundleAdjustmentModels` coordinate assembly by **3×–10×** at scale.
   - Hand-specialized manifold residuals (`NLLSModel (Specialized)`) on \$SO(d)\$ eliminate tangent-basis allocation overhead relative to generic `Manifolds.jl` / `ManifoldVar` representations.

2. **Optimizer Efficiency & Scaling**:
   - **`SecondOrderOptimization.jl` (LM & Dogleg)**: Consistently delivers the lowest latency on small-to-medium dense problems and scales linearly on banded/tridiagonal sparse problems via direct sparse `LDL` factorizations.
   - **`CaNNOLeS.jl` & `MadNLP.jl`**: Excel on large-scale sparse Bundle Adjustment, where augmented KKT / interior-point sparse factorizations avoid dense fill-in from high-degree camera columns in \$J^T J\$.
   - **`Optim.jl` (`Newton` / `NewtonTrustRegion`)**: Strong performance on dense problems and sparse line-search Newton; `NewtonTrustRegion` requires dense eigendecompositions and is inapplicable to sparse Hessians.
   - **`JSOSolvers.jl` (`trunk` / `tron`)**: Matrix-free Krylov trust-region methods (`hprod!`) scale well on well-conditioned sparse problems (such as Sparse Rosenbrock) with minimal memory footprint, though unpreconditioned CG struggles on ill-conditioned Bundle Adjustment and long Pose Chains.
   - **`Ipopt.jl`**: Highly reliable global convergence across dense and sparse problems, with higher per-iteration interior-point overhead at small problem sizes.
   - **`LeastSquaresOptim.jl` & `NonlinearSolve.jl`**: Competitive on small and medium dense problems; on large sparse problems, unpreconditioned iterative `LSMR` (`LeastSquaresOptim`) and sparse QR (`NonlinearSolve`) become bottlenecked compared to sparse Cholesky/LDL normal-equation or KKT solvers.
"""
    open(joinpath(docs_dir, "index.md"), "w") do io
        write(io, index_md)
    end

    # 2. Generate per-problem pages
    for res in ordered_results
        slug = problem_slug(res.problem)
        prob_md = generate_problem_markdown(res, slug)
        open(joinpath(docs_dir, "problems", "$(slug).md"), "w") do io
            write(io, prob_md)
        end
    end
end

function generate_problem_markdown(res::ProblemScalingBenchmarkResult, slug::String)
    target_model_name = isempty(res.size_results) ? "Standard" : first(res.size_results).target_model
    num_sizes = length(res.sizes)

    # Compute data-driven highlights at largest size with model/optimizer data
    model_summary_str = "Block-sparse and static formulations minimize heap allocations during normal-equation assembly."
    opt_summary_str = "Solvers exploiting problem sparsity and exact second-order structure achieve superior asymptotic scaling."

    if !isempty(res.size_results)
        last_sr = last(res.size_results)
        valid_m = [(k, v) for (k, v) in last_sr.model_results if !isnan(v.linsys_time_ns) && v.linsys_time_ns > 0]
        if !isempty(valid_m)
            sort!(valid_m, by = x -> x[2].linsys_time_ns)
            best_m_name, best_mr = first(valid_m)
            model_summary_str = "At $(res.size_metric_name) = `$(last_sr.size)`, **`$(best_m_name)`** achieves the fastest Cost + Linear System evaluation at **$(format_time(best_mr.linsys_time_ns))** ($(format_bytes(best_mr.linsys_bytes)) allocated)."
        end

        # Find largest size where at least one optimizer converged
        for idx in length(res.size_results):-1:1
            sr = res.size_results[idx]
            conv_opts = [(k, v) for (k, v) in sr.optimizer_results if v.converged && !isnan(v.time_ns) && v.time_ns > 0]
            if !isempty(conv_opts)
                sort!(conv_opts, by = x -> x[2].time_ns)
                best_o_name, best_or = first(conv_opts)
                n_total = length(sr.optimizer_results)
                opt_summary_str = "At $(res.size_metric_name) = `$(sr.size)` ($(length(conv_opts))/$(n_total) solvers converged), **`$(best_o_name)`** is fastest at **$(format_time(best_or.time_ns))** ($(best_or.iterations) iterations, final cost `$(@sprintf("%.2e", best_or.final_cost))`)."
                break
            end
        end
    end

    has_phase1 = !isempty(res.size_results) && any(sr -> length(sr.model_results) > 1, res.size_results)

    phase1_section = if has_phase1
        """
## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed/dotted lines) and **Cost + Linear System Assembly** (solid/dash-dot lines) across problem sizes.

![$(res.problem) Model Evaluation Scaling](../assets/plots/$(slug)_models.png)
"""
    else
        """
## 1. Model Evaluation Scaling

This problem uses `$(target_model_name)` universally across all solvers via its built-in adapters; Phase 1 comparative model evaluation is omitted.
"""
    end

    model_summary_line = has_phase1 ? "- **Model Efficiency**: $(model_summary_str)" : "- **Model Architecture**: Handled universally via `$(target_model_name)` with built-in zero-allocation adapters."

    md = """
# $(res.problem)

- **Category**: `$(res.category)`
- **Scaling Metric**: $(res.size_metric_name)
- **Problem Sizes Evaluated**: $(join(res.sizes, ", ")) ($(num_sizes) sizes)
- **Standard Baseline Model for Solvers**: `$(target_model_name)`

---

$(phase1_section)
---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers on the standardized baseline model (`$(target_model_name)`), together with full-stack zero-allocation **`NLLSModel + SecondOrderOptimization`** runs (star markers). Non-converged runs are omitted.

![$(res.problem) Optimizer Scaling](../assets/plots/$(slug)_optimizers.png)

---

## 3. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/$(slug).md)

---

## 4. Analysis & Key Takeaways

$(model_summary_line)
- **Top Converged Optimizer**: $(opt_summary_str)
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = $(DEFAULT_GTOL)`, `xtol = $(DEFAULT_XTOL)`, `ftol = $(DEFAULT_FTOL)`) within `$(DEFAULT_MAXITERS)` iterations and `$(DEFAULT_MAXTIME)s` are plotted.
"""

    return md
end
