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

What each package supports (variables, derivatives, robust kernels, constraints, steps, linear solvers), and how each model in the benchmark reaches each optimizer, is on the [Package Features](features.md) page. It explains why a package is absent from a problem's table.

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
   - Every row's final cost is evaluated by the harness at the point the solver returned, not taken from the solver. A row's status is decided by the harness too: `ok` when the solver reports convergence **and** the final cost is at most ``\max(c_{\text{ref}}(1 + 10^{-4}), 10^{-6})``, with ``c_{\text{ref}}`` the problem's known minimum at that size (0 for affine alignment, both Rosenbrocks, the ODE BVP and bundle adjustment; the extended-precision minimum for the polynomial fit), or else the lowest final cost of any row at that size in the same table. A row whose solver claims convergence but fails that test is `local_minimum` if the cost reduction the Gauss–Newton model predicts from its point is below ``10^{-8}`` × its cost (a minimum of the Gauss–Newton model: a saddle of the true cost would pass), and `above_reference` otherwise. Rows that stop on the iteration or time limit or stall are `not_converged` or `timeout` (the message says when the cost test passes anyway).
   - Only `ok` rows are plotted (`converged = true` in the raw data tables); every other status is omitted (`NaN`) from the runtime plots, `local_minimum` included, since its time is the time to a different optimum.
   - Results stream line-by-line directly to Markdown tables in `docs/src/data/` as each model and optimizer measurement completes.

### Derivatives
Each problem has one derivative mode, which every model handed to an optimizer follows, and which its page states. A problem is **automatic** when every cost depends on at most 8 scalar inputs at every size: each cost's Jacobian is then computed by NLLSModel's forward-mode automatic differentiation. Otherwise it is **analytic**, and each cost has a hand-written Jacobian. Either way the `Standalone` model fills its residuals and Jacobian by calling the same per-cost functions in a plain single-threaded loop, so the rows differ by how the linear system is assembled and how it is solved, not by how a cost is differentiated; bundle adjustment, whose two models are separate formulations, is exempt (**mixed**).

### Threaded and Single-Threaded Tables
Every problem is run twice. The **threaded** table runs Julia and NLLSModel on the thread counts in its data file's
header and **BLAS on one thread**; the **single-threaded** table runs NLLSModel and BLAS on one thread
(`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`) and is stored separately, in `docs/src/data/single_threaded/`.
Each problem page shows both.

---

## Benchmark Problem Suite

| Problem | Category | Scaling Metric | Sizes Tested | Baseline Model | Derivatives | Tested Solver Packages |
|:---|:---|:---|:---|:---|:---|:---|
| [Sparse Multi-dimensional Rosenbrock](problems/rosenbrock_sparse.md) | `large_sparse` | Variables n | 11 sizes (100 … 75000) | `Standalone (Sparse)` | autodiff | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [Exponential Curve Fitting](problems/curve_fitting.md) | `medium_dense` | Data Points m | 11 sizes (64 … 65536) | `Standalone` | autodiff | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [Robust Exponential Curve Fitting](problems/curve_fitting_robust.md) | `medium_dense` | Data Points m | 11 sizes (64 … 65536) | `Standalone (fudged)` | autodiff | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [Ill-Conditioned Polynomial Fitting](problems/polynomial_fitting.md) | `medium_dense` | Data Points m | 11 sizes (60 … 6400) | `Standalone` | analytic | SecondOrderOptimization, LeastSquaresOptim, Optim |
| [Dense Multi-dimensional Rosenbrock](problems/rosenbrock_dense.md) | `small_dense` | Dimension n | 12 sizes (2 … 32) | `Standalone` | autodiff | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [Multilateration](problems/multilateration.md) | `small_dense` | Dimension d | 11 sizes (2 … 16) | `Standalone` | analytic | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [Dense Affine Alignment](problems/affine_alignment.md) | `small_dense` | Dimension n | 12 sizes (1 … 32) | `Standalone` | analytic | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [Nonlinear 3D Pose Chain](problems/pose_chain.md) | `large_sparse` | Poses N | 11 sizes (50 … 10000) | `NLLSModel (Sparse)` | autodiff | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [1D ODE Boundary Value Problem](problems/ode_bvp.md) | `large_sparse` | Grid Points N | 11 sizes (32 … 32768) | `Standalone (Sparse)` | autodiff | SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, NonlinearSolve, CaNNOLeS |
| [Sparse Bundle Adjustment](problems/bundle_adjustment.md) | `large_sparse` | Cameras Ncam | 12 sizes (4 … 256) | `BundleAdjustmentModels` | mixed | SecondOrderOptimization, JSOSolvers, Ipopt, MadNLP, CaNNOLeS |
| [Robust Procrustes on SO(d)](problems/robust_procrustes.md) | `manifold` | Matrix Dimension d | 11 sizes (3 … 32) | `Manifolds` | analytic | SecondOrderOptimization, Manopt |

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
