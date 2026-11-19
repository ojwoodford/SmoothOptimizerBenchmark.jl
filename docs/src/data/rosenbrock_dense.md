# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T01:28:16
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
| 2 | NLLSModel | 55.080495356037154 | 1 | 16 | 190.75903614457832 | 1 | 32 |
| 2 | Standalone | 67.03010033444816 | 1 | 16 | 199.4949494949495 | 1 | 32 |
| 2 | NLPModels (MathOptNLSModel) | 1052.6315789473683 | 5 | 80 | 2154.1 | 9 | 224 |
| 3 | NLLSModel | 56.384415584415585 | 1 | 16 | 240.18823529411765 | 1 | 32 |
| 3 | Standalone | 70.65217391304348 | 1 | 16 | 277.19444444444446 | 1 | 32 |
| 3 | NLPModels (MathOptNLSModel) | 1183.3333333333333 | 5 | 80 | 2254.5555555555557 | 9 | 224 |
| 4 | NLLSModel | 61.47012987012987 | 1 | 16 | 285.44776119402985 | 1 | 32 |
| 4 | Standalone | 81.0034965034965 | 1 | 16 | 307.296875 | 1 | 32 |
| 4 | NLPModels (MathOptNLSModel) | 1463.8666666666666 | 5 | 80 | 2875.0 | 9 | 224 |
| 5 | NLLSModel | 60.66096866096866 | 1 | 16 | 375.75 | 1 | 32 |
| 5 | Standalone | 83.02247191011236 | 1 | 16 | 380.4074074074074 | 1 | 32 |
| 5 | NLPModels (MathOptNLSModel) | 1697.9166666666667 | 5 | 80 | 3673.6666666666665 | 9 | 224 |
| 6 | NLLSModel | 65.38938053097345 | 1 | 16 | 445.72093023255815 | 1 | 32 |
| 6 | Standalone | 85.7551867219917 | 1 | 16 | 452.0 | 1 | 32 |
| 6 | NLPModels (MathOptNLSModel) | 2170.8 | 5 | 80 | 4958.25 | 9 | 224 |
| 8 | NLLSModel | 103.7158273381295 | 1 | 16 | 691.0689655172414 | 1 | 32 |
| 8 | Standalone | 97.41666666666667 | 1 | 16 | 642.1764705882352 | 1 | 32 |
| 8 | NLPModels (MathOptNLSModel) | 3138.8333333333335 | 5 | 80 | 7708.333333333333 | 9 | 224 |
| 10 | NLLSModel | 118.56363636363636 | 1 | 16 | 956.3333333333334 | 1 | 32 |
| 10 | Standalone | 116.84126984126983 | 1 | 16 | 972.9 | 1 | 32 |
| 10 | NLPModels (MathOptNLSModel) | 4716.8 | 5 | 80 | 13875.0 | 9 | 224 |
| 14 | NLLSModel | 173.07692307692307 | 1 | 16 | 1670.4545454545455 | 1 | 32 |
| 14 | Standalone | 159.35114503816794 | 1 | 16 | 2273.222222222222 | 1 | 32 |
| 14 | NLPModels (MathOptNLSModel) | 9333.0 | 5 | 80 | 40125.0 | 9 | 224 |
| 18 | NLLSModel | 281.7625 | 1 | 16 | 2635.5 | 1 | 32 |
| 18 | Standalone | 220.47916666666666 | 1 | 16 | 4258.4 | 1 | 32 |
| 18 | NLPModels (MathOptNLSModel) | 15459.0 | 5 | 80 | 65959.0 | 9 | 224 |
| 22 | NLLSModel | 369.33898305084745 | 1 | 16 | 3958.3333333333335 | 1 | 32 |
| 22 | Standalone | 296.7121212121212 | 1 | 16 | 8528.0 | 1 | 32 |
| 22 | NLPModels (MathOptNLSModel) | 22166.0 | 5 | 80 | 139791.0 | 9 | 224 |
| 26 | NLLSModel | 436.71153846153845 | 1 | 16 | 5395.75 | 1 | 32 |
| 26 | Standalone | 378.8703703703704 | 1 | 16 | 14042.0 | 1 | 32 |
| 26 | NLPModels (MathOptNLSModel) | 30833.0 | 5 | 80 | 194958.0 | 9 | 224 |
| 32 | NLLSModel | 969.3396226415094 | 1 | 16 | 9361.0 | 1 | 32 |
| 32 | Standalone | 552.0833333333334 | 1 | 16 | 24834.0 | 1 | 32 |
| 32 | NLPModels (MathOptNLSModel) | 47708.0 | 5 | 80 | 383000.0 | 9 | 224 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 7646.0 | 142 | 7200 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM) | 7167.0 | 138 | 7024 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (Gauss-Newton) | 6708.0 | 131 | 6640 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM, tall) | 8833.0 | 101 | 7264 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | LeastSquaresOptim (Dogleg) | 10979.0 | 151 | 355824 | 7 | 0.0000e+00 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 15562.5 | 147 | 355680 | 7 | 1.5248e-24 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 15792.0 | 202 | 12928 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 13416.0 | 116 | 5072 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 15313.0 | 113 | 5440 | 7 | 5.5744e-28 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 25145.5 | 199 | 10032 | 6 | 6.1357e-20 | true | ok | NaN | first\_order |
| 2 | Ipopt | 800521.0 | 696 | 31488 | 7 | 3.4139e-26 | true | ok | NaN | first\_order |
| 2 | MadNLP | 299479.5 | 631 | 50080 | 6 | 3.2671e-20 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 38354.5 | 283 | 21248 | 13 | 1.6316e-22 | true | ok | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 18167.0 | 163 | 357040 | 7 | 1.5811e-23 | true | ok | NaN | Success |
| 2 | CaNNOLeS | 14667.0 | 182 | 9760 | 6 | 7.7016e-25 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 8542.0 | 142 | 7920 | 7 | 7.5249e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM) | 8125.0 | 138 | 7744 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (Gauss-Newton) | 7792.0 | 131 | 7296 | 7 | 7.5249e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 12021.0 | 101 | 8384 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | LeastSquaresOptim (Dogleg) | 21312.5 | 169 | 408960 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 24188.0 | 183 | 459776 | 9 | 5.6818e-30 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 29604.5 | 281 | 20464 | 7 | 9.2456e-22 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 16625.5 | 129 | 5600 | 7 | 7.5249e-20 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 21959.0 | 120 | 5968 | 7 | 1.8161e-20 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 71958.0 | 211 | 10832 | 7 | 2.7095e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 3 | Ipopt | 901041.5 | 670 | 31424 | 7 | 5.5049e-17 | true | ok | NaN | first\_order |
| 3 | MadNLP | 416375.0 | 745 | 52544 | 8 | 1.0872e-29 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 50812.5 | 301 | 24848 | 15 | 8.5268e-23 | true | ok | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 21645.5 | 163 | 360112 | 7 | 7.5075e-19 | true | ok | NaN | Success |
| 3 | CaNNOLeS | 19583.0 | 185 | 12256 | 7 | 7.5249e-20 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 9979.5 | 142 | 9312 | 7 | 1.3440e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM) | 9395.5 | 138 | 9104 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Gauss-Newton) | 8937.5 | 131 | 8512 | 7 | 1.3440e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 15479.5 | 101 | 10096 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | LeastSquaresOptim (Dogleg) | 28291.5 | 169 | 412256 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 28603.5 | 183 | 463488 | 9 | 4.8047e-28 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 42375.0 | 309 | 28624 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 17458.0 | 129 | 5856 | 7 | 1.3440e-21 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 167666.0 | 402 | 25920 | 7 | 1.2381e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 4 | JSOSolvers (tron) | 57750.0 | 245 | 12976 | 8 | 1.7694e-23 | true | ok | NaN | first\_order |
| 4 | Ipopt | 1.4393335e6 | 988 | 48240 | 13 | 2.9819e-28 | true | ok | NaN | first\_order |
| 4 | MadNLP | 455896.0 | 748 | 53568 | 9 | 1.7860e-25 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 68395.5 | 328 | 32736 | 18 | 3.9178e-20 | true | ok | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 28500.5 | 183 | 416592 | 8 | 1.4513e-30 | true | ok | NaN | Success |
| 4 | CaNNOLeS | 25854.0 | 186 | 15888 | 7 | 1.3440e-21 | true | ok | NaN | first\_order |
| 5 | SecondOrderOptimization (Dogleg) | 13812.5 | 142 | 10528 | 9 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM) | 16208.5 | 138 | 10320 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (Gauss-Newton) | 10813.0 | 133 | 9696 | 8 | 3.1361e-27 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 28791.0 | 101 | 12048 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | LeastSquaresOptim (Dogleg) | 34458.5 | 203 | 467440 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 24437.5 | 183 | 467024 | 9 | 1.0157e-25 | true | ok | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 50312.0 | 309 | 33808 | 8 | 2.7179e-28 | true | ok | NaN | converged |
| 5 | Optim (Newton) | 22208.0 | 147 | 6592 | 8 | 1.5683e-25 | true | ok | NaN | converged |
| 5 | JSOSolvers (trunk) | 52729.0 | 156 | 8256 | 9 | 1.3340e-23 | true | ok | NaN | first\_order |
| 5 | JSOSolvers (tron) | 122958.0 | 265 | 14160 | 10 | 7.2034e-18 | false | not_converged | NaN | small\_residual; cost test passes |
| 5 | Ipopt | 1.281458e6 | 938 | 49152 | 10 | 5.6266e-28 | true | ok | NaN | first\_order |
| 5 | MadNLP | 439167.0 | 739 | 54288 | 9 | 7.2474e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 85542.0 | 346 | 40672 | 20 | 2.2867e-21 | true | ok | NaN | Success |
| 5 | NonlinearSolve (TrustRegion) | 27229.5 | 183 | 421936 | 8 | 0.0000e+00 | true | ok | NaN | Success |
| 5 | CaNNOLeS | 31770.5 | 188 | 19360 | 8 | 3.1453e-27 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 14292.0 | 142 | 12512 | 9 | 7.3660e-31 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM) | 16395.5 | 138 | 12272 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (Gauss-Newton) | 11479.0 | 133 | 11424 | 8 | 7.3121e-25 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 32604.0 | 101 | 15008 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | LeastSquaresOptim (Dogleg) | 34166.5 | 207 | 470688 | 14 | 0.0000e+00 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 28312.0 | 183 | 470112 | 9 | 6.5103e-28 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 55291.5 | 309 | 41408 | 8 | 3.2466e-25 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 21854.0 | 147 | 6944 | 8 | 4.1099e-19 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 63708.0 | 160 | 8912 | 9 | 2.1691e-26 | true | ok | NaN | first\_order |
| 6 | JSOSolvers (tron) | 108666.5 | 293 | 16128 | 10 | 1.0902e-17 | true | ok | NaN | first\_order |
| 6 | Ipopt | 1.3583125e6 | 996 | 54624 | 11 | 6.3223e-29 | true | ok | NaN | first\_order |
| 6 | MadNLP | 400458.5 | 700 | 54816 | 8 | 2.5072e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.507159e+00, above the reference 0.000000e+00; predicted reduction / cost 1.90e-18 |
| 6 | NonlinearSolve (LM) | 110124.5 | 364 | 53040 | 22 | 5.1931e-23 | true | ok | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 303625.0 | 1963 | 5168144 | 36 | 2.5072e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 6 | CaNNOLeS | 39479.0 | 188 | 23824 | 8 | 7.3114e-25 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 16479.0 | 142 | 16528 | 8 | 2.0175e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM) | 15834.0 | 138 | 16256 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (Gauss-Newton) | 15042.0 | 131 | 14864 | 8 | 2.0175e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 36125.0 | 105 | 23152 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | LeastSquaresOptim (Dogleg) | 37229.5 | 197 | 477664 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 36625.0 | 193 | 477952 | 9 | 1.0826e-24 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 85416.5 | 346 | 64192 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 23791.5 | 142 | 7344 | 8 | 2.0175e-24 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 112542.0 | 177 | 10768 | 10 | 4.0468e-18 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 196166.5 | 329 | 19152 | 10 | 4.0071e-21 | true | ok | NaN | first\_order |
| 8 | Ipopt | 1.9236875e6 | 1049 | 67168 | 14 | 1.9912e-19 | true | ok | NaN | first\_order |
| 8 | MadNLP | 482667.0 | 730 | 58080 | 9 | 2.6457e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.645709e+00, above the reference 0.000000e+00; predicted reduction / cost 1.08e-22 |
| 8 | NonlinearSolve (LM) | 200479.0 | 449 | 97856 | 31 | 4.1941e-17 | true | ok | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 38542.0 | 200 | 449344 | 8 | 1.0369e-23 | true | ok | NaN | Success |
| 8 | CaNNOLeS | 61041.5 | 190 | 37040 | 8 | 2.0175e-24 | true | ok | NaN | first\_order |
| 10 | SecondOrderOptimization (Dogleg) | 20437.5 | 142 | 22480 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM) | 20021.0 | 138 | 22176 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (Gauss-Newton) | 18958.0 | 131 | 20064 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 52041.5 | 105 | 34336 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | LeastSquaresOptim (Dogleg) | 51291.5 | 197 | 485952 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 91604.5 | 307 | 805328 | 15 | 3.8422e-25 | true | ok | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 153250.5 | 483 | 119280 | 11 | 9.9092e-29 | true | ok | NaN | converged |
| 10 | Optim (Newton) | 28750.0 | 142 | 8304 | 8 | 1.1201e-22 | true | ok | NaN | converged |
| 10 | JSOSolvers (trunk) | 166354.0 | 182 | 12144 | 10 | 6.3729e-19 | true | ok | NaN | first\_order |
| 10 | JSOSolvers (tron) | 249583.5 | 315 | 19904 | 9 | 4.5011e-19 | true | ok | NaN | first\_order |
| 10 | Ipopt | 1.6480835e6 | 833 | 64432 | 10 | 2.7100e+00 | false | local_minimum | NaN | first\_order; claimed convergence at cost 2.709964e+00, above the reference 0.000000e+00; predicted reduction / cost 1.10e-28 |
| 10 | MadNLP | 613583.5 | 766 | 61648 | 9 | 2.7100e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.709964e+00, above the reference 0.000000e+00; predicted reduction / cost 1.70e-19 |
| 10 | NonlinearSolve (LM) | 1.2212295e6 | 1376 | 474096 | 134 | 2.7100e+00 | false | local_minimum | NaN | StalledSuccess; claimed convergence at cost 2.709964e+00, above the reference 0.000000e+00; predicted reduction / cost 2.64e-16 |
| 10 | NonlinearSolve (TrustRegion) | 54833.5 | 200 | 479024 | 8 | 5.2878e-22 | true | ok | NaN | Success |
| 10 | CaNNOLeS | 90562.5 | 190 | 50432 | 8 | 1.1201e-22 | true | ok | NaN | first\_order |
| 14 | SecondOrderOptimization (Dogleg) | 36187.0 | 142 | 35072 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM) | 36771.0 | 138 | 34704 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (Gauss-Newton) | 33604.5 | 131 | 31088 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM, tall) | 116500.5 | 106 | 67376 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | LeastSquaresOptim (Dogleg) | 101333.0 | 197 | 504816 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 218541.5 | 364 | 994896 | 18 | 7.5856e-27 | true | ok | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 215666.5 | 397 | 146080 | 9 | 5.0883e-19 | true | ok | NaN | converged |
| 14 | Optim (Newton) | 50812.5 | 155 | 10512 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | JSOSolvers (trunk) | 513833.0 | 466 | 34576 | 11 | 8.5695e-18 | false | not_converged | NaN | not\_desc; cost test passes |
| 14 | JSOSolvers (tron) | 937521.0 | 520 | 33120 | 12 | 3.3083e-19 | true | ok | NaN | first\_order |
| 14 | Ipopt | 2.727833e6 | 943 | 106544 | 11 | 1.8808e-19 | true | ok | NaN | first\_order |
| 14 | MadNLP | 1.2585835e6 | 817 | 70752 | 14 | 2.7717e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.771745e+00, above the reference 0.000000e+00; predicted reduction / cost 7.79e-32 |
| 14 | NonlinearSolve (LM) | 2.302417e6 | 1322 | 805824 | 128 | 2.7717e+00 | false | local_minimum | NaN | StalledSuccess; claimed convergence at cost 2.771745e+00, above the reference 0.000000e+00; predicted reduction / cost 1.72e-27 |
| 14 | NonlinearSolve (TrustRegion) | 146687.5 | 266 | 760368 | 9 | 2.9531e-20 | true | ok | NaN | Success |
| 14 | CaNNOLeS | 178625.0 | 206 | 96352 | 9 | 0.0000e+00 | true | ok | NaN | first\_order |
| 18 | SecondOrderOptimization (Dogleg) | 56250.0 | 160 | 71344 | 9 | 2.4556e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM) | 55167.0 | 156 | 70912 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (Gauss-Newton) | 52083.5 | 147 | 64320 | 9 | 2.4556e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM, tall) | 211104.0 | 110 | 129200 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | LeastSquaresOptim (Dogleg) | 211895.5 | 216 | 599280 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 18 | LeastSquaresOptim (LM) | 420645.5 | 364 | 1050560 | 18 | 5.6493e-26 | true | ok | NaN | converged |
| 18 | Optim (NewtonTrustRegion) | 375271.0 | 477 | 248640 | 10 | 5.6406e-24 | true | ok | NaN | converged |
| 18 | Optim (Newton) | 81562.5 | 157 | 13712 | 9 | 2.4556e-23 | true | ok | NaN | converged |
| 18 | JSOSolvers (trunk) | 722083.5 | 217 | 20480 | 12 | 1.4858e-18 | true | ok | NaN | first\_order |
| 18 | JSOSolvers (tron) | 1.683833e6 | 522 | 37936 | 10 | 2.2992e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 18 | Ipopt | 4.4825835e6 | 997 | 144432 | 13 | 7.3447e-18 | true | ok | NaN | first\_order |
| 18 | MadNLP | 1.646125e6 | 835 | 81600 | 14 | 2.8014e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.801395e+00, above the reference 0.000000e+00; predicted reduction / cost 3.78e-29 |
| 18 | NonlinearSolve (LM) | 4.1712085e6 | 1578 | 1415312 | 128 | 2.8014e+00 | false | local_minimum | NaN | StalledSuccess; claimed convergence at cost 2.801395e+00, above the reference 0.000000e+00; predicted reduction / cost 8.69e-18 |
| 18 | NonlinearSolve (TrustRegion) | 333770.5 | 146 | 88160 | 12 | 2.5221e-17 | true | ok | NaN | Success |
| 18 | CaNNOLeS | 294208.0 | 212 | 155440 | 9 | 2.4556e-23 | true | ok | NaN | first\_order |
| 22 | SecondOrderOptimization (Dogleg) | 76771.0 | 162 | 92896 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM) | 76604.0 | 158 | 92400 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (Gauss-Newton) | 74395.5 | 149 | 83728 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM, tall) | 364604.0 | 118 | 203088 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | LeastSquaresOptim (Dogleg) | 387375.5 | 219 | 633184 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | LeastSquaresOptim (LM) | 781895.5 | 367 | 1093984 | 18 | 2.3716e-25 | true | ok | NaN | converged |
| 22 | Optim (NewtonTrustRegion) | 757791.5 | 693 | 473152 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | Optim (Newton) | 133834.0 | 157 | 16016 | 9 | 4.1424e-22 | true | ok | NaN | converged |
| 22 | JSOSolvers (trunk) | 1.277625e6 | 490 | 43248 | 11 | 3.3980e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 22 | JSOSolvers (tron) | 1.6304995e6 | 382 | 35600 | 10 | 2.8812e-18 | true | ok | NaN | first\_order |
| 22 | Ipopt | 6.3735205e6 | 1052 | 190992 | 13 | 5.8707e-28 | true | ok | NaN | first\_order |
| 22 | MadNLP | 2.8751245e6 | 801 | 93968 | 15 | 2.8186e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.818619e+00, above the reference 0.000000e+00; predicted reduction / cost 2.48e-21 |
| 22 | NonlinearSolve (LM) | 7.9679795e6 | 1855 | 2033632 | 129 | 2.8186e+00 | false | local_minimum | NaN | StalledSuccess; claimed convergence at cost 2.818619e+00, above the reference 0.000000e+00; predicted reduction / cost 3.10e-16 |
| 22 | NonlinearSolve (TrustRegion) | 666499.5 | 155 | 136816 | 12 | 2.4364e-17 | true | ok | NaN | Success |
| 22 | CaNNOLeS | 447958.5 | 235 | 204688 | 9 | 4.1423e-22 | true | ok | NaN | first\_order |
| 26 | SecondOrderOptimization (Dogleg) | 122333.0 | 162 | 133904 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM) | 114542.0 | 158 | 133344 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (Gauss-Newton) | 107687.5 | 149 | 120544 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 648271.0 | 118 | 323440 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | LeastSquaresOptim (Dogleg) | 712458.0 | 238 | 739248 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 26 | LeastSquaresOptim (LM) | 1.3120625e6 | 367 | 1149824 | 18 | 7.4077e-25 | true | ok | NaN | converged |
| 26 | Optim (NewtonTrustRegion) | 1.0242505e6 | 706 | 664096 | 13 | 1.0484e-22 | true | ok | NaN | converged |
| 26 | Optim (Newton) | 216812.5 | 170 | 21008 | 10 | 1.2434e-30 | true | ok | NaN | converged |
| 26 | JSOSolvers (trunk) | 1.6385415e6 | 240 | 31696 | 12 | 2.9603e-19 | true | ok | NaN | first\_order |
| 26 | JSOSolvers (tron) | 2.3425e6 | 394 | 43936 | 11 | 2.0456e-20 | true | ok | NaN | first\_order |
| 26 | Ipopt | 8.0504165e6 | 1057 | 274096 | 12 | 1.0231e-16 | true | ok | NaN | first\_order |
| 26 | MadNLP | 4.109708e6 | 822 | 108784 | 16 | 2.8298e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.829800e+00, above the reference 0.000000e+00; predicted reduction / cost 9.89e-22 |
| 26 | NonlinearSolve (LM) | 1.24415625e7 | 1855 | 2840592 | 129 | 2.8298e+00 | false | local_minimum | NaN | StalledSuccess; claimed convergence at cost 2.829800e+00, above the reference 0.000000e+00; predicted reduction / cost 1.21e-20 |
| 26 | NonlinearSolve (TrustRegion) | 1.308542e6 | 155 | 213200 | 11 | 1.6988e-19 | true | ok | NaN | Success |
| 26 | CaNNOLeS | 679021.0 | 245 | 320368 | 10 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32 | SecondOrderOptimization (Dogleg) | 167938.0 | 162 | 178944 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 177708.5 | 158 | 178288 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Gauss-Newton) | 168666.5 | 149 | 161344 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 1.184396e6 | 118 | 556720 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 1.385979e6 | 238 | 835760 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 2.7187915e6 | 367 | 1261920 | 18 | 3.9810e-22 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 1.6732085e6 | 763 | 947936 | 14 | 1.3363e-29 | true | ok | NaN | converged |
| 32 | Optim (Newton) | 370937.5 | 170 | 25488 | 10 | 4.5840e-19 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 2.730458e6 | 507 | 63296 | 12 | 1.6641e-18 | false | not_converged | NaN | not\_desc; cost test passes |
| 32 | JSOSolvers (tron) | 3.6125e6 | 392 | 59040 | 11 | 1.9552e-18 | false | not_converged | NaN | small\_residual; cost test passes |
| 32 | Ipopt | 1.1650625e7 | 963 | 330912 | 11 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32 | MadNLP | 5.7008335e6 | 907 | 141456 | 12 | 9.0856e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 9.085583e+00, above the reference 0.000000e+00; predicted reduction / cost 5.80e-22 |
| 32 | NonlinearSolve (LM) | 1.8877917e7 | 1842 | 4161584 | 128 | 2.8407e+00 | false | local_minimum | NaN | StalledSuccess; claimed convergence at cost 2.840691e+00, above the reference 0.000000e+00; predicted reduction / cost 5.89e-24 |
| 32 | NonlinearSolve (TrustRegion) | 3.002375e6 | 155 | 365664 | 15 | 6.5356e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 1.0307915e6 | 250 | 445760 | 10 | 4.5840e-19 | true | ok | NaN | first\_order |
