# Benchmark Results: Robust Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T02:48:51
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 3b3f450
- **Dependency Commits**: OptimizationVariableInterface cd7c159, SecondOrderOptimization 741d209, NLLSModel ebf8f1d

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 3 | NLLSModel (ManifoldVar) | 669.3548387096774 | 25 | 976 | 7194.333333333333 | 253 | 13952 |
| 3 | NLLSModel (Specialized) | 72.78246753246754 | 1 | 16 | 322.76190476190476 | 1 | 32 |
| 3 | Manifolds | 337.42622950819674 | 1 | 16 | 1473.2142857142858 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 998.0 | 41 | 1936 | 20000.0 | 781 | 60352 |
| 4 | NLLSModel (Specialized) | 96.21363636363637 | 1 | 16 | 717.25 | 1 | 32 |
| 4 | Manifolds | 395.8269230769231 | 1 | 16 | 5208.5 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1644.2307692307693 | 61 | 2896 | 50667.0 | 1891 | 183152 |
| 5 | NLLSModel (Specialized) | 150.66666666666666 | 1 | 16 | 2880.25 | 1 | 32 |
| 5 | Manifolds | 654.5806451612904 | 1 | 16 | 11916.0 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2490.777777777778 | 85 | 4720 | 121166.0 | 3907 | 511760 |
| 6 | NLLSModel (Specialized) | 232.5581395348837 | 1 | 16 | 9152.666666666666 | 1 | 32 |
| 6 | Manifolds | 1598.4545454545455 | 1 | 16 | 24917.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 4133.4 | 145 | 9232 | 448500.0 | 12313 | 2422688 |
| 8 | NLLSModel (Specialized) | 533.1025641025641 | 1 | 16 | 34125.0 | 1 | 32 |
| 8 | Manifolds | 2671.875 | 1 | 16 | 88708.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 8222.0 | 221 | 15856 | 1.637708e6 | 30086 | 9036752 |
| 10 | NLLSModel (Specialized) | 1109.6315789473683 | 1 | 16 | 135750.0 | 1 | 32 |
| 10 | Manifolds | 5948.0 | 1 | 16 | 289625.0 | 1 | 32 |
| 13 | NLLSModel (ManifoldVar) | 15417.0 | 365 | 29136 | 7.784875e6 | 85814 | 40757840 |
| 13 | NLLSModel (Specialized) | 3255.8571428571427 | 1 | 16 | 820583.0 | 1 | 32 |
| 13 | Manifolds | 10375.0 | 1 | 16 | 1.297e6 | 1 | 32 |
| 16 | NLLSModel (ManifoldVar) | 26209.0 | 545 | 52240 | 1.7082041e7 | 245753 | 129717920 |
| 16 | NLLSModel (Specialized) | 6472.333333333333 | 1 | 16 | 3.440125e6 | 1 | 32 |
| 16 | Manifolds | 19709.0 | 1 | 16 | 4.26925e6 | 1 | 32 |
| 20 | NLLSModel (ManifoldVar) | 57625.0 | 841 | 94096 | 1.09696417e8 | 599971 | 529841792 |
| 20 | NLLSModel (Specialized) | 14916.0 | 1 | 16 | 1.7621917e7 | 1 | 32 |
| 20 | Manifolds | 41792.0 | 1 | 16 | 1.5923834e7 | 1 | 32 |
| 26 | NLLSModel (ManifoldVar) | 112042.0 | 1405 | 190960 | 5.23613e8 | 1827658 | 2578777376 |
| 26 | NLLSModel (Specialized) | 40584.0 | 1 | 16 | 8.6677042e7 | 1 | 32 |
| 26 | Manifolds | 92250.0 | 1 | 16 | 7.8510042e7 | 1 | 32 |
| 32 | NLLSModel (ManifoldVar) | 146584.0 | 2113 | 337936 | 1.701624979e9 | 4193905 | 7825661216 |
| 32 | NLLSModel (Specialized) | 91791.0 | 1 | 16 | 3.7479675e8 | 1 | 32 |
| 32 | Manifolds | 115417.0 | 1 | 16 | 2.82902167e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 3 | SecondOrderOptimization (LM) | 11083.0 | 33 | 2496 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 32771.0 | 101 | 11136 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (Dogleg) | 10541.0 | 35 | 2576 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | Manopt (LevenbergMarquardt) | 584667.0 | 8373 | 471888 | 26 | 3.7711e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 4 | SecondOrderOptimization (LM) | 13541.5 | 33 | 3840 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 43396.0 | 102 | 22480 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 13583.0 | 35 | 3984 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | Manopt (LevenbergMarquardt) | 692729.5 | 8523 | 625920 | 14 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 5 | SecondOrderOptimization (LM) | 54083.0 | 33 | 6192 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 113750.0 | 107 | 48160 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (Dogleg) | 51062.0 | 35 | 6400 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | Manopt (LevenbergMarquardt) | 776521.0 | 9120 | 769200 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 6 | SecondOrderOptimization (LM) | 149979.0 | 33 | 10160 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 262896.0 | 108 | 105248 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (Dogleg) | 148333.5 | 35 | 10432 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | Manopt (LevenbergMarquardt) | 1.0293335e6 | 12089 | 1323648 | 12 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 8 | SecondOrderOptimization (LM) | 563500.0 | 50 | 43440 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 1.3298335e6 | 113 | 392720 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (Dogleg) | 567771.0 | 54 | 44032 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | Manopt (LevenbergMarquardt) | 1.875e6 | 16892 | 2734368 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 10 | SecondOrderOptimization (LM) | 2.31425e6 | 50 | 92656 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 5.3449585e6 | 113 | 1169552 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (Dogleg) | 2.325771e6 | 54 | 93536 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | Manopt (LevenbergMarquardt) | 4.4054585e6 | 23996 | 5927312 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 13 | SecondOrderOptimization (LM) | 1.27181875e7 | 50 | 262256 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (LM, tall) | 2.69593335e7 | 113 | 3980496 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (Dogleg) | 1.2840042e7 | 54 | 263680 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | Manopt (LevenbergMarquardt) | 1.2251958e7 | 34301 | 13727200 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 16 | SecondOrderOptimization (LM) | 5.56239165e7 | 215 | 778160 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (LM, tall) | 1.1712825e8 | 278 | 11214496 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 5.56650625e7 | 219 | 780256 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | Manopt (LevenbergMarquardt) | 3.3131125e7 | 58319 | 29784544 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 20 | SecondOrderOptimization (LM) | 2.79242271e8 | 260 | 1734256 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (LM, tall) | 3.61363333e8 | 323 | 35010864 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (Dogleg) | 2.81478604e8 | 264 | 1737600 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | Manopt (LevenbergMarquardt) | 1.4406925e8 | 87993 | 76395488 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 26 | SecondOrderOptimization (LM) | 1.409746e9 | 265 | 4698752 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 1.425227625e9 | 336 | 123527248 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (Dogleg) | 1.396350083e9 | 271 | 4705040 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | Manopt (LevenbergMarquardt) | 5.54979125e8 | 134599 | 213273840 | 9 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 32 | SecondOrderOptimization (LM) | 5.663429334e9 | 251 | 10468944 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 4.843584875e9 | 322 | 613949344 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 5.647024583e9 | 257 | 10477280 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | Manopt (LevenbergMarquardt) | 2.371898209e9 | 242048 | 513715952 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
