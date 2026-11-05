# SmoothOptimizerBenchmark.jl

[![Build Status](https://github.com/ojwoodford/SmoothOptimizerBenchmark.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/ojwoodford/SmoothOptimizerBenchmark.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![codecov](https://codecov.io/gh/ojwoodford/SmoothOptimizerBenchmark.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/ojwoodford/SmoothOptimizerBenchmark.jl)

Benchmarking suite comparing smooth optimization, nonlinear least squares, and manifold optimization packages across Julia:
- **SecondOrderOptimization.jl**
- **NLLSModels.jl**
- **Optim.jl**
- **LeastSquaresOptim.jl**
- **JuMP.jl** / **Ipopt.jl**
- **JSOSolvers.jl** / **NLPModels.jl**
- **Manopt.jl** / **Manifolds.jl**
- **CaNNOLeS.jl** / **BundleAdjustmentModels.jl**

---

## Benchmarking Architecture

Benchmarks are decoupled into two distinct phases for transparent attribution of performance:

1. **Phase 1: Model Evaluation Benchmark**:
   - Isolates pure **Cost Evaluation** ($f(x)$ or sum of squares)
   - Isolates **Cost + Linear System Evaluation** (gradient & Hessian, or residual vector & Jacobian / normal equations)
   - Benchmarks each candidate model representation in isolation.
2. **Phase 2: Optimizer Benchmark (Apples-to-Apples)**:
   - Automatically selects the fastest model representation from Phase 1.
   - Runs **all compatible optimizers on the exact same model representation** via cross-framework adapters, ensuring true apples-to-apples comparison of optimizer logic without conflating model evaluation overheads.

---

## Benchmark Problem Suite

Each problem resides in its own source file (`src/problems/`), is adjustable in size, and defines its model implementations and compatible optimizer set:

| Problem | Category | Implementations Tested | Compatible Optimizers |
| :--- | :--- | :--- | :--- |
| **2D Rosenbrock** (`rosenbrock_2d.jl`) | Small Dense | `SecondOrderOptimization` (static `SVector`), `LeastSquaresOptim`, `NLLSModels`, `Optim` | `SecondOrderOptimization` (Dogleg, LM), `Optim` (Newton, NewtonTrustRegion), `LeastSquaresOptim` (Dogleg, LM) |
| **Exponential Curve Fitting** (`curve_fitting.jl`) | Small Dense | `NLLSModels` (static), `LeastSquaresOptim` (in-place), `SecondOrderOptimization` | `SecondOrderOptimization` (Dogleg, LM), `LeastSquaresOptim` (Dogleg, LM) |
| **Dense Affine Alignment** (`affine_alignment.jl`) | Large Dense | `NLLSModels`, `LeastSquaresOptim` (autodiff) | `SecondOrderOptimization` (Dogleg, LM), `LeastSquaresOptim` (LM) |
| **Dense Multi-dimensional Rosenbrock** (`rosenbrock_dense.jl`) | Large Dense | `NLLSModels`, `LeastSquaresOptim`, `NLPModels` (`MathOptNLSModel`) | `SecondOrderOptimization` (Dogleg, LM), `LeastSquaresOptim` (LM), `Ipopt`, `JSOSolvers` (trunk, tron) |
| **Sparse Multi-dimensional Rosenbrock** (`rosenbrock_sparse.jl`) | Large Sparse | `NLLSModels`, `LeastSquaresOptim` (sparse Jacobian), `NLPModels` (`MathOptNLSModel`) | `SecondOrderOptimization` (Sparse LM `:ldl`), `LeastSquaresOptim` (Sparse LM), `Ipopt`, `JSOSolvers` (trunk, tron) |
| **Nonlinear 3D Pose Chain** (`pose_chain.jl`) | Large Sparse | `NLLSModels` (sparse block-tridiagonal), `LeastSquaresOptim` (sparse) | `SecondOrderOptimization` (Sparse LM, Sparse Dogleg), `LeastSquaresOptim` (LM) |
| **Robust Procrustes on $SO(d)$** (`robust_procrustes.jl`) | Manifold | `NLLSModels` (`OptimizationVariableInterface.ManifoldVar`), `NLLSModels` (closed-form `Rotation`), `Manopt` (`Rotations(d)`) | `SecondOrderOptimization` (LM, Dogleg), `Manopt` (Riemannian LevenbergMarquardt) |
| **Sparse Bundle Adjustment** (`bundle_adjustment.jl`) | Large Sparse | `NLLSModels` (synthetic & BAL), `BundleAdjustmentModels` | `SecondOrderOptimization` (Sparse LM, Sparse Dogleg, Landmark singles), `CaNNOLeS` (`cannoles`) |

---

## Running the Benchmarks

To run the complete benchmark suite:

```bash
julia --project=. src/run.jl
```

Or from an interactive Julia session:

```julia
using SmoothOptimizerBenchmark

# Run all benchmarks across default sizes
SmoothOptimizerBenchmark.run_all_benchmarks()

# Or run quick test benchmarks:
SmoothOptimizerBenchmark.run_all_benchmarks(quick=true)
```

To run individual problems:

```julia
using SmoothOptimizerBenchmark

prob = create_robust_procrustes_problem()
run_problem_benchmark(prob, 3) # d=3
```
