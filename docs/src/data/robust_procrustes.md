# Benchmark Results: Robust Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T01:49:20
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=1
- **Git Commit**: 2c10368
- **Dependency Commits**: OptimizationVariableInterface f130043, SecondOrderOptimization 377b96e, NLLSModel 78a4ef5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 3 | NLLSModel (ManifoldVar) | 685.3448275862069 | 25 | 976 | 7459.0 | 253 | 13952 |
| 3 | NLLSModel (Specialized) | 75.20746887966806 | 1 | 16 | 255.6818181818182 | 1 | 32 |
| 3 | Manifolds | 345.33898305084745 | 1 | 16 | 1350.4705882352941 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 1328.9473684210527 | 41 | 1936 | 20333.0 | 781 | 60352 |
| 4 | NLLSModel (Specialized) | 110.98181818181818 | 1 | 16 | 663.9677419354839 | 1 | 32 |
| 4 | Manifolds | 395.03846153846155 | 1 | 16 | 3680.5 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1995.8 | 61 | 2896 | 30042.0 | 1891 | 183152 |
| 5 | NLLSModel (Specialized) | 152.0 | 1 | 16 | 2817.75 | 1 | 32 |
| 5 | Manifolds | 708.34375 | 1 | 16 | 8417.0 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2552.125 | 85 | 4720 | 38542.0 | 3907 | 511760 |
| 6 | NLLSModel (Specialized) | 246.875 | 1 | 16 | 8458.0 | 1 | 32 |
| 6 | Manifolds | 1727.5384615384614 | 1 | 16 | 17666.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 2277.777777777778 | 145 | 9232 | 134750.0 | 12313 | 2422688 |
| 8 | NLLSModel (Specialized) | 514.2857142857143 | 1 | 16 | 36209.0 | 1 | 32 |
| 8 | Manifolds | 2812.5 | 1 | 16 | 55958.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 2479.125 | 221 | 15856 | 727542.0 | 30086 | 9036752 |
| 10 | NLLSModel (Specialized) | 1162.0555555555557 | 1 | 16 | 144000.0 | 1 | 32 |
| 10 | Manifolds | 5948.0 | 1 | 16 | 192791.0 | 1 | 32 |
| 13 | NLLSModel (ManifoldVar) | 5309.428571428572 | 365 | 29136 | 2.891583e6 | 85814 | 40757840 |
| 13 | NLLSModel (Specialized) | 3273.8571428571427 | 1 | 16 | 846459.0 | 1 | 32 |
| 13 | Manifolds | 10916.0 | 1 | 16 | 845917.0 | 1 | 32 |
| 16 | NLLSModel (ManifoldVar) | 4906.25 | 545 | 52240 | 1.4373542e7 | 245753 | 129717920 |
| 16 | NLLSModel (Specialized) | 6875.0 | 1 | 16 | 3.502375e6 | 1 | 32 |
| 16 | Manifolds | 21125.0 | 1 | 16 | 2.639666e6 | 1 | 32 |
| 20 | NLLSModel (ManifoldVar) | 9125.0 | 841 | 94096 | 7.2480667e7 | 599971 | 529841792 |
| 20 | NLLSModel (Specialized) | 15958.0 | 1 | 16 | 1.8342667e7 | 1 | 32 |
| 20 | Manifolds | 41792.0 | 1 | 16 | 1.0462417e7 | 1 | 32 |
| 26 | NLLSModel (ManifoldVar) | 17250.0 | 1405 | 190960 | 1.86538875e8 | 1827658 | 2578777376 |
| 26 | NLLSModel (Specialized) | 40834.0 | 1 | 16 | 8.7953708e7 | 1 | 32 |
| 26 | Manifolds | 92583.0 | 1 | 16 | 5.169475e7 | 1 | 32 |
| 32 | NLLSModel (ManifoldVar) | 22834.0 | 2113 | 337936 | 5.406845e8 | 4193905 | 7825661216 |
| 32 | NLLSModel (Specialized) | 91333.0 | 1 | 16 | 3.90494292e8 | 1 | 32 |
| 32 | Manifolds | 115500.0 | 1 | 16 | 1.93589708e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 3 | SecondOrderOptimization (LM) | 10791.5 | 33 | 2496 | 26 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 36875.0 | 101 | 11136 | 26 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (Dogleg) | 10625.0 | 35 | 2576 | 26 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | Manopt (LevenbergMarquardt) | 583979.5 | 8316 | 463248 | 26 | 3.7711e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 4 | SecondOrderOptimization (LM) | 16708.0 | 33 | 3840 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 50520.5 | 102 | 22480 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 15333.0 | 35 | 3984 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | Manopt (LevenbergMarquardt) | 651916.0 | 8466 | 617280 | 14 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 5 | SecondOrderOptimization (LM) | 30770.5 | 55 | 8112 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 86708.0 | 107 | 48192 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (Dogleg) | 30354.5 | 57 | 8320 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | Manopt (LevenbergMarquardt) | 779124.5 | 9063 | 760560 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 6 | SecondOrderOptimization (LM) | 61250.0 | 59 | 17136 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 226708.0 | 108 | 105440 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (Dogleg) | 56209.0 | 61 | 17408 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | Manopt (LevenbergMarquardt) | 1.122583e6 | 12032 | 1315008 | 12 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 8 | SecondOrderOptimization (LM) | 201333.5 | 90 | 67392 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 979145.5 | 113 | 392944 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (Dogleg) | 244146.0 | 94 | 67984 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | Manopt (LevenbergMarquardt) | 1.821667e6 | 16835 | 2725728 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 10 | SecondOrderOptimization (LM) | 670083.0 | 90 | 144640 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 3.847125e6 | 113 | 1169776 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (Dogleg) | 681541.5 | 94 | 145520 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | Manopt (LevenbergMarquardt) | 4.1925e6 | 23939 | 5918672 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 13 | SecondOrderOptimization (LM) | 3.0684585e6 | 91 | 413520 | 10 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (LM, tall) | 1.9159208e7 | 113 | 3980720 | 10 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (Dogleg) | 2.95025e6 | 95 | 414944 | 10 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | Manopt (LevenbergMarquardt) | 1.25065625e7 | 34244 | 13718560 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 16 | SecondOrderOptimization (LM) | 1.2279125e7 | 212 | 1149744 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (LM, tall) | 8.7717083e7 | 234 | 10991808 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 1.222675e7 | 216 | 1151840 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | Manopt (LevenbergMarquardt) | 3.49968125e7 | 58262 | 29775904 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 20 | SecondOrderOptimization (LM) | 6.27888755e7 | 259 | 2580896 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (LM, tall) | 2.89211479e8 | 281 | 33098672 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (Dogleg) | 6.3698541e7 | 263 | 2584240 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | Manopt (LevenbergMarquardt) | 1.56530458e8 | 87936 | 76386848 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 26 | SecondOrderOptimization (LM) | 2.63437625e8 | 239 | 7139776 | 10 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 9.61548083e8 | 266 | 121320864 | 10 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (Dogleg) | 2.690670415e8 | 245 | 7146064 | 10 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | Manopt (LevenbergMarquardt) | 5.880366045e8 | 134542 | 213265200 | 9 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 32 | SecondOrderOptimization (LM) | 1.266012333e9 | 253 | 16330144 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 3.831440083e9 | 280 | 343120128 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 1.256902291e9 | 259 | 16338480 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | Manopt (LevenbergMarquardt) | 2.364433083e9 | 241991 | 513707312 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
