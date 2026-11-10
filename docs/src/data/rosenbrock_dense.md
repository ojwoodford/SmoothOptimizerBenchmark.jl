# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-10T11:16:10
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 4aac5c9

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel | 53.5448275862069 | 1 | 16 | 240.0568181818182 | 1 | 32 |
| 2 | Standalone | 56.33740831295844 | 1 | 16 | 625.0 | 7 | 528 |
| 2 | NLPModels (MathOptNLSModel) | 729.925925925926 | 5 | 80 | 1663.4615384615386 | 9 | 224 |
| 3 | NLLSModel | 53.46233766233766 | 1 | 16 | 270.0379746835443 | 1 | 32 |
| 3 | Standalone | 60.309973045822105 | 1 | 16 | 709.0 | 7 | 592 |
| 3 | NLPModels (MathOptNLSModel) | 862.304347826087 | 5 | 80 | 1912.5 | 9 | 224 |
| 4 | NLLSModel | 59.846753246753245 | 1 | 16 | 325.6307692307692 | 1 | 32 |
| 4 | Standalone | 67.3374613003096 | 1 | 16 | 750.0 | 7 | 688 |
| 4 | NLPModels (MathOptNLSModel) | 1149.157894736842 | 5 | 80 | 2412.0 | 9 | 224 |
| 5 | NLLSModel | 62.01298701298701 | 1 | 16 | 362.3953488372093 | 1 | 32 |
| 5 | Standalone | 72.9895104895105 | 1 | 16 | 875.0 | 7 | 784 |
| 5 | NLPModels (MathOptNLSModel) | 1380.9285714285713 | 5 | 80 | 3238.1428571428573 | 9 | 224 |
| 6 | NLLSModel | 62.32017543859649 | 1 | 16 | 439.16 | 1 | 32 |
| 6 | Standalone | 76.34265734265735 | 1 | 16 | 1042.0 | 7 | 944 |
| 6 | NLPModels (MathOptNLSModel) | 1805.5833333333333 | 5 | 80 | 4325.0 | 9 | 224 |
| 8 | NLLSModel | 76.14028776978417 | 1 | 16 | 635.40625 | 1 | 32 |
| 8 | Standalone | 82.68482490272373 | 1 | 16 | 1541.0 | 7 | 1296 |
| 8 | NLPModels (MathOptNLSModel) | 2807.25 | 5 | 80 | 7347.333333333333 | 9 | 224 |
| 10 | NLLSModel | 96.5909090909091 | 1 | 16 | 892.0454545454545 | 1 | 32 |
| 10 | Standalone | 86.62280701754386 | 1 | 16 | 2250.0 | 7 | 1808 |
| 10 | NLPModels (MathOptNLSModel) | 4333.5 | 5 | 80 | 12917.0 | 9 | 224 |
| 14 | NLLSModel | 144.94285714285715 | 1 | 16 | 1544.642857142857 | 1 | 32 |
| 14 | Standalone | 107.73056994818653 | 1 | 16 | 5666.0 | 8 | 1808 |
| 14 | NLPModels (MathOptNLSModel) | 9416.666666666666 | 5 | 80 | 40458.0 | 9 | 224 |
| 18 | NLLSModel | 254.2134831460674 | 1 | 16 | 2380.25 | 1 | 32 |
| 18 | Standalone | 131.84868421052633 | 1 | 16 | 8958.0 | 8 | 2624 |
| 18 | NLPModels (MathOptNLSModel) | 16250.0 | 5 | 80 | 66667.0 | 9 | 224 |
| 22 | NLLSModel | 364.9193548387097 | 1 | 16 | 3645.8333333333335 | 1 | 32 |
| 22 | Standalone | 148.57364341085272 | 1 | 16 | 18125.0 | 9 | 3552 |
| 22 | NLPModels (MathOptNLSModel) | 22625.0 | 5 | 80 | 137458.0 | 9 | 224 |
| 26 | NLLSModel | 464.8222222222222 | 1 | 16 | 4791.6 | 1 | 32 |
| 26 | Standalone | 175.35652173913044 | 1 | 16 | 27166.0 | 9 | 4240 |
| 26 | NLPModels (MathOptNLSModel) | 32208.0 | 5 | 80 | 212125.0 | 9 | 224 |
| 32 | NLLSModel | 683.9310344827586 | 1 | 16 | 7125.0 | 1 | 32 |
| 32 | Standalone | 229.16666666666666 | 1 | 16 | 58500.0 | 9 | 6624 |
| 32 | NLPModels (MathOptNLSModel) | 47375.0 | 5 | 80 | 378417.0 | 9 | 224 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 7125.0 | 139 | 6320 | 6 | 7.7016e-25 | true |
| 2 | SecondOrderOptimization (LM) | 6250.0 | 136 | 6432 | 6 | 7.7016e-25 | true |
| 2 | LeastSquaresOptim (Dogleg) | 19228.5 | 193 | 359168 | 7 | 0.0000e+00 | true |
| 2 | LeastSquaresOptim (LM) | 19042.0 | 189 | 359040 | 7 | 1.5248e-24 | true |
| 2 | Optim (NewtonTrustRegion) | 16854.5 | 237 | 15504 | 6 | 7.7016e-25 | true |
| 2 | Optim (Newton) | 14292.0 | 145 | 7168 | 6 | 7.7016e-25 | true |
| 2 | JSOSolvers (trunk) | 15187.5 | 113 | 5440 | 7 | 5.5901e-28 | true |
| 2 | JSOSolvers (tron) | 25792.0 | 200 | 10064 | 6 | 6.1357e-20 | true |
| 2 | Ipopt | 737000.0 | 688 | 30944 | 7 | 1.5884e-26 | true |
| 2 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 2 | NonlinearSolve (LM) | 36750.0 | 343 | 22720 | 13 | 1.6316e-22 | true |
| 2 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2 | CaNNOLeS | 15208.0 | 182 | 9760 | 6 | 7.7016e-25 | true |
| 3 | SecondOrderOptimization (Dogleg) | 8437.5 | 140 | 6992 | 7 | 7.5249e-20 | true |
| 3 | SecondOrderOptimization (LM) | 7541.0 | 136 | 7152 | 7 | 7.5232e-20 | true |
| 3 | LeastSquaresOptim (Dogleg) | 16229.5 | 217 | 413344 | 8 | 0.0000e+00 | true |
| 3 | LeastSquaresOptim (LM) | 23437.5 | 237 | 464736 | 9 | 5.6818e-30 | true |
| 3 | Optim (NewtonTrustRegion) | 29750.0 | 321 | 24304 | 7 | 9.2456e-22 | true |
| 3 | Optim (Newton) | 17770.5 | 162 | 8880 | 7 | 7.5249e-20 | true |
| 3 | JSOSolvers (trunk) | 20750.0 | 120 | 5968 | 7 | 1.8161e-20 | true |
| 3 | JSOSolvers (tron) | 71666.0 | 212 | 10864 | 7 | 2.7095e-17 | false |
| 3 | Ipopt | 775146.0 | 662 | 30720 | 7 | 8.0760e-18 | true |
| 3 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 3 | NonlinearSolve (LM) | 55937.0 | 373 | 29664 | 15 | 8.5268e-23 | true |
| 3 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 3 | CaNNOLeS | 18584.0 | 185 | 12256 | 7 | 7.5249e-20 | true |
| 4 | SecondOrderOptimization (Dogleg) | 9250.0 | 140 | 8208 | 7 | 1.3440e-21 | true |
| 4 | SecondOrderOptimization (LM) | 8166.5 | 136 | 8480 | 7 | 1.3444e-21 | true |
| 4 | LeastSquaresOptim (Dogleg) | 18479.5 | 217 | 417472 | 8 | 0.0000e+00 | true |
| 4 | LeastSquaresOptim (LM) | 22625.0 | 237 | 469376 | 9 | 4.8047e-28 | true |
| 4 | Optim (NewtonTrustRegion) | 40458.0 | 354 | 34240 | 8 | 0.0000e+00 | true |
| 4 | Optim (Newton) | 18395.5 | 162 | 10288 | 7 | 1.3440e-21 | true |
| 4 | JSOSolvers (trunk) | 185583.0 | 402 | 25920 | 7 | 1.2381e-17 | false |
| 4 | JSOSolvers (tron) | 59896.0 | 246 | 13008 | 8 | 1.7694e-23 | true |
| 4 | Ipopt | 1.2171665e6 | 980 | 47328 | 13 | 3.2978e-29 | true |
| 4 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 4 | NonlinearSolve (LM) | 83395.5 | 415 | 43664 | 18 | 3.9178e-20 | true |
| 4 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 4 | CaNNOLeS | 22645.5 | 186 | 15888 | 7 | 1.3440e-21 | true |
| 5 | SecondOrderOptimization (Dogleg) | 12104.0 | 143 | 9328 | 9 | 0.0000e+00 | true |
| 5 | SecondOrderOptimization (LM) | 14083.0 | 143 | 9792 | 9 | 4.6966e-23 | true |
| 5 | LeastSquaresOptim (Dogleg) | 35354.5 | 257 | 474240 | 13 | 0.0000e+00 | true |
| 5 | LeastSquaresOptim (LM) | 27792.0 | 237 | 473856 | 9 | 1.0157e-25 | true |
| 5 | Optim (NewtonTrustRegion) | 49916.0 | 354 | 41008 | 8 | 2.7179e-28 | true |
| 5 | Optim (Newton) | 22541.0 | 183 | 13072 | 8 | 1.5683e-25 | true |
| 5 | JSOSolvers (trunk) | 49979.5 | 156 | 8256 | 9 | 1.3340e-23 | true |
| 5 | JSOSolvers (tron) | 122708.0 | 266 | 14192 | 10 | 7.2034e-18 | false |
| 5 | Ipopt | 1.1788125e6 | 930 | 48032 | 10 | 2.1001e-28 | true |
| 5 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 5 | NonlinearSolve (LM) | 118437.5 | 445 | 58320 | 20 | 2.2867e-21 | true |
| 5 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 5 | CaNNOLeS | 30396.0 | 188 | 19360 | 8 | 3.1434e-27 | true |
| 6 | SecondOrderOptimization (Dogleg) | 13958.5 | 143 | 11040 | 9 | 7.3660e-31 | true |
| 6 | SecondOrderOptimization (LM) | 15917.0 | 143 | 11712 | 9 | 2.5627e-20 | true |
| 6 | LeastSquaresOptim (Dogleg) | 32479.5 | 261 | 479056 | 14 | 0.0000e+00 | true |
| 6 | LeastSquaresOptim (LM) | 34896.0 | 237 | 478464 | 9 | 6.5103e-28 | true |
| 6 | Optim (NewtonTrustRegion) | 59708.5 | 354 | 50912 | 8 | 3.2466e-25 | true |
| 6 | Optim (Newton) | 24375.0 | 183 | 15728 | 8 | 4.1099e-19 | true |
| 6 | JSOSolvers (trunk) | 62833.5 | 160 | 8912 | 9 | 2.1694e-26 | true |
| 6 | JSOSolvers (tron) | 110000.0 | 294 | 16160 | 10 | 1.0902e-17 | true |
| 6 | Ipopt | 1.3421245e6 | 988 | 53264 | 11 | 1.2990e-29 | true |
| 6 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 6 | NonlinearSolve (LM) | 159541.5 | 475 | 81936 | 22 | 5.1931e-23 | true |
| 6 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 6 | CaNNOLeS | 40541.5 | 188 | 23824 | 8 | 7.3115e-25 | true |
| 8 | SecondOrderOptimization (Dogleg) | 16041.5 | 141 | 14560 | 8 | 2.0175e-24 | true |
| 8 | SecondOrderOptimization (LM) | 14729.5 | 136 | 15552 | 8 | 2.0194e-24 | true |
| 8 | LeastSquaresOptim (Dogleg) | 45208.0 | 251 | 489440 | 9 | 0.0000e+00 | true |
| 8 | LeastSquaresOptim (LM) | 46333.5 | 247 | 489696 | 9 | 1.0826e-24 | true |
| 8 | Optim (NewtonTrustRegion) | 99313.0 | 396 | 80352 | 9 | 0.0000e+00 | true |
| 8 | Optim (Newton) | 31646.0 | 179 | 21248 | 8 | 2.0175e-24 | true |
| 8 | JSOSolvers (trunk) | 113646.0 | 177 | 10768 | 10 | 4.0468e-18 | true |
| 8 | JSOSolvers (tron) | 199020.5 | 330 | 19184 | 10 | 4.0071e-21 | true |
| 8 | Ipopt | 1.922396e6 | 1041 | 65040 | 14 | 1.2446e-19 | true |
| 8 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 8 | NonlinearSolve (LM) | 323541.5 | 605 | 159920 | 31 | 4.1941e-17 | true |
| 8 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 8 | CaNNOLeS | 57563.0 | 190 | 37040 | 8 | 2.0175e-24 | true |
| 10 | SecondOrderOptimization (Dogleg) | 19625.0 | 141 | 19776 | 8 | 1.1201e-22 | true |
| 10 | SecondOrderOptimization (LM) | 18167.0 | 136 | 21456 | 8 | 1.1201e-22 | true |
| 10 | LeastSquaresOptim (Dogleg) | 64917.0 | 251 | 502608 | 9 | 0.0000e+00 | true |
| 10 | LeastSquaresOptim (LM) | 115979.0 | 379 | 827344 | 15 | 3.8422e-25 | true |
| 10 | Optim (NewtonTrustRegion) | 160208.5 | 543 | 149040 | 11 | 9.9092e-29 | true |
| 10 | Optim (Newton) | 41062.5 | 179 | 29984 | 8 | 1.1201e-22 | true |
| 10 | JSOSolvers (trunk) | 168209.0 | 182 | 12144 | 10 | 6.3729e-19 | true |
| 10 | JSOSolvers (tron) | 264896.0 | 316 | 19920 | 9 | 4.5011e-19 | true |
| 10 | Ipopt | 1.594146e6 | 825 | 61552 | 10 | 2.7100e+00 | true |
| 10 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 10 | NonlinearSolve (LM) | 2.0912915e6 | 2039 | 821904 | 134 | 2.7100e+00 | true |
| 10 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10 | CaNNOLeS | 87542.0 | 190 | 50432 | 8 | 1.1201e-22 | true |
| 14 | SecondOrderOptimization (Dogleg) | 34479.5 | 142 | 30800 | 9 | 0.0000e+00 | true |
| 14 | SecondOrderOptimization (LM) | 34687.5 | 136 | 33904 | 9 | 0.0000e+00 | true |
| 14 | LeastSquaresOptim (Dogleg) | 121104.5 | 260 | 521040 | 9 | 0.0000e+00 | true |
| 14 | LeastSquaresOptim (LM) | 247375.0 | 462 | 1020000 | 18 | 7.5856e-27 | true |
| 14 | Optim (NewtonTrustRegion) | 233854.0 | 457 | 166400 | 9 | 5.0883e-19 | true |
| 14 | Optim (Newton) | 71708.0 | 206 | 30112 | 9 | 0.0000e+00 | true |
| 14 | JSOSolvers (trunk) | 540584.0 | 466 | 34576 | 11 | 8.5695e-18 | false |
| 14 | JSOSolvers (tron) | 938292.0 | 521 | 33136 | 12 | 3.3083e-19 | true |
| 14 | Ipopt | 2.58775e6 | 935 | 101472 | 11 | 6.1007e-20 | true |
| 14 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 14 | NonlinearSolve (LM) | 4.0956875e6 | 2003 | 1317616 | 128 | 2.7717e+00 | true |
| 14 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 14 | CaNNOLeS | 190646.0 | 206 | 96352 | 9 | 0.0000e+00 | true |
| 18 | SecondOrderOptimization (Dogleg) | 53395.5 | 158 | 64032 | 9 | 2.4556e-23 | true |
| 18 | SecondOrderOptimization (LM) | 51021.0 | 154 | 70048 | 9 | 2.4559e-23 | true |
| 18 | LeastSquaresOptim (Dogleg) | 246916.0 | 286 | 625680 | 10 | 0.0000e+00 | true |
| 18 | LeastSquaresOptim (LM) | 484812.5 | 462 | 1087360 | 18 | 5.6493e-26 | true |
| 18 | Optim (NewtonTrustRegion) | 413021.0 | 543 | 283136 | 10 | 5.6406e-24 | true |
| 18 | Optim (Newton) | 130792.0 | 208 | 44352 | 9 | 2.4556e-23 | true |
| 18 | JSOSolvers (trunk) | 727270.5 | 217 | 20480 | 12 | 1.4858e-18 | true |
| 18 | JSOSolvers (tron) | 1.839834e6 | 523 | 37952 | 10 | 2.2992e-17 | false |
| 18 | Ipopt | 4.672104e6 | 989 | 136304 | 13 | 1.8346e-18 | true |
| 18 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 18 | NonlinearSolve (LM) | 7.7233125e6 | 2515 | 2349248 | 128 | 2.8014e+00 | true |
| 18 | NonlinearSolve (TrustRegion) | 346979.0 | 269 | 231504 | 11 | 1.5096e-23 | true |
| 18 | CaNNOLeS | 293000.0 | 212 | 155440 | 9 | 2.4556e-23 | true |
| 22 | SecondOrderOptimization (Dogleg) | 77063.0 | 160 | 83424 | 9 | 4.1424e-22 | true |
| 22 | SecondOrderOptimization (LM) | 70854.0 | 156 | 91456 | 9 | 4.1424e-22 | true |
| 22 | LeastSquaresOptim (Dogleg) | 471937.5 | 299 | 669216 | 10 | 0.0000e+00 | true |
| 22 | LeastSquaresOptim (LM) | 907270.5 | 479 | 1144128 | 18 | 2.3716e-25 | true |
| 22 | Optim (NewtonTrustRegion) | 900229.0 | 791 | 533856 | 13 | 0.0000e+00 | true |
| 22 | Optim (Newton) | 240708.5 | 218 | 58656 | 9 | 4.1424e-22 | true |
| 22 | JSOSolvers (trunk) | 1.417459e6 | 490 | 43248 | 11 | 3.3980e-17 | false |
| 22 | JSOSolvers (tron) | 1.6994375e6 | 383 | 35616 | 10 | 2.8812e-18 | true |
| 22 | Ipopt | 6.4260835e6 | 1039 | 178800 | 13 | 1.0568e-28 | true |
| 22 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 22 | NonlinearSolve (LM) | 1.50386875e7 | 2845 | 3290384 | 129 | 2.8186e+00 | true |
| 22 | NonlinearSolve (TrustRegion) | 791083.0 | 322 | 367648 | 13 | 1.3900e-20 | true |
| 22 | CaNNOLeS | 450687.0 | 235 | 204688 | 9 | 4.1423e-22 | true |
| 26 | SecondOrderOptimization (Dogleg) | 114458.0 | 161 | 120272 | 10 | 1.2434e-30 | true |
| 26 | SecondOrderOptimization (LM) | 108687.0 | 156 | 132352 | 10 | 1.2434e-30 | true |
| 26 | LeastSquaresOptim (Dogleg) | 803250.5 | 326 | 786016 | 11 | 0.0000e+00 | true |
| 26 | LeastSquaresOptim (LM) | 1.5042915e6 | 479 | 1209248 | 18 | 7.4077e-25 | true |
| 26 | Optim (NewtonTrustRegion) | 1.23925e6 | 804 | 730624 | 13 | 1.0484e-22 | true |
| 26 | Optim (Newton) | 363104.5 | 237 | 72480 | 10 | 1.2434e-30 | true |
| 26 | JSOSolvers (trunk) | 1.677646e6 | 240 | 31696 | 12 | 2.9603e-19 | true |
| 26 | JSOSolvers (tron) | 2.359333e6 | 395 | 43936 | 11 | 2.0456e-20 | true |
| 26 | Ipopt | 7.9644165e6 | 1044 | 258320 | 12 | 3.3964e-17 | true |
| 26 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 26 | NonlinearSolve (LM) | 2.30145e7 | 2845 | 4650832 | 129 | 2.8298e+00 | true |
| 26 | NonlinearSolve (TrustRegion) | 1.2270835e6 | 322 | 539760 | 13 | 6.0131e-18 | true |
| 26 | CaNNOLeS | 693229.5 | 245 | 320368 | 10 | 0.0000e+00 | true |
| 32 | SecondOrderOptimization (Dogleg) | 164833.5 | 161 | 161056 | 10 | 4.5840e-19 | true |
| 32 | SecondOrderOptimization (LM) | 165208.0 | 156 | 177184 | 10 | 4.5840e-19 | true |
| 32 | LeastSquaresOptim (Dogleg) | 1.7022085e6 | 326 | 909104 | 11 | 0.0000e+00 | true |
| 32 | LeastSquaresOptim (LM) | 3.1194585e6 | 479 | 1355072 | 18 | 3.9810e-22 | true |
| 32 | Optim (NewtonTrustRegion) | 2.1075415e6 | 868 | 1059056 | 14 | 1.3363e-29 | true |
| 32 | Optim (Newton) | 682562.0 | 237 | 106176 | 10 | 4.5840e-19 | true |
| 32 | JSOSolvers (trunk) | 2.802834e6 | 508 | 63584 | 12 | 1.6641e-18 | false |
| 32 | JSOSolvers (tron) | 3.813833e6 | 393 | 59040 | 11 | 1.9552e-18 | false |
| 32 | Ipopt | 1.20230415e7 | 950 | 304896 | 11 | 6.1082e-32 | true |
| 32 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 32 | NonlinearSolve (LM) | 3.5759312e7 | 2827 | 6605936 | 128 | 2.8407e+00 | true |
| 32 | NonlinearSolve (TrustRegion) | 1.647917e6 | 295 | 797392 | 10 | 3.2128e-19 | true |
| 32 | CaNNOLeS | 1.109229e6 | 250 | 445760 | 10 | 4.5840e-19 | true |
