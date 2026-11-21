# Benchmark Results: Multilateration

- **Category**: small_dense
- **Scaling Metric**: Dimension d
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:35:10
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.2.0)
- **Julia Version**: 1.13.4
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 1dd4c9b
- **Dependency Commits**: BlockLinearSystems 78c771c, DampedLinearSolve e361765, NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | JuMP | 1883.3 | 2 | 32 | 3777.6666666666665 | 5 | 128 |
| 2 | NLLSModel (Static) | 65.07692307692308 | 1 | 16 | 139.50632911392404 | 1 | 32 |
| 2 | Standalone | 83.74384236453201 | 1 | 16 | 300.6461538461538 | 1 | 32 |
| 3 | JuMP | 2869.0 | 2 | 32 | 5833.25 | 5 | 128 |
| 3 | NLLSModel (Static) | 82.4688796680498 | 1 | 16 | 235.11904761904762 | 1 | 32 |
| 3 | Standalone | 94.00985221674877 | 1 | 16 | 377.45098039215685 | 1 | 32 |
| 4 | JuMP | 3908.4 | 2 | 32 | 8652.666666666666 | 5 | 128 |
| 4 | NLLSModel (Static) | 167.0 | 1 | 16 | 387.35185185185185 | 1 | 32 |
| 4 | Standalone | 156.672 | 1 | 16 | 543.75 | 1 | 32 |
| 5 | JuMP | 5323.0 | 2 | 32 | 13416.0 | 5 | 128 |
| 5 | NLLSModel (Static) | 162.6103896103896 | 1 | 16 | 533.9736842105264 | 1 | 32 |
| 5 | Standalone | 172.40366972477065 | 1 | 16 | 604.15625 | 1 | 32 |
| 6 | JuMP | 7278.0 | 2 | 32 | 17750.0 | 5 | 128 |
| 6 | NLLSModel (Static) | 184.28187919463087 | 1 | 16 | 663.8666666666667 | 1 | 32 |
| 6 | Standalone | 166.66666666666666 | 1 | 16 | 726.1785714285714 | 1 | 32 |
| 7 | JuMP | 10459.0 | 2 | 32 | 23958.0 | 5 | 128 |
| 7 | NLLSModel (Static) | 209.01652892561984 | 1 | 16 | 924.6190476190476 | 1 | 32 |
| 7 | Standalone | 190.93203883495147 | 1 | 16 | 1013.8571428571429 | 1 | 32 |
| 8 | JuMP | 12292.0 | 2 | 32 | 32209.0 | 5 | 128 |
| 8 | NLLSModel (Static) | 218.010101010101 | 1 | 16 | 1118.0555555555557 | 1 | 32 |
| 8 | Standalone | 225.57471264367817 | 1 | 16 | 1015.3684210526316 | 1 | 32 |
| 10 | JuMP | 21166.0 | 2 | 32 | 46167.0 | 5 | 128 |
| 10 | NLLSModel (Static) | 289.5064935064935 | 1 | 16 | 2087.5 | 1 | 32 |
| 10 | Standalone | 306.0163934426229 | 1 | 16 | 1634.6153846153845 | 1 | 32 |
| 12 | JuMP | 25459.0 | 2 | 32 | 102916.0 | 5 | 128 |
| 12 | NLLSModel (Static) | 393.94545454545454 | 1 | 16 | 3071.4285714285716 | 1 | 32 |
| 12 | Standalone | 393.34 | 1 | 16 | 2042.0 | 1 | 32 |
| 14 | JuMP | 34875.0 | 2 | 32 | 138667.0 | 5 | 128 |
| 14 | NLLSModel (Static) | 501.9761904761905 | 1 | 16 | 2635.5 | 1 | 32 |
| 14 | Standalone | 532.8947368421053 | 1 | 16 | 2765.625 | 1 | 32 |
| 16 | JuMP | 43458.0 | 2 | 32 | 181208.0 | 5 | 128 |
| 16 | NLLSModel (Static) | 666.0 | 1 | 16 | 2375.0 | 1 | 32 |
| 16 | Standalone | 676.4 | 1 | 16 | 3500.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 2 | CaNNOLeS | 20250.0 | 180 | 14000 | 4 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | Ipopt | 608791.5 | 452 | 23024 | 4 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (tron) | 43917.0 | 204 | 10608 | 6 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (trunk) | 18250.0 | 91 | 4672 | 4 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | LeastSquaresOptim (Dogleg) | 11500.0 | 115 | 254720 | 5 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 7229.0 | 111 | 254592 | 5 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | MadNLP | 382521.0 | 589 | 49600 | 4 | 9.7541e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 175333.5 | 1165 | 77216 | 111 | 9.7541e-04 | true | ok | NaN | NaN | StalledSuccess |
| 2 | NonlinearSolve (TrustRegion) | 109750.0 | 1303 | 3260896 | 9 | 9.7541e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 2 | Optim (Newton) | 10583.5 | 90 | 3920 | 4 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 13312.5 | 173 | 10448 | 4 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | SecondOrderOptimization | 3167.0 | 32 | 1904 | 4 | 9.7541e-04 | true | ok | NaN | NaN | rel\_dcost |
| 3 | CaNNOLeS | 33583.5 | 184 | 21520 | 5 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | Ipopt | 648416.5 | 455 | 27232 | 4 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (tron) | 78667.0 | 231 | 12128 | 7 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (trunk) | 38354.5 | 105 | 5536 | 5 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | LeastSquaresOptim (Dogleg) | 10917.0 | 115 | 256432 | 5 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 15083.0 | 129 | 307264 | 6 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | MadNLP | 409958.0 | 589 | 50000 | 4 | 5.8709e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 240000.0 | 1165 | 92496 | 111 | 5.8709e-04 | true | ok | NaN | NaN | StalledSuccess |
| 3 | NonlinearSolve (TrustRegion) | 335250.0 | 2783 | 7098256 | 57 | 5.8709e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 3 | Optim (Newton) | 12916.0 | 103 | 4400 | 5 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 19521.0 | 169 | 12960 | 5 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | SecondOrderOptimization | 3583.0 | 32 | 2064 | 5 | 5.8709e-04 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost, step\_size |
| 4 | CaNNOLeS | 46187.5 | 184 | 28112 | 5 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 819500.5 | 510 | 31120 | 5 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 97042.0 | 221 | 12160 | 6 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 57770.5 | 113 | 6288 | 5 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | LeastSquaresOptim (Dogleg) | 12125.0 | 115 | 258640 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 11709.0 | 111 | 258592 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | MadNLP | 399959.0 | 589 | 50848 | 4 | 7.3068e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 290583.0 | 1156 | 121536 | 110 | 7.3068e-04 | true | ok | NaN | NaN | StalledSuccess |
| 4 | NonlinearSolve (TrustRegion) | 165833.0 | 1623 | 4166000 | 18 | 7.3068e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 4 | Optim (Newton) | 13708.5 | 103 | 4656 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 26208.5 | 210 | 19024 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | SecondOrderOptimization | 4083.0 | 32 | 2432 | 5 | 7.3068e-04 | true | ok | NaN | NaN | rel\_dcost |
| 5 | CaNNOLeS | 65979.5 | 184 | 35888 | 5 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | Ipopt | 786854.0 | 455 | 29504 | 4 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | JSOSolvers (tron) | 122542.0 | 217 | 12192 | 6 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | JSOSolvers (trunk) | 90125.0 | 125 | 7056 | 6 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | LeastSquaresOptim (Dogleg) | 15937.5 | 115 | 260768 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 15541.5 | 111 | 260784 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | MadNLP | 481145.5 | 627 | 52288 | 5 | 5.3926e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 416542.0 | 1165 | 145648 | 111 | 5.3926e-04 | true | ok | NaN | NaN | StalledSuccess |
| 5 | NonlinearSolve (TrustRegion) | 273000.0 | 1663 | 4329584 | 19 | 5.3926e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 5 | Optim (Newton) | 14854.0 | 103 | 4784 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 32416.5 | 210 | 22400 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | SecondOrderOptimization | 5416.0 | 32 | 2688 | 5 | 5.3926e-04 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | CaNNOLeS | 84917.0 | 186 | 55472 | 5 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | Ipopt | 993937.5 | 512 | 44368 | 5 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (tron) | 196687.5 | 244 | 14000 | 7 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (trunk) | 129833.0 | 125 | 7424 | 6 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | LeastSquaresOptim (Dogleg) | 18083.0 | 115 | 262640 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 17979.5 | 111 | 262688 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | MadNLP | 475500.0 | 589 | 52752 | 4 | 5.4518e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 469250.0 | 1165 | 186816 | 111 | 5.4518e-04 | true | ok | NaN | NaN | StalledSuccess |
| 6 | NonlinearSolve (TrustRegion) | 354542.0 | 2023 | 5347216 | 31 | 5.4518e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 6 | Optim (Newton) | 17250.0 | 103 | 5136 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 33708.0 | 169 | 23024 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | SecondOrderOptimization | 5833.5 | 32 | 3168 | 5 | 5.4518e-04 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost, step\_size |
| 7 | CaNNOLeS | 95875.0 | 184 | 65840 | 4 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | Ipopt | 1.2027295e6 | 512 | 45456 | 5 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | JSOSolvers (tron) | 232000.0 | 234 | 13744 | 7 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | JSOSolvers (trunk) | 140937.5 | 119 | 7328 | 6 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | LeastSquaresOptim (Dogleg) | 21750.0 | 120 | 266000 | 5 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | LeastSquaresOptim (LM) | 21541.5 | 116 | 266208 | 5 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | MadNLP | 543562.0 | 627 | 54480 | 5 | 9.4639e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 7 | NonlinearSolve (LM) | 548458.0 | 1138 | 215744 | 108 | 9.4639e-04 | true | ok | NaN | NaN | StalledSuccess |
| 7 | NonlinearSolve (TrustRegion) | 637333.0 | 3278 | 8440704 | 69 | 9.4639e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 7 | Optim (Newton) | 15208.0 | 90 | 4944 | 4 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | Optim (NewtonTrustRegion) | 35562.0 | 183 | 27712 | 4 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | SecondOrderOptimization | 6625.0 | 32 | 3504 | 4 | 9.4639e-04 | true | ok | NaN | NaN | rel\_dcost |
| 8 | CaNNOLeS | 138833.0 | 202 | 76928 | 5 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 1.2740625e6 | 512 | 46960 | 5 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 306625.0 | 241 | 14592 | 7 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 188146.0 | 123 | 7888 | 6 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | LeastSquaresOptim (Dogleg) | 26021.0 | 121 | 266848 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 23708.0 | 117 | 267168 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | MadNLP | 570104.0 | 597 | 55488 | 5 | 1.1478e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 628292.0 | 1169 | 262864 | 111 | 1.1478e-03 | true | ok | NaN | NaN | StalledSuccess |
| 8 | NonlinearSolve (TrustRegion) | 272833.0 | 1212 | 2973136 | 11 | 1.1478e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 8 | Optim (Newton) | 19416.0 | 103 | 5680 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 48979.5 | 174 | 32224 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | SecondOrderOptimization | 9084.0 | 32 | 4112 | 5 | 1.1478e-03 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost |
| 10 | CaNNOLeS | 221604.5 | 203 | 109728 | 5 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | Ipopt | 1.72875e6 | 513 | 50880 | 5 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (tron) | 471479.0 | 238 | 15312 | 7 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (trunk) | 342125.5 | 136 | 9168 | 7 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | LeastSquaresOptim (Dogleg) | 32750.0 | 121 | 271568 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 33437.5 | 117 | 271856 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | MadNLP | 638333.5 | 597 | 58400 | 5 | 1.5727e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 973833.0 | 1196 | 378416 | 114 | 1.5727e-03 | true | ok | NaN | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 892834.0 | 3258 | 8412560 | 62 | 1.5727e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 10 | Optim (Newton) | 23374.5 | 103 | 6592 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 63479.0 | 174 | 41968 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | SecondOrderOptimization | 14125.0 | 32 | 5200 | 5 | 1.5727e-03 | true | ok | NaN | NaN | rel\_dcost |
| 12 | CaNNOLeS | 291916.5 | 213 | 162352 | 5 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | Ipopt | 2.6922295e6 | 570 | 82864 | 6 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (tron) | 696354.0 | 245 | 16496 | 7 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 462042.0 | 135 | 9776 | 6 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | LeastSquaresOptim (Dogleg) | 44187.5 | 121 | 276288 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 44479.0 | 117 | 277072 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | MadNLP | 1.1573125e6 | 613 | 62128 | 7 | 2.2976e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 1.1605e6 | 1178 | 484928 | 112 | 2.2976e-03 | true | ok | NaN | NaN | StalledSuccess |
| 12 | NonlinearSolve (TrustRegion) | 2.643708e6 | 7262 | 19548560 | 185 | 2.2976e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 12 | Optim (Newton) | 28146.0 | 103 | 7424 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 85958.0 | 215 | 63472 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | SecondOrderOptimization | 20854.0 | 32 | 6496 | 5 | 2.2976e-03 | true | ok | NaN | NaN | rel\_dcost |
| 14 | CaNNOLeS | 388500.0 | 213 | 202736 | 5 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | Ipopt | 3.5390625e6 | 570 | 85104 | 6 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | JSOSolvers (tron) | 896104.0 | 242 | 16976 | 7 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | JSOSolvers (trunk) | 597458.0 | 133 | 10144 | 6 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | LeastSquaresOptim (Dogleg) | 65458.0 | 140 | 335680 | 6 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 57250.0 | 117 | 282208 | 5 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | MadNLP | 1.332958e6 | 635 | 66512 | 6 | 2.5373e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 1.4565e6 | 1169 | 596448 | 111 | 2.5373e-03 | true | ok | NaN | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 673250.0 | 1498 | 4170544 | 9 | 2.5373e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 14 | Optim (Newton) | 36937.5 | 103 | 8320 | 5 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 122062.5 | 215 | 76672 | 5 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | SecondOrderOptimization | 20459.0 | 54 | 10880 | 5 | 2.5373e-03 | true | ok | NaN | NaN | rel\_dcost |
| 16 | CaNNOLeS | 508812.5 | 213 | 248976 | 5 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | Ipopt | 6.0398335e6 | 732 | 98352 | 8 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (tron) | 1.211729e6 | 249 | 17936 | 7 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 904562.0 | 143 | 11088 | 7 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | LeastSquaresOptim (Dogleg) | 82125.0 | 140 | 343440 | 6 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 72083.5 | 117 | 289872 | 5 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | MadNLP | 1.6087085e6 | 605 | 70560 | 6 | 2.7881e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 1.7946245e6 | 1402 | 723856 | 112 | 2.7881e-03 | true | ok | NaN | NaN | StalledSuccess |
| 16 | NonlinearSolve (TrustRegion) | 1.538541e6 | 2577 | 7466512 | 41 | 2.7881e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 16 | Optim (Newton) | 41750.0 | 105 | 9344 | 5 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 144687.0 | 239 | 94128 | 5 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | SecondOrderOptimization | 34958.0 | 58 | 18112 | 5 | 2.7881e-03 | true | ok | NaN | NaN | rel\_dcost |
