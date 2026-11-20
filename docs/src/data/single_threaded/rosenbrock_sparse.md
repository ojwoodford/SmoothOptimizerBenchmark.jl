# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:24:42
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
| 100 | JuMP | 10584.0 | 5 | 80 | 25167.0 | 9 | 224 |
| 100 | NLLSModel | 270.8636363636364 | 1 | 16 | 3256.0 | 1 | 64 |
| 100 | Standalone (Sparse) | 270.5977011494253 | 1 | 16 | 4891.8 | 22 | 18544 |
| 250 | JuMP | 26375.0 | 5 | 80 | 61334.0 | 9 | 224 |
| 250 | NLLSModel | 648.4375 | 1 | 16 | 8041.666666666667 | 1 | 64 |
| 250 | Standalone (Sparse) | 513.0857142857143 | 1 | 16 | 10667.0 | 23 | 43840 |
| 500 | JuMP | 56625.0 | 5 | 80 | 128416.0 | 9 | 224 |
| 500 | NLLSModel | 1291.6875 | 1 | 16 | 15583.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 982.1428571428571 | 1 | 16 | 21083.0 | 24 | 87152 |
| 1000 | JuMP | 97417.0 | 5 | 80 | 264333.0 | 9 | 224 |
| 1000 | NLLSModel | 2583.25 | 1 | 16 | 31416.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 1875.0 | 1 | 16 | 44583.0 | 24 | 173712 |
| 2500 | JuMP | 310250.0 | 5 | 80 | 817042.0 | 9 | 224 |
| 2500 | NLLSModel | 6555.666666666667 | 1 | 16 | 84417.0 | 1 | 64 |
| 2500 | Standalone (Sparse) | 6000.0 | 1 | 16 | 104666.0 | 25 | 466032 |
| 5000 | JuMP | 1.06425e6 | 5 | 80 | 3.074916e6 | 9 | 224 |
| 5000 | NLLSModel | 12250.0 | 1 | 16 | 156750.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 10833.0 | 1 | 16 | 201917.0 | 25 | 890480 |
| 10000 | JuMP | 4.1435e6 | 5 | 80 | 1.0204875e7 | 9 | 224 |
| 10000 | NLLSModel | 24375.0 | 1 | 16 | 310875.0 | 1 | 64 |
| 10000 | Standalone (Sparse) | 21333.0 | 1 | 16 | 383500.0 | 25 | 1731184 |
| 20000 | JuMP | 1.0214167e7 | 5 | 80 | 2.4916e7 | 9 | 224 |
| 20000 | NLLSModel | 49125.0 | 1 | 16 | 622416.0 | 1 | 64 |
| 20000 | Standalone (Sparse) | 42166.0 | 1 | 16 | 774583.0 | 25 | 3428976 |
| 35000 | JuMP | 1.9424417e7 | 5 | 80 | 4.7427791e7 | 9 | 224 |
| 35000 | NLLSModel | 84334.0 | 1 | 16 | 1.105292e6 | 1 | 64 |
| 35000 | Standalone (Sparse) | 72875.0 | 1 | 16 | 1.384375e6 | 25 | 5964400 |
| 50000 | JuMP | 3.1304e7 | 5 | 80 | 7.2995875e7 | 9 | 224 |
| 50000 | NLLSModel | 123625.0 | 1 | 16 | 1.565834e6 | 1 | 64 |
| 50000 | Standalone (Sparse) | 104208.0 | 1 | 16 | 2.000709e6 | 25 | 8487536 |
| 75000 | JuMP | 4.7596542e7 | 5 | 80 | 1.14031667e8 | 9 | 224 |
| 75000 | NLLSModel | 186791.0 | 1 | 16 | 2.360584e6 | 1 | 64 |
| 75000 | Standalone (Sparse) | 165416.0 | 1 | 16 | 3.110208e6 | 25 | 12649072 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 100 | CaNNOLeS | 142979.0 | 218 | 177312 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 100 | Ipopt | 1.5747495e6 | 555 | 121952 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 100 | JSOSolvers (tron) | 930625.0 | 421 | 47136 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 100 | JSOSolvers (trunk) | 418833.0 | 426 | 45344 | 7 | 9.2500e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 100 | LeastSquaresOptim (Dogleg) | 135083.5 | 75 | 22064 | 5 | 5.0660e-28 | true | ok | NaN | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 122771.0 | 137 | 19856 | 17 | 1.6425e-15 | true | ok | NaN | NaN | converged |
| 100 | MadNLP | 700604.5 | 673 | 110480 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 3.0383667e7 | 809 | 460784 | 120 | 2.5247e-25 | true | ok | NaN | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 190666.5 | 905 | 223792 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 100 | Optim (Newton) | 219333.5 | 553 | 372912 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 100 | SecondOrderOptimization | 73500.0 | 224 | 120304 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 250 | CaNNOLeS | 343354.0 | 232 | 403744 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 250 | Ipopt | 2.9890625e6 | 566 | 231552 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 250 | JSOSolvers (tron) | 2.287e6 | 428 | 85216 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 250 | JSOSolvers (trunk) | 938917.0 | 432 | 72816 | 7 | 1.0154e-16 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 250 | LeastSquaresOptim (Dogleg) | 302625.0 | 78 | 40992 | 5 | 5.7069e-28 | true | ok | NaN | NaN | converged |
| 250 | LeastSquaresOptim (LM) | 300916.5 | 146 | 38128 | 18 | 8.3212e-16 | true | ok | NaN | NaN | converged |
| 250 | MadNLP | 3.420375e7 | 11811 | 375984 | 51 | 2.0488e-12 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 250 | NonlinearSolve (LM) | 1.792996665e8 | 816 | 2028880 | 120 | 4.4480e-25 | true | ok | NaN | NaN | StalledSuccess |
| 250 | NonlinearSolve (TrustRegion) | 356479.5 | 930 | 501376 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 250 | Optim (Newton) | 385104.0 | 576 | 853216 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 250 | SecondOrderOptimization | 203583.0 | 233 | 275312 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 500 | CaNNOLeS | 646979.0 | 246 | 795392 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 500 | Ipopt | 5.2193545e6 | 597 | 458992 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 500 | JSOSolvers (tron) | 4.439e6 | 445 | 151824 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 500 | JSOSolvers (trunk) | 1.709375e6 | 445 | 120480 | 7 | 9.5090e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 500 | LeastSquaresOptim (Dogleg) | 596771.0 | 88 | 74400 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 500 | LeastSquaresOptim (LM) | 613354.0 | 155 | 69856 | 18 | 7.3225e-16 | true | ok | NaN | NaN | converged |
| 500 | MadNLP | 1.937479e6 | 710 | 341264 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 500 | NonlinearSolve (LM) | 5.92368542e8 | 20042 | 133270768 | 120 | 6.9305e-25 | true | ok | NaN | NaN | StalledSuccess |
| 500 | NonlinearSolve (TrustRegion) | 671500.0 | 989 | 976896 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 500 | Optim (Newton) | 684771.0 | 602 | 1691584 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 500 | SecondOrderOptimization | 262416.5 | 278 | 554032 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 1000 | CaNNOLeS | 1.311354e6 | 250 | 1610560 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 1000 | Ipopt | 9.5348955e6 | 601 | 931920 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 1000 | JSOSolvers (tron) | 8.673917e6 | 446 | 283488 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 1000 | JSOSolvers (trunk) | 3.280042e6 | 447 | 214720 | 7 | 8.5552e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 1000 | LeastSquaresOptim (Dogleg) | 1.183354e6 | 88 | 140256 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 1000 | LeastSquaresOptim (LM) | 1.1836875e6 | 149 | 132064 | 17 | 5.7105e-15 | true | ok | NaN | NaN | converged |
| 1000 | MadNLP | 3.537083e6 | 722 | 633136 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1000 | NonlinearSolve (LM) | 2.253359375e9 | 20585 | 253319104 | 119 | 1.0950e-24 | true | ok | NaN | NaN | StalledSuccess |
| 1000 | NonlinearSolve (TrustRegion) | 1.111854e6 | 1000 | 1795808 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 1000 | Optim (Newton) | 1.1629795e6 | 622 | 3366336 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000 | SecondOrderOptimization | 542583.5 | 283 | 1081616 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 2500 | CaNNOLeS | 4.7134165e6 | 252 | 4207456 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 2500 | Ipopt | 2.6903542e7 | 605 | 2351056 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 2500 | JSOSolvers (tron) | 2.1839792e7 | 448 | 735600 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 2500 | JSOSolvers (trunk) | 8.744625e6 | 447 | 546496 | 7 | 7.4927e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 2500 | LeastSquaresOptim (Dogleg) | 3.136042e6 | 88 | 362480 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 2500 | LeastSquaresOptim (LM) | 3.131125e6 | 149 | 344496 | 17 | 5.1568e-15 | true | ok | NaN | NaN | converged |
| 2500 | MadNLP | 1.74150791e8 | 5281 | 1665584 | 25 | 1.0882e-12 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 2500 | NonlinearSolve (LM) | 1.4675387209e10 | 873 | 163359056 | 119 | 2.5764e-24 | true | ok | NaN | NaN | StalledSuccess |
| 2500 | NonlinearSolve (TrustRegion) | 4.6646045e6 | 7141 | 6604256 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 2500 | Optim (Newton) | 2.6401465e6 | 628 | 8909056 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 2500 | SecondOrderOptimization | 1.2818335e6 | 289 | 2819520 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 5000 | CaNNOLeS | 1.19915205e7 | 254 | 8205184 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 5000 | Ipopt | 5.6884791e7 | 609 | 4716592 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 5000 | JSOSolvers (tron) | 6.0732209e7 | 448 | 1483632 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 5000 | JSOSolvers (trunk) | 2.6136458e7 | 447 | 1058496 | 7 | 6.9280e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 5000 | LeastSquaresOptim (Dogleg) | 5.670167e6 | 88 | 749024 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 6.1518965e6 | 148 | 705120 | 17 | 3.7472e-15 | true | ok | NaN | NaN | converged |
| 5000 | MadNLP | 2.6282791e7 | 722 | 3222320 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 3.013231025e10 | 11792 | 697663856 | 66 | 7.1125e-24 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 5000 | NonlinearSolve (TrustRegion) | 8.895667e6 | 13200 | 13564608 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 5000 | Optim (Newton) | 5.222542e6 | 744 | 18007104 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 5000 | SecondOrderOptimization | 2.617083e6 | 289 | 5818096 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 10000 | CaNNOLeS | 3.24490835e7 | 256 | 16004000 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 10000 | Ipopt | 1.2476275e8 | 625 | 8799856 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 10000 | JSOSolvers (tron) | 3.01365e8 | 450 | 2652112 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 10000 | JSOSolvers (trunk) | 1.12599834e8 | 447 | 1910464 | 7 | 6.5636e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 10000 | LeastSquaresOptim (Dogleg) | 1.1402271e7 | 88 | 1325904 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 10000 | LeastSquaresOptim (LM) | 1.17745005e7 | 148 | 1257488 | 17 | 1.2073e-15 | true | ok | NaN | NaN | converged |
| 10000 | MadNLP | 6.9968833e7 | 722 | 5993312 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 10000 | NonlinearSolve (TrustRegion) | 1.8284625e7 | 25322 | 25366672 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 10000 | Optim (Newton) | 1.03450625e7 | 692 | 33503488 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000 | SecondOrderOptimization | 5.1736035e6 | 289 | 10676640 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 20000 | CaNNOLeS | 7.80240415e7 | 258 | 33158080 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 20000 | Ipopt | 2.75689937e8 | 629 | 17588912 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 20000 | JSOSolvers (tron) | 1.021076833e9 | 450 | 5283792 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 20000 | JSOSolvers (trunk) | 3.75784459e8 | 447 | 3794624 | 7 | 6.3519e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 20000 | LeastSquaresOptim (Dogleg) | 2.32668125e7 | 93 | 2642784 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 20000 | LeastSquaresOptim (LM) | 2.2524333e7 | 158 | 2504416 | 16 | 3.3775e-15 | true | ok | NaN | NaN | converged |
| 20000 | MadNLP | 1.63324687e8 | 731 | 11706032 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 20000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 20000 | NonlinearSolve (TrustRegion) | 3.8221833e7 | 49431 | 50484208 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 20000 | Optim (Newton) | 2.1157896e7 | 663 | 66791216 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 20000 | SecondOrderOptimization | 1.0472563e7 | 290 | 21327472 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 35000 | CaNNOLeS | 1.41782542e8 | 260 | 62616544 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 35000 | Ipopt | 4.765945e8 | 633 | 31828720 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 35000 | JSOSolvers (tron) | 2.081032917e9 | 450 | 9392080 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 35000 | JSOSolvers (trunk) | 7.26639625e8 | 447 | 6710976 | 7 | 6.2538e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 35000 | LeastSquaresOptim (Dogleg) | 4.0910666e7 | 93 | 4703584 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 35000 | LeastSquaresOptim (LM) | 3.9141896e7 | 158 | 4462304 | 16 | 1.1779e-15 | true | ok | NaN | NaN | converged |
| 35000 | MadNLP | 1.6565706208e10 | 9472 | 20751744 | 48 | 1.6663e-12 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 35000 | NonlinearSolve (TrustRegion) | 8.1818208e7 | 85601 | 85090816 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 35000 | Optim (Newton) | 4.14321665e7 | 628 | 117114112 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 35000 | SecondOrderOptimization | 1.8539854e7 | 290 | 37582960 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 50000 | CaNNOLeS | 2.11283166e8 | 260 | 81130464 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 50000 | Ipopt | 7.02151646e8 | 633 | 43965168 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 50000 | JSOSolvers (tron) | 1.372177041e9 | 285 | 13070560 | 5 | 5.3154e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 50000 | JSOSolvers (trunk) | 1.146883959e9 | 458 | 9349328 | 8 | 5.2000e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 50000 | LeastSquaresOptim (Dogleg) | 5.9999667e7 | 93 | 6548832 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 50000 | LeastSquaresOptim (LM) | 5.6426708e7 | 158 | 6215392 | 16 | 9.2695e-16 | true | ok | NaN | NaN | converged |
| 50000 | MadNLP | 4.917280625e8 | 731 | 28983472 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 50000 | NonlinearSolve (TrustRegion) | 1.40809291e8 | 121788 | 120672304 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 50000 | Optim (Newton) | 5.68709585e7 | 640 | 165430720 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 50000 | SecondOrderOptimization | 2.70625835e7 | 290 | 55296112 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 75000 | CaNNOLeS | 3.2555175e8 | 262 | 129758208 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 75000 | Ipopt | 1.090114625e9 | 637 | 64973616 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 75000 | JSOSolvers (tron) | 2.228714709e9 | 291 | 19493376 | 6 | 2.4189e-18 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 75000 | JSOSolvers (trunk) | 1.894127417e9 | 196 | 13950992 | 9 | 6.8484e-20 | true | ok | NaN | NaN | first\_order |
| 75000 | LeastSquaresOptim (Dogleg) | 8.723875e7 | 92 | 9758176 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 75000 | LeastSquaresOptim (LM) | 8.9989208e7 | 165 | 9273312 | 17 | 1.1132e-15 | true | ok | NaN | NaN | converged |
| 75000 | MadNLP | 7.362726455e8 | 731 | 43117744 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 75000 | NonlinearSolve (TrustRegion) | 2.204018335e8 | 182096 | 184186976 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 75000 | Optim (Newton) | 8.8350625e7 | 628 | 246351104 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 75000 | SecondOrderOptimization | 4.05055e7 | 290 | 79203440 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
