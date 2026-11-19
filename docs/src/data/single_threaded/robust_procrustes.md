# Benchmark Results: Robust Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T02:39:08
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 2c10368
- **Dependency Commits**: OptimizationVariableInterface f130043, SecondOrderOptimization 377b96e, NLLSModel 78a4ef5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 3 | NLLSModel (ManifoldVar) | 660.9310344827586 | 25 | 976 | 7278.0 | 253 | 13952 |
| 3 | NLLSModel (Specialized) | 75.75974025974025 | 1 | 16 | 234.19540229885058 | 1 | 32 |
| 3 | Manifolds | 347.45762711864404 | 1 | 16 | 1221.375 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 1113.4444444444443 | 41 | 1936 | 22750.0 | 781 | 60352 |
| 4 | NLLSModel (Specialized) | 106.00518134715026 | 1 | 16 | 694.4444444444445 | 1 | 32 |
| 4 | Manifolds | 422.75 | 1 | 16 | 3951.5 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1704.8333333333333 | 61 | 2896 | 54292.0 | 1891 | 183152 |
| 5 | NLLSModel (Specialized) | 153.01680672268907 | 1 | 16 | 2729.25 | 1 | 32 |
| 5 | Manifolds | 669.551724137931 | 1 | 16 | 8180.333333333333 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2651.0 | 85 | 4720 | 124958.0 | 3907 | 511760 |
| 6 | NLLSModel (Specialized) | 237.8953488372093 | 1 | 16 | 9013.666666666666 | 1 | 32 |
| 6 | Manifolds | 1554.4615384615386 | 1 | 16 | 17792.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 4050.0 | 145 | 9232 | 418750.0 | 12313 | 2422688 |
| 8 | NLLSModel (Specialized) | 512.3783783783783 | 1 | 16 | 36625.0 | 1 | 32 |
| 8 | Manifolds | 2859.375 | 1 | 16 | 55250.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 9805.333333333334 | 221 | 15856 | 1.534583e6 | 30086 | 9036752 |
| 10 | NLLSModel (Specialized) | 1108.7777777777778 | 1 | 16 | 167542.0 | 1 | 32 |
| 10 | Manifolds | 5968.75 | 1 | 16 | 195000.0 | 1 | 32 |
| 13 | NLLSModel (ManifoldVar) | 15542.0 | 365 | 29136 | 8.252667e6 | 85814 | 40757840 |
| 13 | NLLSModel (Specialized) | 3250.0 | 1 | 16 | 860417.0 | 1 | 32 |
| 13 | Manifolds | 10667.0 | 1 | 16 | 815875.0 | 1 | 32 |
| 16 | NLLSModel (ManifoldVar) | 27000.0 | 545 | 52240 | 1.7369708e7 | 245753 | 129717920 |
| 16 | NLLSModel (Specialized) | 6819.666666666667 | 1 | 16 | 3.445833e6 | 1 | 32 |
| 16 | Manifolds | 20625.0 | 1 | 16 | 2.829667e6 | 1 | 32 |
| 20 | NLLSModel (ManifoldVar) | 61167.0 | 841 | 94096 | 1.25824583e8 | 599971 | 529841792 |
| 20 | NLLSModel (Specialized) | 15792.0 | 1 | 16 | 1.8121708e7 | 1 | 32 |
| 20 | Manifolds | 44083.0 | 1 | 16 | 1.0562333e7 | 1 | 32 |
| 26 | NLLSModel (ManifoldVar) | 113625.0 | 1405 | 190960 | 5.50982875e8 | 1827658 | 2578777376 |
| 26 | NLLSModel (Specialized) | 41000.0 | 1 | 16 | 8.8404583e7 | 1 | 32 |
| 26 | Manifolds | 93084.0 | 1 | 16 | 5.1956667e7 | 1 | 32 |
| 32 | NLLSModel (ManifoldVar) | 152042.0 | 2113 | 337936 | 1.360877125e9 | 4193905 | 7825661216 |
| 32 | NLLSModel (Specialized) | 91417.0 | 1 | 16 | 3.86760375e8 | 1 | 32 |
| 32 | Manifolds | 122292.0 | 1 | 16 | 1.94018666e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 3 | SecondOrderOptimization (LM) | 10791.0 | 33 | 2496 | 26 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 36687.0 | 101 | 11136 | 26 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (Dogleg) | 10104.5 | 35 | 2576 | 26 | 3.7711e-06 | true | ok | NaN | grad\_tol |
| 3 | Manopt (LevenbergMarquardt) | 547938.0 | 8316 | 463248 | 26 | 3.7711e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 4 | SecondOrderOptimization (LM) | 15167.0 | 33 | 3840 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 47021.0 | 102 | 22480 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 15083.0 | 35 | 3984 | 14 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 4 | Manopt (LevenbergMarquardt) | 640187.5 | 8466 | 617280 | 14 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 5 | SecondOrderOptimization (LM) | 38812.5 | 33 | 6192 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 87958.5 | 107 | 48160 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (Dogleg) | 38479.0 | 35 | 6400 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 5 | Manopt (LevenbergMarquardt) | 718187.5 | 9063 | 760560 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 6 | SecondOrderOptimization (LM) | 123624.5 | 33 | 10160 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 222708.0 | 108 | 105248 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (Dogleg) | 110583.5 | 35 | 10432 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 6 | Manopt (LevenbergMarquardt) | 1.0186255e6 | 12032 | 1315008 | 12 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 8 | SecondOrderOptimization (LM) | 518125.0 | 50 | 43440 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 1.0339375e6 | 113 | 392720 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (Dogleg) | 516958.5 | 54 | 44032 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 8 | Manopt (LevenbergMarquardt) | 1.7182085e6 | 16835 | 2725728 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 10 | SecondOrderOptimization (LM) | 1.935542e6 | 50 | 92656 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 4.005312e6 | 113 | 1169552 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (Dogleg) | 1.9264165e6 | 54 | 93536 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 10 | Manopt (LevenbergMarquardt) | 4.1853955e6 | 23939 | 5918672 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 13 | SecondOrderOptimization (LM) | 9.521792e6 | 50 | 262256 | 10 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (LM, tall) | 1.8879917e7 | 113 | 3980496 | 10 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | SecondOrderOptimization (Dogleg) | 9.591646e6 | 54 | 263680 | 10 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 13 | Manopt (LevenbergMarquardt) | 1.25088535e7 | 34244 | 13718560 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 16 | SecondOrderOptimization (LM) | 4.2728208e7 | 171 | 751856 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (LM, tall) | 8.5927521e7 | 234 | 11417568 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 4.2766208e7 | 175 | 753952 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 16 | Manopt (LevenbergMarquardt) | 3.3843813e7 | 58262 | 29775904 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 20 | SecondOrderOptimization (LM) | 2.563222705e8 | 218 | 1689616 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (LM, tall) | 2.98484854e8 | 281 | 33491664 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (Dogleg) | 2.38742792e8 | 222 | 1692960 | 12 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 20 | Manopt (LevenbergMarquardt) | 1.46751125e8 | 87936 | 76386848 | 10 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 26 | SecondOrderOptimization (LM) | 9.83698291e8 | 195 | 4572912 | 10 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 9.707820205e8 | 266 | 121320640 | 10 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (Dogleg) | 9.867418535e8 | 201 | 4579200 | 10 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 26 | Manopt (LevenbergMarquardt) | 5.6841475e8 | 134542 | 213265200 | 9 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
| 32 | SecondOrderOptimization (LM) | 4.702850167e9 | 209 | 10368720 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 3.978014667e9 | 280 | 450287648 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 4.65930625e9 | 215 | 10377056 | 11 | 3.9226e-06 | true | ok | NaN | grad\_tol |
| 32 | Manopt (LevenbergMarquardt) | 2.380217833e9 | 241991 | 513707312 | 11 | 3.9226e-06 | true | ok | NaN | StopWhenGradientNormLess |
