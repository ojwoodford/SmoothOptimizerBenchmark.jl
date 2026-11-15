# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T02:45:18
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 100 | NLLSModel | 287.3134328358209 | 1 | 16 | 3309.5714285714284 | 1 | 64 |
| 100 | Standalone (Sparse) | 94.34196891191709 | 1 | 16 | 4200.0 | 22 | 18544 |
| 100 | NLPModels (MathOptNLSModel) | 11000.0 | 5 | 80 | 24750.0 | 9 | 224 |
| 250 | NLLSModel | 387.0192307692308 | 1 | 16 | 8333.333333333334 | 1 | 64 |
| 250 | Standalone (Sparse) | 169.74590163934425 | 1 | 16 | 9625.0 | 23 | 43840 |
| 250 | NLPModels (MathOptNLSModel) | 24583.0 | 5 | 80 | 60500.0 | 9 | 224 |
| 500 | NLLSModel | 1131.9583333333333 | 1 | 16 | 16875.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 327.1967213114754 | 1 | 16 | 19917.0 | 24 | 87152 |
| 500 | NLPModels (MathOptNLSModel) | 48584.0 | 5 | 80 | 122208.0 | 9 | 224 |
| 1000 | NLLSModel | 1327.1 | 1 | 16 | 32250.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 609.0588235294117 | 1 | 16 | 37791.0 | 24 | 173712 |
| 1000 | NLPModels (MathOptNLSModel) | 95333.0 | 5 | 80 | 240917.0 | 9 | 224 |
| 2500 | NLLSModel | 1763.8333333333333 | 1 | 16 | 33042.0 | 1 | 64 |
| 2500 | Standalone (Sparse) | 1508.9285714285713 | 1 | 16 | 120959.0 | 25 | 466032 |
| 2500 | NLPModels (MathOptNLSModel) | 260291.0 | 5 | 80 | 676084.0 | 9 | 224 |
| 5000 | NLLSModel | 2683.4 | 1 | 16 | 68917.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 3011.8571428571427 | 1 | 16 | 196334.0 | 25 | 890480 |
| 5000 | NLPModels (MathOptNLSModel) | 1.016875e6 | 5 | 80 | 2.879708e6 | 9 | 224 |
| 10000 | NLLSModel | 4241.8 | 1 | 16 | 133500.0 | 1 | 64 |
| 10000 | Standalone (Sparse) | 5854.25 | 1 | 16 | 431708.0 | 25 | 1731184 |
| 10000 | NLPModels (MathOptNLSModel) | 2.826291e6 | 5 | 80 | 7.23175e6 | 9 | 224 |
| 20000 | NLLSModel | 7166.666666666667 | 1 | 16 | 245208.0 | 1 | 64 |
| 20000 | Standalone (Sparse) | 11875.0 | 1 | 16 | 749459.0 | 25 | 3428976 |
| 20000 | NLPModels (MathOptNLSModel) | 9.869083e6 | 5 | 80 | 2.1470458e7 | 9 | 224 |
| 35000 | NLLSModel | 12042.0 | 1 | 16 | 380833.0 | 1 | 64 |
| 35000 | Standalone (Sparse) | 20292.0 | 1 | 16 | 1.265959e6 | 25 | 5964400 |
| 50000 | NLLSModel | 17084.0 | 1 | 16 | 574792.0 | 1 | 64 |
| 50000 | Standalone (Sparse) | 27791.0 | 1 | 16 | 1.945709e6 | 25 | 8487536 |
| 75000 | NLLSModel | 24541.0 | 1 | 16 | 858333.0 | 1 | 64 |
| 75000 | Standalone (Sparse) | 40667.0 | 1 | 16 | 2.917166e6 | 25 | 12649072 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 100 | SecondOrderOptimization (Dogleg) | 68104.0 | 234 | 122288 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM) | 66166.0 | 230 | 120416 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | LeastSquaresOptim (Dogleg) | 131854.5 | 75 | 21888 | 5 | 5.0660e-28 | true | ok | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 118937.5 | 137 | 19664 | 17 | 1.6425e-15 | true | ok | NaN | converged |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 100 | Optim (Newton) | 212333.5 | 536 | 371360 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 100 | JSOSolvers (trunk) | 496959.0 | 426 | 45344 | 7 | 9.2500e-17 | false | not_converged | NaN | not\_desc |
| 100 | JSOSolvers (tron) | 935458.0 | 421 | 47136 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 100 | Ipopt | 1.51475e6 | 534 | 110160 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 100 | MadNLP | 571000.0 | 670 | 109744 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 2.5038125e6 | 809 | 456112 | 10 | 8.1611e-18 | true | ok | NaN | Success |
| 100 | NonlinearSolve (TrustRegion) | 162854.0 | 884 | 201696 | 9 | 7.1048e-18 | true | ok | NaN | Success |
| 100 | CaNNOLeS | 149000.0 | 218 | 177312 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 250 | SecondOrderOptimization (Dogleg) | 195791.5 | 243 | 279568 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM) | 199000.0 | 239 | 275424 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | LeastSquaresOptim (Dogleg) | 294979.0 | 78 | 40816 | 5 | 5.7069e-28 | true | ok | NaN | converged |
| 250 | LeastSquaresOptim (LM) | 282749.5 | 146 | 37936 | 18 | 8.3212e-16 | true | ok | NaN | converged |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 250 | Optim (Newton) | 386375.0 | 559 | 851664 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 250 | JSOSolvers (trunk) | 961458.0 | 432 | 72816 | 7 | 1.0154e-16 | false | not_converged | NaN | not\_desc |
| 250 | JSOSolvers (tron) | 2.226041e6 | 428 | 85216 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 250 | Ipopt | 2.7587915e6 | 543 | 204016 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 250 | MadNLP | 3.3412041e7 | 11808 | 375248 | 51 | -1.3051e-11 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 250 | NonlinearSolve (LM) | 1.45495415e7 | 816 | 2024208 | 10 | 2.0215e-17 | true | ok | NaN | Success |
| 250 | NonlinearSolve (TrustRegion) | 277208.0 | 908 | 453984 | 9 | 7.5608e-18 | true | ok | NaN | Success |
| 250 | CaNNOLeS | 347938.0 | 232 | 403744 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 500 | SecondOrderOptimization (Dogleg) | 289291.5 | 290 | 562448 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM) | 305124.5 | 284 | 554112 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | LeastSquaresOptim (Dogleg) | 570729.0 | 88 | 74224 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 500 | LeastSquaresOptim (LM) | 546541.5 | 155 | 69664 | 18 | 7.3225e-16 | true | ok | NaN | converged |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 500 | Optim (Newton) | 651208.5 | 585 | 1690032 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 500 | JSOSolvers (trunk) | 1.797792e6 | 445 | 120480 | 7 | 9.5090e-17 | false | not_converged | NaN | not\_desc |
| 500 | JSOSolvers (tron) | 4.273166e6 | 445 | 151824 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 500 | Ipopt | 4.8635205e6 | 574 | 404832 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 500 | MadNLP | 1.6877085e6 | 707 | 340528 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 500 | NonlinearSolve (LM) | 4.7136875e7 | 2508 | 11425872 | 10 | 4.0306e-17 | true | ok | NaN | Success |
| 500 | NonlinearSolve (TrustRegion) | 457854.0 | 966 | 886192 | 9 | 7.7191e-18 | true | ok | NaN | Success |
| 500 | CaNNOLeS | 675708.5 | 246 | 795392 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 1000 | SecondOrderOptimization (Dogleg) | 534708.5 | 295 | 1098368 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM) | 530646.0 | 289 | 1081840 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | LeastSquaresOptim (Dogleg) | 1.1867915e6 | 88 | 140080 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 1000 | LeastSquaresOptim (LM) | 1.0990835e6 | 149 | 131872 | 17 | 5.7105e-15 | true | ok | NaN | converged |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000 | Optim (Newton) | 1.1152085e6 | 805 | 3367984 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 1000 | JSOSolvers (trunk) | 3.439208e6 | 447 | 214720 | 7 | 8.5552e-17 | false | not_converged | NaN | not\_desc |
| 1000 | JSOSolvers (tron) | 8.466875e6 | 446 | 283488 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 1000 | Ipopt | 9.347771e6 | 578 | 824512 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 1000 | MadNLP | 3.055229e6 | 719 | 632400 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1000 | NonlinearSolve (LM) | 1.9922875e8 | 2515 | 24030752 | 11 | 1.3975e-19 | true | ok | NaN | Success |
| 1000 | NonlinearSolve (TrustRegion) | 811479.0 | 977 | 1618544 | 9 | 7.7994e-18 | true | ok | NaN | Success |
| 1000 | CaNNOLeS | 1.3486665e6 | 250 | 1610560 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 2500 | SecondOrderOptimization (Dogleg) | 1.0826045e6 | 431 | 3078912 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM) | 1.076125e6 | 425 | 3037808 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | LeastSquaresOptim (Dogleg) | 3.083125e6 | 88 | 362304 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 2500 | LeastSquaresOptim (LM) | 2.9098125e6 | 149 | 344304 | 17 | 5.1568e-15 | true | ok | NaN | converged |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2500 | Optim (Newton) | 2.5773545e6 | 611 | 8907504 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 2500 | JSOSolvers (trunk) | 8.768167e6 | 447 | 546496 | 7 | 7.4927e-17 | false | not_converged | NaN | not\_desc |
| 2500 | JSOSolvers (tron) | 2.1227416e7 | 448 | 735600 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 2500 | Ipopt | 2.3976708e7 | 582 | 2055232 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 2500 | MadNLP | 1.48883416e8 | 5278 | 1664848 | 25 | -7.1963e-11 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 2500 | NonlinearSolve (LM) | 1.355430167e9 | 873 | 163354384 | 11 | 3.4921e-19 | true | ok | NaN | Success |
| 2500 | NonlinearSolve (TrustRegion) | 3.5440625e6 | 7453 | 6140048 | 9 | 7.8480e-18 | true | ok | NaN | Success |
| 2500 | CaNNOLeS | 4.0486455e6 | 252 | 4207456 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 5000 | SecondOrderOptimization (Dogleg) | 2.233625e6 | 431 | 6319152 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM) | 2.1706245e6 | 425 | 6220704 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | LeastSquaresOptim (Dogleg) | 5.6789375e6 | 88 | 748848 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 5.79625e6 | 148 | 704928 | 17 | 3.7472e-15 | true | ok | NaN | converged |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 5000 | Optim (Newton) | 5.1352085e6 | 611 | 18003696 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 5000 | JSOSolvers (trunk) | 2.4342958e7 | 447 | 1058496 | 7 | 6.9280e-17 | false | not_converged | NaN | not\_desc |
| 5000 | JSOSolvers (tron) | 5.9164583e7 | 448 | 1483632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 5000 | Ipopt | 5.04844995e7 | 586 | 4158624 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 5000 | MadNLP | 2.20214995e7 | 719 | 3221584 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 4.827475792e9 | 2526 | 119076368 | 11 | 6.9833e-19 | true | ok | NaN | Success |
| 5000 | NonlinearSolve (TrustRegion) | 6.918792e6 | 13176 | 12670576 | 9 | 7.8643e-18 | true | ok | NaN | Success |
| 5000 | CaNNOLeS | 1.03304375e7 | 254 | 8205184 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 10000 | SecondOrderOptimization (Dogleg) | 4.3357085e6 | 431 | 11587296 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM) | 4.3527085e6 | 425 | 11423312 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 10000 | LeastSquaresOptim (LM) | 1.1085812e7 | 148 | 1257296 | 17 | 1.2073e-15 | true | ok | NaN | converged |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000 | Optim (Newton) | 1.0751354e7 | 611 | 33500912 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 10000 | JSOSolvers (trunk) | 9.444175e7 | 447 | 1910464 | 7 | 6.5636e-17 | false | not_converged | NaN | not\_desc |
| 10000 | JSOSolvers (tron) | 2.58632e8 | 450 | 2652112 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 10000 | Ipopt | 1.11407291e8 | 602 | 7733984 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 10000 | MadNLP | 5.8322e7 | 719 | 5992576 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | 1.9163109583e10 | 2578 | 233400720 | 11 | 1.3966e-18 | true | ok | NaN | Success |
| 10000 | NonlinearSolve (TrustRegion) | 1.3210021e7 | 25250 | 23631168 | 9 | 7.8724e-18 | true | ok | NaN | Success |
| 10000 | CaNNOLeS | 2.70766665e7 | 256 | 15971232 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 20000 | SecondOrderOptimization (Dogleg) | 8.726312e6 | 432 | 23131056 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM) | 8.6009165e6 | 426 | 22803232 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 20000 | LeastSquaresOptim (LM) | 2.11731455e7 | 158 | 2504224 | 16 | 3.3775e-15 | true | ok | NaN | converged |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 20000 | Optim (Newton) | 2.07401875e7 | 611 | 66789104 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 20000 | JSOSolvers (trunk) | 2.5710575e8 | 447 | 3794624 | 7 | 6.3520e-17 | false | not_converged | NaN | not\_desc |
| 20000 | JSOSolvers (tron) | 6.86984833e8 | 534 | 5285136 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 20000 | Ipopt | 2.54639625e8 | 606 | 15458080 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 20000 | MadNLP | 1.63109875e8 | 728 | 11705296 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 20000 | NonlinearSolve (LM) | 3.5136626208e10 | 1570 | 278523536 | 5 | 5.3623e-02 | false | timeout | NaN | MaxTime |
| 20000 | NonlinearSolve (TrustRegion) | 2.8811958e7 | 49393 | 47051456 | 9 | 7.8765e-18 | true | ok | NaN | Success |
| 20000 | CaNNOLeS | 7.5766708e7 | 258 | 31765440 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 35000 | SecondOrderOptimization (Dogleg) | 2.2345958e7 | 432 | 41328048 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM) | 1.5710896e7 | 426 | 40738080 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 35000 | Optim (Newton) | 3.5780042e7 | 642 | 117113056 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 35000 | JSOSolvers (trunk) | 2.1854958e7 | 347 | 6706176 | 7 | 6.2538e-17 | false | not_converged | NaN | not\_desc |
| 35000 | JSOSolvers (tron) | 6.6200208e7 | 149 | 9377632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 35000 | Ipopt | 8.0479208e7 | 460 | 48512000 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 35000 | MadNLP | 5.1029292e7 | 817 | 64565744 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | CaNNOLeS | 2.9770417e7 | 228 | 59038592 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 50000 | SecondOrderOptimization (Dogleg) | 2.27745e7 | 432 | 58353072 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM) | 2.2883334e7 | 426 | 57992480 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 50000 | Optim (Newton) | 5.17723335e7 | 615 | 165232432 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 50000 | JSOSolvers (trunk) | 3.6667416e7 | 347 | 9344000 | 8 | 5.1989e-18 | false | not_converged | NaN | not\_desc |
| 50000 | JSOSolvers (tron) | 5.4152917e7 | 149 | 13064032 | 5 | 5.3154e-17 | false | not_converged | NaN | small\_residual |
| 50000 | Ipopt | 1.155805e8 | 460 | 68746240 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 50000 | MadNLP | 7.28485e7 | 817 | 91273712 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | CaNNOLeS | 4.3258875e7 | 228 | 77552512 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 75000 | SecondOrderOptimization (Dogleg) | 3.5437979e7 | 432 | 87667120 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM) | 3.44766045e7 | 426 | 87372064 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 75000 | Optim (Newton) | 7.9641416e7 | 635 | 255033456 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 75000 | JSOSolvers (trunk) | 5.7279792e7 | 80 | 13945424 | 9 | 6.8484e-20 | true | ok | NaN | first\_order |
| 75000 | JSOSolvers (tron) | 8.0191291e7 | 149 | 19486560 | 6 | 2.4189e-18 | false | not_converged | NaN | small\_residual |
| 75000 | Ipopt | 1.808705625e8 | 460 | 102497280 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 75000 | MadNLP | 1.0759225e8 | 817 | 135964144 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | CaNNOLeS | 6.922975e7 | 228 | 110156672 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
