# SmoothOptimizerBenchmark.jl

**SmoothOptimizerBenchmark.jl** provides systematic, reproducible, multi-scale performance benchmarking across smooth second-order, nonlinear least-squares, and Riemannian manifold optimization packages in Julia:

- **`CaNNOLeS.jl`**: Constrained and nonlinear least-squares solver exploiting equality-constrained KKT structure.
- **`Ipopt.jl`**: Primal-dual interior-point nonlinear programming solver via `NLPModelsIpopt`.
- **`JSOSolvers.jl`**: Matrix-free / trust-region solvers `trunk` and `tron` via `NLPModels`.
- **`LeastSquaresOptim.jl`**: Levenberg-Marquardt and Dogleg algorithms for nonlinear least squares.
- **`MadNLP.jl`**: Pure-Julia filter line-search interior-point solver via `NLPModels`.
- **`Manopt.jl`**: Riemannian Levenberg-Marquardt optimization on matrix manifolds (`Manifolds.jl`).
- **`NonlinearSolve.jl`**: SciML nonlinear least-squares solvers (`LevenbergMarquardt`, `TrustRegion`).
- **`Optim.jl`**: Trust-Region Newton (`NewtonTrustRegion`) and Line-Search Newton (`Newton`).
- **`SecondOrderOptimization.jl`**: Levenberg-Marquardt and Dogleg trust-region algorithms with zero-allocation static, dense, and sparse linear system solvers.

What each package supports (variables, derivatives, robust kernels, constraints, steps, linear solvers), and how each model in the benchmark reaches each optimizer, is on the [Package Features](features.md) page. It explains why a package is absent from a problem's table.

---

## Benchmarking Methodology

### Two-Phase Decoupled Architecture
To separate modeling overhead from solver algorithm efficiency, every problem is benchmarked in two phases:

1. **Phase 1 — Model Evaluation Scaling**:
   Benchmarks pure **Cost Evaluation** ($f(x) = \frac{1}{2}\|r(x)\|_2^2$) and **Cost + Linear System Assembly** ($g = J^T r$ and $H = J^T J$ or exact Hessian) across the problem's model representations (`BundleAdjustmentModels`, `JuMP`, `Manifolds`, `NLLSModel` and the `Standalone` `LeastSquaresProblem`).
2. **Phase 2 — Optimizer Scaling**:
   Each optimizer runs on its package's native model, and on the problem's `Standalone` model if its package has none or the problem has none of them. A row's package is the part of its name before " (". The native models, in order of preference:

| Package | Native model (the first that the problem has) |
|:---|:---|
| CaNNOLeS | `BundleAdjustmentModels`, `JuMP (fudged)`, `JuMP` |
| Ipopt | `BundleAdjustmentModels`, `JuMP (fudged)`, `JuMP` |
| JSOSolvers | `BundleAdjustmentModels`, `JuMP (fudged)`, `JuMP` |
| LeastSquaresOptim | none: the Standalone model |
| MadNLP | `BundleAdjustmentModels`, `JuMP (fudged)`, `JuMP` |
| Manopt | `Manifolds` |
| NonlinearSolve | none: the Standalone model |
| Optim | none: the Standalone model |
| SecondOrderOptimization | `NLLSModel (Specialized)`, `NLLSModel (Static)`, `NLLSModel (Sparse)`, `NLLSModel` |

   So each row measures a package end to end on its own model, with the stopping criteria below, `maxiters = 500` and `maxtime = 30.0s`. Each problem page has a table of its rows with the model each runs on. SecondOrderOptimization has one row per problem: the configuration (iterator, linear solver, formulation, reduction, storage) that NLLSModel's `recommendoptimizer` chooses at the problem's largest size (for a conditioning sweep, at its largest condition number), evaluated once and fixed in the problem's code; the page states it.
   - **Stopping criteria.** Every optimizer is given the benchmark's gradient, step and relative cost-change tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) wherever it offers that criterion; where it does not, it runs with what it has. The definitions differ between packages (norms, absolute or relative):

