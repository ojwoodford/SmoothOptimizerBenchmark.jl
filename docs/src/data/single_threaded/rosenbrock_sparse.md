# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T03:29:47
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 100 | NLLSModel | 236.43023255813952 | 1 | 16 | 3309.5714285714284 | 1 | 64 |
| 100 | Standalone (Sparse) | 92.78703703703704 | 1 | 16 | 4475.0 | 22 | 18544 |
| 100 | NLPModels (MathOptNLSModel) | 10458.0 | 5 | 80 | 24875.0 | 9 | 224 |
| 250 | NLLSModel | 613.6363636363636 | 1 | 16 | 7875.0 | 1 | 64 |
| 250 | Standalone (Sparse) | 169.4214876033058 | 1 | 16 | 10000.0 | 23 | 43840 |
| 250 | NLPModels (MathOptNLSModel) | 24583.0 | 5 | 80 | 60791.0 | 9 | 224 |
| 500 | NLLSModel | 1235.2941176470588 | 1 | 16 | 15834.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 327.1967213114754 | 1 | 16 | 18625.0 | 24 | 87152 |
| 500 | NLPModels (MathOptNLSModel) | 49083.0 | 5 | 80 | 121375.0 | 9 | 224 |
| 1000 | NLLSModel | 2481.4444444444443 | 1 | 16 | 31916.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 608.5757575757576 | 1 | 16 | 46083.0 | 24 | 173712 |
| 1000 | NLPModels (MathOptNLSModel) | 102792.0 | 5 | 80 | 243500.0 | 9 | 224 |
| 2500 | NLLSModel | 6041.5 | 1 | 16 | 79500.0 | 1 | 64 |
| 2500 | Standalone (Sparse) | 1441.6666666666667 | 1 | 16 | 128792.0 | 25 | 466032 |
| 2500 | NLPModels (MathOptNLSModel) | 270542.0 | 5 | 80 | 716166.0 | 9 | 224 |
| 5000 | NLLSModel | 12042.0 | 1 | 16 | 159709.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 2839.285714285714 | 1 | 16 | 256125.0 | 25 | 890480 |
| 5000 | NLPModels (MathOptNLSModel) | 1.32075e6 | 5 | 80 | 2.563958e6 | 9 | 224 |
| 10000 | NLLSModel | 23916.0 | 1 | 16 | 320666.0 | 1 | 64 |
| 10000 | Standalone (Sparse) | 5823.0 | 1 | 16 | 389667.0 | 25 | 1731184 |
| 10000 | NLPModels (MathOptNLSModel) | 2.91175e6 | 5 | 80 | 7.1685e6 | 9 | 224 |
| 20000 | NLLSModel | 47625.0 | 1 | 16 | 640459.0 | 1 | 64 |
| 20000 | Standalone (Sparse) | 11125.0 | 1 | 16 | 729709.0 | 25 | 3428976 |
| 20000 | NLPModels (MathOptNLSModel) | 9.000584e6 | 5 | 80 | 2.0639292e7 | 9 | 224 |
| 35000 | NLLSModel | 82750.0 | 1 | 16 | 1.131e6 | 1 | 64 |
| 35000 | Standalone (Sparse) | 19083.0 | 1 | 16 | 1.63125e6 | 25 | 5964400 |
| 50000 | NLLSModel | 119958.0 | 1 | 16 | 1.643666e6 | 1 | 64 |
| 50000 | Standalone (Sparse) | 27792.0 | 1 | 16 | 2.05525e6 | 25 | 8487536 |
| 75000 | NLLSModel | 177791.0 | 1 | 16 | 2.449167e6 | 1 | 64 |
| 75000 | Standalone (Sparse) | 40458.0 | 1 | 16 | 3.095666e6 | 25 | 12649072 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 100 | SecondOrderOptimization (Dogleg) | 72291.5 | 234 | 122288 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM) | 72687.0 | 230 | 120416 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | LeastSquaresOptim (Dogleg) | 133687.5 | 75 | 21888 | 5 | 5.0660e-28 | true | ok | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 120833.0 | 137 | 19664 | 17 | 1.6425e-15 | true | ok | NaN | converged |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 100 | Optim (Newton) | 217687.0 | 536 | 371360 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 100 | JSOSolvers (trunk) | 442292.0 | 426 | 45344 | 7 | 9.2500e-17 | false | not_converged | NaN | not\_desc |
| 100 | JSOSolvers (tron) | 920666.0 | 421 | 47136 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 100 | Ipopt | 1.533271e6 | 534 | 110160 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 100 | MadNLP | 578250.0 | 670 | 109744 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 2.519125e6 | 809 | 456112 | 10 | 8.1611e-18 | true | ok | NaN | Success |
| 100 | NonlinearSolve (TrustRegion) | 170562.5 | 884 | 201696 | 9 | 7.1048e-18 | true | ok | NaN | Success |
| 100 | CaNNOLeS | 153417.0 | 218 | 177312 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 250 | SecondOrderOptimization (Dogleg) | 222208.5 | 243 | 279568 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM) | 218021.0 | 239 | 275424 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | LeastSquaresOptim (Dogleg) | 295895.5 | 78 | 40816 | 5 | 5.7069e-28 | true | ok | NaN | converged |
| 250 | LeastSquaresOptim (LM) | 285812.5 | 146 | 37936 | 18 | 8.3212e-16 | true | ok | NaN | converged |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 250 | Optim (Newton) | 390542.0 | 559 | 851664 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 250 | JSOSolvers (trunk) | 990583.0 | 432 | 72816 | 7 | 1.0154e-16 | false | not_converged | NaN | not\_desc |
| 250 | JSOSolvers (tron) | 2.263084e6 | 428 | 85216 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 250 | Ipopt | 2.7993755e6 | 543 | 204016 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 250 | MadNLP | 3.3584042e7 | 11808 | 375248 | 51 | -1.3051e-11 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 250 | NonlinearSolve (LM) | 1.45596665e7 | 816 | 2024208 | 10 | 2.0215e-17 | true | ok | NaN | Success |
| 250 | NonlinearSolve (TrustRegion) | 300271.0 | 908 | 453984 | 9 | 7.5608e-18 | true | ok | NaN | Success |
| 250 | CaNNOLeS | 364125.0 | 232 | 403744 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 500 | SecondOrderOptimization (Dogleg) | 292812.5 | 290 | 562448 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM) | 299458.5 | 284 | 554112 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | LeastSquaresOptim (Dogleg) | 595396.0 | 88 | 74224 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 500 | LeastSquaresOptim (LM) | 572750.0 | 155 | 69664 | 18 | 7.3225e-16 | true | ok | NaN | converged |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 500 | Optim (Newton) | 690500.0 | 585 | 1690032 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 500 | JSOSolvers (trunk) | 1.883084e6 | 445 | 120480 | 7 | 9.5090e-17 | false | not_converged | NaN | not\_desc |
| 500 | JSOSolvers (tron) | 4.440042e6 | 445 | 151824 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 500 | Ipopt | 4.9259375e6 | 574 | 404832 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 500 | MadNLP | 1.687521e6 | 707 | 340528 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 500 | NonlinearSolve (LM) | 4.7211375e7 | 2332 | 11423056 | 10 | 4.0306e-17 | true | ok | NaN | Success |
| 500 | NonlinearSolve (TrustRegion) | 462917.0 | 966 | 886192 | 9 | 7.7191e-18 | true | ok | NaN | Success |
| 500 | CaNNOLeS | 690145.5 | 246 | 795392 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 1000 | SecondOrderOptimization (Dogleg) | 574584.0 | 295 | 1098368 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM) | 525209.0 | 289 | 1081840 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | LeastSquaresOptim (Dogleg) | 1.2162295e6 | 88 | 140080 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 1000 | LeastSquaresOptim (LM) | 1.10325e6 | 149 | 131872 | 17 | 5.7105e-15 | true | ok | NaN | converged |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000 | Optim (Newton) | 1.136375e6 | 605 | 3364784 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 1000 | JSOSolvers (trunk) | 3.54125e6 | 447 | 214720 | 7 | 8.5552e-17 | false | not_converged | NaN | not\_desc |
| 1000 | JSOSolvers (tron) | 8.543541e6 | 446 | 283488 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 1000 | Ipopt | 9.548479e6 | 578 | 824512 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 1000 | MadNLP | 3.0665205e6 | 719 | 632400 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1000 | NonlinearSolve (LM) | 1.99179e8 | 2677 | 24033344 | 11 | 1.3975e-19 | true | ok | NaN | Success |
| 1000 | NonlinearSolve (TrustRegion) | 812458.5 | 977 | 1618544 | 9 | 7.7994e-18 | true | ok | NaN | Success |
| 1000 | CaNNOLeS | 1.3831665e6 | 250 | 1610560 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 2500 | SecondOrderOptimization (Dogleg) | 1.353854e6 | 302 | 2860736 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM) | 1.2925625e6 | 296 | 2819632 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | LeastSquaresOptim (Dogleg) | 3.083437e6 | 88 | 362304 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 2500 | LeastSquaresOptim (LM) | 2.928937e6 | 149 | 344304 | 17 | 5.1568e-15 | true | ok | NaN | converged |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2500 | Optim (Newton) | 2.548021e6 | 611 | 8907504 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 2500 | JSOSolvers (trunk) | 9.148375e6 | 447 | 546496 | 7 | 7.4927e-17 | false | not_converged | NaN | not\_desc |
| 2500 | JSOSolvers (tron) | 2.2166792e7 | 448 | 735600 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 2500 | Ipopt | 2.4425604e7 | 582 | 2055232 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 2500 | MadNLP | 1.54470166e8 | 5278 | 1664848 | 25 | -7.1963e-11 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 2500 | NonlinearSolve (LM) | 1.36066775e9 | 873 | 163354384 | 11 | 3.4921e-19 | true | ok | NaN | Success |
| 2500 | NonlinearSolve (TrustRegion) | 3.521209e6 | 7117 | 6134672 | 9 | 7.8480e-18 | true | ok | NaN | Success |
| 2500 | CaNNOLeS | 4.398334e6 | 252 | 4207456 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 5000 | SecondOrderOptimization (Dogleg) | 2.641917e6 | 302 | 5916656 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM) | 2.627104e6 | 296 | 5818208 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | LeastSquaresOptim (Dogleg) | 5.6515e6 | 88 | 748848 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 5.7384375e6 | 148 | 704928 | 17 | 3.7472e-15 | true | ok | NaN | converged |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 5000 | Optim (Newton) | 5.1042915e6 | 611 | 18003696 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 5000 | JSOSolvers (trunk) | 2.6600209e7 | 447 | 1058496 | 7 | 6.9280e-17 | false | not_converged | NaN | not\_desc |
| 5000 | JSOSolvers (tron) | 6.5498583e7 | 448 | 1483632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 5000 | Ipopt | 5.2715666e7 | 586 | 4158624 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 5000 | MadNLP | 2.2591416e7 | 719 | 3221584 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 4.818166167e9 | 2564 | 119076976 | 11 | 6.9833e-19 | true | ok | NaN | Success |
| 5000 | NonlinearSolve (TrustRegion) | 6.792271e6 | 13236 | 12671536 | 9 | 7.8643e-18 | true | ok | NaN | Success |
| 5000 | CaNNOLeS | 1.0788854e7 | 254 | 8205184 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 10000 | SecondOrderOptimization (Dogleg) | 5.869729e6 | 302 | 10840736 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM) | 5.2680625e6 | 296 | 10676752 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 10000 | LeastSquaresOptim (LM) | 1.10792705e7 | 148 | 1257296 | 17 | 1.2073e-15 | true | ok | NaN | converged |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000 | Optim (Newton) | 1.02573955e7 | 611 | 33500912 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 10000 | JSOSolvers (trunk) | 1.03351708e8 | 447 | 1910464 | 7 | 6.5636e-17 | false | not_converged | NaN | not\_desc |
| 10000 | JSOSolvers (tron) | 2.81958458e8 | 450 | 2652112 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 10000 | Ipopt | 1.16453667e8 | 602 | 7733984 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 10000 | MadNLP | 5.7654541e7 | 719 | 5992576 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | 1.9326927084e10 | 2574 | 231713104 | 11 | 1.3966e-18 | true | ok | NaN | Success |
| 10000 | NonlinearSolve (TrustRegion) | 1.3444125e7 | 25276 | 23631584 | 9 | 7.8724e-18 | true | ok | NaN | Success |
| 10000 | CaNNOLeS | 2.93762915e7 | 256 | 15971232 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 20000 | SecondOrderOptimization (Dogleg) | 1.07328125e7 | 303 | 21647216 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM) | 1.06592505e7 | 297 | 21319392 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 20000 | LeastSquaresOptim (LM) | 2.1181959e7 | 158 | 2504224 | 16 | 3.3775e-15 | true | ok | NaN | converged |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 20000 | Optim (Newton) | 2.20250415e7 | 627 | 66789360 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 20000 | JSOSolvers (trunk) | 2.70052167e8 | 447 | 3794624 | 7 | 6.3520e-17 | false | not_converged | NaN | not\_desc |
| 20000 | JSOSolvers (tron) | 7.18043042e8 | 450 | 5283792 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 20000 | Ipopt | 2.46238813e8 | 610 | 15458144 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 20000 | MadNLP | 1.46635875e8 | 728 | 11705296 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 20000 | NonlinearSolve (LM) | 3.465129025e10 | 1570 | 225996432 | 5 | 5.3623e-02 | false | timeout | NaN | MaxTime |
| 20000 | NonlinearSolve (TrustRegion) | 3.19844795e7 | 49381 | 47051264 | 9 | 7.8765e-18 | true | ok | NaN | Success |
| 20000 | CaNNOLeS | 7.171375e7 | 258 | 31765440 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 35000 | SecondOrderOptimization (Dogleg) | 2.05189165e7 | 303 | 38926704 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM) | 2.0884104e7 | 297 | 38336736 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 35000 | Optim (Newton) | 3.7162875e7 | 635 | 117112944 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 35000 | JSOSolvers (trunk) | 2.1809125e7 | 347 | 6706176 | 7 | 6.2538e-17 | false | not_converged | NaN | not\_desc |
| 35000 | JSOSolvers (tron) | 6.9997584e7 | 149 | 9377632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 35000 | Ipopt | 8.213875e7 | 460 | 48512000 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 35000 | MadNLP | 5.0821208e7 | 817 | 64565744 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | CaNNOLeS | 2.975625e7 | 228 | 59677568 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 50000 | SecondOrderOptimization (Dogleg) | 2.8186292e7 | 303 | 55116144 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM) | 2.7438084e7 | 297 | 54886624 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 50000 | Optim (Newton) | 5.1746333e7 | 611 | 182992624 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 50000 | JSOSolvers (trunk) | 3.434675e7 | 347 | 9344000 | 8 | 5.1989e-18 | false | not_converged | NaN | not\_desc |
| 50000 | JSOSolvers (tron) | 5.1195333e7 | 149 | 13064032 | 5 | 5.3154e-17 | false | not_converged | NaN | small\_residual |
| 50000 | Ipopt | 1.14428667e8 | 460 | 68746240 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 50000 | MadNLP | 7.2540083e7 | 817 | 91273712 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | CaNNOLeS | 4.32152915e7 | 228 | 73784192 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 75000 | SecondOrderOptimization (Dogleg) | 4.2546417e7 | 303 | 80268656 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM) | 4.1400875e7 | 297 | 78859488 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 75000 | Optim (Newton) | 8.34713955e7 | 611 | 246218480 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 75000 | JSOSolvers (trunk) | 5.5892458e7 | 80 | 13945424 | 9 | 6.8484e-20 | true | ok | NaN | first\_order |
| 75000 | JSOSolvers (tron) | 8.0070875e7 | 149 | 19486560 | 6 | 2.4189e-18 | false | not_converged | NaN | small\_residual |
| 75000 | Ipopt | 1.77247417e8 | 460 | 102497280 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 75000 | MadNLP | 1.10051583e8 | 817 | 135964144 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | CaNNOLeS | 6.67142295e7 | 228 | 110156672 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
