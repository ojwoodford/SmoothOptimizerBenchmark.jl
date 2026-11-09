# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-09T16:49:06
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b201e68

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 32 | NLLSModel (Sparse) | 167.0 | 0 | 0 | 1402.8 | 0 | 0 |
| 32 | Standalone (Sparse) | 139.56643356643357 | 0 | 0 | 2259.222222222222 | 19 | 7792 |
| 32 | NLPModels (MathOptNLSModel) | 85.44915254237289 | 2 | 32 | 8083.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 301.6119402985075 | 0 | 0 | 3119.0 | 0 | 0 |
| 64 | Standalone (Sparse) | 261.90909090909093 | 0 | 0 | 3458.3333333333335 | 19 | 17136 |
| 64 | NLPModels (MathOptNLSModel) | 101.46632124352331 | 2 | 32 | 15000.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 582.1428571428571 | 0 | 0 | 6197.75 | 0 | 0 |
| 128 | Standalone (Sparse) | 527.7692307692307 | 0 | 0 | 7236.0 | 21 | 33520 |
| 128 | NLPModels (MathOptNLSModel) | 123.9493670886076 | 2 | 32 | 29458.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 1150.4444444444443 | 0 | 0 | 12250.0 | 0 | 0 |
| 256 | Standalone (Sparse) | 1027.1 | 0 | 0 | 15416.0 | 23 | 67376 |
| 256 | NLPModels (MathOptNLSModel) | 178.83185840707964 | 2 | 32 | 59125.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 2296.3333333333335 | 0 | 0 | 24584.0 | 0 | 0 |
| 512 | Standalone (Sparse) | 2050.0 | 0 | 0 | 27250.0 | 23 | 134192 |
| 512 | NLPModels (MathOptNLSModel) | 257.9113924050633 | 2 | 32 | 117791.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 4566.6 | 0 | 0 | 49458.0 | 0 | 0 |
| 1024 | Standalone (Sparse) | 4091.6 | 0 | 0 | 56042.0 | 23 | 267856 |
| 1024 | NLPModels (MathOptNLSModel) | 430.5625 | 2 | 32 | 301541.0 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 9444.333333333334 | 0 | 0 | 98417.0 | 0 | 0 |
| 2048 | Standalone (Sparse) | 8152.666666666667 | 0 | 0 | 129333.0 | 24 | 502320 |
| 2048 | NLPModels (MathOptNLSModel) | 760.4285714285714 | 2 | 32 | 597125.0 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 18333.0 | 0 | 0 | 195584.0 | 0 | 0 |
| 4096 | Standalone (Sparse) | 16792.0 | 0 | 0 | 223958.0 | 24 | 1020464 |
| 4096 | NLPModels (MathOptNLSModel) | 1386.1333333333334 | 2 | 32 | 2.114375e6 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 38041.0 | 0 | 0 | 392333.0 | 0 | 0 |
| 8192 | Standalone (Sparse) | 32666.0 | 0 | 0 | 527458.0 | 24 | 2007600 |
| 8192 | NLPModels (MathOptNLSModel) | 2843.75 | 2 | 32 | 7.507166e6 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 75500.0 | 0 | 0 | 449041.0 | 5 | 6544 |
| 16384 | Standalone (Sparse) | 69875.0 | 0 | 0 | 997459.0 | 24 | 3981872 |
| 16384 | NLPModels (MathOptNLSModel) | 5250.0 | 2 | 32 | 1.8711e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 147042.0 | 0 | 0 | 745750.0 | 5 | 6544 |
| 32768 | Standalone (Sparse) | 138375.0 | 0 | 0 | 1.925417e6 | 24 | 7897648 |
| 32768 | NLPModels (MathOptNLSModel) | 10375.0 | 2 | 32 | 4.1896291e7 | 5 | 128 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 32 | SecondOrderOptimization (Dogleg) | 55791.5 | 148 | 54096 | 10 | 4.0048e-27 | true |
| 32 | SecondOrderOptimization (LM) | 32208.0 | 143 | 70240 | 4 | 7.9500e-20 | true |
| 32 | LeastSquaresOptim (Dogleg) | 195938.0 | 139 | 22864 | 13 | 1.4747e-11 | true |
| 32 | LeastSquaresOptim (LM) | 339479.0 | 187 | 34496 | 19 | 1.1774e-15 | true |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32 | Optim (Newton) | 66958.5 | 355 | 103392 | 3 | 2.8725e-27 | true |
| 32 | JSOSolvers (trunk) | 524708.0 | 617 | 39760 | 6 | 7.8113e-20 | false |
| 32 | JSOSolvers (tron) | 749875.0 | 716 | 40832 | 4 | 2.2735e-21 | false |
| 32 | Ipopt | 721125.5 | 390 | 30832 | 3 | 3.4854e-63 | true |
| 32 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 32 | NonlinearSolve (LM) | 470167.0 | 666 | 92768 | 17 | 1.5166e-18 | true |
| 32 | NonlinearSolve (TrustRegion) | 59104.5 | 671 | 76384 | 3 | 1.9509e-19 | true |
| 32 | CaNNOLeS | 50729.5 | 180 | 48880 | 3 | 3.3924e-27 | true |
| 64 | SecondOrderOptimization (Dogleg) | 94959.0 | 230 | 96784 | 12 | 9.0182e-26 | true |
| 64 | SecondOrderOptimization (LM) | 56375.0 | 222 | 99344 | 5 | 1.0959e-18 | true |
| 64 | LeastSquaresOptim (Dogleg) | 2.9171708e7 | 5035 | 2512096 | 500 | 8.4437e-03 | false |
| 64 | LeastSquaresOptim (LM) | 2.6302295e6 | 297 | 131872 | 27 | 8.3599e-14 | true |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 64 | Optim (Newton) | 99771.0 | 359 | 203744 | 3 | 1.0023e-25 | true |
| 64 | JSOSolvers (trunk) | 2.62625e6 | 1467 | 84912 | 7 | 5.2143e-22 | false |
| 64 | JSOSolvers (tron) | 7.207e6 | 3573 | 189408 | 13 | 6.3499e-17 | false |
| 64 | Ipopt | 702833.5 | 338 | 49680 | 2 | 3.8541e-47 | true |
| 64 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 64 | NonlinearSolve (LM) | 1.777375e6 | 673 | 214528 | 20 | 3.0467e-21 | true |
| 64 | NonlinearSolve (TrustRegion) | 79145.5 | 678 | 176080 | 3 | 2.4609e-19 | true |
| 64 | CaNNOLeS | 96083.5 | 194 | 97008 | 3 | 9.6264e-26 | true |
| 128 | SecondOrderOptimization (Dogleg) | 197000.0 | 243 | 184896 | 13 | 2.5396e-24 | true |
| 128 | SecondOrderOptimization (LM) | 374145.5 | 234 | 190000 | 7 | 3.5241e-24 | true |
| 128 | LeastSquaresOptim (Dogleg) | 1.03485917e8 | 5035 | 2527168 | 500 | 1.6872e+01 | false |
| 128 | LeastSquaresOptim (LM) | 2.25873459e8 | 5335 | 8514864 | 443 | 1.1009e-09 | true |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 128 | Optim (Newton) | 207604.0 | 477 | 505984 | 4 | 2.9738e-24 | true |
| 128 | JSOSolvers (trunk) | 1.9805375e7 | 4457 | 237680 | 8 | 4.9369e-18 | false |
| 128 | JSOSolvers (tron) | 1.266656125e9 | 259830 | 12503200 | 12 | 1.1094e-16 | false |
| 128 | Ipopt | 951417.0 | 349 | 69744 | 2 | 7.4496e-46 | true |
| 128 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 128 | NonlinearSolve (LM) | 7.0174585e6 | 693 | 493120 | 22 | 3.6239e-18 | true |
| 128 | NonlinearSolve (TrustRegion) | 86021.5 | 688 | 150192 | 3 | 3.8619e-19 | true |
| 128 | CaNNOLeS | 186312.5 | 217 | 174944 | 3 | 2.6889e-24 | true |
| 256 | SecondOrderOptimization (Dogleg) | 456791.5 | 288 | 367088 | 15 | 9.7148e-23 | true |
| 256 | SecondOrderOptimization (LM) | 312375.0 | 277 | 377280 | 8 | 1.2124e-22 | true |
| 256 | LeastSquaresOptim (Dogleg) | 3.8324825e8 | 6048 | 9732064 | 500 | 8.4444e+01 | false |
| 256 | LeastSquaresOptim (LM) | 9.39346333e8 | 6033 | 9654480 | 500 | 2.5926e+01 | false |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 256 | Optim (Newton) | 369791.5 | 505 | 1004416 | 4 | 8.2267e-23 | true |
| 256 | JSOSolvers (trunk) | 4.03087375e9 | 422824 | 20335344 | 208 | 2.5351e-17 | false |
| 256 | JSOSolvers (tron) | 3.0000320792e10 | 3127509 | 150170528 | 63 | 1.5951e-12 | false |
| 256 | Ipopt | 1.3855e6 | 369 | 138704 | 2 | 1.2199e-51 | true |
| 256 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 256 | NonlinearSolve (LM) | 3.0060792e7 | 744 | 1519680 | 25 | 9.2283e-19 | true |
| 256 | NonlinearSolve (TrustRegion) | 125437.5 | 746 | 290304 | 3 | 6.8203e-19 | true |
| 256 | CaNNOLeS | 353687.0 | 240 | 352864 | 3 | 9.7289e-23 | true |
| 512 | SecondOrderOptimization (Dogleg) | 940062.5 | 296 | 729456 | 17 | 3.2223e-21 | true |
| 512 | SecondOrderOptimization (LM) | 602083.5 | 280 | 745696 | 9 | 4.0273e-21 | true |
| 512 | LeastSquaresOptim (Dogleg) | 1.113931458e9 | 6048 | 9774688 | 500 | 2.0403e+02 | false |
| 512 | LeastSquaresOptim (LM) | 1.189709167e9 | 6125 | 12003088 | 500 | 2.0331e+02 | false |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 512 | Optim (Newton) | 661791.5 | 521 | 1995136 | 4 | 2.5808e-21 | true |
| 512 | JSOSolvers (trunk) | 3.000024675e10 | 1573181 | 75581120 | 386 | 2.3576e+01 | false |
| 512 | JSOSolvers (tron) | 3.0000361958e10 | 1556061 | 74789056 | 16 | 1.1038e+01 | false |
| 512 | Ipopt | 2.3177085e6 | 371 | 283760 | 2 | 1.6725e-50 | true |
| 512 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 512 | NonlinearSolve (LM) | 1.06143e8 | 9990 | 52027936 | 28 | 2.7934e-17 | true |
| 512 | NonlinearSolve (TrustRegion) | 214520.5 | 752 | 581008 | 3 | 1.2830e-18 | true |
| 512 | CaNNOLeS | 719271.0 | 248 | 725728 | 3 | 3.4085e-21 | true |
| 1024 | SecondOrderOptimization (Dogleg) | 1.9298545e6 | 297 | 1507168 | 18 | 8.9471e-20 | true |
| 1024 | SecondOrderOptimization (LM) | 1.3048745e6 | 283 | 1556224 | 11 | 8.5848e-20 | true |
| 1024 | LeastSquaresOptim (Dogleg) | 1.768852375e9 | 6108 | 11335456 | 500 | 4.6396e+02 | false |
| 1024 | LeastSquaresOptim (LM) | 2.103520375e9 | 6077 | 10903824 | 500 | 4.6397e+02 | false |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1024 | Optim (Newton) | 1.2246875e6 | 521 | 4205600 | 4 | 8.5372e-20 | true |
| 1024 | JSOSolvers (trunk) | 3.0000297333e10 | 781489 | 37643776 | 98 | 3.9582e+02 | false |
| 1024 | JSOSolvers (tron) | 3.0000685375e10 | 776197 | 37461248 | 4 | 4.1389e+02 | false |
| 1024 | Ipopt | 5.00375e6 | 375 | 454864 | 2 | 1.9886e-46 | true |
| 1024 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 1024 | NonlinearSolve (LM) | 2.287782291e9 | 56288 | 588934336 | 166 | 6.5760e-16 | true |
| 1024 | NonlinearSolve (TrustRegion) | 979479.0 | 769 | 3160128 | 3 | 2.5744e-18 | true |
| 1024 | CaNNOLeS | 1.4526045e6 | 248 | 1405664 | 3 | 8.9525e-20 | true |
| 2048 | SecondOrderOptimization (Dogleg) | 4.2005835e6 | 304 | 2841440 | 20 | 2.9176e-18 | true |
| 2048 | SecondOrderOptimization (LM) | 2.733854e6 | 288 | 2923232 | 12 | 2.8708e-18 | true |
| 2048 | LeastSquaresOptim (Dogleg) | 2.975516916e9 | 6096 | 11472992 | 500 | 9.8231e+02 | false |
| 2048 | LeastSquaresOptim (LM) | 3.654873458e9 | 6053 | 10475920 | 500 | 9.8236e+02 | false |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2048 | Optim (Newton) | 2.4271665e6 | 526 | 7774080 | 4 | 2.8565e-18 | true |
| 2048 | JSOSolvers (trunk) | 3.0001064292e10 | 386497 | 18829184 | 26 | 9.0925e+02 | false |
| 2048 | JSOSolvers (tron) | 3.0002938583e10 | 380311 | 18663648 | 1 | 9.3119e+02 | false |
| 2048 | Ipopt | 1.04488745e7 | 379 | 915984 | 2 | 3.7204e-44 | true |
| 2048 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 2048 | NonlinearSolve (LM) | 8.957294709e9 | 58062 | 1226869152 | 171 | 2.2750e-14 | true |
| 2048 | NonlinearSolve (TrustRegion) | 1.8614375e6 | 775 | 6263968 | 3 | 8.0194e-18 | true |
| 2048 | CaNNOLeS | 4.0500415e6 | 250 | 2700032 | 3 | 2.9864e-18 | true |
| 4096 | SecondOrderOptimization (Dogleg) | 1.702354e6 | 286 | 5813056 | 2 | 2.0477e+03 | true |
| 4096 | SecondOrderOptimization (LM) | 5.938896e6 | 288 | 5977056 | 13 | 9.6078e-17 | true |
| 4096 | LeastSquaresOptim (Dogleg) | 1.49520125e8 | 80 | 729472 | 2 | 2.0477e+03 | true |
| 4096 | LeastSquaresOptim (LM) | 5.182161292e9 | 5687 | 7927472 | 500 | 2.0119e+03 | false |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 4096 | Optim (Newton) | 4.876229e6 | 574 | 15960704 | 4 | 9.6838e-17 | true |
| 4096 | JSOSolvers (trunk) | 3.0003325459e10 | 124279 | 6521248 | 6 | 1.9537e+03 | false |
| 4096 | JSOSolvers (tron) | 3.0008440542e10 | 122356 | 6691664 | 1 | 1.9684e+03 | false |
| 4096 | Ipopt | 2.4984458e7 | 383 | 1846544 | 2 | 0.0000e+00 | true |
| 4096 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 4096 | NonlinearSolve (LM) | 3.0012366125e10 | 759 | 291010752 | 102 | 8.6762e-13 | false |
| 4096 | NonlinearSolve (TrustRegion) | 4.35445e7 | 2134 | 111083920 | 35 | 9.6297e-17 | true |
| 4096 | CaNNOLeS | 1.2382521e7 | 252 | 5288736 | 3 | 9.9773e-17 | true |
| 8192 | SecondOrderOptimization (Dogleg) | 2.7282085e6 | 285 | 11363664 | 1 | 4.0958e+03 | true |
| 8192 | SecondOrderOptimization (LM) | 1.41647505e7 | 288 | 11691520 | 16 | 3.0995e-15 | true |
| 8192 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | LeastSquaresOptim (LM) | 2.563354e6 | 53 | 790240 | 1 | 4.0954e+03 | true |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | Optim (Newton) | 1.4883542e7 | 742 | 44575968 | 6 | 3.1978e-15 | true |
| 8192 | JSOSolvers (trunk) | 3.0010076625e10 | 28751 | 2492960 | 3 | 4.0468e+03 | false |
| 8192 | JSOSolvers (tron) | 3.0028028667e10 | 28669 | 3014432 | 1 | 4.0470e+03 | false |
| 8192 | Ipopt | 5.3098875e7 | 393 | 3674448 | 2 | 0.0000e+00 | true |
| 8192 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | NonlinearSolve (LM) | 3.0813026083e10 | 13414 | 1060837632 | 38 | 3.1470e-11 | false |
| 8192 | NonlinearSolve (TrustRegion) | 8.69887295e7 | 2157 | 210924288 | 35 | 3.0302e-15 | true |
| 8192 | CaNNOLeS | 2.9330625e7 | 254 | 10449728 | 3 | 3.1855e-15 | true |
| 16384 | SecondOrderOptimization (Dogleg) | 6.061083e6 | 334 | 26057616 | 1 | 8.1918e+03 | true |
| 16384 | SecondOrderOptimization (LM) | 2.4978e7 | 432 | 26837488 | 19 | 1.2684e-13 | true |
| 16384 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | LeastSquaresOptim (LM) | 5.115833e6 | 54 | 1577664 | 1 | 8.1914e+03 | true |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | Optim (Newton) | 3.8490417e7 | 989 | 114533424 | 8 | 1.1880e-13 | true |
| 16384 | JSOSolvers (trunk) | 3.0016218292e10 | 9273 | 2672128 | 3 | 8.1648e+03 | false |
| 16384 | JSOSolvers (tron) | 3.0080172875e10 | 9206 | 3719552 | 1 | 8.1650e+03 | false |
| 16384 | Ipopt | 1.056345835e8 | 403 | 7346384 | 2 | 0.0000e+00 | true |
| 16384 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | NonlinearSolve (LM) | 3.2350086792e10 | 3974 | 560462592 | 10 | 8.1849e+03 | false |
| 16384 | NonlinearSolve (TrustRegion) | 1.72739333e8 | 2153 | 411357888 | 35 | 9.5663e-14 | true |
| 16384 | CaNNOLeS | 6.995609667e9 | 1252 | 21081632 | 501 | 1.0151e-13 | false |
| 32768 | SecondOrderOptimization (Dogleg) | 1.40548335e7 | 334 | 51766160 | 1 | 1.6384e+04 | true |
| 32768 | SecondOrderOptimization (LM) | 4.68235334e8 | 937 | 53862336 | 120 | 2.0568e-08 | true |
| 32768 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | Optim (Newton) | 8.6926042e7 | 806 | 244132624 | 5 | 5.9465e-08 | false |
| 32768 | JSOSolvers (trunk) | 3.0041633708e10 | 4503 | 4671392 | 3 | 1.6365e+04 | false |
| 32768 | JSOSolvers (tron) | 3.0153222541e10 | 4578 | 6776256 | 1 | 1.6365e+04 | false |
| 32768 | Ipopt | 2.13219125e8 | 407 | 14674192 | 2 | 0.0000e+00 | true |
| 32768 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | CaNNOLeS | 1.4058924791e10 | 1254 | 43839040 | 501 | 3.2323e-12 | false |
