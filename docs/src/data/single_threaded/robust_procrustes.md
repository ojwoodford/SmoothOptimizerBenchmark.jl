# Benchmark Results: Robust Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T18:07:46
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: fbb6630
- **Dependency Commits**: NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 3 | Manifolds | 337.5762711864407 | 1 | 16 | 1240.235294117647 | 1 | 32 |
| 3 | NLLSModel (ManifoldVar) | 673.3870967741935 | 25 | 976 | 7569.333333333333 | 253 | 13952 |
| 3 | NLLSModel (Specialized) | 72.50974025974025 | 1 | 16 | 228.7 | 1 | 32 |
| 4 | Manifolds | 397.4423076923077 | 1 | 16 | 3736.1666666666665 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 1205.6 | 41 | 1936 | 19833.0 | 781 | 60352 |
| 4 | NLLSModel (Specialized) | 95.83181818181818 | 1 | 16 | 558.3142857142857 | 1 | 32 |
| 5 | Manifolds | 653.2258064516129 | 1 | 16 | 8277.666666666666 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1725.6666666666667 | 61 | 2896 | 50042.0 | 1891 | 183152 |
| 5 | NLLSModel (Specialized) | 150.66666666666666 | 1 | 16 | 1833.2727272727273 | 1 | 32 |
| 6 | Manifolds | 1608.923076923077 | 1 | 16 | 17833.0 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2486.1111111111113 | 85 | 4720 | 123792.0 | 3907 | 511760 |
| 6 | NLLSModel (Specialized) | 236.73863636363637 | 1 | 16 | 4800.0 | 1 | 32 |
| 8 | Manifolds | 2708.375 | 1 | 16 | 55709.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 4050.0 | 145 | 9232 | 397917.0 | 12313 | 2422688 |
| 8 | NLLSModel (Specialized) | 524.5897435897435 | 1 | 16 | 27542.0 | 1 | 32 |
| 10 | Manifolds | 6093.75 | 1 | 16 | 192500.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 8167.0 | 221 | 15856 | 1.352209e6 | 30086 | 9036752 |
| 10 | NLLSModel (Specialized) | 1116.2105263157894 | 1 | 16 | 110833.0 | 1 | 32 |
| 13 | Manifolds | 10292.0 | 1 | 16 | 824584.0 | 1 | 32 |
| 13 | NLLSModel (ManifoldVar) | 15875.0 | 365 | 29136 | 7.172083e6 | 85814 | 40757840 |
| 13 | NLLSModel (Specialized) | 3256.0 | 1 | 16 | 664958.0 | 1 | 32 |
| 16 | Manifolds | 19916.0 | 1 | 16 | 2.641042e6 | 1 | 32 |
| 16 | NLLSModel (ManifoldVar) | 26875.0 | 545 | 52240 | 1.749225e7 | 245753 | 129717920 |
| 16 | NLLSModel (Specialized) | 6510.5 | 1 | 16 | 3.112458e6 | 1 | 32 |
| 20 | Manifolds | 41625.0 | 1 | 16 | 1.0163917e7 | 1 | 32 |
| 20 | NLLSModel (ManifoldVar) | 58334.0 | 841 | 94096 | 1.09523875e8 | 599971 | 529841792 |
| 20 | NLLSModel (Specialized) | 14958.0 | 1 | 16 | 1.6304042e7 | 1 | 32 |
| 26 | Manifolds | 92708.0 | 1 | 16 | 5.1884875e7 | 1 | 32 |
| 26 | NLLSModel (ManifoldVar) | 116500.0 | 1405 | 190960 | 5.89506917e8 | 1827658 | 2578777376 |
| 26 | NLLSModel (Specialized) | 40750.0 | 1 | 16 | 8.0545333e7 | 1 | 32 |
| 32 | Manifolds | 113208.0 | 1 | 16 | 1.90875167e8 | 1 | 32 |
| 32 | NLLSModel (ManifoldVar) | 154875.0 | 2113 | 337936 | 1.77622525e9 | 4193905 | 7825661216 |
| 32 | NLLSModel (Specialized) | 92292.0 | 1 | 16 | 3.49187333e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 3 | Manopt (LevenbergMarquardt) | 550375.0 | 8314 | 463152 | 26 | 3.7711e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 3 | SecondOrderOptimization | 28645.5 | 108 | 9680 | 26 | 3.7711e-06 | true | ok | NaN | NaN | grad\_tol |
| 4 | Manopt (LevenbergMarquardt) | 643666.5 | 8464 | 617184 | 14 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 4 | SecondOrderOptimization | 31666.5 | 108 | 18112 | 14 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 5 | Manopt (LevenbergMarquardt) | 729688.0 | 9061 | 760464 | 11 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 5 | SecondOrderOptimization | 53333.0 | 112 | 38160 | 11 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 6 | Manopt (LevenbergMarquardt) | 1.0304165e6 | 12030 | 1314912 | 12 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 6 | SecondOrderOptimization | 136958.0 | 112 | 84928 | 12 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 8 | Manopt (LevenbergMarquardt) | 1.7903755e6 | 16833 | 2725632 | 11 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 8 | SecondOrderOptimization | 536750.0 | 119 | 302896 | 12 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 10 | Manopt (LevenbergMarquardt) | 4.2050205e6 | 23937 | 5918576 | 11 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 10 | SecondOrderOptimization | 1.638459e6 | 119 | 928176 | 12 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 13 | Manopt (LevenbergMarquardt) | 1.25523125e7 | 34242 | 13718464 | 10 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 13 | SecondOrderOptimization | 5.530646e6 | 119 | 3190256 | 10 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 16 | Manopt (LevenbergMarquardt) | 3.3860688e7 | 58260 | 29775808 | 10 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 16 | SecondOrderOptimization | 1.8491292e7 | 240 | 8861952 | 11 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 20 | Manopt (LevenbergMarquardt) | 1.549785205e8 | 87934 | 76386752 | 10 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 20 | SecondOrderOptimization | 7.88731245e7 | 287 | 26627056 | 12 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 26 | Manopt (LevenbergMarquardt) | 5.377060205e8 | 134540 | 213265104 | 9 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 26 | SecondOrderOptimization | 3.43098875e8 | 272 | 97416672 | 10 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
| 32 | Manopt (LevenbergMarquardt) | 2.47908225e9 | 241989 | 513707216 | 11 | 3.9226e-06 | true | ok | NaN | NaN | StopWhenGradientNormLess |
| 32 | SecondOrderOptimization | 1.37352725e9 | 286 | 273373504 | 11 | 3.9226e-06 | true | ok | NaN | NaN | grad\_tol |
