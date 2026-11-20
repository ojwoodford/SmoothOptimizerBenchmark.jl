# Benchmark Results: Multilateration

- **Category**: small_dense
- **Scaling Metric**: Dimension d
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:08:34
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: fbb6630
- **Dependency Commits**: NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | JuMP | 1844.7272727272727 | 2 | 32 | 3826.3333333333335 | 5 | 128 |
| 2 | NLLSModel (Static) | 64.3961038961039 | 1 | 16 | 162.7625 | 1 | 32 |
| 2 | Standalone | 77.94055944055944 | 1 | 16 | 313.1774193548387 | 1 | 32 |
| 3 | JuMP | 2760.375 | 2 | 32 | 5718.75 | 5 | 128 |
| 3 | NLLSModel (Static) | 81.55252918287938 | 1 | 16 | 219.6931818181818 | 1 | 32 |
| 3 | Standalone | 93.75 | 1 | 16 | 378.1509433962264 | 1 | 32 |
| 4 | JuMP | 3882.0 | 2 | 32 | 8764.0 | 5 | 128 |
| 4 | NLLSModel (Static) | 134.0909090909091 | 1 | 16 | 353.42857142857144 | 1 | 32 |
| 4 | Standalone | 144.01342281879195 | 1 | 16 | 502.0487804878049 | 1 | 32 |
| 5 | JuMP | 5468.75 | 2 | 32 | 13333.0 | 5 | 128 |
| 5 | NLLSModel (Static) | 159.5625 | 1 | 16 | 504.0731707317073 | 1 | 32 |
| 5 | Standalone | 137.33552631578948 | 1 | 16 | 563.6666666666666 | 1 | 32 |
| 6 | JuMP | 7333.333333333333 | 2 | 32 | 17250.0 | 5 | 128 |
| 6 | NLLSModel (Static) | 167.55714285714285 | 1 | 16 | 658.6129032258065 | 1 | 32 |
| 6 | Standalone | 161.49612403100775 | 1 | 16 | 708.3214285714286 | 1 | 32 |
| 7 | JuMP | 9458.0 | 2 | 32 | 24375.0 | 5 | 128 |
| 7 | NLLSModel (Static) | 203.89344262295083 | 1 | 16 | 954.5454545454545 | 1 | 32 |
| 7 | Standalone | 195.57142857142858 | 1 | 16 | 942.4761904761905 | 1 | 32 |
| 8 | JuMP | 12125.0 | 2 | 32 | 29625.0 | 5 | 128 |
| 8 | NLLSModel (Static) | 219.04761904761904 | 1 | 16 | 1125.0 | 1 | 32 |
| 8 | Standalone | 218.75 | 1 | 16 | 1057.0526315789473 | 1 | 32 |
| 10 | JuMP | 18625.0 | 2 | 32 | 46417.0 | 5 | 128 |
| 10 | NLLSModel (Static) | 293.83116883116884 | 1 | 16 | 2108.3 | 1 | 32 |
| 10 | Standalone | 300.1304347826087 | 1 | 16 | 1541.6153846153845 | 1 | 32 |
| 12 | JuMP | 26458.0 | 2 | 32 | 102750.0 | 5 | 128 |
| 12 | NLLSModel (Static) | 397.3888888888889 | 1 | 16 | 3292.0 | 1 | 32 |
| 12 | Standalone | 399.5098039215686 | 1 | 16 | 2041.7 | 1 | 32 |
| 14 | JuMP | 33875.0 | 2 | 32 | 133917.0 | 5 | 128 |
| 14 | NLLSModel (Static) | 499.04651162790697 | 1 | 16 | 2645.75 | 1 | 32 |
| 14 | Standalone | 496.9512195121951 | 1 | 16 | 2791.625 | 1 | 32 |
| 16 | JuMP | 43375.0 | 2 | 32 | 169583.0 | 5 | 128 |
| 16 | NLLSModel (Static) | 608.3142857142857 | 1 | 16 | 2365.777777777778 | 1 | 32 |
| 16 | Standalone | 662.6451612903226 | 1 | 16 | 3514.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 2 | CaNNOLeS | 19771.0 | 180 | 14000 | 4 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | Ipopt | 605291.5 | 460 | 23424 | 4 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (tron) | 42000.0 | 204 | 10608 | 6 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (trunk) | 17708.0 | 91 | 4672 | 4 | 9.7541e-04 | true | ok | NaN | NaN | first\_order |
| 2 | LeastSquaresOptim (Dogleg) | 8500.0 | 115 | 254720 | 5 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 11146.0 | 111 | 254592 | 5 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | MadNLP | 376167.0 | 589 | 49600 | 4 | 9.7541e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 183917.0 | 1165 | 77216 | 111 | 9.7541e-04 | true | ok | NaN | NaN | StalledSuccess |
| 2 | NonlinearSolve (TrustRegion) | 149666.0 | 1303 | 3260896 | 9 | 9.7541e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 2 | Optim (Newton) | 10500.0 | 90 | 3920 | 4 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 13479.0 | 177 | 10576 | 4 | 9.7541e-04 | true | ok | NaN | NaN | converged |
| 2 | SecondOrderOptimization | 2666.0 | 32 | 1904 | 4 | 9.7541e-04 | true | ok | NaN | NaN | rel\_dcost |
| 3 | CaNNOLeS | 32833.0 | 184 | 21520 | 5 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | Ipopt | 651187.5 | 463 | 27632 | 4 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (tron) | 75999.5 | 231 | 12128 | 7 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (trunk) | 35208.0 | 105 | 5536 | 5 | 5.8709e-04 | true | ok | NaN | NaN | first\_order |
| 3 | LeastSquaresOptim (Dogleg) | 9583.0 | 115 | 256432 | 5 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 11812.5 | 129 | 307264 | 6 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | MadNLP | 387395.5 | 589 | 50000 | 4 | 5.8709e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 256750.0 | 1165 | 92496 | 111 | 5.8709e-04 | true | ok | NaN | NaN | StalledSuccess |
| 3 | NonlinearSolve (TrustRegion) | 304583.0 | 2783 | 7098256 | 57 | 5.8709e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 3 | Optim (Newton) | 13312.5 | 103 | 4400 | 5 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 19458.0 | 174 | 13120 | 5 | 5.8709e-04 | true | ok | NaN | NaN | converged |
| 3 | SecondOrderOptimization | 3667.0 | 32 | 2064 | 5 | 5.8709e-04 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost, step\_size |
| 4 | CaNNOLeS | 45875.0 | 184 | 28112 | 5 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 794104.5 | 518 | 31520 | 5 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 94520.5 | 221 | 12160 | 6 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 55812.5 | 113 | 6288 | 5 | 7.3068e-04 | true | ok | NaN | NaN | first\_order |
| 4 | LeastSquaresOptim (Dogleg) | 11958.0 | 115 | 258640 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 12083.0 | 111 | 258592 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | MadNLP | 410854.0 | 589 | 50848 | 4 | 7.3068e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 326167.0 | 1156 | 121536 | 110 | 7.3068e-04 | true | ok | NaN | NaN | StalledSuccess |
| 4 | NonlinearSolve (TrustRegion) | 159625.0 | 1623 | 4166000 | 18 | 7.3068e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 4 | Optim (Newton) | 14270.5 | 103 | 4656 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 26812.5 | 215 | 19184 | 5 | 7.3068e-04 | true | ok | NaN | NaN | converged |
| 4 | SecondOrderOptimization | 4209.0 | 32 | 2432 | 5 | 7.3068e-04 | true | ok | NaN | NaN | rel\_dcost |
| 5 | CaNNOLeS | 63104.0 | 184 | 35888 | 5 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | Ipopt | 781354.5 | 463 | 29904 | 4 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | JSOSolvers (tron) | 120729.0 | 217 | 12192 | 6 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | JSOSolvers (trunk) | 89479.5 | 125 | 7056 | 6 | 5.3926e-04 | true | ok | NaN | NaN | first\_order |
| 5 | LeastSquaresOptim (Dogleg) | 15458.0 | 115 | 260768 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 15458.5 | 111 | 260784 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | MadNLP | 492938.0 | 627 | 52288 | 5 | 5.3926e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 5 | NonlinearSolve (LM) | 426167.0 | 1165 | 145648 | 111 | 5.3926e-04 | true | ok | NaN | NaN | StalledSuccess |
| 5 | NonlinearSolve (TrustRegion) | 226042.0 | 1663 | 4329584 | 19 | 5.3926e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 5 | Optim (Newton) | 15709.0 | 103 | 4784 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 33270.5 | 215 | 22560 | 5 | 5.3926e-04 | true | ok | NaN | NaN | converged |
| 5 | SecondOrderOptimization | 5167.0 | 32 | 2688 | 5 | 5.3926e-04 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost, step\_size |
| 6 | CaNNOLeS | 84291.5 | 186 | 55472 | 5 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | Ipopt | 993458.5 | 520 | 44768 | 5 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (tron) | 194917.0 | 244 | 14000 | 7 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (trunk) | 118750.0 | 125 | 7424 | 6 | 5.4518e-04 | true | ok | NaN | NaN | first\_order |
| 6 | LeastSquaresOptim (Dogleg) | 17875.0 | 115 | 262640 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 18333.0 | 111 | 262688 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | MadNLP | 446958.5 | 589 | 52752 | 4 | 5.4518e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 515250.0 | 1165 | 186816 | 111 | 5.4518e-04 | true | ok | NaN | NaN | StalledSuccess |
| 6 | NonlinearSolve (TrustRegion) | 313333.0 | 2023 | 5347216 | 31 | 5.4518e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 6 | Optim (Newton) | 16875.0 | 103 | 5136 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 34437.5 | 174 | 23184 | 5 | 5.4518e-04 | true | ok | NaN | NaN | converged |
| 6 | SecondOrderOptimization | 6250.0 | 32 | 3168 | 5 | 5.4518e-04 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost, step\_size |
| 7 | CaNNOLeS | 94479.5 | 184 | 65840 | 4 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | Ipopt | 1.1250205e6 | 520 | 45856 | 5 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | JSOSolvers (tron) | 229999.5 | 234 | 13744 | 7 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | JSOSolvers (trunk) | 141270.5 | 119 | 7328 | 6 | 9.4639e-04 | true | ok | NaN | NaN | first\_order |
| 7 | LeastSquaresOptim (Dogleg) | 22666.0 | 120 | 266000 | 5 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | LeastSquaresOptim (LM) | 21958.5 | 116 | 266208 | 5 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | MadNLP | 572333.5 | 627 | 54480 | 5 | 9.4639e-04 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 7 | NonlinearSolve (LM) | 618104.5 | 1138 | 215744 | 108 | 9.4639e-04 | true | ok | NaN | NaN | StalledSuccess |
| 7 | NonlinearSolve (TrustRegion) | 643333.0 | 3278 | 8440704 | 69 | 9.4639e-04 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 7 | Optim (Newton) | 15958.5 | 90 | 4944 | 4 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | Optim (NewtonTrustRegion) | 37084.0 | 187 | 27840 | 4 | 9.4639e-04 | true | ok | NaN | NaN | converged |
| 7 | SecondOrderOptimization | 6500.0 | 32 | 3504 | 4 | 9.4639e-04 | true | ok | NaN | NaN | rel\_dcost |
| 8 | CaNNOLeS | 138729.5 | 202 | 76928 | 5 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 1.2675e6 | 520 | 47360 | 5 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 312646.0 | 241 | 14592 | 7 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 193145.5 | 123 | 7888 | 6 | 1.1478e-03 | true | ok | NaN | NaN | first\_order |
| 8 | LeastSquaresOptim (Dogleg) | 24583.0 | 121 | 266848 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 24562.5 | 117 | 267168 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | MadNLP | 563375.0 | 597 | 55488 | 5 | 1.1478e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 747583.0 | 1169 | 262864 | 111 | 1.1478e-03 | true | ok | NaN | NaN | StalledSuccess |
| 8 | NonlinearSolve (TrustRegion) | 262791.0 | 1212 | 2973136 | 11 | 1.1478e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 8 | Optim (Newton) | 19854.0 | 103 | 5680 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 51104.5 | 179 | 32384 | 5 | 1.1478e-03 | true | ok | NaN | NaN | converged |
| 8 | SecondOrderOptimization | 9208.0 | 32 | 4112 | 5 | 1.1478e-03 | true | ok | NaN | NaN | rel\_dcost, abs\_dcost |
| 10 | CaNNOLeS | 219458.5 | 203 | 109728 | 5 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | Ipopt | 1.714146e6 | 521 | 51280 | 5 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (tron) | 449875.0 | 238 | 15312 | 7 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (trunk) | 332500.0 | 136 | 9168 | 7 | 1.5727e-03 | true | ok | NaN | NaN | first\_order |
| 10 | LeastSquaresOptim (Dogleg) | 34604.5 | 121 | 271568 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 33166.5 | 117 | 271856 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | MadNLP | 663125.0 | 597 | 58400 | 5 | 1.5727e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 1.020166e6 | 1196 | 378416 | 114 | 1.5727e-03 | true | ok | NaN | NaN | StalledSuccess |
| 10 | NonlinearSolve (TrustRegion) | 875500.0 | 3258 | 8412560 | 62 | 1.5727e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 10 | Optim (Newton) | 23833.0 | 103 | 6592 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 64542.0 | 179 | 42128 | 5 | 1.5727e-03 | true | ok | NaN | NaN | converged |
| 10 | SecondOrderOptimization | 14250.0 | 32 | 5200 | 5 | 1.5727e-03 | true | ok | NaN | NaN | rel\_dcost |
| 12 | CaNNOLeS | 292645.5 | 213 | 162352 | 5 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | Ipopt | 2.7143955e6 | 578 | 83264 | 6 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (tron) | 690646.0 | 245 | 16496 | 7 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 460250.5 | 135 | 9776 | 6 | 2.2976e-03 | true | ok | NaN | NaN | first\_order |
| 12 | LeastSquaresOptim (Dogleg) | 44146.0 | 121 | 276288 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 45167.0 | 117 | 277072 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | MadNLP | 1.204708e6 | 613 | 62128 | 7 | 2.2976e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 1.285917e6 | 1178 | 484928 | 112 | 2.2976e-03 | true | ok | NaN | NaN | StalledSuccess |
| 12 | NonlinearSolve (TrustRegion) | 4.1585834e7 | 7262 | 19548560 | 185 | 2.2976e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 12 | Optim (Newton) | 30792.0 | 103 | 7424 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 92792.0 | 220 | 63632 | 5 | 2.2976e-03 | true | ok | NaN | NaN | converged |
| 12 | SecondOrderOptimization | 20000.0 | 32 | 6496 | 5 | 2.2976e-03 | true | ok | NaN | NaN | rel\_dcost |
| 14 | CaNNOLeS | 398312.0 | 213 | 202736 | 5 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | Ipopt | 3.364146e6 | 578 | 85504 | 6 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | JSOSolvers (tron) | 924417.0 | 242 | 16976 | 7 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | JSOSolvers (trunk) | 599687.5 | 133 | 10144 | 6 | 2.5373e-03 | true | ok | NaN | NaN | first\_order |
| 14 | LeastSquaresOptim (Dogleg) | 66895.5 | 140 | 335680 | 6 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 57312.5 | 117 | 282208 | 5 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | MadNLP | 1.3387495e6 | 635 | 66512 | 6 | 2.5373e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 1.5774585e6 | 1169 | 596448 | 111 | 2.5373e-03 | true | ok | NaN | NaN | StalledSuccess |
| 14 | NonlinearSolve (TrustRegion) | 655250.0 | 1498 | 4170544 | 9 | 2.5373e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 14 | Optim (Newton) | 34875.0 | 103 | 8320 | 5 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 112896.0 | 220 | 76832 | 5 | 2.5373e-03 | true | ok | NaN | NaN | converged |
| 14 | SecondOrderOptimization | 20000.0 | 54 | 10880 | 5 | 2.5373e-03 | true | ok | NaN | NaN | rel\_dcost |
| 16 | CaNNOLeS | 511979.0 | 213 | 248976 | 5 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | Ipopt | 6.094271e6 | 740 | 98752 | 8 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (tron) | 1.2114165e6 | 249 | 17936 | 7 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 882437.5 | 143 | 11088 | 7 | 2.7881e-03 | true | ok | NaN | NaN | first\_order |
| 16 | LeastSquaresOptim (Dogleg) | 83000.0 | 140 | 343440 | 6 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 73438.0 | 117 | 289872 | 5 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | MadNLP | 1.501354e6 | 605 | 70560 | 6 | 2.7881e-03 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 1.9060205e6 | 1402 | 723856 | 112 | 2.7881e-03 | true | ok | NaN | NaN | StalledSuccess |
| 16 | NonlinearSolve (TrustRegion) | 1.480292e6 | 2577 | 7466512 | 41 | 2.7881e-03 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 16 | Optim (Newton) | 42417.0 | 105 | 9344 | 5 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 146458.5 | 244 | 94288 | 5 | 2.7881e-03 | true | ok | NaN | NaN | converged |
| 16 | SecondOrderOptimization | 20250.0 | 58 | 18112 | 5 | 2.7881e-03 | true | ok | NaN | NaN | rel\_dcost |
