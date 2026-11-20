# SmoothOptimizerBenchmark.jl

[![Build Status](https://github.com/ojwoodford/SmoothOptimizerBenchmark.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/ojwoodford/SmoothOptimizerBenchmark.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![codecov](https://codecov.io/gh/ojwoodford/SmoothOptimizerBenchmark.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/ojwoodford/SmoothOptimizerBenchmark.jl)

Multi-scale benchmarking suite comparing smooth second-order optimization, nonlinear least-squares, and Riemannian manifold optimization packages across Julia:
- **CaNNOLeS.jl** / **BundleAdjustmentModels.jl**
- **Ipopt.jl** (`NLPModelsIpopt.jl`) / **JuMP.jl**
- **JSOSolvers.jl** (`trunk`, `tron`) / **NLPModels.jl**
- **LeastSquaresOptim.jl** (`LevenbergMarquardt`, `Dogleg`)
- **MadNLP.jl**
- **Manopt.jl** / **Manifolds.jl**
- **NLLSModel.jl**
- **NonlinearSolve.jl** (`LevenbergMarquardt`, `TrustRegion`)
- **Optim.jl** (`NewtonTrustRegion`, `Newton`)
- **SecondOrderOptimization.jl** (one row per problem, in the configuration NLLSModel recommends)

What each of these packages supports, and how each model reaches each optimizer, is tabulated on the documentation's "Package Features" page (`docs/src/features.md`).

---

## Benchmarking Architecture

Benchmarks are decoupled into two phases across **10–15 problem sizes** per problem (for the two conditioning sweeps, 13 and 15 values of the condition number at one size):

1. **Phase 1: Model Evaluation Scaling**:
   - Measures pure **Cost Evaluation** ($f(x) = \frac{1}{2}\|r(x)\|_2^2$) and **Cost + Linear System Assembly** ($g = J^T r$ and $H = J^T J$, or the exact Hessian for `JuMP`), along with heap allocations and memory footprint, across each problem's models.
2. **Phase 2: Optimizer Scaling**:
   - Each optimizer runs on its package's native model, and on the problem's `Standalone` model (`Standalone`, `Standalone (Sparse)` or `Standalone (fudged)`, a `LeastSquaresProblem` built from the problem's per-cost functions) if its package has none or the problem has none of them. A row's package is the part of its name before " (". The table (`src/pairing.jl`), each package's native models in order of preference:

     | Package | Native model (the first that the problem has) |
     |:---|:---|
     | CaNNOLeS, Ipopt, JSOSolvers, MadNLP | `BundleAdjustmentModels`, `JuMP (fudged)`, `JuMP` |
     | LeastSquaresOptim, NonlinearSolve, Optim | none: the `Standalone` model |
     | Manopt | `Manifolds` |
     | SecondOrderOptimization | `NLLSModel (Specialized)`, `NLLSModel (Static)`, `NLLSModel (Sparse)`, `NLLSModel` |

     So each row measures a package end to end on its own model, NLLSModel's set-up included for SecondOrderOptimization (a cold start, as for every solver).
   - Every optimizer is given the benchmark's stopping criteria, the gradient (`gtol = 1e-8`), the step (`xtol = 1e-8`) and the relative cost change (`ftol = 1e-8`), wherever it offers that criterion, and runs with what it has where it does not: SecondOrderOptimization, LeastSquaresOptim and Optim all three; Ipopt all three (the cost change through its acceptable test); Manopt the gradient and the step (its cost-change tests are absolute below a cost of 1); JSOSolvers, CaNNOLeS and MadNLP the gradient; NonlinearSolve none (its default test is on the residual norm, and it runs on its defaults). The definitions differ between packages; the site's overview has the table. `maxiters = 500`, `maxtime = 30.0s`.
   - A row that ends `timeout` at one size is recorded `timeout` at the larger sizes of that table without being run ("timed out at size N"). There are no other size limits.
   - Evaluates every row's start and final cost itself, outside the timed region: each adapter hands back the point its solver stopped at, and one evaluator per problem and size, built from the problem's standard model, computes the cost there. A solver's own report of its final cost is not used. Iterations, status and costs are the first timed run's.
   - Streams each model row as it finishes, and each size's optimizer rows once every row at that size has run (their statuses are decided then), to `docs/src/data/<problem>.md`, so progress is preserved if interrupted.
   - A row's status is decided by the harness, not the solver (IT4). A row is `ok` when the solver reports convergence **and** its final cost, evaluated by the harness, is at most $\max(c_{\text{ref}}(1 + 10^{-4}),\ 10^{-6})$. The reference $c_{\text{ref}}$ is the problem's known minimum at that size (0 for affine alignment, both Rosenbrocks, the ODE BVP, the synthetic bundle adjustment and the two conditioning sweeps; the extended-precision minimum for the polynomial fit), or else the lowest final cost of any row at that size in the same table, whatever its status. A row whose solver claims convergence but fails that test is `local_minimum` if it is at a stationary point, judged by the cost reduction the Gauss–Newton model predicts from it ($\tfrac12 r^T J (J \backslash r)$, below $10^{-8}$ × its cost), and `above_reference` otherwise (it stopped early). The test uses $J^T J$, not the full Hessian, so a saddle of the true cost would pass as `local_minimum`. A row that did not converge is `not_converged` or `timeout`, its message ending "cost test passes" when its cost passes. Only `ok` rows are plotted: a `local_minimum` row's time is the time to a different optimum.
3. **Multi-threaded and single-threaded tables**:
   - The full run benchmarks every problem twice: the multi-threaded table, with Julia and NLLSModel on the thread counts Julia was started with and BLAS at its own default (all three recorded in each data file's header), into `docs/src/data/`, and with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`), into `docs/src/data/single_threaded/`, with its plots in `docs/src/assets/plots/single_threaded/`. Each problem page shows both.
4. **One derivative mode per problem**:
   - A problem is *autodiff* when every cost depends on at most 8 scalar inputs (the total `nvars` of the variables it depends on) at every size, and *analytic* otherwise; 8 is a starting value, not a measured threshold. The mode applies to the NLLSModel and Standalone models. Each cost is defined once, as an NLLSModel residual: in an autodiff problem its Jacobian comes from NLLSModel's forward-mode automatic differentiation (`computeresjac`), in an analytic one from a hand-written `computeresjac`. The `Standalone` model fills its residuals and Jacobian by calling the same functions cost by cost in a plain single-threaded loop, so their rows differ by how the linear system is assembled and solved, not by how a cost is differentiated. A native model's derivatives are part of the package under test: JuMP differentiates its own expressions on every problem, the analytic ones included. Bundle adjustment, whose two models are separate formulations, is exempt (*mixed*).

---

## Benchmark Problem Suite

Each problem resides in `src/problems/`, scales across $\ge 10$ problem sizes (or values of the condition number), and defines its model formulations and compatible optimizer set:

| Problem | Category | Scaling Metric | Derivatives | Models | Rows, by the model each runs on |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Exponential Curve Fitting** (`curve_fitting.jl`) | Medium Dense | Data points $m \in [64, 65536]$ | autodiff | `JuMP`, `NLLSModel (Static)`, `Standalone` | on `JuMP`: `CaNNOLeS`, `Ipopt`, `JSOSolvers (tron)`, `JSOSolvers (trunk)`, `MadNLP`; on `NLLSModel (Static)`: `SecondOrderOptimization`; on `Standalone`: `LeastSquaresOptim (Dogleg)`, `LeastSquaresOptim (LM)`, `NonlinearSolve (LM)`, `NonlinearSolve (TrustRegion)`, `Optim (Newton)`, `Optim (NewtonTrustRegion)` |
| **Robust Exponential Curve Fitting** (`curve_fitting_robust.jl`) | Medium Dense | Data points $m \in [64, 65536]$, 30 % outliers, Huber kernel | autodiff | `JuMP (fudged)`, `NLLSModel (Static)`, `Standalone (fudged)` | on `JuMP (fudged)`: `CaNNOLeS (fudged)`, `Ipopt`, `JSOSolvers (tron)`, `JSOSolvers (trunk)`, `MadNLP`; on `NLLSModel (Static)`: `SecondOrderOptimization`; on `Standalone (fudged)`: `LeastSquaresOptim (Dogleg, fudged)`, `LeastSquaresOptim (LM, fudged)`, `NonlinearSolve (LM, fudged)`, `NonlinearSolve (TrustRegion, fudged)`, `Optim (Newton)`, `Optim (NewtonTrustRegion)` |
| **Ill-Conditioned Polynomial Fitting** (`polynomial_fitting.jl`) | Medium Dense | Coefficients $n \in [4, 64]$, $m = 8n$ points, a stretched Chebyshev basis, cond$(J) = 4 \times 10^9$ at every size | analytic | `JuMP`, `NLLSModel`, `Standalone` | on `JuMP`: `CaNNOLeS`, `Ipopt`, `JSOSolvers (tron)`, `JSOSolvers (trunk)`, `MadNLP`; on `NLLSModel`: `SecondOrderOptimization`; on `Standalone`: `LeastSquaresOptim (Dogleg)`, `LeastSquaresOptim (LM)`, `NonlinearSolve (LM)`, `NonlinearSolve (TrustRegion)`, `Optim (Newton)`, `Optim (NewtonTrustRegion)` |
| **Dense Conditioning Sweep** (`conditioning_dense.jl`) | Medium Dense | Condition number $\kappa \in [1, 10^{12}]$ at one size, 100 unknowns and 400 residuals | analytic | `JuMP`, `NLLSModel`, `Standalone` | on `JuMP`: `CaNNOLeS`, `Ipopt`, `JSOSolvers (tron)`, `JSOSolvers (trunk)`, `MadNLP`; on `NLLSModel`: `SecondOrderOptimization`; on `Standalone`: `LeastSquaresOptim (Dogleg)`, `LeastSquaresOptim (LM)`, `NonlinearSolve (LM)`, `NonlinearSolve (TrustRegion)`, `Optim (Newton)`, `Optim (NewtonTrustRegion)` |
| **Sparse Conditioning Sweep** (`conditioning_sparse.jl`) | Large Sparse | Condition number $\kappa \in [10, 10^8]$ at one size, 32768 unknowns, tridiagonal | autodiff | `JuMP`, `NLLSModel (Sparse)`, `Standalone (Sparse)` | on `JuMP`: `CaNNOLeS`, `Ipopt`, `JSOSolvers (tron)`, `JSOSolvers (trunk)`, `MadNLP`; on `NLLSModel (Sparse)`: `SecondOrderOptimization`; on `Standalone (Sparse)`: `LeastSquaresOptim (Dogleg)`, `LeastSquaresOptim (LM)`, `NonlinearSolve (LM)`, `NonlinearSolve (TrustRegion)`, `Optim (Newton)`, `Optim (NewtonTrustRegion)` |
| **Dense Affine Alignment** (`affine_alignment.jl`) | Small Dense | Dimension $n \in [1, 32]$ | analytic | `JuMP`, `NLLSModel`, `Standalone` | on `JuMP`: `CaNNOLeS`, `Ipopt`, `JSOSolvers (tron)`, `JSOSolvers (trunk)`, `MadNLP`; on `NLLSModel`: `SecondOrderOptimization`; on `Standalone`: `LeastSquaresOptim (Dogleg)`, `LeastSquaresOptim (LM)`, `NonlinearSolve (LM)`, `NonlinearSolve (TrustRegion)`, `Optim (Newton)`, `Optim (NewtonTrustRegion)` |
| **Dense Multi-dimensional Rosenbrock** (`rosenbrock_dense.jl`) | Small Dense | Dimension $n \in [2, 32]$ | autodiff | `JuMP`, `NLLSModel`, `Standalone` | on `JuMP`: `CaNNOLeS`, `Ipopt`, `JSOSolvers (tron)`, `JSOSolvers (trunk)`, `MadNLP`; on `NLLSModel`: `SecondOrderOptimization`; on `Standalone`: `LeastSquaresOptim (Dogleg)`, `LeastSquaresOptim (LM)`, `NonlinearSolve (LM)`, `NonlinearSolve (TrustRegion)`, `Optim (Newton)`, `Optim (NewtonTrustRegion)` |
| **Multilateration** (`multilateration.jl`) | Small Dense | Dimension $d \in [2, 16]$, $m = 4d$ anchors | analytic | `JuMP`, `NLLSModel (Static)`, `Standalone` | on `JuMP`: `CaNNOLeS`, `Ipopt`, `JSOSolvers (tron)`, `JSOSolvers (trunk)`, `MadNLP`; on `NLLSModel (Static)`: `SecondOrderOptimization`; on `Standalone`: `LeastSquaresOptim (Dogleg)`, `LeastSquaresOptim (LM)`, `NonlinearSolve (LM)`, `NonlinearSolve (TrustRegion)`, `Optim (Newton)`, `Optim (NewtonTrustRegion)` |
| **Sparse Multi-dimensional Rosenbrock** (`rosenbrock_sparse.jl`) | Large Sparse | Variables $n \in [100, 75000]$ | autodiff | `JuMP`, `NLLSModel`, `Standalone (Sparse)` | on `JuMP`: `CaNNOLeS`, `Ipopt`, `JSOSolvers (tron)`, `JSOSolvers (trunk)`, `MadNLP`; on `NLLSModel`: `SecondOrderOptimization`; on `Standalone (Sparse)`: `LeastSquaresOptim (Dogleg)`, `LeastSquaresOptim (LM)`, `NonlinearSolve (LM)`, `NonlinearSolve (TrustRegion)`, `Optim (Newton)`, `Optim (NewtonTrustRegion)` |
| **Nonlinear 3D Pose Chain** (`pose_chain.jl`) | Large Sparse | Poses $N \in [50, 10000]$ | autodiff | `JuMP`, `NLLSModel (Sparse)`, `Standalone (Sparse)` | on `JuMP`: `CaNNOLeS`, `Ipopt`, `JSOSolvers (tron)`, `JSOSolvers (trunk)`, `MadNLP`; on `NLLSModel (Sparse)`: `SecondOrderOptimization`; on `Standalone (Sparse)`: `LeastSquaresOptim (Dogleg)`, `LeastSquaresOptim (LM)`, `NonlinearSolve (LM)`, `NonlinearSolve (TrustRegion)`, `Optim (Newton)` |
| **1D ODE Boundary Value Problem** (`ode_bvp.jl`) | Large Sparse | Grid Points $N \in [32, 32768]$, a fixed spacing $h = 0.1$ | autodiff | `JuMP`, `NLLSModel (Sparse)`, `Standalone (Sparse)` | on `JuMP`: `CaNNOLeS`, `Ipopt`, `JSOSolvers (tron)`, `JSOSolvers (trunk)`, `MadNLP`; on `NLLSModel (Sparse)`: `SecondOrderOptimization`; on `Standalone (Sparse)`: `LeastSquaresOptim (Dogleg)`, `LeastSquaresOptim (LM)`, `NonlinearSolve (LM)`, `NonlinearSolve (TrustRegion)`, `Optim (Newton)`, `Optim (NewtonTrustRegion)` |
| **Robust Procrustes on $SO(d)$** (`robust_procrustes.jl`) | Manifold | Matrix dim $d \in [3, 32]$ | analytic | `Manifolds`, `NLLSModel (ManifoldVar)`, `NLLSModel (Specialized)` | on `Manifolds`: `Manopt (LevenbergMarquardt)`; on `NLLSModel (Specialized)`: `SecondOrderOptimization` |
| **Sparse Bundle Adjustment** (`bundle_adjustment.jl`) | Large Sparse | Cameras $N_{\text{cam}} \in [4, 256]$ on a ring around the scene, focal length 1 | mixed | `BundleAdjustmentModels`, `NLLSModel` | on `BundleAdjustmentModels`: `CaNNOLeS`, `Ipopt`, `JSOSolvers (tron)`, `JSOSolvers (trunk)`, `MadNLP`; on `NLLSModel`: `SecondOrderOptimization` |

Every problem but robust Procrustes and bundle adjustment has the standard rows: `CaNNOLeS`, `Ipopt`, `JSOSolvers` (tron, trunk), `LeastSquaresOptim` (Dogleg, LM), `MadNLP`, `NonlinearSolve` (LM, TrustRegion), `Optim` (Newton, NewtonTrustRegion) and `SecondOrderOptimization` (pose chain has no `Optim (NewtonTrustRegion)`, which needs a dense Hessian). The one `SecondOrderOptimization` row per problem runs the configuration NLLSModel's `recommendoptimizer` chooses at the problem's largest size (for a conditioning sweep, at its largest condition number), fixed in the problem's code; each problem page states it. Affine alignment's `JuMP` model is built up to $n = 16$ only (above, its build takes over 300 s), and its JuMP rows are `skipped` from $n = 20$.

**What each problem holds fixed.**

Each problem shows how performance changes with one thing, its size (or, for the two conditioning sweeps, the condition number at one size), with its other traits held fixed, conditioning among them; cond(J) is the Jacobian's condition number at the solution, at three of its sizes, as measured on 2026-11-20 (bundle adjustment without its 7 gauge directions, robust Procrustes with the kernel's weights).

| Problem | What is swept | What stays fixed | cond(J) at the sizes checked |
|:---|:---|:---|:---|
| Sparse Multi-dimensional Rosenbrock | variables $n$ | each unknown coupled to its neighbour; the start, 0.5 | 3.16, 3.16, 3.16 ($n$ = 100, 500, 1000) |
| Exponential Curve Fitting | data points $m$ | 3 unknowns; the model and the noise | 10.5, 10.8, 10.8 ($m$ = 64, 1024, 65536) |
| Robust Exponential Curve Fitting | data points $m$ | 3 unknowns; 30 % outliers; the Huber kernel | 10.6, 10.9, 10.8 ($m$ = 64, 1024, 65536) |
| Ill-Conditioned Polynomial Fitting | coefficients $n$ | $4 \times 10^9$, by a Chebyshev basis stretched at each $n$; 8 points per coefficient | $4.0 \times 10^9$ at all ten sizes |
| Dense Conditioning Sweep | condition number $\kappa$, 1 to $10^{12}$ | 100 unknowns, 400 residuals; the nonlinearity; the solution | $\kappa$ (1.04 at $\kappa = 1$) |
| Sparse Conditioning Sweep | condition number $\kappa$, 10 to $10^8$ | 32768 unknowns, tridiagonal; the nonlinearity; the solution | $\kappa/1.18$ to $\kappa/1.14$ |
| Dense Multi-dimensional Rosenbrock | dimension $n$ | every pair coupled; the start, 0.5 | 2.12, 3.82, 4.86 ($n$ = 2, 8, 32) |
| Multilateration | dimension $d$ | $4d$ anchors at distance 4; the noise | 1.17, 1.75, 2.58 ($d$ = 2, 7, 16) |
| Dense Affine Alignment | dimension $n$ | **not yet:** the start's distance from the solution grows with $n$ | 32.5, 27.8, 125 ($n$ = 2, 8, 32) |
| Nonlinear 3D Pose Chain | poses $N$ | links, a loop closure every 10 poses, the self-term | 17.0, 21.4, 22.2 ($N$ = 50, 200, 400) |
| 1D ODE Boundary Value Problem | grid points $N$ | the spacing, 0.1; the reaction term | 112, 156, 157 ($N$ = 32, 256, 2048) |
| Sparse Bundle Adjustment | cameras $N_{cam}$ | a ring of cameras around a ball of points; focal length 1; each point seen by half the cameras | 856, 398, 275 ($N_{cam}$ = 4, 16, 32) |
| Robust Procrustes on SO(d) | dimension $d$ | **not yet:** the points lie along $d$ directions, and 4 of them are outliers at every $d$ | 2.50, 273, 710 ($d$ = 3, 8, 20) |

**"fudged" rows.** Robust Exponential Curve Fitting's `Standalone (fudged)` and `JuMP (fudged)` models rewrite each residual as $\tilde r = \operatorname{sign}(r)\sqrt{\rho(r^2)}$, so that a plain least-squares solver minimizes the robust cost: $\tfrac12\|\tilde r\|^2$ is the Huber cost exactly. On `Standalone (fudged)` the row of $J$ is scaled by $\rho'(r^2)\,|r| / \sqrt{\rho(r^2)}$, so $\tilde J^T \tilde r$ is the robust gradient and only the Gauss–Newton Hessian $\tilde J^T \tilde J$ differs from the native one; `JuMP (fudged)` writes $\tilde r$ as JuMP expressions, which JuMP differentiates exactly. A row named "fudged" belongs to a package with no kernel interface (CaNNOLeS, LeastSquaresOptim, NonlinearSolve); JSOSolvers, Ipopt, MadNLP and Optim keep their standard names. `SecondOrderOptimization` runs `NLLSModel (Static)`, which declares the kernel.

---

## Running the Benchmarks & Generating Documentation

SecondOrderOptimization and NLLSModel are not registered, and `Project.toml` has no `[sources]` block, so the environment does not instantiate from the registry alone. Develop the unregistered packages into the local `Manifest.toml` (which is not committed) from checkouts beside this one, before the first run:

```bash
julia --project=. -e 'using Pkg; Pkg.develop([PackageSpec(path = "../SecondOrderOptimization.jl"), PackageSpec(path = "../NLLSModel.jl")])'
```

Do the same for OptimizationVariableInterface or BlockLinearSystems to run against an unregistered version of either. Since Julia 1.11, `Pkg.develop` also records each path in `Project.toml` (a `[sources]` entry, and the package in `[deps]` if it is not a direct dependency, as BlockLinearSystems is not). Do not commit that edit: restore the file with `git checkout Project.toml`. Packages are loaded from the manifest, which keeps the developed paths.

To run the full multi-scale benchmark suite, generate all log-log scaling plots in `docs/src/assets/plots/`, and build the `Documenter.jl` HTML site in `docs/build/`:

```bash
julia --project=. scripts/benchmark_and_document.jl
julia --project=docs docs/make.jl
```

For a fast smoke run (first 3 sizes per problem):

```bash
QUICK=true julia --project=. scripts/benchmark_and_document.jl
```

Or from an interactive Julia session:

```julia
using SmoothOptimizerBenchmark

# Run all scaling benchmarks across default sizes (streams to docs/src/data/*.md)
results = run_all_scaling_benchmarks()

# Generate log-log model & optimizer scaling plots
generate_all_plots(results)

# The single-threaded table, stored separately
results_1t = run_all_scaling_benchmarks(data_dir=SINGLE_THREADED_DATA_DIR, numthreads=1, blas_threads=1)
generate_all_plots(results_1t; outdir=SINGLE_THREADED_PLOTS_DIR, title_suffix=" (1 thread)")

# Run a single problem at one size
prob = create_robust_procrustes_problem()
run_problem_benchmark(prob, 3) # d = 3
```

## Authorship

SmoothOptimizerBenchmark was written by Oliver Woodford, the author of SecondOrderOptimization.jl and NLLSModel.jl, two of the packages it measures.
