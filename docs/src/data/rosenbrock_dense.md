# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-13T01:21:10
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 520587c

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel | 49.902654867256636 | 1 | 16 | 192.20430107526883 | 1 | 32 |
| 2 | Standalone | 57.61455525606469 | 1 | 16 | 584.0 | 7 | 528 |
| 2 | NLPModels (MathOptNLSModel) | 719.5769230769231 | 5 | 80 | 1722.25 | 9 | 224 |
| 3 | NLLSModel | 53.35402298850575 | 1 | 16 | 240.84615384615384 | 1 | 32 |
| 3 | Standalone | 60.06837606837607 | 1 | 16 | 709.0 | 7 | 592 |
| 3 | NLPModels (MathOptNLSModel) | 796.4615384615385 | 5 | 80 | 1774.3333333333333 | 9 | 224 |
| 4 | NLLSModel | 56.64303178484108 | 1 | 16 | 285.16883116883116 | 1 | 32 |
| 4 | Standalone | 64.28318584070796 | 1 | 16 | 750.0 | 7 | 688 |
| 4 | NLPModels (MathOptNLSModel) | 1004.3684210526316 | 5 | 80 | 2259.222222222222 | 9 | 224 |
| 5 | NLLSModel | 61.9038961038961 | 1 | 16 | 343.56140350877195 | 1 | 32 |
| 5 | Standalone | 70.75324675324676 | 1 | 16 | 916.0 | 7 | 784 |
| 5 | NLPModels (MathOptNLSModel) | 1319.4 | 5 | 80 | 3131.0 | 9 | 224 |
| 6 | NLLSModel | 62.67806267806268 | 1 | 16 | 435.84 | 1 | 32 |
| 6 | Standalone | 73.99665551839465 | 1 | 16 | 1042.0 | 7 | 944 |
| 6 | NLPModels (MathOptNLSModel) | 1725.6666666666667 | 5 | 80 | 4175.0 | 9 | 224 |
| 8 | NLLSModel | 76.77622377622377 | 1 | 16 | 675.78125 | 1 | 32 |
| 8 | Standalone | 80.52434456928839 | 1 | 16 | 1417.0 | 7 | 1296 |
| 8 | NLPModels (MathOptNLSModel) | 2724.0 | 5 | 80 | 7166.666666666667 | 9 | 224 |
| 10 | NLLSModel | 89.50925925925925 | 1 | 16 | 864.5833333333334 | 1 | 32 |
| 10 | Standalone | 85.62711864406779 | 1 | 16 | 2375.0 | 7 | 1808 |
| 10 | NLPModels (MathOptNLSModel) | 4233.4 | 5 | 80 | 12584.0 | 9 | 224 |
| 14 | NLLSModel | 138.98026315789474 | 1 | 16 | 1613.0714285714287 | 1 | 32 |
| 14 | Standalone | 105.35751295336787 | 1 | 16 | 4334.0 | 8 | 1808 |
| 14 | NLPModels (MathOptNLSModel) | 8750.0 | 5 | 80 | 39667.0 | 9 | 224 |
| 18 | NLLSModel | 251.42045454545453 | 1 | 16 | 2412.0 | 1 | 32 |
| 18 | Standalone | 125.26582278481013 | 1 | 16 | 8834.0 | 8 | 2624 |
| 18 | NLPModels (MathOptNLSModel) | 14625.0 | 5 | 80 | 65875.0 | 9 | 224 |
| 22 | NLLSModel | 348.6842105263158 | 1 | 16 | 3451.3333333333335 | 1 | 32 |
| 22 | Standalone | 146.61654135338347 | 1 | 16 | 18333.0 | 9 | 3552 |
| 22 | NLPModels (MathOptNLSModel) | 21625.0 | 5 | 80 | 142333.0 | 9 | 224 |
| 26 | NLLSModel | 469.2173913043478 | 1 | 16 | 4766.6 | 1 | 32 |
| 26 | Standalone | 165.6218487394958 | 1 | 16 | 26625.0 | 9 | 4240 |
| 26 | NLPModels (MathOptNLSModel) | 30292.0 | 5 | 80 | 189167.0 | 9 | 224 |
| 32 | NLLSModel | 685.483870967742 | 1 | 16 | 7083.333333333333 | 1 | 32 |
| 32 | Standalone | 216.66666666666666 | 1 | 16 | 53709.0 | 9 | 6624 |
| 32 | NLPModels (MathOptNLSModel) | 45958.0 | 5 | 80 | 362625.0 | 9 | 224 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 6500.0 | 141 | 6624 | 6 | 7.7016e-25 | true |
| 2 | SecondOrderOptimization (LM) | 6375.0 | 137 | 6448 | 6 | 7.7016e-25 | true |
| 2 | LeastSquaresOptim (Dogleg) | 16208.0 | 193 | 359168 | 7 | 0.0000e+00 | true |
| 2 | LeastSquaresOptim (LM) | 17166.5 | 189 | 359040 | 7 | 1.5248e-24 | true |
| 2 | Optim (NewtonTrustRegion) | 17146.0 | 237 | 15504 | 6 | 7.7016e-25 | true |
| 2 | Optim (Newton) | 15146.0 | 145 | 7168 | 6 | 7.7016e-25 | true |
| 2 | JSOSolvers (trunk) | 15166.5 | 113 | 5440 | 7 | 5.5901e-28 | true |
| 2 | JSOSolvers (tron) | 25875.0 | 200 | 10064 | 6 | 6.1357e-20 | true |
| 2 | Ipopt | 862979.0 | 688 | 30944 | 7 | 1.5884e-26 | true |
| 2 | MadNLP | 298708.5 | 631 | 50080 | 6 | 1.8806e-20 | true |
| 2 | NonlinearSolve (LM) | 39250.5 | 343 | 22768 | 13 | 1.6316e-22 | true |
| 2 | NonlinearSolve (TrustRegion) | 16500.0 | 230 | 361408 | 7 | 1.5811e-23 | true |
| 2 | CaNNOLeS | 14042.0 | 182 | 9760 | 6 | 7.7016e-25 | true |
| 3 | SecondOrderOptimization (Dogleg) | 7708.0 | 141 | 7344 | 7 | 7.5249e-20 | true |
| 3 | SecondOrderOptimization (LM) | 7312.5 | 137 | 7168 | 7 | 7.5232e-20 | true |
| 3 | LeastSquaresOptim (Dogleg) | 23083.0 | 217 | 413344 | 8 | 0.0000e+00 | true |
| 3 | LeastSquaresOptim (LM) | 17291.5 | 237 | 464736 | 9 | 5.6818e-30 | true |
| 3 | Optim (NewtonTrustRegion) | 32104.0 | 321 | 24304 | 7 | 9.2456e-22 | true |
| 3 | Optim (Newton) | 18625.0 | 162 | 8880 | 7 | 7.5249e-20 | true |
| 3 | JSOSolvers (trunk) | 20791.0 | 120 | 5968 | 7 | 1.8161e-20 | true |
| 3 | JSOSolvers (tron) | 72250.0 | 212 | 10864 | 7 | 2.7095e-17 | false |
| 3 | Ipopt | 872958.0 | 662 | 30720 | 7 | 8.0760e-18 | true |
| 3 | MadNLP | 391145.5 | 745 | 52544 | 8 | 4.4409e-16 | true |
| 3 | NonlinearSolve (LM) | 57354.0 | 373 | 29728 | 15 | 8.5268e-23 | true |
| 3 | NonlinearSolve (TrustRegion) | 18541.5 | 230 | 365168 | 7 | 7.5075e-19 | true |
| 3 | CaNNOLeS | 18083.5 | 185 | 12256 | 7 | 7.5249e-20 | true |
| 4 | SecondOrderOptimization (Dogleg) | 8166.0 | 141 | 8704 | 7 | 1.3440e-21 | true |
| 4 | SecondOrderOptimization (LM) | 7833.0 | 137 | 8496 | 7 | 1.3444e-21 | true |
| 4 | LeastSquaresOptim (Dogleg) | 20145.5 | 217 | 417472 | 8 | 0.0000e+00 | true |
| 4 | LeastSquaresOptim (LM) | 22208.0 | 237 | 469376 | 9 | 4.8047e-28 | true |
| 4 | Optim (NewtonTrustRegion) | 43708.0 | 354 | 34240 | 8 | 0.0000e+00 | true |
| 4 | Optim (Newton) | 18854.5 | 162 | 10288 | 7 | 1.3440e-21 | true |
| 4 | JSOSolvers (trunk) | 142333.0 | 402 | 25920 | 7 | 1.2381e-17 | false |
| 4 | JSOSolvers (tron) | 53062.5 | 246 | 13008 | 8 | 1.7694e-23 | true |
| 4 | Ipopt | 1.32875e6 | 980 | 47328 | 13 | 3.2978e-29 | true |
| 4 | MadNLP | 403708.0 | 748 | 53568 | 9 | 1.0519e-25 | true |
| 4 | NonlinearSolve (LM) | 87562.5 | 415 | 43808 | 18 | 3.9178e-20 | true |
| 4 | NonlinearSolve (TrustRegion) | 23854.0 | 256 | 423328 | 8 | 1.4513e-30 | true |
| 4 | CaNNOLeS | 22667.0 | 186 | 15888 | 7 | 1.3440e-21 | true |
| 5 | SecondOrderOptimization (Dogleg) | 12000.0 | 141 | 9904 | 9 | 0.0000e+00 | true |
| 5 | SecondOrderOptimization (LM) | 14041.0 | 137 | 9696 | 9 | 4.6966e-23 | true |
| 5 | LeastSquaresOptim (Dogleg) | 28416.5 | 257 | 474240 | 13 | 0.0000e+00 | true |
| 5 | LeastSquaresOptim (LM) | 27020.5 | 237 | 473856 | 9 | 1.0157e-25 | true |
| 5 | Optim (NewtonTrustRegion) | 48354.0 | 354 | 41008 | 8 | 2.7179e-28 | true |
| 5 | Optim (Newton) | 23229.0 | 183 | 13072 | 8 | 1.5683e-25 | true |
| 5 | JSOSolvers (trunk) | 48167.0 | 156 | 8256 | 9 | 1.3340e-23 | true |
| 5 | JSOSolvers (tron) | 117542.0 | 266 | 14192 | 10 | 7.2034e-18 | false |
| 5 | Ipopt | 1.2354585e6 | 930 | 48032 | 10 | 2.1001e-28 | true |
| 5 | MadNLP | 415708.0 | 739 | 54288 | 9 | 3.7426e-23 | true |
| 5 | NonlinearSolve (LM) | 118771.0 | 445 | 58656 | 20 | 2.2867e-21 | true |
| 5 | NonlinearSolve (TrustRegion) | 26458.0 | 256 | 429856 | 8 | 0.0000e+00 | true |
| 5 | CaNNOLeS | 30895.5 | 188 | 19360 | 8 | 3.1434e-27 | true |
| 6 | SecondOrderOptimization (Dogleg) | 13271.0 | 141 | 11856 | 9 | 7.3660e-31 | true |
| 6 | SecondOrderOptimization (LM) | 15709.0 | 137 | 11616 | 9 | 2.5627e-20 | true |
| 6 | LeastSquaresOptim (Dogleg) | 33896.0 | 261 | 479056 | 14 | 0.0000e+00 | true |
| 6 | LeastSquaresOptim (LM) | 42188.0 | 237 | 478464 | 9 | 6.5103e-28 | true |
| 6 | Optim (NewtonTrustRegion) | 61042.0 | 354 | 50912 | 8 | 3.2466e-25 | true |
| 6 | Optim (Newton) | 25834.0 | 183 | 15728 | 8 | 4.1099e-19 | true |
| 6 | JSOSolvers (trunk) | 62792.0 | 160 | 8912 | 9 | 2.1694e-26 | true |
| 6 | JSOSolvers (tron) | 107125.0 | 294 | 16160 | 10 | 1.0902e-17 | true |
| 6 | Ipopt | 1.3928125e6 | 988 | 53264 | 11 | 1.2990e-29 | true |
| 6 | MadNLP | 385562.5 | 700 | 54816 | 8 | 2.5072e+00 | true |
| 6 | NonlinearSolve (LM) | 160000.0 | 475 | 81984 | 22 | 5.1931e-23 | true |
| 6 | NonlinearSolve (TrustRegion) | 263250.0 | 1808 | 4239536 | 30 | 2.5072e+00 | false |
| 6 | CaNNOLeS | 38500.0 | 188 | 23824 | 8 | 7.3115e-25 | true |
| 8 | SecondOrderOptimization (Dogleg) | 14667.0 | 141 | 15840 | 8 | 2.0175e-24 | true |
| 8 | SecondOrderOptimization (LM) | 14042.0 | 137 | 15568 | 8 | 2.0194e-24 | true |
| 8 | LeastSquaresOptim (Dogleg) | 46062.5 | 251 | 489440 | 9 | 0.0000e+00 | true |
| 8 | LeastSquaresOptim (LM) | 44709.0 | 247 | 489696 | 9 | 1.0826e-24 | true |
| 8 | Optim (NewtonTrustRegion) | 91604.5 | 396 | 80352 | 9 | 0.0000e+00 | true |
| 8 | Optim (Newton) | 30812.5 | 179 | 21248 | 8 | 2.0175e-24 | true |
| 8 | JSOSolvers (trunk) | 106937.5 | 177 | 10768 | 10 | 4.0468e-18 | true |
| 8 | JSOSolvers (tron) | 192625.0 | 330 | 19184 | 10 | 4.0071e-21 | true |
| 8 | Ipopt | 1.9577295e6 | 1041 | 65040 | 14 | 1.2446e-19 | true |
| 8 | MadNLP | 477062.5 | 730 | 58080 | 9 | 2.6457e+00 | true |
| 8 | NonlinearSolve (LM) | 321791.5 | 605 | 160064 | 31 | 4.1941e-17 | true |
| 8 | NonlinearSolve (TrustRegion) | 47499.5 | 273 | 463232 | 8 | 1.0369e-23 | true |
| 8 | CaNNOLeS | 63375.0 | 190 | 37040 | 8 | 2.0175e-24 | true |
| 10 | SecondOrderOptimization (Dogleg) | 18791.5 | 141 | 21792 | 8 | 1.1201e-22 | true |
| 10 | SecondOrderOptimization (LM) | 18437.5 | 137 | 21488 | 8 | 1.1201e-22 | true |
| 10 | LeastSquaresOptim (Dogleg) | 64458.5 | 251 | 502608 | 9 | 0.0000e+00 | true |
| 10 | LeastSquaresOptim (LM) | 109417.0 | 379 | 827344 | 15 | 3.8422e-25 | true |
| 10 | Optim (NewtonTrustRegion) | 162771.0 | 543 | 149040 | 11 | 9.9092e-29 | true |
| 10 | Optim (Newton) | 42271.0 | 179 | 29984 | 8 | 1.1201e-22 | true |
| 10 | JSOSolvers (trunk) | 168271.0 | 182 | 12144 | 10 | 6.3729e-19 | true |
| 10 | JSOSolvers (tron) | 252520.5 | 316 | 19920 | 9 | 4.5011e-19 | true |
| 10 | Ipopt | 1.719438e6 | 825 | 61552 | 10 | 2.7100e+00 | true |
| 10 | MadNLP | 587875.0 | 766 | 61648 | 9 | 2.7100e+00 | true |
| 10 | NonlinearSolve (LM) | 2.062625e6 | 2039 | 821904 | 134 | 2.7100e+00 | true |
| 10 | NonlinearSolve (TrustRegion) | 71333.5 | 273 | 499072 | 8 | 5.2878e-22 | true |
| 10 | CaNNOLeS | 89687.0 | 190 | 50432 | 8 | 1.1201e-22 | true |
| 14 | SecondOrderOptimization (Dogleg) | 33271.0 | 141 | 34304 | 9 | 0.0000e+00 | true |
| 14 | SecondOrderOptimization (LM) | 31604.0 | 137 | 33936 | 9 | 0.0000e+00 | true |
| 14 | LeastSquaresOptim (Dogleg) | 119229.0 | 260 | 521040 | 9 | 0.0000e+00 | true |
| 14 | LeastSquaresOptim (LM) | 263103.5 | 462 | 1020000 | 18 | 7.5856e-27 | true |
| 14 | Optim (NewtonTrustRegion) | 231833.5 | 457 | 166400 | 9 | 5.0883e-19 | true |
| 14 | Optim (Newton) | 69520.5 | 206 | 30112 | 9 | 0.0000e+00 | true |
| 14 | JSOSolvers (trunk) | 509833.0 | 466 | 34576 | 11 | 8.5695e-18 | false |
| 14 | JSOSolvers (tron) | 941458.0 | 521 | 33136 | 12 | 3.3083e-19 | true |
| 14 | Ipopt | 2.6402295e6 | 935 | 101472 | 11 | 6.1007e-20 | true |
| 14 | MadNLP | 1.1683335e6 | 817 | 70752 | 14 | 2.7717e+00 | true |
| 14 | NonlinearSolve (LM) | 4.170271e6 | 2003 | 1317664 | 128 | 2.7717e+00 | true |
| 14 | NonlinearSolve (TrustRegion) | 167771.0 | 354 | 779520 | 9 | 2.9531e-20 | true |
| 14 | CaNNOLeS | 178333.5 | 206 | 96352 | 9 | 0.0000e+00 | true |
| 18 | SecondOrderOptimization (Dogleg) | 49750.0 | 159 | 70512 | 9 | 2.4556e-23 | true |
| 18 | SecondOrderOptimization (LM) | 49750.0 | 155 | 70080 | 9 | 2.4559e-23 | true |
| 18 | LeastSquaresOptim (Dogleg) | 250125.0 | 286 | 625680 | 10 | 0.0000e+00 | true |
| 18 | LeastSquaresOptim (LM) | 483541.5 | 462 | 1087360 | 18 | 5.6493e-26 | true |
| 18 | Optim (NewtonTrustRegion) | 430770.5 | 543 | 283136 | 10 | 5.6406e-24 | true |
| 18 | Optim (Newton) | 127104.5 | 208 | 44352 | 9 | 2.4556e-23 | true |
| 18 | JSOSolvers (trunk) | 714125.5 | 217 | 20480 | 12 | 1.4858e-18 | true |
| 18 | JSOSolvers (tron) | 1.710333e6 | 523 | 37952 | 10 | 2.2992e-17 | false |
| 18 | Ipopt | 4.794375e6 | 989 | 136304 | 13 | 1.8346e-18 | true |
| 18 | MadNLP | 1.625854e6 | 835 | 81600 | 14 | 2.8014e+00 | true |
| 18 | NonlinearSolve (LM) | 7.4850205e6 | 2515 | 2349248 | 128 | 2.8014e+00 | true |
| 18 | NonlinearSolve (TrustRegion) | 359021.0 | 269 | 231504 | 11 | 1.5096e-23 | true |
| 18 | CaNNOLeS | 291333.5 | 212 | 155440 | 9 | 2.4556e-23 | true |
| 22 | SecondOrderOptimization (Dogleg) | 72000.0 | 161 | 91984 | 9 | 4.1424e-22 | true |
| 22 | SecondOrderOptimization (LM) | 76604.0 | 157 | 91488 | 9 | 4.1424e-22 | true |
| 22 | LeastSquaresOptim (Dogleg) | 467438.0 | 299 | 669216 | 10 | 0.0000e+00 | true |
| 22 | LeastSquaresOptim (LM) | 908625.0 | 479 | 1144128 | 18 | 2.3716e-25 | true |
| 22 | Optim (NewtonTrustRegion) | 870729.0 | 791 | 533856 | 13 | 0.0000e+00 | true |
| 22 | Optim (Newton) | 233583.0 | 218 | 58656 | 9 | 4.1424e-22 | true |
| 22 | JSOSolvers (trunk) | 1.231375e6 | 490 | 43248 | 11 | 3.3980e-17 | false |
| 22 | JSOSolvers (tron) | 1.573125e6 | 383 | 35616 | 10 | 2.8812e-18 | true |
| 22 | Ipopt | 6.320563e6 | 1039 | 178800 | 13 | 1.0568e-28 | true |
| 22 | MadNLP | 2.7802715e6 | 801 | 93968 | 15 | 2.8186e+00 | true |
| 22 | NonlinearSolve (LM) | 1.47253545e7 | 2845 | 3290544 | 129 | 2.8186e+00 | true |
| 22 | NonlinearSolve (TrustRegion) | 784771.0 | 322 | 367648 | 13 | 1.3900e-20 | true |
| 22 | CaNNOLeS | 436812.0 | 235 | 204688 | 9 | 4.1423e-22 | true |
| 26 | SecondOrderOptimization (Dogleg) | 107979.5 | 161 | 132960 | 10 | 1.2434e-30 | true |
| 26 | SecondOrderOptimization (LM) | 108208.5 | 157 | 132400 | 10 | 1.2434e-30 | true |
| 26 | LeastSquaresOptim (Dogleg) | 804438.0 | 326 | 786016 | 11 | 0.0000e+00 | true |
| 26 | LeastSquaresOptim (LM) | 1.4383745e6 | 479 | 1209248 | 18 | 7.4077e-25 | true |
| 26 | Optim (NewtonTrustRegion) | 1.17025e6 | 804 | 730624 | 13 | 1.0484e-22 | true |
| 26 | Optim (Newton) | 353895.5 | 237 | 72480 | 10 | 1.2434e-30 | true |
| 26 | JSOSolvers (trunk) | 1.6033125e6 | 240 | 31696 | 12 | 2.9603e-19 | true |
| 26 | JSOSolvers (tron) | 2.304229e6 | 395 | 43936 | 11 | 2.0456e-20 | true |
| 26 | Ipopt | 8.1690625e6 | 1044 | 258320 | 12 | 3.3964e-17 | true |
| 26 | MadNLP | 4.0005e6 | 822 | 108784 | 16 | 2.8298e+00 | true |
| 26 | NonlinearSolve (LM) | 2.2736791e7 | 2845 | 4650832 | 129 | 2.8298e+00 | true |
| 26 | NonlinearSolve (TrustRegion) | 1.2108335e6 | 322 | 539760 | 13 | 6.0131e-18 | true |
| 26 | CaNNOLeS | 685624.5 | 245 | 320368 | 10 | 0.0000e+00 | true |
| 32 | SecondOrderOptimization (Dogleg) | 157979.5 | 161 | 177888 | 10 | 4.5840e-19 | true |
| 32 | SecondOrderOptimization (LM) | 160916.5 | 157 | 177232 | 10 | 4.5840e-19 | true |
| 32 | LeastSquaresOptim (Dogleg) | 1.635333e6 | 326 | 909104 | 11 | 0.0000e+00 | true |
| 32 | LeastSquaresOptim (LM) | 3.0513335e6 | 479 | 1355072 | 18 | 3.9810e-22 | true |
| 32 | Optim (NewtonTrustRegion) | 2.0695835e6 | 868 | 1059056 | 14 | 1.3363e-29 | true |
| 32 | Optim (Newton) | 672562.5 | 237 | 106176 | 10 | 4.5840e-19 | true |
| 32 | JSOSolvers (trunk) | 2.759833e6 | 507 | 63296 | 12 | 1.6641e-18 | false |
| 32 | JSOSolvers (tron) | 3.689209e6 | 393 | 59040 | 11 | 1.9552e-18 | false |
| 32 | Ipopt | 1.1397792e7 | 950 | 304896 | 11 | 6.1082e-32 | true |
| 32 | MadNLP | 5.6443335e6 | 907 | 141456 | 12 | 9.0856e+00 | true |
| 32 | NonlinearSolve (LM) | 3.49838335e7 | 2827 | 6606096 | 128 | 2.8407e+00 | true |
| 32 | NonlinearSolve (TrustRegion) | 1.6072295e6 | 295 | 797392 | 10 | 3.2128e-19 | true |
| 32 | CaNNOLeS | 1.0286245e6 | 250 | 445760 | 10 | 4.5840e-19 | true |
