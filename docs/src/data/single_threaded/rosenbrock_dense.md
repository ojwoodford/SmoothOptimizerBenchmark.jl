# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T02:30:55
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
| 2 | NLLSModel | 53.06666666666667 | 1 | 16 | 437.9019607843137 | 10 | 560 |
| 2 | Standalone | 50.91648351648352 | 1 | 16 | 528.1621621621622 | 7 | 528 |
| 2 | NLPModels (MathOptNLSModel) | 1083.3157894736842 | 5 | 80 | 2287.5 | 9 | 224 |
| 3 | NLLSModel | 55.73506493506493 | 1 | 16 | 436.83870967741933 | 10 | 560 |
| 3 | Standalone | 70.3960880195599 | 1 | 16 | 715.5172413793103 | 7 | 592 |
| 3 | NLPModels (MathOptNLSModel) | 1191.1764705882354 | 5 | 80 | 2282.4444444444443 | 9 | 224 |
| 4 | NLLSModel | 60.38961038961039 | 1 | 16 | 491.2368421052632 | 10 | 800 |
| 4 | Standalone | 59.18598382749326 | 1 | 16 | 714.0689655172414 | 7 | 688 |
| 4 | NLPModels (MathOptNLSModel) | 1450.0 | 5 | 80 | 2910.714285714286 | 9 | 224 |
| 5 | NLLSModel | 59.364548494983275 | 1 | 16 | 580.0263157894736 | 10 | 800 |
| 5 | Standalone | 66.00294985250737 | 1 | 16 | 830.1153846153846 | 7 | 784 |
| 5 | NLPModels (MathOptNLSModel) | 1829.9166666666667 | 5 | 80 | 3650.0 | 9 | 224 |
| 6 | NLLSModel | 67.97050147492625 | 1 | 16 | 663.7931034482758 | 10 | 896 |
| 6 | Standalone | 72.24025974025975 | 1 | 16 | 1036.764705882353 | 7 | 944 |
| 6 | NLPModels (MathOptNLSModel) | 2091.6 | 5 | 80 | 4758.4 | 9 | 224 |
| 8 | NLLSModel | 81.87548638132296 | 1 | 16 | 922.6190476190476 | 10 | 1280 |
| 8 | Standalone | 77.18705035971223 | 1 | 16 | 1400.0 | 7 | 1296 |
| 8 | NLPModels (MathOptNLSModel) | 3202.4285714285716 | 5 | 80 | 8000.0 | 9 | 224 |
| 10 | NLLSModel | 92.80454545454545 | 1 | 16 | 1225.4705882352941 | 10 | 1376 |
| 10 | Standalone | 88.63157894736842 | 1 | 16 | 2447.875 | 7 | 1808 |
| 10 | NLPModels (MathOptNLSModel) | 4791.6 | 5 | 80 | 13792.0 | 9 | 224 |
| 14 | NLLSModel | 143.45 | 1 | 16 | 1965.909090909091 | 10 | 1568 |
| 14 | Standalone | 103.22613065326634 | 1 | 16 | 4225.0 | 8 | 1808 |
| 14 | NLPModels (MathOptNLSModel) | 9486.0 | 5 | 80 | 42333.0 | 9 | 224 |
| 18 | NLLSModel | 254.0120481927711 | 1 | 16 | 3226.285714285714 | 10 | 2384 |
| 18 | Standalone | 122.09493670886076 | 1 | 16 | 8834.0 | 8 | 2624 |
| 18 | NLPModels (MathOptNLSModel) | 15542.0 | 5 | 80 | 71875.0 | 9 | 224 |
| 22 | NLLSModel | 350.40983606557376 | 1 | 16 | 4400.0 | 10 | 2624 |
| 22 | Standalone | 153.3768115942029 | 1 | 16 | 18667.0 | 9 | 3552 |
| 22 | NLPModels (MathOptNLSModel) | 22625.0 | 5 | 80 | 138667.0 | 9 | 224 |
| 26 | NLLSModel | 490.73333333333335 | 1 | 16 | 6000.0 | 10 | 2864 |
| 26 | Standalone | 174.14529914529913 | 1 | 16 | 26333.0 | 9 | 4240 |
| 26 | NLPModels (MathOptNLSModel) | 31542.0 | 5 | 80 | 216333.0 | 9 | 224 |
| 32 | NLLSModel | 686.7931034482758 | 1 | 16 | 8569.333333333334 | 10 | 4256 |
| 32 | Standalone | 217.3913043478261 | 1 | 16 | 55375.0 | 9 | 6624 |
| 32 | NLPModels (MathOptNLSModel) | 48333.0 | 5 | 80 | 373791.0 | 9 | 224 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 8708.0 | 205 | 10896 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM) | 8292.0 | 201 | 10720 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM, tall) | 8417.0 | 101 | 7264 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | LeastSquaresOptim (Dogleg) | 18396.0 | 193 | 359168 | 7 | 0.0000e+00 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 18312.0 | 189 | 359040 | 7 | 1.5248e-24 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 18521.0 | 237 | 15504 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 16208.5 | 145 | 7168 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 15812.5 | 113 | 5440 | 7 | 5.5901e-28 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 25104.5 | 199 | 10032 | 6 | 6.1357e-20 | true | ok | NaN | first\_order |
| 2 | Ipopt | 828770.5 | 688 | 30944 | 7 | 1.5884e-26 | true | ok | NaN | first\_order |
| 2 | MadNLP | 327750.0 | 631 | 50080 | 6 | 1.8806e-20 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 42604.5 | 343 | 23168 | 13 | 1.6316e-22 | true | ok | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 19604.0 | 205 | 360272 | 7 | 1.5811e-23 | true | ok | NaN | Success |
| 2 | CaNNOLeS | 15792.0 | 182 | 9760 | 6 | 7.7016e-25 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 10750.0 | 214 | 12144 | 7 | 7.5249e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM) | 10291.5 | 210 | 11968 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 11625.0 | 101 | 8384 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | LeastSquaresOptim (Dogleg) | 24896.0 | 217 | 413344 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 24104.5 | 237 | 464736 | 9 | 5.6818e-30 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 32125.0 | 321 | 24304 | 7 | 9.2456e-22 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 19354.0 | 162 | 8880 | 7 | 7.5249e-20 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 20833.0 | 120 | 5968 | 7 | 1.8161e-20 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 70000.0 | 211 | 10832 | 7 | 2.7095e-17 | false | not_converged | NaN | small\_residual |
| 3 | Ipopt | 914166.5 | 662 | 30720 | 7 | 8.0760e-18 | true | ok | NaN | first\_order |
| 3 | MadNLP | 416979.0 | 745 | 52544 | 8 | 4.4409e-16 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 55916.5 | 367 | 29072 | 15 | 8.5268e-23 | true | ok | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 22541.5 | 205 | 363872 | 7 | 7.5075e-19 | true | ok | NaN | Success |
| 3 | CaNNOLeS | 19521.0 | 185 | 12256 | 7 | 7.5249e-20 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 11125.0 | 214 | 15456 | 7 | 1.3440e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM) | 10937.5 | 210 | 15248 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 14000.0 | 101 | 10096 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | LeastSquaresOptim (Dogleg) | 26771.0 | 217 | 417472 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 31083.5 | 237 | 469376 | 9 | 4.8047e-28 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 42750.5 | 354 | 34240 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 19833.5 | 162 | 10288 | 7 | 1.3440e-21 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 133209.0 | 402 | 25920 | 7 | 1.2381e-17 | false | not_converged | NaN | not\_desc |
| 4 | JSOSolvers (tron) | 54020.5 | 245 | 12976 | 8 | 1.7694e-23 | true | ok | NaN | first\_order |
| 4 | Ipopt | 1.439417e6 | 980 | 47328 | 13 | 3.2978e-29 | true | ok | NaN | first\_order |
| 4 | MadNLP | 462437.0 | 748 | 53568 | 9 | 1.0519e-25 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 72791.5 | 400 | 40192 | 18 | 3.9178e-20 | true | ok | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 30145.5 | 231 | 421792 | 8 | 1.4513e-30 | true | ok | NaN | Success |
| 4 | CaNNOLeS | 24500.0 | 186 | 15888 | 7 | 1.3440e-21 | true | ok | NaN | first\_order |
| 5 | SecondOrderOptimization (Dogleg) | 15667.0 | 241 | 18976 | 9 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM) | 17979.5 | 237 | 18768 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 27708.0 | 101 | 12048 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | LeastSquaresOptim (Dogleg) | 35812.5 | 257 | 474240 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 35708.0 | 237 | 473856 | 9 | 1.0157e-25 | true | ok | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 53500.0 | 354 | 41008 | 8 | 2.7179e-28 | true | ok | NaN | converged |
| 5 | Optim (Newton) | 25791.5 | 183 | 13072 | 8 | 1.5683e-25 | true | ok | NaN | converged |
| 5 | JSOSolvers (trunk) | 50520.5 | 156 | 8256 | 9 | 1.3340e-23 | true | ok | NaN | first\_order |
| 5 | JSOSolvers (tron) | 120083.0 | 265 | 14160 | 10 | 7.2034e-18 | false | not_converged | NaN | small\_residual |
| 5 | Ipopt | 1.3062295e6 | 930 | 48032 | 10 | 2.1001e-28 | true | ok | NaN | first\_order |
| 5 | MadNLP | 456499.5 | 739 | 54288 | 9 | 3.7426e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 96750.5 | 424 | 52064 | 20 | 2.2867e-21 | true | ok | NaN | Success |
| 5 | NonlinearSolve (TrustRegion) | 32854.0 | 231 | 428080 | 8 | 0.0000e+00 | true | ok | NaN | Success |
| 5 | CaNNOLeS | 33167.0 | 188 | 19360 | 8 | 3.1434e-27 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 17291.5 | 241 | 22016 | 9 | 7.3660e-31 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM) | 20041.5 | 237 | 21776 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 33792.0 | 101 | 15008 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | LeastSquaresOptim (Dogleg) | 41375.0 | 261 | 479056 | 14 | 0.0000e+00 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 41625.0 | 237 | 478464 | 9 | 6.5103e-28 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 63958.5 | 354 | 50912 | 8 | 3.2466e-25 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 27771.0 | 183 | 15728 | 8 | 4.1099e-19 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 67021.0 | 160 | 8912 | 9 | 2.1694e-26 | true | ok | NaN | first\_order |
| 6 | JSOSolvers (tron) | 113583.5 | 293 | 16128 | 10 | 1.0902e-17 | true | ok | NaN | first\_order |
| 6 | Ipopt | 1.4614375e6 | 988 | 53264 | 11 | 1.2990e-29 | true | ok | NaN | first\_order |
| 6 | MadNLP | 434417.0 | 700 | 54816 | 8 | 2.5072e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 123042.0 | 448 | 70112 | 22 | 5.1931e-23 | true | ok | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 410084.0 | 2179 | 5201296 | 36 | 2.5072e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 6 | CaNNOLeS | 39500.0 | 188 | 23824 | 8 | 7.3115e-25 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 18083.5 | 223 | 27760 | 8 | 2.0175e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM) | 18313.0 | 219 | 27488 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 36167.0 | 105 | 23152 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | LeastSquaresOptim (Dogleg) | 54562.5 | 251 | 489440 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 53646.0 | 247 | 489696 | 9 | 1.0826e-24 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 94979.5 | 396 | 80352 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 31437.5 | 179 | 21248 | 8 | 2.0175e-24 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 109208.0 | 177 | 10768 | 10 | 4.0468e-18 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 189104.0 | 329 | 19152 | 10 | 4.0071e-21 | true | ok | NaN | first\_order |
| 8 | Ipopt | 1.9622085e6 | 1041 | 65040 | 14 | 1.2446e-19 | true | ok | NaN | first\_order |
| 8 | MadNLP | 500937.5 | 730 | 58080 | 9 | 2.6457e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 222708.5 | 551 | 129392 | 31 | 4.1941e-17 | true | ok | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 51833.5 | 248 | 460208 | 8 | 1.0369e-23 | true | ok | NaN | Success |
| 8 | CaNNOLeS | 60145.5 | 190 | 37040 | 8 | 2.0175e-24 | true | ok | NaN | first\_order |
| 10 | SecondOrderOptimization (Dogleg) | 23042.0 | 223 | 34576 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM) | 22667.0 | 219 | 34272 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 51708.5 | 105 | 34336 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | LeastSquaresOptim (Dogleg) | 72874.5 | 251 | 502608 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 118479.0 | 379 | 827344 | 15 | 3.8422e-25 | true | ok | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 167250.0 | 543 | 149040 | 11 | 9.9092e-29 | true | ok | NaN | converged |
| 10 | Optim (Newton) | 42042.0 | 179 | 29984 | 8 | 1.1201e-22 | true | ok | NaN | converged |
| 10 | JSOSolvers (trunk) | 165583.5 | 182 | 12144 | 10 | 6.3729e-19 | true | ok | NaN | first\_order |
| 10 | JSOSolvers (tron) | 250145.5 | 315 | 19904 | 9 | 4.5011e-19 | true | ok | NaN | first\_order |
| 10 | Ipopt | 1.6745625e6 | 825 | 61552 | 10 | 2.7100e+00 | true | ok | NaN | first\_order |
| 10 | MadNLP | 596374.5 | 766 | 61648 | 9 | 2.7100e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 1.2831875e6 | 1676 | 581568 | 134 | 2.7100e+00 | true | ok | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 74437.5 | 248 | 494544 | 8 | 5.2878e-22 | true | ok | NaN | Success |
| 10 | CaNNOLeS | 89208.0 | 190 | 50432 | 8 | 1.1201e-22 | true | ok | NaN | first\_order |
| 14 | SecondOrderOptimization (Dogleg) | 40145.5 | 232 | 50432 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM) | 39771.0 | 228 | 50064 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM, tall) | 117354.5 | 106 | 67376 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | LeastSquaresOptim (Dogleg) | 126979.5 | 260 | 521040 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 257687.5 | 462 | 1020000 | 18 | 7.5856e-27 | true | ok | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 237625.0 | 457 | 166400 | 9 | 5.0883e-19 | true | ok | NaN | converged |
| 14 | Optim (Newton) | 72166.5 | 206 | 30112 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | JSOSolvers (trunk) | 511750.0 | 466 | 34576 | 11 | 8.5695e-18 | false | not_converged | NaN | not\_desc |
| 14 | JSOSolvers (tron) | 940750.0 | 520 | 33120 | 12 | 3.3083e-19 | true | ok | NaN | first\_order |
| 14 | Ipopt | 2.718e6 | 935 | 101472 | 11 | 6.1007e-20 | true | ok | NaN | first\_order |
| 14 | MadNLP | 1.218875e6 | 817 | 70752 | 14 | 2.7717e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 2.524e6 | 1658 | 897968 | 128 | 2.7717e+00 | true | ok | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 182374.5 | 329 | 776864 | 9 | 2.9531e-20 | true | ok | NaN | Success |
| 14 | CaNNOLeS | 185645.5 | 206 | 96352 | 9 | 0.0000e+00 | true | ok | NaN | first\_order |
| 18 | SecondOrderOptimization (Dogleg) | 61979.5 | 250 | 94864 | 9 | 2.4556e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM) | 59520.5 | 246 | 94432 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM, tall) | 222563.0 | 110 | 129200 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | LeastSquaresOptim (Dogleg) | 256791.5 | 286 | 625680 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 18 | LeastSquaresOptim (LM) | 509083.5 | 462 | 1087360 | 18 | 5.6493e-26 | true | ok | NaN | converged |
| 18 | Optim (NewtonTrustRegion) | 430083.0 | 543 | 283136 | 10 | 5.6406e-24 | true | ok | NaN | converged |
| 18 | Optim (Newton) | 126479.5 | 208 | 44352 | 9 | 2.4556e-23 | true | ok | NaN | converged |
| 18 | JSOSolvers (trunk) | 718104.0 | 217 | 20480 | 12 | 1.4858e-18 | true | ok | NaN | first\_order |
| 18 | JSOSolvers (tron) | 1.677541e6 | 522 | 37936 | 10 | 2.2992e-17 | false | not_converged | NaN | small\_residual |
| 18 | Ipopt | 4.620667e6 | 989 | 136304 | 13 | 1.8346e-18 | true | ok | NaN | first\_order |
| 18 | MadNLP | 1.678292e6 | 835 | 81600 | 14 | 2.8014e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 18 | NonlinearSolve (LM) | 4.454917e6 | 1914 | 1554048 | 128 | 2.8014e+00 | true | ok | NaN | StalledSuccess |
| 18 | NonlinearSolve (TrustRegion) | 368104.0 | 195 | 117296 | 12 | 2.5221e-17 | true | ok | NaN | Success |
| 18 | CaNNOLeS | 296479.0 | 212 | 155440 | 9 | 2.4556e-23 | true | ok | NaN | first\_order |
| 22 | SecondOrderOptimization (Dogleg) | 86188.0 | 252 | 118816 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM) | 83000.5 | 248 | 118320 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM, tall) | 373708.0 | 118 | 203056 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | LeastSquaresOptim (Dogleg) | 470937.5 | 299 | 669216 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | LeastSquaresOptim (LM) | 904500.0 | 479 | 1144128 | 18 | 2.3716e-25 | true | ok | NaN | converged |
| 22 | Optim (NewtonTrustRegion) | 886646.0 | 791 | 533856 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | Optim (Newton) | 233708.5 | 218 | 58656 | 9 | 4.1424e-22 | true | ok | NaN | converged |
| 22 | JSOSolvers (trunk) | 1.2765e6 | 490 | 43248 | 11 | 3.3980e-17 | false | not_converged | NaN | not\_desc |
| 22 | JSOSolvers (tron) | 1.6399375e6 | 382 | 35600 | 10 | 2.8812e-18 | true | ok | NaN | first\_order |
| 22 | Ipopt | 6.5809165e6 | 1039 | 178800 | 13 | 1.0568e-28 | true | ok | NaN | first\_order |
| 22 | MadNLP | 3.02e6 | 801 | 93968 | 15 | 2.8186e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 22 | NonlinearSolve (LM) | 8.53775e6 | 2239 | 2226368 | 129 | 2.8186e+00 | true | ok | NaN | StalledSuccess |
| 22 | NonlinearSolve (TrustRegion) | 731875.0 | 211 | 179792 | 12 | 2.4364e-17 | true | ok | NaN | Success |
| 22 | CaNNOLeS | 446812.5 | 235 | 204688 | 9 | 4.1423e-22 | true | ok | NaN | first\_order |
| 26 | SecondOrderOptimization (Dogleg) | 116250.0 | 261 | 165056 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM) | 120541.5 | 257 | 164496 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 659396.0 | 118 | 323376 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | LeastSquaresOptim (Dogleg) | 804750.0 | 326 | 786016 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 26 | LeastSquaresOptim (LM) | 1.4786045e6 | 479 | 1209248 | 18 | 7.4077e-25 | true | ok | NaN | converged |
| 26 | Optim (NewtonTrustRegion) | 1.220146e6 | 804 | 730624 | 13 | 1.0484e-22 | true | ok | NaN | converged |
| 26 | Optim (Newton) | 366000.0 | 237 | 72480 | 10 | 1.2434e-30 | true | ok | NaN | converged |
| 26 | JSOSolvers (trunk) | 1.685646e6 | 240 | 31696 | 12 | 2.9603e-19 | true | ok | NaN | first\_order |
| 26 | JSOSolvers (tron) | 2.371875e6 | 394 | 43936 | 11 | 2.0456e-20 | true | ok | NaN | first\_order |
| 26 | Ipopt | 8.4711045e6 | 1044 | 258320 | 12 | 3.3964e-17 | true | ok | NaN | first\_order |
| 26 | MadNLP | 4.255354e6 | 822 | 108784 | 16 | 2.8298e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 26 | NonlinearSolve (LM) | 1.29601035e7 | 2239 | 3056896 | 129 | 2.8298e+00 | true | ok | NaN | StalledSuccess |
| 26 | NonlinearSolve (TrustRegion) | 1.442854e6 | 219 | 257856 | 11 | 1.6988e-19 | true | ok | NaN | Success |
| 26 | CaNNOLeS | 697395.5 | 245 | 320368 | 10 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32 | SecondOrderOptimization (Dogleg) | 172146.0 | 261 | 225408 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 174541.5 | 257 | 224752 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 1.2315625e6 | 118 | 556592 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 1.6587085e6 | 326 | 909104 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 3.1399585e6 | 479 | 1355072 | 18 | 3.9810e-22 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 2.153479e6 | 868 | 1059056 | 14 | 1.3363e-29 | true | ok | NaN | converged |
| 32 | Optim (Newton) | 698666.5 | 237 | 106176 | 10 | 4.5840e-19 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 2.839042e6 | 507 | 63296 | 12 | 1.6641e-18 | false | not_converged | NaN | not\_desc |
| 32 | JSOSolvers (tron) | 3.732291e6 | 392 | 59040 | 11 | 1.9552e-18 | false | not_converged | NaN | small\_residual |
| 32 | Ipopt | 1.1444e7 | 950 | 304896 | 11 | 6.1082e-32 | true | ok | NaN | first\_order |
| 32 | MadNLP | 5.7741455e6 | 907 | 141456 | 12 | 9.0856e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 2.07310835e7 | 2226 | 4501776 | 128 | 2.8407e+00 | true | ok | NaN | StalledSuccess |
| 32 | NonlinearSolve (TrustRegion) | 3.2409375e6 | 219 | 436736 | 15 | 6.5356e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 1.0466045e6 | 250 | 445760 | 10 | 4.5840e-19 | true | ok | NaN | first\_order |
