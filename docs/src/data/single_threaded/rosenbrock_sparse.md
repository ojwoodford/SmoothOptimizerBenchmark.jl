# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T02:21:56
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
| 100 | NLLSModel | 241.6625 | 1 | 16 | 3279.714285714286 | 1 | 64 |
| 100 | Standalone (Sparse) | 96.74634146341464 | 1 | 16 | 4437.5 | 22 | 18544 |
| 100 | NLPModels (MathOptNLSModel) | 10291.0 | 5 | 80 | 25291.0 | 9 | 224 |
| 250 | NLLSModel | 652.34375 | 1 | 16 | 8014.0 | 1 | 64 |
| 250 | Standalone (Sparse) | 182.42016806722688 | 1 | 16 | 10584.0 | 23 | 43840 |
| 250 | NLPModels (MathOptNLSModel) | 24583.0 | 5 | 80 | 60709.0 | 9 | 224 |
| 500 | NLLSModel | 1315.125 | 1 | 16 | 15667.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 327.8688524590164 | 1 | 16 | 26125.0 | 24 | 87152 |
| 500 | NLPModels (MathOptNLSModel) | 48333.0 | 5 | 80 | 124625.0 | 9 | 224 |
| 1000 | NLLSModel | 2476.8888888888887 | 1 | 16 | 32209.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 628.6764705882352 | 1 | 16 | 48167.0 | 24 | 173712 |
| 1000 | NLPModels (MathOptNLSModel) | 99500.0 | 5 | 80 | 244708.0 | 9 | 224 |
| 2500 | NLLSModel | 6031.25 | 1 | 16 | 79125.0 | 1 | 64 |
| 2500 | Standalone (Sparse) | 1419.8461538461538 | 1 | 16 | 119541.0 | 25 | 466032 |
| 2500 | NLPModels (MathOptNLSModel) | 414875.0 | 5 | 80 | 973417.0 | 9 | 224 |
| 5000 | NLLSModel | 12083.0 | 1 | 16 | 156458.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 2833.25 | 1 | 16 | 213125.0 | 25 | 890480 |
| 5000 | NLPModels (MathOptNLSModel) | 1.283875e6 | 5 | 80 | 2.711333e6 | 9 | 224 |
| 10000 | NLLSModel | 23958.0 | 1 | 16 | 314000.0 | 1 | 64 |
| 10000 | Standalone (Sparse) | 6010.5 | 1 | 16 | 443083.0 | 25 | 1731184 |
| 10000 | NLPModels (MathOptNLSModel) | 4.0315e6 | 5 | 80 | 1.0667625e7 | 9 | 224 |
| 20000 | NLLSModel | 47625.0 | 1 | 16 | 663000.0 | 1 | 64 |
| 20000 | Standalone (Sparse) | 11667.0 | 1 | 16 | 781209.0 | 25 | 3428976 |
| 20000 | NLPModels (MathOptNLSModel) | 9.421542e6 | 5 | 80 | 2.3870542e7 | 9 | 224 |
| 35000 | NLLSModel | 85375.0 | 1 | 16 | 1.165667e6 | 1 | 64 |
| 35000 | Standalone (Sparse) | 19167.0 | 1 | 16 | 1.404458e6 | 25 | 5964400 |
| 50000 | NLLSModel | 123667.0 | 1 | 16 | 1.598959e6 | 1 | 64 |
| 50000 | Standalone (Sparse) | 27750.0 | 1 | 16 | 2.22175e6 | 25 | 9011824 |
| 75000 | NLLSModel | 177875.0 | 1 | 16 | 2.475625e6 | 1 | 64 |
| 75000 | Standalone (Sparse) | 41916.0 | 1 | 16 | 3.107583e6 | 25 | 14942832 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 100 | SecondOrderOptimization (Dogleg) | 71604.5 | 228 | 122176 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM) | 74208.5 | 224 | 120304 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM, tall) | 1.5170005e6 | 110 | 726608 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | LeastSquaresOptim (Dogleg) | 134771.0 | 75 | 21888 | 5 | 5.0660e-28 | true | ok | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 119000.0 | 137 | 19664 | 17 | 1.6425e-15 | true | ok | NaN | converged |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 100 | Optim (Newton) | 213271.0 | 536 | 371360 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 100 | JSOSolvers (trunk) | 477667.0 | 426 | 45344 | 7 | 9.2500e-17 | false | not_converged | NaN | not\_desc |
| 100 | JSOSolvers (tron) | 931458.0 | 421 | 47136 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 100 | Ipopt | 1.564646e6 | 534 | 110160 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 100 | MadNLP | 592229.0 | 670 | 109744 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 2.560041e6 | 809 | 456112 | 10 | 8.1611e-18 | true | ok | NaN | Success |
| 100 | NonlinearSolve (TrustRegion) | 169563.0 | 884 | 201696 | 9 | 7.1048e-18 | true | ok | NaN | Success |
| 100 | CaNNOLeS | 145104.0 | 218 | 177312 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 250 | SecondOrderOptimization (Dogleg) | 216937.5 | 237 | 279456 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM) | 215187.5 | 233 | 275312 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM, tall) | 776958.0 | 354 | 1007440 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | LeastSquaresOptim (Dogleg) | 302187.5 | 78 | 40816 | 5 | 5.7069e-28 | true | ok | NaN | converged |
| 250 | LeastSquaresOptim (LM) | 287687.5 | 146 | 37936 | 18 | 8.3212e-16 | true | ok | NaN | converged |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 250 | Optim (Newton) | 390312.5 | 559 | 851664 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 250 | JSOSolvers (trunk) | 992583.0 | 432 | 72816 | 7 | 1.0154e-16 | false | not_converged | NaN | not\_desc |
| 250 | JSOSolvers (tron) | 2.291958e6 | 428 | 85216 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 250 | Ipopt | 2.8724585e6 | 543 | 204016 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 250 | MadNLP | 3.9315083e7 | 11808 | 375248 | 51 | -1.3051e-11 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 250 | NonlinearSolve (LM) | 1.50011875e7 | 816 | 2024208 | 10 | 2.0215e-17 | true | ok | NaN | Success |
| 250 | NonlinearSolve (TrustRegion) | 269166.5 | 908 | 453984 | 9 | 7.5608e-18 | true | ok | NaN | Success |
| 250 | CaNNOLeS | 331125.0 | 232 | 403744 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 500 | SecondOrderOptimization (Dogleg) | 300958.5 | 284 | 562368 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM) | 267520.5 | 278 | 554032 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM, tall) | 1.5178745e6 | 370 | 1838704 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | LeastSquaresOptim (Dogleg) | 583020.5 | 88 | 74224 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 500 | LeastSquaresOptim (LM) | 557812.5 | 155 | 69664 | 18 | 7.3225e-16 | true | ok | NaN | converged |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 500 | Optim (Newton) | 666729.5 | 585 | 1690032 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 500 | JSOSolvers (trunk) | 2.070334e6 | 445 | 120480 | 7 | 9.5090e-17 | false | not_converged | NaN | not\_desc |
| 500 | JSOSolvers (tron) | 4.769166e6 | 445 | 151824 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 500 | Ipopt | 5.2762915e6 | 574 | 404832 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 500 | MadNLP | 1.9212295e6 | 707 | 340528 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 500 | NonlinearSolve (LM) | 4.8218708e7 | 2332 | 11423056 | 10 | 4.0306e-17 | true | ok | NaN | Success |
| 500 | NonlinearSolve (TrustRegion) | 523124.5 | 966 | 886192 | 9 | 7.7191e-18 | true | ok | NaN | Success |
| 500 | CaNNOLeS | 728166.5 | 246 | 795392 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 1000 | SecondOrderOptimization (Dogleg) | 604000.0 | 289 | 1098144 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM) | 613583.5 | 283 | 1081616 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM, tall) | 3.1067915e6 | 370 | 3407792 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | LeastSquaresOptim (Dogleg) | 1.200354e6 | 88 | 140080 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 1000 | LeastSquaresOptim (LM) | 1.114875e6 | 149 | 131872 | 17 | 5.7105e-15 | true | ok | NaN | converged |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000 | Optim (Newton) | 1.1004995e6 | 605 | 3364784 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 1000 | JSOSolvers (trunk) | 3.571709e6 | 447 | 214720 | 7 | 8.5552e-17 | false | not_converged | NaN | not\_desc |
| 1000 | JSOSolvers (tron) | 8.726584e6 | 446 | 283488 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 1000 | Ipopt | 9.6094585e6 | 578 | 824512 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 1000 | MadNLP | 3.443646e6 | 719 | 632400 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1000 | NonlinearSolve (LM) | 2.04184583e8 | 2753 | 24034560 | 11 | 1.3975e-19 | true | ok | NaN | Success |
| 1000 | NonlinearSolve (TrustRegion) | 846041.5 | 977 | 1618544 | 9 | 7.7994e-18 | true | ok | NaN | Success |
| 1000 | CaNNOLeS | 1.376708e6 | 250 | 1610560 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 2500 | SecondOrderOptimization (Dogleg) | 1.369416e6 | 295 | 2860624 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM) | 1.3418955e6 | 289 | 2819520 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM, tall) | 7.6225625e6 | 370 | 8347856 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | LeastSquaresOptim (Dogleg) | 3.1312085e6 | 88 | 362304 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 2500 | LeastSquaresOptim (LM) | 3.029125e6 | 149 | 344304 | 17 | 5.1568e-15 | true | ok | NaN | converged |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2500 | Optim (Newton) | 2.6215205e6 | 611 | 8907504 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 2500 | JSOSolvers (trunk) | 9.411917e6 | 447 | 546496 | 7 | 7.4927e-17 | false | not_converged | NaN | not\_desc |
| 2500 | JSOSolvers (tron) | 2.3325791e7 | 448 | 735600 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 2500 | Ipopt | 2.5919771e7 | 582 | 2055232 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 2500 | MadNLP | 1.85586875e8 | 5278 | 1664848 | 25 | -7.1963e-11 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 2500 | NonlinearSolve (LM) | 1.397077667e9 | 873 | 163354384 | 11 | 3.4921e-19 | true | ok | NaN | Success |
| 2500 | NonlinearSolve (TrustRegion) | 3.611396e6 | 7263 | 6137008 | 9 | 7.8480e-18 | true | ok | NaN | Success |
| 2500 | CaNNOLeS | 4.821396e6 | 252 | 4207456 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 5000 | SecondOrderOptimization (Dogleg) | 2.6717085e6 | 295 | 5916544 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM) | 2.6548335e6 | 289 | 5818096 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM, tall) | 1.51883335e7 | 370 | 16624432 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | LeastSquaresOptim (Dogleg) | 5.7835625e6 | 88 | 748848 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 5.612667e6 | 148 | 704928 | 17 | 3.7472e-15 | true | ok | NaN | converged |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 5000 | Optim (Newton) | 5.2373125e6 | 611 | 18003696 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 5000 | JSOSolvers (trunk) | 2.6320375e7 | 447 | 1058496 | 7 | 6.9280e-17 | false | not_converged | NaN | not\_desc |
| 5000 | JSOSolvers (tron) | 6.3311708e7 | 448 | 1483632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 5000 | Ipopt | 5.8115167e7 | 586 | 4158624 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 5000 | MadNLP | 2.7554417e7 | 719 | 3221584 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 5.15890825e9 | 2570 | 119077072 | 11 | 6.9833e-19 | true | ok | NaN | Success |
| 5000 | NonlinearSolve (TrustRegion) | 6.900917e6 | 13176 | 12670576 | 9 | 7.8643e-18 | true | ok | NaN | Success |
| 5000 | CaNNOLeS | 1.2301375e7 | 254 | 8205184 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 10000 | SecondOrderOptimization (Dogleg) | 5.3952705e6 | 295 | 10840624 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM) | 5.377458e6 | 289 | 10676640 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM, tall) | 3.0053667e7 | 370 | 32063632 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 10000 | LeastSquaresOptim (LM) | 1.11316455e7 | 148 | 1257296 | 17 | 1.2073e-15 | true | ok | NaN | converged |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000 | Optim (Newton) | 1.0467146e7 | 650 | 33501536 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 10000 | JSOSolvers (trunk) | 1.15571625e8 | 447 | 1910464 | 7 | 6.5636e-17 | false | not_converged | NaN | not\_desc |
| 10000 | JSOSolvers (tron) | 3.14501208e8 | 450 | 2652112 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 10000 | Ipopt | 1.19263875e8 | 610 | 7734112 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 10000 | MadNLP | 7.0557708e7 | 719 | 5992576 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | 1.9942690042e10 | 2566 | 233154768 | 11 | 1.3966e-18 | true | ok | NaN | Success |
| 10000 | NonlinearSolve (TrustRegion) | 1.3446146e7 | 25250 | 23631168 | 9 | 7.8724e-18 | true | ok | NaN | Success |
| 10000 | CaNNOLeS | 3.15461045e7 | 256 | 15954848 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 20000 | SecondOrderOptimization (Dogleg) | 1.09465625e7 | 296 | 21655296 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM) | 1.1082604e7 | 290 | 21327472 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM, tall) | 6.2091083e7 | 372 | 66497072 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 20000 | LeastSquaresOptim (LM) | 2.1359084e7 | 158 | 2504224 | 16 | 3.3775e-15 | true | ok | NaN | converged |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 20000 | Optim (Newton) | 2.30269375e7 | 611 | 66789104 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 20000 | JSOSolvers (trunk) | 3.50622709e8 | 447 | 3794624 | 7 | 6.3520e-17 | false | not_converged | NaN | not\_desc |
| 20000 | JSOSolvers (tron) | 9.58039417e8 | 450 | 5283792 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 20000 | Ipopt | 2.58815104e8 | 606 | 15458080 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 20000 | MadNLP | 1.708466045e8 | 728 | 11705296 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 20000 | NonlinearSolve (LM) | 3.563294775e10 | 1706 | 231716624 | 5 | 5.3623e-02 | false | timeout | NaN | MaxTime |
| 20000 | NonlinearSolve (TrustRegion) | 2.88590205e7 | 49381 | 47051264 | 9 | 7.8765e-18 | true | ok | NaN | Success |
| 20000 | CaNNOLeS | 7.25506045e7 | 258 | 31765440 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 35000 | SecondOrderOptimization (Dogleg) | 1.9793334e7 | 296 | 38910208 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM) | 1.9464583e7 | 290 | 38320240 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM, tall) | 1.071090625e8 | 372 | 110960176 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 35000 | Optim (Newton) | 3.8043812e7 | 620 | 117112704 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 35000 | JSOSolvers (trunk) | 2.477475e7 | 362 | 6706416 | 7 | 6.2538e-17 | false | not_converged | NaN | not\_desc |
| 35000 | JSOSolvers (tron) | 6.7915333e7 | 149 | 9377632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 35000 | Ipopt | 8.15973125e7 | 460 | 48512000 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 35000 | MadNLP | 5.0961417e7 | 817 | 64565744 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | CaNNOLeS | 2.9536375e7 | 228 | 52255616 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 50000 | SecondOrderOptimization (Dogleg) | 2.8162479e7 | 296 | 55099648 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM) | 2.78923125e7 | 290 | 52904048 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM, tall) | 1.54119959e8 | 372 | 157298224 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 50000 | Optim (Newton) | 5.1811416e7 | 611 | 165232368 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 50000 | JSOSolvers (trunk) | 3.7531333e7 | 347 | 9344000 | 8 | 5.1989e-18 | false | not_converged | NaN | not\_desc |
| 50000 | JSOSolvers (tron) | 5.5227042e7 | 149 | 13064032 | 5 | 5.3154e-17 | false | not_converged | NaN | small\_residual |
| 50000 | Ipopt | 1.249475415e8 | 460 | 68746240 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 50000 | MadNLP | 7.68856875e7 | 817 | 91273712 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | CaNNOLeS | 4.5942041e7 | 228 | 76192640 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 75000 | SecondOrderOptimization (Dogleg) | 4.4482833e7 | 296 | 85347584 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM) | 4.0640042e7 | 290 | 84135024 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM, tall) | 2.2915325e8 | 372 | 235120176 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 75000 | Optim (Newton) | 8.038725e7 | 611 | 260685552 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 75000 | JSOSolvers (trunk) | 5.68135625e7 | 80 | 13945424 | 9 | 6.8484e-20 | true | ok | NaN | first\_order |
| 75000 | JSOSolvers (tron) | 8.2469334e7 | 149 | 19486560 | 6 | 2.4189e-18 | false | not_converged | NaN | small\_residual |
| 75000 | Ipopt | 1.764271665e8 | 460 | 102497280 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 75000 | MadNLP | 1.12242125e8 | 817 | 135964144 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | CaNNOLeS | 6.6924521e7 | 228 | 110943104 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
