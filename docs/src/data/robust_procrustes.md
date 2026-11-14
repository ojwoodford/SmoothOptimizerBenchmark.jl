# Benchmark Results: Robust Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-14T13:52:44
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 4e9eec5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 3 | NLLSModel (ManifoldVar) | 659.7333333333333 | 25 | 976 | 7375.0 | 253 | 13952 |
| 3 | NLLSModel (Specialized) | 82.75174825174825 | 1 | 16 | 399.0169491525424 | 1 | 32 |
| 3 | Manifolds | 366.2280701754386 | 1 | 16 | 1681.5714285714287 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 1135.9473684210527 | 41 | 1936 | 21459.0 | 781 | 60352 |
| 4 | NLLSModel (Specialized) | 115.31140350877193 | 1 | 16 | 762.8461538461538 | 1 | 32 |
| 4 | Manifolds | 405.3958333333333 | 1 | 16 | 5260.5 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1701.4166666666667 | 61 | 2896 | 51875.0 | 1891 | 183152 |
| 5 | NLLSModel (Specialized) | 154.5801526717557 | 1 | 16 | 2958.4285714285716 | 1 | 32 |
| 5 | Manifolds | 646.483870967742 | 1 | 16 | 11834.0 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2490.777777777778 | 85 | 4720 | 120958.0 | 3907 | 511760 |
| 6 | NLLSModel (Specialized) | 231.1046511627907 | 1 | 16 | 9334.0 | 1 | 32 |
| 6 | Manifolds | 1599.3076923076924 | 1 | 16 | 24916.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 4075.0 | 145 | 9232 | 401417.0 | 12313 | 2422688 |
| 8 | NLLSModel (Specialized) | 517.1025641025641 | 1 | 16 | 36000.0 | 1 | 32 |
| 8 | Manifolds | 2812.5 | 1 | 16 | 89667.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 8250.0 | 221 | 15856 | 1.400042e6 | 30086 | 9036752 |
| 10 | NLLSModel (Specialized) | 1174.0 | 1 | 16 | 138875.0 | 1 | 32 |
| 10 | Manifolds | 5958.25 | 1 | 16 | 294250.0 | 1 | 32 |
| 13 | NLLSModel (ManifoldVar) | 15334.0 | 365 | 29136 | 7.814292e6 | 85814 | 40757840 |
| 13 | NLLSModel (Specialized) | 3250.0 | 1 | 16 | 832583.0 | 1 | 32 |
| 13 | Manifolds | 10375.0 | 1 | 16 | 1.296416e6 | 1 | 32 |
| 16 | NLLSModel (ManifoldVar) | 26291.0 | 545 | 52240 | 1.8204209e7 | 245753 | 129717920 |
| 16 | NLLSModel (Specialized) | 6354.25 | 1 | 16 | 3.434583e6 | 1 | 32 |
| 16 | Manifolds | 19667.0 | 1 | 16 | 4.148666e6 | 1 | 32 |
| 20 | NLLSModel (ManifoldVar) | 57417.0 | 841 | 94096 | 1.2353625e8 | 599971 | 529841792 |
| 20 | NLLSModel (Specialized) | 14583.0 | 1 | 16 | 1.7612917e7 | 1 | 32 |
| 20 | Manifolds | 41875.0 | 1 | 16 | 1.8077041e7 | 1 | 32 |
| 26 | NLLSModel (ManifoldVar) | 113292.0 | 1405 | 190960 | 3.27027708e8 | 1827658 | 2578777376 |
| 26 | NLLSModel (Specialized) | 41709.0 | 1 | 16 | 8.8837834e7 | 1 | 32 |
| 26 | Manifolds | 97375.0 | 1 | 16 | 8.66765e7 | 1 | 32 |
| 32 | NLLSModel (ManifoldVar) | 23625.0 | 2114 | 337968 | 4.07952e8 | 4193908 | 7825661760 |
| 32 | NLLSModel (Specialized) | 90333.0 | 1 | 16 | 3.82392834e8 | 1 | 32 |
| 32 | Manifolds | 116542.0 | 1 | 16 | 2.6209025e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 3 | SecondOrderOptimization (LM) | 10771.0 | 29 | 2320 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 34250.0 | 105 | 11264 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (Dogleg) | 10791.5 | 31 | 2400 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | Manopt (LevenbergMarquardt) | 537229.0 | 8166 | 450960 | 26 | 3.7711e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 4 | SecondOrderOptimization (LM) | 14041.5 | 29 | 3648 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 43437.0 | 106 | 22560 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 13917.0 | 31 | 3792 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | Manopt (LevenbergMarquardt) | 612125.0 | 8316 | 604992 | 14 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 5 | SecondOrderOptimization (LM) | 51541.5 | 29 | 6016 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 112104.0 | 111 | 48160 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (Dogleg) | 51708.0 | 31 | 6224 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | Manopt (LevenbergMarquardt) | 699354.0 | 8913 | 748272 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 6 | SecondOrderOptimization (LM) | 147375.0 | 29 | 9968 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 263875.0 | 112 | 105200 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (Dogleg) | 148313.0 | 31 | 10240 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | Manopt (LevenbergMarquardt) | 1.000021e6 | 11882 | 1302720 | 12 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 8 | SecondOrderOptimization (LM) | 607625.0 | 46 | 43280 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 1.3331455e6 | 117 | 392432 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (Dogleg) | 605729.0 | 50 | 43872 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | Manopt (LevenbergMarquardt) | 1.724396e6 | 16685 | 2713440 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 10 | SecondOrderOptimization (LM) | 2.382771e6 | 46 | 92384 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 6.1308745e6 | 117 | 1168992 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (Dogleg) | 2.37975e6 | 50 | 93264 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | Manopt (LevenbergMarquardt) | 4.0799585e6 | 23789 | 5906384 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 13 | SecondOrderOptimization (LM) | 1.2970833e7 | 46 | 262096 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (LM, tall) | 2.57787705e7 | 117 | 3979392 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (Dogleg) | 1.2910917e7 | 50 | 263520 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | Manopt (LevenbergMarquardt) | 1.2267125e7 | 34094 | 13706272 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 16 | SecondOrderOptimization (LM) | 5.9571417e7 | 211 | 778000 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (LM, tall) | 1.021251875e8 | 282 | 11015968 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 5.920825e7 | 215 | 780096 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | Manopt (LevenbergMarquardt) | 3.4737458e7 | 58112 | 29763616 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 20 | SecondOrderOptimization (LM) | 2.985895205e8 | 256 | 1734096 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (LM, tall) | 2.52712437e8 | 327 | 33140016 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (Dogleg) | 2.990550625e8 | 260 | 1737440 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | Manopt (LevenbergMarquardt) | 1.58669041e8 | 87786 | 76374560 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 26 | SecondOrderOptimization (LM) | 1.484335e9 | 261 | 4698592 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 7.59281271e8 | 340 | 121441104 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (Dogleg) | 1.470358583e9 | 267 | 4704880 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | Manopt (LevenbergMarquardt) | 6.37325417e8 | 134392 | 213252912 | 9 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 32 | SecondOrderOptimization (LM) | 1.726643208e9 | 360 | 24385488 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 2.030219958e9 | 341 | 342070704 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 1.738763666e9 | 366 | 24393824 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | Manopt (LevenbergMarquardt) | 1.945184833e9 | 241841 | 513695024 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
