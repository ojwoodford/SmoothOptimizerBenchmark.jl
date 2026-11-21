# Benchmark Results: Robust Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:44:10
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.2.0)
- **Julia Version**: 1.13.4
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 1dd4c9b
- **Dependency Commits**: BlockLinearSystems 78c771c, DampedLinearSolve e361765, NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 3 | Manifolds | 354.87931034482756 | 1 | 16 | 1283.875 | 1 | 32 |
| 3 | NLLSModel (ManifoldVar) | 741.3793103448276 | 25 | 976 | 8334.0 | 253 | 13952 |
| 3 | NLLSModel (Specialized) | 74.70414201183432 | 1 | 16 | 245.3125 | 1 | 32 |
| 4 | Manifolds | 400.3333333333333 | 1 | 16 | 3694.5 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 1250.0 | 41 | 1936 | 21708.0 | 781 | 60352 |
| 4 | NLLSModel (Specialized) | 95.87037037037037 | 1 | 16 | 539.5384615384615 | 1 | 32 |
| 5 | Manifolds | 677.7666666666667 | 1 | 16 | 8333.0 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1795.0833333333333 | 61 | 2896 | 30959.0 | 1891 | 183152 |
| 5 | NLLSModel (Specialized) | 154.89312977099237 | 1 | 16 | 1840.909090909091 | 1 | 32 |
| 6 | Manifolds | 1593.0 | 1 | 16 | 17542.0 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2614.625 | 85 | 4720 | 39334.0 | 3907 | 511760 |
| 6 | NLLSModel (Specialized) | 237.25882352941176 | 1 | 16 | 4950.0 | 1 | 32 |
| 8 | Manifolds | 2776.0 | 1 | 16 | 60792.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 2421.3333333333335 | 145 | 9232 | 119542.0 | 12313 | 2422688 |
| 8 | NLLSModel (Specialized) | 523.6486486486486 | 1 | 16 | 28125.0 | 1 | 32 |
| 10 | Manifolds | 6062.5 | 1 | 16 | 199584.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 3062.5 | 221 | 15856 | 423875.0 | 30086 | 9036752 |
| 10 | NLLSModel (Specialized) | 1129.611111111111 | 1 | 16 | 117292.0 | 1 | 32 |
| 13 | Manifolds | 10500.0 | 1 | 16 | 869625.0 | 1 | 32 |
| 13 | NLLSModel (ManifoldVar) | 3131.8333333333335 | 365 | 29136 | 2.568875e6 | 85814 | 40757840 |
| 13 | NLLSModel (Specialized) | 3321.4285714285716 | 1 | 16 | 690292.0 | 1 | 32 |
| 16 | Manifolds | 20333.0 | 1 | 16 | 2.817166e6 | 1 | 32 |
| 16 | NLLSModel (ManifoldVar) | 4833.2 | 545 | 52240 | 1.5879792e7 | 245753 | 129717920 |
| 16 | NLLSModel (Specialized) | 7042.0 | 1 | 16 | 3.16775e6 | 1 | 32 |
| 20 | Manifolds | 44542.0 | 1 | 16 | 1.26545e7 | 1 | 32 |
| 20 | NLLSModel (ManifoldVar) | 9875.0 | 841 | 94096 | 8.4151875e7 | 599971 | 529841792 |
| 20 | NLLSModel (Specialized) | 15375.0 | 1 | 16 | 1.6321792e7 | 1 | 32 |
| 26 | Manifolds | 94291.0 | 1 | 16 | 5.1557291e7 | 1 | 32 |
| 26 | NLLSModel (ManifoldVar) | 18042.0 | 1405 | 190960 | 1.95809625e8 | 1827658 | 2578777376 |
| 26 | NLLSModel (Specialized) | 41084.0 | 1 | 16 | 8.0909417e7 | 1 | 32 |
| 32 | Manifolds | 117542.0 | 1 | 16 | 2.025135e8 | 1 | 32 |
| 32 | NLLSModel (ManifoldVar) | 25166.0 | 2113 | 337936 | 6.13569541e8 | 4193905 | 7825661216 |
| 32 | NLLSModel (Specialized) | 109208.0 | 1 | 16 | 3.58635958e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 3 | Manopt (LevenbergMarquardt) | 423542.0 | 4557 | 257792 | 9 | 9.9994e-07 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 3 | SecondOrderOptimization | 12687.5 | 108 | 9680 | 9 | 9.9994e-07 | true | ok | NaN | NaN | grad\_tol |
| 4 | Manopt (LevenbergMarquardt) | 453541.5 | 4709 | 323344 | 5 | 9.9995e-07 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 4 | SecondOrderOptimization | 15250.0 | 108 | 18112 | 5 | 9.9995e-07 | true | ok | NaN | NaN | grad\_tol |
| 5 | Manopt (LevenbergMarquardt) | 625542.0 | 7314 | 599696 | 8 | 1.9999e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 5 | SecondOrderOptimization | 37562.5 | 112 | 38192 | 8 | 1.9999e-06 | true | ok | NaN | NaN | grad\_tol |
| 6 | Manopt (LevenbergMarquardt) | 741333.0 | 8176 | 856832 | 7 | 1.9999e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 6 | SecondOrderOptimization | 80125.0 | 112 | 85120 | 7 | 1.9999e-06 | true | ok | NaN | NaN | grad\_tol |
| 8 | Manopt (LevenbergMarquardt) | 1.1535415e6 | 10563 | 1666288 | 6 | 3.9998e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 8 | SecondOrderOptimization | 198041.5 | 119 | 303120 | 6 | 3.9998e-06 | true | ok | NaN | NaN | grad\_tol |
| 10 | Manopt (LevenbergMarquardt) | 2.43575e6 | 14625 | 3608080 | 6 | 5.9997e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 10 | SecondOrderOptimization | 654479.0 | 119 | 928400 | 6 | 5.9997e-06 | true | ok | NaN | NaN | grad\_tol |
| 13 | Manopt (LevenbergMarquardt) | 8.0826665e6 | 22183 | 9131488 | 6 | 8.9995e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 13 | SecondOrderOptimization | 2.688875e6 | 119 | 3190480 | 6 | 8.9995e-06 | true | ok | NaN | NaN | rel\_dcost |
| 16 | Manopt (LevenbergMarquardt) | 1.82319165e7 | 31792 | 17833120 | 5 | 1.3999e-05 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 16 | SecondOrderOptimization | 1.08173875e8 | 174 | 8822720 | 5 | 1.3999e-05 | true | ok | NaN | NaN | grad\_tol |
| 20 | Manopt (LevenbergMarquardt) | 7.4035833e7 | 47409 | 46777920 | 5 | 2.0999e-05 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 20 | SecondOrderOptimization | 1.33358792e8 | 189 | 36812272 | 5 | 2.0999e-05 | true | ok | NaN | NaN | grad\_tol |
| 26 | Manopt (LevenbergMarquardt) | 3.4397875e8 | 79276 | 148127904 | 5 | 3.4998e-05 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 26 | SecondOrderOptimization | 2.0615025e8 | 202 | 97291056 | 5 | 3.4998e-05 | true | ok | NaN | NaN | grad\_tol |
| 32 | Manopt (LevenbergMarquardt) | 8.96525813e8 | 117685 | 319028064 | 5 | 5.2997e-05 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 32 | SecondOrderOptimization | 3.75208291e8 | 202 | 273173280 | 5 | 5.2997e-05 | true | ok | NaN | NaN | grad\_tol |