| Package | Gradient (`gtol`) | Step (`xtol`) | Relative cost change (`ftol`) | Note |
|:---|:---|:---|:---|:---|
| CaNNOLeS | `atol = gtol`, `rtol = 0` | — | — | Its residual tolerances (`Fatol`, `Frtol`) at their defaults. |
| Ipopt | `tol`, `dual_inf_tol` | `tiny_step_tol` | — | Ipopt tests the cost change only inside its acceptable test, which is off (`acceptable_iter = 0`): with it on, on the ODE BVP Ipopt stopped after 2 iterations and handed back a point other than the one whose objective it reported; the tiny-step stop counts as converged. |
| JSOSolvers | `atol = gtol`, `rtol = 0` | — | — |  |
| LeastSquaresOptim | `g_tol` | `x_tol` | `f_tol` |  |
| MadNLP | `tol` (KKT residual) | — | — |  |
| Manopt | `StopWhenGradientNormLess` | `StopWhenChangeLess` | — | Manopt 0.6.15's cost-change criteria are absolute below a cost of 1 (`StopWhenCostChangeLess`, `StopWhenRelativeAPosterioriCostChangeLessOrEqual`), so neither is given. |
| NonlinearSolve | — | — | — | None of the three: its default termination mode tests the residual norm, and stalls of the residual and of the step against that same tolerance, so it runs on its own defaults. |
| Optim | `g_abstol` | `x_abstol` | `f_reltol` |  |
| SecondOrderOptimization | `gtol` | `dstep` | `reldcost` |  |

   - A row that ends `timeout` at one size is not run at the larger sizes of that table: it is recorded `timeout` there, "timed out at size N". There are no size limits otherwise.
   - Every concrete `(optimizer, model-type)` specialization is pre-warmed prior to timing so LLVM JIT compilation is excluded.
   - Every row's final cost is evaluated by the harness at the point the solver returned, not taken from the solver. A row's status is decided by the harness too: `ok` when the solver reports convergence **and** the final cost is at most ``\max(c_{\text{ref}}(1 + 10^{-4}),\ 10^{-8} c_0)``, with ``c_0`` the row's start cost and ``c_{\text{ref}}`` the problem's known minimum at that size (0 for affine alignment, both Rosenbrocks, the ODE BVP, bundle adjustment and the two conditioning sweeps; the extended-precision minimum for the polynomial fit), or else the lowest final cost of any row at that size in the same table; and, where the problem states its solution (the two conditioning sweeps), when the relative error in the solution ``\lVert \mathbf{x} - \mathbf{x}^* \rVert / \lVert \mathbf{x}^* \rVert`` is at most ``10^{-4}``. A row that passes the cost test with a larger error is `wrong_solution`: the cost cannot tell its point from the solution. A row whose solver claims convergence but fails the cost test is `local_minimum` if the cost reduction the Gauss–Newton model predicts from its point is below ``10^{-8}`` × its cost (a minimum of the Gauss–Newton model: a saddle of the true cost would pass), and `above_reference` otherwise. Rows that stop on the iteration or time limit or stall are `not_converged` or `timeout` (the message says when the cost test passes anyway).
   - Only `ok` rows are plotted (`converged = true` in the raw data tables); every other status is omitted (`NaN`) from the runtime plots, `local_minimum` included, since its time is the time to a different optimum. The conditioning sweeps' solution-error and iteration plots draw `wrong_solution` rows as well, since their error is what those plots show.
   - Results stream line-by-line directly to Markdown tables in `docs/src/data/` as each model and optimizer measurement completes.

### Derivatives
Each problem has one derivative mode, which its NLLSModel and Standalone models follow, and which its page states. A problem is **automatic** when every cost depends on at most 8 scalar inputs at every size: each cost's Jacobian is then computed by NLLSModel's forward-mode automatic differentiation. Otherwise it is **analytic**, and each cost has a hand-written Jacobian. Either way the `Standalone` model fills its residuals and Jacobian by calling the same per-cost functions in a plain single-threaded loop, so their rows differ by how the linear system is assembled and how it is solved, not by how a cost is differentiated; bundle adjustment, whose two models are separate formulations, is exempt (**mixed**). A package's native model differentiates itself, as part of the package under test: JuMP its own expressions, exactly and with exact second derivatives, on every problem, the analytic ones included; `BundleAdjustmentModels` its own Jacobian; the `Manifolds` model its hand-written blocks.

### Multi-Threaded and Single-Threaded Tables
Every problem is run twice. The **multi-threaded** table runs Julia, NLLSModel and BLAS on the thread counts in its data
file's header, BLAS at its own default; the **single-threaded** table runs NLLSModel and BLAS on one thread
(`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`) and is stored separately, in `docs/src/data/single_threaded/`.
Each problem page shows both.

---

## Benchmark Problem Suite

