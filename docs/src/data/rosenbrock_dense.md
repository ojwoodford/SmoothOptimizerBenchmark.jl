# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T21:11:21
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b448285

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel | 7.167 | 0 | 0 | 164.57857142857142 | 0 | 0 |
| 2 | Standalone | 8.25 | 0 | 0 | 583.0 | 6 | 496 |
| 2 | NLPModels (MathOptNLSModel) | 108.88397790055248 | 5 | 80 | 854.1666666666666 | 9 | 224 |
| 3 | NLLSModel | 9.167 | 0 | 0 | 174.18045112781954 | 0 | 0 |
| 3 | Standalone | 13.292 | 0 | 0 | 667.0 | 6 | 560 |
| 3 | NLPModels (MathOptNLSModel) | 113.90532544378698 | 5 | 80 | 972.1904761904761 | 9 | 224 |
| 4 | NLLSModel | 12.166 | 0 | 0 | 235.1122448979592 | 0 | 0 |
| 4 | Standalone | 17.833 | 0 | 0 | 709.0 | 6 | 656 |
| 4 | NLPModels (MathOptNLSModel) | 116.23026315789474 | 5 | 80 | 1338.8666666666666 | 9 | 224 |
| 5 | NLLSModel | 15.5 | 0 | 0 | 275.525 | 0 | 0 |
| 5 | Standalone | 24.65034965034965 | 0 | 0 | 875.0 | 6 | 752 |
| 5 | NLPModels (MathOptNLSModel) | 113.5670731707317 | 5 | 80 | 1916.6363636363637 | 9 | 224 |
| 6 | NLLSModel | 19.875 | 0 | 0 | 348.3606557377049 | 0 | 0 |
| 6 | Standalone | 26.31578947368421 | 0 | 0 | 917.0 | 6 | 912 |
| 6 | NLPModels (MathOptNLSModel) | 115.10625 | 5 | 80 | 2552.125 | 9 | 224 |
| 8 | NLLSModel | 32.89928057553957 | 0 | 0 | 550.4473684210526 | 0 | 0 |
| 8 | Standalone | 32.87090163934426 | 0 | 0 | 1375.0 | 6 | 1264 |
| 8 | NLPModels (MathOptNLSModel) | 117.1875 | 5 | 80 | 4583.4 | 9 | 224 |
| 10 | NLLSModel | 51.08051948051948 | 0 | 0 | 827.1851851851852 | 0 | 0 |
| 10 | Standalone | 39.285714285714285 | 0 | 0 | 2333.0 | 6 | 1776 |
| 10 | NLPModels (MathOptNLSModel) | 122.20134228187919 | 5 | 80 | 8569.333333333334 | 9 | 224 |
| 14 | NLLSModel | 103.84455958549223 | 0 | 0 | 1430.5333333333333 | 0 | 0 |
| 14 | Standalone | 58.98051948051948 | 0 | 0 | 4833.0 | 7 | 1776 |
| 14 | NLPModels (MathOptNLSModel) | 139.94656488549617 | 5 | 80 | 31625.0 | 9 | 224 |
| 18 | NLLSModel | 190.42056074766356 | 0 | 0 | 2393.4444444444443 | 0 | 0 |
| 18 | Standalone | 75.37727272727273 | 0 | 0 | 8875.0 | 7 | 2592 |
| 18 | NLPModels (MathOptNLSModel) | 146.6535433070866 | 5 | 80 | 51542.0 | 9 | 224 |
| 22 | NLLSModel | 286.84057971014494 | 0 | 0 | 3382.0 | 0 | 0 |
| 22 | Standalone | 104.53216374269006 | 0 | 0 | 18583.0 | 8 | 3520 |
| 22 | NLPModels (MathOptNLSModel) | 160.3613445378151 | 5 | 80 | 114667.0 | 9 | 224 |
| 26 | NLLSModel | 418.3673469387755 | 0 | 0 | 4783.4 | 0 | 0 |
| 26 | Standalone | 140.84297520661158 | 0 | 0 | 27375.0 | 8 | 4208 |
| 26 | NLPModels (MathOptNLSModel) | 171.5909090909091 | 5 | 80 | 164209.0 | 9 | 224 |
| 32 | NLLSModel | 636.71875 | 0 | 0 | 7138.666666666667 | 0 | 0 |
| 32 | Standalone | 198.1326530612245 | 0 | 0 | 54625.0 | 8 | 6592 |
| 32 | NLPModels (MathOptNLSModel) | 191.58823529411765 | 5 | 80 | 323500.0 | 9 | 224 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 5667.0 | 113 | 5104 | 6 | 1.7458e-24 | true |
| 2 | SecondOrderOptimization (LM) | 5833.0 | 115 | 5280 | 6 | 7.7016e-25 | true |
| 2 | LeastSquaresOptim (Dogleg) | 13646.0 | 193 | 359168 | 7 | 0.0000e+00 | true |
| 2 | LeastSquaresOptim (LM) | 20708.5 | 189 | 359040 | 7 | 1.5248e-24 | true |
| 2 | Optim (NewtonTrustRegion) | 17145.5 | 237 | 15504 | 6 | 7.7016e-25 | true |
| 2 | Optim (Newton) | 14583.0 | 145 | 7168 | 6 | 7.7016e-25 | true |
| 2 | JSOSolvers (trunk) | 15521.0 | 113 | 5440 | 7 | 5.5901e-28 | true |
| 2 | JSOSolvers (tron) | 25583.0 | 200 | 10064 | 6 | 6.1357e-20 | true |
| 2 | Ipopt | 746000.5 | 688 | 30944 | 7 | 1.5884e-26 | true |
| 2 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 2 | NonlinearSolve (LM) | 36062.5 | 343 | 22720 | 13 | 1.6316e-22 | true |
| 2 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2 | CaNNOLeS | 14937.5 | 182 | 9760 | 6 | 7.7016e-25 | true |
| 3 | SecondOrderOptimization (Dogleg) | 6333.0 | 113 | 5760 | 6 | 7.3106e-21 | true |
| 3 | SecondOrderOptimization (LM) | 6833.5 | 115 | 6000 | 7 | 7.5232e-20 | true |
| 3 | LeastSquaresOptim (Dogleg) | 18292.0 | 217 | 413344 | 8 | 0.0000e+00 | true |
| 3 | LeastSquaresOptim (LM) | 17333.0 | 237 | 464736 | 9 | 5.6818e-30 | true |
| 3 | Optim (NewtonTrustRegion) | 30437.5 | 321 | 24304 | 7 | 9.2456e-22 | true |
| 3 | Optim (Newton) | 17291.0 | 162 | 8880 | 7 | 7.5249e-20 | true |
| 3 | JSOSolvers (trunk) | 21750.0 | 120 | 5968 | 7 | 1.8161e-20 | true |
| 3 | JSOSolvers (tron) | 76334.0 | 212 | 10864 | 7 | 2.7095e-17 | false |
| 3 | Ipopt | 803958.5 | 662 | 30720 | 7 | 8.0760e-18 | true |
| 3 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 3 | NonlinearSolve (LM) | 56479.0 | 373 | 29664 | 15 | 8.5268e-23 | true |
| 3 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 3 | CaNNOLeS | 19958.5 | 185 | 12256 | 7 | 7.5249e-20 | true |
| 4 | SecondOrderOptimization (Dogleg) | 7708.5 | 113 | 6912 | 7 | 2.5283e-26 | true |
| 4 | SecondOrderOptimization (LM) | 7625.0 | 115 | 7264 | 7 | 1.3444e-21 | true |
| 4 | LeastSquaresOptim (Dogleg) | 19333.5 | 217 | 417472 | 8 | 0.0000e+00 | true |
| 4 | LeastSquaresOptim (LM) | 21208.5 | 237 | 469376 | 9 | 4.8047e-28 | true |
| 4 | Optim (NewtonTrustRegion) | 40125.0 | 354 | 34240 | 8 | 0.0000e+00 | true |
| 4 | Optim (Newton) | 17875.0 | 162 | 10288 | 7 | 1.3440e-21 | true |
| 4 | JSOSolvers (trunk) | 189708.0 | 402 | 25920 | 7 | 1.2381e-17 | false |
| 4 | JSOSolvers (tron) | 57417.0 | 246 | 13008 | 8 | 1.7694e-23 | true |
| 4 | Ipopt | 1.256062e6 | 980 | 47328 | 13 | 3.2978e-29 | true |
| 4 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 4 | NonlinearSolve (LM) | 86166.5 | 415 | 43664 | 18 | 3.9178e-20 | true |
| 4 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 4 | CaNNOLeS | 23187.5 | 186 | 15888 | 7 | 1.3440e-21 | true |
| 5 | SecondOrderOptimization (Dogleg) | 8416.0 | 113 | 7984 | 7 | 2.9663e-29 | true |
| 5 | SecondOrderOptimization (LM) | 13395.5 | 115 | 8464 | 9 | 4.6966e-23 | true |
| 5 | LeastSquaresOptim (Dogleg) | 26958.5 | 257 | 474240 | 13 | 0.0000e+00 | true |
| 5 | LeastSquaresOptim (LM) | 25291.5 | 237 | 473856 | 9 | 1.0157e-25 | true |
| 5 | Optim (NewtonTrustRegion) | 48708.0 | 354 | 41008 | 8 | 2.7179e-28 | true |
| 5 | Optim (Newton) | 22167.0 | 183 | 13072 | 8 | 1.5683e-25 | true |
| 5 | JSOSolvers (trunk) | 48979.0 | 156 | 8256 | 9 | 1.3340e-23 | true |
| 5 | JSOSolvers (tron) | 125750.0 | 266 | 14192 | 10 | 7.2034e-18 | false |
| 5 | Ipopt | 1.1731875e6 | 930 | 48032 | 10 | 2.1001e-28 | true |
| 5 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 5 | NonlinearSolve (LM) | 116583.5 | 445 | 58320 | 20 | 2.2867e-21 | true |
| 5 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 5 | CaNNOLeS | 32750.0 | 188 | 19360 | 8 | 3.1434e-27 | true |
| 6 | SecondOrderOptimization (Dogleg) | 9500.0 | 113 | 9680 | 7 | 1.2761e-22 | true |
| 6 | SecondOrderOptimization (LM) | 15270.5 | 115 | 10368 | 9 | 2.5627e-20 | true |
| 6 | LeastSquaresOptim (Dogleg) | 35125.0 | 261 | 479056 | 14 | 0.0000e+00 | true |
| 6 | LeastSquaresOptim (LM) | 35041.5 | 237 | 478464 | 9 | 6.5103e-28 | true |
| 6 | Optim (NewtonTrustRegion) | 60666.5 | 354 | 50912 | 8 | 3.2466e-25 | true |
| 6 | Optim (Newton) | 24313.0 | 183 | 15728 | 8 | 4.1099e-19 | true |
| 6 | JSOSolvers (trunk) | 66520.5 | 160 | 8912 | 9 | 2.1694e-26 | true |
| 6 | JSOSolvers (tron) | 107395.5 | 294 | 16160 | 10 | 1.0902e-17 | true |
| 6 | Ipopt | 1.2809165e6 | 988 | 53264 | 11 | 1.2990e-29 | true |
| 6 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 6 | NonlinearSolve (LM) | 158916.5 | 475 | 81936 | 22 | 5.1931e-23 | true |
| 6 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 6 | CaNNOLeS | 39395.5 | 188 | 23824 | 8 | 7.3115e-25 | true |
| 8 | SecondOrderOptimization (Dogleg) | 12812.5 | 113 | 13120 | 8 | 0.0000e+00 | true |
| 8 | SecondOrderOptimization (LM) | 14104.0 | 115 | 14208 | 8 | 2.0194e-24 | true |
| 8 | LeastSquaresOptim (Dogleg) | 43937.5 | 251 | 489440 | 9 | 0.0000e+00 | true |
| 8 | LeastSquaresOptim (LM) | 45021.5 | 247 | 489696 | 9 | 1.0826e-24 | true |
| 8 | Optim (NewtonTrustRegion) | 92375.0 | 396 | 80352 | 9 | 0.0000e+00 | true |
| 8 | Optim (Newton) | 29146.0 | 179 | 21248 | 8 | 2.0175e-24 | true |
| 8 | JSOSolvers (trunk) | 113875.0 | 177 | 10768 | 10 | 4.0468e-18 | true |
| 8 | JSOSolvers (tron) | 187688.0 | 330 | 19184 | 10 | 4.0071e-21 | true |
| 8 | Ipopt | 1.856938e6 | 1041 | 65040 | 14 | 1.2446e-19 | true |
| 8 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 8 | NonlinearSolve (LM) | 329562.5 | 605 | 159920 | 31 | 4.1941e-17 | true |
| 8 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 8 | CaNNOLeS | 59271.0 | 190 | 37040 | 8 | 2.0175e-24 | true |
| 10 | SecondOrderOptimization (Dogleg) | 18042.0 | 113 | 18304 | 8 | 1.0852e-18 | true |
| 10 | SecondOrderOptimization (LM) | 18104.5 | 115 | 20080 | 8 | 1.1201e-22 | true |
| 10 | LeastSquaresOptim (Dogleg) | 65062.5 | 251 | 502608 | 9 | 0.0000e+00 | true |
| 10 | LeastSquaresOptim (LM) | 109187.5 | 379 | 827344 | 15 | 3.8422e-25 | true |
| 10 | Optim (NewtonTrustRegion) | 174479.0 | 543 | 149040 | 11 | 9.9092e-29 | true |
| 10 | Optim (Newton) | 39395.5 | 179 | 29984 | 8 | 1.1201e-22 | true |
| 10 | JSOSolvers (trunk) | 165416.0 | 182 | 12144 | 10 | 6.3729e-19 | true |
| 10 | JSOSolvers (tron) | 251583.5 | 316 | 19920 | 9 | 4.5011e-19 | true |
| 10 | Ipopt | 1.661625e6 | 825 | 61552 | 10 | 2.7100e+00 | true |
| 10 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 10 | NonlinearSolve (LM) | 2.087896e6 | 2039 | 821904 | 134 | 2.7100e+00 | true |
| 10 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10 | CaNNOLeS | 89520.5 | 190 | 50432 | 8 | 1.1201e-22 | true |
| 14 | SecondOrderOptimization (Dogleg) | 31541.0 | 113 | 29280 | 9 | 4.1869e-30 | true |
| 14 | SecondOrderOptimization (LM) | 31125.0 | 115 | 32496 | 9 | 0.0000e+00 | true |
| 14 | LeastSquaresOptim (Dogleg) | 131708.5 | 260 | 521040 | 9 | 0.0000e+00 | true |
| 14 | LeastSquaresOptim (LM) | 254604.0 | 462 | 1020000 | 18 | 7.5856e-27 | true |
| 14 | Optim (NewtonTrustRegion) | 229584.0 | 457 | 166400 | 9 | 5.0883e-19 | true |
| 14 | Optim (Newton) | 68875.0 | 206 | 30112 | 9 | 0.0000e+00 | true |
| 14 | JSOSolvers (trunk) | 581292.0 | 466 | 34576 | 11 | 8.5695e-18 | false |
| 14 | JSOSolvers (tron) | 957896.0 | 521 | 33136 | 12 | 3.3083e-19 | true |
| 14 | Ipopt | 2.655875e6 | 935 | 101472 | 11 | 6.1007e-20 | true |
| 14 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 14 | NonlinearSolve (LM) | 4.1244165e6 | 2003 | 1317616 | 128 | 2.7717e+00 | true |
| 14 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 14 | CaNNOLeS | 176395.5 | 206 | 96352 | 9 | 0.0000e+00 | true |
| 18 | SecondOrderOptimization (Dogleg) | 48604.0 | 129 | 62272 | 9 | 8.1291e-23 | true |
| 18 | SecondOrderOptimization (LM) | 49750.0 | 133 | 68400 | 9 | 2.4559e-23 | true |
| 18 | LeastSquaresOptim (Dogleg) | 255541.5 | 286 | 625680 | 10 | 0.0000e+00 | true |
| 18 | LeastSquaresOptim (LM) | 481583.0 | 462 | 1087360 | 18 | 5.6493e-26 | true |
| 18 | Optim (NewtonTrustRegion) | 432125.0 | 543 | 283136 | 10 | 5.6406e-24 | true |
| 18 | Optim (Newton) | 124228.5 | 208 | 44352 | 9 | 2.4556e-23 | true |
| 18 | JSOSolvers (trunk) | 738396.0 | 217 | 20480 | 12 | 1.4858e-18 | true |
| 18 | JSOSolvers (tron) | 1.910959e6 | 523 | 37952 | 10 | 2.2992e-17 | false |
| 18 | Ipopt | 4.7357085e6 | 989 | 136304 | 13 | 1.8346e-18 | true |
| 18 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 18 | NonlinearSolve (LM) | 7.6556665e6 | 2515 | 2349248 | 128 | 2.8014e+00 | true |
| 18 | NonlinearSolve (TrustRegion) | 357458.5 | 269 | 231504 | 11 | 1.5096e-23 | true |
| 18 | CaNNOLeS | 288312.5 | 212 | 155440 | 9 | 2.4556e-23 | true |
| 22 | SecondOrderOptimization (Dogleg) | 69354.5 | 131 | 81616 | 9 | 1.7181e-21 | true |
| 22 | SecondOrderOptimization (LM) | 75166.5 | 135 | 89760 | 9 | 4.1424e-22 | true |
| 22 | LeastSquaresOptim (Dogleg) | 470583.5 | 299 | 669216 | 10 | 0.0000e+00 | true |
| 22 | LeastSquaresOptim (LM) | 892041.5 | 479 | 1144128 | 18 | 2.3716e-25 | true |
| 22 | Optim (NewtonTrustRegion) | 869854.5 | 791 | 533856 | 13 | 0.0000e+00 | true |
| 22 | Optim (Newton) | 224770.5 | 218 | 58656 | 9 | 4.1424e-22 | true |
| 22 | JSOSolvers (trunk) | 1.604916e6 | 490 | 43248 | 11 | 3.3980e-17 | false |
| 22 | JSOSolvers (tron) | 1.6763955e6 | 383 | 35616 | 10 | 2.8812e-18 | true |
| 22 | Ipopt | 6.530292e6 | 1039 | 178800 | 13 | 1.0568e-28 | true |
| 22 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 22 | NonlinearSolve (LM) | 1.4996375e7 | 2845 | 3290384 | 129 | 2.8186e+00 | true |
| 22 | NonlinearSolve (TrustRegion) | 797708.0 | 322 | 367648 | 13 | 1.3900e-20 | true |
| 22 | CaNNOLeS | 455917.0 | 235 | 204688 | 9 | 4.1423e-22 | true |
| 26 | SecondOrderOptimization (Dogleg) | 109438.0 | 131 | 118384 | 10 | 1.8557e-26 | true |
| 26 | SecondOrderOptimization (LM) | 110708.0 | 135 | 130592 | 10 | 1.2434e-30 | true |
| 26 | LeastSquaresOptim (Dogleg) | 818375.0 | 326 | 786016 | 11 | 0.0000e+00 | true |
| 26 | LeastSquaresOptim (LM) | 1.4893335e6 | 479 | 1209248 | 18 | 7.4077e-25 | true |
| 26 | Optim (NewtonTrustRegion) | 1.2401045e6 | 804 | 730624 | 13 | 1.0484e-22 | true |
| 26 | Optim (Newton) | 353395.5 | 237 | 72480 | 10 | 1.2434e-30 | true |
| 26 | JSOSolvers (trunk) | 1.6997705e6 | 240 | 31696 | 12 | 2.9603e-19 | true |
| 26 | JSOSolvers (tron) | 2.4952705e6 | 395 | 43936 | 11 | 2.0456e-20 | true |
| 26 | Ipopt | 8.4124375e6 | 1044 | 258320 | 12 | 3.3964e-17 | true |
| 26 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 26 | NonlinearSolve (LM) | 2.3142459e7 | 2845 | 4650832 | 129 | 2.8298e+00 | true |
| 26 | NonlinearSolve (TrustRegion) | 1.2162495e6 | 322 | 539760 | 13 | 6.0131e-18 | true |
| 26 | CaNNOLeS | 683020.5 | 245 | 320368 | 10 | 0.0000e+00 | true |
| 32 | SecondOrderOptimization (Dogleg) | 150833.0 | 131 | 158752 | 10 | 4.4560e-19 | true |
| 32 | SecondOrderOptimization (LM) | 154937.5 | 135 | 175008 | 10 | 4.5840e-19 | true |
| 32 | LeastSquaresOptim (Dogleg) | 1.685417e6 | 326 | 909104 | 11 | 0.0000e+00 | true |
| 32 | LeastSquaresOptim (LM) | 3.1870415e6 | 479 | 1355072 | 18 | 3.9810e-22 | true |
| 32 | Optim (NewtonTrustRegion) | 2.182e6 | 868 | 1059056 | 14 | 1.3363e-29 | true |
| 32 | Optim (Newton) | 685312.5 | 237 | 106176 | 10 | 4.5840e-19 | true |
| 32 | JSOSolvers (trunk) | 2.957083e6 | 507 | 63296 | 12 | 1.6641e-18 | false |
| 32 | JSOSolvers (tron) | 3.95575e6 | 393 | 59040 | 11 | 1.9552e-18 | false |
| 32 | Ipopt | 1.194325e7 | 950 | 304896 | 11 | 6.1082e-32 | true |
| 32 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 32 | NonlinearSolve (LM) | 3.59152085e7 | 2827 | 6605936 | 128 | 2.8407e+00 | true |
| 32 | NonlinearSolve (TrustRegion) | 1.626e6 | 295 | 797392 | 10 | 3.2128e-19 | true |
| 32 | CaNNOLeS | 1.0714585e6 | 250 | 445760 | 10 | 4.5840e-19 | true |
