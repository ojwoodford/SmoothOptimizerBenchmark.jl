# Benchmark Results: Multilateration

- **Category**: small_dense
- **Scaling Metric**: Dimension d
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T02:31:39
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
| 2 | NLLSModel (Static) | 64.15929203539822 | 1 | 16 | 185.86274509803923 | 1 | 32 |
| 2 | Standalone | 70.8896103896104 | 1 | 16 | 224.07777777777778 | 1 | 32 |
| 3 | NLLSModel (Static) | 76.93258426966293 | 1 | 16 | 296.5072463768116 | 1 | 32 |
| 3 | Standalone | 91.62962962962963 | 1 | 16 | 289.5833333333333 | 1 | 32 |
| 4 | NLLSModel (Static) | 90.3409090909091 | 1 | 16 | 552.6315789473684 | 1 | 32 |
| 4 | Standalone | 103.26794258373205 | 1 | 16 | 352.3333333333333 | 1 | 32 |
| 5 | NLLSModel (Static) | 117.81379310344828 | 1 | 16 | 871.5416666666666 | 1 | 32 |
| 5 | Standalone | 120.85964912280701 | 1 | 16 | 476.8666666666667 | 1 | 32 |
| 6 | NLLSModel (Static) | 137.7207792207792 | 1 | 16 | 1227.9411764705883 | 1 | 32 |
| 6 | Standalone | 149.47552447552448 | 1 | 16 | 626.2 | 1 | 32 |
| 7 | NLLSModel (Static) | 163.56198347107437 | 1 | 16 | 1715.25 | 1 | 32 |
| 7 | Standalone | 163.51260504201682 | 1 | 16 | 721.7142857142857 | 1 | 32 |
| 8 | NLLSModel (Static) | 196.93396226415095 | 1 | 16 | 2236.1111111111113 | 1 | 32 |
| 8 | Standalone | 130.5379746835443 | 1 | 16 | 711.2068965517242 | 1 | 32 |
| 10 | NLLSModel (Static) | 269.1842105263158 | 1 | 16 | 4683.4 | 1 | 32 |
| 10 | Standalone | 182.66071428571428 | 1 | 16 | 1035.4 | 1 | 32 |
| 12 | NLLSModel (Static) | 357.14285714285717 | 1 | 16 | 10708.0 | 1 | 32 |
| 12 | Standalone | 242.1875 | 1 | 16 | 1455.5333333333333 | 1 | 32 |
| 14 | NLLSModel (Static) | 464.2857142857143 | 1 | 16 | 17917.0 | 1 | 32 |
| 14 | Standalone | 335.9076923076923 | 1 | 16 | 1962.5 | 1 | 32 |
| 16 | NLLSModel (Static) | 603.5714285714286 | 1 | 16 | 28584.0 | 1 | 32 |
| 16 | Standalone | 347.48214285714283 | 1 | 16 | 2324.1111111111113 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 2709.0 | 34 | 1984 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | SecondOrderOptimization (LM) | 2791.0 | 32 | 1904 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | SecondOrderOptimization (LM, tall) | 8375.0 | 116 | 8080 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | LeastSquaresOptim (Dogleg) | 6812.5 | 115 | 254608 | 5 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 6333.5 | 111 | 254480 | 5 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 13041.5 | 177 | 10016 | 4 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 9938.0 | 90 | 3232 | 4 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 6541.0 | 59 | 3136 | 4 | 9.7541e-04 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 17459.0 | 123 | 6720 | 6 | 9.7541e-04 | true | ok | NaN | first\_order |
| 2 | Ipopt | 533021.5 | 215 | 9472 | 4 | 9.7541e-04 | true | ok | NaN | first\_order |
| 2 | MadNLP | 266958.5 | 543 | 44656 | 4 | 9.7541e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 192688.0 | 1120 | 71328 | 106 | 9.7541e-04 | true | ok | NaN | StalledSuccess |
| 2 | NonlinearSolve (TrustRegion) | 88916.0 | 1303 | 3260656 | 9 | 9.7541e-04 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 2 | CaNNOLeS | 13333.5 | 166 | 12656 | 4 | 9.7541e-04 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 3750.0 | 34 | 2144 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | SecondOrderOptimization (LM) | 3958.0 | 32 | 2064 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | SecondOrderOptimization (LM, tall) | 10562.5 | 116 | 9312 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | LeastSquaresOptim (Dogleg) | 8604.5 | 115 | 256320 | 5 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 9708.5 | 129 | 307152 | 6 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 19854.0 | 174 | 12448 | 5 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 12708.0 | 103 | 3568 | 5 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 9958.0 | 59 | 3328 | 5 | 5.8709e-04 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 24292.0 | 123 | 6944 | 7 | 5.8709e-04 | true | ok | NaN | first\_order |
| 3 | Ipopt | 590187.5 | 245 | 10720 | 5 | 5.8709e-04 | true | ok | NaN | first\_order |
| 3 | MadNLP | 286792.0 | 543 | 45056 | 5 | 5.8709e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 261562.5 | 1138 | 87344 | 108 | 5.8709e-04 | true | ok | NaN | StalledSuccess |
| 3 | NonlinearSolve (TrustRegion) | 212167.0 | 2783 | 7098016 | 57 | 5.8709e-04 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 3 | CaNNOLeS | 19000.0 | 166 | 17488 | 5 | 5.8709e-04 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 5375.0 | 34 | 2544 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | SecondOrderOptimization (LM) | 5375.0 | 32 | 2432 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | SecondOrderOptimization (LM, tall) | 13542.0 | 101 | 11872 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | LeastSquaresOptim (Dogleg) | 10333.5 | 115 | 258528 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 13646.0 | 111 | 258480 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 26917.0 | 215 | 18512 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 13625.0 | 103 | 3824 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 12000.0 | 59 | 3696 | 5 | 7.3068e-04 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (tron) | 24916.5 | 123 | 7456 | 6 | 7.3068e-04 | true | ok | NaN | first\_order |
| 4 | Ipopt | 611917.0 | 245 | 10800 | 5 | 7.3068e-04 | true | ok | NaN | first\_order |
| 4 | MadNLP | 286833.0 | 543 | 45904 | 5 | 7.3068e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 330104.5 | 1120 | 114672 | 106 | 7.3068e-04 | true | ok | NaN | StalledSuccess |
| 4 | NonlinearSolve (TrustRegion) | 119292.0 | 1103 | 2812512 | 17 | 7.3068e-04 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 4 | CaNNOLeS | 25250.0 | 166 | 24080 | 5 | 7.3068e-04 | true | ok | NaN | first\_order |
| 5 | SecondOrderOptimization (Dogleg) | 6917.0 | 34 | 2800 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM) | 7000.0 | 32 | 2688 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM, tall) | 15979.5 | 101 | 14464 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | LeastSquaresOptim (Dogleg) | 13062.5 | 115 | 260656 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 12833.5 | 111 | 260672 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 31917.0 | 215 | 21888 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | Optim (Newton) | 14875.0 | 103 | 3952 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | JSOSolvers (trunk) | 16458.0 | 59 | 3888 | 6 | 5.3926e-04 | true | ok | NaN | first\_order |
| 5 | JSOSolvers (tron) | 26750.0 | 123 | 7680 | 6 | 5.3926e-04 | true | ok | NaN | first\_order |
| 5 | Ipopt | 608520.5 | 245 | 10800 | 5 | 5.3926e-04 | true | ok | NaN | first\_order |
| 5 | MadNLP | 310021.0 | 543 | 46704 | 5 | 5.3926e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 409479.5 | 1120 | 136880 | 106 | 5.3926e-04 | true | ok | NaN | StalledSuccess |
| 5 | NonlinearSolve (TrustRegion) | 138042.0 | 1043 | 2693536 | 11 | 5.3926e-04 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 5 | CaNNOLeS | 32333.0 | 166 | 31856 | 5 | 5.3926e-04 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 8937.5 | 34 | 3312 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | SecondOrderOptimization (LM) | 8958.0 | 32 | 3168 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | SecondOrderOptimization (LM, tall) | 22313.0 | 101 | 17440 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | LeastSquaresOptim (Dogleg) | 17479.0 | 115 | 262528 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 19375.5 | 111 | 262576 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 36166.5 | 174 | 22512 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 16500.0 | 103 | 4304 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 18833.5 | 59 | 4256 | 6 | 5.4518e-04 | true | ok | NaN | first\_order |
| 6 | JSOSolvers (tron) | 36125.0 | 123 | 8192 | 7 | 5.4518e-04 | true | ok | NaN | first\_order |
| 6 | Ipopt | 606125.0 | 245 | 10880 | 5 | 5.4518e-04 | true | ok | NaN | first\_order |
| 6 | MadNLP | 286916.5 | 543 | 47808 | 5 | 5.4518e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 498354.5 | 1120 | 176288 | 106 | 5.4518e-04 | true | ok | NaN | StalledSuccess |
| 6 | NonlinearSolve (TrustRegion) | 341834.0 | 1963 | 5186656 | 30 | 5.4518e-04 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 6 | CaNNOLeS | 41541.5 | 166 | 41168 | 5 | 5.4518e-04 | true | ok | NaN | first\_order |
| 7 | SecondOrderOptimization (Dogleg) | 10020.5 | 34 | 3648 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | SecondOrderOptimization (LM) | 10041.5 | 32 | 3504 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | SecondOrderOptimization (LM, tall) | 20125.0 | 102 | 20224 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | LeastSquaresOptim (Dogleg) | 22000.0 | 120 | 265888 | 5 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | LeastSquaresOptim (LM) | 21958.5 | 116 | 266096 | 5 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | Optim (NewtonTrustRegion) | 35937.5 | 187 | 27280 | 4 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | Optim (Newton) | 14500.0 | 90 | 4256 | 4 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | JSOSolvers (trunk) | 18583.5 | 59 | 4448 | 6 | 9.4639e-04 | true | ok | NaN | first\_order |
| 7 | JSOSolvers (tron) | 36354.5 | 123 | 8416 | 7 | 9.4639e-04 | true | ok | NaN | first\_order |
| 7 | Ipopt | 538521.0 | 215 | 9632 | 4 | 9.4639e-04 | true | ok | NaN | first\_order |
| 7 | MadNLP | 274396.0 | 543 | 48896 | 4 | 9.4639e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 7 | NonlinearSolve (LM) | 587771.0 | 1120 | 209104 | 106 | 9.4639e-04 | true | ok | NaN | StalledSuccess |
| 7 | NonlinearSolve (TrustRegion) | 790542.0 | 3782 | 9746832 | 86 | 9.4639e-04 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 7 | CaNNOLeS | 45104.0 | 166 | 51632 | 4 | 9.4639e-04 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 14708.0 | 34 | 4288 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | SecondOrderOptimization (LM) | 14667.0 | 32 | 4112 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | SecondOrderOptimization (LM, tall) | 27062.5 | 107 | 23856 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | LeastSquaresOptim (Dogleg) | 25666.5 | 121 | 266736 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 26583.0 | 117 | 267056 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 47645.5 | 179 | 31712 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 17313.0 | 103 | 4848 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 18312.5 | 59 | 4816 | 6 | 1.1478e-03 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 34583.0 | 123 | 8928 | 7 | 1.1478e-03 | true | ok | NaN | first\_order |
| 8 | Ipopt | 621562.0 | 245 | 10960 | 5 | 1.1478e-03 | true | ok | NaN | first\_order |
| 8 | MadNLP | 293833.0 | 543 | 50384 | 5 | 1.1478e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 681062.5 | 1124 | 249136 | 106 | 1.1478e-03 | true | ok | NaN | StalledSuccess |
| 8 | NonlinearSolve (TrustRegion) | 501375.0 | 2136 | 5281888 | 28 | 1.1478e-03 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 8 | CaNNOLeS | 65708.5 | 182 | 62624 | 5 | 1.1478e-03 | true | ok | NaN | first\_order |
| 10 | SecondOrderOptimization (Dogleg) | 27541.5 | 34 | 5408 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | SecondOrderOptimization (LM) | 27584.0 | 32 | 5200 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | SecondOrderOptimization (LM, tall) | 40271.0 | 107 | 33168 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | LeastSquaresOptim (Dogleg) | 30854.0 | 121 | 271456 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 32854.0 | 117 | 271744 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 63500.0 | 179 | 41456 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | Optim (Newton) | 20958.0 | 103 | 5760 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | JSOSolvers (trunk) | 25104.5 | 59 | 5472 | 7 | 1.5727e-03 | true | ok | NaN | first\_order |
| 10 | JSOSolvers (tron) | 39292.0 | 123 | 9792 | 7 | 1.5727e-03 | true | ok | NaN | first\_order |
| 10 | Ipopt | 629333.0 | 245 | 11040 | 5 | 1.5727e-03 | true | ok | NaN | first\_order |
| 10 | MadNLP | 303541.5 | 543 | 53296 | 5 | 1.5727e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 942208.5 | 1142 | 357184 | 108 | 1.5727e-03 | true | ok | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 787291.0 | 3104 | 8012032 | 58 | 1.5727e-03 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 10 | CaNNOLeS | 99166.5 | 183 | 95424 | 5 | 1.5727e-03 | true | ok | NaN | first\_order |
| 12 | SecondOrderOptimization (Dogleg) | 58437.5 | 34 | 6736 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | SecondOrderOptimization (LM) | 58417.0 | 32 | 6496 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | SecondOrderOptimization (LM, tall) | 71437.5 | 108 | 43184 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | LeastSquaresOptim (Dogleg) | 38437.5 | 121 | 276176 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 41937.5 | 117 | 276960 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 91604.5 | 220 | 62960 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | Optim (Newton) | 25208.5 | 103 | 6592 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | JSOSolvers (trunk) | 30333.5 | 59 | 6128 | 6 | 2.2976e-03 | true | ok | NaN | first\_order |
| 12 | JSOSolvers (tron) | 49562.5 | 123 | 10640 | 7 | 2.2976e-03 | true | ok | NaN | first\_order |
| 12 | Ipopt | 664833.0 | 245 | 11120 | 5 | 2.2976e-03 | true | ok | NaN | first\_order |
| 12 | MadNLP | 337854.0 | 543 | 56704 | 5 | 2.2976e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 1.2286245e6 | 1133 | 462080 | 107 | 2.2976e-03 | true | ok | NaN | StalledSuccess |
| 12 | NonlinearSolve (TrustRegion) | 1.977708e6 | 5458 | 14678176 | 128 | 2.2976e-03 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 12 | CaNNOLeS | 135854.0 | 191 | 123440 | 5 | 2.2976e-03 | true | ok | NaN | first\_order |
| 14 | SecondOrderOptimization (Dogleg) | 92583.5 | 34 | 8400 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | SecondOrderOptimization (LM) | 89812.5 | 32 | 8128 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | SecondOrderOptimization (LM, tall) | 101063.0 | 108 | 55712 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | LeastSquaresOptim (Dogleg) | 57042.0 | 140 | 335568 | 6 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 51333.0 | 117 | 282096 | 5 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 115437.5 | 220 | 76160 | 5 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | Optim (Newton) | 29854.0 | 103 | 7488 | 5 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | JSOSolvers (trunk) | 33270.5 | 59 | 6592 | 6 | 2.5373e-03 | true | ok | NaN | first\_order |
| 14 | JSOSolvers (tron) | 54833.5 | 123 | 11264 | 7 | 2.5373e-03 | true | ok | NaN | first\_order |
| 14 | Ipopt | 650208.5 | 245 | 11200 | 5 | 2.5373e-03 | true | ok | NaN | first\_order |
| 14 | MadNLP | 316458.5 | 543 | 60768 | 5 | 2.5373e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 1.58525e6 | 1151 | 583536 | 109 | 2.5373e-03 | true | ok | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 1.63275e6 | 3654 | 10254144 | 75 | 2.5373e-03 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 14 | CaNNOLeS | 196666.5 | 191 | 163824 | 5 | 2.5373e-03 | true | ok | NaN | first\_order |
| 16 | SecondOrderOptimization (Dogleg) | 145979.5 | 34 | 10288 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | SecondOrderOptimization (LM) | 151000.0 | 32 | 9984 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | SecondOrderOptimization (LM, tall) | 136146.0 | 108 | 66144 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | LeastSquaresOptim (Dogleg) | 71937.5 | 140 | 343328 | 6 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 63375.0 | 117 | 289760 | 5 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 136292.0 | 244 | 93616 | 5 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | Optim (Newton) | 34333.0 | 105 | 8512 | 5 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | JSOSolvers (trunk) | 43021.0 | 59 | 7056 | 7 | 2.7881e-03 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (tron) | 64271.0 | 123 | 11888 | 7 | 2.7881e-03 | true | ok | NaN | first\_order |
| 16 | Ipopt | 661146.0 | 245 | 11280 | 5 | 2.7881e-03 | true | ok | NaN | first\_order |
| 16 | MadNLP | 354479.0 | 543 | 65296 | 5 | 2.7881e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 1.7870415e6 | 1347 | 691088 | 107 | 2.7881e-03 | true | ok | NaN | StalledSuccess |
| 16 | NonlinearSolve (TrustRegion) | 1.456458e6 | 2533 | 7337760 | 40 | 2.7881e-03 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 16 | CaNNOLeS | 253500.0 | 191 | 210064 | 5 | 2.7881e-03 | true | ok | NaN | first\_order |
