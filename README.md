# SmoothOptimizerBenchmark.jl

[![Build Status](https://github.com/ojwoodford/SmoothOptimizerBenchmark.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/ojwoodford/SmoothOptimizerBenchmark.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![codecov](https://codecov.io/gh/ojwoodford/SmoothOptimizerBenchmark.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/ojwoodford/SmoothOptimizerBenchmark.jl)

Benchmarking suite comparing second-order optimization and nonlinear least squares packages in Julia:
- **SecondOrderOptimization.jl**
- **NLLSModels.jl**
- **Optim.jl**
- **LeastSquaresOptim.jl**

## Benchmark Tasks

1. **Rosenbrock (Static 2D)**: Unconstrained minimization of the 2D Rosenbrock function on `SVector{2, Float64}`. Verifies zero heap allocations with `OptimizationWorkspace` and compares against `Optim.jl` and `LeastSquaresOptim.jl` (with analytic Jacobian).
2. **20-Point Exponential Curve Fitting**: Nonlinear least squares fitting ($y = a e^{-b t} + c$) on 20 data points comparing cold start, cached workspace (`OptimizeCache`), and `LeastSquaresOptim.jl`.
3. **Nonlinear Sparse 3D Chain (60 variables)**: 20-pose 3D chain with block-tridiagonal sparsity structure comparing cold-start and cached sparse Levenberg-Marquardt (`:ldl`).
4. **Sparse Bundle Adjustment (10 cameras, 50 points = 210 DoF)**: Sparse BA comparing cold vs cached Sparse Levenberg-Marquardt (`:levenbergmarquardt` and `:levenbergmarquardt_dtd`), Sparse Dogleg (`:dogleg`), and per-landmark single-variable optimization (`optimizesingles!`).

## Running the Benchmarks

From the repository root:

```bash
julia --project=. src/run.jl
```

Or from Julia:

```julia
using SmoothOptimizerBenchmark
SmoothOptimizerBenchmark.run_all_benchmarks()
```
