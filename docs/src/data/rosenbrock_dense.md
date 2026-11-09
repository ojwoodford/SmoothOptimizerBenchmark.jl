# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-09T19:54:59
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 5a66143

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel | 7.167 | 0 | 0 | 132.84415584415584 | 0 | 0 |
| 2 | Standalone | 7.5 | 0 | 0 | 625.0 | 6 | 496 |
| 2 | NLPModels (MathOptNLSModel) | 110.28260869565217 | 5 | 80 | 805.5833333333334 | 9 | 224 |
| 3 | NLLSModel | 9.0 | 0 | 0 | 154.664 | 0 | 0 |
| 3 | Standalone | 13.208 | 0 | 0 | 667.0 | 6 | 560 |
| 3 | NLPModels (MathOptNLSModel) | 111.60233918128655 | 5 | 80 | 988.6363636363636 | 9 | 224 |
| 4 | NLLSModel | 11.792 | 0 | 0 | 208.7378640776699 | 0 | 0 |
| 4 | Standalone | 17.67241379310345 | 0 | 0 | 791.0 | 6 | 656 |
| 4 | NLPModels (MathOptNLSModel) | 112.2159090909091 | 5 | 80 | 1336.1333333333334 | 9 | 224 |
| 5 | NLLSModel | 15.875 | 0 | 0 | 258.1168831168831 | 0 | 0 |
| 5 | Standalone | 23.538961038961038 | 0 | 0 | 875.0 | 6 | 752 |
| 5 | NLPModels (MathOptNLSModel) | 112.57309941520468 | 5 | 80 | 1931.8181818181818 | 9 | 224 |
| 6 | NLLSModel | 21.417 | 0 | 0 | 368.42105263157896 | 0 | 0 |
| 6 | Standalone | 25.162337662337663 | 0 | 0 | 1042.0 | 6 | 912 |
| 6 | NLPModels (MathOptNLSModel) | 113.0609756097561 | 5 | 80 | 2479.25 | 9 | 224 |
| 8 | NLLSModel | 32.97465886939571 | 0 | 0 | 559.0277777777778 | 0 | 0 |
| 8 | Standalone | 30.5 | 0 | 0 | 1417.0 | 6 | 1264 |
| 8 | NLPModels (MathOptNLSModel) | 115.13609467455622 | 5 | 80 | 4433.2 | 9 | 224 |
| 10 | NLLSModel | 51.18961038961039 | 0 | 0 | 810.8846153846154 | 0 | 0 |
| 10 | Standalone | 39.271264367816094 | 0 | 0 | 2334.0 | 6 | 1776 |
| 10 | NLPModels (MathOptNLSModel) | 118.90243902439025 | 5 | 80 | 8347.333333333334 | 9 | 224 |
| 14 | NLLSModel | 104.49222797927462 | 0 | 0 | 1510.5 | 0 | 0 |
| 14 | Standalone | 57.79256965944273 | 0 | 0 | 4291.0 | 7 | 1776 |
| 14 | NLPModels (MathOptNLSModel) | 132.4758620689655 | 5 | 80 | 31041.0 | 9 | 224 |
| 18 | NLLSModel | 186.1651376146789 | 0 | 0 | 2277.777777777778 | 0 | 0 |
| 18 | Standalone | 74.56140350877193 | 0 | 0 | 9416.0 | 7 | 2592 |
| 18 | NLPModels (MathOptNLSModel) | 143.75 | 5 | 80 | 50958.0 | 9 | 224 |
| 22 | NLLSModel | 286.9142857142857 | 0 | 0 | 3525.0 | 0 | 0 |
| 22 | Standalone | 104.6195652173913 | 0 | 0 | 18167.0 | 8 | 3520 |
| 22 | NLPModels (MathOptNLSModel) | 156.0 | 5 | 80 | 113000.0 | 9 | 224 |
| 26 | NLLSModel | 406.68 | 0 | 0 | 4625.0 | 0 | 0 |
| 26 | Standalone | 140.1014492753623 | 0 | 0 | 26500.0 | 8 | 4208 |
| 26 | NLPModels (MathOptNLSModel) | 171.97272727272727 | 5 | 80 | 158416.0 | 9 | 224 |
| 32 | NLLSModel | 625.0 | 0 | 0 | 6972.333333333333 | 0 | 0 |
| 32 | Standalone | 196.36170212765958 | 0 | 0 | 53875.0 | 8 | 6592 |
| 32 | NLPModels (MathOptNLSModel) | 188.31372549019608 | 5 | 80 | 337083.0 | 9 | 224 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 6083.0 | 139 | 6320 | 6 | 7.7016e-25 | true |
| 2 | SecondOrderOptimization (LM) | 5437.5 | 136 | 6432 | 6 | 7.7016e-25 | true |
| 2 | LeastSquaresOptim (Dogleg) | 20145.5 | 193 | 359168 | 7 | 0.0000e+00 | true |
| 2 | LeastSquaresOptim (LM) | 18729.5 | 189 | 359040 | 7 | 1.5248e-24 | true |
| 2 | Optim (NewtonTrustRegion) | 14708.0 | 237 | 15504 | 6 | 7.7016e-25 | true |
| 2 | Optim (Newton) | 12708.0 | 145 | 7168 | 6 | 7.7016e-25 | true |
| 2 | JSOSolvers (trunk) | 12292.0 | 113 | 5440 | 7 | 5.5901e-28 | true |
| 2 | JSOSolvers (tron) | 21250.0 | 200 | 10064 | 6 | 6.1357e-20 | true |
| 2 | Ipopt | 794083.5 | 688 | 30944 | 7 | 1.5884e-26 | true |
| 2 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 2 | NonlinearSolve (LM) | 39146.0 | 343 | 22720 | 13 | 1.6316e-22 | true |
| 2 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2 | CaNNOLeS | 12167.0 | 182 | 9760 | 6 | 7.7016e-25 | true |
| 3 | SecondOrderOptimization (Dogleg) | 7270.5 | 140 | 6992 | 7 | 7.5249e-20 | true |
| 3 | SecondOrderOptimization (LM) | 6437.5 | 136 | 7152 | 7 | 7.5232e-20 | true |
| 3 | LeastSquaresOptim (Dogleg) | 14854.0 | 217 | 413344 | 8 | 0.0000e+00 | true |
| 3 | LeastSquaresOptim (LM) | 16229.5 | 237 | 464736 | 9 | 5.6818e-30 | true |
| 3 | Optim (NewtonTrustRegion) | 27917.0 | 321 | 24304 | 7 | 9.2456e-22 | true |
| 3 | Optim (Newton) | 15542.0 | 162 | 8880 | 7 | 7.5249e-20 | true |
| 3 | JSOSolvers (trunk) | 17667.0 | 120 | 5968 | 7 | 1.8161e-20 | true |
| 3 | JSOSolvers (tron) | 63166.0 | 212 | 10864 | 7 | 2.7095e-17 | false |
| 3 | Ipopt | 838979.5 | 662 | 30720 | 7 | 8.0760e-18 | true |
| 3 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 3 | NonlinearSolve (LM) | 57187.0 | 373 | 29664 | 15 | 8.5268e-23 | true |
| 3 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 3 | CaNNOLeS | 15625.0 | 185 | 12256 | 7 | 7.5249e-20 | true |
| 4 | SecondOrderOptimization (Dogleg) | 7979.5 | 140 | 8208 | 7 | 1.3440e-21 | true |
| 4 | SecondOrderOptimization (LM) | 7062.5 | 136 | 8480 | 7 | 1.3444e-21 | true |
| 4 | LeastSquaresOptim (Dogleg) | 26708.5 | 217 | 417472 | 8 | 0.0000e+00 | true |
| 4 | LeastSquaresOptim (LM) | 20187.5 | 237 | 469376 | 9 | 4.8047e-28 | true |
| 4 | Optim (NewtonTrustRegion) | 37562.0 | 354 | 34240 | 8 | 0.0000e+00 | true |
| 4 | Optim (Newton) | 16479.5 | 162 | 10288 | 7 | 1.3440e-21 | true |
| 4 | JSOSolvers (trunk) | 170834.0 | 402 | 25920 | 7 | 1.2381e-17 | false |
| 4 | JSOSolvers (tron) | 48270.5 | 246 | 13008 | 8 | 1.7694e-23 | true |
| 4 | Ipopt | 1.3085e6 | 980 | 47328 | 13 | 3.2978e-29 | true |
| 4 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 4 | NonlinearSolve (LM) | 85500.0 | 415 | 43664 | 18 | 3.9178e-20 | true |
| 4 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 4 | CaNNOLeS | 20083.0 | 186 | 15888 | 7 | 1.3440e-21 | true |
| 5 | SecondOrderOptimization (Dogleg) | 10541.5 | 143 | 9328 | 9 | 0.0000e+00 | true |
| 5 | SecondOrderOptimization (LM) | 12667.0 | 143 | 9792 | 9 | 4.6966e-23 | true |
| 5 | LeastSquaresOptim (Dogleg) | 31687.0 | 257 | 474240 | 13 | 0.0000e+00 | true |
| 5 | LeastSquaresOptim (LM) | 30979.5 | 237 | 473856 | 9 | 1.0157e-25 | true |
| 5 | Optim (NewtonTrustRegion) | 48771.0 | 354 | 41008 | 8 | 2.7179e-28 | true |
| 5 | Optim (Newton) | 20333.5 | 183 | 13072 | 8 | 1.5683e-25 | true |
| 5 | JSOSolvers (trunk) | 45479.0 | 156 | 8256 | 9 | 1.3340e-23 | true |
| 5 | JSOSolvers (tron) | 113041.0 | 266 | 14192 | 10 | 7.2034e-18 | false |
| 5 | Ipopt | 1.3265205e6 | 930 | 48032 | 10 | 2.1001e-28 | true |
| 5 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 5 | NonlinearSolve (LM) | 120020.5 | 445 | 58320 | 20 | 2.2867e-21 | true |
| 5 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 5 | CaNNOLeS | 28000.0 | 188 | 19360 | 8 | 3.1434e-27 | true |
| 6 | SecondOrderOptimization (Dogleg) | 12937.5 | 143 | 11040 | 9 | 7.3660e-31 | true |
| 6 | SecondOrderOptimization (LM) | 14895.5 | 143 | 11712 | 9 | 2.5627e-20 | true |
| 6 | LeastSquaresOptim (Dogleg) | 31166.5 | 261 | 479056 | 14 | 0.0000e+00 | true |
| 6 | LeastSquaresOptim (LM) | 33354.0 | 237 | 478464 | 9 | 6.5103e-28 | true |
| 6 | Optim (NewtonTrustRegion) | 59125.0 | 354 | 50912 | 8 | 3.2466e-25 | true |
| 6 | Optim (Newton) | 23042.0 | 183 | 15728 | 8 | 4.1099e-19 | true |
| 6 | JSOSolvers (trunk) | 61959.0 | 160 | 8912 | 9 | 2.1694e-26 | true |
| 6 | JSOSolvers (tron) | 107479.0 | 294 | 16160 | 10 | 1.0902e-17 | true |
| 6 | Ipopt | 1.4067505e6 | 988 | 53264 | 11 | 1.2990e-29 | true |
| 6 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 6 | NonlinearSolve (LM) | 161292.0 | 475 | 81936 | 22 | 5.1931e-23 | true |
| 6 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 6 | CaNNOLeS | 35188.0 | 188 | 23824 | 8 | 7.3115e-25 | true |
| 8 | SecondOrderOptimization (Dogleg) | 14458.5 | 141 | 14560 | 8 | 2.0175e-24 | true |
| 8 | SecondOrderOptimization (LM) | 13542.0 | 136 | 15552 | 8 | 2.0194e-24 | true |
| 8 | LeastSquaresOptim (Dogleg) | 46521.0 | 251 | 489440 | 9 | 0.0000e+00 | true |
| 8 | LeastSquaresOptim (LM) | 46938.0 | 247 | 489696 | 9 | 1.0826e-24 | true |
| 8 | Optim (NewtonTrustRegion) | 89979.5 | 396 | 80352 | 9 | 0.0000e+00 | true |
| 8 | Optim (Newton) | 27896.0 | 179 | 21248 | 8 | 2.0175e-24 | true |
| 8 | JSOSolvers (trunk) | 105729.5 | 177 | 10768 | 10 | 4.0468e-18 | true |
| 8 | JSOSolvers (tron) | 190541.5 | 330 | 19184 | 10 | 4.0071e-21 | true |
| 8 | Ipopt | 2.032125e6 | 1041 | 65040 | 14 | 1.2446e-19 | true |
| 8 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 8 | NonlinearSolve (LM) | 318437.5 | 605 | 159920 | 31 | 4.1941e-17 | true |
| 8 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 8 | CaNNOLeS | 54812.5 | 190 | 37040 | 8 | 2.0175e-24 | true |
| 10 | SecondOrderOptimization (Dogleg) | 18833.5 | 141 | 19776 | 8 | 1.1201e-22 | true |
| 10 | SecondOrderOptimization (LM) | 17542.0 | 136 | 21456 | 8 | 1.1201e-22 | true |
| 10 | LeastSquaresOptim (Dogleg) | 64083.5 | 251 | 502608 | 9 | 0.0000e+00 | true |
| 10 | LeastSquaresOptim (LM) | 105354.0 | 379 | 827344 | 15 | 3.8422e-25 | true |
| 10 | Optim (NewtonTrustRegion) | 163896.0 | 543 | 149040 | 11 | 9.9092e-29 | true |
| 10 | Optim (Newton) | 40333.0 | 179 | 29984 | 8 | 1.1201e-22 | true |
| 10 | JSOSolvers (trunk) | 158979.0 | 182 | 12144 | 10 | 6.3729e-19 | true |
| 10 | JSOSolvers (tron) | 249333.0 | 316 | 19920 | 9 | 4.5011e-19 | true |
| 10 | Ipopt | 1.861188e6 | 825 | 61552 | 10 | 2.7100e+00 | true |
| 10 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 10 | NonlinearSolve (LM) | 2.1025835e6 | 2039 | 821904 | 134 | 2.7100e+00 | true |
| 10 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10 | CaNNOLeS | 82874.5 | 190 | 50432 | 8 | 1.1201e-22 | true |
| 14 | SecondOrderOptimization (Dogleg) | 31458.5 | 142 | 30800 | 9 | 0.0000e+00 | true |
| 14 | SecondOrderOptimization (LM) | 30437.5 | 136 | 33904 | 9 | 0.0000e+00 | true |
| 14 | LeastSquaresOptim (Dogleg) | 120833.5 | 260 | 521040 | 9 | 0.0000e+00 | true |
| 14 | LeastSquaresOptim (LM) | 243812.5 | 462 | 1020000 | 18 | 7.5856e-27 | true |
| 14 | Optim (NewtonTrustRegion) | 222583.0 | 457 | 166400 | 9 | 5.0883e-19 | true |
| 14 | Optim (Newton) | 66146.0 | 206 | 30112 | 9 | 0.0000e+00 | true |
| 14 | JSOSolvers (trunk) | 539750.0 | 466 | 34576 | 11 | 8.5695e-18 | false |
| 14 | JSOSolvers (tron) | 950500.0 | 521 | 33136 | 12 | 3.3083e-19 | true |
| 14 | Ipopt | 2.709833e6 | 935 | 101472 | 11 | 6.1007e-20 | true |
| 14 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 14 | NonlinearSolve (LM) | 4.1975835e6 | 2003 | 1317616 | 128 | 2.7717e+00 | true |
| 14 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 14 | CaNNOLeS | 173229.5 | 206 | 96352 | 9 | 0.0000e+00 | true |
| 18 | SecondOrderOptimization (Dogleg) | 51167.0 | 158 | 64032 | 9 | 2.4556e-23 | true |
| 18 | SecondOrderOptimization (LM) | 48479.5 | 154 | 70048 | 9 | 2.4559e-23 | true |
| 18 | LeastSquaresOptim (Dogleg) | 268917.0 | 286 | 625680 | 10 | 0.0000e+00 | true |
| 18 | LeastSquaresOptim (LM) | 493062.5 | 462 | 1087360 | 18 | 5.6493e-26 | true |
| 18 | Optim (NewtonTrustRegion) | 415396.0 | 543 | 283136 | 10 | 5.6406e-24 | true |
| 18 | Optim (Newton) | 121521.5 | 208 | 44352 | 9 | 2.4556e-23 | true |
| 18 | JSOSolvers (trunk) | 713521.0 | 217 | 20480 | 12 | 1.4858e-18 | true |
| 18 | JSOSolvers (tron) | 1.752e6 | 523 | 37952 | 10 | 2.2992e-17 | false |
| 18 | Ipopt | 5.012708e6 | 989 | 136304 | 13 | 1.8346e-18 | true |
| 18 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 18 | NonlinearSolve (LM) | 7.6507085e6 | 2515 | 2349248 | 128 | 2.8014e+00 | true |
| 18 | NonlinearSolve (TrustRegion) | 348979.0 | 269 | 231504 | 11 | 1.5096e-23 | true |
| 18 | CaNNOLeS | 287208.0 | 212 | 155440 | 9 | 2.4556e-23 | true |
| 22 | SecondOrderOptimization (Dogleg) | 74000.0 | 160 | 83424 | 9 | 4.1424e-22 | true |
| 22 | SecondOrderOptimization (LM) | 76208.0 | 156 | 91456 | 9 | 4.1424e-22 | true |
| 22 | LeastSquaresOptim (Dogleg) | 465146.0 | 299 | 669216 | 10 | 0.0000e+00 | true |
| 22 | LeastSquaresOptim (LM) | 967208.5 | 479 | 1144128 | 18 | 2.3716e-25 | true |
| 22 | Optim (NewtonTrustRegion) | 869437.5 | 791 | 533856 | 13 | 0.0000e+00 | true |
| 22 | Optim (Newton) | 220687.5 | 218 | 58656 | 9 | 4.1424e-22 | true |
| 22 | JSOSolvers (trunk) | 1.327417e6 | 490 | 43248 | 11 | 3.3980e-17 | false |
| 22 | JSOSolvers (tron) | 1.7099795e6 | 383 | 35616 | 10 | 2.8812e-18 | true |
| 22 | Ipopt | 7.6980415e6 | 1039 | 178800 | 13 | 1.0568e-28 | true |
| 22 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 22 | NonlinearSolve (LM) | 1.49159165e7 | 2845 | 3290384 | 129 | 2.8186e+00 | true |
| 22 | NonlinearSolve (TrustRegion) | 805000.5 | 322 | 367648 | 13 | 1.3900e-20 | true |
| 22 | CaNNOLeS | 440271.0 | 235 | 204688 | 9 | 4.1423e-22 | true |
| 26 | SecondOrderOptimization (Dogleg) | 113979.0 | 161 | 120272 | 10 | 1.2434e-30 | true |
| 26 | SecondOrderOptimization (LM) | 101792.0 | 156 | 132352 | 10 | 1.2434e-30 | true |
| 26 | LeastSquaresOptim (Dogleg) | 811333.5 | 326 | 786016 | 11 | 0.0000e+00 | true |
| 26 | LeastSquaresOptim (LM) | 1.474479e6 | 479 | 1209248 | 18 | 7.4077e-25 | true |
| 26 | Optim (NewtonTrustRegion) | 1.2209585e6 | 804 | 730624 | 13 | 1.0484e-22 | true |
| 26 | Optim (Newton) | 353625.0 | 237 | 72480 | 10 | 1.2434e-30 | true |
| 26 | JSOSolvers (trunk) | 1.610167e6 | 240 | 31696 | 12 | 2.9603e-19 | true |
| 26 | JSOSolvers (tron) | 2.2817495e6 | 395 | 43936 | 11 | 2.0456e-20 | true |
| 26 | Ipopt | 8.699896e6 | 1044 | 258320 | 12 | 3.3964e-17 | true |
| 26 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 26 | NonlinearSolve (LM) | 2.2810792e7 | 2845 | 4650832 | 129 | 2.8298e+00 | true |
| 26 | NonlinearSolve (TrustRegion) | 1.21225e6 | 322 | 539760 | 13 | 6.0131e-18 | true |
| 26 | CaNNOLeS | 679770.5 | 245 | 320368 | 10 | 0.0000e+00 | true |
| 32 | SecondOrderOptimization (Dogleg) | 164896.0 | 161 | 161056 | 10 | 4.5840e-19 | true |
| 32 | SecondOrderOptimization (LM) | 160604.5 | 156 | 177184 | 10 | 4.5840e-19 | true |
| 32 | LeastSquaresOptim (Dogleg) | 1.635854e6 | 326 | 909104 | 11 | 0.0000e+00 | true |
| 32 | LeastSquaresOptim (LM) | 3.096292e6 | 479 | 1355072 | 18 | 3.9810e-22 | true |
| 32 | Optim (NewtonTrustRegion) | 2.0570835e6 | 868 | 1059056 | 14 | 1.3363e-29 | true |
| 32 | Optim (Newton) | 677625.0 | 237 | 106176 | 10 | 4.5840e-19 | true |
| 32 | JSOSolvers (trunk) | 2.798e6 | 507 | 63296 | 12 | 1.6641e-18 | false |
| 32 | JSOSolvers (tron) | 3.664e6 | 393 | 59040 | 11 | 1.9552e-18 | false |
| 32 | Ipopt | 1.2602458e7 | 950 | 304896 | 11 | 6.1082e-32 | true |
| 32 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 32 | NonlinearSolve (LM) | 3.56881875e7 | 2827 | 6605936 | 128 | 2.8407e+00 | true |
| 32 | NonlinearSolve (TrustRegion) | 1.5644165e6 | 295 | 797392 | 10 | 3.2128e-19 | true |
| 32 | CaNNOLeS | 1.0409165e6 | 250 | 445760 | 10 | 4.5840e-19 | true |
