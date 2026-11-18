# SmoothOptimizerBenchmark.jl

[![Build Status](https://github.com/ojwoodford/SmoothOptimizerBenchmark.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/ojwoodford/SmoothOptimizerBenchmark.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![codecov](https://codecov.io/gh/ojwoodford/SmoothOptimizerBenchmark.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/ojwoodford/SmoothOptimizerBenchmark.jl)

Multi-scale benchmarking suite comparing smooth second-order optimization, nonlinear least-squares, and Riemannian manifold optimization packages across Julia:
- **SecondOrderOptimization.jl** (`:levenbergmarquardt`, `:dogleg`)
- **NLLSModel.jl**
- **LeastSquaresOptim.jl** (`LevenbergMarquardt`, `Dogleg`)
- **Optim.jl** (`NewtonTrustRegion`, `Newton`)
- **JSOSolvers.jl** (`trunk`, `tron`) / **NLPModels.jl**
- **Ipopt.jl** (`NLPModelsIpopt.jl`) / **JuMP.jl**
- **MadNLP.jl**
- **NonlinearSolve.jl** (`LevenbergMarquardt`, `TrustRegion`)
- **CaNNOLeS.jl** / **BundleAdjustmentModels.jl**
- **Manopt.jl** / **Manifolds.jl**

---

## Benchmarking Architecture

Benchmarks are decoupled into two phases across **10–12 problem sizes** per problem:

1. **Phase 1: Model Evaluation Scaling**:
   - Measures pure **Cost Evaluation** ($f(x) = \frac{1}{2}\|r(x)\|_2^2$) and **Cost + Linear System Assembly** ($g = J^T r$ and $H = J^T J$ or exact Hessian), along with heap allocations and memory footprint, across competing model formulations.
2. **Phase 2: Unified Optimizer Scaling (Apples-to-Apples)**:
   - Runs all compatible optimizers on a **standardized baseline model** (`Standalone` `LeastSquaresProblem` for Euclidean problems, `BundleAdjustmentModels` for Bundle Adjustment, and `Manifolds` for Riemannian problems) via cross-framework adapters, alongside full-stack **`NLLSModel + SecondOrderOptimization`** runs (plotted with star markers) evaluated from a cold start on an equal footing with all other solvers.
   - Enforces uniform stopping tolerances (`gtol = 1e-8`, `xtol = 1e-8`, `ftol = 1e-8`, `maxiters = 500`, `maxtime = 30.0s`).
   - Streams each model and optimizer result row immediately to `docs/src/data/<problem>.md` so progress is preserved if interrupted, and omits non-converged solver runs from scaling plots.
3. **Threaded and single-threaded tables**:
   - The full run benchmarks every problem twice: at the thread counts Julia was started with (recorded in each data file's header), into `docs/src/data/`, and with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`), into `docs/src/data/single_threaded/`, with its plots in `docs/src/assets/plots/single_threaded/`. Each problem page shows both.

---

## Benchmark Problem Suite

Each problem resides in `src/problems/`, scales across $\ge 11$ problem sizes, and defines its model formulations and compatible optimizer set:

| Problem | Category | Scaling Metric | Models Compared | Compatible Optimizers |
| :--- | :--- | :--- | :--- | :--- |
| **Exponential Curve Fitting** (`curve_fitting.jl`) | Medium Dense | Data points $m \in [64, 65536]$ | `NLLSModel (Static)`, `Standalone` | The 13 standard rows and `SecondOrderOptimization (LM, tall)` |
| **Robust Exponential Curve Fitting** (`curve_fitting_robust.jl`) | Medium Dense | Data points $m \in [64, 65536]$, 30 % outliers, Huber kernel | `NLLSModel (Static)` (kernel declared), `Standalone (fudged)` | `SecondOrderOptimization` (Dogleg, LM, LM tall) on `NLLSModel (Static)`; on `Standalone (fudged)`: `SecondOrderOptimization (LM, fudged)` (the control row), `LeastSquaresOptim` (Dogleg, LM), `Optim` (NewtonTrustRegion, Newton), `JSOSolvers` (trunk, tron), `Ipopt`, `MadNLP`, `NonlinearSolve` (LM, TrustRegion), `CaNNOLeS` |
| **Dense Affine Alignment** (`affine_alignment.jl`) | Small Dense | Dimension $n \in [1, 32]$ | `Standalone` (ForwardDiff) | The 13 standard rows |
| **Dense Multi-dimensional Rosenbrock** (`rosenbrock_dense.jl`) | Small Dense | Dimension $n \in [2, 32]$ | `NLLSModel`, `Standalone` (ForwardDiff), `NLPModels (MathOptNLSModel)` | The 13 standard rows and `SecondOrderOptimization (LM, tall)` |
| **Multilateration** (`multilateration.jl`) | Small Dense | Dimension $d \in [2, 16]$, $m = 4d$ anchors | `NLLSModel (Static)` (ForwardDiff), `Standalone` (analytic Jacobian) | The 13 standard rows and `SecondOrderOptimization (LM, tall)` |
| **Sparse Multi-dimensional Rosenbrock** (`rosenbrock_sparse.jl`) | Large Sparse | Variables $n \in [100, 75000]$ | `NLLSModel`, `Standalone (Sparse)`, `NLPModels (MathOptNLSModel)` | The 13 standard rows, `SecondOrderOptimization (LM, tall)` and `SecondOrderOptimization (LM, tall, LSMR)` |
| **Nonlinear 3D Pose Chain** (`pose_chain.jl`) | Large Sparse | Poses $N \in [50, 10000]$ | `NLLSModel (Sparse)` | The 13 standard rows except `Optim (NewtonTrustRegion)`, with `SecondOrderOptimization (LM, tall)` and `SecondOrderOptimization (LM, tall, LSMR)` |
| **1D ODE Boundary Value Problem** (`ode_bvp.jl`) | Large Sparse | Grid Points $N \in [32, 32768]$ | `NLLSModel (Sparse)`, `Standalone (Sparse)`, `NLPModels (MathOptNLSModel)` | The 13 standard rows and `SecondOrderOptimization (LM, tall)` |
| **Robust Procrustes on $SO(d)$** (`robust_procrustes.jl`) | Manifold | Matrix dim $d \in [3, 32]$ | `NLLSModel (ManifoldVar)`, `NLLSModel (Specialized)`, `Manifolds` | `SecondOrderOptimization` (LM, LM tall, Dogleg), `Manopt` (LevenbergMarquardt) |
| **Sparse Bundle Adjustment** (`bundle_adjustment.jl`) | Large Sparse | Cameras $N_{\text{cam}} \in [4, 256]$ | `NLLSModel`, `BundleAdjustmentModels` | `SecondOrderOptimization` (LM and Dogleg with Schur elimination; LM tall and LM tall LSMR with QR elimination), `CaNNOLeS`, `JSOSolvers` (trunk, tron), `Ipopt`, `MadNLP` |

**The 13 standard rows** are `SecondOrderOptimization` (Dogleg, LM), `LeastSquaresOptim` (Dogleg, LM), `Optim` (NewtonTrustRegion, Newton), `JSOSolvers` (trunk, tron), `Ipopt`, `MadNLP`, `NonlinearSolve` (LM, TrustRegion) and `CaNNOLeS`.

**"tall" rows.** The `SecondOrderOptimization` rows without "tall" use the normal equations: each step solves the damped system in $J^T J$. `SecondOrderOptimization (LM, tall)` runs the same Levenberg–Marquardt on the residual-and-Jacobian form (`formulation = :tall`): each step solves the damped least-squares problem in $J$ by QR, without forming $J^T J$. It runs on the problem's `NLLSModel` model, where `storage = :auto` stores $J$ dense or sparse from its fill, sparse at the large sizes of the sparse problems, and `linsolver = :auto` factorizes it by dense QR or by SPQR. On bundle adjustment the row uses the same iterator and `reduction = :eliminate` as the normal rows: the points are eliminated by QR of their blocks (square-root bundle adjustment), not by a Schur complement, and the reduced camera system is stored as `storage = :auto` chooses. `SecondOrderOptimization (LM, tall, LSMR)`, on the three large sparse problems (sparse Rosenbrock, pose chain, bundle adjustment), is the tall row with `linsolver = :lsmr`: each step's least-squares problem is solved iteratively by LSMR (Krylov.jl), on bundle adjustment on the reduced Jacobian.

**"fudged" rows.** Robust Exponential Curve Fitting's `Standalone (fudged)` model rewrites each residual as $\tilde r = \operatorname{sign}(r)\sqrt{\rho(r^2)}$, with the row of $J$ scaled by $\rho'(r^2)\,|r| / \sqrt{\rho(r^2)}$, so that a plain least-squares solver minimizes the robust cost: $\tfrac12\|\tilde r\|^2$ is the Huber cost exactly and $\tilde J^T \tilde r$ its gradient; only the Gauss–Newton Hessian $\tilde J^T \tilde J$ differs from the native one. A row named "fudged" (LeastSquaresOptim, NonlinearSolve, CaNNOLeS, which have no kernel interface, and the control row `SecondOrderOptimization (LM, fudged)`) runs that model. Optim, JSOSolvers, Ipopt and MadNLP run it too, under their standard names: their objective and gradient are exact, and only their Hessian comes from the rewrite.

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
