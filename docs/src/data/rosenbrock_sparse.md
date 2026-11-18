# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T01:31:25
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 3b3f450
- **Dependency Commits**: OptimizationVariableInterface cd7c159, SecondOrderOptimization 741d209, NLLSModel ebf8f1d

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 100 | NLLSModel | 303.26582278481015 | 1 | 16 | 3339.285714285714 | 1 | 64 |
| 100 | Standalone (Sparse) | 96.25462962962963 | 1 | 16 | 4334.0 | 22 | 18544 |
| 100 | NLPModels (MathOptNLSModel) | 11125.0 | 5 | 80 | 24875.0 | 9 | 224 |
| 250 | NLLSModel | 922.5 | 1 | 16 | 8236.0 | 1 | 64 |
| 250 | Standalone (Sparse) | 168.8034188034188 | 1 | 16 | 11791.0 | 23 | 43840 |
| 250 | NLPModels (MathOptNLSModel) | 26292.0 | 5 | 80 | 60292.0 | 9 | 224 |
| 500 | NLLSModel | 1059.0 | 1 | 16 | 16083.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 337.3709677419355 | 1 | 16 | 18875.0 | 24 | 87152 |
| 500 | NLPModels (MathOptNLSModel) | 49875.0 | 5 | 80 | 120292.0 | 9 | 224 |
| 1000 | NLLSModel | 1229.15 | 1 | 16 | 31750.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 633.5882352941177 | 1 | 16 | 39583.0 | 24 | 173712 |
| 1000 | NLPModels (MathOptNLSModel) | 108666.0 | 5 | 80 | 257875.0 | 9 | 224 |
| 2500 | NLLSModel | 1743.0 | 1 | 16 | 32125.0 | 1 | 64 |
| 2500 | Standalone (Sparse) | 1544.642857142857 | 1 | 16 | 100667.0 | 25 | 466032 |
| 2500 | NLPModels (MathOptNLSModel) | 337291.0 | 5 | 80 | 741458.0 | 9 | 224 |
| 5000 | NLLSModel | 2564.8888888888887 | 1 | 16 | 75375.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 2869.0 | 1 | 16 | 254042.0 | 25 | 890480 |
| 5000 | NLPModels (MathOptNLSModel) | 1.395084e6 | 5 | 80 | 3.494958e6 | 9 | 224 |
| 10000 | NLLSModel | 4150.0 | 1 | 16 | 125083.0 | 1 | 64 |
| 10000 | Standalone (Sparse) | 5979.25 | 1 | 16 | 392291.0 | 25 | 1731184 |
| 10000 | NLPModels (MathOptNLSModel) | 4.02125e6 | 5 | 80 | 1.0211166e7 | 9 | 224 |
| 20000 | NLLSModel | 7347.333333333333 | 1 | 16 | 379708.0 | 1 | 64 |
| 20000 | Standalone (Sparse) | 11875.0 | 1 | 16 | 834042.0 | 25 | 3428976 |
| 20000 | NLPModels (MathOptNLSModel) | 9.791916e6 | 5 | 80 | 2.3007833e7 | 9 | 224 |
| 35000 | NLLSModel | 12084.0 | 1 | 16 | 412375.0 | 1 | 64 |
| 35000 | Standalone (Sparse) | 19709.0 | 1 | 16 | 1.243792e6 | 25 | 5964400 |
| 50000 | NLLSModel | 17042.0 | 1 | 16 | 567708.0 | 1 | 64 |
| 50000 | Standalone (Sparse) | 28334.0 | 1 | 16 | 2.097542e6 | 25 | 8487536 |
| 75000 | NLLSModel | 24708.0 | 1 | 16 | 895417.0 | 1 | 64 |
| 75000 | Standalone (Sparse) | 40459.0 | 1 | 16 | 3.184958e6 | 25 | 12649072 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 100 | SecondOrderOptimization (Dogleg) | 73020.5 | 228 | 122176 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM) | 67791.5 | 224 | 120304 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM, tall) | 1.4571665e6 | 110 | 726608 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | LeastSquaresOptim (Dogleg) | 131417.0 | 75 | 21888 | 5 | 5.0660e-28 | true | ok | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 115875.5 | 137 | 19664 | 17 | 1.6425e-15 | true | ok | NaN | converged |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 100 | Optim (Newton) | 209833.5 | 536 | 371360 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 100 | JSOSolvers (trunk) | 477250.0 | 426 | 45344 | 7 | 9.2500e-17 | false | not_converged | NaN | not\_desc |
| 100 | JSOSolvers (tron) | 905625.0 | 421 | 47136 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 100 | Ipopt | 1.514375e6 | 534 | 110160 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 100 | MadNLP | 571853.5 | 670 | 109744 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 2.498792e6 | 809 | 456112 | 10 | 8.1611e-18 | true | ok | NaN | Success |
| 100 | NonlinearSolve (TrustRegion) | 159749.5 | 884 | 201696 | 9 | 7.1048e-18 | true | ok | NaN | Success |
| 100 | CaNNOLeS | 139958.5 | 218 | 177312 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 250 | SecondOrderOptimization (Dogleg) | 193791.5 | 237 | 279456 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM) | 198021.0 | 233 | 275312 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM, tall) | 767042.0 | 354 | 1007536 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | LeastSquaresOptim (Dogleg) | 313271.0 | 78 | 40816 | 5 | 5.7069e-28 | true | ok | NaN | converged |
| 250 | LeastSquaresOptim (LM) | 284875.0 | 146 | 37936 | 18 | 8.3212e-16 | true | ok | NaN | converged |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 250 | Optim (Newton) | 373895.5 | 559 | 851664 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 250 | JSOSolvers (trunk) | 997834.0 | 432 | 72816 | 7 | 1.0154e-16 | false | not_converged | NaN | not\_desc |
| 250 | JSOSolvers (tron) | 2.239584e6 | 428 | 85216 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 250 | Ipopt | 2.7707085e6 | 543 | 204016 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 250 | MadNLP | 3.335225e7 | 11808 | 375248 | 51 | -1.3051e-11 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 250 | NonlinearSolve (LM) | 1.4821208e7 | 816 | 2024208 | 10 | 2.0215e-17 | true | ok | NaN | Success |
| 250 | NonlinearSolve (TrustRegion) | 266437.5 | 908 | 453984 | 9 | 7.5608e-18 | true | ok | NaN | Success |
| 250 | CaNNOLeS | 331770.5 | 232 | 403744 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 500 | SecondOrderOptimization (Dogleg) | 275479.0 | 284 | 562368 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM) | 299229.5 | 278 | 554032 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM, tall) | 1.4962915e6 | 370 | 1838928 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | LeastSquaresOptim (Dogleg) | 570146.0 | 88 | 74224 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 500 | LeastSquaresOptim (LM) | 541604.5 | 155 | 69664 | 18 | 7.3225e-16 | true | ok | NaN | converged |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 500 | Optim (Newton) | 609021.0 | 585 | 1690032 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 500 | JSOSolvers (trunk) | 1.790042e6 | 445 | 120480 | 7 | 9.5090e-17 | false | not_converged | NaN | not\_desc |
| 500 | JSOSolvers (tron) | 4.250125e6 | 445 | 151824 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 500 | Ipopt | 4.798833e6 | 574 | 404832 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 500 | MadNLP | 1.676896e6 | 707 | 340528 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 500 | NonlinearSolve (LM) | 4.8374208e7 | 2528 | 11426192 | 10 | 4.0306e-17 | true | ok | NaN | Success |
| 500 | NonlinearSolve (TrustRegion) | 446812.5 | 966 | 886192 | 9 | 7.7191e-18 | true | ok | NaN | Success |
| 500 | CaNNOLeS | 659062.5 | 246 | 795392 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 1000 | SecondOrderOptimization (Dogleg) | 574625.0 | 289 | 1098144 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM) | 530999.5 | 283 | 1081616 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM, tall) | 2.973417e6 | 370 | 3408016 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | LeastSquaresOptim (Dogleg) | 1.188604e6 | 88 | 140080 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 1000 | LeastSquaresOptim (LM) | 1.097354e6 | 149 | 131872 | 17 | 5.7105e-15 | true | ok | NaN | converged |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000 | Optim (Newton) | 1.0939375e6 | 605 | 3364784 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 1000 | JSOSolvers (trunk) | 3.422625e6 | 447 | 214720 | 7 | 8.5552e-17 | false | not_converged | NaN | not\_desc |
| 1000 | JSOSolvers (tron) | 8.405e6 | 446 | 283488 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 1000 | Ipopt | 1.0336354e7 | 578 | 824512 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 1000 | MadNLP | 3.363896e6 | 719 | 632400 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1000 | NonlinearSolve (LM) | 2.04278583e8 | 2671 | 24033248 | 11 | 1.3975e-19 | true | ok | NaN | Success |
| 1000 | NonlinearSolve (TrustRegion) | 835458.5 | 977 | 1618544 | 9 | 7.7994e-18 | true | ok | NaN | Success |
| 1000 | CaNNOLeS | 1.340688e6 | 250 | 1610560 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 2500 | SecondOrderOptimization (Dogleg) | 1.182521e6 | 424 | 3078800 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM) | 1.100458e6 | 418 | 3037696 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM, tall) | 7.325479e6 | 370 | 8348080 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | LeastSquaresOptim (Dogleg) | 3.0846455e6 | 88 | 362304 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 2500 | LeastSquaresOptim (LM) | 2.9261875e6 | 149 | 344304 | 17 | 5.1568e-15 | true | ok | NaN | converged |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2500 | Optim (Newton) | 2.6082705e6 | 611 | 8907504 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 2500 | JSOSolvers (trunk) | 1.0475625e7 | 447 | 546496 | 7 | 7.4927e-17 | false | not_converged | NaN | not\_desc |
| 2500 | JSOSolvers (tron) | 2.3932375e7 | 448 | 735600 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 2500 | Ipopt | 2.5229333e7 | 582 | 2055232 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 2500 | MadNLP | 1.55736833e8 | 5278 | 1664848 | 25 | -7.1963e-11 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 2500 | NonlinearSolve (LM) | 1.388083167e9 | 873 | 163354384 | 11 | 3.4921e-19 | true | ok | NaN | Success |
| 2500 | NonlinearSolve (TrustRegion) | 3.649354e6 | 7117 | 6134672 | 9 | 7.8480e-18 | true | ok | NaN | Success |
| 2500 | CaNNOLeS | 4.6276045e6 | 252 | 4207456 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 5000 | SecondOrderOptimization (Dogleg) | 2.285188e6 | 424 | 6319040 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM) | 2.2224585e6 | 418 | 6220592 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM, tall) | 1.6499541e7 | 370 | 16624656 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | LeastSquaresOptim (Dogleg) | 5.955375e6 | 88 | 748848 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 5.840437e6 | 148 | 704928 | 17 | 3.7472e-15 | true | ok | NaN | converged |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 5000 | Optim (Newton) | 5.13e6 | 611 | 18003696 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 5000 | JSOSolvers (trunk) | 3.4945709e7 | 447 | 1058496 | 7 | 6.9280e-17 | false | not_converged | NaN | not\_desc |
| 5000 | JSOSolvers (tron) | 6.6486916e7 | 448 | 1483632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 5000 | Ipopt | 5.6676125e7 | 586 | 4158624 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 5000 | MadNLP | 2.4343041e7 | 719 | 3221584 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 4.8783715e9 | 2620 | 119077872 | 11 | 6.9833e-19 | true | ok | NaN | Success |
| 5000 | NonlinearSolve (TrustRegion) | 6.982792e6 | 13176 | 12670576 | 9 | 7.8643e-18 | true | ok | NaN | Success |
| 5000 | CaNNOLeS | 1.16914165e7 | 254 | 8205184 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 10000 | SecondOrderOptimization (Dogleg) | 4.526375e6 | 424 | 11587184 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM) | 4.5272705e6 | 418 | 11423200 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM, tall) | 3.1889375e7 | 370 | 32063856 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 10000 | LeastSquaresOptim (LM) | 1.14731875e7 | 148 | 1257296 | 17 | 1.2073e-15 | true | ok | NaN | converged |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000 | Optim (Newton) | 1.0805646e7 | 631 | 33501232 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 10000 | JSOSolvers (trunk) | 1.08728333e8 | 447 | 1910464 | 7 | 6.5636e-17 | false | not_converged | NaN | not\_desc |
| 10000 | JSOSolvers (tron) | 2.921215e8 | 450 | 2652112 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 10000 | Ipopt | 1.1826175e8 | 602 | 7733984 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 10000 | MadNLP | 6.5892667e7 | 719 | 5992576 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | 1.9416417208e10 | 2528 | 233268848 | 11 | 1.3966e-18 | true | ok | NaN | Success |
| 10000 | NonlinearSolve (TrustRegion) | 1.39071045e7 | 25250 | 23631168 | 9 | 7.8724e-18 | true | ok | NaN | Success |
| 10000 | CaNNOLeS | 3.0243e7 | 256 | 15971232 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 20000 | SecondOrderOptimization (Dogleg) | 9.109396e6 | 425 | 23139136 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM) | 9.0628545e6 | 419 | 22811312 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM, tall) | 6.8805542e7 | 372 | 63433488 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 20000 | LeastSquaresOptim (LM) | 2.17928545e7 | 158 | 2504224 | 16 | 3.3775e-15 | true | ok | NaN | converged |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 20000 | Optim (Newton) | 2.09664585e7 | 611 | 66789104 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 20000 | JSOSolvers (trunk) | 3.4086025e8 | 447 | 3794624 | 7 | 6.3520e-17 | false | not_converged | NaN | not\_desc |
| 20000 | JSOSolvers (tron) | 9.29623208e8 | 450 | 5283792 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 20000 | Ipopt | 2.665575415e8 | 606 | 15458080 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 20000 | MadNLP | 1.61898708e8 | 728 | 11705296 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 20000 | NonlinearSolve (LM) | 3.5488043333e10 | 1590 | 228306896 | 5 | 5.3623e-02 | false | timeout | NaN | MaxTime |
| 20000 | NonlinearSolve (TrustRegion) | 2.84897915e7 | 49393 | 47051456 | 9 | 7.8765e-18 | true | ok | NaN | Success |
| 20000 | CaNNOLeS | 7.6153042e7 | 258 | 31765440 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 35000 | SecondOrderOptimization (Dogleg) | 2.0867625e7 | 425 | 41524544 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM) | 1.565625e7 | 419 | 40934576 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM, tall) | 1.09751375e8 | 372 | 110960400 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 35000 | Optim (Newton) | 3.5976583e7 | 623 | 117112752 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 35000 | JSOSolvers (trunk) | 2.176e7 | 347 | 6706176 | 7 | 6.2538e-17 | false | not_converged | NaN | not\_desc |
| 35000 | JSOSolvers (tron) | 6.6890834e7 | 149 | 9377632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 35000 | Ipopt | 8.30138745e7 | 460 | 48512000 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 35000 | MadNLP | 4.9420916e7 | 817 | 64565744 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | CaNNOLeS | 2.97802915e7 | 228 | 52255616 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 50000 | SecondOrderOptimization (Dogleg) | 2.34692915e7 | 425 | 58516800 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM) | 2.2905646e7 | 419 | 59204784 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM, tall) | 1.51290479e8 | 372 | 158674704 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 50000 | Optim (Newton) | 5.1483792e7 | 631 | 170475568 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 50000 | JSOSolvers (trunk) | 3.5393625e7 | 367 | 9344320 | 8 | 5.1989e-18 | false | not_converged | NaN | not\_desc |
| 50000 | JSOSolvers (tron) | 5.0807041e7 | 149 | 13064032 | 5 | 5.3154e-17 | false | not_converged | NaN | small\_residual |
| 50000 | Ipopt | 1.16446625e8 | 460 | 68746240 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 50000 | MadNLP | 7.0789375e7 | 817 | 91273712 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | CaNNOLeS | 4.26966665e7 | 228 | 74308480 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 75000 | SecondOrderOptimization (Dogleg) | 3.5735667e7 | 425 | 89731392 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM) | 3.46177915e7 | 419 | 88518832 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM, tall) | 2.305648955e8 | 372 | 235120400 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 75000 | Optim (Newton) | 7.7616812e7 | 631 | 250036272 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 75000 | JSOSolvers (trunk) | 5.6790375e7 | 80 | 13945424 | 9 | 6.8484e-20 | true | ok | NaN | first\_order |
| 75000 | JSOSolvers (tron) | 8.3911167e7 | 149 | 19486560 | 6 | 2.4189e-18 | false | not_converged | NaN | small\_residual |
| 75000 | Ipopt | 1.801274165e8 | 460 | 102497280 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 75000 | MadNLP | 1.09624292e8 | 817 | 135964144 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | CaNNOLeS | 6.5825958e7 | 228 | 110943104 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
