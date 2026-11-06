# SmoothOptimizerBenchmark.jl

**SmoothOptimizerBenchmark.jl** provides systematic, reproducible, multi-scale performance benchmarking across all major Julia smooth second-order and trust-region optimizers:

- **`SecondOrderOptimization.jl`**: Levenberg-Marquardt and Dogleg trust-region algorithms with zero-allocation static, dense, and sparse linear system solvers.
- **`LeastSquaresOptim.jl`**: Levenberg-Marquardt and Dogleg algorithms for nonlinear least squares.
- **`Optim.jl`**: Trust-Region Newton (`NewtonTrustRegion`) and Line-Search Newton (`Newton`).
- **`JSOSolvers.jl`**: Trust-region solver `trunk` and bound-constrained/unconstrained trust-region solver `tron`.
- **`Ipopt.jl`**: Interior-point nonlinear programming solver via `NLPModelsIpopt`.
- **`Manopt.jl`**: Riemannian trust-region and Levenberg-Marquardt solvers on Riemannian matrix manifolds (for manifold benchmarks).

---

## Benchmarking Methodology

### Two-Tier Strategy
Because optimization packages accept varying levels of abstraction (vector residual & Jacobian vs scalar objective & Hessian vs NLP models), benchmarks execute in two tiers:

1. **Tier 1 (Peak Performance on Best Model)**: Optimizers capable of natively exploiting zero-allocation block-sparse linear systems (`NLLSModel`) run directly on the fastest model formulation.
2. **Tier 2 (Universal Apples-to-Apples Comparison)**: All 5 Euclidean optimizer families run on a standardized, shared `LeastSquaresProblem` / `LeastSquaresNLPModel`. Every solver evaluates the exact same underlying residual and derivative code.

### Problem Scaling Sweeps (≥ 10 Sizes per Problem)
For every benchmark problem, performance is evaluated across at least **10 distinct problem sizes** spanning multiple orders of magnitude. For each size, the harness measures:
- **Model Evaluation**: Pure cost evaluation time, cost + linear system assembly time, memory allocations, and memory bandwidth.
- **Optimizer Evaluation**: Total solve runtime to convergence, outer iteration count, initial cost, final achieved cost, and convergence status.
- **Log-Log Scaling Plots**: Problem size vs. evaluation time (log-log) for both model representations and optimizer solvers to empirically observe asymptotic complexity $\mathcal{O}(N)$, $\mathcal{O}(N^2)$, or $\mathcal{O}(N^3)$.

---

## Benchmark Problem Suite

| Problem | Category | Scaling Parameter | Sizes Tested | Tested Solvers |
|:---|:---|:---|:---|:---|
| [Sparse Rosenbrock](problems/rosenbrock_sparse.md) | Large Sparse Banded | Dimension $n$ | 10 sizes ($n = 2 \dots 2000$) | SOO, LeastSquaresOptim, Optim, JSOSolvers, Ipopt |
| [Exponential Curve Fitting](problems/curve_fitting.md) | Small Dense Regression | Data points $m$ | 10 sizes ($m = 10 \dots 10000$) | SOO, LeastSquaresOptim, Optim, JSOSolvers, Ipopt |
| [Dense Rosenbrock](problems/rosenbrock_dense.md) | Large Dense Coupled | Dimension $n$ | 10 sizes ($n = 4 \dots 60$) | SOO, LeastSquaresOptim, Optim, JSOSolvers, Ipopt |
| [Dense Affine Alignment](problems/affine_alignment.md) | Large Dense Registration | Dimension $n$ | 10 sizes ($n = 2 \dots 12$) | SOO, LeastSquaresOptim, Optim, JSOSolvers, Ipopt |
| [3D Pose Chain](problems/pose_chain.md) | Sparse Pose-Graph SLAM | Number of poses $N$ | 10 sizes ($N = 5 \dots 2500$) | SOO, LeastSquaresOptim, Optim, JSOSolvers, Ipopt |
| [Sparse Bundle Adjustment](problems/bundle_adjustment.md) | Large Sparse Bipartite | Cameras $N_{\text{cam}}$ | 10 sizes ($N_{\text{cam}} = 5 \dots 200$) | SOO, JSOSolvers, Ipopt |
| [Robust Procrustes on SO(d)](problems/robust_procrustes.md) | Riemannian Manifold | Matrix dimension $d$ | 10 sizes ($d = 2 \dots 12$) | SOO (ManifoldVar & Specialized), Manopt |

---

## Executive Summary of Results

1. **Model Evaluation & Assembly Overhead**:
   - `NLLSModel.jl` achieves up to **5×–20× lower evaluation latency and zero memory allocations** compared to standard dense/sparse Jacobian constructions by compiling static or block-sparse residuals.
   - For banded and sparse pose-graph problems, block-sparse linear system assembly scales strictly linearly $\mathcal{O}(N)$ in time and memory.

2. **Optimizer Efficiency & Convergence**:
   - **`SecondOrderOptimization.jl` (Dogleg & LM)**: Consistently yields the lowest per-iteration overhead and total execution runtime, especially on sparse problems when paired with the direct sparse LDL factorizer.
   - **`LeastSquaresOptim.jl`**: High reliability on standard least-squares problems; Dogleg steps frequently require fewer outer iterations than LM on well-conditioned problems.
   - **`Optim.jl` (`NewtonTrustRegion`)**: Highly competitive on small-to-medium dense problems, but exhibits higher memory allocation overhead on large sparse problems where Hessian inversion becomes dense without specialized sparse adapters.
   - **`JSOSolvers.jl` (`trunk` / `tron`)**: Robust convergence behavior via the standard `NLPModels` interface, suitable for general constrained and unconstrained problems.
   - **`Ipopt`**: Very reliable convergence from far-from-solution initializations, though per-iteration linear algebra overhead is substantially higher than dedicated unconstrained least-squares solvers.
