# Benchmark Results: Ill-Conditioned Polynomial Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T02:48:42
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 60 | NLLSModel (Static) | 179.24528301886792 | 1 | 16 | 5906.25 | 1 | 32 |
| 60 | Standalone | 252.6 | 1 | 16 | 1419.642857142857 | 1 | 32 |
| 100 | NLLSModel (Static) | 262.05263157894734 | 1 | 16 | 9209.0 | 1 | 32 |
| 100 | Standalone | 371.9818181818182 | 1 | 16 | 2152.777777777778 | 1 | 32 |
| 160 | NLLSModel (Static) | 418.3137254901961 | 1 | 16 | 11500.0 | 1 | 32 |
| 160 | Standalone | 500.0 | 1 | 16 | 3534.6666666666665 | 1 | 32 |
| 250 | NLLSModel (Static) | 815.3409090909091 | 1 | 16 | 17500.0 | 1 | 32 |
| 250 | Standalone | 794.8846153846154 | 1 | 16 | 5500.0 | 1 | 32 |
| 400 | NLLSModel (Static) | 487.8048780487805 | 1 | 16 | 33500.0 | 1 | 32 |
| 400 | Standalone | 1262.235294117647 | 1 | 16 | 8388.666666666666 | 1 | 32 |
| 640 | NLLSModel (Static) | 997.6666666666666 | 1 | 16 | 43084.0 | 1 | 32 |
| 640 | Standalone | 1973.4545454545455 | 1 | 16 | 14584.0 | 1 | 32 |
| 1000 | NLLSModel (Static) | 1171.2222222222222 | 1 | 16 | 69042.0 | 1 | 32 |
| 1000 | Standalone | 3256.0 | 1 | 16 | 21625.0 | 1 | 32 |
| 1600 | NLLSModel (Static) | 1338.235294117647 | 1 | 16 | 131541.0 | 1 | 32 |
| 1600 | Standalone | 5104.25 | 1 | 16 | 35584.0 | 1 | 32 |
| 2500 | NLLSModel (Static) | 4672.642857142857 | 1 | 16 | 168708.0 | 1 | 32 |
| 2500 | Standalone | 7680.333333333333 | 1 | 16 | 53416.0 | 1 | 32 |
| 4000 | NLLSModel (Static) | 2125.0 | 1 | 16 | 268458.0 | 1 | 32 |
| 4000 | Standalone | 13000.0 | 1 | 16 | 90166.0 | 1 | 32 |
| 6400 | NLLSModel (Static) | 2708.375 | 1 | 16 | 426167.0 | 1 | 32 |
| 6400 | Standalone | 21250.0 | 1 | 16 | 143458.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 60 | SecondOrderOptimization (LM) | 4.452958e6 | 56 | 12720 | 500 | 1.0545e+00 | false | not_converged | 2.3745e-05 | max\_iters |
| 60 | SecondOrderOptimization (LM, tall) | 276354.0 | 114 | 57376 | 19 | 1.0545e+00 | true | ok | 8.8544e-15 | step\_size |
| 60 | LeastSquaresOptim (LM) | 5.3516245e6 | 7850 | 22366432 | 412 | 1.0545e+00 | true | ok | 1.0311e-06 | converged |
| 60 | LeastSquaresOptim (Dogleg) | 235771.0 | 444 | 1203808 | 22 | 1.0545e+00 | true | ok | 4.2511e-15 | converged |
| 100 | SecondOrderOptimization (LM) | 5.262542e6 | 58 | 14576 | 500 | 1.7527e+00 | false | not_converged | 1.5847e-04 | max\_iters |
| 100 | SecondOrderOptimization (LM, tall) | 343583.0 | 114 | 85536 | 19 | 1.7526e+00 | true | ok | 2.6918e-13 | step\_size |
| 100 | LeastSquaresOptim (LM) | 6.700458e6 | 7698 | 21937568 | 404 | 1.7526e+00 | true | ok | 1.5834e-06 | converged |
| 100 | LeastSquaresOptim (Dogleg) | 364479.0 | 583 | 1268080 | 53 | 1.7526e+00 | true | ok | 8.8155e-15 | converged |
| 160 | SecondOrderOptimization (LM) | 6.366583e6 | 58 | 14576 | 500 | 2.7150e+00 | false | not_converged | 9.8656e-03 | max\_iters |
| 160 | SecondOrderOptimization (LM, tall) | 415292.0 | 114 | 131232 | 18 | 2.7052e+00 | true | ok | 6.6297e-13 | step\_size |
| 160 | LeastSquaresOptim (LM) | 9.346333e6 | 7964 | 22704704 | 418 | 2.7052e+00 | true | ok | 1.8097e-06 | converged |
| 160 | LeastSquaresOptim (Dogleg) | 459354.5 | 444 | 1219568 | 22 | 2.7052e+00 | true | ok | 3.1598e-15 | converged |
| 250 | SecondOrderOptimization (LM) | 9.995375e6 | 58 | 14576 | 500 | 4.1001e+00 | false | not_converged | 1.0685e-02 | max\_iters |
| 250 | SecondOrderOptimization (LM, tall) | 550854.0 | 114 | 183008 | 18 | 4.0894e+00 | true | ok | 1.4291e-12 | step\_size |
| 250 | LeastSquaresOptim (LM) | 1.36913745e7 | 8003 | 22827952 | 420 | 4.0894e+00 | true | ok | 2.5900e-06 | converged |
| 250 | LeastSquaresOptim (Dogleg) | 761875.0 | 643 | 1289792 | 68 | 4.0894e+00 | true | ok | 6.0239e-14 | converged |
| 400 | SecondOrderOptimization (LM) | 1.832375e7 | 58 | 14576 | 500 | 7.6197e+00 | false | not_converged | 1.2496e+00 | max\_iters |
| 400 | SecondOrderOptimization (LM, tall) | 808208.5 | 124 | 297152 | 18 | 6.3701e+00 | true | ok | 2.6477e-12 | step\_size |
| 400 | LeastSquaresOptim (LM) | 2.0802125e7 | 8005 | 22848528 | 420 | 6.3701e+00 | true | ok | 5.4556e-06 | converged |
| 400 | LeastSquaresOptim (Dogleg) | 1.191292e6 | 642 | 1314896 | 67 | 6.3701e+00 | true | ok | 2.6130e-14 | converged |
| 640 | SecondOrderOptimization (LM) | 2.7709292e7 | 58 | 14576 | 500 | 1.0013e+01 | false | not_converged | 9.0369e-03 | max\_iters |
| 640 | SecondOrderOptimization (LM, tall) | 7.7405167e7 | 124 | 478400 | 18 | 1.0004e+01 | true | ok | 5.2190e-14 | rel\_dcost |
| 640 | LeastSquaresOptim (LM) | 3.6682625e7 | 8328 | 23809280 | 437 | 1.0004e+01 | true | ok | 5.5200e-06 | converged |
| 640 | LeastSquaresOptim (Dogleg) | 1.8312295e6 | 466 | 1346640 | 23 | 1.0004e+01 | true | ok | 4.3331e-14 | converged |
| 1000 | SecondOrderOptimization (LM) | 3.5692041e7 | 58 | 14576 | 500 | 1.5484e+01 | false | not_converged | 3.8205e-02 | max\_iters |
| 1000 | SecondOrderOptimization (LM, tall) | 8.3332666e7 | 124 | 687296 | 18 | 1.5446e+01 | true | ok | 8.2215e-12 | step\_size |
| 1000 | LeastSquaresOptim (LM) | 6.4688916e7 | 8537 | 24447056 | 448 | 1.5446e+01 | true | ok | 6.4693e-06 | converged |
| 1000 | LeastSquaresOptim (Dogleg) | 3.1138335e6 | 466 | 1388624 | 23 | 1.5446e+01 | true | ok | 7.5799e-14 | converged |
| 1600 | SecondOrderOptimization (LM) | 6.1613583e7 | 58 | 14576 | 500 | 2.4582e+01 | false | not_converged | 7.1883e-02 | max\_iters |
| 1600 | SecondOrderOptimization (LM, tall) | 8.300875e7 | 124 | 1076416 | 18 | 2.4510e+01 | true | ok | 2.1187e-13 | rel\_dcost |
| 1600 | LeastSquaresOptim (LM) | 9.84617295e7 | 8670 | 24927200 | 455 | 2.4510e+01 | true | ok | 8.7234e-06 | converged |
| 1600 | LeastSquaresOptim (Dogleg) | 5.0591665e6 | 466 | 1472592 | 23 | 2.4510e+01 | true | ok | 2.4976e-13 | converged |
| 2500 | SecondOrderOptimization (LM) | 3.28429834e8 | 58 | 14576 | 500 | 3.8107e+01 | false | not_converged | 2.5835e-03 | max\_iters |
| 2500 | SecondOrderOptimization (LM, tall) | 8.2332917e7 | 124 | 1711296 | 18 | 3.8104e+01 | true | ok | 3.3962e-13 | rel\_dcost |
| 2500 | LeastSquaresOptim (LM) | 1.45431875e8 | 8784 | 25369472 | 461 | 3.8104e+01 | true | ok | 1.1528e-05 | converged |
| 2500 | LeastSquaresOptim (Dogleg) | 7.791083e6 | 582 | 1609424 | 52 | 3.8104e+01 | true | ok | 7.0929e-13 | converged |
| 4000 | SecondOrderOptimization (LM) | 3.22770209e8 | 58 | 14576 | 500 | 1.9692e+02 | false | not_converged | 1.3616e+02 | max\_iters |
| 4000 | SecondOrderOptimization (LM, tall) | 1.377527295e8 | 124 | 2669760 | 18 | 6.0759e+01 | true | ok | 4.2541e-13 | rel\_dcost |
| 4000 | LeastSquaresOptim (LM) | 2.317016875e8 | 8708 | 25353152 | 457 | 6.0759e+01 | true | ok | 2.2332e-05 | converged |
| 4000 | LeastSquaresOptim (Dogleg) | 1.2633083e7 | 485 | 1860672 | 24 | 6.0759e+01 | true | ok | 3.6547e-13 | converged |
| 6400 | SecondOrderOptimization (LM) | 8.16630416e8 | 58 | 14576 | 500 | 1.1443e+02 | false | not_converged | 1.7421e+01 | max\_iters |
| 6400 | SecondOrderOptimization (LM, tall) | 1.38639854e8 | 124 | 4324544 | 18 | 9.7005e+01 | true | ok | 6.3387e-11 | rel\_dcost, step\_size |
| 6400 | LeastSquaresOptim (LM) | 3.83340208e8 | 8803 | 25984880 | 462 | 9.7005e+01 | true | ok | 3.0364e-05 | converged |
| 6400 | LeastSquaresOptim (Dogleg) | 1.9957667e7 | 485 | 2221120 | 24 | 9.7005e+01 | true | ok | 4.2739e-13 | converged |
