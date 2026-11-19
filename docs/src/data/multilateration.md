# Benchmark Results: Multilateration

- **Category**: small_dense
- **Scaling Metric**: Dimension d
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T01:28:55
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
| 2 | NLLSModel (Static) | 64.11145510835914 | 1 | 16 | 162.0735294117647 | 1 | 32 |
| 2 | Standalone | 73.10454545454546 | 1 | 16 | 291.672131147541 | 1 | 32 |
| 3 | NLLSModel (Static) | 85.88129496402878 | 1 | 16 | 258.44303797468353 | 1 | 32 |
| 3 | Standalone | 87.4 | 1 | 16 | 431.3333333333333 | 1 | 32 |
| 4 | NLLSModel (Static) | 146.96818181818182 | 1 | 16 | 442.3829787234043 | 1 | 32 |
| 4 | Standalone | 127.97857142857143 | 1 | 16 | 508.53846153846155 | 1 | 32 |
| 5 | NLLSModel (Static) | 158.62573099415204 | 1 | 16 | 708.3225806451613 | 1 | 32 |
| 5 | Standalone | 154.86725663716814 | 1 | 16 | 634.7 | 1 | 32 |
| 6 | NLLSModel (Static) | 209.0 | 1 | 16 | 967.8181818181819 | 1 | 32 |
| 6 | Standalone | 183.41176470588235 | 1 | 16 | 777.2307692307693 | 1 | 32 |
| 7 | NLLSModel (Static) | 191.1764705882353 | 1 | 16 | 1292.0 | 1 | 32 |
| 7 | Standalone | 218.6235294117647 | 1 | 16 | 968.75 | 1 | 32 |
| 8 | NLLSModel (Static) | 223.3009708737864 | 1 | 16 | 1791.0 | 1 | 32 |
| 8 | Standalone | 247.81578947368422 | 1 | 16 | 1167.0 | 1 | 32 |
| 10 | NLLSModel (Static) | 302.63157894736844 | 1 | 16 | 3576.5 | 1 | 32 |
| 10 | Standalone | 417.0 | 1 | 16 | 1615.7777777777778 | 1 | 32 |
| 12 | NLLSModel (Static) | 387.1272727272727 | 1 | 16 | 5584.0 | 1 | 32 |
| 12 | Standalone | 438.82978723404256 | 1 | 16 | 2334.0 | 1 | 32 |
| 14 | NLLSModel (Static) | 500.0 | 1 | 16 | 5750.0 | 1 | 32 |
| 14 | Standalone | 560.8108108108108 | 1 | 16 | 2803.5714285714284 | 1 | 32 |
| 16 | NLLSModel (Static) | 628.5714285714286 | 1 | 16 | 7917.0 | 1 | 32 |
| 16 | Standalone | 668.1034482758621 | 1 | 16 | 3597.1666666666665 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 2 | SecondOrderOptimization (Dogleg) | 2667.0 | 34 | 1984 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | SecondOrderOptimization (LM) | 2875.0 | 32 | 1904 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | SecondOrderOptimization (Gauss-Newton) | 2666.0 | 29 | 1744 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | SecondOrderOptimization (LM, tall) | 8021.0 | 116 | 8080 | 4 | 9.7541e-04 | true | ok | NaN | rel\_dcost |
| 2 | LeastSquaresOptim (Dogleg) | 7604.0 | 115 | 254720 | 5 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 7104.5 | 111 | 254592 | 5 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 13813.0 | 177 | 10576 | 4 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 10792.0 | 90 | 3920 | 4 | 9.7541e-04 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 7041.0 | 59 | 3136 | 4 | 9.7541e-04 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 17833.5 | 123 | 6720 | 6 | 9.7541e-04 | true | ok | NaN | first\_order |
| 2 | Ipopt | 531250.0 | 222 | 9904 | 4 | 9.7541e-04 | true | ok | NaN | first\_order |
| 2 | MadNLP | 253708.0 | 543 | 44656 | 4 | 9.7541e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 180750.0 | 1120 | 74432 | 106 | 9.7541e-04 | true | ok | NaN | StalledSuccess |
| 2 | NonlinearSolve (TrustRegion) | 96333.0 | 1303 | 3260912 | 9 | 9.7541e-04 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 2 | CaNNOLeS | 13625.0 | 166 | 12656 | 4 | 9.7541e-04 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 3667.0 | 34 | 2144 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | SecondOrderOptimization (LM) | 3708.5 | 32 | 2064 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | SecondOrderOptimization (Gauss-Newton) | 3625.0 | 29 | 1856 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | SecondOrderOptimization (LM, tall) | 10208.0 | 116 | 9312 | 5 | 5.8709e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 3 | LeastSquaresOptim (Dogleg) | 9417.0 | 115 | 256432 | 5 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 10583.0 | 129 | 307264 | 6 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 21875.0 | 174 | 13120 | 5 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 14020.5 | 103 | 4400 | 5 | 5.8709e-04 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 10937.5 | 59 | 3328 | 5 | 5.8709e-04 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 26458.5 | 123 | 6944 | 7 | 5.8709e-04 | true | ok | NaN | first\_order |
| 3 | Ipopt | 584437.5 | 252 | 11152 | 5 | 5.8709e-04 | true | ok | NaN | first\_order |
| 3 | MadNLP | 265312.5 | 543 | 45056 | 5 | 5.8709e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 253709.0 | 1120 | 89072 | 106 | 5.8709e-04 | true | ok | NaN | StalledSuccess |
| 3 | NonlinearSolve (TrustRegion) | 229375.0 | 2783 | 7098272 | 57 | 5.8709e-04 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 3 | CaNNOLeS | 19312.5 | 166 | 17488 | 5 | 5.8709e-04 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 4416.5 | 34 | 2544 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | SecondOrderOptimization (LM) | 4375.0 | 32 | 2432 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | SecondOrderOptimization (Gauss-Newton) | 4500.0 | 29 | 2144 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | SecondOrderOptimization (LM, tall) | 12437.5 | 101 | 11872 | 5 | 7.3068e-04 | true | ok | NaN | rel\_dcost |
| 4 | LeastSquaresOptim (Dogleg) | 11958.0 | 115 | 258640 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 11854.0 | 111 | 258592 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 29333.0 | 215 | 19184 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 14500.0 | 103 | 4656 | 5 | 7.3068e-04 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 13292.0 | 59 | 3696 | 5 | 7.3068e-04 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (tron) | 26354.0 | 123 | 7456 | 6 | 7.3068e-04 | true | ok | NaN | first\_order |
| 4 | Ipopt | 614291.0 | 252 | 11280 | 5 | 7.3068e-04 | true | ok | NaN | first\_order |
| 4 | MadNLP | 264417.0 | 543 | 45904 | 5 | 7.3068e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 326604.0 | 1111 | 116832 | 105 | 7.3068e-04 | true | ok | NaN | StalledSuccess |
| 4 | NonlinearSolve (TrustRegion) | 182708.0 | 1623 | 4166016 | 18 | 7.3068e-04 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 4 | CaNNOLeS | 25520.5 | 166 | 24080 | 5 | 7.3068e-04 | true | ok | NaN | first\_order |
| 5 | SecondOrderOptimization (Dogleg) | 5750.0 | 34 | 2800 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM) | 5916.5 | 32 | 2688 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (Gauss-Newton) | 6042.0 | 29 | 2320 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | SecondOrderOptimization (LM, tall) | 14583.0 | 101 | 14464 | 5 | 5.3926e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5 | LeastSquaresOptim (Dogleg) | 14562.0 | 115 | 260768 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 14313.0 | 111 | 260784 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 34625.0 | 215 | 22560 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | Optim (Newton) | 17354.5 | 103 | 4784 | 5 | 5.3926e-04 | true | ok | NaN | converged |
| 5 | JSOSolvers (trunk) | 18042.0 | 59 | 3888 | 6 | 5.3926e-04 | true | ok | NaN | first\_order |
| 5 | JSOSolvers (tron) | 27916.5 | 123 | 7680 | 6 | 5.3926e-04 | true | ok | NaN | first\_order |
| 5 | Ipopt | 592292.0 | 252 | 11280 | 5 | 5.3926e-04 | true | ok | NaN | first\_order |
| 5 | MadNLP | 287209.0 | 543 | 46704 | 5 | 5.3926e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 396145.5 | 1120 | 139984 | 106 | 5.3926e-04 | true | ok | NaN | StalledSuccess |
| 5 | NonlinearSolve (TrustRegion) | 216959.0 | 1663 | 4329600 | 19 | 5.3926e-04 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 5 | CaNNOLeS | 35666.0 | 166 | 31856 | 5 | 5.3926e-04 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 7520.5 | 34 | 3312 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | SecondOrderOptimization (LM) | 8250.0 | 32 | 3168 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | SecondOrderOptimization (Gauss-Newton) | 8125.0 | 29 | 2688 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | SecondOrderOptimization (LM, tall) | 17604.5 | 101 | 17440 | 5 | 5.4518e-04 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | LeastSquaresOptim (Dogleg) | 18542.0 | 115 | 262640 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 19271.0 | 111 | 262688 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 35583.0 | 174 | 23184 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 16708.5 | 103 | 5136 | 5 | 5.4518e-04 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 20083.0 | 59 | 4256 | 6 | 5.4518e-04 | true | ok | NaN | first\_order |
| 6 | JSOSolvers (tron) | 36000.0 | 123 | 8192 | 7 | 5.4518e-04 | true | ok | NaN | first\_order |
| 6 | Ipopt | 590334.0 | 252 | 11408 | 5 | 5.4518e-04 | true | ok | NaN | first\_order |
| 6 | MadNLP | 270042.0 | 543 | 47808 | 5 | 5.4518e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 495125.0 | 1120 | 179392 | 106 | 5.4518e-04 | true | ok | NaN | StalledSuccess |
| 6 | NonlinearSolve (TrustRegion) | 353583.0 | 2023 | 5347232 | 31 | 5.4518e-04 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 6 | CaNNOLeS | 42729.5 | 166 | 41168 | 5 | 5.4518e-04 | true | ok | NaN | first\_order |
| 7 | SecondOrderOptimization (Dogleg) | 8375.0 | 34 | 3648 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | SecondOrderOptimization (LM) | 8208.0 | 32 | 3504 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | SecondOrderOptimization (Gauss-Newton) | 9541.5 | 29 | 2912 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | SecondOrderOptimization (LM, tall) | 18021.0 | 102 | 20224 | 4 | 9.4639e-04 | true | ok | NaN | rel\_dcost |
| 7 | LeastSquaresOptim (Dogleg) | 23125.0 | 120 | 266000 | 5 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | LeastSquaresOptim (LM) | 23271.0 | 116 | 266208 | 5 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | Optim (NewtonTrustRegion) | 37416.5 | 187 | 27840 | 4 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | Optim (Newton) | 16917.0 | 90 | 4944 | 4 | 9.4639e-04 | true | ok | NaN | converged |
| 7 | JSOSolvers (trunk) | 21750.0 | 59 | 4448 | 6 | 9.4639e-04 | true | ok | NaN | first\_order |
| 7 | JSOSolvers (tron) | 40083.5 | 123 | 8416 | 7 | 9.4639e-04 | true | ok | NaN | first\_order |
| 7 | Ipopt | 538708.0 | 222 | 10160 | 4 | 9.4639e-04 | true | ok | NaN | first\_order |
| 7 | MadNLP | 259667.0 | 543 | 48896 | 4 | 9.4639e-04 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 7 | NonlinearSolve (LM) | 588084.0 | 1111 | 210432 | 105 | 9.4639e-04 | true | ok | NaN | StalledSuccess |
| 7 | NonlinearSolve (TrustRegion) | 633792.0 | 3278 | 8440720 | 69 | 9.4639e-04 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 7 | CaNNOLeS | 48333.0 | 166 | 51632 | 4 | 9.4639e-04 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 12042.0 | 34 | 4288 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | SecondOrderOptimization (LM) | 12500.0 | 32 | 4112 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | SecondOrderOptimization (Gauss-Newton) | 13145.5 | 29 | 3360 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | SecondOrderOptimization (LM, tall) | 25729.0 | 107 | 23856 | 5 | 1.1478e-03 | true | ok | NaN | rel\_dcost, abs\_dcost |
| 8 | LeastSquaresOptim (Dogleg) | 24979.0 | 121 | 266848 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 24333.0 | 117 | 267168 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 50875.0 | 179 | 32384 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 19479.0 | 103 | 5680 | 5 | 1.1478e-03 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 21666.0 | 59 | 4816 | 6 | 1.1478e-03 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 39041.5 | 123 | 8928 | 7 | 1.1478e-03 | true | ok | NaN | first\_order |
| 8 | Ipopt | 595584.0 | 252 | 11536 | 5 | 1.1478e-03 | true | ok | NaN | first\_order |
| 8 | MadNLP | 301125.0 | 543 | 50384 | 5 | 1.1478e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 654729.0 | 1124 | 252240 | 106 | 1.1478e-03 | true | ok | NaN | StalledSuccess |
| 8 | NonlinearSolve (TrustRegion) | 268083.0 | 1212 | 2973152 | 11 | 1.1478e-03 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 8 | CaNNOLeS | 73937.5 | 182 | 62624 | 5 | 1.1478e-03 | true | ok | NaN | first\_order |
| 10 | SecondOrderOptimization (Dogleg) | 22750.0 | 34 | 5408 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | SecondOrderOptimization (LM) | 21792.0 | 32 | 5200 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | SecondOrderOptimization (Gauss-Newton) | 23833.0 | 29 | 4144 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | SecondOrderOptimization (LM, tall) | 32208.0 | 107 | 33168 | 5 | 1.5727e-03 | true | ok | NaN | rel\_dcost |
| 10 | LeastSquaresOptim (Dogleg) | 32125.0 | 121 | 271568 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 33792.0 | 117 | 271856 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 68459.0 | 179 | 42128 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | Optim (Newton) | 24458.0 | 103 | 6592 | 5 | 1.5727e-03 | true | ok | NaN | converged |
| 10 | JSOSolvers (trunk) | 32084.0 | 59 | 5472 | 7 | 1.5727e-03 | true | ok | NaN | first\_order |
| 10 | JSOSolvers (tron) | 44792.0 | 123 | 9792 | 7 | 1.5727e-03 | true | ok | NaN | first\_order |
| 10 | Ipopt | 652625.5 | 252 | 11664 | 5 | 1.5727e-03 | true | ok | NaN | first\_order |
| 10 | MadNLP | 326417.0 | 543 | 53296 | 5 | 1.5727e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 921062.0 | 1133 | 357264 | 107 | 1.5727e-03 | true | ok | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 1.9398e7 | 3258 | 8412576 | 62 | 1.5727e-03 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 10 | CaNNOLeS | 102083.5 | 183 | 95424 | 5 | 1.5727e-03 | true | ok | NaN | first\_order |
| 12 | SecondOrderOptimization (Dogleg) | 31833.0 | 34 | 6736 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | SecondOrderOptimization (LM) | 32479.0 | 32 | 6496 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | SecondOrderOptimization (Gauss-Newton) | 35979.5 | 29 | 5056 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | SecondOrderOptimization (LM, tall) | 42791.5 | 108 | 43216 | 5 | 2.2976e-03 | true | ok | NaN | rel\_dcost |
| 12 | LeastSquaresOptim (Dogleg) | 42354.0 | 121 | 276288 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 46104.0 | 117 | 277072 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 101708.0 | 220 | 63632 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | Optim (Newton) | 28187.5 | 103 | 7424 | 5 | 2.2976e-03 | true | ok | NaN | converged |
| 12 | JSOSolvers (trunk) | 34625.0 | 59 | 6128 | 6 | 2.2976e-03 | true | ok | NaN | first\_order |
| 12 | JSOSolvers (tron) | 57021.0 | 123 | 10640 | 7 | 2.2976e-03 | true | ok | NaN | first\_order |
| 12 | Ipopt | 616667.0 | 252 | 11792 | 5 | 2.2976e-03 | true | ok | NaN | first\_order |
| 12 | MadNLP | 290792.0 | 543 | 56704 | 5 | 2.2976e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 1.2242705e6 | 1133 | 465184 | 107 | 2.2976e-03 | true | ok | NaN | StalledSuccess |
| 12 | NonlinearSolve (TrustRegion) | 2.78325e6 | 7262 | 19548576 | 185 | 2.2976e-03 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 12 | CaNNOLeS | 139667.0 | 191 | 123440 | 5 | 2.2976e-03 | true | ok | NaN | first\_order |
| 14 | SecondOrderOptimization (Dogleg) | 31125.0 | 56 | 11152 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | SecondOrderOptimization (LM) | 30854.5 | 54 | 10880 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | SecondOrderOptimization (Gauss-Newton) | 34667.0 | 51 | 8944 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | SecondOrderOptimization (LM, tall) | 53687.5 | 108 | 55776 | 5 | 2.5373e-03 | true | ok | NaN | rel\_dcost |
| 14 | LeastSquaresOptim (Dogleg) | 66812.5 | 140 | 335680 | 6 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 57146.0 | 117 | 282208 | 5 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 123875.0 | 220 | 76832 | 5 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | Optim (Newton) | 35895.5 | 103 | 8320 | 5 | 2.5373e-03 | true | ok | NaN | converged |
| 14 | JSOSolvers (trunk) | 43000.0 | 59 | 6592 | 6 | 2.5373e-03 | true | ok | NaN | first\_order |
| 14 | JSOSolvers (tron) | 65187.0 | 123 | 11264 | 7 | 2.5373e-03 | true | ok | NaN | first\_order |
| 14 | Ipopt | 640292.0 | 252 | 11920 | 5 | 2.5373e-03 | true | ok | NaN | first\_order |
| 14 | MadNLP | 326666.0 | 543 | 60768 | 5 | 2.5373e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 1.538625e6 | 1133 | 576816 | 107 | 2.5373e-03 | true | ok | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 673792.0 | 1498 | 4170560 | 9 | 2.5373e-03 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 14 | CaNNOLeS | 193333.5 | 191 | 163824 | 5 | 2.5373e-03 | true | ok | NaN | first\_order |
| 16 | SecondOrderOptimization (Dogleg) | 46770.5 | 60 | 18416 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | SecondOrderOptimization (LM) | 40541.0 | 58 | 18112 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | SecondOrderOptimization (Gauss-Newton) | 43124.5 | 55 | 15600 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | SecondOrderOptimization (LM, tall) | 67208.0 | 108 | 66208 | 5 | 2.7881e-03 | true | ok | NaN | rel\_dcost |
| 16 | LeastSquaresOptim (Dogleg) | 82187.5 | 140 | 343440 | 6 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 72333.5 | 117 | 289872 | 5 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 146000.5 | 244 | 94288 | 5 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | Optim (Newton) | 42041.5 | 105 | 9344 | 5 | 2.7881e-03 | true | ok | NaN | converged |
| 16 | JSOSolvers (trunk) | 55375.0 | 59 | 7056 | 7 | 2.7881e-03 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (tron) | 77542.0 | 123 | 11888 | 7 | 2.7881e-03 | true | ok | NaN | first\_order |
| 16 | Ipopt | 663792.0 | 252 | 12048 | 5 | 2.7881e-03 | true | ok | NaN | first\_order |
| 16 | MadNLP | 309854.5 | 543 | 65296 | 5 | 2.7881e-03 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 1.794375e6 | 1347 | 694192 | 107 | 2.7881e-03 | true | ok | NaN | StalledSuccess |
| 16 | NonlinearSolve (TrustRegion) | 1.663083e6 | 2577 | 7466528 | 41 | 2.7881e-03 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 16 | CaNNOLeS | 247125.0 | 191 | 210064 | 5 | 2.7881e-03 | true | ok | NaN | first\_order |
