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
   Benchmarks pure **Cost Evaluation** ($f(x) = \frac{1}{2}\|r(x)\|_2^2$) and **Cost + Linear System Assembly** ($g = J^T r$ and $H = J^T J$ or exact Hessian) across competing model representations (`NLLSModel`, `Standalone` `LeastSquaresProblem`, `NLPModels` / `JuMP`, `BundleAdjustmentModels`, and `Manifolds`).
2. **Phase 2 — Peak Solver Throughput Scaling (Each Optimizer on Optimal Model)**:
   Every optimizer is benchmarked on its natural, optimal model representation (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` / `BundleAdjustmentModels` for JSO and interior-point solvers, and `Manifolds` for `Manopt`) under identical universal stopping criteria (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`, `maxiters = 500`, `maxtime = 30.0s`).
   - Every optimizer appears as **exactly one curve**, comparing solvers at their peak practical throughput from a fair cold start without wrapper penalties or duplicate entries.
   - Every concrete `(optimizer, model-type)` specialization is pre-warmed prior to timing so LLVM JIT compilation is excluded.
   - Solvers that fail to satisfy convergence criteria (e.g., hitting iteration/time limits or stalling) are recorded as `converged = false` in the raw data tables and omitted (`NaN`) from convergence runtime plots.
   - Results stream line-by-line directly to Markdown tables in `docs/src/data/` as each model and optimizer measurement completes.

---

## Benchmark Problem Suite

| Problem | Category | Scaling Metric | Sizes Tested | Baseline Model | Tested Solver Packages |
|:---|:---|:---|:---|:---|:---|
| [Sparse Multi-dimensional Rosenbrock](problems/rosenbrock_sparse.md) | `large_sparse` | Variables n | 11 sizes (100 … 75000) | `Standalone (Sparse)` | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [Exponential Curve Fitting](problems/curve_fitting.md) | `medium_dense` | Data Points m | 11 sizes (64 … 65536) | `Standalone` | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [Dense Multi-dimensional Rosenbrock](problems/rosenbrock_dense.md) | `small_dense` | Dimension n | 12 sizes (2 … 32) | `Standalone` | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [Dense Affine Alignment](problems/affine_alignment.md) | `small_dense` | Dimension n | 12 sizes (1 … 32) | `Standalone` | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [Nonlinear 3D Pose Chain](problems/pose_chain.md) | `large_sparse` | Poses N | 11 sizes (50 … 10000) | `NLLSModel (Sparse)` | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [1D ODE Boundary Value Problem](problems/ode_bvp.md) | `large_sparse` | Grid Points N | 11 sizes (32 … 32768) | `Standalone (Sparse)` | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [Sparse Bundle Adjustment](problems/bundle_adjustment.md) | `large_sparse` | Cameras Ncam | 12 sizes (4 … 256) | `BundleAdjustmentModels` | SecondOrderOptimization, JSOSolvers, Ipopt, MadNLP, CaNNOLeS |
| [Robust Procrustes on SO(d)](problems/robust_procrustes.md) | `manifold` | Matrix Dimension d | 11 sizes (3 … 32) | `Manifolds` | SecondOrderOptimization, Manopt |
| [Ill-Conditioned Polynomial Fitting](problems/ill-conditioned_polynomial_fitting.md) | `medium_dense` | Data Points m | 11 sizes (60 … 6400) | `Standalone` | SecondOrderOptimization, LeastSquaresOptim, Optim |

---

## Executive Summary of Results

1. **Model Evaluation & Linear System Assembly**:
   - `NLLSModel.jl` achieves zero-allocation cost and Gauss-Newton normal-equation assembly on static and block-sparse problems, outperforming generic `JuMP` / `NLPModels` and `BundleAdjustmentModels` coordinate assembly by **3×–10×** at scale.
   - Hand-specialized manifold residuals (`NLLSModel (Specialized)`) on $SO(d)$ eliminate tangent-basis allocation overhead relative to generic `Manifolds.jl` / `ManifoldVar` representations.

2. **Optimizer Efficiency & Scaling**:
   - **`SecondOrderOptimization.jl` (LM & Dogleg)**: Consistently delivers the lowest latency on small-to-medium dense problems and scales linearly on banded/tridiagonal sparse problems via direct sparse `LDL` factorizations.
   - **`CaNNOLeS.jl` & `MadNLP.jl`**: Excel on large-scale sparse Bundle Adjustment, where augmented KKT / interior-point sparse factorizations avoid dense fill-in from high-degree camera columns in $J^T J$.
   - **`Optim.jl` (`Newton` / `NewtonTrustRegion`)**: Strong performance on dense problems and sparse line-search Newton; `NewtonTrustRegion` requires dense eigendecompositions and is inapplicable to sparse Hessians.
   - **`JSOSolvers.jl` (`trunk` / `tron`)**: Matrix-free Krylov trust-region methods (`hprod!`) scale well on well-conditioned sparse problems (such as Sparse Rosenbrock) with minimal memory footprint, though unpreconditioned CG struggles on ill-conditioned Bundle Adjustment and long Pose Chains.
   - **`Ipopt.jl`**: Highly reliable global convergence across dense and sparse problems, with higher per-iteration interior-point overhead at small problem sizes.
   - **`LeastSquaresOptim.jl` & `NonlinearSolve.jl`**: Competitive on small and medium dense problems; on large sparse problems, unpreconditioned iterative `LSMR` (`LeastSquaresOptim`) and sparse QR (`NonlinearSolve`) become bottlenecked compared to sparse Cholesky/LDL normal-equation or KKT solvers.
