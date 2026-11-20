# Benchmark Results: Robust Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:17:31
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: fbb6630
- **Dependency Commits**: NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 3 | Manifolds | 345.33898305084745 | 1 | 16 | 1276.0625 | 1 | 32 |
| 3 | NLLSModel (ManifoldVar) | 691.6666666666666 | 25 | 976 | 7792.0 | 253 | 13952 |
| 3 | NLLSModel (Specialized) | 73.83419689119171 | 1 | 16 | 241.88311688311688 | 1 | 32 |
| 4 | Manifolds | 406.8627450980392 | 1 | 16 | 3882.0 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 1273.2222222222222 | 41 | 1936 | 20458.0 | 781 | 60352 |
| 4 | NLLSModel (Specialized) | 95.875 | 1 | 16 | 585.7941176470588 | 1 | 32 |
| 5 | Manifolds | 693.0666666666667 | 1 | 16 | 8459.0 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1802.0833333333333 | 61 | 2896 | 30875.0 | 1891 | 183152 |
| 5 | NLLSModel (Specialized) | 162.2781954887218 | 1 | 16 | 1887.5 | 1 | 32 |
| 6 | Manifolds | 1724.3076923076924 | 1 | 16 | 17708.0 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2732.1428571428573 | 85 | 4720 | 39959.0 | 3907 | 511760 |
| 6 | NLLSModel (Specialized) | 242.96385542168676 | 1 | 16 | 4983.4 | 1 | 32 |
| 8 | Manifolds | 2947.875 | 1 | 16 | 56875.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 2328.777777777778 | 145 | 9232 | 120125.0 | 12313 | 2422688 |
| 8 | NLLSModel (Specialized) | 536.1842105263158 | 1 | 16 | 28083.0 | 1 | 32 |
| 10 | Manifolds | 6083.25 | 1 | 16 | 189458.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 2552.0 | 221 | 15856 | 426875.0 | 30086 | 9036752 |
| 10 | NLLSModel (Specialized) | 1217.611111111111 | 1 | 16 | 113667.0 | 1 | 32 |
| 13 | Manifolds | 10625.0 | 1 | 16 | 869125.0 | 1 | 32 |
| 13 | NLLSModel (ManifoldVar) | 3071.4285714285716 | 365 | 29136 | 2.532792e6 | 85814 | 40757840 |
| 13 | NLLSModel (Specialized) | 3312.5 | 1 | 16 | 694208.0 | 1 | 32 |
| 16 | Manifolds | 20458.0 | 1 | 16 | 2.63225e6 | 1 | 32 |
| 16 | NLLSModel (ManifoldVar) | 4709.0 | 545 | 52240 | 8.957584e6 | 245753 | 129717920 |
| 16 | NLLSModel (Specialized) | 6667.0 | 1 | 16 | 3.21125e6 | 1 | 32 |
| 20 | Manifolds | 42625.0 | 1 | 16 | 1.3339375e7 | 1 | 32 |
| 20 | NLLSModel (ManifoldVar) | 9083.0 | 841 | 94096 | 8.4580791e7 | 599971 | 529841792 |
| 20 | NLLSModel (Specialized) | 15208.0 | 1 | 16 | 1.6292542e7 | 1 | 32 |
| 26 | Manifolds | 94916.0 | 1 | 16 | 5.4868166e7 | 1 | 32 |
| 26 | NLLSModel (ManifoldVar) | 17459.0 | 1405 | 190960 | 2.05757834e8 | 1827658 | 2578777376 |
| 26 | NLLSModel (Specialized) | 41250.0 | 1 | 16 | 8.0913083e7 | 1 | 32 |
| 32 | Manifolds | 115500.0 | 1 | 16 | 1.83421541e8 | 1 | 32 |
| 32 | NLLSModel (ManifoldVar) | 24000.0 | 2113 | 337936 | 5.82574291e8 | 4193905 | 7825661216 |
| 32 | NLLSModel (Specialized) | 92500.0 | 1 | 16 | 3.51503375e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 3 | Manopt (LevenbergMarquardt) | 579625.0 | 8314 | 463152 | 26 | 3.7711e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 3 | SecondOrderOptimization | 29417.0 | 108 | 9680 | 26 | 3.7711e-06 | true | ok | NaN | NaN | grad\_tol |
| 4 | Manopt (LevenbergMarquardt) | 643458.5 | 8464 | 617184 | 14 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 4 | SecondOrderOptimization | 31625.0 | 108 | 18112 | 14 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 5 | Manopt (LevenbergMarquardt) | 730417.0 | 9061 | 760464 | 11 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 5 | SecondOrderOptimization | 48833.0 | 112 | 38192 | 11 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 6 | Manopt (LevenbergMarquardt) | 1.001167e6 | 12030 | 1314912 | 12 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 6 | SecondOrderOptimization | 127541.5 | 112 | 85120 | 12 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 8 | Manopt (LevenbergMarquardt) | 1.789896e6 | 16833 | 2725632 | 11 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 8 | SecondOrderOptimization | 378812.0 | 119 | 303120 | 12 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 10 | Manopt (LevenbergMarquardt) | 4.1895205e6 | 23937 | 5918576 | 11 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 10 | SecondOrderOptimization | 1.2650415e6 | 119 | 928400 | 12 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 13 | Manopt (LevenbergMarquardt) | 1.2526417e7 | 34242 | 13718464 | 10 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 13 | SecondOrderOptimization | 4.473625e6 | 119 | 3190480 | 10 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 16 | Manopt (LevenbergMarquardt) | 3.361425e7 | 58260 | 29775808 | 10 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 16 | SecondOrderOptimization | 2.087257295e8 | 240 | 8862176 | 11 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 20 | Manopt (LevenbergMarquardt) | 1.75159875e8 | 87934 | 76386752 | 10 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 20 | SecondOrderOptimization | 3.08485792e8 | 287 | 36916432 | 12 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 26 | Manopt (LevenbergMarquardt) | 6.04205833e8 | 134540 | 213265104 | 9 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 26 | SecondOrderOptimization | 3.796085415e8 | 272 | 97416896 | 10 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 32 | Manopt (LevenbergMarquardt) | 2.055439042e9 | 241989 | 513707216 | 11 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 32 | SecondOrderOptimization | 7.454875835e8 | 286 | 273373728 | 11 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
