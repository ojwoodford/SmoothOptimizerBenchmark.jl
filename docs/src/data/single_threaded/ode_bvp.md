# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T03:42:16
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 32 | NLLSModel (Sparse) | 218.4065934065934 | 1 | 16 | 1589.6923076923076 | 1 | 32 |
| 32 | Standalone (Sparse) | 189.46226415094338 | 1 | 16 | 2510.5 | 20 | 7856 |
| 32 | NLPModels (MathOptNLSModel) | 5947.75 | 2 | 32 | 13125.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 374.2931034482759 | 1 | 16 | 3059.5714285714284 | 1 | 64 |
| 64 | Standalone (Sparse) | 322.265625 | 1 | 16 | 4025.0 | 20 | 17200 |
| 64 | NLPModels (MathOptNLSModel) | 11459.0 | 2 | 32 | 27000.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 638.03125 | 1 | 16 | 6166.75 | 1 | 64 |
| 128 | Standalone (Sparse) | 565.4857142857143 | 1 | 16 | 7458.333333333333 | 22 | 33584 |
| 128 | NLPModels (MathOptNLSModel) | 21708.0 | 2 | 32 | 53500.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 1230.3529411764705 | 1 | 16 | 12084.0 | 1 | 64 |
| 256 | Standalone (Sparse) | 1094.3157894736842 | 1 | 16 | 14292.0 | 24 | 67440 |
| 256 | NLPModels (MathOptNLSModel) | 45583.0 | 2 | 32 | 105500.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 2342.6666666666665 | 1 | 16 | 23959.0 | 1 | 64 |
| 512 | Standalone (Sparse) | 2075.0 | 1 | 16 | 34125.0 | 24 | 134256 |
| 512 | NLPModels (MathOptNLSModel) | 86958.0 | 2 | 32 | 209417.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 4625.0 | 1 | 16 | 47792.0 | 1 | 64 |
| 1024 | Standalone (Sparse) | 4116.8 | 1 | 16 | 64250.0 | 24 | 267920 |
| 1024 | NLPModels (MathOptNLSModel) | 169125.0 | 2 | 32 | 405042.0 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 9222.333333333334 | 1 | 16 | 97625.0 | 1 | 64 |
| 2048 | Standalone (Sparse) | 8444.666666666666 | 1 | 16 | 124250.0 | 25 | 502384 |
| 2048 | NLPModels (MathOptNLSModel) | 458250.0 | 2 | 32 | 1.121666e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 19500.0 | 1 | 16 | 190125.0 | 1 | 64 |
| 4096 | Standalone (Sparse) | 16875.0 | 1 | 16 | 247500.0 | 25 | 1020528 |
| 4096 | NLPModels (MathOptNLSModel) | 1.822542e6 | 2 | 32 | 3.524083e6 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 36875.0 | 1 | 16 | 382209.0 | 1 | 64 |
| 8192 | Standalone (Sparse) | 32709.0 | 1 | 16 | 470709.0 | 25 | 2007664 |
| 8192 | NLPModels (MathOptNLSModel) | 4.781542e6 | 2 | 32 | 1.2826792e7 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 73666.0 | 1 | 16 | 757500.0 | 1 | 64 |
| 16384 | Standalone (Sparse) | 65208.0 | 1 | 16 | 922584.0 | 25 | 3981936 |
| 16384 | NLPModels (MathOptNLSModel) | 1.0465208e7 | 2 | 32 | 2.7725333e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 148750.0 | 1 | 16 | 1.539458e6 | 1 | 64 |
| 32768 | Standalone (Sparse) | 140334.0 | 1 | 16 | 2.0145e6 | 25 | 7897712 |
| 32768 | NLPModels (MathOptNLSModel) | 2.4266208e7 | 2 | 32 | 6.557875e7 | 5 | 128 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 32 | SecondOrderOptimization (Dogleg) | 29521.0 | 153 | 71776 | 3 | 5.6402e-27 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 34917.0 | 149 | 71120 | 4 | 7.9500e-20 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 203229.0 | 139 | 22864 | 13 | 1.4747e-11 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 349229.0 | 187 | 34496 | 19 | 1.1774e-15 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32 | Optim (Newton) | 94937.5 | 355 | 103392 | 3 | 2.8725e-27 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 481208.0 | 617 | 39760 | 6 | 7.8113e-20 | false | not_converged | NaN | not\_desc |
| 32 | JSOSolvers (tron) | 757708.0 | 715 | 40832 | 4 | 2.2735e-21 | false | not_converged | NaN | small\_residual |
| 32 | Ipopt | 695645.5 | 390 | 30832 | 3 | 3.4854e-63 | true | ok | NaN | first\_order |
| 32 | MadNLP | 315604.0 | 578 | 67344 | 3 | 5.7856e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 455896.0 | 784 | 99504 | 17 | 9.5072e-20 | true | ok | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 109750.0 | 849 | 120032 | 5 | 1.5138e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 51875.0 | 180 | 48880 | 3 | 3.3924e-27 | true | ok | NaN | first\_order |
| 64 | SecondOrderOptimization (Dogleg) | 47812.5 | 232 | 101856 | 3 | 9.0812e-26 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (LM) | 56229.0 | 228 | 100688 | 5 | 1.0959e-18 | true | ok | NaN | grad\_tol |
| 64 | LeastSquaresOptim (Dogleg) | 2.9428041e7 | 5035 | 2512096 | 500 | 8.4437e-03 | false | not_converged | NaN | not converged |
| 64 | LeastSquaresOptim (LM) | 2.63475e6 | 297 | 131872 | 27 | 8.3599e-14 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 64 | Optim (Newton) | 131708.5 | 359 | 203744 | 3 | 1.0023e-25 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 2.612917e6 | 1467 | 84912 | 7 | 5.2143e-22 | false | not_converged | NaN | not\_desc |
| 64 | JSOSolvers (tron) | 7.563917e6 | 3559 | 188656 | 13 | 6.3499e-17 | false | not_converged | NaN | small\_step |
| 64 | Ipopt | 764874.5 | 338 | 49680 | 2 | 3.8541e-47 | true | ok | NaN | first\_order |
| 64 | MadNLP | 534834.0 | 580 | 87536 | 3 | 1.1280e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 1.622625e6 | 791 | 221264 | 20 | 4.0677e-21 | true | ok | NaN | Success |
| 64 | NonlinearSolve (TrustRegion) | 137770.5 | 861 | 230960 | 5 | 2.9639e-18 | true | ok | NaN | Success |
| 64 | CaNNOLeS | 101291.5 | 194 | 97008 | 3 | 9.6264e-26 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 114229.5 | 246 | 195328 | 4 | 2.3553e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM) | 135292.0 | 240 | 191952 | 7 | 3.5241e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | LeastSquaresOptim (Dogleg) | 1.06846875e8 | 5035 | 2527168 | 500 | 1.6872e+01 | false | not_converged | NaN | not converged |
| 128 | LeastSquaresOptim (LM) | 2.25375958e8 | 5335 | 8514864 | 443 | 1.1009e-09 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 128 | Optim (Newton) | 271958.5 | 477 | 505984 | 4 | 2.9738e-24 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 2.1476292e7 | 4457 | 237680 | 8 | 4.9369e-18 | false | not_converged | NaN | not\_desc |
| 128 | JSOSolvers (tron) | 1.30213775e9 | 259829 | 12503280 | 12 | 1.1094e-16 | false | not_converged | NaN | small\_step |
| 128 | Ipopt | 969333.5 | 349 | 69744 | 2 | 7.4496e-46 | true | ok | NaN | first\_order |
| 128 | MadNLP | 808437.5 | 591 | 127184 | 3 | 2.2634e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 6.194208e6 | 811 | 499856 | 22 | 2.2726e-19 | true | ok | NaN | Success |
| 128 | NonlinearSolve (TrustRegion) | 199979.0 | 894 | 323312 | 4 | 3.0086e-17 | true | ok | NaN | Success |
| 128 | CaNNOLeS | 189708.5 | 217 | 174944 | 3 | 2.6889e-24 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 228833.5 | 293 | 386704 | 4 | 1.0706e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (LM) | 306188.0 | 284 | 380352 | 8 | 1.2124e-22 | true | ok | NaN | step\_size |
| 256 | LeastSquaresOptim (Dogleg) | 3.82767875e8 | 6048 | 9732064 | 500 | 8.4444e+01 | false | not_converged | NaN | not converged |
| 256 | LeastSquaresOptim (LM) | 9.44546208e8 | 6033 | 9654480 | 500 | 2.5926e+01 | false | not_converged | NaN | not converged |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 256 | Optim (Newton) | 389437.0 | 505 | 1004416 | 4 | 8.2267e-23 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 4.133679541e9 | 422824 | 20335344 | 208 | 2.5351e-17 | false | not_converged | NaN | not\_desc |
| 256 | JSOSolvers (tron) | 3.0006223834e10 | 3034122 | 145688192 | 61 | 2.1503e-12 | false | timeout | NaN | max\_time |
| 256 | Ipopt | 1.564979e6 | 369 | 138704 | 2 | 1.2199e-51 | true | ok | NaN | first\_order |
| 256 | MadNLP | 1.2045415e6 | 621 | 204128 | 3 | 5.0789e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 2.5768708e7 | 862 | 1526416 | 25 | 9.5562e-19 | true | ok | NaN | Success |
| 256 | NonlinearSolve (TrustRegion) | 353625.0 | 960 | 568320 | 5 | 7.3379e-18 | true | ok | NaN | Success |
| 256 | CaNNOLeS | 396688.0 | 240 | 352864 | 3 | 9.7289e-23 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 410395.5 | 293 | 759408 | 4 | 2.5649e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 512 | SecondOrderOptimization (LM) | 618854.5 | 287 | 751072 | 9 | 4.0273e-21 | true | ok | NaN | step\_size |
| 512 | LeastSquaresOptim (Dogleg) | 1.112204875e9 | 6048 | 9774688 | 500 | 2.0403e+02 | false | not_converged | NaN | not converged |
| 512 | LeastSquaresOptim (LM) | 1.192816833e9 | 6125 | 12003088 | 500 | 2.0331e+02 | false | not_converged | NaN | not converged |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 512 | Optim (Newton) | 706646.0 | 521 | 1995136 | 4 | 2.5808e-21 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 3.0000125833e10 | 1543749 | 74168384 | 379 | 2.4510e+01 | false | timeout | NaN | max\_time |
| 512 | JSOSolvers (tron) | 3.0000417125e10 | 1538681 | 73946448 | 16 | 1.1087e+01 | false | timeout | NaN | max\_time |
| 512 | Ipopt | 2.411021e6 | 371 | 283760 | 2 | 1.6725e-50 | true | ok | NaN | first\_order |
| 512 | MadNLP | 2.0183335e6 | 633 | 362384 | 3 | 3.4618e-21 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 9.3975875e7 | 5487 | 25258464 | 27 | 2.9581e-17 | true | ok | NaN | Success |
| 512 | NonlinearSolve (TrustRegion) | 627020.5 | 971 | 1109104 | 6 | 4.5388e-20 | true | ok | NaN | Success |
| 512 | CaNNOLeS | 728166.5 | 248 | 725728 | 3 | 3.4085e-21 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 733021.0 | 296 | 1582768 | 4 | 9.5650e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (LM) | 1.2675835e6 | 290 | 1566240 | 11 | 8.5848e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | LeastSquaresOptim (Dogleg) | 1.911728125e9 | 6108 | 11335456 | 500 | 4.6396e+02 | false | not_converged | NaN | not converged |
| 1024 | LeastSquaresOptim (LM) | 2.097330625e9 | 6077 | 10903824 | 500 | 4.6397e+02 | false | not_converged | NaN | not converged |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1024 | Optim (Newton) | 1.2760415e6 | 769 | 4209568 | 4 | 8.5372e-20 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.0000644209e10 | 783131 | 37728352 | 98 | 3.9580e+02 | false | timeout | NaN | max\_time |
| 1024 | JSOSolvers (tron) | 3.0000775708e10 | 781274 | 37705888 | 4 | 4.1370e+02 | false | timeout | NaN | max\_time |
| 1024 | Ipopt | 5.1252715e6 | 375 | 454864 | 2 | 1.9886e-46 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 1.49935e7 | 957 | 682192 | 8 | 9.1699e-20 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 1024 | NonlinearSolve (LM) | 2.168290125e9 | 28088 | 289468848 | 163 | 6.5247e-16 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 2.385729e6 | 3427 | 3521280 | 5 | 4.9101e-18 | true | ok | NaN | Success |
| 1024 | CaNNOLeS | 1.567e6 | 248 | 1405664 | 3 | 8.9525e-20 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 1.372896e6 | 302 | 2975344 | 4 | 2.7584e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (LM) | 2.781354e6 | 296 | 2942432 | 12 | 2.8708e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | LeastSquaresOptim (Dogleg) | 2.959602417e9 | 6096 | 11472992 | 500 | 9.8231e+02 | false | not_converged | NaN | not converged |
| 2048 | LeastSquaresOptim (LM) | 3.534745958e9 | 6053 | 10475920 | 500 | 9.8236e+02 | false | not_converged | NaN | not converged |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2048 | Optim (Newton) | 2.3210205e6 | 526 | 7774080 | 4 | 2.8565e-18 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 3.0001227167e10 | 386041 | 18807296 | 26 | 9.0928e+02 | false | timeout | NaN | max\_time |
| 2048 | JSOSolvers (tron) | 3.0003127708e10 | 383195 | 18803840 | 1 | 9.3107e+02 | false | timeout | NaN | max\_time |
| 2048 | Ipopt | 1.10342495e7 | 379 | 915984 | 2 | 3.7204e-44 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 3.6729458e7 | 945 | 1310864 | 8 | 2.9149e-18 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 2048 | NonlinearSolve (LM) | 8.7349635e9 | 29424 | 614033328 | 171 | 2.4514e-14 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 5.1098745e6 | 5780 | 6685904 | 6 | 2.5688e-17 | true | ok | NaN | Success |
| 2048 | CaNNOLeS | 3.9386875e6 | 250 | 2700032 | 3 | 2.9864e-18 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 2.578833e6 | 302 | 6080368 | 4 | 9.7013e-17 | true | ok | NaN | abs\_dcost, step\_size |
| 4096 | SecondOrderOptimization (LM) | 5.8062085e6 | 296 | 6014688 | 13 | 9.6078e-17 | true | ok | NaN | abs\_dcost, step\_size |
| 4096 | LeastSquaresOptim (Dogleg) | 1.47671708e8 | 80 | 729472 | 2 | 2.0477e+03 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 5.337613875e9 | 5687 | 7927472 | 500 | 2.0119e+03 | false | not_converged | NaN | not converged |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 4096 | Optim (Newton) | 4.6612295e6 | 526 | 15959936 | 4 | 9.6838e-17 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 3.00026825e10 | 131645 | 6874816 | 6 | 1.9507e+03 | false | timeout | NaN | max\_time |
| 4096 | JSOSolvers (tron) | 3.0007707833e10 | 128384 | 6984560 | 1 | 1.9672e+03 | false | timeout | NaN | max\_time |
| 4096 | Ipopt | 2.40312915e7 | 383 | 1846544 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 1.25697166e8 | 1037 | 2570096 | 9 | 9.4483e-17 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 4096 | NonlinearSolve (LM) | 3.0037536875e10 | 873 | 291017424 | 121 | 8.8909e-13 | false | timeout | NaN | MaxTime |
| 4096 | NonlinearSolve (TrustRegion) | 6.3358417e7 | 10514 | 15642640 | 38 | 9.2716e-17 | true | ok | NaN | StalledSuccess |
| 4096 | CaNNOLeS | 1.0138125e7 | 252 | 5288736 | 3 | 9.9773e-17 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 6.7139375e6 | 302 | 11897232 | 6 | 3.2591e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (LM) | 1.32911245e7 | 296 | 11766016 | 16 | 3.0995e-15 | true | ok | NaN | step\_size |
| 8192 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 8192 | LeastSquaresOptim (LM) | 2.5312295e6 | 53 | 790240 | 1 | 4.0954e+03 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 8192 | Optim (Newton) | 1.5735562e7 | 742 | 44575968 | 6 | 3.1978e-15 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 3.0006815333e10 | 31341 | 2617280 | 3 | 4.0445e+03 | false | timeout | NaN | max\_time |
| 8192 | JSOSolvers (tron) | 3.0025464708e10 | 30905 | 3128864 | 1 | 4.0450e+03 | false | timeout | NaN | max\_time |
| 8192 | Ipopt | 5.4370833e7 | 393 | 3674448 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.3635898917e10 | 4609 | 5199632 | 500 | 1.3036e-01 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 8192 | NonlinearSolve (LM) | 3.054416225e10 | 7096 | 532725008 | 38 | 3.1366e-11 | false | timeout | NaN | MaxTime |
| 8192 | NonlinearSolve (TrustRegion) | 2.10031625e8 | 19997 | 38850864 | 41 | 3.0111e-15 | true | ok | NaN | StalledSuccess |
| 8192 | CaNNOLeS | 2.9601084e7 | 254 | 10449728 | 3 | 3.1855e-15 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 1.4676833e7 | 303 | 23440752 | 7 | 4.2558e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (LM) | 3.2074688e7 | 297 | 23178464 | 19 | 1.3348e-13 | true | ok | NaN | step\_size |
| 16384 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 16384 | LeastSquaresOptim (LM) | 5.0927295e6 | 54 | 1577664 | 1 | 8.1914e+03 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 16384 | Optim (Newton) | 3.8599958e7 | 958 | 114532928 | 8 | 1.1880e-13 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 3.0020137958e10 | 10341 | 2723392 | 3 | 8.1632e+03 | false | timeout | NaN | max\_time |
| 16384 | JSOSolvers (tron) | 3.007452425e10 | 10463 | 3794240 | 1 | 8.1632e+03 | false | timeout | NaN | max\_time |
| 16384 | Ipopt | 1.07309875e8 | 403 | 7346384 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 2.9282590125e10 | 4618 | 10189296 | 500 | 4.1475e+00 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 16384 | NonlinearSolve (LM) | 3.1796209166e10 | 2410 | 284899376 | 10 | 8.1849e+03 | false | timeout | NaN | MaxTime |
| 16384 | NonlinearSolve (TrustRegion) | 4.41922833e8 | 38754 | 88982960 | 43 | 9.7876e-14 | true | ok | NaN | StalledSuccess |
| 16384 | CaNNOLeS | 6.980252959e9 | 1254 | 21081664 | 501 | 1.0151e-13 | false | not_converged | NaN | max\_iter |
| 32768 | SecondOrderOptimization (Dogleg) | 1.7014854e7 | 303 | 46691696 | 2 | 4.7013e+00 | true | ok | NaN | rel\_dcost, step\_size |
| 32768 | SecondOrderOptimization (LM) | 4.14440125e8 | 297 | 46478560 | 93 | 1.8708e-08 | true | ok | NaN | step\_size |
| 32768 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 32768 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32768 | Optim (Newton) | 8.6242292e7 | 803 | 232090336 | 5 | 5.9465e-08 | false | not_converged | NaN | not converged |
| 32768 | JSOSolvers (trunk) | 3.0038148375e10 | 4509 | 4671680 | 3 | 1.6365e+04 | false | timeout | NaN | max\_time |
| 32768 | JSOSolvers (tron) | 3.0159000458e10 | 4591 | 6805568 | 1 | 1.6365e+04 | false | timeout | NaN | max\_time |
| 32768 | Ipopt | 2.14508e8 | 407 | 14674192 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 3.0086452583e10 | 2586 | 20128560 | 246 | 1.4769e+04 | false | timeout | NaN | MAXIMUM\_WALLTIME\_EXCEEDED |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | CaNNOLeS | 1.4395161791e10 | 1254 | 42790464 | 501 | 3.2323e-12 | false | not_converged | NaN | max\_iter |
