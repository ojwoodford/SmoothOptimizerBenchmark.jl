# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-14T13:34:44
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 4e9eec5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel | 54.8266253869969 | 1 | 16 | 200.15686274509804 | 1 | 32 |
| 2 | Standalone | 51.282051282051285 | 1 | 16 | 583.0 | 7 | 528 |
| 2 | NLPModels (MathOptNLSModel) | 1178.2222222222222 | 5 | 80 | 2218.75 | 9 | 224 |
| 3 | NLLSModel | 58.116883116883116 | 1 | 16 | 250.0 | 1 | 32 |
| 3 | Standalone | 61.25714285714286 | 1 | 16 | 709.0 | 7 | 592 |
| 3 | NLPModels (MathOptNLSModel) | 1215.7058823529412 | 5 | 80 | 2370.3333333333335 | 9 | 224 |
| 4 | NLLSModel | 59.48967551622419 | 1 | 16 | 305.36986301369865 | 1 | 32 |
| 4 | Standalone | 63.905660377358494 | 1 | 16 | 750.0 | 7 | 688 |
| 4 | NLPModels (MathOptNLSModel) | 1449.4285714285713 | 5 | 80 | 2970.285714285714 | 9 | 224 |
| 5 | NLLSModel | 63.863247863247864 | 1 | 16 | 395.8269230769231 | 1 | 32 |
| 5 | Standalone | 68.42140468227424 | 1 | 16 | 834.0 | 7 | 784 |
| 5 | NLPModels (MathOptNLSModel) | 1854.1666666666667 | 5 | 80 | 3950.0 | 9 | 224 |
| 6 | NLLSModel | 70.30340557275542 | 1 | 16 | 448.6511627906977 | 1 | 32 |
| 6 | Standalone | 71.24125874125875 | 1 | 16 | 1000.0 | 7 | 944 |
| 6 | NLPModels (MathOptNLSModel) | 2291.7 | 5 | 80 | 5041.5 | 9 | 224 |
| 8 | NLLSModel | 100.52140077821012 | 1 | 16 | 693.0666666666667 | 1 | 32 |
| 8 | Standalone | 77.40449438202248 | 1 | 16 | 1458.0 | 7 | 1296 |
| 8 | NLPModels (MathOptNLSModel) | 3232.1428571428573 | 5 | 80 | 8194.333333333334 | 9 | 224 |
| 10 | NLLSModel | 128.97727272727272 | 1 | 16 | 954.15 | 1 | 32 |
| 10 | Standalone | 83.0 | 1 | 16 | 2584.0 | 7 | 1808 |
| 10 | NLPModels (MathOptNLSModel) | 4975.0 | 5 | 80 | 14042.0 | 9 | 224 |
| 14 | NLLSModel | 172.1014492753623 | 1 | 16 | 1697.9166666666667 | 1 | 32 |
| 14 | Standalone | 103.25365853658536 | 1 | 16 | 4417.0 | 8 | 1808 |
| 14 | NLPModels (MathOptNLSModel) | 9444.333333333334 | 5 | 80 | 41958.0 | 9 | 224 |
| 18 | NLLSModel | 291.1168831168831 | 1 | 16 | 2661.5 | 1 | 32 |
| 18 | Standalone | 126.23076923076923 | 1 | 16 | 8958.0 | 8 | 2624 |
| 18 | NLPModels (MathOptNLSModel) | 15583.0 | 5 | 80 | 69542.0 | 9 | 224 |
| 22 | NLLSModel | 386.5 | 1 | 16 | 3908.4 | 1 | 32 |
| 22 | Standalone | 145.99248120300751 | 1 | 16 | 18709.0 | 9 | 3552 |
| 22 | NLPModels (MathOptNLSModel) | 22542.0 | 5 | 80 | 138209.0 | 9 | 224 |
| 26 | NLLSModel | 538.6904761904761 | 1 | 16 | 5583.25 | 1 | 32 |
| 26 | Standalone | 164.80357142857142 | 1 | 16 | 27333.0 | 9 | 4240 |
| 26 | NLPModels (MathOptNLSModel) | 34584.0 | 5 | 80 | 195333.0 | 9 | 224 |
| 32 | NLLSModel | 731.3448275862069 | 1 | 16 | 9264.0 | 1 | 32 |
| 32 | Standalone | 220.73809523809524 | 1 | 16 | 54750.0 | 9 | 6624 |
| 32 | NLPModels (MathOptNLSModel) | 48833.0 | 5 | 80 | 374667.0 | 9 | 224 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 6916.5 | 143 | 6928 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM) | 6750.0 | 139 | 6752 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM, tall) | 8771.0 | 106 | 7552 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | LeastSquaresOptim (Dogleg) | 12770.5 | 193 | 359168 | 7 | 0.0000e+00 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 19229.0 | 189 | 359040 | 7 | 1.5248e-24 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 18917.0 | 237 | 15504 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 16854.5 | 145 | 7168 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 14958.0 | 113 | 5440 | 7 | 5.5901e-28 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 25416.0 | 199 | 10032 | 6 | 6.1357e-20 | true | ok | NaN | first\_order |
| 2 | Ipopt | 812979.5 | 688 | 30944 | 7 | 1.5884e-26 | true | ok | NaN | first\_order |
| 2 | MadNLP | 304729.0 | 631 | 50080 | 6 | 1.8806e-20 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 42937.5 | 343 | 23168 | 13 | 1.6316e-22 | true | ok | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 14854.5 | 205 | 360272 | 7 | 1.5811e-23 | true | ok | NaN | Success |
| 2 | CaNNOLeS | 15125.0 | 182 | 9760 | 6 | 7.7016e-25 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 7958.5 | 143 | 7648 | 7 | 7.5249e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM) | 7708.0 | 139 | 7472 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 11708.5 | 106 | 8672 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | LeastSquaresOptim (Dogleg) | 15625.0 | 217 | 413344 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 21417.0 | 237 | 464736 | 9 | 5.6818e-30 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 32645.5 | 321 | 24304 | 7 | 9.2456e-22 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 20583.0 | 162 | 8880 | 7 | 7.5249e-20 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 21104.0 | 120 | 5968 | 7 | 1.8161e-20 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 79584.0 | 211 | 10832 | 7 | 2.7095e-17 | false | not_converged | NaN | small\_residual |
| 3 | Ipopt | 892979.0 | 662 | 30720 | 7 | 8.0760e-18 | true | ok | NaN | first\_order |
| 3 | MadNLP | 435146.0 | 745 | 52544 | 8 | 4.4409e-16 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 52687.5 | 367 | 29072 | 15 | 8.5268e-23 | true | ok | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 15666.5 | 205 | 363872 | 7 | 7.5075e-19 | true | ok | NaN | Success |
| 3 | CaNNOLeS | 19729.5 | 185 | 12256 | 7 | 7.5249e-20 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 9166.0 | 143 | 9008 | 7 | 1.3440e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM) | 9000.0 | 139 | 8800 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 14583.5 | 106 | 10400 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | LeastSquaresOptim (Dogleg) | 18166.5 | 217 | 417472 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 20375.0 | 237 | 469376 | 9 | 4.8047e-28 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 43437.0 | 354 | 34240 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 20229.5 | 162 | 10288 | 7 | 1.3440e-21 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 138875.0 | 402 | 25920 | 7 | 1.2381e-17 | false | not_converged | NaN | not\_desc |
| 4 | JSOSolvers (tron) | 54917.0 | 245 | 12976 | 8 | 1.7694e-23 | true | ok | NaN | first\_order |
| 4 | Ipopt | 1.3569585e6 | 980 | 47328 | 13 | 3.2978e-29 | true | ok | NaN | first\_order |
| 4 | MadNLP | 425479.0 | 748 | 53568 | 9 | 1.0519e-25 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 68916.5 | 400 | 40192 | 18 | 3.9178e-20 | true | ok | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 19250.0 | 231 | 421792 | 8 | 1.4513e-30 | true | ok | NaN | Success |
| 4 | CaNNOLeS | 24083.5 | 186 | 15888 | 7 | 1.3440e-21 | true | ok | NaN | first\_order |
| 5 | SecondOrderOptimization (Dogleg) | 12500.0 | 143 | 10208 | 9 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM) | 14520.5 | 139 | 10000 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 27312.5 | 106 | 12352 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | LeastSquaresOptim (Dogleg) | 27104.0 | 257 | 474240 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 26937.0 | 237 | 473856 | 9 | 1.0157e-25 | true | ok | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 54646.0 | 354 | 41008 | 8 | 2.7179e-28 | true | ok | NaN | converged |
| 5 | Optim (Newton) | 26229.5 | 183 | 13072 | 8 | 1.5683e-25 | true | ok | NaN | converged |
| 5 | JSOSolvers (trunk) | 50312.5 | 156 | 8256 | 9 | 1.3340e-23 | true | ok | NaN | first\_order |
| 5 | JSOSolvers (tron) | 118833.0 | 265 | 14160 | 10 | 7.2034e-18 | false | not_converged | NaN | small\_residual |
| 5 | Ipopt | 1.2834165e6 | 930 | 48032 | 10 | 2.1001e-28 | true | ok | NaN | first\_order |
| 5 | MadNLP | 442104.5 | 739 | 54288 | 9 | 3.7426e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 93041.5 | 424 | 52064 | 20 | 2.2867e-21 | true | ok | NaN | Success |
| 5 | NonlinearSolve (TrustRegion) | 23916.5 | 231 | 428080 | 8 | 0.0000e+00 | true | ok | NaN | Success |
| 5 | CaNNOLeS | 32166.5 | 188 | 19360 | 8 | 3.1434e-27 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 13979.0 | 143 | 12160 | 9 | 7.3660e-31 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM) | 15917.0 | 139 | 11920 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 32354.5 | 106 | 15328 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | LeastSquaresOptim (Dogleg) | 30792.0 | 261 | 479056 | 14 | 0.0000e+00 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 33167.0 | 237 | 478464 | 9 | 6.5103e-28 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 64875.0 | 354 | 50912 | 8 | 3.2466e-25 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 28375.0 | 183 | 15728 | 8 | 4.1099e-19 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 65000.0 | 160 | 8912 | 9 | 2.1694e-26 | true | ok | NaN | first\_order |
| 6 | JSOSolvers (tron) | 111416.5 | 293 | 16128 | 10 | 1.0902e-17 | true | ok | NaN | first\_order |
| 6 | Ipopt | 1.3744165e6 | 988 | 53264 | 11 | 1.2990e-29 | true | ok | NaN | first\_order |
| 6 | MadNLP | 401562.5 | 700 | 54816 | 8 | 2.5072e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 116875.0 | 448 | 70112 | 22 | 5.1931e-23 | true | ok | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 336209.0 | 2179 | 5201296 | 36 | 2.5072e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 6 | CaNNOLeS | 42625.0 | 188 | 23824 | 8 | 7.3115e-25 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 16208.5 | 143 | 16144 | 8 | 2.0175e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM) | 15395.5 | 139 | 15872 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 35917.0 | 110 | 23488 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | LeastSquaresOptim (Dogleg) | 42729.0 | 251 | 489440 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 43708.5 | 247 | 489696 | 9 | 1.0826e-24 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 96875.0 | 396 | 80352 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 33271.0 | 179 | 21248 | 8 | 2.0175e-24 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 110292.0 | 177 | 10768 | 10 | 4.0468e-18 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 190645.5 | 329 | 19152 | 10 | 4.0071e-21 | true | ok | NaN | first\_order |
| 8 | Ipopt | 2.0143955e6 | 1041 | 65040 | 14 | 1.2446e-19 | true | ok | NaN | first\_order |
| 8 | MadNLP | 501666.5 | 730 | 58080 | 9 | 2.6457e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 230167.0 | 551 | 129392 | 31 | 4.1941e-17 | true | ok | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 44479.5 | 248 | 460208 | 8 | 1.0369e-23 | true | ok | NaN | Success |
| 8 | CaNNOLeS | 62083.0 | 190 | 37040 | 8 | 2.0175e-24 | true | ok | NaN | first\_order |
| 10 | SecondOrderOptimization (Dogleg) | 20479.5 | 143 | 22096 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM) | 19875.0 | 139 | 21792 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 52271.0 | 110 | 34688 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | LeastSquaresOptim (Dogleg) | 61354.0 | 251 | 502608 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 103208.5 | 379 | 827344 | 15 | 3.8422e-25 | true | ok | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 164042.0 | 543 | 149040 | 11 | 9.9092e-29 | true | ok | NaN | converged |
| 10 | Optim (Newton) | 42625.0 | 179 | 29984 | 8 | 1.1201e-22 | true | ok | NaN | converged |
| 10 | JSOSolvers (trunk) | 164479.0 | 182 | 12144 | 10 | 6.3729e-19 | true | ok | NaN | first\_order |
| 10 | JSOSolvers (tron) | 254916.5 | 315 | 19904 | 9 | 4.5011e-19 | true | ok | NaN | first\_order |
| 10 | Ipopt | 1.7068955e6 | 825 | 61552 | 10 | 2.7100e+00 | true | ok | NaN | first\_order |
| 10 | MadNLP | 596937.5 | 766 | 61648 | 9 | 2.7100e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 1.2547915e6 | 1676 | 581568 | 134 | 2.7100e+00 | true | ok | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 65063.0 | 248 | 494544 | 8 | 5.2878e-22 | true | ok | NaN | Success |
| 10 | CaNNOLeS | 89313.0 | 190 | 50432 | 8 | 1.1201e-22 | true | ok | NaN | first\_order |
| 14 | SecondOrderOptimization (Dogleg) | 37208.0 | 143 | 34608 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM) | 35166.5 | 139 | 34240 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM, tall) | 117167.0 | 111 | 67760 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | LeastSquaresOptim (Dogleg) | 121166.5 | 260 | 521040 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 246979.0 | 462 | 1020000 | 18 | 7.5856e-27 | true | ok | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 232229.5 | 457 | 166400 | 9 | 5.0883e-19 | true | ok | NaN | converged |
| 14 | Optim (Newton) | 74916.5 | 206 | 30112 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | JSOSolvers (trunk) | 501708.0 | 466 | 34576 | 11 | 8.5695e-18 | false | not_converged | NaN | not\_desc |
| 14 | JSOSolvers (tron) | 986562.5 | 520 | 33120 | 12 | 3.3083e-19 | true | ok | NaN | first\_order |
| 14 | Ipopt | 2.6231035e6 | 935 | 101472 | 11 | 6.1007e-20 | true | ok | NaN | first\_order |
| 14 | MadNLP | 1.2104375e6 | 817 | 70752 | 14 | 2.7717e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 2.3726045e6 | 1658 | 897968 | 128 | 2.7717e+00 | true | ok | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 157104.0 | 329 | 776864 | 9 | 2.9531e-20 | true | ok | NaN | Success |
| 14 | CaNNOLeS | 186750.0 | 206 | 96352 | 9 | 0.0000e+00 | true | ok | NaN | first\_order |
| 18 | SecondOrderOptimization (Dogleg) | 54167.0 | 161 | 70816 | 9 | 2.4556e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM) | 54187.0 | 157 | 70384 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM, tall) | 219666.5 | 115 | 129616 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | LeastSquaresOptim (Dogleg) | 246791.5 | 286 | 625680 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 18 | LeastSquaresOptim (LM) | 480521.0 | 462 | 1087360 | 18 | 5.6493e-26 | true | ok | NaN | converged |
| 18 | Optim (NewtonTrustRegion) | 432542.0 | 543 | 283136 | 10 | 5.6406e-24 | true | ok | NaN | converged |
| 18 | Optim (Newton) | 129375.0 | 208 | 44352 | 9 | 2.4556e-23 | true | ok | NaN | converged |
| 18 | JSOSolvers (trunk) | 730042.0 | 217 | 20480 | 12 | 1.4858e-18 | true | ok | NaN | first\_order |
| 18 | JSOSolvers (tron) | 1.712125e6 | 522 | 37936 | 10 | 2.2992e-17 | false | not_converged | NaN | small\_residual |
| 18 | Ipopt | 4.483479e6 | 989 | 136304 | 13 | 1.8346e-18 | true | ok | NaN | first\_order |
| 18 | MadNLP | 1.6542505e6 | 835 | 81600 | 14 | 2.8014e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 18 | NonlinearSolve (LM) | 4.3619375e6 | 1914 | 1554048 | 128 | 2.8014e+00 | true | ok | NaN | StalledSuccess |
| 18 | NonlinearSolve (TrustRegion) | 364895.5 | 195 | 117296 | 12 | 2.5221e-17 | true | ok | NaN | Success |
| 18 | CaNNOLeS | 300979.0 | 212 | 155440 | 9 | 2.4556e-23 | true | ok | NaN | first\_order |
| 22 | SecondOrderOptimization (Dogleg) | 80604.0 | 163 | 92288 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM) | 78250.0 | 159 | 91792 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM, tall) | 366396.5 | 123 | 203504 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | LeastSquaresOptim (Dogleg) | 457479.0 | 299 | 669216 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | LeastSquaresOptim (LM) | 894145.5 | 479 | 1144128 | 18 | 2.3716e-25 | true | ok | NaN | converged |
| 22 | Optim (NewtonTrustRegion) | 890166.0 | 791 | 533856 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | Optim (Newton) | 244583.5 | 218 | 58656 | 9 | 4.1424e-22 | true | ok | NaN | converged |
| 22 | JSOSolvers (trunk) | 1.270834e6 | 490 | 43248 | 11 | 3.3980e-17 | false | not_converged | NaN | not\_desc |
| 22 | JSOSolvers (tron) | 1.667375e6 | 382 | 35600 | 10 | 2.8812e-18 | true | ok | NaN | first\_order |
| 22 | Ipopt | 6.438417e6 | 1039 | 178800 | 13 | 1.0568e-28 | true | ok | NaN | first\_order |
| 22 | MadNLP | 2.8811875e6 | 801 | 93968 | 15 | 2.8186e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 22 | NonlinearSolve (LM) | 8.35125e6 | 2239 | 2226368 | 129 | 2.8186e+00 | true | ok | NaN | StalledSuccess |
| 22 | NonlinearSolve (TrustRegion) | 726104.0 | 211 | 179792 | 12 | 2.4364e-17 | true | ok | NaN | Success |
| 22 | CaNNOLeS | 451833.5 | 235 | 204688 | 9 | 4.1423e-22 | true | ok | NaN | first\_order |
| 26 | SecondOrderOptimization (Dogleg) | 111583.5 | 163 | 133264 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM) | 114937.5 | 159 | 132704 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 644666.5 | 123 | 323856 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | LeastSquaresOptim (Dogleg) | 790521.0 | 326 | 786016 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 26 | LeastSquaresOptim (LM) | 1.444125e6 | 479 | 1209248 | 18 | 7.4077e-25 | true | ok | NaN | converged |
| 26 | Optim (NewtonTrustRegion) | 1.2259995e6 | 804 | 730624 | 13 | 1.0484e-22 | true | ok | NaN | converged |
| 26 | Optim (Newton) | 374667.0 | 237 | 72480 | 10 | 1.2434e-30 | true | ok | NaN | converged |
| 26 | JSOSolvers (trunk) | 1.6186665e6 | 240 | 31696 | 12 | 2.9603e-19 | true | ok | NaN | first\_order |
| 26 | JSOSolvers (tron) | 2.3089585e6 | 394 | 43936 | 11 | 2.0456e-20 | true | ok | NaN | first\_order |
| 26 | Ipopt | 7.9683955e6 | 1044 | 258320 | 12 | 3.3964e-17 | true | ok | NaN | first\_order |
| 26 | MadNLP | 4.125187e6 | 822 | 108784 | 16 | 2.8298e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 26 | NonlinearSolve (LM) | 1.29953755e7 | 2239 | 3056896 | 129 | 2.8298e+00 | true | ok | NaN | StalledSuccess |
| 26 | NonlinearSolve (TrustRegion) | 1.4480415e6 | 219 | 257856 | 11 | 1.6988e-19 | true | ok | NaN | Success |
| 26 | CaNNOLeS | 711916.0 | 245 | 320368 | 10 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32 | SecondOrderOptimization (Dogleg) | 164271.0 | 163 | 178192 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 170042.0 | 159 | 177536 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 1.20075e6 | 123 | 557120 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 1.6435e6 | 326 | 909104 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 3.0729585e6 | 479 | 1355072 | 18 | 3.9810e-22 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 2.164625e6 | 868 | 1059056 | 14 | 1.3363e-29 | true | ok | NaN | converged |
| 32 | Optim (Newton) | 687000.0 | 237 | 106176 | 10 | 4.5840e-19 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 2.770833e6 | 507 | 63296 | 12 | 1.6641e-18 | false | not_converged | NaN | not\_desc |
| 32 | JSOSolvers (tron) | 3.592042e6 | 392 | 59040 | 11 | 1.9552e-18 | false | not_converged | NaN | small\_residual |
| 32 | Ipopt | 1.1477583e7 | 950 | 304896 | 11 | 6.1082e-32 | true | ok | NaN | first\_order |
| 32 | MadNLP | 5.7732915e6 | 907 | 141456 | 12 | 9.0856e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 2.0229979e7 | 2226 | 4501776 | 128 | 2.8407e+00 | true | ok | NaN | StalledSuccess |
| 32 | NonlinearSolve (TrustRegion) | 3.2430625e6 | 219 | 436736 | 15 | 6.5356e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 1.0382705e6 | 250 | 445760 | 10 | 4.5840e-19 | true | ok | NaN | first\_order |
