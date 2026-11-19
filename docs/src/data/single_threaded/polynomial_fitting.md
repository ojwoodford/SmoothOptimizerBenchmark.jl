# Benchmark Results: Ill-Conditioned Polynomial Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T02:15:59
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
| 60 | NLLSModel (Static) | 180.67256637168143 | 1 | 16 | 8042.0 | 1 | 32 |
| 60 | Standalone | 216.75531914893617 | 1 | 16 | 1806.8181818181818 | 1 | 32 |
| 100 | NLLSModel (Static) | 264.96153846153845 | 1 | 16 | 13417.0 | 1 | 32 |
| 100 | Standalone | 336.53846153846155 | 1 | 16 | 2760.5 | 1 | 32 |
| 160 | NLLSModel (Static) | 397.4423076923077 | 1 | 16 | 21500.0 | 1 | 32 |
| 160 | Standalone | 505.6818181818182 | 1 | 16 | 4541.8 | 1 | 32 |
| 250 | NLLSModel (Static) | 588.5625 | 1 | 16 | 33458.0 | 1 | 32 |
| 250 | Standalone | 705.448275862069 | 1 | 16 | 6656.25 | 1 | 32 |
| 400 | NLLSModel (Static) | 936.6086956521739 | 1 | 16 | 53458.0 | 1 | 32 |
| 400 | Standalone | 1138.157894736842 | 1 | 16 | 10583.0 | 1 | 32 |
| 640 | NLLSModel (Static) | 1431.5714285714287 | 1 | 16 | 85584.0 | 1 | 32 |
| 640 | Standalone | 1774.3333333333333 | 1 | 16 | 17250.0 | 1 | 32 |
| 1000 | NLLSModel (Static) | 2370.3333333333335 | 1 | 16 | 136625.0 | 1 | 32 |
| 1000 | Standalone | 2994.0 | 1 | 16 | 28375.0 | 1 | 32 |
| 1600 | NLLSModel (Static) | 3701.5 | 1 | 16 | 226166.0 | 1 | 32 |
| 1600 | Standalone | 4783.4 | 1 | 16 | 45667.0 | 1 | 32 |
| 2500 | NLLSModel (Static) | 5510.5 | 1 | 16 | 342250.0 | 1 | 32 |
| 2500 | Standalone | 7180.666666666667 | 1 | 16 | 67208.0 | 1 | 32 |
| 4000 | NLLSModel (Static) | 9041.666666666666 | 1 | 16 | 566750.0 | 1 | 32 |
| 4000 | Standalone | 11333.0 | 1 | 16 | 110208.0 | 1 | 32 |
| 6400 | NLLSModel (Static) | 14375.0 | 1 | 16 | 913167.0 | 1 | 32 |
| 6400 | Standalone | 18042.0 | 1 | 16 | 176167.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 60 | SecondOrderOptimization (LM) | 1.6930625e6 | 32 | 8128 | 190 | 1.0545e+00 | true | ok | 7.8424e-07 | step\_size |
| 60 | SecondOrderOptimization (LM, tall) | 221771.0 | 108 | 57216 | 19 | 1.0545e+00 | true | ok | 2.0898e-15 | step\_size |
| 60 | LeastSquaresOptim (LM) | 4.780708e6 | 7869 | 22420800 | 413 | 1.0545e+00 | true | ok | 1.0372e-06 | converged |
| 60 | LeastSquaresOptim (Dogleg) | 270167.0 | 639 | 1263808 | 67 | 1.0545e+00 | true | ok | 6.9433e-15 | converged |
| 100 | SecondOrderOptimization (LM) | 6.955916e6 | 32 | 8128 | 500 | 1.7527e+00 | false | not_converged | 1.7567e-04 | max\_iters |
| 100 | SecondOrderOptimization (LM, tall) | 280979.0 | 108 | 85312 | 18 | 1.7526e+00 | true | ok | 3.1815e-13 | step\_size |
| 100 | LeastSquaresOptim (LM) | 6.2839165e6 | 7641 | 21774912 | 401 | 1.7526e+00 | true | ok | 1.7761e-06 | converged |
| 100 | LeastSquaresOptim (Dogleg) | 369667.0 | 615 | 1269216 | 61 | 1.7526e+00 | true | ok | 3.1436e-15 | converged |
| 160 | SecondOrderOptimization (LM) | 1.11425e7 | 32 | 8128 | 500 | 2.7056e+00 | false | not_converged | 4.2311e-04 | max\_iters |
| 160 | SecondOrderOptimization (LM, tall) | 404333.5 | 108 | 130912 | 19 | 2.7052e+00 | true | ok | 7.1635e-15 | rel\_dcost |
| 160 | LeastSquaresOptim (LM) | 8.938646e6 | 7774 | 22162256 | 408 | 2.7052e+00 | true | ok | 2.7160e-06 | converged |
| 160 | LeastSquaresOptim (Dogleg) | 529479.0 | 616 | 1225184 | 65 | 2.7052e+00 | true | ok | 2.4158e-14 | converged |
| 250 | SecondOrderOptimization (LM) | 1.4059e7 | 32 | 8128 | 407 | 4.0894e+00 | true | ok | 2.4937e-06 | step\_size |
| 250 | SecondOrderOptimization (LM, tall) | 559687.5 | 108 | 182688 | 18 | 4.0894e+00 | true | ok | 1.5073e-12 | step\_size |
| 250 | LeastSquaresOptim (LM) | 1.38102705e7 | 8098 | 23099344 | 425 | 4.0894e+00 | true | ok | 3.1303e-06 | converged |
| 250 | LeastSquaresOptim (Dogleg) | 793812.5 | 639 | 1289776 | 67 | 4.0894e+00 | true | ok | 1.4013e-14 | converged |
| 400 | SecondOrderOptimization (LM) | 3.2167375e7 | 32 | 8128 | 500 | 6.8129e+00 | false | not_converged | 4.4280e-01 | max\_iters |
| 400 | SecondOrderOptimization (LM, tall) | 865499.5 | 118 | 296832 | 19 | 6.3701e+00 | true | ok | 5.4136e-15 | rel\_dcost |
| 400 | LeastSquaresOptim (LM) | 2.0483146e7 | 8005 | 22848640 | 420 | 6.3701e+00 | true | ok | 5.7844e-06 | converged |
| 400 | LeastSquaresOptim (Dogleg) | 1.155979e6 | 559 | 1258704 | 50 | 6.3701e+00 | true | ok | 8.4910e-14 | converged |
| 640 | SecondOrderOptimization (LM) | 4.3672667e7 | 32 | 8128 | 500 | 1.0004e+01 | false | not_converged | 7.1934e-05 | max\_iters; cost test passes |
| 640 | SecondOrderOptimization (LM, tall) | 1.2844785e6 | 118 | 478080 | 18 | 1.0004e+01 | true | ok | 4.9970e-12 | rel\_dcost |
| 640 | LeastSquaresOptim (LM) | 3.2413709e7 | 8005 | 22887040 | 420 | 1.0004e+01 | true | ok | 1.0628e-05 | converged |
| 640 | LeastSquaresOptim (Dogleg) | 1.7611665e6 | 466 | 1346752 | 23 | 1.0004e+01 | true | ok | 5.9718e-14 | converged |
| 1000 | SecondOrderOptimization (LM) | 6.7704e7 | 32 | 8128 | 500 | 1.7239e+01 | false | not_converged | 1.7931e+00 | max\_iters |
| 1000 | SecondOrderOptimization (LM, tall) | 1.9672295e6 | 118 | 686976 | 18 | 1.5446e+01 | true | ok | 8.1182e-12 | rel\_dcost, step\_size |
| 1000 | LeastSquaresOptim (LM) | 5.28088955e7 | 8423 | 24121632 | 442 | 1.5446e+01 | true | ok | 8.1352e-06 | converged |
| 1000 | LeastSquaresOptim (Dogleg) | 2.690375e6 | 466 | 1388736 | 23 | 1.5446e+01 | true | ok | 8.4957e-14 | converged |
| 1600 | SecondOrderOptimization (LM) | 6.0747708e7 | 32 | 8128 | 280 | 2.4510e+01 | true | ok | 1.1154e-05 | rel\_dcost |
| 1600 | SecondOrderOptimization (LM, tall) | 3.2582085e6 | 118 | 1076096 | 18 | 2.4510e+01 | true | ok | 1.4507e-11 | rel\_dcost, step\_size |
| 1600 | LeastSquaresOptim (LM) | 8.5660458e7 | 8499 | 24439008 | 446 | 2.4510e+01 | true | ok | 1.2274e-05 | converged |
| 1600 | LeastSquaresOptim (Dogleg) | 4.811312e6 | 578 | 1476288 | 51 | 2.4510e+01 | true | ok | 2.1651e-14 | converged |
| 2500 | SecondOrderOptimization (LM) | 1.6913375e8 | 32 | 8128 | 500 | 3.8105e+01 | false | not_converged | 2.0307e-04 | max\_iters; cost test passes |
| 2500 | SecondOrderOptimization (LM, tall) | 5.1348745e6 | 118 | 1710976 | 18 | 3.8104e+01 | true | ok | 2.2875e-13 | rel\_dcost |
| 2500 | LeastSquaresOptim (LM) | 1.41027958e8 | 8651 | 24989792 | 454 | 3.8104e+01 | true | ok | 1.5018e-05 | converged |
| 2500 | LeastSquaresOptim (Dogleg) | 7.264208e6 | 466 | 1605824 | 23 | 3.8104e+01 | true | ok | 1.1612e-13 | converged |
| 4000 | SecondOrderOptimization (LM) | 2.7453925e8 | 32 | 8128 | 500 | 1.8881e+02 | false | not_converged | 1.2805e+02 | max\_iters |
| 4000 | SecondOrderOptimization (LM, tall) | 8.2954995e6 | 118 | 2669440 | 18 | 6.0759e+01 | true | ok | 1.1009e-13 | rel\_dcost |
| 4000 | LeastSquaresOptim (LM) | 2.248970415e8 | 8461 | 24647936 | 444 | 6.0759e+01 | true | ok | 3.6448e-05 | converged |
| 4000 | LeastSquaresOptim (Dogleg) | 1.2497625e7 | 485 | 1860784 | 24 | 6.0759e+01 | true | ok | 4.2731e-13 | converged |
| 6400 | SecondOrderOptimization (LM) | 5.80335709e8 | 32 | 8128 | 500 | 1.2442e+02 | false | not_converged | 2.7412e+01 | max\_iters |
| 6400 | SecondOrderOptimization (LM, tall) | 1.3325208e7 | 118 | 4324224 | 18 | 9.7005e+01 | true | ok | 1.2476e-13 | rel\_dcost |
| 6400 | LeastSquaresOptim (LM) | 3.79094333e8 | 8803 | 25984992 | 462 | 9.7005e+01 | true | ok | 3.0364e-05 | converged |
| 6400 | LeastSquaresOptim (Dogleg) | 2.1480625e7 | 617 | 2225456 | 57 | 9.7005e+01 | true | ok | 5.7589e-13 | converged |
