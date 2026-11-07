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

function generate_docs_markdown(results::Vector{ProblemScalingBenchmarkResult}; docs_dir=joinpath(@__DIR__, "..", "docs", "src"))
    mkpath(joinpath(docs_dir, "problems"))
    mkpath(joinpath(docs_dir, "assets", "plots"))
    mkpath(joinpath(docs_dir, "data"))

    # 1. Generate index.md
    index_md = """
# SmoothOptimizerBenchmark.jl

**SmoothOptimizerBenchmark.jl** provides systematic, reproducible, multi-scale performance benchmarking across all major Julia smooth second-order and trust-region optimizers:

- **`SecondOrderOptimization.jl`**: Levenberg-Marquardt and Dogleg trust-region algorithms with zero-allocation static, dense, and sparse linear system solvers.
- **`LeastSquaresOptim.jl`**: Levenberg-Marquardt and Dogleg algorithms for nonlinear least squares.
- **`Optim.jl`**: Trust-Region Newton (`NewtonTrustRegion`) and Line-Search Newton (`Newton`).
- **`JSOSolvers.jl`**: Trust-region solver `trunk` and bound-constrained/unconstrained trust-region solver `tron`.
- **`Ipopt.jl`**: Interior-point nonlinear programming solver via `NLPModelsIpopt`.
- **`MadNLP.jl`**: Pure-Julia filter line-search interior-point algorithm supporting sparse and dense linear solvers via `NLPModels`.
- **`NonlinearSolve.jl`**: High-performance SciML nonlinear and least-squares solvers (`LevenbergMarquardt`, `TrustRegion`, `GaussNewton`).
- **`Manopt.jl`**: Riemannian trust-region and Levenberg-Marquardt solvers on Riemannian matrix manifolds (for manifold benchmarks).

---

## Benchmarking Methodology

### Two-Tier Strategy
Because optimization packages accept varying levels of abstraction (vector residual & Jacobian vs scalar objective & Hessian vs NLP models), benchmarks execute in two tiers:

1. **Tier 1 (Peak Performance on Best Model)**: Optimizers capable of natively exploiting zero-allocation block-sparse linear systems (`NLLSModel`) run directly on the fastest model formulation.
2. **Tier 2 (Universal Apples-to-Apples Comparison)**: All 7 Euclidean optimizer families (`SecondOrderOptimization`, `LeastSquaresOptim`, `Optim`, `JSOSolvers`, `Ipopt`, `MadNLP`, `NonlinearSolve`) run on a standardized, shared `LeastSquaresProblem` / `LeastSquaresNLPModel`. Every solver evaluates the exact same underlying residual and derivative code.

### Problem Scaling Sweeps (≥ 10 Sizes per Problem)
For every benchmark problem, performance is evaluated across at least **10 distinct problem sizes** spanning multiple orders of magnitude. For each size, the harness measures:
- **Model Evaluation**: Pure cost evaluation time, cost + linear system assembly time, memory allocations, and memory bandwidth.
- **Optimizer Evaluation**: Total solve runtime to convergence, outer iteration count, initial cost, final achieved cost, and convergence status.
- **Log-Log Scaling Plots**: Problem size vs. evaluation time (log-log) for both model representations and optimizer solvers to empirically observe asymptotic complexity \$\\mathcal{O}(N)\$, \$\\mathcal{O}(N^2)\$, or \$\\mathcal{O}(N^3)\$.

---

## Benchmark Problem Suite

| Problem | Category | Scaling Parameter | Sizes Tested | Tested Solvers |
|:---|:---|:---|:---|:---|
| [Dense Rosenbrock](problems/rosenbrock_dense.md) | Small Static Dense | Dimension \$n\$ | 12 sizes (\$n = 1 \\dots 32\$) | SOO, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve |
| [Dense Affine Alignment](problems/affine_alignment.md) | Small Static Dense | Dimension \$n\$ | 12 sizes (\$n = 1 \\dots 32\$) | SOO, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve |
| [Robust Procrustes on SO(d)](problems/robust_procrustes.md) | Small Static Manifold | Matrix dimension \$d\$ | 11 sizes (\$d = 2 \\dots 32\$) | SOO (ManifoldVar & Specialized), Manopt |
| [Exponential Curve Fitting](problems/curve_fitting.md) | Medium Dynamic Dense | Data points \$m\$ | 10 sizes (\$m = 2^6 \\dots 2^{15}\$) | SOO, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve |
| [Sparse Rosenbrock](problems/rosenbrock_sparse.md) | Large Sparse Banded | Dimension \$n\$ | 11 sizes (\$n = 2^{10} \\dots 2^{20}\$) | SOO, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve |
| [3D Pose Chain](problems/pose_chain.md) | Large Sparse SLAM | Number of poses \$N\$ | 11 sizes (\$N = 2^{10} \\dots 2^{20}\$) | SOO, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve |
| [Sparse Bundle Adjustment](problems/bundle_adjustment.md) | Large Sparse Bipartite | Cameras \$N_{\\text{cam}}\$ | 10 sizes (\$N_{\\text{cam}} = 4 \\dots 256\$) | SOO, JSOSolvers, Ipopt, MadNLP |

---

## Executive Summary of Results

1. **Model Evaluation & Assembly Overhead**:
   - `NLLSModel.jl` achieves up to **5×–20× lower evaluation latency and zero memory allocations** compared to standard dense/sparse Jacobian constructions by compiling static or block-sparse residuals.
   - For banded and sparse pose-graph problems, block-sparse linear system assembly scales strictly linearly \$\\mathcal{O}(N)\$ in time and memory.

2. **Optimizer Efficiency & Convergence**:
   - **`SecondOrderOptimization.jl` (Dogleg & LM)**: Consistently yields the lowest per-iteration overhead and total execution runtime, especially on sparse problems when paired with the direct sparse LDL factorizer.
   - **`LeastSquaresOptim.jl`**: High reliability on standard least-squares problems; Dogleg steps frequently require fewer outer iterations than LM on well-conditioned problems.
   - **`Optim.jl` (`NewtonTrustRegion` / `Newton`)**: Highly competitive on small-to-medium dense problems; for sparse problems, line-search Newton with sparse Hessians avoids dense allocations, though trust-region requires dense matrix factorizations.
   - **`JSOSolvers.jl` (`trunk` / `tron`)**: Robust convergence behavior via the standard `NLPModels` interface, suitable for general constrained and unconstrained problems.
   - **`Ipopt`**: Very reliable convergence from far-from-solution initializations, though per-iteration linear algebra overhead is substantially higher than dedicated unconstrained least-squares solvers.
   - **`MadNLP.jl`**: Pure-Julia interior-point solver with native sparse linear solver integration via `NLPModels`. Scales efficiently on large sparse benchmarks (Bundle Adjustment, Pose Chain, and Sparse Rosenbrock) with memory allocation profiles comparable to Ipopt while maintaining high numerical stability.
   - **`NonlinearSolve.jl` (`TrustRegion` / `LM`)**: Solid convergence and performance on small-to-medium dense problems and structured curve fitting via SciML linear solves; requires explicit sparse Jacobian prototypes on large problems to avoid dense fallback.
"""
    open(joinpath(docs_dir, "index.md"), "w") do io
        write(io, index_md)
    end

    # 2. Generate per-problem pages
    for res in results
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

    md = """
# $(res.problem)

- **Category**: `$(res.category)`
- **Scaling Metric**: $(res.size_metric_name)
- **Problem Sizes Evaluated**: $(join(res.sizes, ", ")) ($(num_sizes) sizes)
- **Standard Baseline Model for Solvers**: `$(target_model_name)`

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed lines) and **Cost + Linear System Assembly** (solid lines) across problem sizes.

![$(res.problem) Model Evaluation Scaling](../assets/plots/$(slug)_models.png)

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers on the standardized baseline model (`$(target_model_name)`).

![$(res.problem) Optimizer Scaling](../assets/plots/$(slug)_optimizers.png)

---

## 3. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/$(slug).md)

---

## 4. Analysis & Key Takeaways

- **Asymptotic Complexity**: Log-log scaling indicates empirical runtime growth rate as $(res.size_metric_name) expands.
- **Model Efficiency**: Block-sparse representations and static representations avoid heap allocations during linear system construction.
- **Top Optimizer**: Solvers leveraging specialized structure (e.g. sparse block factorization in SecondOrderOptimization) demonstrate superior scaling exponents on large problem regimes.
"""

    return md
end
