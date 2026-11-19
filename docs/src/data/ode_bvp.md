# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T01:36:41
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
| 32 | NLLSModel (Sparse) | 244.42268041237114 | 1 | 16 | 1559.5 | 1 | 32 |
| 32 | Standalone (Sparse) | 258.3375 | 1 | 16 | 3071.4285714285716 | 20 | 7856 |
| 32 | NLPModels (MathOptNLSModel) | 6062.5 | 2 | 32 | 13333.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 407.89473684210526 | 1 | 16 | 3053.5714285714284 | 1 | 64 |
| 64 | Standalone (Sparse) | 402.50943396226415 | 1 | 16 | 4641.6 | 20 | 17200 |
| 64 | NLPModels (MathOptNLSModel) | 12208.0 | 2 | 32 | 25833.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 671.875 | 1 | 16 | 5968.75 | 1 | 64 |
| 128 | Standalone (Sparse) | 708.3333333333334 | 1 | 16 | 9194.333333333334 | 22 | 33584 |
| 128 | NLPModels (MathOptNLSModel) | 22334.0 | 2 | 32 | 56791.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 897.0588235294117 | 3 | 48 | 12292.0 | 1 | 64 |
| 256 | Standalone (Sparse) | 1316.6666666666667 | 1 | 16 | 17666.0 | 24 | 67440 |
| 256 | NLPModels (MathOptNLSModel) | 42958.0 | 2 | 32 | 104584.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 1432.888888888889 | 3 | 48 | 25167.0 | 1 | 64 |
| 512 | Standalone (Sparse) | 2593.75 | 1 | 16 | 33958.0 | 24 | 134256 |
| 512 | NLPModels (MathOptNLSModel) | 84042.0 | 2 | 32 | 226125.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 1564.4545454545455 | 3 | 48 | 21959.0 | 1 | 64 |
| 1024 | Standalone (Sparse) | 5396.0 | 1 | 16 | 70125.0 | 24 | 267920 |
| 1024 | NLPModels (MathOptNLSModel) | 169958.0 | 2 | 32 | 438167.0 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 6458.3 | 3 | 48 | 37250.0 | 1 | 64 |
| 2048 | Standalone (Sparse) | 10958.0 | 1 | 16 | 130333.0 | 25 | 502384 |
| 2048 | NLPModels (MathOptNLSModel) | 482709.0 | 2 | 32 | 1.502708e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 3236.1666666666665 | 3 | 48 | 84000.0 | 1 | 64 |
| 4096 | Standalone (Sparse) | 20500.0 | 1 | 16 | 274458.0 | 25 | 1020528 |
| 4096 | NLPModels (MathOptNLSModel) | 1.395166e6 | 2 | 32 | 3.624334e6 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 5823.0 | 3 | 48 | 155125.0 | 1 | 64 |
| 8192 | Standalone (Sparse) | 40958.0 | 1 | 16 | 525375.0 | 25 | 2007664 |
| 8192 | NLPModels (MathOptNLSModel) | 3.856083e6 | 2 | 32 | 1.1334084e7 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 10750.0 | 3 | 48 | 283416.0 | 1 | 64 |
| 16384 | Standalone (Sparse) | 82000.0 | 1 | 16 | 1.039959e6 | 25 | 3981936 |
| 16384 | NLPModels (MathOptNLSModel) | 1.0636542e7 | 2 | 32 | 2.9109292e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 20875.0 | 3 | 48 | 547458.0 | 1 | 64 |
| 32768 | Standalone (Sparse) | 166584.0 | 1 | 16 | 2.050833e6 | 25 | 10224240 |
| 32768 | NLPModels (MathOptNLSModel) | 2.3731834e7 | 2 | 32 | 6.3567167e7 | 5 | 128 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 32 | SecondOrderOptimization (Dogleg) | 29041.5 | 149 | 72000 | 3 | 5.6402e-27 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 32145.5 | 145 | 71344 | 4 | 7.9500e-20 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Gauss-Newton) | 30458.0 | 136 | 54400 | 3 | 5.6402e-27 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 76750.0 | 106 | 72304 | 4 | 7.9506e-20 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 280791.0 | 171 | 28576 | 17 | 2.5247e-12 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 362228.5 | 185 | 31040 | 19 | 9.9980e-15 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32 | Optim (Newton) | 95187.5 | 351 | 103856 | 3 | 2.8725e-27 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 513625.0 | 617 | 39760 | 6 | 7.8113e-20 | false | not_converged | NaN | not\_desc; cost test passes |
| 32 | JSOSolvers (tron) | 724750.0 | 715 | 40832 | 4 | 2.2735e-21 | false | not_converged | NaN | small\_residual; cost test passes |
| 32 | Ipopt | 681479.0 | 398 | 33296 | 3 | 3.0462e-27 | true | ok | NaN | first\_order |
| 32 | MadNLP | 309229.0 | 578 | 67344 | 3 | 5.7856e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 462917.0 | 784 | 103392 | 17 | 9.4775e-20 | true | ok | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 106854.0 | 849 | 122960 | 5 | 1.5138e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 51729.0 | 180 | 48880 | 3 | 3.3924e-27 | true | ok | NaN | first\_order |
| 64 | SecondOrderOptimization (Dogleg) | 82125.0 | 226 | 101744 | 3 | 9.0812e-26 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (LM) | 63958.5 | 222 | 100576 | 5 | 1.0959e-18 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (Gauss-Newton) | 44687.5 | 214 | 96672 | 3 | 9.0812e-26 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (LM, tall) | 324291.5 | 106 | 241456 | 5 | 1.0960e-18 | true | ok | NaN | grad\_tol |
| 64 | LeastSquaresOptim (Dogleg) | 2.97035e7 | 5035 | 2512240 | 500 | 4.6078e-03 | false | not_converged | NaN | not converged |
| 64 | LeastSquaresOptim (LM) | 2.0599375e6 | 257 | 112000 | 23 | 5.2056e-14 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 64 | Optim (Newton) | 128687.5 | 355 | 204208 | 3 | 1.0023e-25 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 2.639042e6 | 1467 | 84912 | 7 | 5.2143e-22 | false | not_converged | NaN | not\_desc; cost test passes |
| 64 | JSOSolvers (tron) | 7.279458e6 | 3559 | 188656 | 13 | 6.3499e-17 | false | not_converged | NaN | small\_step; cost test passes |
| 64 | Ipopt | 685354.0 | 346 | 54288 | 2 | 4.5413e-12 | true | ok | NaN | first\_order |
| 64 | MadNLP | 509584.0 | 580 | 87536 | 3 | 1.1280e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 1.5630835e6 | 791 | 225152 | 20 | 3.9916e-21 | true | ok | NaN | Success |
| 64 | NonlinearSolve (TrustRegion) | 131562.5 | 861 | 233888 | 5 | 2.9639e-18 | true | ok | NaN | Success |
| 64 | CaNNOLeS | 98500.0 | 194 | 97008 | 3 | 9.6264e-26 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 100395.5 | 240 | 195216 | 4 | 2.3553e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM) | 148917.0 | 234 | 191840 | 7 | 3.5241e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (Gauss-Newton) | 96208.5 | 228 | 185408 | 4 | 2.3553e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM, tall) | 2.6409585e6 | 110 | 780624 | 7 | 2.8865e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | LeastSquaresOptim (Dogleg) | 1.06440958e8 | 5035 | 2527312 | 500 | 1.4555e+01 | false | not_converged | NaN | not converged |
| 128 | LeastSquaresOptim (LM) | 1.95809958e8 | 4639 | 7390288 | 385 | 2.4579e-09 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 128 | Optim (Newton) | 270750.0 | 472 | 506576 | 4 | 2.9738e-24 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 2.000075e7 | 4457 | 237680 | 8 | 4.9369e-18 | false | not_converged | NaN | not\_desc; cost test passes |
| 128 | JSOSolvers (tron) | 1.287246167e9 | 259829 | 12503280 | 12 | 1.1094e-16 | false | not_converged | NaN | small\_step; cost test passes |
| 128 | Ipopt | 944770.5 | 360 | 78416 | 2 | 9.0053e-12 | true | ok | NaN | first\_order |
| 128 | MadNLP | 752541.5 | 591 | 127184 | 3 | 2.2634e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 6.2480835e6 | 811 | 503744 | 22 | 2.2479e-19 | true | ok | NaN | Success |
| 128 | NonlinearSolve (TrustRegion) | 208854.0 | 894 | 326240 | 4 | 3.0086e-17 | true | ok | NaN | Success |
| 128 | CaNNOLeS | 184916.5 | 217 | 174944 | 3 | 2.6889e-24 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 202271.0 | 287 | 386592 | 4 | 1.0706e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (LM) | 335646.0 | 278 | 380240 | 8 | 1.2124e-22 | true | ok | NaN | step\_size |
| 256 | SecondOrderOptimization (Gauss-Newton) | 202458.0 | 271 | 367696 | 4 | 1.0706e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (LM, tall) | 2.3031958e7 | 134 | 2818736 | 8 | 9.2329e-23 | true | ok | NaN | step\_size |
| 256 | LeastSquaresOptim (Dogleg) | 3.92545208e8 | 6048 | 9732208 | 500 | 8.3983e+01 | false | not_converged | NaN | not converged |
| 256 | LeastSquaresOptim (LM) | 9.45817166e8 | 6033 | 9654640 | 500 | 2.3129e+01 | false | not_converged | NaN | not converged |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 256 | Optim (Newton) | 403250.5 | 500 | 1005008 | 4 | 8.2267e-23 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 4.1200805e9 | 422824 | 20335344 | 208 | 2.5351e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 256 | JSOSolvers (tron) | 3.0000266458e10 | 3034176 | 145673376 | 61 | 2.1523e-12 | false | timeout | NaN | max\_time; cost test passes |
| 256 | Ipopt | 1.384646e6 | 382 | 155504 | 2 | 1.7937e-11 | true | ok | NaN | first\_order |
| 256 | MadNLP | 1.15875e6 | 621 | 204128 | 3 | 5.0789e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 2.6511917e7 | 862 | 1530304 | 25 | 1.0326e-18 | true | ok | NaN | Success |
| 256 | NonlinearSolve (TrustRegion) | 330500.0 | 960 | 571248 | 5 | 7.3379e-18 | true | ok | NaN | Success |
| 256 | CaNNOLeS | 354833.5 | 240 | 352864 | 3 | 9.7289e-23 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 333812.5 | 287 | 759328 | 4 | 2.5649e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 512 | SecondOrderOptimization (LM) | 652646.0 | 281 | 750992 | 9 | 4.0273e-21 | true | ok | NaN | step\_size |
| 512 | SecondOrderOptimization (Gauss-Newton) | 323208.5 | 271 | 722000 | 4 | 2.5649e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 512 | SecondOrderOptimization (LM, tall) | 2.5394375e6 | 514 | 2294128 | 9 | 3.8058e-21 | true | ok | NaN | step\_size |
| 512 | LeastSquaresOptim (Dogleg) | 1.123605875e9 | 6048 | 9774832 | 500 | 2.0404e+02 | false | not_converged | NaN | not converged |
| 512 | LeastSquaresOptim (LM) | 1.204501416e9 | 6125 | 12003248 | 500 | 2.0330e+02 | false | not_converged | NaN | not converged |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 512 | Optim (Newton) | 3.794209e6 | 515 | 1861968 | 4 | 2.8821e-21 | false | not_converged | NaN | not converged; cost test passes |
| 512 | JSOSolvers (trunk) | 3.0000248375e10 | 1558391 | 74871200 | 382 | 2.4119e+01 | false | timeout | NaN | max\_time |
| 512 | JSOSolvers (tron) | 3.0000358375e10 | 1538383 | 73943664 | 16 | 1.1087e+01 | false | timeout | NaN | max\_time |
| 512 | Ipopt | 2.671771e6 | 384 | 316944 | 2 | 3.5802e-11 | true | ok | NaN | first\_order |
| 512 | MadNLP | 2.163375e6 | 633 | 362384 | 3 | 3.4618e-21 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 9.569025e7 | 5123 | 25256528 | 27 | 3.4852e-17 | true | ok | NaN | Success |
| 512 | NonlinearSolve (TrustRegion) | 601541.5 | 971 | 1112032 | 6 | 4.5624e-20 | true | ok | NaN | Success |
| 512 | CaNNOLeS | 684562.5 | 248 | 725728 | 3 | 3.4085e-21 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 597896.0 | 414 | 1656208 | 4 | 9.5650e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (LM) | 1.0550835e6 | 408 | 1639680 | 11 | 9.7576e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (Gauss-Newton) | 531896.0 | 398 | 1573824 | 4 | 9.5650e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (LM, tall) | 6.164438e6 | 586 | 5038000 | 11 | 8.9791e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | LeastSquaresOptim (Dogleg) | 1.812125e9 | 6108 | 11335600 | 500 | 4.6395e+02 | false | not_converged | NaN | not converged |
| 1024 | LeastSquaresOptim (LM) | 2.141779458e9 | 6077 | 10903984 | 500 | 4.6397e+02 | false | not_converged | NaN | not converged |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1024 | Optim (Newton) | 1.248e6 | 516 | 4206192 | 4 | 8.5372e-20 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.0000481e10 | 783253 | 37734208 | 98 | 3.9580e+02 | false | timeout | NaN | max\_time |
| 1024 | JSOSolvers (tron) | 3.0000693292e10 | 782308 | 37755520 | 4 | 4.1369e+02 | false | timeout | NaN | max\_time |
| 1024 | Ipopt | 5.244979e6 | 388 | 520816 | 2 | 7.1534e-11 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 1.4712042e7 | 957 | 682192 | 8 | 9.1699e-20 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 1024 | NonlinearSolve (LM) | 2.171262542e9 | 28020 | 289471648 | 163 | 6.8739e-16 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 2.392979e6 | 3427 | 3524208 | 5 | 4.9101e-18 | true | ok | NaN | Success |
| 1024 | CaNNOLeS | 1.476083e6 | 248 | 1405664 | 3 | 8.9525e-20 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 1.112375e6 | 424 | 3181120 | 4 | 2.7584e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (LM) | 2.0095835e6 | 418 | 3148208 | 12 | 2.7509e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (Gauss-Newton) | 998104.0 | 408 | 3033200 | 4 | 2.7584e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (LM, tall) | 1.301775e7 | 622 | 10549280 | 12 | 3.0229e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | LeastSquaresOptim (Dogleg) | 3.113525125e9 | 6096 | 11473136 | 500 | 9.8231e+02 | false | not_converged | NaN | not converged |
| 2048 | LeastSquaresOptim (LM) | 3.646896375e9 | 6053 | 10476080 | 500 | 9.8235e+02 | false | not_converged | NaN | not converged |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2048 | Optim (Newton) | 2.4813125e6 | 637 | 7776528 | 4 | 2.8565e-18 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 3.0001291917e10 | 397403 | 19352672 | 27 | 9.0824e+02 | false | timeout | NaN | max\_time |
| 2048 | JSOSolvers (tron) | 3.0002928417e10 | 393938 | 19319504 | 1 | 9.3037e+02 | false | timeout | NaN | max\_time |
| 2048 | Ipopt | 1.0013375e7 | 392 | 1047472 | 2 | 1.4300e-10 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 3.5493542e7 | 945 | 1310864 | 8 | 2.9149e-18 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 2048 | NonlinearSolve (LM) | 8.794477875e9 | 29440 | 614037472 | 171 | 2.3172e-14 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 4.9041255e6 | 5780 | 6688832 | 6 | 2.5688e-17 | true | ok | NaN | Success |
| 2048 | CaNNOLeS | 4.661083e6 | 250 | 2700032 | 3 | 2.9864e-18 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 2.1068965e6 | 424 | 6482752 | 4 | 9.7013e-17 | true | ok | NaN | abs\_dcost, step\_size |
| 4096 | SecondOrderOptimization (LM) | 4.187459e6 | 418 | 6417072 | 13 | 9.9519e-17 | true | ok | NaN | step\_size |
| 4096 | SecondOrderOptimization (Gauss-Newton) | 2.006521e6 | 408 | 6187376 | 4 | 9.7013e-17 | true | ok | NaN | abs\_dcost, step\_size |
| 4096 | SecondOrderOptimization (LM, tall) | 3.0958e7 | 658 | 21911056 | 13 | 9.5985e-17 | true | ok | NaN | step\_size |
| 4096 | LeastSquaresOptim (Dogleg) | 1.50817042e8 | 80 | 729616 | 2 | 2.0477e+03 | false | above_reference | NaN | converged; claimed convergence at cost 2.047669e+03, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 4096 | LeastSquaresOptim (LM) | 5.324018958e9 | 5685 | 7913264 | 500 | 2.0119e+03 | false | not_converged | NaN | not converged |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 4096 | Optim (Newton) | 5.153917e6 | 581 | 15961488 | 4 | 9.6961e-17 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 3.0002679875e10 | 136329 | 7099648 | 7 | 1.9504e+03 | false | timeout | NaN | max\_time |
| 4096 | JSOSolvers (tron) | 3.0008659916e10 | 136387 | 7368704 | 1 | 1.9658e+03 | false | timeout | NaN | max\_time |
| 4096 | Ipopt | 2.4447459e7 | 396 | 2109104 | 2 | 2.8593e-10 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 1.23804791e8 | 1037 | 2570096 | 9 | 9.4483e-17 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 4096 | NonlinearSolve (LM) | 3.0100907667e10 | 873 | 291021312 | 122 | 8.6005e-13 | false | timeout | NaN | MaxTime; cost test passes |
| 4096 | NonlinearSolve (TrustRegion) | 6.4581875e7 | 10514 | 15645568 | 38 | 9.2716e-17 | true | ok | NaN | StalledSuccess |
| 4096 | CaNNOLeS | 1.14650625e7 | 252 | 5288736 | 3 | 9.9773e-17 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 5.02775e6 | 424 | 12692832 | 6 | 3.2591e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (LM) | 9.827708e6 | 418 | 12561616 | 16 | 3.2773e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (Gauss-Newton) | 4.821479e6 | 408 | 12102544 | 6 | 3.2591e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (LM, tall) | 6.74047495e7 | 694 | 44832832 | 14 | 3.0357e-15 | true | ok | NaN | step\_size |
| 8192 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 8192 | LeastSquaresOptim (LM) | 2.6797915e6 | 53 | 790400 | 1 | 4.0954e+03 | false | above_reference | NaN | converged; claimed convergence at cost 4.095422e+03, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 8192 | Optim (Newton) | 1.5620604e7 | 735 | 44576816 | 6 | 3.1342e-15 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 3.0006326584e10 | 32237 | 2660288 | 3 | 4.0437e+03 | false | timeout | NaN | max\_time |
| 8192 | JSOSolvers (tron) | 3.0023601875e10 | 31847 | 3174080 | 1 | 4.0442e+03 | false | timeout | NaN | max\_time |
| 8192 | Ipopt | 5.00649585e7 | 406 | 4199152 | 2 | 5.7178e-10 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.319998625e10 | 4609 | 5199632 | 500 | 1.3036e-01 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 8192 | NonlinearSolve (LM) | 3.0596119417e10 | 7154 | 532729824 | 38 | 3.1320e-11 | false | timeout | NaN | MaxTime; cost test passes |
| 8192 | NonlinearSolve (TrustRegion) | 1.97300062e8 | 19949 | 34838592 | 41 | 3.0843e-15 | true | ok | NaN | StalledSuccess |
| 8192 | CaNNOLeS | 2.7789333e7 | 254 | 10449728 | 3 | 3.1855e-15 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 1.145e7 | 425 | 25022784 | 7 | 4.2618e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (LM) | 2.535275e7 | 419 | 24760496 | 19 | 1.2684e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (Gauss-Newton) | 1.01525625e7 | 411 | 23844752 | 7 | 4.2618e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (LM, tall) | 1.50843667e8 | 732 | 95998960 | 15 | 1.0026e-13 | true | ok | NaN | step\_size |
| 16384 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 16384 | LeastSquaresOptim (LM) | 5.265646e6 | 54 | 1577824 | 1 | 8.1914e+03 | false | above_reference | NaN | converged; claimed convergence at cost 8.191422e+03, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 16384 | Optim (Newton) | 4.0919916e7 | 949 | 114534032 | 8 | 1.2417e-13 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 3.001781375e10 | 10561 | 2733952 | 3 | 8.1629e+03 | false | timeout | NaN | max\_time |
| 16384 | JSOSolvers (tron) | 3.0068119042e10 | 10491 | 3795584 | 1 | 8.1631e+03 | false | timeout | NaN | max\_time |
| 16384 | Ipopt | 1.07251416e8 | 584 | 8398064 | 2 | 1.1436e-09 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 2.9481416083e10 | 4618 | 10189296 | 500 | 4.1475e+00 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 16384 | NonlinearSolve (LM) | 3.2155372333e10 | 2412 | 283297664 | 10 | 8.1849e+03 | false | timeout | NaN | MaxTime |
| 16384 | NonlinearSolve (TrustRegion) | 4.41418583e8 | 38754 | 88985888 | 43 | 9.7876e-14 | true | ok | NaN | StalledSuccess |
| 16384 | CaNNOLeS | 6.833529208e9 | 1254 | 21081664 | 501 | 1.0151e-13 | false | not_converged | NaN | max\_iter; cost test passes |
| 32768 | SecondOrderOptimization (Dogleg) | 4.949487705e8 | 425 | 49994048 | 158 | 2.4787e-07 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 32768 | SecondOrderOptimization (LM) | 5.64954875e8 | 419 | 49469616 | 166 | 4.1247e-11 | true | ok | NaN | step\_size |
| 32768 | SecondOrderOptimization (Gauss-Newton) | 4.66401584e8 | 412 | 47896496 | 160 | 2.4787e-07 | false | not_converged | NaN | max\_fails; cost test passes |
| 32768 | SecondOrderOptimization (LM, tall) | 3.10408625e8 | 804 | 205136848 | 17 | 3.1595e-12 | true | ok | NaN | step\_size |
| 32768 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 32768 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32768 | Optim (Newton) | 8.3228583e7 | 798 | 244657504 | 5 | 5.9465e-08 | false | not_converged | NaN | not converged; cost test passes |
| 32768 | JSOSolvers (trunk) | 3.0040072708e10 | 4485 | 4670528 | 3 | 1.6365e+04 | false | timeout | NaN | max\_time |
| 32768 | JSOSolvers (tron) | 3.015126725e10 | 4585 | 6805280 | 1 | 1.6365e+04 | false | timeout | NaN | max\_time |
| 32768 | Ipopt | 2.0793375e8 | 420 | 16771760 | 2 | 2.2901e-09 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 3.009348375e10 | 2634 | 20129520 | 252 | 1.4769e+04 | false | timeout | NaN | MAXIMUM\_WALLTIME\_EXCEEDED |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | CaNNOLeS | 1.4069139875e10 | 1254 | 42004032 | 501 | 3.2323e-12 | false | not_converged | NaN | max\_iter; cost test passes |
