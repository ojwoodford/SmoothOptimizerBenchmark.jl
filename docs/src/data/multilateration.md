# Benchmark Results: Multilateration

- **Category**: small_dense
- **Scaling Metric**: Dimension d
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T01:42:31
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
| 2 | NLLSModel (Static) | 64.75541795665634 | 1 | 16 | 209.0 | 1 | 32 |
| 2 | Standalone | 69.12987012987013 | 1 | 16 | 224.90361445783134 | 1 | 32 |
| 3 | NLLSModel (Static) | 84.6140350877193 | 1 | 16 | 291.672131147541 | 1 | 32 |
| 3 | Standalone | 88.5 | 1 | 16 | 310.3134328358209 | 1 | 32 |
| 4 | NLLSModel (Static) | 126.54166666666667 | 1 | 16 | 552.918918918919 | 1 | 32 |
| 4 | Standalone | 103.79289940828403 | 1 | 16 | 369.05357142857144 | 1 | 32 |
| 5 | NLLSModel (Static) | 148.19886363636363 | 1 | 16 | 917.0 | 1 | 32 |
| 5 | Standalone | 119.64327485380117 | 1 | 16 | 449.06666666666666 | 1 | 32 |
| 6 | NLLSModel (Static) | 209.0 | 1 | 16 | 1196.0588235294117 | 1 | 32 |
| 6 | Standalone | 139.26174496644296 | 1 | 16 | 563.0540540540541 | 1 | 32 |
| 7 | NLLSModel (Static) | 203.16528925619835 | 1 | 16 | 1670.4545454545455 | 1 | 32 |
| 7 | Standalone | 159.99236641221373 | 1 | 16 | 760.0689655172414 | 1 | 32 |
| 8 | NLLSModel (Static) | 245.50980392156862 | 1 | 16 | 2203.125 | 1 | 32 |
| 8 | Standalone | 146.91558441558442 | 1 | 16 | 689.1153846153846 | 1 | 32 |
| 10 | NLLSModel (Static) | 292.2236842105263 | 1 | 16 | 4562.5 | 1 | 32 |
| 10 | Standalone | 193.08035714285714 | 1 | 16 | 1083.3684210526317 | 1 | 32 |
| 12 | NLLSModel (Static) | 404.5208333333333 | 1 | 16 | 10500.0 | 1 | 32 |
| 12 | Standalone | 252.39080459770116 | 1 | 16 | 1352.8 | 1 | 32 |
| 14 | NLLSModel (Static) | 493.3636363636364 | 1 | 16 | 10000.0 | 1 | 32 |
| 14 | Standalone | 319.43939393939394 | 1 | 16 | 1924.2727272727273 | 1 | 32 |
| 16 | NLLSModel (Static) | 618.0666666666667 | 1 | 16 | 8417.0 | 1 | 32 |
| 16 | Standalone | 363.3157894736842 | 1 | 16 | 2287.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 2708.0 | 34 | 1984 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | SecondOrderOptimization (LM) | 2750.0 | 32 | 1904 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | SecondOrderOptimization (LM, tall) | 8167.0 | 116 | 8080 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | LeastSquaresOptim (Dogleg) | 6792.0 | 115 | 254608 | 5 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 6417.0 | 111 | 254480 | 5 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 12520.5 | 177 | 10016 | 4 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 9646.0 | 90 | 3232 | 4 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 6416.0 | 59 | 3136 | 4 | 9.7541e-04 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 16625.0 | 123 | 6720 | 6 | 9.7541e-04 | true | ok | NaN | first\_order |
| 2 | Ipopt | 530645.5 | 215 | 9472 | 4 | 9.7541e-04 | true | ok | NaN | first\_order |
| 2 | MadNLP | 262124.5 | 543 | 44656 | 4 | 9.7541e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 190458.5 | 1120 | 71328 | 106 | 9.7541e-04 | true | ok | NaN | StalledSuccess |
| 2 | NonlinearSolve (TrustRegion) | 85167.0 | 1303 | 3260656 | 9 | 9.7541e-04 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 2 | CaNNOLeS | 12791.5 | 166 | 12656 | 4 | 9.7541e-04 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 3770.5 | 34 | 2144 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | SecondOrderOptimization (LM) | 3875.0 | 32 | 2064 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | SecondOrderOptimization (LM, tall) | 10395.5 | 116 | 9312 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | LeastSquaresOptim (Dogleg) | 8375.0 | 115 | 256320 | 5 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 9416.0 | 129 | 307152 | 6 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 18937.5 | 174 | 12448 | 5 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 12167.0 | 103 | 3568 | 5 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 9583.0 | 59 | 3328 | 5 | 5.8709e-04 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 23562.5 | 123 | 6944 | 7 | 5.8709e-04 | true | ok | NaN | first\_order |
| 3 | Ipopt | 587104.0 | 245 | 10720 | 5 | 5.8709e-04 | true | ok | NaN | first\_order |
| 3 | MadNLP | 282625.0 | 543 | 45056 | 5 | 5.8709e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 260395.5 | 1138 | 87344 | 108 | 5.8709e-04 | true | ok | NaN | StalledSuccess |
| 3 | NonlinearSolve (TrustRegion) | 233875.0 | 2783 | 7098016 | 57 | 5.8709e-04 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 3 | CaNNOLeS | 18583.5 | 166 | 17488 | 5 | 5.8709e-04 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 5083.0 | 34 | 2544 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | SecondOrderOptimization (LM) | 5375.0 | 32 | 2432 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | SecondOrderOptimization (LM, tall) | 12958.0 | 101 | 11872 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | LeastSquaresOptim (Dogleg) | 10458.5 | 115 | 258528 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 10084.0 | 111 | 258480 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 26041.5 | 215 | 18512 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 12875.0 | 103 | 3824 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 11979.0 | 59 | 3696 | 5 | 7.3068e-04 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (tron) | 23958.0 | 123 | 7456 | 6 | 7.3068e-04 | true | ok | NaN | first\_order |
| 4 | Ipopt | 624625.0 | 245 | 10800 | 5 | 7.3068e-04 | true | ok | NaN | first\_order |
| 4 | MadNLP | 305583.5 | 543 | 45904 | 5 | 7.3068e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 333937.5 | 1120 | 114672 | 106 | 7.3068e-04 | true | ok | NaN | StalledSuccess |
| 4 | NonlinearSolve (TrustRegion) | 113083.0 | 1103 | 2812512 | 17 | 7.3068e-04 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 4 | CaNNOLeS | 24187.5 | 166 | 24080 | 5 | 7.3068e-04 | true | ok | NaN | first\_order |
| 5 | SecondOrderOptimization (Dogleg) | 6875.0 | 34 | 2800 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM) | 6979.5 | 32 | 2688 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM, tall) | 16021.0 | 101 | 14464 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | LeastSquaresOptim (Dogleg) | 13271.0 | 115 | 260656 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 13000.0 | 111 | 260672 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 33687.5 | 215 | 21888 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | Optim (Newton) | 14500.0 | 103 | 3952 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | JSOSolvers (trunk) | 16542.0 | 59 | 3888 | 6 | 5.3926e-04 | true | ok | NaN | first\_order |
| 5 | JSOSolvers (tron) | 26104.0 | 123 | 7680 | 6 | 5.3926e-04 | true | ok | NaN | first\_order |
| 5 | Ipopt | 632479.0 | 245 | 10800 | 5 | 5.3926e-04 | true | ok | NaN | first\_order |
| 5 | MadNLP | 319958.0 | 543 | 46704 | 5 | 5.3926e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 425166.5 | 1120 | 136880 | 106 | 5.3926e-04 | true | ok | NaN | StalledSuccess |
| 5 | NonlinearSolve (TrustRegion) | 154292.0 | 1043 | 2693536 | 11 | 5.3926e-04 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 5 | CaNNOLeS | 31771.0 | 166 | 31856 | 5 | 5.3926e-04 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 8750.0 | 34 | 3312 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | SecondOrderOptimization (LM) | 8666.5 | 32 | 3168 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | SecondOrderOptimization (LM, tall) | 18750.0 | 101 | 17440 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | LeastSquaresOptim (Dogleg) | 15750.0 | 115 | 262528 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 16916.5 | 111 | 262576 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 34708.5 | 174 | 22512 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 15458.0 | 103 | 4304 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 17729.0 | 59 | 4256 | 6 | 5.4518e-04 | true | ok | NaN | first\_order |
| 6 | JSOSolvers (tron) | 33833.5 | 123 | 8192 | 7 | 5.4518e-04 | true | ok | NaN | first\_order |
| 6 | Ipopt | 595396.0 | 245 | 10880 | 5 | 5.4518e-04 | true | ok | NaN | first\_order |
| 6 | MadNLP | 291125.5 | 543 | 47808 | 5 | 5.4518e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 511062.5 | 1120 | 176288 | 106 | 5.4518e-04 | true | ok | NaN | StalledSuccess |
| 6 | NonlinearSolve (TrustRegion) | 333958.0 | 1963 | 5186656 | 30 | 5.4518e-04 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 6 | CaNNOLeS | 41479.0 | 166 | 41168 | 5 | 5.4518e-04 | true | ok | NaN | first\_order |
| 7 | SecondOrderOptimization (Dogleg) | 9708.0 | 34 | 3648 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | SecondOrderOptimization (LM) | 9791.5 | 32 | 3504 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | SecondOrderOptimization (LM, tall) | 19833.0 | 102 | 20224 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | LeastSquaresOptim (Dogleg) | 19500.0 | 120 | 265888 | 5 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | LeastSquaresOptim (LM) | 19458.5 | 116 | 266096 | 5 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | Optim (NewtonTrustRegion) | 37229.0 | 187 | 27280 | 4 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | Optim (Newton) | 14583.5 | 90 | 4256 | 4 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | JSOSolvers (trunk) | 19458.5 | 59 | 4448 | 6 | 9.4639e-04 | true | ok | NaN | first\_order |
| 7 | JSOSolvers (tron) | 38104.0 | 123 | 8416 | 7 | 9.4639e-04 | true | ok | NaN | first\_order |
| 7 | Ipopt | 565354.0 | 215 | 9632 | 4 | 9.4639e-04 | true | ok | NaN | first\_order |
| 7 | MadNLP | 304000.0 | 543 | 48896 | 4 | 9.4639e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 7 | NonlinearSolve (LM) | 608875.5 | 1120 | 209104 | 106 | 9.4639e-04 | true | ok | NaN | StalledSuccess |
| 7 | NonlinearSolve (TrustRegion) | 672542.0 | 3782 | 9746832 | 86 | 9.4639e-04 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 7 | CaNNOLeS | 46083.0 | 166 | 51632 | 4 | 9.4639e-04 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 14437.5 | 34 | 4288 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | SecondOrderOptimization (LM) | 15000.0 | 32 | 4112 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | SecondOrderOptimization (LM, tall) | 27000.0 | 107 | 23856 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | LeastSquaresOptim (Dogleg) | 21145.5 | 121 | 266736 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 21479.5 | 117 | 267056 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 48229.5 | 179 | 31712 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 16750.0 | 103 | 4848 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 17895.5 | 59 | 4816 | 6 | 1.1478e-03 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 33875.0 | 123 | 8928 | 7 | 1.1478e-03 | true | ok | NaN | first\_order |
| 8 | Ipopt | 596208.5 | 245 | 10960 | 5 | 1.1478e-03 | true | ok | NaN | first\_order |
| 8 | MadNLP | 296271.0 | 543 | 50384 | 5 | 1.1478e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 671354.0 | 1124 | 249136 | 106 | 1.1478e-03 | true | ok | NaN | StalledSuccess |
| 8 | NonlinearSolve (TrustRegion) | 416000.0 | 2136 | 5281888 | 28 | 1.1478e-03 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 8 | CaNNOLeS | 66291.5 | 182 | 62624 | 5 | 1.1478e-03 | true | ok | NaN | first\_order |
| 10 | SecondOrderOptimization (Dogleg) | 27083.5 | 34 | 5408 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | SecondOrderOptimization (LM) | 27187.5 | 32 | 5200 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | SecondOrderOptimization (LM, tall) | 39750.0 | 107 | 33168 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | LeastSquaresOptim (Dogleg) | 28521.0 | 121 | 271456 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 28708.0 | 117 | 271744 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 62292.0 | 179 | 41456 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | Optim (Newton) | 19895.5 | 103 | 5760 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | JSOSolvers (trunk) | 24542.0 | 59 | 5472 | 7 | 1.5727e-03 | true | ok | NaN | first\_order |
| 10 | JSOSolvers (tron) | 38250.0 | 123 | 9792 | 7 | 1.5727e-03 | true | ok | NaN | first\_order |
| 10 | Ipopt | 599895.5 | 245 | 11040 | 5 | 1.5727e-03 | true | ok | NaN | first\_order |
| 10 | MadNLP | 299520.5 | 543 | 53296 | 5 | 1.5727e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 924979.0 | 1142 | 357184 | 108 | 1.5727e-03 | true | ok | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 3.2055e7 | 3104 | 8012032 | 58 | 1.5727e-03 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 10 | CaNNOLeS | 96646.0 | 183 | 95424 | 5 | 1.5727e-03 | true | ok | NaN | first\_order |
| 12 | SecondOrderOptimization (Dogleg) | 56520.5 | 34 | 6736 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | SecondOrderOptimization (LM) | 56583.5 | 32 | 6496 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | SecondOrderOptimization (LM, tall) | 56271.0 | 108 | 43216 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | LeastSquaresOptim (Dogleg) | 38542.0 | 121 | 276176 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 41167.0 | 117 | 276960 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 87875.0 | 220 | 62960 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | Optim (Newton) | 24208.0 | 103 | 6592 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | JSOSolvers (trunk) | 29146.0 | 59 | 6128 | 6 | 2.2976e-03 | true | ok | NaN | first\_order |
| 12 | JSOSolvers (tron) | 47875.0 | 123 | 10640 | 7 | 2.2976e-03 | true | ok | NaN | first\_order |
| 12 | Ipopt | 632791.5 | 245 | 11120 | 5 | 2.2976e-03 | true | ok | NaN | first\_order |
| 12 | MadNLP | 317458.5 | 543 | 56704 | 5 | 2.2976e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 1.200187e6 | 1133 | 462080 | 107 | 2.2976e-03 | true | ok | NaN | StalledSuccess |
| 12 | NonlinearSolve (TrustRegion) | 1.961583e6 | 5458 | 14678176 | 128 | 2.2976e-03 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 12 | CaNNOLeS | 140479.0 | 191 | 123440 | 5 | 2.2976e-03 | true | ok | NaN | first\_order |
| 14 | SecondOrderOptimization (Dogleg) | 58041.5 | 56 | 11152 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | SecondOrderOptimization (LM) | 58292.0 | 54 | 10880 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | SecondOrderOptimization (LM, tall) | 73646.0 | 108 | 55776 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | LeastSquaresOptim (Dogleg) | 56541.5 | 140 | 335568 | 6 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 56083.5 | 117 | 282096 | 5 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 109437.5 | 220 | 76160 | 5 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | Optim (Newton) | 29562.5 | 103 | 7488 | 5 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | JSOSolvers (trunk) | 33750.0 | 59 | 6592 | 6 | 2.5373e-03 | true | ok | NaN | first\_order |
| 14 | JSOSolvers (tron) | 56958.5 | 123 | 11264 | 7 | 2.5373e-03 | true | ok | NaN | first\_order |
| 14 | Ipopt | 650375.0 | 245 | 11200 | 5 | 2.5373e-03 | true | ok | NaN | first\_order |
| 14 | MadNLP | 333042.0 | 543 | 60768 | 5 | 2.5373e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 1.585104e6 | 1151 | 583536 | 109 | 2.5373e-03 | true | ok | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 1.614708e6 | 3654 | 10254144 | 75 | 2.5373e-03 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 14 | CaNNOLeS | 193062.5 | 191 | 163824 | 5 | 2.5373e-03 | true | ok | NaN | first\_order |
| 16 | SecondOrderOptimization (Dogleg) | 51500.0 | 60 | 18416 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | SecondOrderOptimization (LM) | 62083.5 | 58 | 18112 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | SecondOrderOptimization (LM, tall) | 93021.0 | 108 | 66208 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | LeastSquaresOptim (Dogleg) | 75792.0 | 140 | 343328 | 6 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 67270.5 | 117 | 289760 | 5 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 152062.5 | 244 | 93616 | 5 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | Optim (Newton) | 34812.5 | 105 | 8512 | 5 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | JSOSolvers (trunk) | 45250.0 | 59 | 7056 | 7 | 2.7881e-03 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (tron) | 67458.0 | 123 | 11888 | 7 | 2.7881e-03 | true | ok | NaN | first\_order |
| 16 | Ipopt | 688667.0 | 245 | 11280 | 5 | 2.7881e-03 | true | ok | NaN | first\_order |
| 16 | MadNLP | 346854.0 | 543 | 65296 | 5 | 2.7881e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 1.8377915e6 | 1347 | 691088 | 107 | 2.7881e-03 | true | ok | NaN | StalledSuccess |
| 16 | NonlinearSolve (TrustRegion) | 1.436459e6 | 2533 | 7337760 | 40 | 2.7881e-03 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 16 | CaNNOLeS | 255083.0 | 191 | 210064 | 5 | 2.7881e-03 | true | ok | NaN | first\_order |
