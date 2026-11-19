# Benchmark Results: Multilateration

- **Category**: small_dense
- **Scaling Metric**: Dimension d
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T02:21:36
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
| 2 | NLLSModel (Static) | 62.693498452012385 | 1 | 16 | 169.05 | 1 | 32 |
| 2 | Standalone | 73.89208633093526 | 1 | 16 | 297.79411764705884 | 1 | 32 |
| 3 | NLLSModel (Static) | 76.46441947565543 | 1 | 16 | 260.1744186046512 | 1 | 32 |
| 3 | Standalone | 88.1574074074074 | 1 | 16 | 395.03846153846155 | 1 | 32 |
| 4 | NLLSModel (Static) | 91.00877192982456 | 1 | 16 | 406.68 | 1 | 32 |
| 4 | Standalone | 124.42068965517241 | 1 | 16 | 496.875 | 1 | 32 |
| 5 | NLLSModel (Static) | 115.29545454545455 | 1 | 16 | 649.1935483870968 | 1 | 32 |
| 5 | Standalone | 154.71311475409837 | 1 | 16 | 631.5 | 1 | 32 |
| 6 | NLLSModel (Static) | 133.70253164556962 | 1 | 16 | 920.304347826087 | 1 | 32 |
| 6 | Standalone | 187.88679245283018 | 1 | 16 | 766.0384615384615 | 1 | 32 |
| 7 | NLLSModel (Static) | 161.1782945736434 | 1 | 16 | 1263.0 | 1 | 32 |
| 7 | Standalone | 211.5 | 1 | 16 | 978.1904761904761 | 1 | 32 |
| 8 | NLLSModel (Static) | 191.58878504672896 | 1 | 16 | 1704.8333333333333 | 1 | 32 |
| 8 | Standalone | 247.2987012987013 | 1 | 16 | 1071.7777777777778 | 1 | 32 |
| 10 | NLLSModel (Static) | 262.4415584415584 | 1 | 16 | 3416.6666666666665 | 1 | 32 |
| 10 | Standalone | 352.4590163934426 | 1 | 16 | 1589.6923076923076 | 1 | 32 |
| 12 | NLLSModel (Static) | 381.94444444444446 | 1 | 16 | 5385.25 | 1 | 32 |
| 12 | Standalone | 427.9375 | 1 | 16 | 2062.5 | 1 | 32 |
| 14 | NLLSModel (Static) | 453.7111111111111 | 1 | 16 | 8417.0 | 1 | 32 |
| 14 | Standalone | 525.6410256410256 | 1 | 16 | 2791.75 | 1 | 32 |
| 16 | NLLSModel (Static) | 592.8571428571429 | 1 | 16 | 15208.0 | 1 | 32 |
| 16 | Standalone | 654.5806451612904 | 1 | 16 | 3444.5 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 2667.0 | 34 | 1984 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | SecondOrderOptimization (LM) | 2729.0 | 32 | 1904 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | SecondOrderOptimization (Gauss-Newton) | 2500.0 | 29 | 1744 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | SecondOrderOptimization (LM, tall) | 8084.0 | 116 | 8080 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | LeastSquaresOptim (Dogleg) | 7458.0 | 115 | 254720 | 5 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 6958.0 | 111 | 254592 | 5 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 13500.0 | 177 | 10576 | 4 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 10500.0 | 90 | 3920 | 4 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 7000.0 | 59 | 3136 | 4 | 9.7541e-04 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 18000.0 | 123 | 6720 | 6 | 9.7541e-04 | true | ok | NaN | first\_order |
| 2 | Ipopt | 520562.5 | 222 | 9904 | 4 | 9.7541e-04 | true | ok | NaN | first\_order |
| 2 | MadNLP | 245187.5 | 543 | 44656 | 4 | 9.7541e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 181583.0 | 1120 | 74432 | 106 | 9.7541e-04 | true | ok | NaN | StalledSuccess |
| 2 | NonlinearSolve (TrustRegion) | 87041.0 | 1303 | 3260912 | 9 | 9.7541e-04 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 2 | CaNNOLeS | 13625.0 | 166 | 12656 | 4 | 9.7541e-04 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 3562.5 | 34 | 2144 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | SecondOrderOptimization (LM) | 3645.5 | 32 | 2064 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | SecondOrderOptimization (Gauss-Newton) | 3333.0 | 29 | 1856 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | SecondOrderOptimization (LM, tall) | 10021.0 | 116 | 9312 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | LeastSquaresOptim (Dogleg) | 9021.0 | 115 | 256432 | 5 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 10417.0 | 129 | 307264 | 6 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 20333.0 | 174 | 13120 | 5 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 13375.0 | 103 | 4400 | 5 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 10541.5 | 59 | 3328 | 5 | 5.8709e-04 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 25229.5 | 123 | 6944 | 7 | 5.8709e-04 | true | ok | NaN | first\_order |
| 3 | Ipopt | 574479.5 | 252 | 11152 | 5 | 5.8709e-04 | true | ok | NaN | first\_order |
| 3 | MadNLP | 264459.0 | 543 | 45056 | 5 | 5.8709e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 252187.5 | 1120 | 89072 | 106 | 5.8709e-04 | true | ok | NaN | StalledSuccess |
| 3 | NonlinearSolve (TrustRegion) | 207958.0 | 2783 | 7098272 | 57 | 5.8709e-04 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 3 | CaNNOLeS | 19292.0 | 166 | 17488 | 5 | 5.8709e-04 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 4437.5 | 34 | 2544 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | SecondOrderOptimization (LM) | 4375.0 | 32 | 2432 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | SecondOrderOptimization (Gauss-Newton) | 4291.5 | 29 | 2144 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | SecondOrderOptimization (LM, tall) | 12417.0 | 101 | 11872 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | LeastSquaresOptim (Dogleg) | 11917.0 | 115 | 258640 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 11708.5 | 111 | 258592 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 27354.0 | 215 | 19184 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 14042.0 | 103 | 4656 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 13125.0 | 59 | 3696 | 5 | 7.3068e-04 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (tron) | 25750.0 | 123 | 7456 | 6 | 7.3068e-04 | true | ok | NaN | first\_order |
| 4 | Ipopt | 579541.5 | 252 | 11280 | 5 | 7.3068e-04 | true | ok | NaN | first\_order |
| 4 | MadNLP | 272479.0 | 543 | 45904 | 5 | 7.3068e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 315041.5 | 1111 | 116832 | 105 | 7.3068e-04 | true | ok | NaN | StalledSuccess |
| 4 | NonlinearSolve (TrustRegion) | 162333.0 | 1623 | 4166016 | 18 | 7.3068e-04 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 4 | CaNNOLeS | 25729.0 | 166 | 24080 | 5 | 7.3068e-04 | true | ok | NaN | first\_order |
| 5 | SecondOrderOptimization (Dogleg) | 5833.5 | 34 | 2800 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM) | 5917.0 | 32 | 2688 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (Gauss-Newton) | 6083.0 | 29 | 2320 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM, tall) | 14875.0 | 101 | 14464 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | LeastSquaresOptim (Dogleg) | 14333.5 | 115 | 260768 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 14375.0 | 111 | 260784 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 33666.5 | 215 | 22560 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | Optim (Newton) | 16271.0 | 103 | 4784 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | JSOSolvers (trunk) | 18042.0 | 59 | 3888 | 6 | 5.3926e-04 | true | ok | NaN | first\_order |
| 5 | JSOSolvers (tron) | 28270.5 | 123 | 7680 | 6 | 5.3926e-04 | true | ok | NaN | first\_order |
| 5 | Ipopt | 605146.0 | 252 | 11280 | 5 | 5.3926e-04 | true | ok | NaN | first\_order |
| 5 | MadNLP | 280395.5 | 543 | 46704 | 5 | 5.3926e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 395708.5 | 1120 | 139984 | 106 | 5.3926e-04 | true | ok | NaN | StalledSuccess |
| 5 | NonlinearSolve (TrustRegion) | 202708.0 | 1663 | 4329600 | 19 | 5.3926e-04 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 5 | CaNNOLeS | 33083.5 | 166 | 31856 | 5 | 5.3926e-04 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 7583.0 | 34 | 3312 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | SecondOrderOptimization (LM) | 7500.0 | 32 | 3168 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | SecondOrderOptimization (Gauss-Newton) | 7792.0 | 29 | 2688 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | SecondOrderOptimization (LM, tall) | 17208.5 | 101 | 17440 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | LeastSquaresOptim (Dogleg) | 17375.0 | 115 | 262640 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 17583.5 | 111 | 262688 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 34958.5 | 174 | 23184 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 16813.0 | 103 | 5136 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 19145.5 | 59 | 4256 | 6 | 5.4518e-04 | true | ok | NaN | first\_order |
| 6 | JSOSolvers (tron) | 36333.0 | 123 | 8192 | 7 | 5.4518e-04 | true | ok | NaN | first\_order |
| 6 | Ipopt | 601812.5 | 252 | 11408 | 5 | 5.4518e-04 | true | ok | NaN | first\_order |
| 6 | MadNLP | 272541.5 | 543 | 47808 | 5 | 5.4518e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 485812.0 | 1120 | 179392 | 106 | 5.4518e-04 | true | ok | NaN | StalledSuccess |
| 6 | NonlinearSolve (TrustRegion) | 295750.0 | 2023 | 5347232 | 31 | 5.4518e-04 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 6 | CaNNOLeS | 42708.0 | 166 | 41168 | 5 | 5.4518e-04 | true | ok | NaN | first\_order |
| 7 | SecondOrderOptimization (Dogleg) | 8125.0 | 34 | 3648 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | SecondOrderOptimization (LM) | 8041.5 | 32 | 3504 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | SecondOrderOptimization (Gauss-Newton) | 8792.0 | 29 | 2912 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | SecondOrderOptimization (LM, tall) | 17750.0 | 102 | 20224 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | LeastSquaresOptim (Dogleg) | 21708.0 | 120 | 266000 | 5 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | LeastSquaresOptim (LM) | 21604.5 | 116 | 266208 | 5 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | Optim (NewtonTrustRegion) | 36750.0 | 187 | 27840 | 4 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | Optim (Newton) | 15625.0 | 90 | 4944 | 4 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | JSOSolvers (trunk) | 20625.0 | 59 | 4448 | 6 | 9.4639e-04 | true | ok | NaN | first\_order |
| 7 | JSOSolvers (tron) | 39375.0 | 123 | 8416 | 7 | 9.4639e-04 | true | ok | NaN | first\_order |
| 7 | Ipopt | 526708.0 | 222 | 10160 | 4 | 9.4639e-04 | true | ok | NaN | first\_order |
| 7 | MadNLP | 254645.5 | 543 | 48896 | 4 | 9.4639e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 7 | NonlinearSolve (LM) | 573187.5 | 1111 | 210432 | 105 | 9.4639e-04 | true | ok | NaN | StalledSuccess |
| 7 | NonlinearSolve (TrustRegion) | 610584.0 | 3278 | 8440720 | 69 | 9.4639e-04 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 7 | CaNNOLeS | 46937.5 | 166 | 51632 | 4 | 9.4639e-04 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 12062.5 | 34 | 4288 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | SecondOrderOptimization (LM) | 11937.5 | 32 | 4112 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | SecondOrderOptimization (Gauss-Newton) | 13020.5 | 29 | 3360 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | SecondOrderOptimization (LM, tall) | 24104.5 | 107 | 23856 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | LeastSquaresOptim (Dogleg) | 23875.0 | 121 | 266848 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 23500.0 | 117 | 267168 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 49229.5 | 179 | 32384 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 19458.0 | 103 | 5680 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 21459.0 | 59 | 4816 | 6 | 1.1478e-03 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 39187.5 | 123 | 8928 | 7 | 1.1478e-03 | true | ok | NaN | first\_order |
| 8 | Ipopt | 593125.0 | 252 | 11536 | 5 | 1.1478e-03 | true | ok | NaN | first\_order |
| 8 | MadNLP | 271479.5 | 543 | 50384 | 5 | 1.1478e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 643478.5 | 1124 | 252240 | 106 | 1.1478e-03 | true | ok | NaN | StalledSuccess |
| 8 | NonlinearSolve (TrustRegion) | 227666.0 | 1212 | 2973152 | 11 | 1.1478e-03 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 8 | CaNNOLeS | 68145.5 | 182 | 62624 | 5 | 1.1478e-03 | true | ok | NaN | first\_order |
| 10 | SecondOrderOptimization (Dogleg) | 21229.0 | 34 | 5408 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | SecondOrderOptimization (LM) | 21208.0 | 32 | 5200 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | SecondOrderOptimization (Gauss-Newton) | 23875.0 | 29 | 4144 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | SecondOrderOptimization (LM, tall) | 33083.5 | 107 | 33168 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | LeastSquaresOptim (Dogleg) | 32333.5 | 121 | 271568 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 38041.5 | 117 | 271856 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 65625.0 | 179 | 42128 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | Optim (Newton) | 24541.0 | 103 | 6592 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | JSOSolvers (trunk) | 30354.0 | 59 | 5472 | 7 | 1.5727e-03 | true | ok | NaN | first\_order |
| 10 | JSOSolvers (tron) | 44458.5 | 123 | 9792 | 7 | 1.5727e-03 | true | ok | NaN | first\_order |
| 10 | Ipopt | 609104.0 | 252 | 11664 | 5 | 1.5727e-03 | true | ok | NaN | first\_order |
| 10 | MadNLP | 281687.5 | 543 | 53296 | 5 | 1.5727e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 955000.0 | 1133 | 357264 | 107 | 1.5727e-03 | true | ok | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 1.077333e6 | 3258 | 8412576 | 62 | 1.5727e-03 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 10 | CaNNOLeS | 104375.0 | 183 | 95424 | 5 | 1.5727e-03 | true | ok | NaN | first\_order |
| 12 | SecondOrderOptimization (Dogleg) | 31583.0 | 34 | 6736 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | SecondOrderOptimization (LM) | 32083.5 | 32 | 6496 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | SecondOrderOptimization (Gauss-Newton) | 35937.5 | 29 | 5056 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | SecondOrderOptimization (LM, tall) | 44083.0 | 108 | 43184 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | LeastSquaresOptim (Dogleg) | 45854.5 | 121 | 276288 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 45312.5 | 117 | 277072 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 93375.0 | 220 | 63632 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | Optim (Newton) | 28229.5 | 103 | 7424 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | JSOSolvers (trunk) | 34562.5 | 59 | 6128 | 6 | 2.2976e-03 | true | ok | NaN | first\_order |
| 12 | JSOSolvers (tron) | 54416.5 | 123 | 10640 | 7 | 2.2976e-03 | true | ok | NaN | first\_order |
| 12 | Ipopt | 630916.5 | 252 | 11792 | 5 | 2.2976e-03 | true | ok | NaN | first\_order |
| 12 | MadNLP | 293395.5 | 543 | 56704 | 5 | 2.2976e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 1.2181245e6 | 1133 | 465184 | 107 | 2.2976e-03 | true | ok | NaN | StalledSuccess |
| 12 | NonlinearSolve (TrustRegion) | 2.776666e6 | 7262 | 19548576 | 185 | 2.2976e-03 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 12 | CaNNOLeS | 143479.5 | 191 | 123440 | 5 | 2.2976e-03 | true | ok | NaN | first\_order |
| 14 | SecondOrderOptimization (Dogleg) | 47583.5 | 34 | 8400 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | SecondOrderOptimization (LM) | 47312.5 | 32 | 8128 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | SecondOrderOptimization (Gauss-Newton) | 54687.5 | 29 | 6192 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | SecondOrderOptimization (LM, tall) | 57333.0 | 108 | 55712 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | LeastSquaresOptim (Dogleg) | 65937.5 | 140 | 335680 | 6 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 59042.0 | 117 | 282208 | 5 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 120542.0 | 220 | 76832 | 5 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | Optim (Newton) | 35771.0 | 103 | 8320 | 5 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | JSOSolvers (trunk) | 40625.0 | 59 | 6592 | 6 | 2.5373e-03 | true | ok | NaN | first\_order |
| 14 | JSOSolvers (tron) | 64833.5 | 123 | 11264 | 7 | 2.5373e-03 | true | ok | NaN | first\_order |
| 14 | Ipopt | 643937.5 | 252 | 11920 | 5 | 2.5373e-03 | true | ok | NaN | first\_order |
| 14 | MadNLP | 302479.0 | 543 | 60768 | 5 | 2.5373e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 1.540563e6 | 1133 | 576816 | 107 | 2.5373e-03 | true | ok | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 666916.0 | 1498 | 4170560 | 9 | 2.5373e-03 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 14 | CaNNOLeS | 195792.0 | 191 | 163824 | 5 | 2.5373e-03 | true | ok | NaN | first\_order |
| 16 | SecondOrderOptimization (Dogleg) | 82083.0 | 34 | 10288 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | SecondOrderOptimization (LM) | 81958.5 | 32 | 9984 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | SecondOrderOptimization (Gauss-Newton) | 96479.5 | 29 | 7472 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | SecondOrderOptimization (LM, tall) | 70624.5 | 108 | 66144 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | LeastSquaresOptim (Dogleg) | 81583.5 | 140 | 343440 | 6 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 72145.5 | 117 | 289872 | 5 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 142395.5 | 244 | 94288 | 5 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | Optim (Newton) | 42000.0 | 105 | 9344 | 5 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | JSOSolvers (trunk) | 54187.5 | 59 | 7056 | 7 | 2.7881e-03 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (tron) | 76959.0 | 123 | 11888 | 7 | 2.7881e-03 | true | ok | NaN | first\_order |
| 16 | Ipopt | 654063.0 | 252 | 12048 | 5 | 2.7881e-03 | true | ok | NaN | first\_order |
| 16 | MadNLP | 314270.5 | 543 | 65296 | 5 | 2.7881e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 1.8037915e6 | 1347 | 694192 | 107 | 2.7881e-03 | true | ok | NaN | StalledSuccess |
| 16 | NonlinearSolve (TrustRegion) | 1.551583e6 | 2577 | 7466528 | 41 | 2.7881e-03 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 16 | CaNNOLeS | 250187.5 | 191 | 210064 | 5 | 2.7881e-03 | true | ok | NaN | first\_order |
