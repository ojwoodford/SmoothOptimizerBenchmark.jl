# Benchmark Results: Robust Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T02:01:05
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 3b3f450
- **Dependency Commits**: OptimizationVariableInterface cd7c159, SecondOrderOptimization 741d209, NLLSModel ebf8f1d

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 3 | NLLSModel (ManifoldVar) | 638.4516129032259 | 25 | 976 | 7291.0 | 253 | 13952 |
| 3 | NLLSModel (Specialized) | 72.32441471571906 | 1 | 16 | 339.73846153846154 | 1 | 32 |
| 3 | Manifolds | 343.05 | 1 | 16 | 1470.2142857142858 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 1035.4 | 41 | 1936 | 19875.0 | 781 | 60352 |
| 4 | NLLSModel (Specialized) | 94.52314814814815 | 1 | 16 | 712.7857142857143 | 1 | 32 |
| 4 | Manifolds | 397.4423076923077 | 1 | 16 | 5177.0 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1659.6666666666667 | 61 | 2896 | 30000.0 | 1891 | 183152 |
| 5 | NLLSModel (Specialized) | 152.8796992481203 | 1 | 16 | 2875.0 | 1 | 32 |
| 5 | Manifolds | 651.03125 | 1 | 16 | 12500.0 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2557.25 | 85 | 4720 | 38041.0 | 3907 | 511760 |
| 6 | NLLSModel (Specialized) | 234.43373493975903 | 1 | 16 | 9209.0 | 1 | 32 |
| 6 | Manifolds | 1592.923076923077 | 1 | 16 | 24875.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 2273.222222222222 | 145 | 9232 | 124542.0 | 12313 | 2422688 |
| 8 | NLLSModel (Specialized) | 516.4473684210526 | 1 | 16 | 34250.0 | 1 | 32 |
| 8 | Manifolds | 2760.375 | 1 | 16 | 86416.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 2979.125 | 221 | 15856 | 542709.0 | 30086 | 9036752 |
| 10 | NLLSModel (Specialized) | 1106.5 | 1 | 16 | 135875.0 | 1 | 32 |
| 10 | Manifolds | 5927.25 | 1 | 16 | 292792.0 | 1 | 32 |
| 13 | NLLSModel (ManifoldVar) | 3077.4285714285716 | 365 | 29136 | 2.51075e6 | 85814 | 40757840 |
| 13 | NLLSModel (Specialized) | 3256.0 | 1 | 16 | 826333.0 | 1 | 32 |
| 13 | Manifolds | 10333.0 | 1 | 16 | 1.316e6 | 1 | 32 |
| 16 | NLLSModel (ManifoldVar) | 4666.8 | 545 | 52240 | 7.796625e6 | 245753 | 129717920 |
| 16 | NLLSModel (Specialized) | 6458.5 | 1 | 16 | 3.481958e6 | 1 | 32 |
| 16 | Manifolds | 19833.0 | 1 | 16 | 4.154834e6 | 1 | 32 |
| 20 | NLLSModel (ManifoldVar) | 9208.0 | 841 | 94096 | 6.8572542e7 | 599971 | 529841792 |
| 20 | NLLSModel (Specialized) | 14917.0 | 1 | 16 | 1.7353917e7 | 1 | 32 |
| 20 | Manifolds | 41709.0 | 1 | 16 | 1.9387292e7 | 1 | 32 |
| 26 | NLLSModel (ManifoldVar) | 17000.0 | 1405 | 190960 | 1.7084225e8 | 1827658 | 2578777376 |
| 26 | NLLSModel (Specialized) | 40333.0 | 1 | 16 | 8.6210416e7 | 1 | 32 |
| 26 | Manifolds | 92209.0 | 1 | 16 | 8.5497667e7 | 1 | 32 |
| 32 | NLLSModel (ManifoldVar) | 23041.0 | 2113 | 337936 | 5.49856042e8 | 4193905 | 7825661216 |
| 32 | NLLSModel (Specialized) | 89584.0 | 1 | 16 | 3.76799042e8 | 1 | 32 |
| 32 | Manifolds | 116375.0 | 1 | 16 | 2.62771417e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 3 | SecondOrderOptimization (LM) | 12271.0 | 33 | 2496 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 35333.0 | 101 | 11136 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (Dogleg) | 11708.0 | 35 | 2576 | 22 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | Manopt (LevenbergMarquardt) | 606291.0 | 8373 | 471888 | 26 | 3.7711e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 4 | SecondOrderOptimization (LM) | 13479.0 | 33 | 3840 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 43437.5 | 102 | 22480 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 13667.0 | 35 | 3984 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | Manopt (LevenbergMarquardt) | 665813.0 | 8523 | 625920 | 14 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 5 | SecondOrderOptimization (LM) | 39104.5 | 55 | 8112 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 106833.5 | 107 | 48192 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (Dogleg) | 38541.5 | 57 | 8320 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | Manopt (LevenbergMarquardt) | 752854.0 | 9120 | 769200 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 6 | SecondOrderOptimization (LM) | 93250.0 | 59 | 17136 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 258770.5 | 108 | 105440 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (Dogleg) | 71917.0 | 61 | 17408 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | Manopt (LevenbergMarquardt) | 1.013792e6 | 12089 | 1323648 | 12 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 8 | SecondOrderOptimization (LM) | 222250.0 | 90 | 67392 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 1.134021e6 | 113 | 392944 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (Dogleg) | 226333.0 | 94 | 67984 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | Manopt (LevenbergMarquardt) | 1.7712085e6 | 16892 | 2734368 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 10 | SecondOrderOptimization (LM) | 803812.5 | 90 | 144640 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 3.14748417e8 | 113 | 1169776 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (Dogleg) | 822312.5 | 94 | 145520 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | Manopt (LevenbergMarquardt) | 4.2245415e6 | 23996 | 5927312 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 13 | SecondOrderOptimization (LM) | 3.959562e6 | 91 | 413520 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (LM, tall) | 3.28028459e8 | 113 | 3980720 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (Dogleg) | 3.967875e6 | 95 | 414944 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | Manopt (LevenbergMarquardt) | 1.2380292e7 | 34301 | 13727200 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 16 | SecondOrderOptimization (LM) | 1.24227791e8 | 256 | 1176048 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (LM, tall) | 4.57750625e8 | 278 | 11018112 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 1.271893335e8 | 260 | 1178144 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | Manopt (LevenbergMarquardt) | 3.3487541e7 | 58319 | 29784544 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 20 | SecondOrderOptimization (LM) | 2.69503458e8 | 301 | 2625536 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (LM, tall) | 6.645580005e8 | 323 | 33143312 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (Dogleg) | 2.70795479e8 | 305 | 2628880 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | Manopt (LevenbergMarquardt) | 1.6911325e8 | 87993 | 76395488 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 26 | SecondOrderOptimization (LM) | 6.845821045e8 | 309 | 7265616 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 1.038946709e9 | 336 | 131260720 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (Dogleg) | 6.343710005e8 | 315 | 7271904 | 15 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | Manopt (LevenbergMarquardt) | 6.686576455e8 | 134599 | 213273840 | 9 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 32 | SecondOrderOptimization (LM) | 2.014117833e9 | 295 | 16430368 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 2.262316167e9 | 322 | 342073472 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 2.235992584e9 | 301 | 16438704 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | Manopt (LevenbergMarquardt) | 2.003134e9 | 242048 | 513715952 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
