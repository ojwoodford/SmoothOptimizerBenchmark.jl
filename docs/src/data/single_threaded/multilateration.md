# Benchmark Results: Multilateration

- **Category**: small_dense
- **Scaling Metric**: Dimension d
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T04:30:16
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.2.0)
- **Julia Version**: 1.13.4
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 1dd4c9b
- **Dependency Commits**: BlockLinearSystems 78c771c, DampedLinearSolve e361765, NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | JuMP | 1890.1818181818182 | 2 | 32 | 3993.1666666666665 | 5 | 128 |
| 2 | NLLSModel (Static) | 71.20743034055728 | 1 | 16 | 139.61988304093566 | 1 | 32 |
| 2 | Standalone | 81.92883895131087 | 1 | 16 | 303.7391304347826 | 1 | 32 |
| 3 | JuMP | 2786.5 | 2 | 32 | 5916.5 | 5 | 128 |
| 3 | NLLSModel (Static) | 81.60580912863071 | 1 | 16 | 239.92307692307693 | 1 | 32 |
| 3 | Standalone | 101.47150259067358 | 1 | 16 | 380.6818181818182 | 1 | 32 |
| 4 | JuMP | 4208.4 | 2 | 32 | 9042.0 | 5 | 128 |
| 4 | NLLSModel (Static) | 97.76585365853659 | 1 | 16 | 357.6333333333333 | 1 | 32 |
| 4 | Standalone | 148.85507246376812 | 1 | 16 | 518.2926829268292 | 1 | 32 |
| 5 | JuMP | 5406.25 | 2 | 32 | 12834.0 | 5 | 128 |
| 5 | NLLSModel (Static) | 126.3 | 1 | 16 | 498.06976744186045 | 1 | 32 |
| 5 | Standalone | 175.0 | 1 | 16 | 596.7741935483871 | 1 | 32 |
| 6 | JuMP | 7514.0 | 2 | 32 | 17625.0 | 5 | 128 |
| 6 | NLLSModel (Static) | 141.3146853146853 | 1 | 16 | 655.9354838709677 | 1 | 32 |
| 6 | Standalone | 164.664 | 1 | 16 | 772.3214285714286 | 1 | 32 |
| 7 | JuMP | 9792.0 | 2 | 32 | 24959.0 | 5 | 128 |
| 7 | NLLSModel (Static) | 170.08196721311475 | 1 | 16 | 960.1304347826087 | 1 | 32 |
| 7 | Standalone | 194.98058252427185 | 1 | 16 | 993.75 | 1 | 32 |
| 8 | JuMP | 12459.0 | 2 | 32 | 30292.0 | 5 | 128 |
| 8 | NLLSModel (Static) | 200.98039215686273 | 1 | 16 | 1131.578947368421 | 1 | 32 |
| 8 | Standalone | 226.69892473118279 | 1 | 16 | 1076.7368421052631 | 1 | 32 |
| 10 | JuMP | 19625.0 | 2 | 32 | 49500.0 | 5 | 128 |
| 10 | NLLSModel (Static) | 268.3333333333333 | 1 | 16 | 2154.2 | 1 | 32 |
| 10 | Standalone | 311.8636363636364 | 1 | 16 | 1544.923076923077 | 1 | 32 |
| 12 | JuMP | 25833.0 | 2 | 32 | 104458.0 | 5 | 128 |
| 12 | NLLSModel (Static) | 382.21153846153845 | 1 | 16 | 3113.1428571428573 | 1 | 32 |
| 12 | Standalone | 412.5686274509804 | 1 | 16 | 2058.3 | 1 | 32 |
| 14 | JuMP | 35334.0 | 2 | 32 | 137500.0 | 5 | 128 |
| 14 | NLLSModel (Static) | 469.5121951219512 | 1 | 16 | 4583.0 | 1 | 32 |
| 14 | Standalone | 538.1944444444445 | 1 | 16 | 2845.285714285714 | 1 | 32 |
| 16 | JuMP | 44458.0 | 2 | 32 | 173333.0 | 5 | 128 |
| 16 | NLLSModel (Static) | 605.4117647058823 | 1 | 16 | 5864.5 | 1 | 32 |
| 16 | Standalone | 687.5 | 1 | 16 | 3486.1666666666665 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 2 | CaNNOLeS | 20208.0 | 180 | 14000 | 4 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | Ipopt | 617854.0 | 452 | 23024 | 4 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (tron) | 44104.0 | 204 | 10608 | 6 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (trunk) | 18583.0 | 91 | 4672 | 4 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | LeastSquaresOptim (Dogleg) | 11270.5 | 115 | 254720 | 5 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 11271.0 | 111 | 254592 | 5 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | MadNLP | 376166.5 | 589 | 49600 | 4 | 9.7541e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 174521.0 | 1165 | 77216 | 111 | 9.7541e-04 | true | ok | NaN | NaN | StalledSuccess |
| 2 | NonlinearSolve (TrustRegion) | 131416.0 | 1303 | 3260896 | 9 | 9.7541e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 2 | Optim (Newton) | 9791.0 | 90 | 3920 | 4 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 12416.5 | 173 | 10448 | 4 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | SecondOrderOptimization | 2625.0 | 32 | 1904 | 4 | 9.7541e-04 | true | ok | NaN | NaN | rel\_dcost |
| 3 | CaNNOLeS | 33354.0 | 184 | 21520 | 5 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | Ipopt | 656958.0 | 455 | 27232 | 4 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (tron) | 80084.0 | 231 | 12128 | 7 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (trunk) | 36792.0 | 105 | 5536 | 5 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | LeastSquaresOptim (Dogleg) | 13479.5 | 115 | 256432 | 5 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 15292.0 | 129 | 307264 | 6 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | MadNLP | 402625.0 | 589 | 50000 | 4 | 5.8709e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 240437.5 | 1165 | 92496 | 111 | 5.8709e-04 | true | ok | NaN | NaN | StalledSuccess |
| 3 | NonlinearSolve (TrustRegion) | 365792.0 | 2783 | 7098256 | 57 | 5.8709e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 3 | Optim (Newton) | 12708.0 | 103 | 4400 | 5 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 19437.5 | 169 | 12960 | 5 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | SecondOrderOptimization | 3667.0 | 32 | 2064 | 5 | 5.8709e-04 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost, step\_size |
| 4 | CaNNOLeS | 47250.0 | 184 | 28112 | 5 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 822792.0 | 510 | 31120 | 5 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 98708.0 | 221 | 12160 | 6 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 57958.0 | 113 | 6288 | 5 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | LeastSquaresOptim (Dogleg) | 16791.5 | 115 | 258640 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 12208.5 | 111 | 258592 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | MadNLP | 403062.5 | 589 | 50848 | 4 | 7.3068e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 294458.5 | 1156 | 121536 | 110 | 7.3068e-04 | true | ok | NaN | NaN | StalledSuccess |
| 4 | NonlinearSolve (TrustRegion) | 152833.0 | 1623 | 4166000 | 18 | 7.3068e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 4 | Optim (Newton) | 13500.0 | 103 | 4656 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 26500.0 | 210 | 19024 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | SecondOrderOptimization | 4208.0 | 32 | 2432 | 5 | 7.3068e-04 | true | ok | NaN | NaN | rel\_dcost |
| 5 | CaNNOLeS | 63354.0 | 184 | 35888 | 5 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | Ipopt | 797229.5 | 455 | 29504 | 4 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | JSOSolvers (tron) | 125500.0 | 217 | 12192 | 6 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | JSOSolvers (trunk) | 92291.5 | 125 | 7056 | 6 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | LeastSquaresOptim (Dogleg) | 15729.5 | 115 | 260768 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 15458.5 | 111 | 260784 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | MadNLP | 505770.5 | 627 | 52288 | 5 | 5.3926e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 393645.5 | 1165 | 145648 | 111 | 5.3926e-04 | true | ok | NaN | NaN | StalledSuccess |
| 5 | NonlinearSolve (TrustRegion) | 337458.0 | 1663 | 4329584 | 19 | 5.3926e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 5 | Optim (Newton) | 15667.0 | 103 | 4784 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 33417.0 | 210 | 22400 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | SecondOrderOptimization | 5250.0 | 32 | 2688 | 5 | 5.3926e-04 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | CaNNOLeS | 87667.0 | 186 | 55472 | 5 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | Ipopt | 1.0368125e6 | 512 | 44368 | 5 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (tron) | 200417.0 | 244 | 14000 | 7 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (trunk) | 121104.5 | 125 | 7424 | 6 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | LeastSquaresOptim (Dogleg) | 21937.5 | 115 | 262640 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 21916.5 | 111 | 262688 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | MadNLP | 438541.5 | 589 | 52752 | 4 | 5.4518e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 468396.0 | 1165 | 186816 | 111 | 5.4518e-04 | true | ok | NaN | NaN | StalledSuccess |
| 6 | NonlinearSolve (TrustRegion) | 416125.0 | 2023 | 5347216 | 31 | 5.4518e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 6 | Optim (Newton) | 16250.0 | 103 | 5136 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 34750.0 | 169 | 23024 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | SecondOrderOptimization | 5875.0 | 32 | 3168 | 5 | 5.4518e-04 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost, step\_size |
| 7 | CaNNOLeS | 92750.0 | 184 | 65840 | 4 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | Ipopt | 1.14275e6 | 512 | 45456 | 5 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | JSOSolvers (tron) | 236312.5 | 234 | 13744 | 7 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | JSOSolvers (trunk) | 143771.0 | 119 | 7328 | 6 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | LeastSquaresOptim (Dogleg) | 25708.5 | 120 | 266000 | 5 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | LeastSquaresOptim (LM) | 24833.5 | 116 | 266208 | 5 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | MadNLP | 563353.5 | 627 | 54480 | 5 | 9.4639e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 7 | NonlinearSolve (LM) | 554291.5 | 1138 | 215744 | 108 | 9.4639e-04 | true | ok | NaN | NaN | StalledSuccess |
| 7 | NonlinearSolve (TrustRegion) | 687584.0 | 3278 | 8440704 | 69 | 9.4639e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 7 | Optim (Newton) | 15375.0 | 90 | 4944 | 4 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | Optim (NewtonTrustRegion) | 36375.0 | 183 | 27712 | 4 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | SecondOrderOptimization | 7166.5 | 32 | 3504 | 4 | 9.4639e-04 | true | ok | NaN | NaN | rel\_dcost |
| 8 | CaNNOLeS | 148792.0 | 202 | 76928 | 5 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 1.3526665e6 | 512 | 46960 | 5 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 318458.0 | 241 | 14592 | 7 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 197166.5 | 123 | 7888 | 6 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | LeastSquaresOptim (Dogleg) | 32771.5 | 121 | 266848 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 29125.0 | 117 | 267168 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | MadNLP | 593771.0 | 597 | 55488 | 5 | 1.1478e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 646020.5 | 1169 | 262864 | 111 | 1.1478e-03 | true | ok | NaN | NaN | StalledSuccess |
| 8 | NonlinearSolve (TrustRegion) | 345917.0 | 1212 | 2973136 | 11 | 1.1478e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 8 | Optim (Newton) | 19375.0 | 103 | 5680 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 48520.5 | 174 | 32224 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | SecondOrderOptimization | 9042.0 | 32 | 4112 | 5 | 1.1478e-03 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost |
| 10 | CaNNOLeS | 214979.0 | 203 | 109728 | 5 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | Ipopt | 1.6996455e6 | 513 | 50880 | 5 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (tron) | 458791.5 | 238 | 15312 | 7 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (trunk) | 337021.0 | 136 | 9168 | 7 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | LeastSquaresOptim (Dogleg) | 37771.0 | 121 | 271568 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 38291.5 | 117 | 271856 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | MadNLP | 645396.0 | 597 | 58400 | 5 | 1.5727e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 922520.5 | 1196 | 378416 | 114 | 1.5727e-03 | true | ok | NaN | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 918708.0 | 3258 | 8412560 | 62 | 1.5727e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 10 | Optim (Newton) | 24041.0 | 103 | 6592 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 71166.5 | 174 | 41968 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | SecondOrderOptimization | 14625.0 | 32 | 5200 | 5 | 1.5727e-03 | true | ok | NaN | NaN | rel\_dcost |
| 12 | CaNNOLeS | 304249.5 | 213 | 162352 | 5 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | Ipopt | 2.6769585e6 | 570 | 82864 | 6 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (tron) | 722979.5 | 245 | 16496 | 7 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 479375.0 | 135 | 9776 | 6 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | LeastSquaresOptim (Dogleg) | 47271.0 | 121 | 276288 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 53062.5 | 117 | 277072 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | MadNLP | 1.2463125e6 | 613 | 62128 | 7 | 2.2976e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 1.2604165e6 | 1178 | 484928 | 112 | 2.2976e-03 | true | ok | NaN | NaN | StalledSuccess |
| 12 | NonlinearSolve (TrustRegion) | 3.478667e6 | 7262 | 19548560 | 185 | 2.2976e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 12 | Optim (Newton) | 28917.0 | 103 | 7424 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 92041.5 | 215 | 63472 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | SecondOrderOptimization | 20333.0 | 32 | 6496 | 5 | 2.2976e-03 | true | ok | NaN | NaN | rel\_dcost |
| 14 | CaNNOLeS | 398375.0 | 213 | 202736 | 5 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | Ipopt | 3.4804375e6 | 570 | 85104 | 6 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | JSOSolvers (tron) | 910500.0 | 242 | 16976 | 7 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | JSOSolvers (trunk) | 607020.5 | 133 | 10144 | 6 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | LeastSquaresOptim (Dogleg) | 74312.5 | 140 | 335680 | 6 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 65354.5 | 117 | 282208 | 5 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | MadNLP | 1.348542e6 | 635 | 66512 | 6 | 2.5373e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 1.550271e6 | 1169 | 596448 | 111 | 2.5373e-03 | true | ok | NaN | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 776208.0 | 1498 | 4170544 | 9 | 2.5373e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 14 | Optim (Newton) | 35084.0 | 103 | 8320 | 5 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 117625.5 | 215 | 76672 | 5 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | SecondOrderOptimization | 29625.0 | 32 | 8128 | 5 | 2.5373e-03 | true | ok | NaN | NaN | rel\_dcost |
| 16 | CaNNOLeS | 546417.0 | 213 | 248976 | 5 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | Ipopt | 6.6750415e6 | 732 | 98352 | 8 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (tron) | 1.227729e6 | 249 | 17936 | 7 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 892854.0 | 143 | 11088 | 7 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | LeastSquaresOptim (Dogleg) | 90625.0 | 140 | 343440 | 6 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 79875.0 | 117 | 289872 | 5 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | MadNLP | 1.5189165e6 | 605 | 70560 | 6 | 2.7881e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 1.800396e6 | 1402 | 723856 | 112 | 2.7881e-03 | true | ok | NaN | NaN | StalledSuccess |
| 16 | NonlinearSolve (TrustRegion) | 1.660542e6 | 2577 | 7466512 | 41 | 2.7881e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 16 | Optim (Newton) | 42812.5 | 105 | 9344 | 5 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 146729.0 | 239 | 94128 | 5 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | SecondOrderOptimization | 35979.5 | 32 | 9984 | 5 | 2.7881e-03 | true | ok | NaN | NaN | rel\_dcost |
