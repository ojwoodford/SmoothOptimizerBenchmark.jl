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
| **Exponential Curve Fitting** (`curve_fitting.jl`) | Medium Dense | Data points $m \in [64, 65536]$ | `NLLSModel (Static)`, `Standalone` | `SecondOrderOptimization` (Dogleg, LM), `LeastSquaresOptim` (Dogleg, LM), `Optim` (NewtonTrustRegion, Newton), `JSOSolvers` (trunk, tron), `Ipopt`, `MadNLP`, `NonlinearSolve` (LM, TrustRegion) |
| **Dense Affine Alignment** (`affine_alignment.jl`) | Small Dense | Dimension $n \in [1, 32]$ | `Standalone` (ForwardDiff) | All 13 standard Euclidean solvers (`SecondOrderOptimization`, `LeastSquaresOptim`, `Optim`, `JSOSolvers`, `Ipopt`, `MadNLP`, `NonlinearSolve`, `CaNNOLeS`) |
| **Dense Multi-dimensional Rosenbrock** (`rosenbrock_dense.jl`) | Small Dense | Dimension $n \in [2, 32]$ | `NLLSModel`, `Standalone` (ForwardDiff), `NLPModels (MathOptNLSModel)` | All 12 standard Euclidean solvers (`SecondOrderOptimization`, `LeastSquaresOptim`, `Optim`, `JSOSolvers`, `Ipopt`, `MadNLP`, `NonlinearSolve`) |
| **Sparse Multi-dimensional Rosenbrock** (`rosenbrock_sparse.jl`) | Large Sparse | Variables $n \in [100, 75000]$ | `NLLSModel`, `Standalone (Sparse)`, `NLPModels (MathOptNLSModel)` | All standard Euclidean solvers (sparse Hessians / Jacobians) |
| **Nonlinear 3D Pose Chain** (`pose_chain.jl`) | Large Sparse | Poses $N \in [50, 10000]$ | `NLLSModel (Sparse)` | All standard Euclidean solvers (sparse Hessians / Jacobians) |
| **1D ODE Boundary Value Problem** (`ode_bvp.jl`) | Large Sparse | Grid Points $N \in [32, 32768]$ | `NLLSModel (Sparse)`, `Standalone (Sparse)`, `NLPModels (MathOptNLSModel)` | All 13 standard Euclidean solvers (`SecondOrderOptimization`, `LeastSquaresOptim`, `Optim`, `JSOSolvers`, `Ipopt`, `MadNLP`, `NonlinearSolve`, `CaNNOLeS`) |
| **Robust Procrustes on $SO(d)$** (`robust_procrustes.jl`) | Manifold | Matrix dim $d \in [3, 32]$ | `NLLSModel (ManifoldVar)`, `NLLSModel (Specialized)`, `Manifolds` | `SecondOrderOptimization` (LM, Dogleg), `Manopt` (LevenbergMarquardt) |
| **Sparse Bundle Adjustment** (`bundle_adjustment.jl`) | Large Sparse | Cameras $N_{\text{cam}} \in [4, 256]$ | `NLLSModel`, `BundleAdjustmentModels` | `SecondOrderOptimization` (LM, Dogleg with Schur solver), `CaNNOLeS`, `JSOSolvers` (trunk, tron), `Ipopt`, `MadNLP` |

---

## Running the Benchmarks & Generating Documentation

SecondOrderOptimization and NLLSModel are not registered, and `Project.toml` has no `[sources]` block, so the environment does not instantiate from the registry alone. Develop the unregistered packages into the local `Manifest.toml` (which is not committed) from checkouts beside this one, before the first run:

```bash
julia --project=. -e 'using Pkg; Pkg.develop([PackageSpec(path = "../SecondOrderOptimization.jl"), PackageSpec(path = "../NLLSModel.jl")])'
```

Do the same for OptimizationVariableInterface or BlockLinearSystems to run against an unregistered version of either. `Pkg.develop` adds a package it develops to `Project.toml`'s `[deps]` if it is not there; do not commit that edit.

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
