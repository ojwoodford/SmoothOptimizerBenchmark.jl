# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T03:00:06
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
| 32 | NLLSModel (Sparse) | 292.0 | 1 | 16 | 1634.6153846153845 | 1 | 32 |
| 32 | Standalone (Sparse) | 188.88571428571427 | 1 | 16 | 2393.5555555555557 | 20 | 7856 |
| 32 | NLPModels (MathOptNLSModel) | 6459.0 | 2 | 32 | 13625.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 409.72222222222223 | 1 | 16 | 3357.1428571428573 | 1 | 64 |
| 64 | Standalone (Sparse) | 313.9 | 1 | 16 | 3659.6666666666665 | 20 | 17200 |
| 64 | NLPModels (MathOptNLSModel) | 11958.0 | 2 | 32 | 25834.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 675.78125 | 1 | 16 | 5989.75 | 1 | 64 |
| 128 | Standalone (Sparse) | 564.2857142857143 | 1 | 16 | 7541.666666666667 | 22 | 33584 |
| 128 | NLPModels (MathOptNLSModel) | 21667.0 | 2 | 32 | 51500.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 840.0 | 3 | 48 | 12375.0 | 1 | 64 |
| 256 | Standalone (Sparse) | 1100.8947368421052 | 1 | 16 | 14667.0 | 24 | 67440 |
| 256 | NLPModels (MathOptNLSModel) | 42333.0 | 2 | 32 | 102167.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 911.0666666666667 | 3 | 48 | 23875.0 | 1 | 64 |
| 512 | Standalone (Sparse) | 2070.8 | 1 | 16 | 27375.0 | 24 | 134256 |
| 512 | NLPModels (MathOptNLSModel) | 94125.0 | 2 | 32 | 226833.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 1541.6923076923076 | 3 | 48 | 22875.0 | 1 | 64 |
| 1024 | Standalone (Sparse) | 4375.0 | 1 | 16 | 57458.0 | 24 | 267920 |
| 1024 | NLPModels (MathOptNLSModel) | 177167.0 | 2 | 32 | 410041.0 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 2159.6666666666665 | 3 | 48 | 41750.0 | 1 | 64 |
| 2048 | Standalone (Sparse) | 8180.333333333333 | 1 | 16 | 106250.0 | 25 | 502384 |
| 2048 | NLPModels (MathOptNLSModel) | 427750.0 | 2 | 32 | 1.023625e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 12097.333333333334 | 3 | 48 | 70209.0 | 1 | 64 |
| 4096 | Standalone (Sparse) | 17375.0 | 1 | 16 | 232125.0 | 25 | 1020528 |
| 4096 | NLPModels (MathOptNLSModel) | 1.239292e6 | 2 | 32 | 3.398167e6 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 5917.0 | 3 | 48 | 139458.0 | 1 | 64 |
| 8192 | Standalone (Sparse) | 32708.0 | 1 | 16 | 423917.0 | 25 | 2007664 |
| 8192 | NLPModels (MathOptNLSModel) | 3.61575e6 | 2 | 32 | 1.0037166e7 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 10833.0 | 3 | 48 | 374250.0 | 1 | 64 |
| 16384 | Standalone (Sparse) | 148209.0 | 1 | 16 | 977542.0 | 25 | 3981936 |
| 16384 | NLPModels (MathOptNLSModel) | 1.0432667e7 | 2 | 32 | 3.0288583e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 25333.0 | 3 | 48 | 556041.0 | 1 | 64 |
| 32768 | Standalone (Sparse) | 130250.0 | 1 | 16 | 1.870708e6 | 25 | 7897712 |
| 32768 | NLPModels (MathOptNLSModel) | 2.429925e7 | 2 | 32 | 6.5184708e7 | 5 | 128 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 32 | SecondOrderOptimization (Dogleg) | 26729.0 | 153 | 71776 | 3 | 5.6402e-27 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 34979.0 | 149 | 71120 | 4 | 7.9500e-20 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 203125.0 | 139 | 22864 | 13 | 1.4747e-11 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 344834.0 | 187 | 34496 | 19 | 1.1774e-15 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32 | Optim (Newton) | 91958.5 | 355 | 103392 | 3 | 2.8725e-27 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 483000.0 | 617 | 39760 | 6 | 7.8113e-20 | false | not_converged | NaN | not\_desc |
| 32 | JSOSolvers (tron) | 738167.0 | 715 | 40832 | 4 | 2.2735e-21 | false | not_converged | NaN | small\_residual |
| 32 | Ipopt | 728458.0 | 390 | 30832 | 3 | 3.4854e-63 | true | ok | NaN | first\_order |
| 32 | MadNLP | 328458.0 | 578 | 67344 | 3 | 5.7856e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 463417.0 | 784 | 99504 | 17 | 9.5072e-20 | true | ok | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 111000.5 | 849 | 120032 | 5 | 1.5138e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 54396.0 | 180 | 48880 | 3 | 3.3924e-27 | true | ok | NaN | first\_order |
| 64 | SecondOrderOptimization (Dogleg) | 77438.0 | 232 | 101856 | 3 | 9.0812e-26 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (LM) | 64375.0 | 228 | 100688 | 5 | 1.0959e-18 | true | ok | NaN | grad\_tol |
| 64 | LeastSquaresOptim (Dogleg) | 2.9931625e7 | 5035 | 2512096 | 500 | 8.4437e-03 | false | not_converged | NaN | not converged |
| 64 | LeastSquaresOptim (LM) | 2.620792e6 | 297 | 131872 | 27 | 8.3599e-14 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 64 | Optim (Newton) | 130666.5 | 359 | 203744 | 3 | 1.0023e-25 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 2.692333e6 | 1467 | 84912 | 7 | 5.2143e-22 | false | not_converged | NaN | not\_desc |
| 64 | JSOSolvers (tron) | 7.440542e6 | 3559 | 188656 | 13 | 6.3499e-17 | false | not_converged | NaN | small\_step |
| 64 | Ipopt | 735625.0 | 338 | 49680 | 2 | 3.8541e-47 | true | ok | NaN | first\_order |
| 64 | MadNLP | 502854.0 | 580 | 87536 | 3 | 1.1280e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 1.5194375e6 | 791 | 221264 | 20 | 4.0677e-21 | true | ok | NaN | Success |
| 64 | NonlinearSolve (TrustRegion) | 133812.5 | 861 | 230960 | 5 | 2.9639e-18 | true | ok | NaN | Success |
| 64 | CaNNOLeS | 97666.5 | 194 | 97008 | 3 | 9.6264e-26 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 103062.0 | 246 | 195328 | 4 | 2.3553e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM) | 134479.5 | 240 | 191952 | 7 | 3.5241e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | LeastSquaresOptim (Dogleg) | 1.03762625e8 | 5035 | 2527168 | 500 | 1.6872e+01 | false | not_converged | NaN | not converged |
| 128 | LeastSquaresOptim (LM) | 2.28624708e8 | 8935 | 8572464 | 443 | 1.1009e-09 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 128 | Optim (Newton) | 241666.5 | 477 | 505984 | 4 | 2.9738e-24 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 1.9796416e7 | 4457 | 237680 | 8 | 4.9369e-18 | false | not_converged | NaN | not\_desc |
| 128 | JSOSolvers (tron) | 1.292542542e9 | 259829 | 12503280 | 12 | 1.1094e-16 | false | not_converged | NaN | small\_step |
| 128 | Ipopt | 910229.0 | 349 | 69744 | 2 | 7.4496e-46 | true | ok | NaN | first\_order |
| 128 | MadNLP | 742500.0 | 591 | 127184 | 3 | 2.2634e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 5.936083e6 | 811 | 499856 | 22 | 2.2726e-19 | true | ok | NaN | Success |
| 128 | NonlinearSolve (TrustRegion) | 189500.0 | 894 | 323312 | 4 | 3.0086e-17 | true | ok | NaN | Success |
| 128 | CaNNOLeS | 183333.5 | 217 | 174944 | 3 | 2.6889e-24 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 210833.0 | 293 | 386704 | 4 | 1.0706e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (LM) | 296729.5 | 284 | 380352 | 8 | 1.2124e-22 | true | ok | NaN | step\_size |
| 256 | LeastSquaresOptim (Dogleg) | 3.90090042e8 | 6048 | 9732064 | 500 | 8.4444e+01 | false | not_converged | NaN | not converged |
| 256 | LeastSquaresOptim (LM) | 9.42303166e8 | 6033 | 9654480 | 500 | 2.5926e+01 | false | not_converged | NaN | not converged |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 256 | Optim (Newton) | 406396.0 | 505 | 1004416 | 4 | 8.2267e-23 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 4.13947325e9 | 422824 | 20335344 | 208 | 2.5351e-17 | false | not_converged | NaN | not\_desc |
| 256 | JSOSolvers (tron) | 3.0000376667e10 | 3049031 | 146383760 | 61 | 2.0523e-12 | false | timeout | NaN | max\_time |
| 256 | Ipopt | 1.5156665e6 | 369 | 138704 | 2 | 1.2199e-51 | true | ok | NaN | first\_order |
| 256 | MadNLP | 1.164396e6 | 621 | 204128 | 3 | 5.0789e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 2.5685771e7 | 862 | 1526416 | 25 | 9.5562e-19 | true | ok | NaN | Success |
| 256 | NonlinearSolve (TrustRegion) | 324583.5 | 960 | 568320 | 5 | 7.3379e-18 | true | ok | NaN | Success |
| 256 | CaNNOLeS | 349125.0 | 240 | 352864 | 3 | 9.7289e-23 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 368063.0 | 293 | 759408 | 4 | 2.5649e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 512 | SecondOrderOptimization (LM) | 585583.5 | 287 | 751072 | 9 | 4.0273e-21 | true | ok | NaN | step\_size |
| 512 | LeastSquaresOptim (Dogleg) | 1.105119333e9 | 6048 | 9774688 | 500 | 2.0403e+02 | false | not_converged | NaN | not converged |
| 512 | LeastSquaresOptim (LM) | 1.201346792e9 | 6125 | 12003088 | 500 | 2.0331e+02 | false | not_converged | NaN | not converged |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 512 | Optim (Newton) | 670166.5 | 521 | 1995136 | 4 | 2.5808e-21 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 3.0000345209e10 | 1551711 | 74550560 | 381 | 2.4276e+01 | false | timeout | NaN | max\_time |
| 512 | JSOSolvers (tron) | 3.0000418e10 | 1536252 | 73838304 | 16 | 1.1094e+01 | false | timeout | NaN | max\_time |
| 512 | Ipopt | 2.374125e6 | 371 | 283760 | 2 | 1.6725e-50 | true | ok | NaN | first\_order |
| 512 | MadNLP | 1.9643955e6 | 633 | 362384 | 3 | 3.4618e-21 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 9.6231417e7 | 5123 | 25252640 | 27 | 2.9581e-17 | true | ok | NaN | Success |
| 512 | NonlinearSolve (TrustRegion) | 578083.5 | 971 | 1109104 | 6 | 4.5388e-20 | true | ok | NaN | Success |
| 512 | CaNNOLeS | 682833.0 | 248 | 725728 | 3 | 3.4085e-21 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 616875.0 | 419 | 1656512 | 4 | 9.5650e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (LM) | 1.022938e6 | 413 | 1639984 | 11 | 9.7576e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | LeastSquaresOptim (Dogleg) | 1.793679542e9 | 6108 | 11335456 | 500 | 4.6396e+02 | false | not_converged | NaN | not converged |
| 1024 | LeastSquaresOptim (LM) | 2.133236416e9 | 6077 | 10903824 | 500 | 4.6397e+02 | false | not_converged | NaN | not converged |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1024 | Optim (Newton) | 1.23175e6 | 521 | 4205600 | 4 | 8.5372e-20 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.0000575625e10 | 783103 | 37727008 | 98 | 3.9580e+02 | false | timeout | NaN | max\_time |
| 1024 | JSOSolvers (tron) | 3.0000856334e10 | 784154 | 37844128 | 4 | 4.1366e+02 | false | timeout | NaN | max\_time |
| 1024 | Ipopt | 5.140375e6 | 375 | 454864 | 2 | 1.9886e-46 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 1.4686542e7 | 957 | 682192 | 8 | 9.1699e-20 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 1024 | NonlinearSolve (LM) | 2.129899333e9 | 27996 | 289467376 | 163 | 6.5247e-16 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 2.3622705e6 | 3427 | 3521280 | 5 | 4.9101e-18 | true | ok | NaN | Success |
| 1024 | CaNNOLeS | 1.6648125e6 | 248 | 1405664 | 3 | 8.9525e-20 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 1.1269795e6 | 431 | 3181232 | 4 | 2.7584e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (LM) | 2.032e6 | 425 | 3148320 | 12 | 2.7509e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | LeastSquaresOptim (Dogleg) | 3.032515209e9 | 6096 | 11472992 | 500 | 9.8231e+02 | false | not_converged | NaN | not converged |
| 2048 | LeastSquaresOptim (LM) | 3.572985666e9 | 6053 | 10475920 | 500 | 9.8236e+02 | false | not_converged | NaN | not converged |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2048 | Optim (Newton) | 2.461083e6 | 526 | 7774080 | 4 | 2.8565e-18 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 3.0001104334e10 | 396871 | 19327136 | 27 | 9.0825e+02 | false | timeout | NaN | max\_time |
| 2048 | JSOSolvers (tron) | 3.000304925e10 | 394086 | 19326608 | 1 | 9.3035e+02 | false | timeout | NaN | max\_time |
| 2048 | Ipopt | 1.0437333e7 | 379 | 915984 | 2 | 3.7204e-44 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 3.8936417e7 | 945 | 1310864 | 8 | 2.9149e-18 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 2048 | NonlinearSolve (LM) | 8.673295292e9 | 29392 | 614032816 | 171 | 2.4514e-14 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 4.8590415e6 | 5780 | 6685904 | 6 | 2.5688e-17 | true | ok | NaN | Success |
| 2048 | CaNNOLeS | 4.1114165e6 | 250 | 2700032 | 3 | 2.9864e-18 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 2.1057295e6 | 431 | 6482864 | 4 | 9.7013e-17 | true | ok | NaN | abs\_dcost, step\_size |
| 4096 | SecondOrderOptimization (LM) | 4.1841255e6 | 425 | 6417184 | 13 | 9.9519e-17 | true | ok | NaN | step\_size |
| 4096 | LeastSquaresOptim (Dogleg) | 1.50191125e8 | 80 | 729472 | 2 | 2.0477e+03 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 5.366422292e9 | 5687 | 7927472 | 500 | 2.0119e+03 | false | not_converged | NaN | not converged |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 4096 | Optim (Newton) | 4.8846045e6 | 526 | 15959936 | 4 | 9.6838e-17 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 3.0004592375e10 | 136235 | 7093344 | 7 | 1.9504e+03 | false | timeout | NaN | max\_time |
| 4096 | JSOSolvers (tron) | 3.0007289292e10 | 132453 | 7179872 | 1 | 1.9660e+03 | false | timeout | NaN | max\_time |
| 4096 | Ipopt | 2.3608334e7 | 383 | 1846544 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 1.19281875e8 | 1037 | 2570096 | 9 | 9.4483e-17 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 4096 | NonlinearSolve (LM) | 3.0178457709e10 | 873 | 291017424 | 123 | 8.7835e-13 | false | timeout | NaN | MaxTime |
| 4096 | NonlinearSolve (TrustRegion) | 6.321075e7 | 10514 | 15642640 | 38 | 9.2716e-17 | true | ok | NaN | StalledSuccess |
| 4096 | CaNNOLeS | 1.128825e7 | 252 | 5288736 | 3 | 9.9773e-17 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 5.045646e6 | 431 | 12692944 | 6 | 3.2591e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (LM) | 9.766792e6 | 425 | 12561728 | 16 | 3.2773e-15 | true | ok | NaN | step\_size |
| 8192 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 8192 | LeastSquaresOptim (LM) | 2.6055e6 | 53 | 790240 | 1 | 4.0954e+03 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 8192 | Optim (Newton) | 1.53626665e7 | 777 | 44576528 | 6 | 3.1978e-15 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 3.00065765e10 | 33045 | 2699072 | 3 | 4.0431e+03 | false | timeout | NaN | max\_time |
| 8192 | JSOSolvers (tron) | 3.0024899e10 | 32871 | 3223232 | 1 | 4.0433e+03 | false | timeout | NaN | max\_time |
| 8192 | Ipopt | 5.01855415e7 | 393 | 3674448 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.3065713792e10 | 4609 | 5199632 | 500 | 1.3036e-01 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 8192 | NonlinearSolve (LM) | 3.0358960708e10 | 7110 | 532725232 | 38 | 3.1366e-11 | false | timeout | NaN | MaxTime |
| 8192 | NonlinearSolve (TrustRegion) | 2.07898708e8 | 19997 | 38850864 | 41 | 3.0111e-15 | true | ok | NaN | StalledSuccess |
| 8192 | CaNNOLeS | 2.6983125e7 | 254 | 10449728 | 3 | 3.1855e-15 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 1.1471917e7 | 432 | 25022896 | 7 | 4.2618e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (LM) | 2.2992625e7 | 426 | 24760608 | 19 | 1.2684e-13 | true | ok | NaN | step\_size |
| 16384 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 16384 | LeastSquaresOptim (LM) | 5.0990205e6 | 54 | 1577664 | 1 | 8.1914e+03 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 16384 | Optim (Newton) | 3.8772833e7 | 1070 | 114534720 | 8 | 1.1880e-13 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 3.0015303e10 | 10579 | 2734816 | 3 | 8.1629e+03 | false | timeout | NaN | max\_time |
| 16384 | JSOSolvers (tron) | 3.0070161792e10 | 10619 | 3801728 | 1 | 8.1629e+03 | false | timeout | NaN | max\_time |
| 16384 | Ipopt | 1.05261e8 | 403 | 7346384 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 2.9650812167e10 | 4618 | 10189296 | 500 | 4.1475e+00 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 16384 | NonlinearSolve (LM) | 3.1817589708e10 | 2422 | 284899568 | 10 | 8.1849e+03 | false | timeout | NaN | MaxTime |
| 16384 | NonlinearSolve (TrustRegion) | 4.40660375e8 | 38752 | 88982928 | 43 | 9.7876e-14 | true | ok | NaN | StalledSuccess |
| 16384 | CaNNOLeS | 6.798354583e9 | 1252 | 21081632 | 501 | 1.0151e-13 | false | not_converged | NaN | max\_iter |
| 32768 | SecondOrderOptimization (Dogleg) | 2.1506791e7 | 434 | 49699280 | 2 | 4.7013e+00 | true | ok | NaN | rel\_dcost, step\_size |
| 32768 | SecondOrderOptimization (LM) | 6.15458792e8 | 426 | 49322272 | 118 | 2.8234e-08 | true | ok | NaN | step\_size |
| 32768 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 32768 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32768 | Optim (Newton) | 8.2003209e7 | 799 | 233368224 | 5 | 5.9465e-08 | false | not_converged | NaN | not converged |
| 32768 | JSOSolvers (trunk) | 3.003542075e10 | 4599 | 4676000 | 3 | 1.6365e+04 | false | timeout | NaN | max\_time |
| 32768 | JSOSolvers (tron) | 3.0145978042e10 | 4671 | 6809408 | 1 | 1.6365e+04 | false | timeout | NaN | max\_time |
| 32768 | Ipopt | 2.08754167e8 | 407 | 14674192 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 3.0033923208e10 | 2610 | 20129040 | 249 | 1.4769e+04 | false | timeout | NaN | MAXIMUM\_WALLTIME\_EXCEEDED |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | CaNNOLeS | 1.38172325e10 | 1254 | 41545280 | 501 | 3.2323e-12 | false | not_converged | NaN | max\_iter |
