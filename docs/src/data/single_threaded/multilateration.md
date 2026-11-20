# Benchmark Results: Multilateration

- **Category**: small_dense
- **Scaling Metric**: Dimension d
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:59:51
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: fbb6630
- **Dependency Commits**: NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | JuMP | 1870.3333333333333 | 2 | 32 | 3708.3333333333335 | 5 | 128 |
| 2 | NLLSModel (Static) | 64.28318584070796 | 1 | 16 | 163.2189349112426 | 1 | 32 |
| 2 | Standalone | 79.11985018726591 | 1 | 16 | 317.3076923076923 | 1 | 32 |
| 3 | JuMP | 2786.5 | 2 | 32 | 5718.75 | 5 | 128 |
| 3 | NLLSModel (Static) | 77.98054474708171 | 1 | 16 | 217.3913043478261 | 1 | 32 |
| 3 | Standalone | 96.05911330049261 | 1 | 16 | 387.0192307692308 | 1 | 32 |
| 4 | JuMP | 3944.3333333333335 | 2 | 32 | 8694.333333333334 | 5 | 128 |
| 4 | NLLSModel (Static) | 90.27631578947368 | 1 | 16 | 376.40677966101697 | 1 | 32 |
| 4 | Standalone | 139.6551724137931 | 1 | 16 | 524.390243902439 | 1 | 32 |
| 5 | JuMP | 5583.25 | 2 | 32 | 13416.0 | 5 | 128 |
| 5 | NLLSModel (Static) | 115.87573964497041 | 1 | 16 | 511.45 | 1 | 32 |
| 5 | Standalone | 143.9655172413793 | 1 | 16 | 584.4722222222222 | 1 | 32 |
| 6 | JuMP | 7458.333333333333 | 2 | 32 | 17250.0 | 5 | 128 |
| 6 | NLLSModel (Static) | 138.70469798657717 | 1 | 16 | 687.5 | 1 | 32 |
| 6 | Standalone | 167.328 | 1 | 16 | 763.8888888888889 | 1 | 32 |
| 7 | JuMP | 9916.0 | 2 | 32 | 24333.0 | 5 | 128 |
| 7 | NLLSModel (Static) | 165.98360655737704 | 1 | 16 | 941.2727272727273 | 1 | 32 |
| 7 | Standalone | 195.09345794392524 | 1 | 16 | 930.5714285714286 | 1 | 32 |
| 8 | JuMP | 12166.0 | 2 | 32 | 30292.0 | 5 | 128 |
| 8 | NLLSModel (Static) | 195.75471698113208 | 1 | 16 | 1138.888888888889 | 1 | 32 |
| 8 | Standalone | 226.1868131868132 | 1 | 16 | 1083.3333333333333 | 1 | 32 |
| 10 | JuMP | 19125.0 | 2 | 32 | 47375.0 | 5 | 128 |
| 10 | NLLSModel (Static) | 267.31168831168833 | 1 | 16 | 2145.8 | 1 | 32 |
| 10 | Standalone | 305.97014925373134 | 1 | 16 | 1608.923076923077 | 1 | 32 |
| 12 | JuMP | 25958.0 | 2 | 32 | 101667.0 | 5 | 128 |
| 12 | NLLSModel (Static) | 379.7169811320755 | 1 | 16 | 3125.0 | 1 | 32 |
| 12 | Standalone | 397.05882352941177 | 1 | 16 | 2062.5 | 1 | 32 |
| 14 | JuMP | 34584.0 | 2 | 32 | 136625.0 | 5 | 128 |
| 14 | NLLSModel (Static) | 464.16279069767444 | 1 | 16 | 4350.0 | 1 | 32 |
| 14 | Standalone | 528.8461538461538 | 1 | 16 | 2857.1428571428573 | 1 | 32 |
| 16 | JuMP | 43708.0 | 2 | 32 | 172666.0 | 5 | 128 |
| 16 | NLLSModel (Static) | 587.0 | 1 | 16 | 5343.75 | 1 | 32 |
| 16 | Standalone | 672.0322580645161 | 1 | 16 | 3597.1666666666665 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 2 | CaNNOLeS | 20166.5 | 180 | 14000 | 4 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | Ipopt | 635854.0 | 460 | 23424 | 4 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (tron) | 44250.0 | 204 | 10608 | 6 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (trunk) | 18937.5 | 91 | 4672 | 4 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | LeastSquaresOptim (Dogleg) | 9292.0 | 115 | 254720 | 5 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 11458.5 | 111 | 254592 | 5 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | MadNLP | 388667.0 | 589 | 49600 | 4 | 9.7541e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 189646.0 | 1165 | 77216 | 111 | 9.7541e-04 | true | ok | NaN | NaN | StalledSuccess |
| 2 | NonlinearSolve (TrustRegion) | 108708.0 | 1303 | 3260896 | 9 | 9.7541e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 2 | Optim (Newton) | 10771.0 | 90 | 3920 | 4 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 14062.5 | 177 | 10576 | 4 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | SecondOrderOptimization | 2750.0 | 32 | 1904 | 4 | 9.7541e-04 | true | ok | NaN | NaN | rel\_dcost |
| 3 | CaNNOLeS | 35042.0 | 184 | 21520 | 5 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | Ipopt | 713250.0 | 463 | 27632 | 4 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (tron) | 80250.0 | 231 | 12128 | 7 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (trunk) | 37167.0 | 105 | 5536 | 5 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | LeastSquaresOptim (Dogleg) | 10229.0 | 115 | 256432 | 5 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 11374.5 | 129 | 307264 | 6 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | MadNLP | 398438.0 | 589 | 50000 | 4 | 5.8709e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 263999.5 | 1165 | 92496 | 111 | 5.8709e-04 | true | ok | NaN | NaN | StalledSuccess |
| 3 | NonlinearSolve (TrustRegion) | 254166.0 | 2783 | 7098256 | 57 | 5.8709e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 3 | Optim (Newton) | 13167.0 | 103 | 4400 | 5 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 20041.5 | 174 | 13120 | 5 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | SecondOrderOptimization | 3833.0 | 32 | 2064 | 5 | 5.8709e-04 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost, step\_size |
| 4 | CaNNOLeS | 49854.0 | 184 | 28112 | 5 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 969542.0 | 518 | 31520 | 5 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 102729.0 | 221 | 12160 | 6 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 59958.0 | 113 | 6288 | 5 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | LeastSquaresOptim (Dogleg) | 15625.0 | 115 | 258640 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 17521.0 | 111 | 258592 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | MadNLP | 451208.0 | 589 | 50848 | 4 | 7.3068e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 331270.5 | 1156 | 121536 | 110 | 7.3068e-04 | true | ok | NaN | NaN | StalledSuccess |
| 4 | NonlinearSolve (TrustRegion) | 254042.0 | 1623 | 4166000 | 18 | 7.3068e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 4 | Optim (Newton) | 14666.0 | 103 | 4656 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 29021.0 | 215 | 19184 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | SecondOrderOptimization | 4458.0 | 32 | 2432 | 5 | 7.3068e-04 | true | ok | NaN | NaN | rel\_dcost |
| 5 | CaNNOLeS | 66208.5 | 184 | 35888 | 5 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | Ipopt | 853521.0 | 463 | 29904 | 4 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | JSOSolvers (tron) | 127000.0 | 217 | 12192 | 6 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | JSOSolvers (trunk) | 94229.5 | 125 | 7056 | 6 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | LeastSquaresOptim (Dogleg) | 20208.5 | 115 | 260768 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 19875.0 | 111 | 260784 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | MadNLP | 491625.0 | 627 | 52288 | 5 | 5.3926e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 426042.0 | 1165 | 145648 | 111 | 5.3926e-04 | true | ok | NaN | NaN | StalledSuccess |
| 5 | NonlinearSolve (TrustRegion) | 363250.0 | 1663 | 4329584 | 19 | 5.3926e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 5 | Optim (Newton) | 15458.0 | 103 | 4784 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 32875.0 | 215 | 22560 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | SecondOrderOptimization | 5125.0 | 32 | 2688 | 5 | 5.3926e-04 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | CaNNOLeS | 87062.5 | 186 | 55472 | 5 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | Ipopt | 1.040625e6 | 520 | 44768 | 5 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (tron) | 203083.0 | 244 | 14000 | 7 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (trunk) | 124417.0 | 125 | 7424 | 6 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | LeastSquaresOptim (Dogleg) | 18271.0 | 115 | 262640 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 23166.5 | 111 | 262688 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | MadNLP | 455291.5 | 589 | 52752 | 4 | 5.4518e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 533687.5 | 1165 | 186816 | 111 | 5.4518e-04 | true | ok | NaN | NaN | StalledSuccess |
| 6 | NonlinearSolve (TrustRegion) | 330459.0 | 2023 | 5347216 | 31 | 5.4518e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 6 | Optim (Newton) | 17145.5 | 103 | 5136 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 35625.0 | 174 | 23184 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | SecondOrderOptimization | 6125.0 | 32 | 3168 | 5 | 5.4518e-04 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost, step\_size |
| 7 | CaNNOLeS | 93625.0 | 184 | 65840 | 4 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | Ipopt | 1.175229e6 | 520 | 45856 | 5 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | JSOSolvers (tron) | 240625.0 | 234 | 13744 | 7 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | JSOSolvers (trunk) | 148271.5 | 119 | 7328 | 6 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | LeastSquaresOptim (Dogleg) | 26228.5 | 120 | 266000 | 5 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | LeastSquaresOptim (LM) | 25875.0 | 116 | 266208 | 5 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | MadNLP | 564625.0 | 627 | 54480 | 5 | 9.4639e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 7 | NonlinearSolve (LM) | 617041.5 | 1138 | 215744 | 108 | 9.4639e-04 | true | ok | NaN | NaN | StalledSuccess |
| 7 | NonlinearSolve (TrustRegion) | 766834.0 | 3278 | 8440704 | 69 | 9.4639e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 7 | Optim (Newton) | 15667.0 | 90 | 4944 | 4 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | Optim (NewtonTrustRegion) | 36917.0 | 187 | 27840 | 4 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | SecondOrderOptimization | 6645.5 | 32 | 3504 | 4 | 9.4639e-04 | true | ok | NaN | NaN | rel\_dcost |
| 8 | CaNNOLeS | 142333.5 | 202 | 76928 | 5 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 1.321604e6 | 520 | 47360 | 5 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 312916.5 | 241 | 14592 | 7 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 197687.5 | 123 | 7888 | 6 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | LeastSquaresOptim (Dogleg) | 28208.0 | 121 | 266848 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 29375.5 | 117 | 267168 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | MadNLP | 558250.0 | 597 | 55488 | 5 | 1.1478e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 725812.5 | 1169 | 262864 | 111 | 1.1478e-03 | true | ok | NaN | NaN | StalledSuccess |
| 8 | NonlinearSolve (TrustRegion) | 294917.0 | 1212 | 2973136 | 11 | 1.1478e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 8 | Optim (Newton) | 20291.5 | 103 | 5680 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 50521.0 | 179 | 32384 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | SecondOrderOptimization | 9083.0 | 32 | 4112 | 5 | 1.1478e-03 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost |
| 10 | CaNNOLeS | 219499.5 | 203 | 109728 | 5 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | Ipopt | 1.7324165e6 | 521 | 51280 | 5 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (tron) | 474229.0 | 238 | 15312 | 7 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (trunk) | 348083.5 | 136 | 9168 | 7 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | LeastSquaresOptim (Dogleg) | 35291.5 | 121 | 271568 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 33645.5 | 117 | 271856 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | MadNLP | 648958.5 | 597 | 58400 | 5 | 1.5727e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 1.021708e6 | 1196 | 378416 | 114 | 1.5727e-03 | true | ok | NaN | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 1.017875e6 | 3258 | 8412560 | 62 | 1.5727e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 10 | Optim (Newton) | 23938.0 | 103 | 6592 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 72271.0 | 179 | 42128 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | SecondOrderOptimization | 14771.0 | 32 | 5200 | 5 | 1.5727e-03 | true | ok | NaN | NaN | rel\_dcost |
| 12 | CaNNOLeS | 306917.0 | 213 | 162352 | 5 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | Ipopt | 2.683042e6 | 578 | 83264 | 6 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (tron) | 721042.0 | 245 | 16496 | 7 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 468583.0 | 135 | 9776 | 6 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | LeastSquaresOptim (Dogleg) | 48937.5 | 121 | 276288 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 54479.0 | 117 | 277072 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | MadNLP | 1.205229e6 | 613 | 62128 | 7 | 2.2976e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 1.3635e6 | 1178 | 484928 | 112 | 2.2976e-03 | true | ok | NaN | NaN | StalledSuccess |
| 12 | NonlinearSolve (TrustRegion) | 3.954667e6 | 7262 | 19548560 | 185 | 2.2976e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 12 | Optim (Newton) | 29625.0 | 103 | 7424 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 96000.0 | 220 | 63632 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | SecondOrderOptimization | 20500.0 | 32 | 6496 | 5 | 2.2976e-03 | true | ok | NaN | NaN | rel\_dcost |
| 14 | CaNNOLeS | 405708.5 | 213 | 202736 | 5 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | Ipopt | 3.562958e6 | 578 | 85504 | 6 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | JSOSolvers (tron) | 942958.5 | 242 | 16976 | 7 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | JSOSolvers (trunk) | 630521.0 | 133 | 10144 | 6 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | LeastSquaresOptim (Dogleg) | 75271.0 | 140 | 335680 | 6 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 66291.5 | 117 | 282208 | 5 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | MadNLP | 1.351708e6 | 635 | 66512 | 6 | 2.5373e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 1.624125e6 | 1169 | 596448 | 111 | 2.5373e-03 | true | ok | NaN | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 778125.0 | 1498 | 4170544 | 9 | 2.5373e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 14 | Optim (Newton) | 35688.0 | 103 | 8320 | 5 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 120458.5 | 220 | 76832 | 5 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | SecondOrderOptimization | 27416.5 | 32 | 8128 | 5 | 2.5373e-03 | true | ok | NaN | NaN | rel\_dcost |
| 16 | CaNNOLeS | 543875.5 | 213 | 248976 | 5 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | Ipopt | 6.391896e6 | 740 | 98752 | 8 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (tron) | 1.2731665e6 | 249 | 17936 | 7 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 935229.5 | 143 | 11088 | 7 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | LeastSquaresOptim (Dogleg) | 94917.0 | 140 | 343440 | 6 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 85041.5 | 117 | 289872 | 5 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | MadNLP | 1.5721045e6 | 605 | 70560 | 6 | 2.7881e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 1.9662915e6 | 1402 | 723856 | 112 | 2.7881e-03 | true | ok | NaN | NaN | StalledSuccess |
| 16 | NonlinearSolve (TrustRegion) | 1.693458e6 | 2577 | 7466512 | 41 | 2.7881e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 16 | Optim (Newton) | 43166.5 | 105 | 9344 | 5 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 149104.0 | 244 | 94288 | 5 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | SecondOrderOptimization | 33208.0 | 32 | 9984 | 5 | 2.7881e-03 | true | ok | NaN | NaN | rel\_dcost |
