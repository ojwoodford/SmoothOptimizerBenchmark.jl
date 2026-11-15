# Benchmark Results: Robust Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T03:54:37
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 3 | NLLSModel (ManifoldVar) | 683.8965517241379 | 25 | 976 | 7402.666666666667 | 253 | 13952 |
| 3 | NLLSModel (Specialized) | 70.29136690647482 | 1 | 16 | 327.46875 | 1 | 32 |
| 3 | Manifolds | 347.9166666666667 | 1 | 16 | 1520.857142857143 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 1101.142857142857 | 41 | 1936 | 23292.0 | 781 | 60352 |
| 4 | NLLSModel (Specialized) | 96.25146198830409 | 1 | 16 | 715.5172413793103 | 1 | 32 |
| 4 | Manifolds | 419.88461538461536 | 1 | 16 | 5229.25 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1670.1666666666667 | 61 | 2896 | 54083.0 | 1891 | 183152 |
| 5 | NLLSModel (Specialized) | 160.6304347826087 | 1 | 16 | 2863.0 | 1 | 32 |
| 5 | Manifolds | 669.28125 | 1 | 16 | 12042.0 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2505.25 | 85 | 4720 | 138084.0 | 3907 | 511760 |
| 6 | NLLSModel (Specialized) | 233.325 | 1 | 16 | 9486.0 | 1 | 32 |
| 6 | Manifolds | 1615.3846153846155 | 1 | 16 | 24917.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 4175.0 | 145 | 9232 | 422500.0 | 12313 | 2422688 |
| 8 | NLLSModel (Specialized) | 516.025641025641 | 1 | 16 | 36042.0 | 1 | 32 |
| 8 | Manifolds | 2682.25 | 1 | 16 | 87458.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 8292.0 | 221 | 15856 | 1.412041e6 | 30086 | 9036752 |
| 10 | NLLSModel (Specialized) | 1106.5 | 1 | 16 | 140000.0 | 1 | 32 |
| 10 | Manifolds | 5958.5 | 1 | 16 | 293083.0 | 1 | 32 |
| 13 | NLLSModel (ManifoldVar) | 17292.0 | 365 | 29136 | 7.902416e6 | 85814 | 40757840 |
| 13 | NLLSModel (Specialized) | 3262.0 | 1 | 16 | 846375.0 | 1 | 32 |
| 13 | Manifolds | 10292.0 | 1 | 16 | 1.300792e6 | 1 | 32 |
| 16 | NLLSModel (ManifoldVar) | 28166.0 | 545 | 52240 | 1.7952542e7 | 245753 | 129717920 |
| 16 | NLLSModel (Specialized) | 6444.333333333333 | 1 | 16 | 3.46625e6 | 1 | 32 |
| 16 | Manifolds | 19959.0 | 1 | 16 | 4.255416e6 | 1 | 32 |
| 20 | NLLSModel (ManifoldVar) | 58333.0 | 841 | 94096 | 1.1360575e8 | 599971 | 529841792 |
| 20 | NLLSModel (Specialized) | 14666.0 | 1 | 16 | 1.7768584e7 | 1 | 32 |
| 20 | Manifolds | 44000.0 | 1 | 16 | 1.6130792e7 | 1 | 32 |
| 26 | NLLSModel (ManifoldVar) | 113583.0 | 1405 | 190960 | 5.35556209e8 | 1827658 | 2578777376 |
| 26 | NLLSModel (Specialized) | 40292.0 | 1 | 16 | 8.7814291e7 | 1 | 32 |
| 26 | Manifolds | 91959.0 | 1 | 16 | 7.8563167e7 | 1 | 32 |
| 32 | NLLSModel (ManifoldVar) | 154333.0 | 2113 | 337936 | 1.129798209e9 | 4193905 | 7825661216 |
| 32 | NLLSModel (Specialized) | 89500.0 | 1 | 16 | 3.7880475e8 | 1 | 32 |
| 32 | Manifolds | 123125.0 | 1 | 16 | 2.89784166e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 3 | SecondOrderOptimization (LM) | 10666.5 | 33 | 2496 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 32812.5 | 107 | 11280 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (Dogleg) | 10917.0 | 35 | 2576 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | Manopt (LevenbergMarquardt) | 523104.0 | 8166 | 450960 | 26 | 3.7711e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 4 | SecondOrderOptimization (LM) | 13917.0 | 33 | 3840 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 44312.5 | 108 | 22560 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 13917.0 | 35 | 3984 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | Manopt (LevenbergMarquardt) | 629104.0 | 8316 | 604992 | 14 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 5 | SecondOrderOptimization (LM) | 51312.5 | 33 | 6192 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 120041.5 | 113 | 48176 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (Dogleg) | 57209.0 | 35 | 6400 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | Manopt (LevenbergMarquardt) | 708562.5 | 8913 | 748272 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 6 | SecondOrderOptimization (LM) | 149229.0 | 33 | 10160 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 271333.0 | 114 | 105168 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (Dogleg) | 149542.0 | 35 | 10432 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | Manopt (LevenbergMarquardt) | 1.030959e6 | 11882 | 1302720 | 12 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 8 | SecondOrderOptimization (LM) | 595375.0 | 50 | 43440 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 1.3497915e6 | 119 | 392400 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (Dogleg) | 597520.5 | 54 | 44032 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | Manopt (LevenbergMarquardt) | 1.7363745e6 | 16685 | 2713440 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 10 | SecondOrderOptimization (LM) | 2.354417e6 | 50 | 92656 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 5.269063e6 | 119 | 1168960 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (Dogleg) | 2.3824585e6 | 54 | 93536 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | Manopt (LevenbergMarquardt) | 4.101104e6 | 23789 | 5906384 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 13 | SecondOrderOptimization (LM) | 1.2890958e7 | 50 | 262256 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (LM, tall) | 2.69275e7 | 119 | 3979360 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (Dogleg) | 1.2935604e7 | 54 | 263680 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | Manopt (LevenbergMarquardt) | 1.2173833e7 | 34094 | 13706272 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 16 | SecondOrderOptimization (LM) | 5.61458125e7 | 215 | 778160 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (LM, tall) | 1.17784125e8 | 284 | 11015936 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 5.6015521e7 | 219 | 780256 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | Manopt (LevenbergMarquardt) | 3.327125e7 | 58112 | 29763616 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 20 | SecondOrderOptimization (LM) | 2.868904795e8 | 260 | 1734256 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (LM, tall) | 3.6274575e8 | 329 | 33139984 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (Dogleg) | 2.889386045e8 | 264 | 1737600 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | Manopt (LevenbergMarquardt) | 1.4340625e8 | 87786 | 76374560 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 26 | SecondOrderOptimization (LM) | 1.428353875e9 | 265 | 4698752 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 1.475436291e9 | 342 | 121441200 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (Dogleg) | 1.428690916e9 | 271 | 4705040 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | Manopt (LevenbergMarquardt) | 5.7280175e8 | 134392 | 213252912 | 9 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 32 | SecondOrderOptimization (LM) | 5.689154417e9 | 251 | 10468944 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 5.053463875e9 | 328 | 343212032 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 5.665854041e9 | 257 | 10477280 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | Manopt (LevenbergMarquardt) | 2.423846041e9 | 241841 | 513695024 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