| Problem | Category | Scaling Metric | Sizes Tested | Models | Baseline Model | Derivatives | Tested Solver Packages |
|:---|:---|:---|:---|:---|:---|:---|:---|
| [Sparse Multi-dimensional Rosenbrock](problems/rosenbrock_sparse.md) | `large_sparse` | Variables n | 11 sizes (100 … 75000) | `JuMP`, `NLLSModel`, `Standalone (Sparse)` | `Standalone (Sparse)` | autodiff | CaNNOLeS, Ipopt, JSOSolvers, LeastSquaresOptim, MadNLP, NonlinearSolve, Optim, SecondOrderOptimization |
| [Exponential Curve Fitting](problems/curve_fitting.md) | `medium_dense` | Data Points m | 11 sizes (64 … 65536) | `JuMP`, `NLLSModel (Static)`, `Standalone` | `Standalone` | autodiff | CaNNOLeS, Ipopt, JSOSolvers, LeastSquaresOptim, MadNLP, NonlinearSolve, Optim, SecondOrderOptimization |
| [Robust Exponential Curve Fitting](problems/curve_fitting_robust.md) | `medium_dense` | Data Points m | 11 sizes (64 … 65536) | `JuMP (fudged)`, `NLLSModel (Static)`, `Standalone (fudged)` | `Standalone (fudged)` | autodiff | CaNNOLeS, Ipopt, JSOSolvers, LeastSquaresOptim, MadNLP, NonlinearSolve, Optim, SecondOrderOptimization |
| [Ill-Conditioned Polynomial Fitting](problems/polynomial_fitting.md) | `medium_dense` | Coefficients n | 10 sizes (4 … 64) | `JuMP`, `NLLSModel`, `Standalone` | `Standalone` | analytic | CaNNOLeS, Ipopt, JSOSolvers, LeastSquaresOptim, MadNLP, NonlinearSolve, Optim, SecondOrderOptimization |
| [Dense Conditioning Sweep](problems/conditioning_dense.md) | `medium_dense` | Condition Number κ | 13 sizes (1.0 … 1.0e12) | `JuMP`, `NLLSModel`, `Standalone` | `Standalone` | analytic | CaNNOLeS, Ipopt, JSOSolvers, LeastSquaresOptim, MadNLP, NonlinearSolve, Optim, SecondOrderOptimization |
| [Sparse Conditioning Sweep](problems/conditioning_sparse.md) | `large_sparse` | Condition Number κ | 15 sizes (10.0 … 1.0e8) | `JuMP`, `NLLSModel (Sparse)`, `Standalone (Sparse)` | `Standalone (Sparse)` | autodiff | CaNNOLeS, Ipopt, JSOSolvers, LeastSquaresOptim, MadNLP, NonlinearSolve, Optim, SecondOrderOptimization |
| [Dense Multi-dimensional Rosenbrock](problems/rosenbrock_dense.md) | `small_dense` | Dimension n | 12 sizes (2 … 32) | `JuMP`, `NLLSModel`, `Standalone` | `Standalone` | autodiff | CaNNOLeS, Ipopt, JSOSolvers, LeastSquaresOptim, MadNLP, NonlinearSolve, Optim, SecondOrderOptimization |
| [Multilateration](problems/multilateration.md) | `small_dense` | Dimension d | 11 sizes (2 … 16) | `JuMP`, `NLLSModel (Static)`, `Standalone` | `Standalone` | analytic | CaNNOLeS, Ipopt, JSOSolvers, LeastSquaresOptim, MadNLP, NonlinearSolve, Optim, SecondOrderOptimization |
| [Dense Affine Alignment](problems/affine_alignment.md) | `small_dense` | Dimension n | 12 sizes (1 … 32) | `JuMP`, `NLLSModel`, `Standalone` | `Standalone` | analytic | CaNNOLeS, Ipopt, JSOSolvers, LeastSquaresOptim, MadNLP, NonlinearSolve, Optim, SecondOrderOptimization |
| [Nonlinear 3D Pose Chain](problems/pose_chain.md) | `large_sparse` | Poses N | 11 sizes (50 … 10000) | `JuMP`, `NLLSModel (Sparse)`, `Standalone (Sparse)` | `Standalone (Sparse)` | autodiff | CaNNOLeS, Ipopt, JSOSolvers, LeastSquaresOptim, MadNLP, NonlinearSolve, Optim, SecondOrderOptimization |
| [1D ODE Boundary Value Problem](problems/ode_bvp.md) | `large_sparse` | Grid Points N | 11 sizes (32 … 32768) | `JuMP`, `NLLSModel (Sparse)`, `Standalone (Sparse)` | `Standalone (Sparse)` | autodiff | CaNNOLeS, Ipopt, JSOSolvers, LeastSquaresOptim, MadNLP, NonlinearSolve, Optim, SecondOrderOptimization |
| [Sparse Bundle Adjustment](problems/bundle_adjustment.md) | `large_sparse` | Cameras Ncam | 12 sizes (4 … 256) | `BundleAdjustmentModels`, `NLLSModel` | `BundleAdjustmentModels` | mixed | CaNNOLeS, Ipopt, JSOSolvers, MadNLP, SecondOrderOptimization |
| [Robust Procrustes on SO(d)](problems/robust_procrustes.md) | `manifold` | Matrix Dimension d | 11 sizes (3 … 32) | `Manifolds`, `NLLSModel (ManifoldVar)`, `NLLSModel (Specialized)` | `Manifolds` | analytic | Manopt, SecondOrderOptimization |

