# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T01:48:38
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
| 32 | NLLSModel (Sparse) | 252.22340425531914 | 1 | 16 | 1991.7 | 10 | 4256 |
| 32 | Standalone (Sparse) | 195.79611650485438 | 1 | 16 | 2479.125 | 20 | 7856 |
| 32 | NLPModels (MathOptNLSModel) | 5687.5 | 2 | 32 | 13375.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 397.64912280701753 | 1 | 16 | 3142.8571428571427 | 1 | 64 |
| 64 | Standalone (Sparse) | 312.18461538461537 | 1 | 16 | 3743.1666666666665 | 20 | 17200 |
| 64 | NLPModels (MathOptNLSModel) | 11125.0 | 2 | 32 | 25917.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 694.0 | 1 | 16 | 5968.75 | 1 | 64 |
| 128 | Standalone (Sparse) | 563.6666666666666 | 1 | 16 | 7569.666666666667 | 22 | 33584 |
| 128 | NLPModels (MathOptNLSModel) | 21625.0 | 2 | 32 | 51541.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 892.375 | 3 | 48 | 12458.0 | 1 | 64 |
| 256 | Standalone (Sparse) | 1065.7894736842106 | 1 | 16 | 14708.0 | 24 | 67440 |
| 256 | NLPModels (MathOptNLSModel) | 42416.0 | 2 | 32 | 101750.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 971.0 | 3 | 48 | 25333.0 | 1 | 64 |
| 512 | Standalone (Sparse) | 2070.9 | 1 | 16 | 27667.0 | 24 | 134256 |
| 512 | NLPModels (MathOptNLSModel) | 84209.0 | 2 | 32 | 204250.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 1452.4285714285713 | 3 | 48 | 30666.0 | 1 | 64 |
| 1024 | Standalone (Sparse) | 4250.0 | 1 | 16 | 55792.0 | 24 | 267920 |
| 1024 | NLPModels (MathOptNLSModel) | 169833.0 | 2 | 32 | 408625.0 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 2166.8 | 3 | 48 | 37166.0 | 1 | 64 |
| 2048 | Standalone (Sparse) | 8708.333333333334 | 1 | 16 | 107750.0 | 25 | 502384 |
| 2048 | NLPModels (MathOptNLSModel) | 392000.0 | 2 | 32 | 1.076834e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 3201.3333333333335 | 3 | 48 | 71042.0 | 1 | 64 |
| 4096 | Standalone (Sparse) | 17417.0 | 1 | 16 | 210417.0 | 25 | 1020528 |
| 4096 | NLPModels (MathOptNLSModel) | 1.233e6 | 2 | 32 | 3.194667e6 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 5834.0 | 3 | 48 | 147250.0 | 1 | 64 |
| 8192 | Standalone (Sparse) | 32750.0 | 1 | 16 | 441208.0 | 25 | 2007664 |
| 8192 | NLPModels (MathOptNLSModel) | 3.50125e6 | 2 | 32 | 8.735625e6 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 10750.0 | 3 | 48 | 258917.0 | 1 | 64 |
| 16384 | Standalone (Sparse) | 65250.0 | 1 | 16 | 843541.0 | 25 | 3981936 |
| 16384 | NLPModels (MathOptNLSModel) | 9.784916e6 | 2 | 32 | 2.5930417e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 20541.0 | 3 | 48 | 721791.0 | 1 | 64 |
| 32768 | Standalone (Sparse) | 130292.0 | 1 | 16 | 1.709e6 | 25 | 7897712 |
| 32768 | NLPModels (MathOptNLSModel) | 2.2115666e7 | 2 | 32 | 5.9541709e7 | 5 | 128 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 32 | SecondOrderOptimization (Dogleg) | 30749.5 | 185 | 88896 | 3 | 5.6402e-27 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 37666.5 | 190 | 92464 | 4 | 7.9500e-20 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 75146.0 | 106 | 72304 | 4 | 7.9506e-20 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 202583.5 | 139 | 22864 | 13 | 1.4747e-11 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 339812.5 | 187 | 34496 | 19 | 1.1774e-15 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32 | Optim (Newton) | 95896.0 | 355 | 103392 | 3 | 2.8725e-27 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 482542.0 | 617 | 39760 | 6 | 7.8113e-20 | false | not_converged | NaN | not\_desc |
| 32 | JSOSolvers (tron) | 737375.0 | 715 | 40832 | 4 | 2.2735e-21 | false | not_converged | NaN | small\_residual |
| 32 | Ipopt | 678000.5 | 390 | 30832 | 3 | 3.4854e-63 | true | ok | NaN | first\_order |
| 32 | MadNLP | 317396.0 | 578 | 67344 | 3 | 5.7856e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 453479.5 | 784 | 99504 | 17 | 9.5072e-20 | true | ok | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 106625.0 | 849 | 120032 | 5 | 1.5138e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 52833.0 | 180 | 48880 | 3 | 3.3924e-27 | true | ok | NaN | first\_order |
| 64 | SecondOrderOptimization (Dogleg) | 69729.5 | 226 | 101744 | 3 | 9.0812e-26 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (LM) | 56667.0 | 222 | 100576 | 5 | 1.0959e-18 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (LM, tall) | 322708.5 | 106 | 241456 | 5 | 1.0960e-18 | true | ok | NaN | grad\_tol |
| 64 | LeastSquaresOptim (Dogleg) | 2.9083167e7 | 5035 | 2512096 | 500 | 8.4437e-03 | false | not_converged | NaN | not converged |
| 64 | LeastSquaresOptim (LM) | 2.557125e6 | 297 | 131872 | 27 | 8.3599e-14 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 64 | Optim (Newton) | 134521.0 | 359 | 203744 | 3 | 1.0023e-25 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 2.59025e6 | 1467 | 84912 | 7 | 5.2143e-22 | false | not_converged | NaN | not\_desc |
| 64 | JSOSolvers (tron) | 7.141166e6 | 3559 | 188656 | 13 | 6.3499e-17 | false | not_converged | NaN | small\_step |
| 64 | Ipopt | 699812.0 | 338 | 49680 | 2 | 3.8541e-47 | true | ok | NaN | first\_order |
| 64 | MadNLP | 499791.5 | 580 | 87536 | 3 | 1.1280e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 1.5425835e6 | 791 | 221264 | 20 | 4.0677e-21 | true | ok | NaN | Success |
| 64 | NonlinearSolve (TrustRegion) | 125250.5 | 861 | 230960 | 5 | 2.9639e-18 | true | ok | NaN | Success |
| 64 | CaNNOLeS | 93792.0 | 194 | 97008 | 3 | 9.6264e-26 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 94228.5 | 240 | 195216 | 4 | 2.3553e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM) | 125896.0 | 234 | 191840 | 7 | 3.5241e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM, tall) | 2.5716455e6 | 110 | 780624 | 7 | 2.8865e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | LeastSquaresOptim (Dogleg) | 1.03678e8 | 5035 | 2527168 | 500 | 1.6872e+01 | false | not_converged | NaN | not converged |
| 128 | LeastSquaresOptim (LM) | 2.20285916e8 | 5335 | 8514864 | 443 | 1.1009e-09 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 128 | Optim (Newton) | 258500.0 | 477 | 505984 | 4 | 2.9738e-24 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 1.9989667e7 | 4457 | 237680 | 8 | 4.9369e-18 | false | not_converged | NaN | not\_desc |
| 128 | JSOSolvers (tron) | 1.269765833e9 | 259829 | 12503280 | 12 | 1.1094e-16 | false | not_converged | NaN | small\_step |
| 128 | Ipopt | 933708.0 | 349 | 69744 | 2 | 7.4496e-46 | true | ok | NaN | first\_order |
| 128 | MadNLP | 758937.0 | 591 | 127184 | 3 | 2.2634e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 6.067917e6 | 811 | 499856 | 22 | 2.2726e-19 | true | ok | NaN | Success |
| 128 | NonlinearSolve (TrustRegion) | 213541.5 | 894 | 323312 | 4 | 3.0086e-17 | true | ok | NaN | Success |
| 128 | CaNNOLeS | 186812.5 | 217 | 174944 | 3 | 2.6889e-24 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 202770.5 | 287 | 386592 | 4 | 1.0706e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (LM) | 295541.5 | 278 | 380240 | 8 | 1.2124e-22 | true | ok | NaN | step\_size |
| 256 | SecondOrderOptimization (LM, tall) | 2.1704041e7 | 134 | 2818736 | 8 | 9.2329e-23 | true | ok | NaN | step\_size |
| 256 | LeastSquaresOptim (Dogleg) | 3.80493417e8 | 6048 | 9732064 | 500 | 8.4444e+01 | false | not_converged | NaN | not converged |
| 256 | LeastSquaresOptim (LM) | 9.18403959e8 | 6033 | 9654480 | 500 | 2.5926e+01 | false | not_converged | NaN | not converged |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 256 | Optim (Newton) | 406271.0 | 505 | 1004416 | 4 | 8.2267e-23 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 4.06451375e9 | 422824 | 20335344 | 208 | 2.5351e-17 | false | not_converged | NaN | not\_desc |
| 256 | JSOSolvers (tron) | 3.0000171125e10 | 3122689 | 149923024 | 63 | 1.6204e-12 | false | timeout | NaN | max\_time |
| 256 | Ipopt | 1.3997085e6 | 369 | 138704 | 2 | 1.2199e-51 | true | ok | NaN | first\_order |
| 256 | MadNLP | 1.156792e6 | 621 | 204128 | 3 | 5.0789e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 2.5742125e7 | 862 | 1526416 | 25 | 9.5562e-19 | true | ok | NaN | Success |
| 256 | NonlinearSolve (TrustRegion) | 327188.0 | 960 | 568320 | 5 | 7.3379e-18 | true | ok | NaN | Success |
| 256 | CaNNOLeS | 363125.0 | 240 | 352864 | 3 | 9.7289e-23 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 365125.0 | 287 | 759328 | 4 | 2.5649e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 512 | SecondOrderOptimization (LM) | 559000.0 | 281 | 750992 | 9 | 4.0273e-21 | true | ok | NaN | step\_size |
| 512 | SecondOrderOptimization (LM, tall) | 2.5586665e6 | 514 | 2294128 | 9 | 3.8058e-21 | true | ok | NaN | step\_size |
| 512 | LeastSquaresOptim (Dogleg) | 1.097639834e9 | 6048 | 9774688 | 500 | 2.0403e+02 | false | not_converged | NaN | not converged |
| 512 | LeastSquaresOptim (LM) | 1.174870291e9 | 6125 | 12003088 | 500 | 2.0331e+02 | false | not_converged | NaN | not converged |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 512 | Optim (Newton) | 672958.5 | 521 | 1995136 | 4 | 2.5808e-21 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 3.0000089375e10 | 1594231 | 76591520 | 391 | 2.2953e+01 | false | timeout | NaN | max\_time |
| 512 | JSOSolvers (tron) | 3.00003575e10 | 1590721 | 76447696 | 17 | 1.0623e+01 | false | timeout | NaN | max\_time |
| 512 | Ipopt | 2.3678125e6 | 371 | 283760 | 2 | 1.6725e-50 | true | ok | NaN | first\_order |
| 512 | MadNLP | 1.976167e6 | 633 | 362384 | 3 | 3.4618e-21 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 9.2090125e7 | 5123 | 25252640 | 27 | 2.9581e-17 | true | ok | NaN | Success |
| 512 | NonlinearSolve (TrustRegion) | 574750.0 | 971 | 1109104 | 6 | 4.5388e-20 | true | ok | NaN | Success |
| 512 | CaNNOLeS | 694916.5 | 248 | 725728 | 3 | 3.4085e-21 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 607646.0 | 414 | 1656208 | 4 | 9.5650e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (LM) | 990458.5 | 408 | 1639680 | 11 | 9.7576e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (LM, tall) | 6.0195835e6 | 586 | 5038000 | 11 | 8.9791e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | LeastSquaresOptim (Dogleg) | 1.759354583e9 | 6108 | 11335456 | 500 | 4.6396e+02 | false | not_converged | NaN | not converged |
| 1024 | LeastSquaresOptim (LM) | 2.105252125e9 | 6077 | 10903824 | 500 | 4.6397e+02 | false | not_converged | NaN | not converged |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1024 | Optim (Newton) | 1.2016665e6 | 521 | 4205600 | 4 | 8.5372e-20 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.0000224875e10 | 804975 | 38776864 | 101 | 3.9520e+02 | false | timeout | NaN | max\_time |
| 1024 | JSOSolvers (tron) | 3.0000796083e10 | 802963 | 38746960 | 5 | 4.1291e+02 | false | timeout | NaN | max\_time |
| 1024 | Ipopt | 4.544854e6 | 375 | 454864 | 2 | 1.9886e-46 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 1.4554708e7 | 957 | 682192 | 8 | 9.1699e-20 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 1024 | NonlinearSolve (LM) | 2.129399959e9 | 28180 | 289470320 | 163 | 6.5247e-16 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 2.30375e6 | 3427 | 3521280 | 5 | 4.9101e-18 | true | ok | NaN | Success |
| 1024 | CaNNOLeS | 1.503875e6 | 248 | 1405664 | 3 | 8.9525e-20 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 1.0801045e6 | 424 | 3181120 | 4 | 2.7584e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (LM) | 1.9905835e6 | 418 | 3148208 | 12 | 2.7509e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (LM, tall) | 1.3060396e7 | 622 | 10549280 | 12 | 3.0229e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | LeastSquaresOptim (Dogleg) | 2.980041208e9 | 6096 | 11472992 | 500 | 9.8231e+02 | false | not_converged | NaN | not converged |
| 2048 | LeastSquaresOptim (LM) | 3.570704542e9 | 6053 | 10475920 | 500 | 9.8236e+02 | false | not_converged | NaN | not converged |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2048 | Optim (Newton) | 2.3154375e6 | 526 | 7774080 | 4 | 2.8565e-18 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 3.0001106541e10 | 401631 | 19555616 | 27 | 9.0808e+02 | false | timeout | NaN | max\_time |
| 2048 | JSOSolvers (tron) | 3.0002729625e10 | 391392 | 19197296 | 1 | 9.3059e+02 | false | timeout | NaN | max\_time |
| 2048 | Ipopt | 9.7161455e6 | 379 | 915984 | 2 | 3.7204e-44 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 5.5622792e7 | 945 | 1310864 | 8 | 2.9149e-18 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 2048 | NonlinearSolve (LM) | 8.852324708e9 | 29400 | 614032944 | 171 | 2.4514e-14 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 4.8955415e6 | 5780 | 6685904 | 6 | 2.5688e-17 | true | ok | NaN | Success |
| 2048 | CaNNOLeS | 3.8421665e6 | 250 | 2700032 | 3 | 2.9864e-18 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 2.1122085e6 | 424 | 6482752 | 4 | 9.7013e-17 | true | ok | NaN | abs\_dcost, step\_size |
| 4096 | SecondOrderOptimization (LM) | 4.1631255e6 | 418 | 6417072 | 13 | 9.9519e-17 | true | ok | NaN | step\_size |
| 4096 | SecondOrderOptimization (LM, tall) | 2.8615708e7 | 658 | 21911056 | 13 | 9.5985e-17 | true | ok | NaN | step\_size |
| 4096 | LeastSquaresOptim (Dogleg) | 1.526795e8 | 80 | 729472 | 2 | 2.0477e+03 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 5.485433084e9 | 5687 | 7927472 | 500 | 2.0119e+03 | false | not_converged | NaN | not converged |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 4096 | Optim (Newton) | 4.8622505e6 | 526 | 15959936 | 4 | 9.6838e-17 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 3.0002571125e10 | 130099 | 6800608 | 6 | 1.9515e+03 | false | timeout | NaN | max\_time |
| 4096 | JSOSolvers (tron) | 3.0006874584e10 | 144493 | 7757792 | 1 | 1.9644e+03 | false | timeout | NaN | max\_time |
| 4096 | Ipopt | 2.2293458e7 | 383 | 1846544 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 1.09087417e8 | 1037 | 2570096 | 9 | 9.4483e-17 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 4096 | NonlinearSolve (LM) | 3.0147964209e10 | 873 | 291017424 | 124 | 8.7835e-13 | false | timeout | NaN | MaxTime |
| 4096 | NonlinearSolve (TrustRegion) | 6.272975e7 | 10602 | 15644048 | 38 | 9.2716e-17 | true | ok | NaN | StalledSuccess |
| 4096 | CaNNOLeS | 9.627104e6 | 252 | 5288736 | 3 | 9.9773e-17 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 5.0272295e6 | 424 | 12692832 | 6 | 3.2591e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (LM) | 9.542625e6 | 418 | 12561616 | 16 | 3.2773e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (LM, tall) | 7.2221084e7 | 694 | 44832832 | 14 | 3.0357e-15 | true | ok | NaN | step\_size |
| 8192 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 8192 | LeastSquaresOptim (LM) | 2.5223125e6 | 53 | 790240 | 1 | 4.0954e+03 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 8192 | Optim (Newton) | 1.5257646e7 | 742 | 44575968 | 6 | 3.1978e-15 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 3.0006282833e10 | 36039 | 2842784 | 3 | 4.0406e+03 | false | timeout | NaN | max\_time |
| 8192 | JSOSolvers (tron) | 3.0022631292e10 | 35694 | 3358736 | 1 | 4.0420e+03 | false | timeout | NaN | max\_time |
| 8192 | Ipopt | 4.7388709e7 | 393 | 3674448 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.2115022667e10 | 4609 | 5199632 | 500 | 1.3036e-01 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 8192 | NonlinearSolve (LM) | 3.0010153458e10 | 7106 | 532725168 | 38 | 3.1366e-11 | false | timeout | NaN | MaxTime |
| 8192 | NonlinearSolve (TrustRegion) | 2.08070167e8 | 19997 | 38850864 | 41 | 3.0111e-15 | true | ok | NaN | StalledSuccess |
| 8192 | CaNNOLeS | 2.4194271e7 | 254 | 10449728 | 3 | 3.1855e-15 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 1.1060146e7 | 425 | 25022784 | 7 | 4.2618e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (LM) | 2.1866396e7 | 419 | 24760496 | 19 | 1.2684e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (LM, tall) | 1.48181791e8 | 732 | 95998960 | 15 | 1.0026e-13 | true | ok | NaN | step\_size |
| 16384 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 16384 | LeastSquaresOptim (LM) | 4.889646e6 | 54 | 1577664 | 1 | 8.1914e+03 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 16384 | Optim (Newton) | 3.8783917e7 | 998 | 114533568 | 8 | 1.1880e-13 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 3.0014031125e10 | 13961 | 2897152 | 3 | 8.1584e+03 | false | timeout | NaN | max\_time |
| 16384 | JSOSolvers (tron) | 3.0057946208e10 | 13059 | 3918848 | 1 | 8.1597e+03 | false | timeout | NaN | max\_time |
| 16384 | Ipopt | 1.01423083e8 | 403 | 7346384 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 2.8109413625e10 | 4618 | 10189296 | 500 | 4.1475e+00 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 16384 | NonlinearSolve (LM) | 3.1424041458e10 | 2410 | 306362416 | 10 | 8.1849e+03 | false | timeout | NaN | MaxTime |
| 16384 | NonlinearSolve (TrustRegion) | 4.51148166e8 | 38756 | 88982992 | 43 | 9.7876e-14 | true | ok | NaN | StalledSuccess |
| 16384 | CaNNOLeS | 6.475969875e9 | 1254 | 21081664 | 501 | 1.0151e-13 | false | not_converged | NaN | max\_iter |
| 32768 | SecondOrderOptimization (Dogleg) | 5.07164e8 | 425 | 50075968 | 158 | 2.4787e-07 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 32768 | SecondOrderOptimization (LM) | 5.94356854e8 | 419 | 49469616 | 166 | 4.1247e-11 | true | ok | NaN | step\_size |
| 32768 | SecondOrderOptimization (LM, tall) | 3.21363979e8 | 804 | 205136848 | 17 | 3.1595e-12 | true | ok | NaN | step\_size |
| 32768 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 32768 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32768 | Optim (Newton) | 8.8671583e7 | 800 | 232090288 | 5 | 5.9465e-08 | false | not_converged | NaN | not converged |
| 32768 | JSOSolvers (trunk) | 3.0040730375e10 | 4757 | 4683584 | 3 | 1.6365e+04 | false | timeout | NaN | max\_time |
| 32768 | JSOSolvers (tron) | 3.0142206333e10 | 4846 | 6817520 | 1 | 1.6365e+04 | false | timeout | NaN | max\_time |
| 32768 | Ipopt | 2.02600916e8 | 407 | 14674192 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 3.0050888833e10 | 2690 | 20130640 | 259 | 1.4768e+04 | false | timeout | NaN | MAXIMUM\_WALLTIME\_EXCEEDED |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | CaNNOLeS | 1.3367632667e10 | 1254 | 41545280 | 501 | 3.2323e-12 | false | not_converged | NaN | max\_iter |
