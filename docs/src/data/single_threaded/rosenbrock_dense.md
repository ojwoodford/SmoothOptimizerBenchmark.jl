# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T03:37:28
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel | 55.215158924205376 | 1 | 16 | 215.58695652173913 | 1 | 32 |
| 2 | Standalone | 52.87356321839081 | 1 | 16 | 509.61538461538464 | 7 | 528 |
| 2 | NLPModels (MathOptNLSModel) | 1074.578947368421 | 5 | 80 | 2233.4 | 9 | 224 |
| 3 | NLLSModel | 55.3405572755418 | 1 | 16 | 240.2 | 1 | 32 |
| 3 | Standalone | 57.251948051948055 | 1 | 16 | 631.9333333333333 | 7 | 592 |
| 3 | NLPModels (MathOptNLSModel) | 1155.111111111111 | 5 | 80 | 2361.1111111111113 | 9 | 224 |
| 4 | NLLSModel | 60.870619946091644 | 1 | 16 | 291.6666666666667 | 1 | 32 |
| 4 | Standalone | 63.22911051212938 | 1 | 16 | 706.68 | 7 | 688 |
| 4 | NLPModels (MathOptNLSModel) | 1383.3333333333333 | 5 | 80 | 3047.5714285714284 | 9 | 224 |
| 5 | NLLSModel | 61.37321937321937 | 1 | 16 | 377.35849056603774 | 1 | 32 |
| 5 | Standalone | 66.12389380530973 | 1 | 16 | 805.5555555555555 | 7 | 784 |
| 5 | NLPModels (MathOptNLSModel) | 1697.9166666666667 | 5 | 80 | 3757.0 | 9 | 224 |
| 6 | NLLSModel | 65.02064896755162 | 1 | 16 | 499.10869565217394 | 1 | 32 |
| 6 | Standalone | 68.12033195020747 | 1 | 16 | 893.1304347826087 | 7 | 944 |
| 6 | NLPModels (MathOptNLSModel) | 2108.3 | 5 | 80 | 5075.0 | 9 | 224 |
| 8 | NLLSModel | 78.33707865168539 | 1 | 16 | 659.9354838709677 | 1 | 32 |
| 8 | Standalone | 94.27338129496403 | 1 | 16 | 1327.8 | 7 | 1296 |
| 8 | NLPModels (MathOptNLSModel) | 3256.0 | 5 | 80 | 8209.0 | 9 | 224 |
| 10 | NLLSModel | 90.21610169491525 | 1 | 16 | 958.3636363636364 | 1 | 32 |
| 10 | Standalone | 81.668 | 1 | 16 | 2231.5555555555557 | 7 | 1808 |
| 10 | NLPModels (MathOptNLSModel) | 4633.4 | 5 | 80 | 13542.0 | 9 | 224 |
| 14 | NLLSModel | 140.80689655172415 | 1 | 16 | 1657.076923076923 | 1 | 32 |
| 14 | Standalone | 102.83251231527093 | 1 | 16 | 4141.8 | 8 | 1808 |
| 14 | NLPModels (MathOptNLSModel) | 9305.333333333334 | 5 | 80 | 39792.0 | 9 | 224 |
| 18 | NLLSModel | 271.3 | 1 | 16 | 2734.375 | 1 | 32 |
| 18 | Standalone | 121.09375 | 1 | 16 | 8750.0 | 8 | 2624 |
| 18 | NLPModels (MathOptNLSModel) | 15875.0 | 5 | 80 | 66875.0 | 9 | 224 |
| 22 | NLLSModel | 339.95238095238096 | 1 | 16 | 4062.5 | 1 | 32 |
| 22 | Standalone | 140.26717557251908 | 1 | 16 | 18334.0 | 9 | 3552 |
| 22 | NLPModels (MathOptNLSModel) | 23750.0 | 5 | 80 | 136250.0 | 9 | 224 |
| 26 | NLLSModel | 461.1818181818182 | 1 | 16 | 5468.75 | 1 | 32 |
| 26 | Standalone | 173.89256198347107 | 1 | 16 | 26541.0 | 9 | 4240 |
| 26 | NLPModels (MathOptNLSModel) | 33000.0 | 5 | 80 | 191958.0 | 9 | 224 |
| 32 | NLLSModel | 677.4193548387096 | 1 | 16 | 8166.666666666667 | 1 | 32 |
| 32 | Standalone | 227.1505376344086 | 1 | 16 | 53750.0 | 9 | 6624 |
| 32 | NLPModels (MathOptNLSModel) | 51791.0 | 5 | 80 | 409083.0 | 9 | 224 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 7208.0 | 146 | 7216 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM) | 7042.0 | 142 | 7040 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM, tall) | 8604.5 | 108 | 7520 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | LeastSquaresOptim (Dogleg) | 18791.5 | 193 | 359168 | 7 | 0.0000e+00 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 17854.0 | 189 | 359040 | 7 | 1.5248e-24 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 17688.0 | 237 | 15504 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 16041.5 | 145 | 7168 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 15542.0 | 113 | 5440 | 7 | 5.5901e-28 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 25416.5 | 199 | 10032 | 6 | 6.1357e-20 | true | ok | NaN | first\_order |
| 2 | Ipopt | 817271.0 | 688 | 30944 | 7 | 1.5884e-26 | true | ok | NaN | first\_order |
| 2 | MadNLP | 298688.0 | 631 | 50080 | 6 | 1.8806e-20 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 42229.0 | 343 | 23168 | 13 | 1.6316e-22 | true | ok | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 21958.5 | 205 | 360272 | 7 | 1.5811e-23 | true | ok | NaN | Success |
| 2 | CaNNOLeS | 15083.0 | 182 | 9760 | 6 | 7.7016e-25 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 8500.0 | 146 | 7936 | 7 | 7.5249e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM) | 8250.0 | 142 | 7760 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 11667.0 | 108 | 8640 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | LeastSquaresOptim (Dogleg) | 27645.5 | 217 | 413344 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 29458.5 | 237 | 464736 | 9 | 5.6818e-30 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 32625.5 | 321 | 24304 | 7 | 9.2456e-22 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 19334.0 | 162 | 8880 | 7 | 7.5249e-20 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 21375.0 | 120 | 5968 | 7 | 1.8161e-20 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 68667.0 | 211 | 10832 | 7 | 2.7095e-17 | false | not_converged | NaN | small\_residual |
| 3 | Ipopt | 902937.5 | 662 | 30720 | 7 | 8.0760e-18 | true | ok | NaN | first\_order |
| 3 | MadNLP | 398083.5 | 745 | 52544 | 8 | 4.4409e-16 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 51958.5 | 367 | 29072 | 15 | 8.5268e-23 | true | ok | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 25187.5 | 205 | 363872 | 7 | 7.5075e-19 | true | ok | NaN | Success |
| 3 | CaNNOLeS | 18937.5 | 185 | 12256 | 7 | 7.5249e-20 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 9437.5 | 146 | 9312 | 7 | 1.3440e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM) | 9375.0 | 142 | 9104 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 13770.5 | 108 | 10384 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | LeastSquaresOptim (Dogleg) | 28958.5 | 217 | 417472 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 32583.0 | 237 | 469376 | 9 | 4.8047e-28 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 42395.5 | 354 | 34240 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 20042.0 | 162 | 10288 | 7 | 1.3440e-21 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 155375.0 | 402 | 25920 | 7 | 1.2381e-17 | false | not_converged | NaN | not\_desc |
| 4 | JSOSolvers (tron) | 54291.5 | 245 | 12976 | 8 | 1.7694e-23 | true | ok | NaN | first\_order |
| 4 | Ipopt | 1.385812e6 | 980 | 47328 | 13 | 3.2978e-29 | true | ok | NaN | first\_order |
| 4 | MadNLP | 429604.0 | 748 | 53568 | 9 | 1.0519e-25 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 69729.0 | 400 | 40192 | 18 | 3.9178e-20 | true | ok | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 31062.5 | 231 | 421792 | 8 | 1.4513e-30 | true | ok | NaN | Success |
| 4 | CaNNOLeS | 23646.0 | 186 | 15888 | 7 | 1.3440e-21 | true | ok | NaN | first\_order |
| 5 | SecondOrderOptimization (Dogleg) | 12875.0 | 146 | 10512 | 9 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM) | 14917.0 | 142 | 10304 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 26500.0 | 108 | 12336 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | LeastSquaresOptim (Dogleg) | 37041.5 | 257 | 474240 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 38125.5 | 237 | 473856 | 9 | 1.0157e-25 | true | ok | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 52125.0 | 354 | 41008 | 8 | 2.7179e-28 | true | ok | NaN | converged |
| 5 | Optim (Newton) | 24916.5 | 183 | 13072 | 8 | 1.5683e-25 | true | ok | NaN | converged |
| 5 | JSOSolvers (trunk) | 50500.0 | 156 | 8256 | 9 | 1.3340e-23 | true | ok | NaN | first\_order |
| 5 | JSOSolvers (tron) | 112542.0 | 265 | 14160 | 10 | 7.2034e-18 | false | not_converged | NaN | small\_residual |
| 5 | Ipopt | 1.2809585e6 | 930 | 48032 | 10 | 2.1001e-28 | true | ok | NaN | first\_order |
| 5 | MadNLP | 441083.5 | 739 | 54288 | 9 | 3.7426e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 92229.0 | 424 | 52064 | 20 | 2.2867e-21 | true | ok | NaN | Success |
| 5 | NonlinearSolve (TrustRegion) | 35521.0 | 231 | 428080 | 8 | 0.0000e+00 | true | ok | NaN | Success |
| 5 | CaNNOLeS | 32042.0 | 188 | 19360 | 8 | 3.1434e-27 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 14562.5 | 146 | 12480 | 9 | 7.3660e-31 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM) | 16833.0 | 142 | 12240 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 32187.0 | 108 | 15328 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | LeastSquaresOptim (Dogleg) | 43438.0 | 261 | 479056 | 14 | 0.0000e+00 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 42333.5 | 237 | 478464 | 9 | 6.5103e-28 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 62229.5 | 354 | 50912 | 8 | 3.2466e-25 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 27312.5 | 183 | 15728 | 8 | 4.1099e-19 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 64833.0 | 160 | 8912 | 9 | 2.1694e-26 | true | ok | NaN | first\_order |
| 6 | JSOSolvers (tron) | 111479.5 | 293 | 16128 | 10 | 1.0902e-17 | true | ok | NaN | first\_order |
| 6 | Ipopt | 1.4885415e6 | 988 | 53264 | 11 | 1.2990e-29 | true | ok | NaN | first\_order |
| 6 | MadNLP | 418291.5 | 700 | 54816 | 8 | 2.5072e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 122542.0 | 448 | 70112 | 22 | 5.1931e-23 | true | ok | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 421750.0 | 2179 | 5201296 | 36 | 2.5072e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 6 | CaNNOLeS | 41542.0 | 188 | 23824 | 8 | 7.3115e-25 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 16438.0 | 146 | 16480 | 8 | 2.0175e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM) | 16292.0 | 142 | 16208 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 35437.5 | 112 | 23504 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | LeastSquaresOptim (Dogleg) | 56917.0 | 251 | 489440 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 59458.0 | 247 | 489696 | 9 | 1.0826e-24 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 97208.5 | 396 | 80352 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 31562.5 | 179 | 21248 | 8 | 2.0175e-24 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 107750.0 | 177 | 10768 | 10 | 4.0468e-18 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 189750.0 | 329 | 19152 | 10 | 4.0071e-21 | true | ok | NaN | first\_order |
| 8 | Ipopt | 2.0023545e6 | 1041 | 65040 | 14 | 1.2446e-19 | true | ok | NaN | first\_order |
| 8 | MadNLP | 489770.5 | 730 | 58080 | 9 | 2.6457e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 218354.0 | 551 | 129392 | 31 | 4.1941e-17 | true | ok | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 56770.5 | 248 | 460208 | 8 | 1.0369e-23 | true | ok | NaN | Success |
| 8 | CaNNOLeS | 58541.5 | 190 | 37040 | 8 | 2.0175e-24 | true | ok | NaN | first\_order |
| 10 | SecondOrderOptimization (Dogleg) | 20229.5 | 146 | 22448 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM) | 19937.5 | 142 | 22144 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 50062.0 | 112 | 34720 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | LeastSquaresOptim (Dogleg) | 78792.0 | 251 | 502608 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 130041.5 | 379 | 827344 | 15 | 3.8422e-25 | true | ok | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 169979.0 | 543 | 149040 | 11 | 9.9092e-29 | true | ok | NaN | converged |
| 10 | Optim (Newton) | 42313.0 | 179 | 29984 | 8 | 1.1201e-22 | true | ok | NaN | converged |
| 10 | JSOSolvers (trunk) | 166604.5 | 182 | 12144 | 10 | 6.3729e-19 | true | ok | NaN | first\_order |
| 10 | JSOSolvers (tron) | 251812.5 | 315 | 19904 | 9 | 4.5011e-19 | true | ok | NaN | first\_order |
| 10 | Ipopt | 1.6844375e6 | 825 | 61552 | 10 | 2.7100e+00 | true | ok | NaN | first\_order |
| 10 | MadNLP | 616458.5 | 766 | 61648 | 9 | 2.7100e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 1.3290205e6 | 1676 | 581568 | 134 | 2.7100e+00 | true | ok | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 87021.0 | 248 | 494544 | 8 | 5.2878e-22 | true | ok | NaN | Success |
| 10 | CaNNOLeS | 92520.5 | 190 | 50432 | 8 | 1.1201e-22 | true | ok | NaN | first\_order |
| 14 | SecondOrderOptimization (Dogleg) | 37979.5 | 146 | 34992 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM) | 38979.0 | 142 | 34624 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM, tall) | 119063.0 | 113 | 67824 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | LeastSquaresOptim (Dogleg) | 138770.5 | 260 | 521040 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 286916.5 | 462 | 1020000 | 18 | 7.5856e-27 | true | ok | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 246417.0 | 457 | 166400 | 9 | 5.0883e-19 | true | ok | NaN | converged |
| 14 | Optim (Newton) | 75562.5 | 206 | 30112 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | JSOSolvers (trunk) | 540875.0 | 466 | 34576 | 11 | 8.5695e-18 | false | not_converged | NaN | not\_desc |
| 14 | JSOSolvers (tron) | 971500.0 | 520 | 33120 | 12 | 3.3083e-19 | true | ok | NaN | first\_order |
| 14 | Ipopt | 2.693667e6 | 935 | 101472 | 11 | 6.1007e-20 | true | ok | NaN | first\_order |
| 14 | MadNLP | 1.208333e6 | 817 | 70752 | 14 | 2.7717e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 2.4734995e6 | 1658 | 897968 | 128 | 2.7717e+00 | true | ok | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 162083.0 | 329 | 776864 | 9 | 2.9531e-20 | true | ok | NaN | Success |
| 14 | CaNNOLeS | 181521.0 | 206 | 96352 | 9 | 0.0000e+00 | true | ok | NaN | first\_order |
| 18 | SecondOrderOptimization (Dogleg) | 54646.5 | 164 | 71232 | 9 | 2.4556e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM) | 52541.0 | 160 | 70800 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM, tall) | 211250.0 | 117 | 129712 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | LeastSquaresOptim (Dogleg) | 263125.0 | 286 | 625680 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 18 | LeastSquaresOptim (LM) | 498959.0 | 462 | 1087360 | 18 | 5.6493e-26 | true | ok | NaN | converged |
| 18 | Optim (NewtonTrustRegion) | 432333.0 | 543 | 283136 | 10 | 5.6406e-24 | true | ok | NaN | converged |
| 18 | Optim (Newton) | 128500.0 | 208 | 44352 | 9 | 2.4556e-23 | true | ok | NaN | converged |
| 18 | JSOSolvers (trunk) | 721917.0 | 217 | 20480 | 12 | 1.4858e-18 | true | ok | NaN | first\_order |
| 18 | JSOSolvers (tron) | 1.694208e6 | 522 | 37936 | 10 | 2.2992e-17 | false | not_converged | NaN | small\_residual |
| 18 | Ipopt | 4.5370205e6 | 989 | 136304 | 13 | 1.8346e-18 | true | ok | NaN | first\_order |
| 18 | MadNLP | 1.6702915e6 | 835 | 81600 | 14 | 2.8014e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 18 | NonlinearSolve (LM) | 4.4963545e6 | 1914 | 1554048 | 128 | 2.8014e+00 | true | ok | NaN | StalledSuccess |
| 18 | NonlinearSolve (TrustRegion) | 370521.0 | 195 | 117296 | 12 | 2.5221e-17 | true | ok | NaN | Success |
| 18 | CaNNOLeS | 311312.5 | 212 | 155440 | 9 | 2.4556e-23 | true | ok | NaN | first\_order |
| 22 | SecondOrderOptimization (Dogleg) | 80875.0 | 166 | 92736 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM) | 79375.0 | 162 | 92240 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM, tall) | 382604.0 | 125 | 203632 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | LeastSquaresOptim (Dogleg) | 490562.0 | 299 | 669216 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | LeastSquaresOptim (LM) | 933917.0 | 479 | 1144128 | 18 | 2.3716e-25 | true | ok | NaN | converged |
| 22 | Optim (NewtonTrustRegion) | 894563.0 | 791 | 533856 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | Optim (Newton) | 229979.0 | 218 | 58656 | 9 | 4.1424e-22 | true | ok | NaN | converged |
| 22 | JSOSolvers (trunk) | 1.286583e6 | 490 | 43248 | 11 | 3.3980e-17 | false | not_converged | NaN | not\_desc |
| 22 | JSOSolvers (tron) | 1.621375e6 | 382 | 35600 | 10 | 2.8812e-18 | true | ok | NaN | first\_order |
| 22 | Ipopt | 6.4437505e6 | 1039 | 178800 | 13 | 1.0568e-28 | true | ok | NaN | first\_order |
| 22 | MadNLP | 2.8789995e6 | 801 | 93968 | 15 | 2.8186e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 22 | NonlinearSolve (LM) | 8.664354e6 | 2239 | 2226368 | 129 | 2.8186e+00 | true | ok | NaN | StalledSuccess |
| 22 | NonlinearSolve (TrustRegion) | 735875.0 | 211 | 179792 | 12 | 2.4364e-17 | true | ok | NaN | Success |
| 22 | CaNNOLeS | 447812.0 | 235 | 204688 | 9 | 4.1423e-22 | true | ok | NaN | first\_order |
| 26 | SecondOrderOptimization (Dogleg) | 111833.5 | 166 | 133744 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM) | 114374.5 | 162 | 133184 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 654896.0 | 125 | 324016 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | LeastSquaresOptim (Dogleg) | 826750.5 | 326 | 786016 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 26 | LeastSquaresOptim (LM) | 1.4873335e6 | 479 | 1209248 | 18 | 7.4077e-25 | true | ok | NaN | converged |
| 26 | Optim (NewtonTrustRegion) | 1.210812e6 | 804 | 730624 | 13 | 1.0484e-22 | true | ok | NaN | converged |
| 26 | Optim (Newton) | 355875.0 | 237 | 72480 | 10 | 1.2434e-30 | true | ok | NaN | converged |
| 26 | JSOSolvers (trunk) | 1.6594375e6 | 240 | 31696 | 12 | 2.9603e-19 | true | ok | NaN | first\_order |
| 26 | JSOSolvers (tron) | 2.3749585e6 | 394 | 43936 | 11 | 2.0456e-20 | true | ok | NaN | first\_order |
| 26 | Ipopt | 8.3127085e6 | 1044 | 258320 | 12 | 3.3964e-17 | true | ok | NaN | first\_order |
| 26 | MadNLP | 4.2275205e6 | 822 | 108784 | 16 | 2.8298e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 26 | NonlinearSolve (LM) | 1.2961313e7 | 2239 | 3056896 | 129 | 2.8298e+00 | true | ok | NaN | StalledSuccess |
| 26 | NonlinearSolve (TrustRegion) | 1.481625e6 | 219 | 257856 | 11 | 1.6988e-19 | true | ok | NaN | Success |
| 26 | CaNNOLeS | 707000.0 | 245 | 320368 | 10 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32 | SecondOrderOptimization (Dogleg) | 180000.5 | 166 | 178720 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 181875.0 | 162 | 178064 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 1.242042e6 | 125 | 557328 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 1.687542e6 | 326 | 909104 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 3.107896e6 | 479 | 1355072 | 18 | 3.9810e-22 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 2.1493755e6 | 868 | 1059056 | 14 | 1.3363e-29 | true | ok | NaN | converged |
| 32 | Optim (Newton) | 678124.5 | 237 | 106176 | 10 | 4.5840e-19 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 2.725333e6 | 507 | 63296 | 12 | 1.6641e-18 | false | not_converged | NaN | not\_desc |
| 32 | JSOSolvers (tron) | 3.499458e6 | 392 | 59040 | 11 | 1.9552e-18 | false | not_converged | NaN | small\_residual |
| 32 | Ipopt | 1.2075937e7 | 950 | 304896 | 11 | 6.1082e-32 | true | ok | NaN | first\_order |
| 32 | MadNLP | 5.7226045e6 | 907 | 141456 | 12 | 9.0856e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 2.0666125e7 | 2226 | 4501776 | 128 | 2.8407e+00 | true | ok | NaN | StalledSuccess |
| 32 | NonlinearSolve (TrustRegion) | 3.187292e6 | 219 | 436736 | 15 | 6.5356e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 1.032542e6 | 250 | 445760 | 10 | 4.5840e-19 | true | ok | NaN | first\_order |
