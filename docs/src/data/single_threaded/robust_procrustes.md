# Benchmark Results: Robust Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T04:38:06
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.2.0)
- **Julia Version**: 1.13.4
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 1dd4c9b
- **Dependency Commits**: BlockLinearSystems 78c771c, DampedLinearSolve e361765, NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 3 | Manifolds | 345.55172413793105 | 1 | 16 | 1250.0 | 1 | 32 |
| 3 | NLLSModel (ManifoldVar) | 698.2758620689655 | 25 | 976 | 7777.666666666667 | 253 | 13952 |
| 3 | NLLSModel (Specialized) | 71.35117056856187 | 1 | 16 | 231.58139534883722 | 1 | 32 |
| 4 | Manifolds | 393.4230769230769 | 1 | 16 | 3666.6666666666665 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 1257.3529411764705 | 41 | 1936 | 22000.0 | 781 | 60352 |
| 4 | NLLSModel (Specialized) | 96.67543859649123 | 1 | 16 | 549.1538461538462 | 1 | 32 |
| 5 | Manifolds | 731.1612903225806 | 1 | 16 | 8375.0 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1770.8333333333333 | 61 | 2896 | 54834.0 | 1891 | 183152 |
| 5 | NLLSModel (Specialized) | 153.19117647058823 | 1 | 16 | 1809.0 | 1 | 32 |
| 6 | Manifolds | 1592.923076923077 | 1 | 16 | 17209.0 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2593.75 | 85 | 4720 | 127792.0 | 3907 | 511760 |
| 6 | NLLSModel (Specialized) | 232.01136363636363 | 1 | 16 | 4858.2 | 1 | 32 |
| 8 | Manifolds | 2723.875 | 1 | 16 | 60417.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 4408.4 | 145 | 9232 | 463792.0 | 12313 | 2422688 |
| 8 | NLLSModel (Specialized) | 527.3947368421053 | 1 | 16 | 28584.0 | 1 | 32 |
| 10 | Manifolds | 6323.0 | 1 | 16 | 194000.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 8375.0 | 221 | 15856 | 1.495584e6 | 30086 | 9036752 |
| 10 | NLLSModel (Specialized) | 1105.2631578947369 | 1 | 16 | 114959.0 | 1 | 32 |
| 13 | Manifolds | 10334.0 | 1 | 16 | 847792.0 | 1 | 32 |
| 13 | NLLSModel (ManifoldVar) | 16333.0 | 365 | 29136 | 7.326125e6 | 85814 | 40757840 |
| 13 | NLLSModel (Specialized) | 3256.0 | 1 | 16 | 681958.0 | 1 | 32 |
| 16 | Manifolds | 19959.0 | 1 | 16 | 2.693917e6 | 1 | 32 |
| 16 | NLLSModel (ManifoldVar) | 27292.0 | 545 | 52240 | 1.489425e7 | 245753 | 129717920 |
| 16 | NLLSModel (Specialized) | 6416.5 | 1 | 16 | 3.052791e6 | 1 | 32 |
| 20 | Manifolds | 41792.0 | 1 | 16 | 1.054075e7 | 1 | 32 |
| 20 | NLLSModel (ManifoldVar) | 57958.0 | 841 | 94096 | 1.09648125e8 | 599971 | 529841792 |
| 20 | NLLSModel (Specialized) | 14833.0 | 1 | 16 | 1.6299583e7 | 1 | 32 |
| 26 | Manifolds | 92500.0 | 1 | 16 | 5.3907e7 | 1 | 32 |
| 26 | NLLSModel (ManifoldVar) | 114458.0 | 1405 | 190960 | 5.91796625e8 | 1827658 | 2578777376 |
| 26 | NLLSModel (Specialized) | 40750.0 | 1 | 16 | 8.0677e7 | 1 | 32 |
| 32 | Manifolds | 116209.0 | 1 | 16 | 2.00498083e8 | 1 | 32 |
| 32 | NLLSModel (ManifoldVar) | 157417.0 | 2113 | 337936 | 1.624160375e9 | 4193905 | 7825661216 |
| 32 | NLLSModel (Specialized) | 92250.0 | 1 | 16 | 3.45597416e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 3 | Manopt (LevenbergMarquardt) | 409166.5 | 4557 | 257792 | 9 | 9.9994e-07 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 3 | SecondOrderOptimization | 12291.0 | 108 | 9680 | 9 | 9.9994e-07 | true | ok | NaN | NaN | grad\_tol |
| 4 | Manopt (LevenbergMarquardt) | 454729.5 | 4709 | 323344 | 5 | 9.9995e-07 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 4 | SecondOrderOptimization | 15708.0 | 108 | 18112 | 5 | 9.9995e-07 | true | ok | NaN | NaN | grad\_tol |
| 5 | Manopt (LevenbergMarquardt) | 629646.0 | 7314 | 599696 | 8 | 1.9999e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 5 | SecondOrderOptimization | 42437.0 | 112 | 38160 | 8 | 1.9999e-06 | true | ok | NaN | NaN | grad\_tol |
| 6 | Manopt (LevenbergMarquardt) | 749103.5 | 8176 | 856832 | 7 | 1.9999e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 6 | SecondOrderOptimization | 86937.5 | 112 | 84928 | 7 | 1.9999e-06 | true | ok | NaN | NaN | grad\_tol |
| 8 | Manopt (LevenbergMarquardt) | 1.1031665e6 | 10563 | 1666288 | 6 | 3.9998e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 8 | SecondOrderOptimization | 276333.5 | 119 | 302896 | 6 | 3.9998e-06 | true | ok | NaN | NaN | grad\_tol |
| 10 | Manopt (LevenbergMarquardt) | 2.5173335e6 | 14625 | 3608080 | 6 | 5.9997e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 10 | SecondOrderOptimization | 843875.0 | 119 | 928176 | 6 | 5.9997e-06 | true | ok | NaN | NaN | grad\_tol |
| 13 | Manopt (LevenbergMarquardt) | 7.9380415e6 | 22183 | 9131488 | 6 | 8.9995e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 13 | SecondOrderOptimization | 3.228542e6 | 119 | 3190256 | 6 | 8.9995e-06 | true | ok | NaN | NaN | rel\_dcost |
| 16 | Manopt (LevenbergMarquardt) | 1.8260167e7 | 31792 | 17833120 | 5 | 1.3999e-05 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 16 | SecondOrderOptimization | 8.544292e6 | 174 | 8822496 | 5 | 1.3999e-05 | true | ok | NaN | NaN | grad\_tol |
| 20 | Manopt (LevenbergMarquardt) | 6.68311045e7 | 47409 | 46777920 | 5 | 2.0999e-05 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 20 | SecondOrderOptimization | 3.4337416e7 | 189 | 26522896 | 5 | 2.0999e-05 | true | ok | NaN | NaN | grad\_tol |
| 26 | Manopt (LevenbergMarquardt) | 3.48182334e8 | 79276 | 148127904 | 5 | 3.4998e-05 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 26 | SecondOrderOptimization | 1.75833541e8 | 202 | 97290832 | 5 | 3.4998e-05 | true | ok | NaN | NaN | grad\_tol |
| 32 | Manopt (LevenbergMarquardt) | 1.138399625e9 | 117685 | 319028064 | 5 | 5.2997e-05 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 32 | SecondOrderOptimization | 6.664684375e8 | 202 | 273173056 | 5 | 5.2997e-05 | true | ok | NaN | NaN | grad\_tol |
