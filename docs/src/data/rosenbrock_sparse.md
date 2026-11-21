# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T02:59:13
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
| 100 | JuMP | 10375.0 | 5 | 80 | 25334.0 | 9 | 224 |
| 100 | NLLSModel | 291.05797101449275 | 1 | 16 | 3137.0 | 1 | 64 |
| 100 | Standalone (Sparse) | 258.325 | 1 | 16 | 4775.0 | 22 | 18544 |
| 250 | JuMP | 24584.0 | 5 | 80 | 64583.0 | 9 | 224 |
| 250 | NLLSModel | 377.55102040816325 | 1 | 16 | 7791.666666666667 | 1 | 64 |
| 250 | Standalone (Sparse) | 496.875 | 1 | 16 | 10833.0 | 23 | 43840 |
| 500 | JuMP | 49542.0 | 5 | 80 | 129208.0 | 9 | 224 |
| 500 | NLLSModel | 1030.6842105263158 | 1 | 16 | 15917.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 986.1428571428571 | 1 | 16 | 19625.0 | 24 | 87152 |
| 1000 | JuMP | 98959.0 | 5 | 80 | 259500.0 | 9 | 224 |
| 1000 | NLLSModel | 1227.9411764705883 | 1 | 16 | 30709.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 1844.6363636363637 | 1 | 16 | 40375.0 | 24 | 173712 |
| 2500 | JuMP | 272334.0 | 5 | 80 | 810166.0 | 9 | 224 |
| 2500 | NLLSModel | 1704.8333333333333 | 1 | 16 | 31125.0 | 1 | 64 |
| 2500 | Standalone (Sparse) | 5552.0 | 1 | 16 | 110083.0 | 25 | 466032 |
| 5000 | JuMP | 1.06375e6 | 5 | 80 | 2.577125e6 | 9 | 224 |
| 5000 | NLLSModel | 2588.5 | 1 | 16 | 56625.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 10958.0 | 1 | 16 | 214166.0 | 25 | 890480 |
| 10000 | JuMP | 2.827833e6 | 5 | 80 | 7.440333e6 | 9 | 224 |
| 10000 | NLLSModel | 3966.6 | 1 | 16 | 107791.0 | 1 | 64 |
| 10000 | Standalone (Sparse) | 20958.0 | 1 | 16 | 386166.0 | 25 | 1731184 |
| 20000 | JuMP | 9.493667e6 | 5 | 80 | 2.1727041e7 | 9 | 224 |
| 20000 | NLLSModel | 7291.0 | 1 | 16 | 231417.0 | 1 | 64 |
| 20000 | Standalone (Sparse) | 41334.0 | 1 | 16 | 780417.0 | 25 | 3428976 |
| 35000 | JuMP | 1.6901208e7 | 5 | 80 | 4.0133708e7 | 9 | 224 |
| 35000 | NLLSModel | 11917.0 | 1 | 16 | 615500.0 | 1 | 64 |
| 35000 | Standalone (Sparse) | 71500.0 | 1 | 16 | 1.318833e6 | 25 | 5964400 |
| 50000 | JuMP | 2.6328625e7 | 5 | 80 | 6.1254125e7 | 9 | 224 |
| 50000 | NLLSModel | 16959.0 | 1 | 16 | 727167.0 | 1 | 64 |
| 50000 | Standalone (Sparse) | 102375.0 | 1 | 16 | 1.915e6 | 25 | 8487536 |
| 75000 | JuMP | 4.118275e7 | 5 | 80 | 9.54215e7 | 9 | 224 |
| 75000 | NLLSModel | 24667.0 | 1 | 16 | 1.204792e6 | 1 | 64 |
| 75000 | Standalone (Sparse) | 152417.0 | 1 | 16 | 2.901542e6 | 25 | 12649072 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 100 | CaNNOLeS | 139792.0 | 218 | 177312 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 100 | Ipopt | 1.504375e6 | 547 | 121552 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 100 | JSOSolvers (tron) | 875000.0 | 421 | 47136 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 100 | JSOSolvers (trunk) | 436917.0 | 426 | 45344 | 7 | 9.2500e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 100 | LeastSquaresOptim (Dogleg) | 131792.0 | 75 | 22064 | 5 | 5.0660e-28 | true | ok | NaN | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 122834.0 | 137 | 19856 | 17 | 1.6425e-15 | true | ok | NaN | NaN | converged |
| 100 | MadNLP | 694792.0 | 673 | 110480 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 2.9455979e7 | 809 | 460784 | 120 | 2.5247e-25 | true | ok | NaN | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 194291.5 | 905 | 223792 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 100 | Optim (Newton) | 213041.0 | 553 | 372912 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 100 | SecondOrderOptimization | 66834.0 | 224 | 120304 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 250 | CaNNOLeS | 331333.5 | 232 | 403744 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 250 | Ipopt | 2.7605835e6 | 558 | 231152 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 250 | JSOSolvers (tron) | 2.225646e6 | 428 | 85216 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 250 | JSOSolvers (trunk) | 923125.0 | 432 | 72816 | 7 | 1.0154e-16 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 250 | LeastSquaresOptim (Dogleg) | 293375.0 | 78 | 40992 | 5 | 5.7069e-28 | true | ok | NaN | NaN | converged |
| 250 | LeastSquaresOptim (LM) | 293083.5 | 146 | 38128 | 18 | 8.3212e-16 | true | ok | NaN | NaN | converged |
| 250 | MadNLP | 3.3373125e7 | 11811 | 375984 | 51 | 2.0488e-12 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 250 | NonlinearSolve (LM) | 1.72853584e8 | 816 | 2028880 | 120 | 4.4480e-25 | true | ok | NaN | NaN | StalledSuccess |
| 250 | NonlinearSolve (TrustRegion) | 353396.0 | 930 | 501376 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 250 | Optim (Newton) | 380875.0 | 576 | 853216 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 250 | SecondOrderOptimization | 198687.5 | 233 | 275312 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 500 | CaNNOLeS | 655458.0 | 246 | 795392 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 500 | Ipopt | 4.856e6 | 589 | 458592 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 500 | JSOSolvers (tron) | 4.253625e6 | 445 | 151824 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 500 | JSOSolvers (trunk) | 1.670042e6 | 445 | 120480 | 7 | 9.5090e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 500 | LeastSquaresOptim (Dogleg) | 566416.5 | 88 | 74400 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 500 | LeastSquaresOptim (LM) | 577166.5 | 155 | 69856 | 18 | 7.3225e-16 | true | ok | NaN | NaN | converged |
| 500 | MadNLP | 1.7919375e6 | 710 | 341264 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 500 | NonlinearSolve (LM) | 5.703628335e8 | 20042 | 133270768 | 120 | 6.9305e-25 | true | ok | NaN | NaN | StalledSuccess |
| 500 | NonlinearSolve (TrustRegion) | 591125.0 | 989 | 976896 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 500 | Optim (Newton) | 625041.5 | 602 | 1691584 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 500 | SecondOrderOptimization | 272687.5 | 278 | 554032 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 1000 | CaNNOLeS | 1.333625e6 | 250 | 1610560 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 1000 | Ipopt | 9.326521e6 | 593 | 931520 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 1000 | JSOSolvers (tron) | 8.430417e6 | 446 | 283488 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 1000 | JSOSolvers (trunk) | 3.2585e6 | 447 | 214720 | 7 | 8.5552e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 1000 | LeastSquaresOptim (Dogleg) | 1.156875e6 | 88 | 140256 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 1000 | LeastSquaresOptim (LM) | 1.1369375e6 | 149 | 132064 | 17 | 5.7105e-15 | true | ok | NaN | NaN | converged |
| 1000 | MadNLP | 3.189854e6 | 722 | 633136 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1000 | NonlinearSolve (LM) | 2.216307834e9 | 21321 | 253330880 | 119 | 1.0950e-24 | true | ok | NaN | NaN | StalledSuccess |
| 1000 | NonlinearSolve (TrustRegion) | 1.044458e6 | 1000 | 1795808 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 1000 | Optim (Newton) | 1.0935e6 | 622 | 3366336 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000 | SecondOrderOptimization | 524541.5 | 283 | 1081616 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 2500 | CaNNOLeS | 3.8856045e6 | 252 | 4207456 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 2500 | Ipopt | 2.4058375e7 | 597 | 2350656 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 2500 | JSOSolvers (tron) | 2.1327937e7 | 448 | 735600 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 2500 | JSOSolvers (trunk) | 8.390958e6 | 447 | 546496 | 7 | 7.4927e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 2500 | LeastSquaresOptim (Dogleg) | 3.085979e6 | 88 | 362480 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 2500 | LeastSquaresOptim (LM) | 3.070958e6 | 149 | 344496 | 17 | 5.1568e-15 | true | ok | NaN | NaN | converged |
| 2500 | MadNLP | 1.47072959e8 | 5281 | 1665584 | 25 | 1.0882e-12 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 2500 | NonlinearSolve (LM) | 1.4253482583e10 | 873 | 163359056 | 119 | 2.5764e-24 | true | ok | NaN | NaN | StalledSuccess |
| 2500 | NonlinearSolve (TrustRegion) | 4.405146e6 | 7141 | 6604256 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 2500 | Optim (Newton) | 2.5860415e6 | 628 | 8909056 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 2500 | SecondOrderOptimization | 1.101083e6 | 418 | 3037696 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 5000 | CaNNOLeS | 9.985e6 | 254 | 8205184 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 5000 | Ipopt | 5.48150415e7 | 601 | 4716192 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 5000 | JSOSolvers (tron) | 6.1597083e7 | 448 | 1483632 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 5000 | JSOSolvers (trunk) | 2.8222334e7 | 447 | 1058496 | 7 | 6.9280e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 5000 | LeastSquaresOptim (Dogleg) | 5.607271e6 | 88 | 749024 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 6.043896e6 | 148 | 705120 | 17 | 3.7472e-15 | true | ok | NaN | NaN | converged |
| 5000 | MadNLP | 2.2601792e7 | 722 | 3222320 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 3.0015140125e10 | 12130 | 718703248 | 68 | 7.1108e-24 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 5000 | NonlinearSolve (TrustRegion) | 8.492666e6 | 13200 | 13564608 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 5000 | Optim (Newton) | 5.145917e6 | 628 | 18005248 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 5000 | SecondOrderOptimization | 2.223125e6 | 418 | 6220592 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 10000 | CaNNOLeS | 2.8154042e7 | 256 | 15856544 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 10000 | Ipopt | 1.901453292e9 | 617 | 8799456 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 10000 | JSOSolvers (tron) | 3.801896875e8 | 450 | 2652112 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 10000 | JSOSolvers (trunk) | 9.6324584e7 | 447 | 1910464 | 7 | 6.5636e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 10000 | LeastSquaresOptim (Dogleg) | 1.18485415e7 | 88 | 1325904 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 10000 | LeastSquaresOptim (LM) | 1.21609995e7 | 148 | 1257488 | 17 | 1.2073e-15 | true | ok | NaN | NaN | converged |
| 10000 | MadNLP | 5.9830708e7 | 722 | 5993312 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 10000 | NonlinearSolve (TrustRegion) | 1.7839125e7 | 25274 | 25365904 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 10000 | Optim (Newton) | 1.0796834e7 | 676 | 33503232 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000 | SecondOrderOptimization | 4.4278745e6 | 418 | 11423200 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 20000 | CaNNOLeS | 7.0053833e7 | 258 | 31552448 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 20000 | Ipopt | 2.169010708e9 | 621 | 17588512 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 20000 | JSOSolvers (tron) | 8.08792396e8 | 450 | 5283792 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 20000 | JSOSolvers (trunk) | 2.58486916e8 | 447 | 3794624 | 7 | 6.3519e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 20000 | LeastSquaresOptim (Dogleg) | 2.4830666e7 | 93 | 2642784 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 20000 | LeastSquaresOptim (LM) | 2.45257715e7 | 158 | 2504416 | 16 | 3.3775e-15 | true | ok | NaN | NaN | converged |
| 20000 | MadNLP | 1.570287915e8 | 731 | 11706032 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 20000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 20000 | NonlinearSolve (TrustRegion) | 3.8172792e7 | 49427 | 50484144 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 20000 | Optim (Newton) | 2.33754165e7 | 652 | 66791040 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 20000 | SecondOrderOptimization | 1.83846665e7 | 419 | 22811312 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 35000 | CaNNOLeS | 1.39552584e8 | 260 | 62616544 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 35000 | Ipopt | 2.288310167e9 | 625 | 31828320 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 35000 | JSOSolvers (tron) | 2.053240375e9 | 450 | 9392080 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 35000 | JSOSolvers (trunk) | 6.62172667e8 | 447 | 6710976 | 7 | 6.2538e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 35000 | LeastSquaresOptim (Dogleg) | 4.44785415e7 | 93 | 4703584 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 35000 | LeastSquaresOptim (LM) | 4.3179959e7 | 158 | 4462304 | 16 | 1.1779e-15 | true | ok | NaN | NaN | converged |
| 35000 | MadNLP | 1.5509996084e10 | 9472 | 20751744 | 48 | 1.6663e-12 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 35000 | NonlinearSolve (TrustRegion) | 6.4385291e7 | 85601 | 85090816 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 35000 | Optim (Newton) | 3.9422209e7 | 640 | 117114304 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 35000 | SecondOrderOptimization | 1.9967229e7 | 419 | 41245872 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 50000 | CaNNOLeS | 2.0129075e8 | 260 | 77362144 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 50000 | Ipopt | 2.430594709e9 | 625 | 43964768 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 50000 | JSOSolvers (tron) | 1.50893575e9 | 285 | 13070560 | 5 | 5.3154e-17 | true | ok | NaN | NaN | small\_residual |
| 50000 | JSOSolvers (trunk) | 1.100800292e9 | 458 | 9349328 | 8 | 5.2000e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 50000 | LeastSquaresOptim (Dogleg) | 7.2126146e7 | 93 | 6548832 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 50000 | LeastSquaresOptim (LM) | 6.4592167e7 | 158 | 6215392 | 16 | 9.2695e-16 | true | ok | NaN | NaN | converged |
| 50000 | MadNLP | 4.286355e8 | 731 | 28983472 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 50000 | NonlinearSolve (TrustRegion) | 1.14326667e8 | 121788 | 120672304 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 50000 | Optim (Newton) | 5.6979063e7 | 680 | 165234752 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 50000 | SecondOrderOptimization | 3.40050205e7 | 419 | 57353392 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 75000 | CaNNOLeS | 3.03758459e8 | 262 | 122303488 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 75000 | Ipopt | 2.821957667e9 | 629 | 65563040 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 75000 | JSOSolvers (tron) | 2.104971125e9 | 291 | 19493376 | 6 | 2.4189e-18 | true | ok | NaN | NaN | small\_residual |
| 75000 | JSOSolvers (trunk) | 1.68262175e9 | 196 | 13950992 | 9 | 6.8484e-20 | true | ok | NaN | NaN | first\_order |
| 75000 | LeastSquaresOptim (Dogleg) | 1.27364104e8 | 92 | 9758176 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 75000 | LeastSquaresOptim (LM) | 1.06675666e8 | 165 | 9273312 | 17 | 1.1132e-15 | true | ok | NaN | NaN | converged |
| 75000 | MadNLP | 6.73180292e8 | 731 | 43117744 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 75000 | NonlinearSolve (TrustRegion) | 1.70253354e8 | 182094 | 186906688 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 75000 | Optim (Newton) | 8.33880415e7 | 640 | 246220224 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 75000 | SecondOrderOptimization | 1.107315e8 | 427 | 84980016 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
