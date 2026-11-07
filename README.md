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

---

## Benchmark Problem Suite

Each problem resides in `src/problems/`, scales across $\ge 11$ problem sizes, and defines its model formulations and compatible optimizer set:

| Problem | Category | Scaling Metric | Models Compared | Compatible Optimizers |
| :--- | :--- | :--- | :--- | :--- |
| **Exponential Curve Fitting** (`curve_fitting.jl`) | Medium Dense | Data points $m \in [64, 65536]$ | `NLLSModel (Static)`, `Standalone` | `NLLSModel + SecondOrderOptimization` (Dogleg, LM), `SecondOrderOptimization` (Dogleg, LM), `LeastSquaresOptim` (Dogleg, LM), `Optim` (NewtonTrustRegion, Newton), `JSOSolvers` (trunk, tron), `Ipopt`, `MadNLP`, `NonlinearSolve` (LM, TrustRegion) |
| **Dense Affine Alignment** (`affine_alignment.jl`) | Small Dense | Dimension $n \in [1, 32]$ | `NLLSModel`, `Standalone` (ForwardDiff) | All 14 standard Euclidean solvers (incl. `NLLSModel + SecondOrderOptimization`) |
| **Dense Multi-dimensional Rosenbrock** (`rosenbrock_dense.jl`) | Small Dense | Dimension $n \in [2, 32]$ | `NLLSModel`, `Standalone` (ForwardDiff), `NLPModels (MathOptNLSModel)` | All 14 standard Euclidean solvers (incl. `NLLSModel + SecondOrderOptimization`) |
| **Sparse Multi-dimensional Rosenbrock** (`rosenbrock_sparse.jl`) | Large Sparse | Variables $n \in [100, 75000]$ | `NLLSModel`, `Standalone (Sparse)`, `NLPModels (MathOptNLSModel)` | All standard Euclidean solvers (sparse Hessians / Jacobians) |
| **Nonlinear 3D Pose Chain** (`pose_chain.jl`) | Large Sparse | Poses $N \in [50, 10000]$ | `NLLSModel (Sparse)`, `Standalone (Sparse)` | All standard Euclidean solvers (sparse Hessians / Jacobians) |
| **Procrustes on $SO(d)$** (`robust_procrustes.jl`) | Manifold | Matrix dim $d \in [2, 24]$ | `NLLSModel (ManifoldVar)`, `NLLSModel (Specialized)`, `Manifolds` | `NLLSModel + SecondOrderOptimization` (LM, Dogleg), `SecondOrderOptimization` (LM, Dogleg), `Manopt` (LevenbergMarquardt) |
| **Sparse Bundle Adjustment** (`bundle_adjustment.jl`) | Large Sparse | Cameras $N_{\text{cam}} \in [4, 256]$ | `NLLSModel`, `BundleAdjustmentModels` | `NLLSModel + SecondOrderOptimization` (Sparse LM, Sparse Dogleg), `SecondOrderOptimization` (Sparse LM, Sparse Dogleg), `CaNNOLeS`, `JSOSolvers` (trunk, tron), `Ipopt`, `MadNLP` |

---

## Running the Benchmarks & Generating Documentation

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

# Run a single problem at one size
prob = create_robust_procrustes_problem()
run_problem_benchmark(prob, 3) # d = 3
```
