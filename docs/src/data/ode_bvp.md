# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-14T13:40:24
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 4e9eec5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 32 | NLLSModel (Sparse) | 256.55056179775283 | 1 | 16 | 1625.0 | 1 | 32 |
| 32 | Standalone (Sparse) | 195.38834951456312 | 1 | 16 | 2500.0 | 20 | 7856 |
| 32 | NLPModels (MathOptNLSModel) | 5968.75 | 2 | 32 | 14250.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 382.3157894736842 | 1 | 16 | 3232.1428571428573 | 1 | 64 |
| 64 | Standalone (Sparse) | 313.46153846153845 | 1 | 16 | 3757.0 | 20 | 17200 |
| 64 | NLPModels (MathOptNLSModel) | 11209.0 | 2 | 32 | 25959.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 669.25 | 1 | 16 | 6135.25 | 1 | 64 |
| 128 | Standalone (Sparse) | 563.6666666666666 | 1 | 16 | 7819.666666666667 | 22 | 33584 |
| 128 | NLPModels (MathOptNLSModel) | 21750.0 | 2 | 32 | 52459.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 1242.1875 | 1 | 16 | 12042.0 | 1 | 64 |
| 256 | Standalone (Sparse) | 1127.157894736842 | 1 | 16 | 15625.0 | 24 | 67440 |
| 256 | NLPModels (MathOptNLSModel) | 42375.0 | 2 | 32 | 101625.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 2467.5555555555557 | 1 | 16 | 25250.0 | 1 | 64 |
| 512 | Standalone (Sparse) | 2150.0 | 1 | 16 | 28417.0 | 24 | 134256 |
| 512 | NLPModels (MathOptNLSModel) | 84583.0 | 2 | 32 | 202292.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 4666.75 | 1 | 16 | 48416.0 | 1 | 64 |
| 1024 | Standalone (Sparse) | 4266.6 | 1 | 16 | 54208.0 | 24 | 267920 |
| 1024 | NLPModels (MathOptNLSModel) | 166875.0 | 2 | 32 | 411917.0 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 2075.0 | 4 | 96 | 42083.0 | 2 | 464 |
| 2048 | Standalone (Sparse) | 8694.666666666666 | 1 | 16 | 112833.0 | 25 | 502384 |
| 2048 | NLPModels (MathOptNLSModel) | 402209.0 | 2 | 32 | 1.375417e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 3309.5714285714284 | 4 | 96 | 63958.0 | 2 | 464 |
| 4096 | Standalone (Sparse) | 17458.0 | 1 | 16 | 215291.0 | 25 | 1020528 |
| 4096 | NLPModels (MathOptNLSModel) | 1.482917e6 | 2 | 32 | 3.844916e6 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 5750.0 | 4 | 96 | 148875.0 | 2 | 464 |
| 8192 | Standalone (Sparse) | 34792.0 | 1 | 16 | 458959.0 | 25 | 2007664 |
| 8192 | NLPModels (MathOptNLSModel) | 4.212167e6 | 2 | 32 | 1.2794e7 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 10500.0 | 4 | 96 | 156459.0 | 2 | 464 |
| 16384 | Standalone (Sparse) | 67292.0 | 1 | 16 | 845583.0 | 25 | 3981936 |
| 16384 | NLPModels (MathOptNLSModel) | 1.0778333e7 | 2 | 32 | 2.9299042e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 20042.0 | 4 | 96 | 672333.0 | 2 | 464 |
| 32768 | Standalone (Sparse) | 143709.0 | 1 | 16 | 1.798167e6 | 25 | 9224816 |
| 32768 | NLPModels (MathOptNLSModel) | 2.3738292e7 | 2 | 32 | 6.3788334e7 | 5 | 128 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 32 | SecondOrderOptimization (Dogleg) | 26958.5 | 150 | 71248 | 3 | 5.6402e-27 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 31416.5 | 146 | 70592 | 4 | 7.9500e-20 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 205187.5 | 139 | 22864 | 13 | 1.4747e-11 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 346708.0 | 187 | 34496 | 19 | 1.1774e-15 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32 | Optim (Newton) | 107438.0 | 355 | 103392 | 3 | 2.8725e-27 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 499292.0 | 617 | 39760 | 6 | 7.8113e-20 | false | not_converged | NaN | not\_desc |
| 32 | JSOSolvers (tron) | 766167.0 | 715 | 40832 | 4 | 2.2735e-21 | false | not_converged | NaN | small\_residual |
| 32 | Ipopt | 712916.5 | 390 | 30832 | 3 | 3.4854e-63 | true | ok | NaN | first\_order |
| 32 | MadNLP | 316771.5 | 578 | 67344 | 3 | 5.7856e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 458541.5 | 784 | 99504 | 17 | 9.5072e-20 | true | ok | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 106541.5 | 849 | 120032 | 5 | 1.5138e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 52645.5 | 180 | 48880 | 3 | 3.3924e-27 | true | ok | NaN | first\_order |
| 64 | SecondOrderOptimization (Dogleg) | 71625.0 | 229 | 100960 | 3 | 9.0812e-26 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (LM) | 56291.0 | 225 | 99792 | 5 | 1.0959e-18 | true | ok | NaN | grad\_tol |
| 64 | LeastSquaresOptim (Dogleg) | 2.9778292e7 | 5035 | 2512096 | 500 | 8.4437e-03 | false | not_converged | NaN | not converged |
| 64 | LeastSquaresOptim (LM) | 2.5967085e6 | 297 | 131872 | 27 | 8.3599e-14 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 64 | Optim (Newton) | 142854.5 | 359 | 203744 | 3 | 1.0023e-25 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 2.616042e6 | 1467 | 84912 | 7 | 5.2143e-22 | false | not_converged | NaN | not\_desc |
| 64 | JSOSolvers (tron) | 7.300167e6 | 3559 | 188656 | 13 | 6.3499e-17 | false | not_converged | NaN | small\_step |
| 64 | Ipopt | 732437.0 | 338 | 49680 | 2 | 3.8541e-47 | true | ok | NaN | first\_order |
| 64 | MadNLP | 531750.0 | 580 | 87536 | 3 | 1.1280e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 1.601667e6 | 791 | 221264 | 20 | 4.0677e-21 | true | ok | NaN | Success |
| 64 | NonlinearSolve (TrustRegion) | 130000.0 | 861 | 230960 | 5 | 2.9639e-18 | true | ok | NaN | Success |
| 64 | CaNNOLeS | 107458.0 | 194 | 97008 | 3 | 9.6264e-26 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 106291.5 | 243 | 193888 | 4 | 2.3553e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM) | 138291.5 | 237 | 190512 | 7 | 3.5241e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | LeastSquaresOptim (Dogleg) | 1.05506792e8 | 5035 | 2527168 | 500 | 1.6872e+01 | false | not_converged | NaN | not converged |
| 128 | LeastSquaresOptim (LM) | 2.23960625e8 | 5335 | 8514864 | 443 | 1.1009e-09 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 128 | Optim (Newton) | 265041.5 | 477 | 505984 | 4 | 2.9738e-24 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 2.2276584e7 | 4457 | 237680 | 8 | 4.9369e-18 | false | not_converged | NaN | not\_desc |
| 128 | JSOSolvers (tron) | 1.318490791e9 | 259829 | 12503280 | 12 | 1.1094e-16 | false | not_converged | NaN | small\_step |
| 128 | Ipopt | 931979.5 | 349 | 69744 | 2 | 7.4496e-46 | true | ok | NaN | first\_order |
| 128 | MadNLP | 767916.5 | 591 | 127184 | 3 | 2.2634e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 6.3227915e6 | 811 | 499856 | 22 | 2.2726e-19 | true | ok | NaN | Success |
| 128 | NonlinearSolve (TrustRegion) | 187166.5 | 894 | 323312 | 4 | 3.0086e-17 | true | ok | NaN | Success |
| 128 | CaNNOLeS | 186250.0 | 217 | 174944 | 3 | 2.6889e-24 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 207458.5 | 289 | 384272 | 4 | 1.0706e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (LM) | 298479.0 | 280 | 377920 | 8 | 1.2124e-22 | true | ok | NaN | step\_size |
| 256 | LeastSquaresOptim (Dogleg) | 3.88155375e8 | 6048 | 9732064 | 500 | 8.4444e+01 | false | not_converged | NaN | not converged |
| 256 | LeastSquaresOptim (LM) | 9.52897542e8 | 6033 | 9654480 | 500 | 2.5926e+01 | false | not_converged | NaN | not converged |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 256 | Optim (Newton) | 436645.5 | 505 | 1004416 | 4 | 8.2267e-23 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 4.154652542e9 | 422824 | 20335344 | 208 | 2.5351e-17 | false | not_converged | NaN | not\_desc |
| 256 | JSOSolvers (tron) | 3.0000237583e10 | 3025233 | 145181648 | 61 | 2.2335e-12 | false | timeout | NaN | max\_time |
| 256 | Ipopt | 1.4364995e6 | 369 | 138704 | 2 | 1.2199e-51 | true | ok | NaN | first\_order |
| 256 | MadNLP | 1.18725e6 | 621 | 204128 | 3 | 5.0789e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 2.62138745e7 | 862 | 1526416 | 25 | 9.5562e-19 | true | ok | NaN | Success |
| 256 | NonlinearSolve (TrustRegion) | 351875.0 | 960 | 568320 | 5 | 7.3379e-18 | true | ok | NaN | Success |
| 256 | CaNNOLeS | 370354.0 | 240 | 352864 | 3 | 9.7289e-23 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 359041.5 | 289 | 754928 | 4 | 2.5649e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 512 | SecondOrderOptimization (LM) | 600958.5 | 283 | 746592 | 9 | 4.0273e-21 | true | ok | NaN | step\_size |
| 512 | LeastSquaresOptim (Dogleg) | 1.124660209e9 | 6048 | 9774688 | 500 | 2.0403e+02 | false | not_converged | NaN | not converged |
| 512 | LeastSquaresOptim (LM) | 1.209645583e9 | 6125 | 12003088 | 500 | 2.0331e+02 | false | not_converged | NaN | not converged |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 512 | Optim (Newton) | 666624.5 | 521 | 1995136 | 4 | 2.5808e-21 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 3.0000244208e10 | 1529597 | 73489088 | 375 | 2.4884e+01 | false | timeout | NaN | max\_time |
| 512 | JSOSolvers (tron) | 3.0015112834e10 | 1531040 | 73580576 | 16 | 1.1108e+01 | false | timeout | NaN | max\_time |
| 512 | Ipopt | 2.4352705e6 | 371 | 283760 | 2 | 1.6725e-50 | true | ok | NaN | first\_order |
| 512 | MadNLP | 1.9849995e6 | 633 | 362384 | 3 | 3.4618e-21 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 9.5255083e7 | 5409 | 25257216 | 27 | 2.9581e-17 | true | ok | NaN | Success |
| 512 | NonlinearSolve (TrustRegion) | 631542.0 | 971 | 1109104 | 6 | 4.5388e-20 | true | ok | NaN | Success |
| 512 | CaNNOLeS | 718833.5 | 248 | 725728 | 3 | 3.4085e-21 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 707541.5 | 292 | 1574192 | 4 | 9.5650e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (LM) | 1.2757915e6 | 286 | 1557664 | 11 | 8.5848e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | LeastSquaresOptim (Dogleg) | 1.822293666e9 | 6108 | 11335456 | 500 | 4.6396e+02 | false | not_converged | NaN | not converged |
| 1024 | LeastSquaresOptim (LM) | 2.087178584e9 | 6077 | 10903824 | 500 | 4.6397e+02 | false | not_converged | NaN | not converged |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1024 | Optim (Newton) | 1.235938e6 | 521 | 4205600 | 4 | 8.5372e-20 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.0000487083e10 | 777381 | 37452352 | 97 | 3.9596e+02 | false | timeout | NaN | max\_time |
| 1024 | JSOSolvers (tron) | 3.000071825e10 | 775768 | 37441600 | 4 | 4.1389e+02 | false | timeout | NaN | max\_time |
| 1024 | Ipopt | 4.813479e6 | 375 | 454864 | 2 | 1.9886e-46 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 1.4802292e7 | 957 | 682192 | 8 | 9.1699e-20 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 1024 | NonlinearSolve (LM) | 2.165377208e9 | 27992 | 289467312 | 163 | 6.5247e-16 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 2.415458e6 | 3427 | 3521280 | 5 | 4.9101e-18 | true | ok | NaN | Success |
| 1024 | CaNNOLeS | 1.4719165e6 | 248 | 1405664 | 3 | 8.9525e-20 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 1.444917e6 | 33200 | 5001008 | 4 | 2.8872e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (LM) | 2.234437e6 | 33199 | 4954848 | 12 | 3.1310e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | LeastSquaresOptim (Dogleg) | 2.979728875e9 | 6096 | 11472992 | 500 | 9.8231e+02 | false | not_converged | NaN | not converged |
| 2048 | LeastSquaresOptim (LM) | 3.646388584e9 | 6053 | 10475920 | 500 | 9.8236e+02 | false | not_converged | NaN | not converged |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2048 | Optim (Newton) | 2.3708955e6 | 526 | 7774080 | 4 | 2.8565e-18 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 3.0001384833e10 | 391359 | 19062560 | 26 | 9.0882e+02 | false | timeout | NaN | max\_time |
| 2048 | JSOSolvers (tron) | 3.0003049875e10 | 387840 | 19026800 | 1 | 9.3072e+02 | false | timeout | NaN | max\_time |
| 2048 | Ipopt | 1.04560835e7 | 379 | 915984 | 2 | 3.7204e-44 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 3.5070875e7 | 945 | 1310864 | 8 | 2.9149e-18 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 2048 | NonlinearSolve (LM) | 8.811748875e9 | 29424 | 614033328 | 171 | 2.4514e-14 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 5.08475e6 | 5888 | 6687632 | 6 | 2.5688e-17 | true | ok | NaN | Success |
| 2048 | CaNNOLeS | 3.9723335e6 | 250 | 2700032 | 3 | 2.9864e-18 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 2.8498335e6 | 65965 | 10039280 | 4 | 9.0408e-17 | true | ok | NaN | abs\_dcost, step\_size |
| 4096 | SecondOrderOptimization (LM) | 4.7875e6 | 65968 | 9977200 | 13 | 9.6032e-17 | true | ok | NaN | step\_size |
| 4096 | LeastSquaresOptim (Dogleg) | 1.5087025e8 | 80 | 729472 | 2 | 2.0477e+03 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 5.259970042e9 | 5687 | 7927472 | 500 | 2.0119e+03 | false | not_converged | NaN | not converged |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 4096 | Optim (Newton) | 4.947729e6 | 526 | 15959936 | 4 | 9.6838e-17 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 3.0002662292e10 | 139041 | 7229824 | 7 | 1.9502e+03 | false | timeout | NaN | max\_time |
| 4096 | JSOSolvers (tron) | 3.0008335292e10 | 141831 | 7630016 | 1 | 1.9650e+03 | false | timeout | NaN | max\_time |
| 4096 | Ipopt | 2.3906e7 | 383 | 1846544 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 1.07322875e8 | 1037 | 2570096 | 9 | 9.4483e-17 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 4096 | NonlinearSolve (LM) | 3.0040993042e10 | 873 | 291017424 | 121 | 8.8909e-13 | false | timeout | NaN | MaxTime |
| 4096 | NonlinearSolve (TrustRegion) | 6.3667875e7 | 10514 | 15642640 | 38 | 9.2716e-17 | true | ok | NaN | StalledSuccess |
| 4096 | CaNNOLeS | 1.15918545e7 | 252 | 5288736 | 3 | 9.9773e-17 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 6.7356245e6 | 131519 | 19854896 | 6 | 3.3009e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (LM) | 1.2384333e7 | 131523 | 19727680 | 16 | 3.0848e-15 | true | ok | NaN | step\_size |
| 8192 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 8192 | LeastSquaresOptim (LM) | 2.5616665e6 | 53 | 790240 | 1 | 4.0954e+03 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 8192 | Optim (Newton) | 1.5389479e7 | 769 | 44576400 | 6 | 3.1978e-15 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 3.0006044167e10 | 33187 | 2705888 | 3 | 4.0430e+03 | false | timeout | NaN | max\_time |
| 8192 | JSOSolvers (tron) | 3.0024220333e10 | 34153 | 3284768 | 1 | 4.0422e+03 | false | timeout | NaN | max\_time |
| 8192 | Ipopt | 5.0087959e7 | 393 | 3674448 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.2671715958e10 | 4609 | 5199632 | 500 | 1.3036e-01 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 8192 | NonlinearSolve (LM) | 3.0672318708e10 | 7110 | 532725232 | 38 | 3.1366e-11 | false | timeout | NaN | MaxTime |
| 8192 | NonlinearSolve (TrustRegion) | 2.08864375e8 | 19987 | 38850704 | 41 | 3.0111e-15 | true | ok | NaN | StalledSuccess |
| 8192 | CaNNOLeS | 2.6969416e7 | 254 | 10449728 | 3 | 3.1855e-15 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 1.51505625e7 | 262609 | 39427232 | 7 | 4.2624e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (LM) | 2.7223542e7 | 262615 | 39169744 | 19 | 1.3437e-13 | true | ok | NaN | step\_size |
| 16384 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 16384 | LeastSquaresOptim (LM) | 5.026312e6 | 54 | 1577664 | 1 | 8.1914e+03 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 16384 | Optim (Newton) | 3.9010625e7 | 991 | 114533456 | 8 | 1.1880e-13 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 3.002001625e10 | 10755 | 2743264 | 3 | 8.1626e+03 | false | timeout | NaN | max\_time |
| 16384 | JSOSolvers (tron) | 3.0069562042e10 | 11223 | 3830720 | 1 | 8.1621e+03 | false | timeout | NaN | max\_time |
| 16384 | Ipopt | 1.00696417e8 | 403 | 7346384 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 2.87954265e10 | 4618 | 10189296 | 500 | 4.1475e+00 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 16384 | NonlinearSolve (LM) | 3.2032843208e10 | 2410 | 283293744 | 10 | 8.1849e+03 | false | timeout | NaN | MaxTime |
| 16384 | NonlinearSolve (TrustRegion) | 4.29780541e8 | 38752 | 88982928 | 43 | 9.7876e-14 | true | ok | NaN | StalledSuccess |
| 16384 | CaNNOLeS | 6.429502584e9 | 1252 | 21081632 | 501 | 1.0151e-13 | false | not_converged | NaN | max\_iter |
| 32768 | SecondOrderOptimization (Dogleg) | 4.676175e7 | 524766 | 78650512 | 2 | 4.7013e+00 | true | ok | NaN | rel\_dcost, step\_size |
| 32768 | SecondOrderOptimization (LM) | 4.939715e8 | 524998 | 78186560 | 132 | 1.3439e-08 | true | ok | NaN | step\_size |
| 32768 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 32768 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32768 | Optim (Newton) | 1.06227875e8 | 805 | 232090368 | 5 | 5.9465e-08 | false | not_converged | NaN | not converged |
| 32768 | JSOSolvers (trunk) | 3.0031694042e10 | 4697 | 4680704 | 3 | 1.6365e+04 | false | timeout | NaN | max\_time |
| 32768 | JSOSolvers (tron) | 3.0147860334e10 | 4779 | 6814592 | 1 | 1.6365e+04 | false | timeout | NaN | max\_time |
| 32768 | Ipopt | 2.05925666e8 | 407 | 14674192 | 2 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 3.0042953416e10 | 2666 | 20130160 | 256 | 1.4768e+04 | false | timeout | NaN | MAXIMUM\_WALLTIME\_EXCEEDED |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | CaNNOLeS | 1.3757378959e10 | 1254 | 41545280 | 501 | 3.2323e-12 | false | not_converged | NaN | max\_iter |
