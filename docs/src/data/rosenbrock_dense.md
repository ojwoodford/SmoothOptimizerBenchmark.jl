# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T02:54:13
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel | 56.148148148148145 | 1 | 16 | 191.84375 | 1 | 32 |
| 2 | Standalone | 51.344743276283616 | 1 | 16 | 542.0 | 7 | 528 |
| 2 | NLPModels (MathOptNLSModel) | 1052.6315789473683 | 5 | 80 | 2162.5 | 9 | 224 |
| 3 | NLLSModel | 64.3948051948052 | 1 | 16 | 244.71830985915494 | 1 | 32 |
| 3 | Standalone | 55.59299191374663 | 1 | 16 | 667.0 | 7 | 592 |
| 3 | NLPModels (MathOptNLSModel) | 1229.1666666666667 | 5 | 80 | 2277.777777777778 | 9 | 224 |
| 4 | NLLSModel | 58.64102564102564 | 1 | 16 | 305.1384615384615 | 1 | 32 |
| 4 | Standalone | 66.4878706199461 | 1 | 16 | 792.0 | 7 | 688 |
| 4 | NLPModels (MathOptNLSModel) | 1450.0 | 5 | 80 | 2803.5714285714284 | 9 | 224 |
| 5 | NLLSModel | 65.04155844155844 | 1 | 16 | 347.2352941176471 | 1 | 32 |
| 5 | Standalone | 67.85448916408669 | 1 | 16 | 875.0 | 7 | 784 |
| 5 | NLPModels (MathOptNLSModel) | 1777.75 | 5 | 80 | 3750.0 | 9 | 224 |
| 6 | NLLSModel | 65.78947368421052 | 1 | 16 | 456.4888888888889 | 1 | 32 |
| 6 | Standalone | 70.21103896103897 | 1 | 16 | 1125.0 | 7 | 944 |
| 6 | NLPModels (MathOptNLSModel) | 2087.5 | 5 | 80 | 4716.8 | 9 | 224 |
| 8 | NLLSModel | 96.82374100719424 | 1 | 16 | 670.8333333333334 | 1 | 32 |
| 8 | Standalone | 74.90636704119851 | 1 | 16 | 1375.0 | 7 | 1296 |
| 8 | NLPModels (MathOptNLSModel) | 3083.285714285714 | 5 | 80 | 8486.0 | 9 | 224 |
| 10 | NLLSModel | 118.37272727272727 | 1 | 16 | 992.047619047619 | 1 | 32 |
| 10 | Standalone | 80.56846473029046 | 1 | 16 | 2458.0 | 7 | 1808 |
| 10 | NLPModels (MathOptNLSModel) | 4591.6 | 5 | 80 | 13375.0 | 9 | 224 |
| 14 | NLLSModel | 166.67132867132867 | 1 | 16 | 1670.1666666666667 | 1 | 32 |
| 14 | Standalone | 117.87939698492463 | 1 | 16 | 4334.0 | 8 | 1808 |
| 14 | NLPModels (MathOptNLSModel) | 9597.333333333334 | 5 | 80 | 40500.0 | 9 | 224 |
| 18 | NLLSModel | 297.515625 | 1 | 16 | 2828.125 | 1 | 32 |
| 18 | Standalone | 119.72151898734177 | 1 | 16 | 9583.0 | 8 | 2624 |
| 18 | NLPModels (MathOptNLSModel) | 16375.0 | 5 | 80 | 66791.0 | 9 | 224 |
| 22 | NLLSModel | 688.3913043478261 | 1 | 16 | 3833.3333333333335 | 1 | 32 |
| 22 | Standalone | 140.51724137931035 | 1 | 16 | 18167.0 | 9 | 3552 |
| 22 | NLPModels (MathOptNLSModel) | 22167.0 | 5 | 80 | 135125.0 | 9 | 224 |
| 26 | NLLSModel | 421.4807692307692 | 1 | 16 | 5625.0 | 1 | 32 |
| 26 | Standalone | 163.8655462184874 | 1 | 16 | 26375.0 | 9 | 4240 |
| 26 | NLPModels (MathOptNLSModel) | 31083.0 | 5 | 80 | 204542.0 | 9 | 224 |
| 32 | NLLSModel | 956.3170731707318 | 1 | 16 | 8375.0 | 1 | 32 |
| 32 | Standalone | 213.70967741935485 | 1 | 16 | 53750.0 | 9 | 6624 |
| 32 | NLPModels (MathOptNLSModel) | 49750.0 | 5 | 80 | 388041.0 | 9 | 224 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 7250.0 | 146 | 7216 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM) | 6979.5 | 142 | 7040 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM, tall) | 8375.0 | 108 | 7520 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | LeastSquaresOptim (Dogleg) | 12833.0 | 193 | 359168 | 7 | 0.0000e+00 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 22833.5 | 189 | 359040 | 7 | 1.5248e-24 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 18625.0 | 237 | 15504 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 16833.0 | 145 | 7168 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 16208.0 | 113 | 5440 | 7 | 5.5901e-28 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 26709.0 | 199 | 10032 | 6 | 6.1357e-20 | true | ok | NaN | first\_order |
| 2 | Ipopt | 839416.5 | 688 | 30944 | 7 | 1.5884e-26 | true | ok | NaN | first\_order |
| 2 | MadNLP | 302979.5 | 631 | 50080 | 6 | 1.8806e-20 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 39542.0 | 343 | 23168 | 13 | 1.6316e-22 | true | ok | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 20916.5 | 205 | 360272 | 7 | 1.5811e-23 | true | ok | NaN | Success |
| 2 | CaNNOLeS | 15083.5 | 182 | 9760 | 6 | 7.7016e-25 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 8333.0 | 146 | 7936 | 7 | 7.5249e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM) | 8104.5 | 142 | 7760 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 11208.0 | 108 | 8640 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | LeastSquaresOptim (Dogleg) | 25729.5 | 217 | 413344 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 28895.5 | 237 | 464736 | 9 | 5.6818e-30 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 31896.0 | 321 | 24304 | 7 | 9.2456e-22 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 19084.0 | 162 | 8880 | 7 | 7.5249e-20 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 20583.0 | 120 | 5968 | 7 | 1.8161e-20 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 66833.0 | 211 | 10832 | 7 | 2.7095e-17 | false | not_converged | NaN | small\_residual |
| 3 | Ipopt | 855500.5 | 662 | 30720 | 7 | 8.0760e-18 | true | ok | NaN | first\_order |
| 3 | MadNLP | 390229.5 | 745 | 52544 | 8 | 4.4409e-16 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 51020.5 | 367 | 29072 | 15 | 8.5268e-23 | true | ok | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 24625.5 | 205 | 363872 | 7 | 7.5075e-19 | true | ok | NaN | Success |
| 3 | CaNNOLeS | 18917.0 | 185 | 12256 | 7 | 7.5249e-20 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 9375.0 | 146 | 9312 | 7 | 1.3440e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM) | 8937.0 | 142 | 9104 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 13604.5 | 108 | 10384 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | LeastSquaresOptim (Dogleg) | 27333.0 | 217 | 417472 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 25000.0 | 237 | 469376 | 9 | 4.8047e-28 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 43916.5 | 354 | 34240 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 19833.5 | 162 | 10288 | 7 | 1.3440e-21 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 138417.0 | 402 | 25920 | 7 | 1.2381e-17 | false | not_converged | NaN | not\_desc |
| 4 | JSOSolvers (tron) | 54042.0 | 245 | 12976 | 8 | 1.7694e-23 | true | ok | NaN | first\_order |
| 4 | Ipopt | 1.3411875e6 | 980 | 47328 | 13 | 3.2978e-29 | true | ok | NaN | first\_order |
| 4 | MadNLP | 418979.5 | 748 | 53568 | 9 | 1.0519e-25 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 67333.5 | 400 | 40192 | 18 | 3.9178e-20 | true | ok | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 22604.0 | 231 | 421792 | 8 | 1.4513e-30 | true | ok | NaN | Success |
| 4 | CaNNOLeS | 23375.0 | 186 | 15888 | 7 | 1.3440e-21 | true | ok | NaN | first\_order |
| 5 | SecondOrderOptimization (Dogleg) | 12625.0 | 146 | 10512 | 9 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM) | 14666.5 | 142 | 10304 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 26312.0 | 108 | 12336 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | LeastSquaresOptim (Dogleg) | 26208.0 | 257 | 474240 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 25167.0 | 237 | 473856 | 9 | 1.0157e-25 | true | ok | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 50313.0 | 354 | 41008 | 8 | 2.7179e-28 | true | ok | NaN | converged |
| 5 | Optim (Newton) | 24500.0 | 183 | 13072 | 8 | 1.5683e-25 | true | ok | NaN | converged |
| 5 | JSOSolvers (trunk) | 49292.0 | 156 | 8256 | 9 | 1.3340e-23 | true | ok | NaN | first\_order |
| 5 | JSOSolvers (tron) | 110625.0 | 265 | 14160 | 10 | 7.2034e-18 | false | not_converged | NaN | small\_residual |
| 5 | Ipopt | 1.237458e6 | 930 | 48032 | 10 | 2.1001e-28 | true | ok | NaN | first\_order |
| 5 | MadNLP | 433958.5 | 739 | 54288 | 9 | 3.7426e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 89271.0 | 424 | 52064 | 20 | 2.2867e-21 | true | ok | NaN | Success |
| 5 | NonlinearSolve (TrustRegion) | 28104.5 | 231 | 428080 | 8 | 0.0000e+00 | true | ok | NaN | Success |
| 5 | CaNNOLeS | 32708.5 | 188 | 19360 | 8 | 3.1434e-27 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 14166.0 | 146 | 12480 | 9 | 7.3660e-31 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM) | 16166.5 | 142 | 12240 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 31520.5 | 108 | 15328 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | LeastSquaresOptim (Dogleg) | 32937.5 | 261 | 479056 | 14 | 0.0000e+00 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 34083.5 | 237 | 478464 | 9 | 6.5103e-28 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 64021.0 | 354 | 50912 | 8 | 3.2466e-25 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 28958.5 | 183 | 15728 | 8 | 4.1099e-19 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 63312.0 | 160 | 8912 | 9 | 2.1694e-26 | true | ok | NaN | first\_order |
| 6 | JSOSolvers (tron) | 109062.5 | 293 | 16128 | 10 | 1.0902e-17 | true | ok | NaN | first\_order |
| 6 | Ipopt | 1.342479e6 | 988 | 53264 | 11 | 1.2990e-29 | true | ok | NaN | first\_order |
| 6 | MadNLP | 390979.5 | 700 | 54816 | 8 | 2.5072e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 124104.0 | 448 | 70112 | 22 | 5.1931e-23 | true | ok | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 328375.0 | 2179 | 5201296 | 36 | 2.5072e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 6 | CaNNOLeS | 39667.0 | 188 | 23824 | 8 | 7.3115e-25 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 15812.5 | 146 | 16480 | 8 | 2.0175e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM) | 15854.5 | 142 | 16208 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 34854.0 | 112 | 23504 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | LeastSquaresOptim (Dogleg) | 42770.5 | 251 | 489440 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 46624.5 | 247 | 489696 | 9 | 1.0826e-24 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 103792.0 | 396 | 80352 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 35583.5 | 179 | 21248 | 8 | 2.0175e-24 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 114562.5 | 177 | 10768 | 10 | 4.0468e-18 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 195104.0 | 329 | 19152 | 10 | 4.0071e-21 | true | ok | NaN | first\_order |
| 8 | Ipopt | 2.0157295e6 | 1041 | 65040 | 14 | 1.2446e-19 | true | ok | NaN | first\_order |
| 8 | MadNLP | 514083.5 | 730 | 58080 | 9 | 2.6457e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 209375.0 | 551 | 129392 | 31 | 4.1941e-17 | true | ok | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 43437.5 | 248 | 460208 | 8 | 1.0369e-23 | true | ok | NaN | Success |
| 8 | CaNNOLeS | 58562.5 | 190 | 37040 | 8 | 2.0175e-24 | true | ok | NaN | first\_order |
| 10 | SecondOrderOptimization (Dogleg) | 20250.0 | 146 | 22448 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM) | 20208.0 | 142 | 22144 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 49833.0 | 112 | 34720 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | LeastSquaresOptim (Dogleg) | 65208.5 | 251 | 502608 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 111271.0 | 379 | 827344 | 15 | 3.8422e-25 | true | ok | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 169583.0 | 543 | 149040 | 11 | 9.9092e-29 | true | ok | NaN | converged |
| 10 | Optim (Newton) | 43875.0 | 179 | 29984 | 8 | 1.1201e-22 | true | ok | NaN | converged |
| 10 | JSOSolvers (trunk) | 164083.0 | 182 | 12144 | 10 | 6.3729e-19 | true | ok | NaN | first\_order |
| 10 | JSOSolvers (tron) | 247583.5 | 315 | 19904 | 9 | 4.5011e-19 | true | ok | NaN | first\_order |
| 10 | Ipopt | 1.6696875e6 | 825 | 61552 | 10 | 2.7100e+00 | true | ok | NaN | first\_order |
| 10 | MadNLP | 576125.5 | 766 | 61648 | 9 | 2.7100e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 1.2635005e6 | 1676 | 581568 | 134 | 2.7100e+00 | true | ok | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 66896.0 | 248 | 494544 | 8 | 5.2878e-22 | true | ok | NaN | Success |
| 10 | CaNNOLeS | 89125.5 | 190 | 50432 | 8 | 1.1201e-22 | true | ok | NaN | first\_order |
| 14 | SecondOrderOptimization (Dogleg) | 35188.0 | 146 | 34992 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM) | 33750.0 | 142 | 34624 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM, tall) | 110979.0 | 113 | 67824 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | LeastSquaresOptim (Dogleg) | 121500.0 | 260 | 521040 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 252187.0 | 462 | 1020000 | 18 | 7.5856e-27 | true | ok | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 242333.0 | 457 | 166400 | 9 | 5.0883e-19 | true | ok | NaN | converged |
| 14 | Optim (Newton) | 80312.5 | 206 | 30112 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | JSOSolvers (trunk) | 533542.0 | 466 | 34576 | 11 | 8.5695e-18 | false | not_converged | NaN | not\_desc |
| 14 | JSOSolvers (tron) | 916437.5 | 520 | 33120 | 12 | 3.3083e-19 | true | ok | NaN | first\_order |
| 14 | Ipopt | 2.661896e6 | 935 | 101472 | 11 | 6.1007e-20 | true | ok | NaN | first\_order |
| 14 | MadNLP | 1.1762915e6 | 817 | 70752 | 14 | 2.7717e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 2.334416e6 | 1658 | 897968 | 128 | 2.7717e+00 | true | ok | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 167916.5 | 329 | 776864 | 9 | 2.9531e-20 | true | ok | NaN | Success |
| 14 | CaNNOLeS | 180521.0 | 206 | 96352 | 9 | 0.0000e+00 | true | ok | NaN | first\_order |
| 18 | SecondOrderOptimization (Dogleg) | 53104.5 | 164 | 71232 | 9 | 2.4556e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM) | 52291.5 | 160 | 70800 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM, tall) | 206750.5 | 117 | 129712 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | LeastSquaresOptim (Dogleg) | 266187.5 | 286 | 625680 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 18 | LeastSquaresOptim (LM) | 510125.0 | 462 | 1087360 | 18 | 5.6493e-26 | true | ok | NaN | converged |
| 18 | Optim (NewtonTrustRegion) | 469853.5 | 543 | 283136 | 10 | 5.6406e-24 | true | ok | NaN | converged |
| 18 | Optim (Newton) | 126687.0 | 208 | 44352 | 9 | 2.4556e-23 | true | ok | NaN | converged |
| 18 | JSOSolvers (trunk) | 711479.0 | 217 | 20480 | 12 | 1.4858e-18 | true | ok | NaN | first\_order |
| 18 | JSOSolvers (tron) | 1.750042e6 | 522 | 37936 | 10 | 2.2992e-17 | false | not_converged | NaN | small\_residual |
| 18 | Ipopt | 4.4219585e6 | 989 | 136304 | 13 | 1.8346e-18 | true | ok | NaN | first\_order |
| 18 | MadNLP | 1.6175625e6 | 835 | 81600 | 14 | 2.8014e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 18 | NonlinearSolve (LM) | 4.3922295e6 | 1914 | 1554048 | 128 | 2.8014e+00 | true | ok | NaN | StalledSuccess |
| 18 | NonlinearSolve (TrustRegion) | 361646.0 | 195 | 117296 | 12 | 2.5221e-17 | true | ok | NaN | Success |
| 18 | CaNNOLeS | 294312.0 | 212 | 155440 | 9 | 2.4556e-23 | true | ok | NaN | first\_order |
| 22 | SecondOrderOptimization (Dogleg) | 76541.5 | 166 | 92736 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM) | 77937.5 | 162 | 92240 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM, tall) | 351624.5 | 125 | 203664 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | LeastSquaresOptim (Dogleg) | 470458.5 | 299 | 669216 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | LeastSquaresOptim (LM) | 903479.0 | 479 | 1144128 | 18 | 2.3716e-25 | true | ok | NaN | converged |
| 22 | Optim (NewtonTrustRegion) | 860958.5 | 791 | 533856 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | Optim (Newton) | 240916.5 | 218 | 58656 | 9 | 4.1424e-22 | true | ok | NaN | converged |
| 22 | JSOSolvers (trunk) | 1.261542e6 | 490 | 43248 | 11 | 3.3980e-17 | false | not_converged | NaN | not\_desc |
| 22 | JSOSolvers (tron) | 1.575063e6 | 382 | 35600 | 10 | 2.8812e-18 | true | ok | NaN | first\_order |
| 22 | Ipopt | 6.458917e6 | 1039 | 178800 | 13 | 1.0568e-28 | true | ok | NaN | first\_order |
| 22 | MadNLP | 2.8547085e6 | 801 | 93968 | 15 | 2.8186e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 22 | NonlinearSolve (LM) | 8.542917e6 | 2239 | 2226368 | 129 | 2.8186e+00 | true | ok | NaN | StalledSuccess |
| 22 | NonlinearSolve (TrustRegion) | 735458.5 | 211 | 179792 | 12 | 2.4364e-17 | true | ok | NaN | Success |
| 22 | CaNNOLeS | 433396.0 | 235 | 204688 | 9 | 4.1423e-22 | true | ok | NaN | first\_order |
| 26 | SecondOrderOptimization (Dogleg) | 114521.0 | 166 | 133744 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM) | 111937.5 | 162 | 133184 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 634104.0 | 125 | 324080 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | LeastSquaresOptim (Dogleg) | 801208.5 | 326 | 786016 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 26 | LeastSquaresOptim (LM) | 1.4342705e6 | 479 | 1209248 | 18 | 7.4077e-25 | true | ok | NaN | converged |
| 26 | Optim (NewtonTrustRegion) | 1.2731665e6 | 804 | 730624 | 13 | 1.0484e-22 | true | ok | NaN | converged |
| 26 | Optim (Newton) | 356146.0 | 237 | 72480 | 10 | 1.2434e-30 | true | ok | NaN | converged |
| 26 | JSOSolvers (trunk) | 1.58625e6 | 240 | 31696 | 12 | 2.9603e-19 | true | ok | NaN | first\_order |
| 26 | JSOSolvers (tron) | 2.3109795e6 | 394 | 43936 | 11 | 2.0456e-20 | true | ok | NaN | first\_order |
| 26 | Ipopt | 7.9014375e6 | 1044 | 258320 | 12 | 3.3964e-17 | true | ok | NaN | first\_order |
| 26 | MadNLP | 4.320521e6 | 822 | 108784 | 16 | 2.8298e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 26 | NonlinearSolve (LM) | 1.26321045e7 | 2239 | 3056896 | 129 | 2.8298e+00 | true | ok | NaN | StalledSuccess |
| 26 | NonlinearSolve (TrustRegion) | 1.4089585e6 | 219 | 257856 | 11 | 1.6988e-19 | true | ok | NaN | Success |
| 26 | CaNNOLeS | 696021.0 | 245 | 320368 | 10 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32 | SecondOrderOptimization (Dogleg) | 173083.0 | 166 | 178720 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 167458.0 | 162 | 178064 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 1.199833e6 | 125 | 557456 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 1.701334e6 | 326 | 909104 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 3.102167e6 | 479 | 1355072 | 18 | 3.9810e-22 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 2.083583e6 | 868 | 1059056 | 14 | 1.3363e-29 | true | ok | NaN | converged |
| 32 | Optim (Newton) | 676500.0 | 237 | 106176 | 10 | 4.5840e-19 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 2.721792e6 | 507 | 63296 | 12 | 1.6641e-18 | false | not_converged | NaN | not\_desc |
| 32 | JSOSolvers (tron) | 3.494209e6 | 392 | 59040 | 11 | 1.9552e-18 | false | not_converged | NaN | small\_residual |
| 32 | Ipopt | 1.1262625e7 | 950 | 304896 | 11 | 6.1082e-32 | true | ok | NaN | first\_order |
| 32 | MadNLP | 6.0248335e6 | 907 | 141456 | 12 | 9.0856e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 1.9953166e7 | 2226 | 4501776 | 128 | 2.8407e+00 | true | ok | NaN | StalledSuccess |
| 32 | NonlinearSolve (TrustRegion) | 3.197479e6 | 219 | 436736 | 15 | 6.5356e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 1.024771e6 | 250 | 445760 | 10 | 4.5840e-19 | true | ok | NaN | first\_order |
