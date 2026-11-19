# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T02:20:52
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 2c10368
- **Dependency Commits**: OptimizationVariableInterface f130043, SecondOrderOptimization 377b96e, NLLSModel 78a4ef5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel | 54.310344827586206 | 1 | 16 | 201.5326086956522 | 1 | 32 |
| 2 | Standalone | 69.53250773993808 | 1 | 16 | 192.15533980582524 | 1 | 32 |
| 2 | NLPModels (MathOptNLSModel) | 1067.1666666666667 | 5 | 80 | 2062.5 | 9 | 224 |
| 3 | NLLSModel | 55.11246943765281 | 1 | 16 | 233.03488372093022 | 1 | 32 |
| 3 | Standalone | 71.76923076923077 | 1 | 16 | 284.51428571428573 | 1 | 32 |
| 3 | NLPModels (MathOptNLSModel) | 1178.9411764705883 | 5 | 80 | 2263.8888888888887 | 9 | 224 |
| 4 | NLLSModel | 58.512129380053906 | 1 | 16 | 301.6119402985075 | 1 | 32 |
| 4 | Standalone | 77.48920863309353 | 1 | 16 | 318.5846153846154 | 1 | 32 |
| 4 | NLPModels (MathOptNLSModel) | 1394.4666666666667 | 5 | 80 | 2863.1428571428573 | 9 | 224 |
| 5 | NLLSModel | 60.8974358974359 | 1 | 16 | 356.05454545454546 | 1 | 32 |
| 5 | Standalone | 80.99250936329588 | 1 | 16 | 376.55555555555554 | 1 | 32 |
| 5 | NLPModels (MathOptNLSModel) | 1687.5 | 5 | 80 | 3701.3333333333335 | 9 | 224 |
| 6 | NLLSModel | 65.38938053097345 | 1 | 16 | 446.02272727272725 | 1 | 32 |
| 6 | Standalone | 87.06225680933852 | 1 | 16 | 428.8125 | 1 | 32 |
| 6 | NLPModels (MathOptNLSModel) | 2100.0 | 5 | 80 | 4783.4 | 9 | 224 |
| 8 | NLLSModel | 84.26966292134831 | 1 | 16 | 674.7096774193549 | 1 | 32 |
| 8 | Standalone | 97.1590909090909 | 1 | 16 | 616.4411764705883 | 1 | 32 |
| 8 | NLPModels (MathOptNLSModel) | 3113.0 | 5 | 80 | 7764.0 | 9 | 224 |
| 10 | NLLSModel | 93.75 | 1 | 16 | 947.0 | 1 | 32 |
| 10 | Standalone | 113.75661375661376 | 1 | 16 | 974.1904761904761 | 1 | 32 |
| 10 | NLPModels (MathOptNLSModel) | 4583.2 | 5 | 80 | 13500.0 | 9 | 224 |
| 14 | NLLSModel | 143.94405594405595 | 1 | 16 | 1673.076923076923 | 1 | 32 |
| 14 | Standalone | 156.33082706766916 | 1 | 16 | 2216.6 | 1 | 32 |
| 14 | NLPModels (MathOptNLSModel) | 9305.333333333334 | 5 | 80 | 40791.0 | 9 | 224 |
| 18 | NLLSModel | 246.7191011235955 | 1 | 16 | 2619.75 | 1 | 32 |
| 18 | Standalone | 215.20618556701032 | 1 | 16 | 4200.0 | 1 | 32 |
| 18 | NLPModels (MathOptNLSModel) | 15208.0 | 5 | 80 | 67125.0 | 9 | 224 |
| 22 | NLLSModel | 344.758064516129 | 1 | 16 | 3840.1666666666665 | 1 | 32 |
| 22 | Standalone | 299.5217391304348 | 1 | 16 | 8708.333333333334 | 1 | 32 |
| 22 | NLPModels (MathOptNLSModel) | 23084.0 | 5 | 80 | 141208.0 | 9 | 224 |
| 26 | NLLSModel | 481.04545454545456 | 1 | 16 | 5250.0 | 1 | 32 |
| 26 | Standalone | 388.6363636363636 | 1 | 16 | 14417.0 | 1 | 32 |
| 26 | NLPModels (MathOptNLSModel) | 32333.0 | 5 | 80 | 201292.0 | 9 | 224 |
| 32 | NLLSModel | 695.3793103448276 | 1 | 16 | 7833.333333333333 | 1 | 32 |
| 32 | Standalone | 558.1052631578947 | 1 | 16 | 26584.0 | 1 | 32 |
| 32 | NLPModels (MathOptNLSModel) | 49000.0 | 5 | 80 | 367625.0 | 9 | 224 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 7583.0 | 142 | 7200 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM) | 7208.0 | 138 | 7024 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (Gauss-Newton) | 6854.5 | 131 | 6640 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM, tall) | 8937.5 | 101 | 7264 | 6 | 7.7016e-25 | true | ok | NaN | grad\_tol |
| 2 | LeastSquaresOptim (Dogleg) | 9708.0 | 151 | 355824 | 7 | 0.0000e+00 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 9250.0 | 147 | 355680 | 7 | 1.5248e-24 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 15500.0 | 202 | 12928 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 13625.0 | 116 | 5072 | 6 | 7.7016e-25 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 15708.0 | 113 | 5440 | 7 | 5.5744e-28 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 25750.0 | 199 | 10032 | 6 | 6.1357e-20 | true | ok | NaN | first\_order |
| 2 | Ipopt | 774541.5 | 696 | 31488 | 7 | 3.4139e-26 | true | ok | NaN | first\_order |
| 2 | MadNLP | 291896.0 | 631 | 50080 | 6 | 3.2671e-20 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 37520.5 | 283 | 21248 | 13 | 1.6316e-22 | true | ok | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 9895.5 | 163 | 357040 | 7 | 1.5811e-23 | true | ok | NaN | Success |
| 2 | CaNNOLeS | 15125.0 | 182 | 9760 | 6 | 7.7016e-25 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 8709.0 | 142 | 7920 | 7 | 7.5249e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM) | 8270.5 | 138 | 7744 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (Gauss-Newton) | 7916.0 | 131 | 7296 | 7 | 7.5249e-20 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM, tall) | 11958.0 | 101 | 8384 | 7 | 7.5232e-20 | true | ok | NaN | grad\_tol |
| 3 | LeastSquaresOptim (Dogleg) | 12812.5 | 169 | 408960 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 14000.0 | 183 | 459776 | 9 | 5.6818e-30 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 28958.5 | 281 | 20464 | 7 | 9.2456e-22 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 16500.0 | 129 | 5600 | 7 | 7.5249e-20 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 20875.0 | 120 | 5968 | 7 | 1.8161e-20 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 64625.0 | 211 | 10832 | 7 | 2.7095e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 3 | Ipopt | 847291.5 | 670 | 31424 | 7 | 5.5049e-17 | true | ok | NaN | first\_order |
| 3 | MadNLP | 390812.5 | 745 | 52544 | 8 | 1.0872e-29 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 49000.0 | 301 | 24848 | 15 | 8.5268e-23 | true | ok | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 13166.5 | 163 | 360112 | 7 | 7.5075e-19 | true | ok | NaN | Success |
| 3 | CaNNOLeS | 19750.0 | 185 | 12256 | 7 | 7.5249e-20 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 9791.0 | 142 | 9312 | 7 | 1.3440e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM) | 9500.0 | 138 | 9104 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Gauss-Newton) | 9145.5 | 131 | 8512 | 7 | 1.3440e-21 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 14896.0 | 101 | 10096 | 7 | 1.3444e-21 | true | ok | NaN | grad\_tol |
| 4 | LeastSquaresOptim (Dogleg) | 16791.0 | 169 | 412256 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 18520.5 | 183 | 463488 | 9 | 4.8047e-28 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 40479.0 | 309 | 28624 | 8 | 0.0000e+00 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 17729.5 | 129 | 5856 | 7 | 1.3440e-21 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 150750.0 | 402 | 25920 | 7 | 1.2381e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 4 | JSOSolvers (tron) | 57812.5 | 245 | 12976 | 8 | 1.7694e-23 | true | ok | NaN | first\_order |
| 4 | Ipopt | 1.3659165e6 | 988 | 48240 | 13 | 2.9819e-28 | true | ok | NaN | first\_order |
| 4 | MadNLP | 430458.5 | 748 | 53568 | 9 | 1.7860e-25 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 65625.0 | 328 | 32736 | 18 | 3.9178e-20 | true | ok | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 17188.0 | 183 | 416592 | 8 | 1.4513e-30 | true | ok | NaN | Success |
| 4 | CaNNOLeS | 24166.0 | 186 | 15888 | 7 | 1.3440e-21 | true | ok | NaN | first\_order |
| 5 | SecondOrderOptimization (Dogleg) | 12959.0 | 142 | 10528 | 9 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM) | 15041.5 | 138 | 10320 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (Gauss-Newton) | 10416.0 | 133 | 9696 | 8 | 3.1361e-27 | true | ok | NaN | grad\_tol |
| 5 | SecondOrderOptimization (LM, tall) | 27437.5 | 101 | 12048 | 9 | 4.6966e-23 | true | ok | NaN | grad\_tol |
| 5 | LeastSquaresOptim (Dogleg) | 22979.0 | 203 | 467440 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 21937.5 | 183 | 467024 | 9 | 1.0157e-25 | true | ok | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 46791.5 | 309 | 33808 | 8 | 2.7179e-28 | true | ok | NaN | converged |
| 5 | Optim (Newton) | 20708.0 | 147 | 6592 | 8 | 1.5683e-25 | true | ok | NaN | converged |
| 5 | JSOSolvers (trunk) | 50000.0 | 156 | 8256 | 9 | 1.3340e-23 | true | ok | NaN | first\_order |
| 5 | JSOSolvers (tron) | 108875.0 | 265 | 14160 | 10 | 7.2034e-18 | false | not_converged | NaN | small\_residual; cost test passes |
| 5 | Ipopt | 1.301459e6 | 938 | 49152 | 10 | 5.6266e-28 | true | ok | NaN | first\_order |
| 5 | MadNLP | 430083.5 | 739 | 54288 | 9 | 7.2474e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 85062.5 | 346 | 40672 | 20 | 2.2867e-21 | true | ok | NaN | Success |
| 5 | NonlinearSolve (TrustRegion) | 21104.5 | 183 | 421936 | 8 | 0.0000e+00 | true | ok | NaN | Success |
| 5 | CaNNOLeS | 31750.0 | 188 | 19360 | 8 | 3.1453e-27 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 14292.0 | 142 | 12512 | 9 | 7.3660e-31 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM) | 16500.0 | 138 | 12272 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (Gauss-Newton) | 11583.0 | 133 | 11424 | 8 | 7.3121e-25 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM, tall) | 33520.5 | 101 | 15008 | 9 | 2.5627e-20 | true | ok | NaN | grad\_tol |
| 6 | LeastSquaresOptim (Dogleg) | 28542.0 | 207 | 470688 | 14 | 0.0000e+00 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 27354.0 | 183 | 470112 | 9 | 6.5103e-28 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 57958.5 | 309 | 41408 | 8 | 3.2466e-25 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 21708.0 | 147 | 6944 | 8 | 4.1099e-19 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 65021.0 | 160 | 8912 | 9 | 2.1691e-26 | true | ok | NaN | first\_order |
| 6 | JSOSolvers (tron) | 113292.0 | 293 | 16128 | 10 | 1.0902e-17 | true | ok | NaN | first\_order |
| 6 | Ipopt | 1.3535005e6 | 996 | 54624 | 11 | 6.3223e-29 | true | ok | NaN | first\_order |
| 6 | MadNLP | 413729.5 | 700 | 54816 | 8 | 2.5072e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.507159e+00, above the reference 0.000000e+00; predicted reduction / cost 1.90e-18 |
| 6 | NonlinearSolve (LM) | 111895.5 | 364 | 53040 | 22 | 5.1931e-23 | true | ok | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 303833.0 | 1963 | 5168144 | 36 | 2.5072e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 6 | CaNNOLeS | 40520.5 | 188 | 23824 | 8 | 7.3114e-25 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 17166.5 | 142 | 16528 | 8 | 2.0175e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM) | 16417.0 | 138 | 16256 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (Gauss-Newton) | 15666.5 | 131 | 14864 | 8 | 2.0175e-24 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 38437.5 | 105 | 23152 | 8 | 2.0194e-24 | true | ok | NaN | grad\_tol |
| 8 | LeastSquaresOptim (Dogleg) | 39209.0 | 197 | 477664 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 39104.5 | 193 | 477952 | 9 | 1.0826e-24 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 90479.0 | 346 | 64192 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 24479.5 | 142 | 7344 | 8 | 2.0175e-24 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 111708.0 | 177 | 10768 | 10 | 4.0468e-18 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 190312.5 | 329 | 19152 | 10 | 4.0071e-21 | true | ok | NaN | first\_order |
| 8 | Ipopt | 1.935833e6 | 1049 | 67168 | 14 | 1.9912e-19 | true | ok | NaN | first\_order |
| 8 | MadNLP | 479958.5 | 730 | 58080 | 9 | 2.6457e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.645709e+00, above the reference 0.000000e+00; predicted reduction / cost 1.08e-22 |
| 8 | NonlinearSolve (LM) | 197875.0 | 449 | 97856 | 31 | 4.1941e-17 | true | ok | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 38354.0 | 200 | 449344 | 8 | 1.0369e-23 | true | ok | NaN | Success |
| 8 | CaNNOLeS | 61250.0 | 190 | 37040 | 8 | 2.0175e-24 | true | ok | NaN | first\_order |
| 10 | SecondOrderOptimization (Dogleg) | 20916.5 | 142 | 22480 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM) | 20708.0 | 138 | 22176 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (Gauss-Newton) | 19437.5 | 131 | 20064 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | SecondOrderOptimization (LM, tall) | 52479.0 | 105 | 34336 | 8 | 1.1201e-22 | true | ok | NaN | grad\_tol |
| 10 | LeastSquaresOptim (Dogleg) | 52020.5 | 197 | 485952 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 93229.0 | 307 | 805328 | 15 | 3.8422e-25 | true | ok | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 154250.0 | 483 | 119280 | 11 | 9.9092e-29 | true | ok | NaN | converged |
| 10 | Optim (Newton) | 29750.0 | 142 | 8304 | 8 | 1.1201e-22 | true | ok | NaN | converged |
| 10 | JSOSolvers (trunk) | 174271.0 | 182 | 12144 | 10 | 6.3729e-19 | true | ok | NaN | first\_order |
| 10 | JSOSolvers (tron) | 251896.0 | 315 | 19904 | 9 | 4.5011e-19 | true | ok | NaN | first\_order |
| 10 | Ipopt | 1.646875e6 | 833 | 64432 | 10 | 2.7100e+00 | false | local_minimum | NaN | first\_order; claimed convergence at cost 2.709964e+00, above the reference 0.000000e+00; predicted reduction / cost 1.10e-28 |
| 10 | MadNLP | 574687.5 | 766 | 61648 | 9 | 2.7100e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.709964e+00, above the reference 0.000000e+00; predicted reduction / cost 1.70e-19 |
| 10 | NonlinearSolve (LM) | 1.201709e6 | 1376 | 474096 | 134 | 2.7100e+00 | false | local_minimum | NaN | StalledSuccess; claimed convergence at cost 2.709964e+00, above the reference 0.000000e+00; predicted reduction / cost 2.64e-16 |
| 10 | NonlinearSolve (TrustRegion) | 60291.5 | 200 | 479024 | 8 | 5.2878e-22 | true | ok | NaN | Success |
| 10 | CaNNOLeS | 91625.0 | 190 | 50432 | 8 | 1.1201e-22 | true | ok | NaN | first\_order |
| 14 | SecondOrderOptimization (Dogleg) | 35958.0 | 142 | 35072 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM) | 34896.0 | 138 | 34704 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (Gauss-Newton) | 33208.0 | 131 | 31088 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | SecondOrderOptimization (LM, tall) | 117271.0 | 106 | 67376 | 9 | 0.0000e+00 | true | ok | NaN | step\_size |
| 14 | LeastSquaresOptim (Dogleg) | 101604.5 | 197 | 504816 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 237167.0 | 364 | 994896 | 18 | 7.5856e-27 | true | ok | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 207416.5 | 397 | 146080 | 9 | 5.0883e-19 | true | ok | NaN | converged |
| 14 | Optim (Newton) | 51333.0 | 155 | 10512 | 9 | 0.0000e+00 | true | ok | NaN | converged |
| 14 | JSOSolvers (trunk) | 527375.0 | 466 | 34576 | 11 | 8.5695e-18 | false | not_converged | NaN | not\_desc; cost test passes |
| 14 | JSOSolvers (tron) | 932479.0 | 520 | 33120 | 12 | 3.3083e-19 | true | ok | NaN | first\_order |
| 14 | Ipopt | 2.6201045e6 | 943 | 106544 | 11 | 1.8808e-19 | true | ok | NaN | first\_order |
| 14 | MadNLP | 1.185333e6 | 817 | 70752 | 14 | 2.7717e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.771745e+00, above the reference 0.000000e+00; predicted reduction / cost 7.79e-32 |
| 14 | NonlinearSolve (LM) | 2.3502085e6 | 1322 | 805824 | 128 | 2.7717e+00 | false | local_minimum | NaN | StalledSuccess; claimed convergence at cost 2.771745e+00, above the reference 0.000000e+00; predicted reduction / cost 1.72e-27 |
| 14 | NonlinearSolve (TrustRegion) | 162812.5 | 266 | 760368 | 9 | 2.9531e-20 | true | ok | NaN | Success |
| 14 | CaNNOLeS | 185458.5 | 206 | 96352 | 9 | 0.0000e+00 | true | ok | NaN | first\_order |
| 18 | SecondOrderOptimization (Dogleg) | 56895.5 | 160 | 71344 | 9 | 2.4556e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM) | 55708.5 | 156 | 70912 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (Gauss-Newton) | 53250.0 | 147 | 64320 | 9 | 2.4556e-23 | true | ok | NaN | grad\_tol |
| 18 | SecondOrderOptimization (LM, tall) | 212458.0 | 110 | 129200 | 9 | 2.4559e-23 | true | ok | NaN | grad\_tol |
| 18 | LeastSquaresOptim (Dogleg) | 210458.5 | 216 | 599280 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 18 | LeastSquaresOptim (LM) | 424813.0 | 364 | 1050560 | 18 | 5.6493e-26 | true | ok | NaN | converged |
| 18 | Optim (NewtonTrustRegion) | 371021.0 | 477 | 248640 | 10 | 5.6406e-24 | true | ok | NaN | converged |
| 18 | Optim (Newton) | 81354.5 | 157 | 13712 | 9 | 2.4556e-23 | true | ok | NaN | converged |
| 18 | JSOSolvers (trunk) | 765625.0 | 217 | 20480 | 12 | 1.4858e-18 | true | ok | NaN | first\_order |
| 18 | JSOSolvers (tron) | 1.804458e6 | 522 | 37936 | 10 | 2.2992e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 18 | Ipopt | 4.4682295e6 | 997 | 144432 | 13 | 7.3447e-18 | true | ok | NaN | first\_order |
| 18 | MadNLP | 1.6676045e6 | 835 | 81600 | 14 | 2.8014e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.801395e+00, above the reference 0.000000e+00; predicted reduction / cost 3.78e-29 |
| 18 | NonlinearSolve (LM) | 4.155187e6 | 1578 | 1415312 | 128 | 2.8014e+00 | false | local_minimum | NaN | StalledSuccess; claimed convergence at cost 2.801395e+00, above the reference 0.000000e+00; predicted reduction / cost 8.69e-18 |
| 18 | NonlinearSolve (TrustRegion) | 335083.5 | 146 | 88160 | 12 | 2.5221e-17 | true | ok | NaN | Success |
| 18 | CaNNOLeS | 293833.5 | 212 | 155440 | 9 | 2.4556e-23 | true | ok | NaN | first\_order |
| 22 | SecondOrderOptimization (Dogleg) | 76896.0 | 162 | 92896 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM) | 75771.0 | 158 | 92400 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (Gauss-Newton) | 73583.0 | 149 | 83728 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | SecondOrderOptimization (LM, tall) | 367646.5 | 118 | 203056 | 9 | 4.1424e-22 | true | ok | NaN | grad\_tol |
| 22 | LeastSquaresOptim (Dogleg) | 385521.0 | 219 | 633184 | 10 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | LeastSquaresOptim (LM) | 765729.5 | 367 | 1093984 | 18 | 2.3716e-25 | true | ok | NaN | converged |
| 22 | Optim (NewtonTrustRegion) | 715416.5 | 693 | 473152 | 13 | 0.0000e+00 | true | ok | NaN | converged |
| 22 | Optim (Newton) | 130708.5 | 157 | 16016 | 9 | 4.1424e-22 | true | ok | NaN | converged |
| 22 | JSOSolvers (trunk) | 1.2915e6 | 490 | 43248 | 11 | 3.3980e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 22 | JSOSolvers (tron) | 1.696187e6 | 382 | 35600 | 10 | 2.8812e-18 | true | ok | NaN | first\_order |
| 22 | Ipopt | 6.3726455e6 | 1052 | 190992 | 13 | 5.8707e-28 | true | ok | NaN | first\_order |
| 22 | MadNLP | 2.8830625e6 | 801 | 93968 | 15 | 2.8186e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.818619e+00, above the reference 0.000000e+00; predicted reduction / cost 2.48e-21 |
| 22 | NonlinearSolve (LM) | 7.921354e6 | 1855 | 2033632 | 129 | 2.8186e+00 | false | local_minimum | NaN | StalledSuccess; claimed convergence at cost 2.818619e+00, above the reference 0.000000e+00; predicted reduction / cost 3.10e-16 |
| 22 | NonlinearSolve (TrustRegion) | 678354.0 | 155 | 136816 | 12 | 2.4364e-17 | true | ok | NaN | Success |
| 22 | CaNNOLeS | 448187.5 | 235 | 204688 | 9 | 4.1423e-22 | true | ok | NaN | first\_order |
| 26 | SecondOrderOptimization (Dogleg) | 115396.0 | 162 | 133904 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM) | 115125.0 | 158 | 133344 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (Gauss-Newton) | 110312.5 | 149 | 120544 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | SecondOrderOptimization (LM, tall) | 653062.5 | 118 | 323376 | 10 | 1.2434e-30 | true | ok | NaN | grad\_tol |
| 26 | LeastSquaresOptim (Dogleg) | 671312.5 | 238 | 739248 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 26 | LeastSquaresOptim (LM) | 1.3089375e6 | 367 | 1149824 | 18 | 7.4077e-25 | true | ok | NaN | converged |
| 26 | Optim (NewtonTrustRegion) | 1.0123125e6 | 706 | 664096 | 13 | 1.0484e-22 | true | ok | NaN | converged |
| 26 | Optim (Newton) | 220354.0 | 170 | 21008 | 10 | 1.2434e-30 | true | ok | NaN | converged |
| 26 | JSOSolvers (trunk) | 1.6714165e6 | 240 | 31696 | 12 | 2.9603e-19 | true | ok | NaN | first\_order |
| 26 | JSOSolvers (tron) | 2.4024585e6 | 394 | 43936 | 11 | 2.0456e-20 | true | ok | NaN | first\_order |
| 26 | Ipopt | 7.963354e6 | 1057 | 274096 | 12 | 1.0231e-16 | true | ok | NaN | first\_order |
| 26 | MadNLP | 4.0770835e6 | 822 | 108784 | 16 | 2.8298e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 2.829800e+00, above the reference 0.000000e+00; predicted reduction / cost 9.89e-22 |
| 26 | NonlinearSolve (LM) | 1.22458755e7 | 1855 | 2840592 | 129 | 2.8298e+00 | false | local_minimum | NaN | StalledSuccess; claimed convergence at cost 2.829800e+00, above the reference 0.000000e+00; predicted reduction / cost 1.21e-20 |
| 26 | NonlinearSolve (TrustRegion) | 1.3072915e6 | 155 | 213200 | 11 | 1.6988e-19 | true | ok | NaN | Success |
| 26 | CaNNOLeS | 672854.0 | 245 | 320368 | 10 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32 | SecondOrderOptimization (Dogleg) | 163667.0 | 162 | 178944 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 161750.0 | 158 | 178288 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Gauss-Newton) | 158812.5 | 149 | 161344 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 1.1800835e6 | 118 | 556592 | 10 | 4.5840e-19 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 1.346083e6 | 238 | 835760 | 11 | 0.0000e+00 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 2.691188e6 | 367 | 1261920 | 18 | 3.9810e-22 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 1.653333e6 | 763 | 947936 | 14 | 1.3363e-29 | true | ok | NaN | converged |
| 32 | Optim (Newton) | 363375.0 | 170 | 25488 | 10 | 4.5840e-19 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 2.788833e6 | 507 | 63296 | 12 | 1.6641e-18 | false | not_converged | NaN | not\_desc; cost test passes |
| 32 | JSOSolvers (tron) | 3.664541e6 | 392 | 59040 | 11 | 1.9552e-18 | false | not_converged | NaN | small\_residual; cost test passes |
| 32 | Ipopt | 1.1328479e7 | 963 | 330912 | 11 | 0.0000e+00 | true | ok | NaN | first\_order |
| 32 | MadNLP | 5.747646e6 | 907 | 141456 | 12 | 9.0856e+00 | false | local_minimum | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 9.085583e+00, above the reference 0.000000e+00; predicted reduction / cost 5.80e-22 |
| 32 | NonlinearSolve (LM) | 1.88833335e7 | 1842 | 4161584 | 128 | 2.8407e+00 | false | local_minimum | NaN | StalledSuccess; claimed convergence at cost 2.840691e+00, above the reference 0.000000e+00; predicted reduction / cost 5.89e-24 |
| 32 | NonlinearSolve (TrustRegion) | 2.957625e6 | 155 | 365664 | 15 | 6.5356e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 1.054396e6 | 250 | 445760 | 10 | 4.5840e-19 | true | ok | NaN | first\_order |
