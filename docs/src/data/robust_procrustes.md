# Benchmark Results: Robust Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T03:12:29
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 3 | NLLSModel (ManifoldVar) | 671.0 | 25 | 976 | 7750.0 | 253 | 13952 |
| 3 | NLLSModel (Specialized) | 71.82167832167832 | 1 | 16 | 322.265625 | 1 | 32 |
| 3 | Manifolds | 344.70454545454544 | 1 | 16 | 1511.857142857143 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 1318.0 | 41 | 1936 | 20167.0 | 781 | 60352 |
| 4 | NLLSModel (Specialized) | 95.64545454545454 | 1 | 16 | 757.4285714285714 | 1 | 32 |
| 4 | Manifolds | 395.8333333333333 | 1 | 16 | 5593.75 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1680.5833333333333 | 61 | 2896 | 29709.0 | 1891 | 183152 |
| 5 | NLLSModel (Specialized) | 152.35114503816794 | 1 | 16 | 2875.0 | 1 | 32 |
| 5 | Manifolds | 668.0 | 1 | 16 | 12333.0 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2677.0 | 85 | 4720 | 38583.0 | 3907 | 511760 |
| 6 | NLLSModel (Specialized) | 233.54320987654322 | 1 | 16 | 9250.0 | 1 | 32 |
| 6 | Manifolds | 1608.923076923077 | 1 | 16 | 25084.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 2773.1111111111113 | 145 | 9232 | 125667.0 | 12313 | 2422688 |
| 8 | NLLSModel (Specialized) | 534.1794871794872 | 1 | 16 | 36208.0 | 1 | 32 |
| 8 | Manifolds | 2880.25 | 1 | 16 | 87375.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 2482.1428571428573 | 221 | 15856 | 452500.0 | 30086 | 9036752 |
| 10 | NLLSModel (Specialized) | 1162.0 | 1 | 16 | 138792.0 | 1 | 32 |
| 10 | Manifolds | 6010.5 | 1 | 16 | 314167.0 | 1 | 32 |
| 13 | NLLSModel (ManifoldVar) | 3214.285714285714 | 365 | 29136 | 2.629e6 | 85814 | 40757840 |
| 13 | NLLSModel (Specialized) | 3482.1428571428573 | 1 | 16 | 843458.0 | 1 | 32 |
| 13 | Manifolds | 10584.0 | 1 | 16 | 1.370458e6 | 1 | 32 |
| 16 | NLLSModel (ManifoldVar) | 5000.0 | 545 | 52240 | 1.0940375e7 | 245753 | 129717920 |
| 16 | NLLSModel (Specialized) | 6375.0 | 1 | 16 | 3.487583e6 | 1 | 32 |
| 16 | Manifolds | 21417.0 | 1 | 16 | 4.199708e6 | 1 | 32 |
| 20 | NLLSModel (ManifoldVar) | 13875.0 | 841 | 94096 | 8.2342375e7 | 599971 | 529841792 |
| 20 | NLLSModel (Specialized) | 15083.0 | 1 | 16 | 1.8215458e7 | 1 | 32 |
| 20 | Manifolds | 43042.0 | 1 | 16 | 2.1573625e7 | 1 | 32 |
| 26 | NLLSModel (ManifoldVar) | 17083.0 | 1405 | 190960 | 1.93682792e8 | 1827658 | 2578777376 |
| 26 | NLLSModel (Specialized) | 52250.0 | 1 | 16 | 8.8597625e7 | 1 | 32 |
| 26 | Manifolds | 98167.0 | 1 | 16 | 8.8333291e7 | 1 | 32 |
| 32 | NLLSModel (ManifoldVar) | 31208.0 | 2113 | 337936 | 5.59700625e8 | 4193905 | 7825661216 |
| 32 | NLLSModel (Specialized) | 89792.0 | 1 | 16 | 3.855145e8 | 1 | 32 |
| 32 | Manifolds | 117000.0 | 1 | 16 | 2.76577417e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 3 | SecondOrderOptimization (LM) | 10979.0 | 33 | 2496 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 35021.0 | 107 | 11280 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (Dogleg) | 11375.0 | 35 | 2576 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | Manopt (LevenbergMarquardt) | 541750.0 | 8166 | 450960 | 26 | 3.7711e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 4 | SecondOrderOptimization (LM) | 13917.0 | 33 | 3840 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 45604.0 | 108 | 22560 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 14541.0 | 35 | 3984 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | Manopt (LevenbergMarquardt) | 620791.5 | 8316 | 604992 | 14 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 5 | SecondOrderOptimization (LM) | 38709.0 | 55 | 8112 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 108687.5 | 113 | 48208 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (Dogleg) | 39062.5 | 57 | 8320 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | Manopt (LevenbergMarquardt) | 692375.0 | 8913 | 748272 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 6 | SecondOrderOptimization (LM) | 96937.5 | 59 | 17136 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 260500.0 | 114 | 105360 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (Dogleg) | 72791.5 | 61 | 17408 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | Manopt (LevenbergMarquardt) | 994229.0 | 11882 | 1302720 | 12 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 8 | SecondOrderOptimization (LM) | 236229.5 | 90 | 67392 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 1.1392915e6 | 119 | 392624 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (Dogleg) | 265583.5 | 94 | 67984 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | Manopt (LevenbergMarquardt) | 1.7364375e6 | 16685 | 2713440 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 10 | SecondOrderOptimization (LM) | 824562.5 | 90 | 144640 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 3.10619333e8 | 119 | 1169184 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (Dogleg) | 825896.0 | 94 | 145520 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | Manopt (LevenbergMarquardt) | 4.062521e6 | 23789 | 5906384 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 13 | SecondOrderOptimization (LM) | 4.011375e6 | 91 | 413520 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (LM, tall) | 3.39850708e8 | 119 | 3979584 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (Dogleg) | 4.0076665e6 | 95 | 414944 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | Manopt (LevenbergMarquardt) | 1.2368562e7 | 34094 | 13706272 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 16 | SecondOrderOptimization (LM) | 1.26976271e8 | 256 | 1176048 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (LM, tall) | 4.995835625e8 | 284 | 12048352 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 1.36514229e8 | 260 | 1178144 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | Manopt (LevenbergMarquardt) | 3.3850458e7 | 58112 | 29763616 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 20 | SecondOrderOptimization (LM) | 2.75113188e8 | 301 | 2625536 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (LM, tall) | 6.88117604e8 | 329 | 33140208 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (Dogleg) | 2.83099271e8 | 305 | 2628880 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | Manopt (LevenbergMarquardt) | 1.59630979e8 | 87786 | 76374560 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 26 | SecondOrderOptimization (LM) | 6.847826875e8 | 309 | 7265616 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 1.052202125e9 | 342 | 141003920 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (Dogleg) | 6.854825625e8 | 315 | 7271904 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | Manopt (LevenbergMarquardt) | 6.54446563e8 | 134392 | 213252912 | 9 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 32 | SecondOrderOptimization (LM) | 2.054310208e9 | 295 | 16430368 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 2.566360125e9 | 328 | 340771040 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 2.129908541e9 | 301 | 16438704 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | Manopt (LevenbergMarquardt) | 2.035484083e9 | 241841 | 513695024 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
