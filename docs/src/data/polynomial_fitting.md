# Benchmark Results: Ill-Conditioned Polynomial Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T01:22:34
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
| 60 | NLLSModel (Static) | 191.19626168224298 | 1 | 16 | 3430.5 | 1 | 32 |
| 60 | Standalone | 230.29032258064515 | 1 | 16 | 1810.5454545454545 | 1 | 32 |
| 100 | NLLSModel (Static) | 282.0 | 1 | 16 | 4500.0 | 1 | 32 |
| 100 | Standalone | 321.0327868852459 | 1 | 16 | 2755.125 | 1 | 32 |
| 160 | NLLSModel (Static) | 408.34 | 1 | 16 | 8302.25 | 1 | 32 |
| 160 | Standalone | 504.75 | 1 | 16 | 4291.6 | 1 | 32 |
| 250 | NLLSModel (Static) | 443.32 | 1 | 16 | 9708.333333333334 | 1 | 32 |
| 250 | Standalone | 756.1851851851852 | 1 | 16 | 6791.666666666667 | 1 | 32 |
| 400 | NLLSModel (Static) | 485.6875 | 1 | 16 | 14958.0 | 1 | 32 |
| 400 | Standalone | 1144.6470588235295 | 1 | 16 | 10584.0 | 1 | 32 |
| 640 | NLLSModel (Static) | 775.3478260869565 | 1 | 16 | 32250.0 | 1 | 32 |
| 640 | Standalone | 1780.2727272727273 | 1 | 16 | 18333.0 | 1 | 32 |
| 1000 | NLLSModel (Static) | 1046.3333333333333 | 1 | 16 | 36667.0 | 1 | 32 |
| 1000 | Standalone | 3194.5 | 1 | 16 | 26541.0 | 1 | 32 |
| 1600 | NLLSModel (Static) | 1218.75 | 1 | 16 | 59292.0 | 1 | 32 |
| 1600 | Standalone | 4552.0 | 1 | 16 | 44125.0 | 1 | 32 |
| 2500 | NLLSModel (Static) | 1407.7142857142858 | 1 | 16 | 111416.0 | 1 | 32 |
| 2500 | Standalone | 7402.666666666667 | 1 | 16 | 66917.0 | 1 | 32 |
| 4000 | NLLSModel (Static) | 1977.2727272727273 | 1 | 16 | 151292.0 | 1 | 32 |
| 4000 | Standalone | 11708.0 | 1 | 16 | 106958.0 | 1 | 32 |
| 6400 | NLLSModel (Static) | 2682.25 | 1 | 16 | 279625.0 | 1 | 32 |
| 6400 | Standalone | 18042.0 | 1 | 16 | 170916.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 60 | SecondOrderOptimization (LM) | 2.29275e6 | 56 | 12720 | 500 | 1.0545e+00 | false | not_converged | 2.6449e-05 | max\_iters; cost test passes |
| 60 | SecondOrderOptimization (LM, tall) | 214167.0 | 108 | 57280 | 19 | 1.0545e+00 | true | ok | 2.0843e-15 | step\_size |
| 60 | LeastSquaresOptim (LM) | 4.8539375e6 | 7869 | 22420800 | 413 | 1.0545e+00 | true | ok | 1.0372e-06 | converged |
| 60 | LeastSquaresOptim (Dogleg) | 272645.5 | 639 | 1263808 | 67 | 1.0545e+00 | true | ok | 6.9433e-15 | converged |
| 100 | SecondOrderOptimization (LM) | 2.669209e6 | 58 | 14576 | 500 | 1.7528e+00 | false | not_converged | 2.1192e-04 | max\_iters |
| 100 | SecondOrderOptimization (LM, tall) | 286271.0 | 108 | 85440 | 18 | 1.7526e+00 | true | ok | 3.1815e-13 | step\_size |
| 100 | LeastSquaresOptim (LM) | 6.404583e6 | 7641 | 21774912 | 401 | 1.7526e+00 | true | ok | 1.7761e-06 | converged |
| 100 | LeastSquaresOptim (Dogleg) | 362625.0 | 615 | 1269216 | 61 | 1.7526e+00 | true | ok | 3.1436e-15 | converged |
| 160 | SecondOrderOptimization (LM) | 3.764708e6 | 58 | 14576 | 500 | 2.7185e+00 | false | not_converged | 1.3329e-02 | max\_iters |
| 160 | SecondOrderOptimization (LM, tall) | 384375.0 | 108 | 131136 | 19 | 2.7052e+00 | true | ok | 7.1635e-15 | rel\_dcost |
| 160 | LeastSquaresOptim (LM) | 1.01316875e7 | 7774 | 22162256 | 408 | 2.7052e+00 | true | ok | 2.7160e-06 | converged |
| 160 | LeastSquaresOptim (Dogleg) | 508083.5 | 616 | 1225184 | 65 | 2.7052e+00 | true | ok | 2.4158e-14 | converged |
| 250 | SecondOrderOptimization (LM) | 6.459417e6 | 58 | 14576 | 500 | 4.0997e+00 | false | not_converged | 1.0365e-02 | max\_iters |
| 250 | SecondOrderOptimization (LM, tall) | 511771.0 | 108 | 182912 | 18 | 4.0894e+00 | true | ok | 1.5073e-12 | step\_size |
| 250 | LeastSquaresOptim (LM) | 1.4679646e7 | 8098 | 23099344 | 425 | 4.0894e+00 | true | ok | 3.1303e-06 | converged |
| 250 | LeastSquaresOptim (Dogleg) | 786333.5 | 639 | 1289776 | 67 | 4.0894e+00 | true | ok | 1.4013e-14 | converged |
| 400 | SecondOrderOptimization (LM) | 8.041e6 | 58 | 14576 | 500 | 7.6692e+00 | false | not_converged | 1.2991e+00 | max\_iters |
| 400 | SecondOrderOptimization (LM, tall) | 830375.0 | 118 | 297056 | 19 | 6.3701e+00 | true | ok | 5.4136e-15 | rel\_dcost |
| 400 | LeastSquaresOptim (LM) | 2.21951665e7 | 8005 | 22848640 | 420 | 6.3701e+00 | true | ok | 5.7844e-06 | converged |
| 400 | LeastSquaresOptim (Dogleg) | 1.1508955e6 | 559 | 1258704 | 50 | 6.3701e+00 | true | ok | 8.4910e-14 | converged |
| 640 | SecondOrderOptimization (LM) | 1.2075834e7 | 58 | 14576 | 500 | 1.0014e+01 | false | not_converged | 9.9356e-03 | max\_iters |
| 640 | SecondOrderOptimization (LM, tall) | 1.242167e6 | 118 | 478304 | 18 | 1.0004e+01 | true | ok | 4.9970e-12 | rel\_dcost |
| 640 | LeastSquaresOptim (LM) | 3.81175e7 | 8005 | 22887040 | 420 | 1.0004e+01 | true | ok | 1.0628e-05 | converged |
| 640 | LeastSquaresOptim (Dogleg) | 1.7570625e6 | 466 | 1346752 | 23 | 1.0004e+01 | true | ok | 5.9718e-14 | converged |
| 1000 | SecondOrderOptimization (LM) | 2.0459125e7 | 58 | 14576 | 500 | 1.5484e+01 | false | not_converged | 3.8205e-02 | max\_iters |
| 1000 | SecondOrderOptimization (LM, tall) | 1.693e6 | 118 | 687200 | 18 | 1.5446e+01 | true | ok | 8.1182e-12 | rel\_dcost, step\_size |
| 1000 | LeastSquaresOptim (LM) | 6.1882417e7 | 8423 | 24121632 | 442 | 1.5446e+01 | true | ok | 8.1352e-06 | converged |
| 1000 | LeastSquaresOptim (Dogleg) | 2.759604e6 | 466 | 1388736 | 23 | 1.5446e+01 | true | ok | 8.4957e-14 | converged |
| 1600 | SecondOrderOptimization (LM) | 3.087375e7 | 58 | 14576 | 500 | 2.4577e+01 | false | not_converged | 6.7018e-02 | max\_iters |
| 1600 | SecondOrderOptimization (LM, tall) | 2.7971045e6 | 118 | 1076320 | 18 | 2.4510e+01 | true | ok | 1.4507e-11 | rel\_dcost, step\_size |
| 1600 | LeastSquaresOptim (LM) | 9.7117771e7 | 8499 | 24439008 | 446 | 2.4510e+01 | true | ok | 1.2274e-05 | converged |
| 1600 | LeastSquaresOptim (Dogleg) | 4.826625e6 | 578 | 1476288 | 51 | 2.4510e+01 | true | ok | 2.1651e-14 | converged |
| 2500 | SecondOrderOptimization (LM) | 7.4628625e7 | 58 | 14576 | 500 | 3.8107e+01 | false | not_converged | 2.4268e-03 | max\_iters; cost test passes |
| 2500 | SecondOrderOptimization (LM, tall) | 4.7017085e6 | 118 | 1711200 | 18 | 3.8104e+01 | true | ok | 2.2875e-13 | rel\_dcost |
| 2500 | LeastSquaresOptim (LM) | 1.51437917e8 | 8651 | 24989792 | 454 | 3.8104e+01 | true | ok | 1.5018e-05 | converged |
| 2500 | LeastSquaresOptim (Dogleg) | 7.2773125e6 | 466 | 1605824 | 23 | 3.8104e+01 | true | ok | 1.1612e-13 | converged |
| 4000 | SecondOrderOptimization (LM) | 7.7683667e7 | 58 | 14576 | 500 | 1.9763e+02 | false | not_converged | 1.3687e+02 | max\_iters |
| 4000 | SecondOrderOptimization (LM, tall) | 7.074042e6 | 118 | 2669664 | 18 | 6.0759e+01 | true | ok | 1.1009e-13 | rel\_dcost |
| 4000 | LeastSquaresOptim (LM) | 2.32938896e8 | 8461 | 24647936 | 444 | 6.0759e+01 | true | ok | 3.6448e-05 | converged |
| 4000 | LeastSquaresOptim (Dogleg) | 1.2734791e7 | 485 | 1860784 | 24 | 6.0759e+01 | true | ok | 4.2731e-13 | converged |
| 6400 | SecondOrderOptimization (LM) | 2.39243042e8 | 58 | 14576 | 500 | 1.1217e+02 | false | not_converged | 1.5167e+01 | max\_iters |
| 6400 | SecondOrderOptimization (LM, tall) | 1.14666665e7 | 118 | 4324448 | 18 | 9.7005e+01 | true | ok | 1.2476e-13 | rel\_dcost |
| 6400 | LeastSquaresOptim (LM) | 4.01677791e8 | 8803 | 25984992 | 462 | 9.7005e+01 | true | ok | 3.0364e-05 | converged |
| 6400 | LeastSquaresOptim (Dogleg) | 2.1574271e7 | 617 | 2225456 | 57 | 9.7005e+01 | true | ok | 5.7589e-13 | converged |
