# Benchmark Results: Ill-Conditioned Polynomial Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-14T13:29:16
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 4e9eec5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 60 | NLLSModel (Static) | 194.85294117647058 | 1 | 16 | 15750.0 | 1 | 32 |
| 60 | Standalone | 235.7594936708861 | 1 | 16 | 1416.7142857142858 | 1 | 32 |
| 100 | NLLSModel (Static) | 268.94805194805195 | 1 | 16 | 25875.0 | 1 | 32 |
| 100 | Standalone | 343.97872340425533 | 1 | 16 | 2208.4 | 1 | 32 |
| 160 | NLLSModel (Static) | 409.16 | 1 | 16 | 40042.0 | 1 | 32 |
| 160 | Standalone | 503.20512820512823 | 1 | 16 | 3451.3333333333335 | 1 | 32 |
| 250 | NLLSModel (Static) | 596.8235294117648 | 1 | 16 | 61917.0 | 1 | 32 |
| 250 | Standalone | 740.7407407407408 | 1 | 16 | 5541.75 | 1 | 32 |
| 400 | NLLSModel (Static) | 968.2380952380952 | 1 | 16 | 100083.0 | 1 | 32 |
| 400 | Standalone | 1115.7222222222222 | 1 | 16 | 8527.666666666666 | 1 | 32 |
| 640 | NLLSModel (Static) | 1470.2857142857142 | 1 | 16 | 161083.0 | 1 | 32 |
| 640 | Standalone | 1897.7272727272727 | 1 | 16 | 14084.0 | 1 | 32 |
| 1000 | NLLSModel (Static) | 2446.4285714285716 | 1 | 16 | 248583.0 | 1 | 32 |
| 1000 | Standalone | 2958.4285714285716 | 1 | 16 | 21875.0 | 1 | 32 |
| 1600 | NLLSModel (Static) | 3659.6666666666665 | 1 | 16 | 408959.0 | 1 | 32 |
| 1600 | Standalone | 5156.25 | 1 | 16 | 35375.0 | 1 | 32 |
| 2500 | NLLSModel (Static) | 5614.75 | 1 | 16 | 623125.0 | 1 | 32 |
| 2500 | Standalone | 7833.333333333333 | 1 | 16 | 54916.0 | 1 | 32 |
| 4000 | NLLSModel (Static) | 9334.0 | 1 | 16 | 1.069625e6 | 1 | 32 |
| 4000 | Standalone | 13125.0 | 1 | 16 | 90375.0 | 1 | 32 |
| 6400 | NLLSModel (Static) | 14458.0 | 1 | 16 | 1.681e6 | 1 | 32 |
| 6400 | Standalone | 20834.0 | 1 | 16 | 147417.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 60 | SecondOrderOptimization (LM) | 2.9964165e6 | 29 | 7968 | 184 | 1.0545e+00 | true | ok | 1.2285e-06 | step\_size |
| 60 | SecondOrderOptimization (LM, tall) | 335000.0 | 112 | 57312 | 18 | 1.0545e+00 | false | not_converged | 2.1960e-15 | cost\_discrepancy |
| 60 | LeastSquaresOptim (LM) | 4.907062e6 | 7850 | 22366432 | 412 | 1.0545e+00 | true | ok | 1.0311e-06 | converged |
| 60 | LeastSquaresOptim (Dogleg) | 225687.5 | 444 | 1203808 | 22 | 1.0545e+00 | true | ok | 4.2511e-15 | converged |
| 100 | SecondOrderOptimization (LM) | 1.3113042e7 | 29 | 7968 | 500 | 1.7527e+00 | false | not_converged | 1.7567e-04 | max\_iters |
| 100 | SecondOrderOptimization (LM, tall) | 438625.5 | 112 | 85408 | 18 | 1.7526e+00 | true | ok | 3.3741e-13 | step\_size |
| 100 | LeastSquaresOptim (LM) | 6.3440205e6 | 7698 | 21937568 | 404 | 1.7526e+00 | true | ok | 1.5834e-06 | converged |
| 100 | LeastSquaresOptim (Dogleg) | 332041.5 | 583 | 1268080 | 53 | 1.7526e+00 | true | ok | 8.8155e-15 | converged |
| 160 | SecondOrderOptimization (LM) | 2.0224791e7 | 29 | 7968 | 500 | 2.7056e+00 | false | not_converged | 4.1596e-04 | max\_iters |
| 160 | SecondOrderOptimization (LM, tall) | 640708.5 | 112 | 131008 | 18 | 2.7052e+00 | true | ok | 6.6297e-13 | step\_size |
| 160 | LeastSquaresOptim (LM) | 9.2433335e6 | 7964 | 22704704 | 418 | 2.7052e+00 | true | ok | 1.8097e-06 | converged |
| 160 | LeastSquaresOptim (Dogleg) | 457645.5 | 444 | 1219568 | 22 | 2.7052e+00 | true | ok | 3.1598e-15 | converged |
| 250 | SecondOrderOptimization (LM) | 2.4013e7 | 29 | 7968 | 382 | 4.0894e+00 | true | ok | 6.9489e-06 | rel\_dcost |
| 250 | SecondOrderOptimization (LM, tall) | 949521.0 | 112 | 182784 | 18 | 4.0894e+00 | true | ok | 1.4291e-12 | step\_size |
| 250 | LeastSquaresOptim (LM) | 1.3760021e7 | 8003 | 22827952 | 420 | 4.0894e+00 | true | ok | 2.5900e-06 | converged |
| 250 | LeastSquaresOptim (Dogleg) | 756250.0 | 643 | 1289792 | 68 | 4.0894e+00 | true | ok | 6.0239e-14 | converged |
| 400 | SecondOrderOptimization (LM) | 2.18225e6 | 29 | 7968 | 20 | 3.4164e+01 | false | not_converged | 2.7794e+01 | cost\_discrepancy |
| 400 | SecondOrderOptimization (LM, tall) | 1.465375e6 | 122 | 296928 | 18 | 6.3701e+00 | true | ok | 2.6477e-12 | step\_size |
| 400 | LeastSquaresOptim (LM) | 2.0864979e7 | 8005 | 22848528 | 420 | 6.3701e+00 | true | ok | 5.4556e-06 | converged |
| 400 | LeastSquaresOptim (Dogleg) | 1.193396e6 | 642 | 1314896 | 67 | 6.3701e+00 | true | ok | 2.6130e-14 | converged |
| 640 | SecondOrderOptimization (LM) | 8.0027e7 | 29 | 7968 | 500 | 1.0004e+01 | false | not_converged | 1.4004e-04 | max\_iters |
| 640 | SecondOrderOptimization (LM, tall) | 2.4346245e6 | 122 | 478176 | 18 | 1.0004e+01 | true | ok | 1.4588e-14 | rel\_dcost |
| 640 | LeastSquaresOptim (LM) | 3.6714208e7 | 8328 | 23809280 | 437 | 1.0004e+01 | true | ok | 5.5200e-06 | converged |
| 640 | LeastSquaresOptim (Dogleg) | 1.8085415e6 | 466 | 1346640 | 23 | 1.0004e+01 | true | ok | 4.3331e-14 | converged |
| 1000 | SecondOrderOptimization (LM) | 1.3053425e8 | 29 | 7968 | 500 | 1.7238e+01 | false | not_converged | 1.7922e+00 | max\_iters |
| 1000 | SecondOrderOptimization (LM, tall) | 4.1074165e6 | 122 | 687072 | 18 | 1.5446e+01 | true | ok | 8.2215e-12 | step\_size |
| 1000 | LeastSquaresOptim (LM) | 6.3103042e7 | 8537 | 24447056 | 448 | 1.5446e+01 | true | ok | 6.4693e-06 | converged |
| 1000 | LeastSquaresOptim (Dogleg) | 3.1791875e6 | 466 | 1388624 | 23 | 1.5446e+01 | true | ok | 7.5799e-14 | converged |
| 1600 | SecondOrderOptimization (LM) | 1.10162917e8 | 29 | 7968 | 273 | 2.4510e+01 | true | ok | 1.4460e-05 | rel\_dcost |
| 1600 | SecondOrderOptimization (LM, tall) | 6.0973545e6 | 122 | 1076192 | 18 | 2.4510e+01 | true | ok | 2.1187e-13 | rel\_dcost |
| 1600 | LeastSquaresOptim (LM) | 1.02129042e8 | 8670 | 24927200 | 455 | 2.4510e+01 | true | ok | 8.7234e-06 | converged |
| 1600 | LeastSquaresOptim (Dogleg) | 5.2519375e6 | 466 | 1472592 | 23 | 2.4510e+01 | true | ok | 2.4976e-13 | converged |
| 2500 | SecondOrderOptimization (LM) | 3.22061084e8 | 29 | 7968 | 500 | 3.8105e+01 | false | not_converged | 1.2276e-04 | max\_iters |
| 2500 | SecondOrderOptimization (LM, tall) | 1.0036479e7 | 122 | 1711072 | 18 | 3.8104e+01 | true | ok | 3.3962e-13 | rel\_dcost |
| 2500 | LeastSquaresOptim (LM) | 1.58057209e8 | 8784 | 25369472 | 461 | 3.8104e+01 | true | ok | 1.1528e-05 | converged |
| 2500 | LeastSquaresOptim (Dogleg) | 7.6316045e6 | 582 | 1609424 | 52 | 3.8104e+01 | true | ok | 7.0929e-13 | converged |
| 4000 | SecondOrderOptimization (LM) | 8.3933833e7 | 29 | 7968 | 78 | 2.5890e+02 | false | not_converged | 1.9814e+02 | cost\_discrepancy |
| 4000 | SecondOrderOptimization (LM, tall) | 1.4752584e7 | 122 | 2669536 | 18 | 6.0759e+01 | true | ok | 4.2541e-13 | rel\_dcost |
| 4000 | LeastSquaresOptim (LM) | 2.37617e8 | 8708 | 25353152 | 457 | 6.0759e+01 | true | ok | 2.2332e-05 | converged |
| 4000 | LeastSquaresOptim (Dogleg) | 1.3864125e7 | 485 | 1860672 | 24 | 6.0759e+01 | true | ok | 3.6547e-13 | converged |
| 6400 | SecondOrderOptimization (LM) | 3.303325e7 | 29 | 7968 | 18 | 4.9613e+02 | false | not_converged | 3.9912e+02 | cost\_discrepancy |
| 6400 | SecondOrderOptimization (LM, tall) | 2.46899585e7 | 122 | 4324320 | 18 | 9.7005e+01 | true | ok | 6.3387e-11 | rel\_dcost, step\_size |
| 6400 | LeastSquaresOptim (LM) | 3.85950666e8 | 8803 | 25984880 | 462 | 9.7005e+01 | true | ok | 3.0364e-05 | converged |
| 6400 | LeastSquaresOptim (Dogleg) | 1.9955604e7 | 485 | 2221120 | 24 | 9.7005e+01 | true | ok | 4.2739e-13 | converged |
