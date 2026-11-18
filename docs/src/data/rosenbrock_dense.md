# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T01:41:31
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
| 2 | NLLSModel | 57.38814016172507 | 1 | 16 | 388.9019607843137 | 10 | 560 |
| 2 | Standalone | 51.245977011494254 | 1 | 16 | 708.0 | 7 | 528 |
| 2 | NLPModels (MathOptNLSModel) | 1142.578947368421 | 5 | 80 | 2050.8888888888887 | 9 | 224 |
| 3 | NLLSModel | 56.02933985330073 | 1 | 16 | 481.3829787234043 | 10 | 560 |
| 3 | Standalone | 59.39364303178484 | 1 | 16 | 875.0 | 7 | 592 |
| 3 | NLPModels (MathOptNLSModel) | 1215.2777777777778 | 5 | 80 | 2412.0 | 9 | 224 |
| 4 | NLLSModel | 62.55324675324675 | 1 | 16 | 506.57894736842104 | 10 | 800 |
| 4 | Standalone | 59.3405572755418 | 1 | 16 | 916.0 | 7 | 688 |
| 4 | NLPModels (MathOptNLSModel) | 1467.2857142857142 | 5 | 80 | 2857.1428571428573 | 9 | 224 |
| 5 | NLLSModel | 73.11320754716981 | 1 | 16 | 553.5714285714286 | 10 | 800 |
| 5 | Standalone | 71.59442724458205 | 1 | 16 | 917.0 | 7 | 784 |
| 5 | NLPModels (MathOptNLSModel) | 1809.0 | 5 | 80 | 3614.5 | 9 | 224 |
| 6 | NLLSModel | 66.6165191740413 | 1 | 16 | 709.6774193548387 | 10 | 896 |
| 6 | Standalone | 73.99665551839465 | 1 | 16 | 1042.0 | 7 | 944 |
| 6 | NLPModels (MathOptNLSModel) | 2091.7 | 5 | 80 | 4850.0 | 9 | 224 |
| 8 | NLLSModel | 97.59922178988327 | 1 | 16 | 932.9565217391304 | 10 | 1280 |
| 8 | Standalone | 76.0 | 1 | 16 | 1542.0 | 7 | 1296 |
| 8 | NLPModels (MathOptNLSModel) | 3178.5714285714284 | 5 | 80 | 8264.0 | 9 | 224 |
| 10 | NLLSModel | 111.49537037037037 | 1 | 16 | 1245.388888888889 | 10 | 1376 |
| 10 | Standalone | 81.668 | 1 | 16 | 2458.0 | 7 | 1808 |
| 10 | NLPModels (MathOptNLSModel) | 4558.4 | 5 | 80 | 14291.0 | 9 | 224 |
| 14 | NLLSModel | 179.7642857142857 | 1 | 16 | 2010.375 | 10 | 1568 |
| 14 | Standalone | 107.72682926829269 | 1 | 16 | 4375.0 | 8 | 1808 |
| 14 | NLPModels (MathOptNLSModel) | 9347.333333333334 | 5 | 80 | 40209.0 | 9 | 224 |
| 18 | NLLSModel | 266.873417721519 | 1 | 16 | 3256.0 | 10 | 2384 |
| 18 | Standalone | 120.07100591715977 | 1 | 16 | 8875.0 | 8 | 2624 |
| 18 | NLPModels (MathOptNLSModel) | 15250.0 | 5 | 80 | 69125.0 | 9 | 224 |
| 22 | NLLSModel | 358.46031746031747 | 1 | 16 | 4283.4 | 10 | 2624 |
| 22 | Standalone | 141.90579710144928 | 1 | 16 | 18083.0 | 9 | 3552 |
| 22 | NLPModels (MathOptNLSModel) | 22375.0 | 5 | 80 | 140334.0 | 9 | 224 |
| 26 | NLLSModel | 413.1875 | 1 | 16 | 5885.5 | 10 | 2864 |
| 26 | Standalone | 161.50413223140495 | 1 | 16 | 26625.0 | 9 | 4240 |
| 26 | NLPModels (MathOptNLSModel) | 31417.0 | 5 | 80 | 200375.0 | 9 | 224 |
| 32 | NLLSModel | 479.0 | 1 | 16 | 8847.333333333334 | 10 | 4256 |
| 32 | Standalone | 226.69892473118279 | 1 | 16 | 53917.0 | 9 | 6624 |
| 32 | NLPModels (MathOptNLSModel) | 47750.0 | 5 | 80 | 378917.0 | 9 | 224 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 9625.0 | 205 | 10896 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM) | 8562.5 | 201 | 10720 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM, tall) | 8416.5 | 101 | 7264 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | LeastSquaresOptim (Dogleg) | 19208.0 | 193 | 359168 | 7 | 0.0000e+00 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 18646.0 | 189 | 359040 | 7 | 1.5248e-24 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 18521.0 | 237 | 15504 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 14874.5 | 145 | 7168 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 15374.5 | 113 | 5440 | 7 | 5.5901e-28 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 25791.5 | 199 | 10032 | 6 | 6.1357e-20 | true | ok | NaN | first\_order |
| 2 | Ipopt | 815354.0 | 688 | 30944 | 7 | 1.5884e-26 | true | ok | NaN | first\_order |
| 2 | MadNLP | 305500.0 | 631 | 50080 | 6 | 1.8806e-20 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 45062.0 | 343 | 23168 | 13 | 1.6316e-22 | true | ok | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 13145.5 | 205 | 360272 | 7 | 1.5811e-23 | true | ok | NaN | Success |
| 2 | CaNNOLeS | 16854.0 | 182 | 9760 | 6 | 7.7016e-25 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 10958.5 | 214 | 12144 | 7 | 7.5249e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM) | 10646.0 | 210 | 11968 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 12250.0 | 101 | 8384 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | LeastSquaresOptim (Dogleg) | 15145.5 | 217 | 413344 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 28563.0 | 237 | 464736 | 9 | 5.6818e-30 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 30625.0 | 321 | 24304 | 7 | 9.2456e-22 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 17917.0 | 162 | 8880 | 7 | 7.5249e-20 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 20229.5 | 120 | 5968 | 7 | 1.8161e-20 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 67417.0 | 211 | 10832 | 7 | 2.7095e-17 | false | not_converged | NaN | small\_residual |
| 3 | Ipopt | 873916.5 | 662 | 30720 | 7 | 8.0760e-18 | true | ok | NaN | first\_order |
| 3 | MadNLP | 404334.0 | 745 | 52544 | 8 | 4.4409e-16 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 56541.5 | 367 | 29072 | 15 | 8.5268e-23 | true | ok | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 23041.5 | 205 | 363872 | 7 | 7.5075e-19 | true | ok | NaN | Success |
| 3 | CaNNOLeS | 18708.5 | 185 | 12256 | 7 | 7.5249e-20 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 11417.0 | 214 | 15456 | 7 | 1.3440e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM) | 11270.5 | 210 | 15248 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 14479.0 | 101 | 10096 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | LeastSquaresOptim (Dogleg) | 24875.0 | 217 | 417472 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 22833.5 | 237 | 469376 | 9 | 4.8047e-28 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 41729.5 | 354 | 34240 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 18708.0 | 162 | 10288 | 7 | 1.3440e-21 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 155417.0 | 402 | 25920 | 7 | 1.2381e-17 | false | not_converged | NaN | not\_desc |
| 4 | JSOSolvers (tron) | 54854.0 | 245 | 12976 | 8 | 1.7694e-23 | true | ok | NaN | first\_order |
| 4 | Ipopt | 1.4221875e6 | 980 | 47328 | 13 | 3.2978e-29 | true | ok | NaN | first\_order |
| 4 | MadNLP | 465312.5 | 748 | 53568 | 9 | 1.0519e-25 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 70666.5 | 400 | 40192 | 18 | 3.9178e-20 | true | ok | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 19625.0 | 231 | 421792 | 8 | 1.4513e-30 | true | ok | NaN | Success |
| 4 | CaNNOLeS | 23333.0 | 186 | 15888 | 7 | 1.3440e-21 | true | ok | NaN | first\_order |
| 5 | SecondOrderOptimization (Dogleg) | 15541.0 | 241 | 18976 | 9 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM) | 17042.0 | 237 | 18768 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 26854.0 | 101 | 12048 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | LeastSquaresOptim (Dogleg) | 25041.5 | 257 | 474240 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 25062.5 | 237 | 473856 | 9 | 1.0157e-25 | true | ok | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 49417.0 | 354 | 41008 | 8 | 2.7179e-28 | true | ok | NaN | converged |
| 5 | Optim (Newton) | 24708.5 | 183 | 13072 | 8 | 1.5683e-25 | true | ok | NaN | converged |
| 5 | JSOSolvers (trunk) | 52625.0 | 156 | 8256 | 9 | 1.3340e-23 | true | ok | NaN | first\_order |
| 5 | JSOSolvers (tron) | 131084.0 | 265 | 14160 | 10 | 7.2034e-18 | false | not_converged | NaN | small\_residual |
| 5 | Ipopt | 1.356125e6 | 930 | 48032 | 10 | 2.1001e-28 | true | ok | NaN | first\_order |
| 5 | MadNLP | 471791.5 | 739 | 54288 | 9 | 3.7426e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 93729.0 | 424 | 52064 | 20 | 2.2867e-21 | true | ok | NaN | Success |
| 5 | NonlinearSolve (TrustRegion) | 23770.5 | 231 | 428080 | 8 | 0.0000e+00 | true | ok | NaN | Success |
| 5 | CaNNOLeS | 31604.0 | 188 | 19360 | 8 | 3.1434e-27 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 16562.5 | 241 | 22016 | 9 | 7.3660e-31 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM) | 18583.5 | 237 | 21776 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 31854.5 | 101 | 15008 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | LeastSquaresOptim (Dogleg) | 31666.5 | 261 | 479056 | 14 | 0.0000e+00 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 29333.0 | 237 | 478464 | 9 | 6.5103e-28 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 64395.5 | 354 | 50912 | 8 | 3.2466e-25 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 25416.5 | 183 | 15728 | 8 | 4.1099e-19 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 63125.0 | 160 | 8912 | 9 | 2.1694e-26 | true | ok | NaN | first\_order |
| 6 | JSOSolvers (tron) | 108292.0 | 293 | 16128 | 10 | 1.0902e-17 | true | ok | NaN | first\_order |
| 6 | Ipopt | 1.3493125e6 | 988 | 53264 | 11 | 1.2990e-29 | true | ok | NaN | first\_order |
| 6 | MadNLP | 432417.0 | 700 | 54816 | 8 | 2.5072e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 124208.5 | 448 | 70112 | 22 | 5.1931e-23 | true | ok | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 288958.0 | 2179 | 5201296 | 36 | 2.5072e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 6 | CaNNOLeS | 38687.5 | 188 | 23824 | 8 | 7.3115e-25 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 18041.5 | 223 | 27760 | 8 | 2.0175e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM) | 17667.0 | 219 | 27488 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 35291.5 | 105 | 23152 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | LeastSquaresOptim (Dogleg) | 42083.5 | 251 | 489440 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 44333.5 | 247 | 489696 | 9 | 1.0826e-24 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 94708.5 | 396 | 80352 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 31396.0 | 179 | 21248 | 8 | 2.0175e-24 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 106875.0 | 177 | 10768 | 10 | 4.0468e-18 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 185166.5 | 329 | 19152 | 10 | 4.0071e-21 | true | ok | NaN | first\_order |
| 8 | Ipopt | 1.91675e6 | 1041 | 65040 | 14 | 1.2446e-19 | true | ok | NaN | first\_order |
| 8 | MadNLP | 486437.5 | 730 | 58080 | 9 | 2.6457e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 217896.0 | 551 | 129392 | 31 | 4.1941e-17 | true | ok | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 42312.5 | 248 | 460208 | 8 | 1.0369e-23 | true | ok | NaN | Success |
| 8 | CaNNOLeS | 58312.0 | 190 | 37040 | 8 | 2.0175e-24 | true | ok | NaN | first\_order |
| 10 | SecondOrderOptimization (Dogleg) | 22541.5 | 223 | 34576 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM) | 21959.0 | 219 | 34272 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 50916.5 | 105 | 34336 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | LeastSquaresOptim (Dogleg) | 64625.0 | 251 | 502608 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 103250.0 | 379 | 827344 | 15 | 3.8422e-25 | true | ok | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 169770.5 | 543 | 149040 | 11 | 9.9092e-29 | true | ok | NaN | converged |
| 10 | Optim (Newton) | 41166.5 | 179 | 29984 | 8 | 1.1201e-22 | true | ok | NaN | converged |
| 10 | JSOSolvers (trunk) | 163729.0 | 182 | 12144 | 10 | 6.3729e-19 | true | ok | NaN | first\_order |
| 10 | JSOSolvers (tron) | 250687.5 | 315 | 19904 | 9 | 4.5011e-19 | true | ok | NaN | first\_order |
| 10 | Ipopt | 1.6411455e6 | 825 | 61552 | 10 | 2.7100e+00 | true | ok | NaN | first\_order |
| 10 | MadNLP | 595229.0 | 766 | 61648 | 9 | 2.7100e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 1.3042705e6 | 1676 | 581568 | 134 | 2.7100e+00 | true | ok | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 66667.0 | 248 | 494544 | 8 | 5.2878e-22 | true | ok | NaN | Success |
| 10 | CaNNOLeS | 88354.0 | 190 | 50432 | 8 | 1.1201e-22 | true | ok | NaN | first\_order |
| 14 | SecondOrderOptimization (Dogleg) | 38229.0 | 232 | 50432 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM) | 36208.0 | 228 | 50064 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM, tall) | 116979.0 | 106 | 67376 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | LeastSquaresOptim (Dogleg) | 114854.5 | 260 | 521040 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 237750.0 | 462 | 1020000 | 18 | 7.5856e-27 | true | ok | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 225771.0 | 457 | 166400 | 9 | 5.0883e-19 | true | ok | NaN | converged |
| 14 | Optim (Newton) | 73021.0 | 206 | 30112 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | JSOSolvers (trunk) | 530125.0 | 466 | 34576 | 11 | 8.5695e-18 | false | not_converged | NaN | not\_desc |
| 14 | JSOSolvers (tron) | 967375.0 | 520 | 33120 | 12 | 3.3083e-19 | true | ok | NaN | first\_order |
| 14 | Ipopt | 2.6795415e6 | 935 | 101472 | 11 | 6.1007e-20 | true | ok | NaN | first\_order |
| 14 | MadNLP | 1.315375e6 | 817 | 70752 | 14 | 2.7717e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 2.446541e6 | 1658 | 897968 | 128 | 2.7717e+00 | true | ok | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 161104.5 | 329 | 776864 | 9 | 2.9531e-20 | true | ok | NaN | Success |
| 14 | CaNNOLeS | 192646.0 | 206 | 96352 | 9 | 0.0000e+00 | true | ok | NaN | first\_order |
| 18 | SecondOrderOptimization (Dogleg) | 56625.0 | 250 | 94864 | 9 | 2.4556e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM) | 55604.5 | 246 | 94432 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM, tall) | 206541.5 | 110 | 129200 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | LeastSquaresOptim (Dogleg) | 248854.0 | 286 | 625680 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 18 | LeastSquaresOptim (LM) | 479750.0 | 462 | 1087360 | 18 | 5.6493e-26 | true | ok | NaN | converged |
| 18 | Optim (NewtonTrustRegion) | 411354.0 | 543 | 283136 | 10 | 5.6406e-24 | true | ok | NaN | converged |
| 18 | Optim (Newton) | 121854.0 | 208 | 44352 | 9 | 2.4556e-23 | true | ok | NaN | converged |
| 18 | JSOSolvers (trunk) | 702270.5 | 217 | 20480 | 12 | 1.4858e-18 | true | ok | NaN | first\_order |
| 18 | JSOSolvers (tron) | 1.631375e6 | 522 | 37936 | 10 | 2.2992e-17 | false | not_converged | NaN | small\_residual |
| 18 | Ipopt | 4.471729e6 | 989 | 136304 | 13 | 1.8346e-18 | true | ok | NaN | first\_order |
| 18 | MadNLP | 1.6793545e6 | 835 | 81600 | 14 | 2.8014e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 18 | NonlinearSolve (LM) | 4.3402915e6 | 1914 | 1554048 | 128 | 2.8014e+00 | true | ok | NaN | StalledSuccess |
| 18 | NonlinearSolve (TrustRegion) | 380042.0 | 195 | 117296 | 12 | 2.5221e-17 | true | ok | NaN | Success |
| 18 | CaNNOLeS | 299417.0 | 212 | 155440 | 9 | 2.4556e-23 | true | ok | NaN | first\_order |
| 22 | SecondOrderOptimization (Dogleg) | 79000.0 | 252 | 118816 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM) | 82792.0 | 248 | 118320 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM, tall) | 353583.5 | 118 | 203088 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | LeastSquaresOptim (Dogleg) | 463771.0 | 299 | 669216 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | LeastSquaresOptim (LM) | 873041.5 | 479 | 1144128 | 18 | 2.3716e-25 | true | ok | NaN | converged |
| 22 | Optim (NewtonTrustRegion) | 877833.0 | 791 | 533856 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | Optim (Newton) | 233812.5 | 218 | 58656 | 9 | 4.1424e-22 | true | ok | NaN | converged |
| 22 | JSOSolvers (trunk) | 1.243625e6 | 490 | 43248 | 11 | 3.3980e-17 | false | not_converged | NaN | not\_desc |
| 22 | JSOSolvers (tron) | 1.589771e6 | 382 | 35600 | 10 | 2.8812e-18 | true | ok | NaN | first\_order |
| 22 | Ipopt | 6.5286255e6 | 1039 | 178800 | 13 | 1.0568e-28 | true | ok | NaN | first\_order |
| 22 | MadNLP | 3.045042e6 | 801 | 93968 | 15 | 2.8186e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 22 | NonlinearSolve (LM) | 8.238063e6 | 2239 | 2226368 | 129 | 2.8186e+00 | true | ok | NaN | StalledSuccess |
| 22 | NonlinearSolve (TrustRegion) | 718916.5 | 211 | 179792 | 12 | 2.4364e-17 | true | ok | NaN | Success |
| 22 | CaNNOLeS | 435813.0 | 235 | 204688 | 9 | 4.1423e-22 | true | ok | NaN | first\_order |
| 26 | SecondOrderOptimization (Dogleg) | 118416.5 | 261 | 165056 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM) | 120333.5 | 257 | 164496 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 640333.5 | 118 | 323440 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | LeastSquaresOptim (Dogleg) | 829250.0 | 326 | 786016 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 26 | LeastSquaresOptim (LM) | 1.510729e6 | 479 | 1209248 | 18 | 7.4077e-25 | true | ok | NaN | converged |
| 26 | Optim (NewtonTrustRegion) | 1.2003125e6 | 804 | 730624 | 13 | 1.0484e-22 | true | ok | NaN | converged |
| 26 | Optim (Newton) | 359583.5 | 237 | 72480 | 10 | 1.2434e-30 | true | ok | NaN | converged |
| 26 | JSOSolvers (trunk) | 1.6575415e6 | 240 | 31696 | 12 | 2.9603e-19 | true | ok | NaN | first\_order |
| 26 | JSOSolvers (tron) | 2.382917e6 | 394 | 43936 | 11 | 2.0456e-20 | true | ok | NaN | first\_order |
| 26 | Ipopt | 7.782563e6 | 1044 | 258320 | 12 | 3.3964e-17 | true | ok | NaN | first\_order |
| 26 | MadNLP | 4.0392705e6 | 822 | 108784 | 16 | 2.8298e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 26 | NonlinearSolve (LM) | 1.30253335e7 | 2239 | 3056896 | 129 | 2.8298e+00 | true | ok | NaN | StalledSuccess |
| 26 | NonlinearSolve (TrustRegion) | 1.4062295e6 | 219 | 257856 | 11 | 1.6988e-19 | true | ok | NaN | Success |
| 26 | CaNNOLeS | 665313.0 | 245 | 320368 | 10 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32 | SecondOrderOptimization (Dogleg) | 166708.5 | 261 | 225408 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 173396.0 | 257 | 224752 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 1.179562e6 | 118 | 556720 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 1.6441875e6 | 326 | 909104 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 3.1519995e6 | 479 | 1355072 | 18 | 3.9810e-22 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 2.1905835e6 | 868 | 1059056 | 14 | 1.3363e-29 | true | ok | NaN | converged |
| 32 | Optim (Newton) | 698916.5 | 237 | 106176 | 10 | 4.5840e-19 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 2.908167e6 | 507 | 63296 | 12 | 1.6641e-18 | false | not_converged | NaN | not\_desc |
| 32 | JSOSolvers (tron) | 3.787208e6 | 392 | 59040 | 11 | 1.9552e-18 | false | not_converged | NaN | small\_residual |
| 32 | Ipopt | 1.142175e7 | 950 | 304896 | 11 | 6.1082e-32 | true | ok | NaN | first\_order |
| 32 | MadNLP | 5.7730835e6 | 907 | 141456 | 12 | 9.0856e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 2.0373667e7 | 2226 | 4501776 | 128 | 2.8407e+00 | true | ok | NaN | StalledSuccess |
| 32 | NonlinearSolve (TrustRegion) | 3.305833e6 | 219 | 436736 | 15 | 6.5356e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 1.0768545e6 | 250 | 445760 | 10 | 4.5840e-19 | true | ok | NaN | first\_order |
