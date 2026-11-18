# Benchmark Results: Ill-Conditioned Polynomial Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T01:35:59
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
| 60 | NLLSModel (Static) | 183.33333333333334 | 1 | 16 | 5959.0 | 1 | 32 |
| 60 | Standalone | 251.64473684210526 | 1 | 16 | 1419.642857142857 | 1 | 32 |
| 100 | NLLSModel (Static) | 287.3376623376623 | 1 | 16 | 7541.0 | 1 | 32 |
| 100 | Standalone | 375.75 | 1 | 16 | 2150.0 | 1 | 32 |
| 160 | NLLSModel (Static) | 393.4230769230769 | 1 | 16 | 13500.0 | 1 | 32 |
| 160 | Standalone | 543.8205128205128 | 1 | 16 | 3437.5 | 1 | 32 |
| 250 | NLLSModel (Static) | 758.3333333333334 | 1 | 16 | 17541.0 | 1 | 32 |
| 250 | Standalone | 746.8076923076923 | 1 | 16 | 5302.0 | 1 | 32 |
| 400 | NLLSModel (Static) | 485.425 | 1 | 16 | 27250.0 | 1 | 32 |
| 400 | Standalone | 1181.3529411764705 | 1 | 16 | 8861.333333333334 | 1 | 32 |
| 640 | NLLSModel (Static) | 954.5454545454545 | 1 | 16 | 51750.0 | 1 | 32 |
| 640 | Standalone | 1791.7272727272727 | 1 | 16 | 13667.0 | 1 | 32 |
| 1000 | NLLSModel (Static) | 1144.7368421052631 | 1 | 16 | 67875.0 | 1 | 32 |
| 1000 | Standalone | 3125.0 | 1 | 16 | 21542.0 | 1 | 32 |
| 1600 | NLLSModel (Static) | 1234.375 | 1 | 16 | 127208.0 | 1 | 32 |
| 1600 | Standalone | 5135.5 | 1 | 16 | 34458.0 | 1 | 32 |
| 2500 | NLLSModel (Static) | 1560.923076923077 | 1 | 16 | 201125.0 | 1 | 32 |
| 2500 | Standalone | 7625.0 | 1 | 16 | 54625.0 | 1 | 32 |
| 4000 | NLLSModel (Static) | 1897.7272727272727 | 1 | 16 | 279792.0 | 1 | 32 |
| 4000 | Standalone | 12834.0 | 1 | 16 | 91333.0 | 1 | 32 |
| 6400 | NLLSModel (Static) | 2573.0 | 1 | 16 | 447250.0 | 1 | 32 |
| 6400 | Standalone | 20458.0 | 1 | 16 | 144417.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 60 | SecondOrderOptimization (LM) | 4.734959e6 | 56 | 12720 | 500 | 1.0545e+00 | false | not_converged | 2.3745e-05 | max\_iters |
| 60 | SecondOrderOptimization (LM, tall) | 252521.0 | 108 | 57280 | 19 | 1.0545e+00 | true | ok | 8.8544e-15 | step\_size |
| 60 | LeastSquaresOptim (LM) | 4.9270625e6 | 7850 | 22366432 | 412 | 1.0545e+00 | true | ok | 1.0311e-06 | converged |
| 60 | LeastSquaresOptim (Dogleg) | 211792.0 | 444 | 1203808 | 22 | 1.0545e+00 | true | ok | 4.2511e-15 | converged |
| 100 | SecondOrderOptimization (LM) | 4.331459e6 | 58 | 14576 | 500 | 1.7527e+00 | false | not_converged | 1.5847e-04 | max\_iters |
| 100 | SecondOrderOptimization (LM, tall) | 352083.0 | 108 | 85440 | 19 | 1.7526e+00 | true | ok | 2.6918e-13 | step\_size |
| 100 | LeastSquaresOptim (LM) | 6.4043955e6 | 7698 | 21937568 | 404 | 1.7526e+00 | true | ok | 1.5834e-06 | converged |
| 100 | LeastSquaresOptim (Dogleg) | 329354.0 | 583 | 1268080 | 53 | 1.7526e+00 | true | ok | 8.8155e-15 | converged |
| 160 | SecondOrderOptimization (LM) | 7.633792e6 | 58 | 14576 | 500 | 2.7150e+00 | false | not_converged | 9.8656e-03 | max\_iters |
| 160 | SecondOrderOptimization (LM, tall) | 415770.5 | 108 | 131136 | 18 | 2.7052e+00 | true | ok | 6.6297e-13 | step\_size |
| 160 | LeastSquaresOptim (LM) | 9.0634375e6 | 7964 | 22704704 | 418 | 2.7052e+00 | true | ok | 1.8097e-06 | converged |
| 160 | LeastSquaresOptim (Dogleg) | 438208.5 | 444 | 1219568 | 22 | 2.7052e+00 | true | ok | 3.1598e-15 | converged |
| 250 | SecondOrderOptimization (LM) | 9.452917e6 | 58 | 14576 | 500 | 4.1001e+00 | false | not_converged | 1.0685e-02 | max\_iters |
| 250 | SecondOrderOptimization (LM, tall) | 554917.0 | 108 | 182912 | 18 | 4.0894e+00 | true | ok | 1.4291e-12 | step\_size |
| 250 | LeastSquaresOptim (LM) | 1.3560833e7 | 8003 | 22827952 | 420 | 4.0894e+00 | true | ok | 2.5900e-06 | converged |
| 250 | LeastSquaresOptim (Dogleg) | 745395.5 | 643 | 1289792 | 68 | 4.0894e+00 | true | ok | 6.0239e-14 | converged |
| 400 | SecondOrderOptimization (LM) | 1.4791166e7 | 58 | 14576 | 500 | 7.6197e+00 | false | not_converged | 1.2496e+00 | max\_iters |
| 400 | SecondOrderOptimization (LM, tall) | 812895.5 | 118 | 297056 | 18 | 6.3701e+00 | true | ok | 2.6477e-12 | step\_size |
| 400 | LeastSquaresOptim (LM) | 2.08885e7 | 8005 | 22848528 | 420 | 6.3701e+00 | true | ok | 5.4556e-06 | converged |
| 400 | LeastSquaresOptim (Dogleg) | 1.204375e6 | 642 | 1314896 | 67 | 6.3701e+00 | true | ok | 2.6130e-14 | converged |
| 640 | SecondOrderOptimization (LM) | 2.2862e7 | 58 | 14576 | 500 | 1.0013e+01 | false | not_converged | 9.0369e-03 | max\_iters |
| 640 | SecondOrderOptimization (LM, tall) | 7.99827085e7 | 118 | 478304 | 18 | 1.0004e+01 | true | ok | 5.2190e-14 | rel\_dcost |
| 640 | LeastSquaresOptim (LM) | 3.833475e7 | 8328 | 23809280 | 437 | 1.0004e+01 | true | ok | 5.5200e-06 | converged |
| 640 | LeastSquaresOptim (Dogleg) | 1.8967915e6 | 466 | 1346640 | 23 | 1.0004e+01 | true | ok | 4.3331e-14 | converged |
| 1000 | SecondOrderOptimization (LM) | 3.8909958e7 | 58 | 14576 | 500 | 1.5484e+01 | false | not_converged | 3.8205e-02 | max\_iters |
| 1000 | SecondOrderOptimization (LM, tall) | 1.00792834e8 | 118 | 687200 | 18 | 1.5446e+01 | true | ok | 8.2215e-12 | step\_size |
| 1000 | LeastSquaresOptim (LM) | 6.4522375e7 | 8537 | 24447056 | 448 | 1.5446e+01 | true | ok | 6.4693e-06 | converged |
| 1000 | LeastSquaresOptim (Dogleg) | 2.9905e6 | 466 | 1388624 | 23 | 1.5446e+01 | true | ok | 7.5799e-14 | converged |
| 1600 | SecondOrderOptimization (LM) | 5.7184542e7 | 58 | 14576 | 500 | 2.4582e+01 | false | not_converged | 7.1883e-02 | max\_iters |
| 1600 | SecondOrderOptimization (LM, tall) | 7.8637042e7 | 118 | 1076320 | 18 | 2.4510e+01 | true | ok | 2.1187e-13 | rel\_dcost |
| 1600 | LeastSquaresOptim (LM) | 9.6532042e7 | 8670 | 24927200 | 455 | 2.4510e+01 | true | ok | 8.7234e-06 | converged |
| 1600 | LeastSquaresOptim (Dogleg) | 4.852021e6 | 466 | 1472592 | 23 | 2.4510e+01 | true | ok | 2.4976e-13 | converged |
| 2500 | SecondOrderOptimization (LM) | 2.7692775e8 | 58 | 14576 | 500 | 3.8107e+01 | false | not_converged | 2.5835e-03 | max\_iters |
| 2500 | SecondOrderOptimization (LM, tall) | 1.31510208e8 | 118 | 1711200 | 18 | 3.8104e+01 | true | ok | 3.3962e-13 | rel\_dcost |
| 2500 | LeastSquaresOptim (LM) | 1.57950583e8 | 8784 | 25369472 | 461 | 3.8104e+01 | true | ok | 1.1528e-05 | converged |
| 2500 | LeastSquaresOptim (Dogleg) | 8.449583e6 | 582 | 1609424 | 52 | 3.8104e+01 | true | ok | 7.0929e-13 | converged |
| 4000 | SecondOrderOptimization (LM) | 3.43274667e8 | 58 | 14576 | 500 | 1.9692e+02 | false | not_converged | 1.3616e+02 | max\_iters |
| 4000 | SecondOrderOptimization (LM, tall) | 1.11335916e8 | 118 | 2669664 | 18 | 6.0759e+01 | true | ok | 4.2541e-13 | rel\_dcost |
| 4000 | LeastSquaresOptim (LM) | 2.47978021e8 | 8708 | 25353152 | 457 | 6.0759e+01 | true | ok | 2.2332e-05 | converged |
| 4000 | LeastSquaresOptim (Dogleg) | 1.3234541e7 | 485 | 1860672 | 24 | 6.0759e+01 | true | ok | 3.6547e-13 | converged |
| 6400 | SecondOrderOptimization (LM) | 6.35337541e8 | 58 | 14576 | 500 | 1.1443e+02 | false | not_converged | 1.7421e+01 | max\_iters |
| 6400 | SecondOrderOptimization (LM, tall) | 1.22333666e8 | 118 | 4324448 | 18 | 9.7005e+01 | true | ok | 6.3387e-11 | rel\_dcost, step\_size |
| 6400 | LeastSquaresOptim (LM) | 3.82602833e8 | 8803 | 25984880 | 462 | 9.7005e+01 | true | ok | 3.0364e-05 | converged |
| 6400 | LeastSquaresOptim (Dogleg) | 1.98958335e7 | 485 | 2221120 | 24 | 9.7005e+01 | true | ok | 4.2739e-13 | converged |
