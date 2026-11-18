# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T02:36:25
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 3b3f450
- **Dependency Commits**: OptimizationVariableInterface cd7c159, SecondOrderOptimization 741d209, NLLSModel ebf8f1d

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 32 | NLLSModel (Sparse) | 220.23469387755102 | 1 | 16 | 1969.6363636363637 | 10 | 4256 |
| 32 | Standalone (Sparse) | 189.47169811320754 | 1 | 16 | 2453.125 | 20 | 7856 |
| 32 | NLPModels (MathOptNLSModel) | 5895.75 | 2 | 32 | 13333.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 352.01724137931035 | 1 | 16 | 3625.0 | 1 | 64 |
| 64 | Standalone (Sparse) | 312.8909090909091 | 1 | 16 | 3701.3333333333335 | 20 | 17200 |
| 64 | NLPModels (MathOptNLSModel) | 11083.0 | 2 | 32 | 32167.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 637.0967741935484 | 1 | 16 | 6020.75 | 1 | 64 |
| 128 | Standalone (Sparse) | 601.8611111111111 | 1 | 16 | 7444.333333333333 | 22 | 33584 |
| 128 | NLPModels (MathOptNLSModel) | 21667.0 | 2 | 32 | 52750.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 1284.3529411764705 | 1 | 16 | 12125.0 | 1 | 64 |
| 256 | Standalone (Sparse) | 1065.7894736842106 | 1 | 16 | 15292.0 | 24 | 67440 |
| 256 | NLPModels (MathOptNLSModel) | 42416.0 | 2 | 32 | 101333.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 2342.6666666666665 | 1 | 16 | 24833.0 | 1 | 64 |
| 512 | Standalone (Sparse) | 2078.6666666666665 | 1 | 16 | 27583.0 | 24 | 134256 |
| 512 | NLPModels (MathOptNLSModel) | 86958.0 | 2 | 32 | 202375.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 4916.8 | 1 | 16 | 49542.0 | 1 | 64 |
| 1024 | Standalone (Sparse) | 4125.0 | 1 | 16 | 55792.0 | 24 | 267920 |
| 1024 | NLPModels (MathOptNLSModel) | 167958.0 | 2 | 32 | 410083.0 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 9694.333333333334 | 1 | 16 | 95666.0 | 1 | 64 |
| 2048 | Standalone (Sparse) | 8444.333333333334 | 1 | 16 | 108458.0 | 25 | 502384 |
| 2048 | NLPModels (MathOptNLSModel) | 358708.0 | 2 | 32 | 1.367833e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 18459.0 | 1 | 16 | 190083.0 | 1 | 64 |
| 4096 | Standalone (Sparse) | 16375.0 | 1 | 16 | 208125.0 | 25 | 1020528 |
| 4096 | NLPModels (MathOptNLSModel) | 1.636833e6 | 2 | 32 | 4.052375e6 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 36750.0 | 1 | 16 | 382916.0 | 1 | 64 |
| 8192 | Standalone (Sparse) | 32791.0 | 1 | 16 | 418416.0 | 25 | 2007664 |
| 8192 | NLPModels (MathOptNLSModel) | 4.353917e6 | 2 | 32 | 1.1533042e7 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 74834.0 | 1 | 16 | 825083.0 | 1 | 64 |
| 16384 | Standalone (Sparse) | 68125.0 | 1 | 16 | 879250.0 | 25 | 3981936 |
| 16384 | NLPModels (MathOptNLSModel) | 1.07345e7 | 2 | 32 | 2.8725334e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 156792.0 | 1 | 16 | 1.520292e6 | 1 | 64 |
| 32768 | Standalone (Sparse) | 138583.0 | 1 | 16 | 1.725167e6 | 25 | 7897712 |
| 32768 | NLPModels (MathOptNLSModel) | 2.2859042e7 | 2 | 32 | 6.1959709e7 | 5 | 128 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 32 | SecondOrderOptimization (Dogleg) | 34000.0 | 185 | 88896 | 3 | 5.6402e-27 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 36062.5 | 190 | 92464 | 4 | 7.9500e-20 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 78353.5 | 106 | 72304 | 4 | 7.9506e-20 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 206500.0 | 139 | 22864 | 13 | 1.4747e-11 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 343792.0 | 187 | 34496 | 19 | 1.1774e-15 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32 | Optim (Newton) | 94000.0 | 355 | 103392 | 3 | 2.8725e-27 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 506834.0 | 617 | 39760 | 6 | 7.8113e-20 | false | not_converged | NaN | not\_desc |
| 32 | JSOSolvers (tron) | 785125.0 | 715 | 40832 | 4 | 2.2735e-21 | false | not_converged | NaN | small\_residual |
| 32 | Ipopt | 708104.0 | 390 | 30832 | 3 | 3.4854e-63 | true | ok | NaN | first\_order |
| 32 | MadNLP | 329708.5 | 578 | 67344 | 3 | 5.7856e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 477729.5 | 784 | 99504 | 17 | 9.5072e-20 | true | ok | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 109833.0 | 849 | 120032 | 5 | 1.5138e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 54625.0 | 180 | 48880 | 3 | 3.3924e-27 | true | ok | NaN | first\_order |
| 64 | SecondOrderOptimization (Dogleg) | 46188.0 | 226 | 101744 | 3 | 9.0812e-26 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (LM) | 57791.5 | 222 | 100576 | 5 | 1.0959e-18 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (LM, tall) | 337250.5 | 106 | 241456 | 5 | 1.0960e-18 | true | ok | NaN | grad\_tol |
| 64 | LeastSquaresOptim (Dogleg) | 3.028825e7 | 5035 | 2512096 | 500 | 8.4437e-03 | false | not_converged | NaN | not converged |
| 64 | LeastSquaresOptim (LM) | 2.6473125e6 | 297 | 131872 | 27 | 8.3599e-14 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 64 | Optim (Newton) | 122125.0 | 359 | 203744 | 3 | 1.0023e-25 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 2.570875e6 | 1467 | 84912 | 7 | 5.2143e-22 | false | not_converged | NaN | not\_desc |
| 64 | JSOSolvers (tron) | 7.527541e6 | 3559 | 188656 | 13 | 6.3499e-17 | false | not_converged | NaN | small\_step |
| 64 | Ipopt | 681562.0 | 338 | 49680 | 2 | 3.8541e-47 | true | ok | NaN | first\_order |
| 64 | MadNLP | 501770.5 | 580 | 87536 | 3 | 1.1280e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 1.5404375e6 | 791 | 221264 | 20 | 4.0677e-21 | true | ok | NaN | Success |
| 64 | NonlinearSolve (TrustRegion) | 123312.0 | 861 | 230960 | 5 | 2.9639e-18 | true | ok | NaN | Success |
| 64 | CaNNOLeS | 93583.0 | 194 | 97008 | 3 | 9.6264e-26 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 94270.5 | 240 | 195216 | 4 | 2.3553e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM) | 126083.5 | 234 | 191840 | 7 | 3.5241e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM, tall) | 2.621604e6 | 110 | 780624 | 7 | 2.8865e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | LeastSquaresOptim (Dogleg) | 1.05092792e8 | 5035 | 2527168 | 500 | 1.6872e+01 | false | not_converged | NaN | not converged |
| 128 | LeastSquaresOptim (LM) | 2.25656917e8 | 5335 | 8514864 | 443 | 1.1009e-09 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 128 | Optim (Newton) | 232104.0 | 477 | 505984 | 4 | 2.9738e-24 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 2.0767292e7 | 4457 | 237680 | 8 | 4.9369e-18 | false | not_converged | NaN | not\_desc |
| 128 | JSOSolvers (tron) | 1.296027708e9 | 259829 | 12503280 | 12 | 1.1094e-16 | false | not_converged | NaN | small\_step |
| 128 | Ipopt | 921770.5 | 349 | 69744 | 2 | 7.4496e-46 | true | ok | NaN | first\_order |
| 128 | MadNLP | 753729.5 | 591 | 127184 | 3 | 2.2634e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 6.0419165e6 | 811 | 499856 | 22 | 2.2726e-19 | true | ok | NaN | Success |
| 128 | NonlinearSolve (TrustRegion) | 191125.0 | 894 | 323312 | 4 | 3.0086e-17 | true | ok | NaN | Success |
| 128 | CaNNOLeS | 189250.0 | 217 | 174944 | 3 | 2.6889e-24 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 205979.0 | 287 | 386592 | 4 | 1.0706e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (LM) | 282458.0 | 278 | 380240 | 8 | 1.2124e-22 | true | ok | NaN | step\_size |
| 256 | SecondOrderOptimization (LM, tall) | 2.20885e7 | 134 | 2818672 | 8 | 9.2329e-23 | true | ok | NaN | step\_size |
| 256 | LeastSquaresOptim (Dogleg) | 3.87736e8 | 6048 | 9732064 | 500 | 8.4444e+01 | false | not_converged | NaN | not converged |
| 256 | LeastSquaresOptim (LM) | 9.43141667e8 | 6033 | 9654480 | 500 | 2.5926e+01 | false | not_converged | NaN | not converged |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 256 | Optim (Newton) | 374333.0 | 505 | 1004416 | 4 | 8.2267e-23 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 4.107714916e9 | 422824 | 20335344 | 208 | 2.5351e-17 | false | not_converged | NaN | not\_desc |
| 256 | JSOSolvers (tron) | 3.0000088292e10 | 3070738 | 147445760 | 62 | 1.9060e-12 | false | timeout | NaN | max\_time |
| 256 | Ipopt | 1.37325e6 | 369 | 138704 | 2 | 1.2199e-51 | true | ok | NaN | first\_order |
| 256 | MadNLP | 1.143479e6 | 621 | 204128 | 3 | 5.0789e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 2.65523335e7 | 862 | 1526416 | 25 | 9.5562e-19 | true | ok | NaN | Success |
| 256 | NonlinearSolve (TrustRegion) | 342541.5 | 960 | 568320 | 5 | 7.3379e-18 | true | ok | NaN | Success |
| 256 | CaNNOLeS | 361646.0 | 240 | 352864 | 3 | 9.7289e-23 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 355479.5 | 287 | 759328 | 4 | 2.5649e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 512 | SecondOrderOptimization (LM) | 575187.5 | 281 | 750992 | 9 | 4.0273e-21 | true | ok | NaN | step\_size |
| 512 | SecondOrderOptimization (LM, tall) | 2.6702705e6 | 514 | 2293936 | 9 | 3.8058e-21 | true | ok | NaN | step\_size |
| 512 | LeastSquaresOptim (Dogleg) | 1.113275667e9 | 6048 | 9774688 | 500 | 2.0403e+02 | false | not_converged | NaN | not converged |
| 512 | LeastSquaresOptim (LM) | 1.189316084e9 | 6125 | 12003088 | 500 | 2.0331e+02 | false | not_converged | NaN | not converged |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 512 | Optim (Newton) | 690833.5 | 1121 | 2004736 | 4 | 2.5808e-21 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 3.0000276125e10 | 1557409 | 74824064 | 382 | 2.4178e+01 | false | timeout | NaN | max\_time |
| 512 | JSOSolvers (tron) | 3.0000353834e10 | 1560278 | 74995136 | 16 | 1.1026e+01 | false | timeout | NaN | max\_time |
| 512 | Ipopt | 2.5322915e6 | 371 | 283760 | 2 | 1.6725e-50 | true | ok | NaN | first\_order |
| 512 | MadNLP | 1.9369165e6 | 633 | 362384 | 3 | 3.4618e-21 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 9.38769785e7 | 5542 | 25259344 | 27 | 2.9581e-17 | true | ok | NaN | Success |
| 512 | NonlinearSolve (TrustRegion) | 578729.5 | 971 | 1109104 | 6 | 4.5388e-20 | true | ok | NaN | Success |
| 512 | CaNNOLeS | 680645.5 | 248 | 725728 | 3 | 3.4085e-21 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 655916.5 | 291 | 1582592 | 4 | 9.5650e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (LM) | 1.285354e6 | 285 | 1566064 | 11 | 8.5848e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (LM, tall) | 6.4058335e6 | 586 | 5037776 | 11 | 8.9791e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | LeastSquaresOptim (Dogleg) | 1.771292916e9 | 6108 | 11335456 | 500 | 4.6396e+02 | false | not_converged | NaN | not converged |
| 1024 | LeastSquaresOptim (LM) | 2.082942e9 | 6077 | 10903824 | 500 | 4.6397e+02 | false | not_converged | NaN | not converged |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1024 | Optim (Newton) | 1.1856665e6 | 521 | 4205600 | 4 | 8.5372e-20 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.0000252083e10 | 796641 | 38376832 | 100 | 3.9539e+02 | false | timeout | NaN | max\_time |
| 1024 | JSOSolvers (tron) | 3.0000775167e10 | 801937 | 38697712 | 5 | 4.1292e+02 | false | timeout | NaN | max\_time |
| 1024 | Ipopt | 4.496042e6 | 375 | 454864 | 2 | 1.9886e-46 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 1.458125e7 | 957 | 682192 | 8 | 9.1699e-20 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 1024 | NonlinearSolve (LM) | 2.104316708e9 | 28020 | 289467760 | 163 | 6.5247e-16 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 2.299646e6 | 3427 | 3521280 | 5 | 4.9101e-18 | true | ok | NaN | Success |
| 1024 | CaNNOLeS | 1.4658955e6 | 248 | 1405664 | 3 | 8.9525e-20 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 1.296e6 | 295 | 2975232 | 4 | 2.7584e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (LM) | 2.6338335e6 | 289 | 2942320 | 12 | 2.8708e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (LM, tall) | 1.34816045e7 | 622 | 10549056 | 12 | 3.0229e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | LeastSquaresOptim (Dogleg) | 2.994951958e9 | 6096 | 11472992 | 500 | 9.8231e+02 | false | not_converged | NaN | not converged |
| 2048 | LeastSquaresOptim (LM) | 3.565613417e9 | 6053 | 10475920 | 500 | 9.8236e+02 | false | not_converged | NaN | not converged |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2048 | Optim (Newton) | 2.3319585e6 | 526 | 7774080 | 4 | 2.8565e-18 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 3.0001063041e10 | 403881 | 19663616 | 27 | 9.0796e+02 | false | timeout | NaN | max\_time |
| 2048 | JSOSolvers (tron) | 3.0002076917e10 | 406443 | 19919744 | 2 | 9.2960e+02 | false | timeout | NaN | max\_time |
| 2048 | Ipopt | 9.4641255e6 | 379 | 915984 | 2 | 3.7204e-44 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 3.2123042e7 | 945 | 1310864 | 8 | 2.9149e-18 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 2048 | NonlinearSolve (LM) | 8.59824675e9 | 29442 | 614033616 | 171 | 2.4514e-14 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 4.797604e6 | 5780 | 6685904 | 6 | 2.5688e-17 | true | ok | NaN | Success |
| 2048 | CaNNOLeS | 3.8069795e6 | 250 | 2700032 | 3 | 2.9864e-18 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 2.574667e6 | 295 | 6080256 | 4 | 9.7013e-17 | true | ok | NaN | abs\_dcost, step\_size |
| 4096 | SecondOrderOptimization (LM) | 5.8858955e6 | 289 | 6014576 | 13 | 9.6078e-17 | true | ok | NaN | abs\_dcost, step\_size |
| 4096 | SecondOrderOptimization (LM, tall) | 2.9170917e7 | 658 | 21910832 | 13 | 9.5985e-17 | true | ok | NaN | step\_size |
| 4096 | LeastSquaresOptim (Dogleg) | 1.45414583e8 | 80 | 729472 | 2 | 2.0477e+03 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 5.667840541e9 | 5687 | 7927472 | 500 | 2.0119e+03 | false | not_converged | NaN | not converged |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 4096 | Optim (Newton) | 4.6265e6 | 526 | 15959936 | 4 | 9.6838e-17 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 3.000269825e10 | 145537 | 7541632 | 7 | 1.9494e+03 | false | timeout | NaN | max\_time |
| 4096 | JSOSolvers (tron) | 3.0006187708e10 | 146091 | 7834496 | 1 | 1.9640e+03 | false | timeout | NaN | max\_time |
| 4096 | Ipopt | 2.17333125e7 | 383 | 1846544 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 1.11597125e8 | 1037 | 2570096 | 9 | 9.4483e-17 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 4096 | NonlinearSolve (LM) | 3.0101655167e10 | 873 | 291017424 | 125 | 8.7806e-13 | false | timeout | NaN | MaxTime |
| 4096 | NonlinearSolve (TrustRegion) | 6.2669583e7 | 10514 | 15642640 | 38 | 9.2716e-17 | true | ok | NaN | StalledSuccess |
| 4096 | CaNNOLeS | 9.4716045e6 | 252 | 5288736 | 3 | 9.9773e-17 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 6.4839795e6 | 295 | 11897120 | 6 | 3.2591e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (LM) | 1.3285771e7 | 289 | 11765904 | 16 | 3.0995e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (LM, tall) | 6.3868896e7 | 694 | 44832608 | 14 | 3.0357e-15 | true | ok | NaN | step\_size |
| 8192 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 8192 | LeastSquaresOptim (LM) | 2.5169165e6 | 53 | 790240 | 1 | 4.0954e+03 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 8192 | Optim (Newton) | 1.5002083e7 | 742 | 44575968 | 6 | 3.1978e-15 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 3.0006811083e10 | 34781 | 2782400 | 3 | 4.0416e+03 | false | timeout | NaN | max\_time |
| 8192 | JSOSolvers (tron) | 3.0023694292e10 | 34508 | 3301808 | 1 | 4.0420e+03 | false | timeout | NaN | max\_time |
| 8192 | Ipopt | 4.8285291e7 | 393 | 3674448 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.2586377875e10 | 4609 | 5199632 | 500 | 1.3036e-01 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 8192 | NonlinearSolve (LM) | 3.0111103208e10 | 7090 | 532724912 | 38 | 3.1366e-11 | false | timeout | NaN | MaxTime |
| 8192 | NonlinearSolve (TrustRegion) | 2.09681583e8 | 19997 | 38850864 | 41 | 3.0111e-15 | true | ok | NaN | StalledSuccess |
| 8192 | CaNNOLeS | 2.5190146e7 | 254 | 10449728 | 3 | 3.1855e-15 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 1.450725e7 | 296 | 23440640 | 7 | 4.2558e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (LM) | 3.09100835e7 | 290 | 23178352 | 19 | 1.3348e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (LM, tall) | 1.423522705e8 | 732 | 95998736 | 15 | 1.0026e-13 | true | ok | NaN | step\_size |
| 16384 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 16384 | LeastSquaresOptim (LM) | 4.88925e6 | 54 | 1577664 | 1 | 8.1914e+03 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 16384 | Optim (Newton) | 3.8148917e7 | 1006 | 114533696 | 8 | 1.1880e-13 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 3.0015921292e10 | 13447 | 2872480 | 3 | 8.1590e+03 | false | timeout | NaN | max\_time |
| 16384 | JSOSolvers (tron) | 3.0057266208e10 | 13219 | 3926528 | 1 | 8.1595e+03 | false | timeout | NaN | max\_time |
| 16384 | Ipopt | 1.04142375e8 | 403 | 7346384 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 2.7402082e10 | 4618 | 10189296 | 500 | 4.1475e+00 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 16384 | NonlinearSolve (LM) | 3.1238490875e10 | 2408 | 312129552 | 10 | 8.1849e+03 | false | timeout | NaN | MaxTime |
| 16384 | NonlinearSolve (TrustRegion) | 4.31918709e8 | 38754 | 88982960 | 43 | 9.7876e-14 | true | ok | NaN | StalledSuccess |
| 16384 | CaNNOLeS | 6.837051084e9 | 1252 | 21081632 | 501 | 1.0151e-13 | false | not_converged | NaN | max\_iter |
| 32768 | SecondOrderOptimization (Dogleg) | 6.292202705e8 | 296 | 49853696 | 158 | 2.4787e-07 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 32768 | SecondOrderOptimization (LM) | 5.91314458e8 | 290 | 49329264 | 134 | 5.0237e-11 | true | ok | NaN | step\_size |
| 32768 | SecondOrderOptimization (LM, tall) | 4.21977625e8 | 804 | 205136624 | 17 | 3.1595e-12 | true | ok | NaN | step\_size |
| 32768 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 32768 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32768 | Optim (Newton) | 8.0024042e7 | 800 | 244574896 | 5 | 5.9465e-08 | false | not_converged | NaN | not converged |
| 32768 | JSOSolvers (trunk) | 3.0042538959e10 | 4685 | 4680128 | 3 | 1.6365e+04 | false | timeout | NaN | max\_time |
| 32768 | JSOSolvers (tron) | 3.0142833083e10 | 4759 | 6813632 | 1 | 1.6365e+04 | false | timeout | NaN | max\_time |
| 32768 | Ipopt | 2.04828125e8 | 407 | 14674192 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 3.0104849625e10 | 2722 | 20131280 | 263 | 1.4768e+04 | false | timeout | NaN | MAXIMUM\_WALLTIME\_EXCEEDED |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | CaNNOLeS | 1.376840625e10 | 1254 | 42004032 | 501 | 3.2323e-12 | false | not_converged | NaN | max\_iter |