### What each problem holds fixed

Each problem shows how performance changes with one thing, its size (or, for the two conditioning sweeps, the condition number at one size), with its other traits held fixed, conditioning among them; cond(J) is the Jacobian's condition number at the solution, at three of its sizes, as measured on 2026-11-20 (bundle adjustment without its 7 gauge directions, robust Procrustes with the kernel's weights).

| Problem | What is swept | What stays fixed | cond(J) at the sizes checked |
|:---|:---|:---|:---|
| Sparse Multi-dimensional Rosenbrock | variables ``n`` | each unknown coupled to its neighbour; the start, 0.5 | 3.16, 3.16, 3.16 (``n`` = 100, 500, 1000) |
| Exponential Curve Fitting | data points ``m`` | 3 unknowns; the model and the noise | 10.5, 10.8, 10.8 (``m`` = 64, 1024, 65536) |
| Robust Exponential Curve Fitting | data points ``m`` | 3 unknowns; 30 % outliers; the Huber kernel | 10.6, 10.9, 10.8 (``m`` = 64, 1024, 65536) |
| Ill-Conditioned Polynomial Fitting | coefficients ``n`` | ``4 \times 10^9``, by a Chebyshev basis stretched at each ``n``; 8 points per coefficient | ``4.0 \times 10^9`` at all ten sizes |
| Dense Conditioning Sweep | condition number ``\kappa``, 1 to ``10^{12}`` | 100 unknowns, 400 residuals; the nonlinearity; the solution | ``\kappa`` (1.04 at ``\kappa = 1``) |
| Sparse Conditioning Sweep | condition number ``\kappa``, 10 to ``10^8`` | 32768 unknowns, tridiagonal; the nonlinearity; the solution | ``\kappa/1.18`` to ``\kappa/1.14`` |
| Dense Multi-dimensional Rosenbrock | dimension ``n`` | every pair coupled; the start, 0.5 | 2.12, 3.82, 4.86 (``n`` = 2, 8, 32) |
| Multilateration | dimension ``d`` | ``4d`` anchors at distance 4; the noise | 1.17, 1.75, 2.58 (``d`` = 2, 7, 16) |
| Dense Affine Alignment | dimension ``n`` | sources at ``\pm\sqrt{n}`` on each axis, targets on a sphere of radius ``3\sqrt{n}``; the start's distance from the solution | 2.08, 3.20, 7.42 (``n`` = 2, 8, 32): grows about as ``\sqrt{n}`` |
| Nonlinear 3D Pose Chain | poses ``N`` | links, a loop closure every 10 poses, the self-term | 17.0, 21.4, 22.2 (``N`` = 50, 200, 400) |
| 1D ODE Boundary Value Problem | grid points ``N`` | the spacing, 0.1; the reaction term | 112, 156, 157 (``N`` = 32, 256, 2048) |
| Sparse Bundle Adjustment | cameras ``N_{cam}`` | a ring of cameras around a ball of points; focal length 1; each point seen by half the cameras | 856, 398, 275 (``N_{cam}`` = 4, 16, 32) |
| Robust Procrustes on SO(d) | dimension ``d`` | random unit points, spread in every direction; one outlier in about ten | 1.43, 1.99, 1.72 (``d`` = 3, 8, 20) |

