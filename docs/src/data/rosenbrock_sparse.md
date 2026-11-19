# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T01:17:45
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=1
- **Git Commit**: 2c10368
- **Dependency Commits**: OptimizationVariableInterface f130043, SecondOrderOptimization 377b96e, NLLSModel 78a4ef5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 100 | NLLSModel | 270.8333333333333 | 1 | 16 | 3327.4285714285716 | 1 | 64 |
| 100 | Standalone (Sparse) | 256.8481012658228 | 1 | 16 | 5041.0 | 22 | 18544 |
| 100 | NLPModels (MathOptNLSModel) | 10584.0 | 5 | 80 | 24583.0 | 9 | 224 |
| 250 | NLLSModel | 421.5686274509804 | 1 | 16 | 7972.333333333333 | 1 | 64 |
| 250 | Standalone (Sparse) | 539.6666666666666 | 1 | 16 | 10667.0 | 23 | 43840 |
| 250 | NLPModels (MathOptNLSModel) | 24541.0 | 5 | 80 | 60958.0 | 9 | 224 |
| 500 | NLLSModel | 1013.1578947368421 | 1 | 16 | 16541.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 1002.05 | 1 | 16 | 19375.0 | 24 | 87152 |
| 500 | NLPModels (MathOptNLSModel) | 49417.0 | 5 | 80 | 120833.0 | 9 | 224 |
| 1000 | NLLSModel | 1225.4705882352941 | 1 | 16 | 31167.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 2064.4545454545455 | 1 | 16 | 48000.0 | 24 | 173712 |
| 1000 | NLPModels (MathOptNLSModel) | 99750.0 | 5 | 80 | 252208.0 | 9 | 224 |
| 2500 | NLLSModel | 1733.4 | 1 | 16 | 46750.0 | 1 | 64 |
| 2500 | Standalone (Sparse) | 5771.0 | 1 | 16 | 120250.0 | 25 | 466032 |
| 2500 | NLPModels (MathOptNLSModel) | 259750.0 | 5 | 80 | 954208.0 | 9 | 224 |
| 5000 | NLLSModel | 2600.0 | 1 | 16 | 72917.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 10583.0 | 1 | 16 | 232583.0 | 25 | 890480 |
| 5000 | NLPModels (MathOptNLSModel) | 1.472416e6 | 5 | 80 | 3.36125e6 | 9 | 224 |
| 10000 | NLLSModel | 4133.4 | 1 | 16 | 132000.0 | 1 | 64 |
| 10000 | Standalone (Sparse) | 21959.0 | 1 | 16 | 402834.0 | 25 | 1731184 |
| 10000 | NLPModels (MathOptNLSModel) | 4.316708e6 | 5 | 80 | 9.394209e6 | 9 | 224 |
| 20000 | NLLSModel | 7375.0 | 1 | 16 | 263083.0 | 1 | 64 |
| 20000 | Standalone (Sparse) | 41959.0 | 1 | 16 | 827291.0 | 25 | 3428976 |
| 20000 | NLPModels (MathOptNLSModel) | 1.082375e7 | 5 | 80 | 2.579625e7 | 9 | 224 |
| 35000 | NLLSModel | 12083.0 | 1 | 16 | 518458.0 | 1 | 64 |
| 35000 | Standalone (Sparse) | 71541.0 | 1 | 16 | 1.313917e6 | 25 | 5964400 |
| 50000 | NLLSModel | 17000.0 | 1 | 16 | 648667.0 | 1 | 64 |
| 50000 | Standalone (Sparse) | 105917.0 | 1 | 16 | 1.956375e6 | 25 | 8487536 |
| 75000 | NLLSModel | 24750.0 | 1 | 16 | 957125.0 | 1 | 64 |
| 75000 | Standalone (Sparse) | 160875.0 | 1 | 16 | 3.203542e6 | 25 | 12649072 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 100 | SecondOrderOptimization (Dogleg) | 68875.0 | 228 | 122176 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM) | 66375.5 | 224 | 120304 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (Gauss-Newton) | 63771.0 | 216 | 115696 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM, tall) | 1.4591465e6 | 110 | 726608 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM, tall, LSMR) | 816209.0 | 131 | 571216 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 100 | LeastSquaresOptim (Dogleg) | 135062.5 | 75 | 22064 | 5 | 5.0660e-28 | true | ok | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 123625.0 | 137 | 19856 | 17 | 1.6425e-15 | true | ok | NaN | converged |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 100 | Optim (Newton) | 211646.0 | 553 | 372912 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 100 | JSOSolvers (trunk) | 490625.0 | 426 | 45344 | 7 | 9.2500e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 100 | JSOSolvers (tron) | 1.06825e6 | 421 | 47136 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 100 | Ipopt | 1.549875e6 | 545 | 121456 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 100 | MadNLP | 577416.5 | 670 | 109744 | 5 | 3.4126e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 2.599167e6 | 809 | 460800 | 10 | 8.1611e-18 | true | ok | NaN | Success |
| 100 | NonlinearSolve (TrustRegion) | 164500.0 | 884 | 205328 | 9 | 7.1048e-18 | true | ok | NaN | Success |
| 100 | CaNNOLeS | 148166.5 | 218 | 177312 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 250 | SecondOrderOptimization (Dogleg) | 203750.0 | 237 | 279456 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM) | 208291.5 | 233 | 275312 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (Gauss-Newton) | 200583.0 | 225 | 264848 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM, tall) | 794562.5 | 354 | 1007536 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM, tall, LSMR) | 331499.5 | 135 | 126560 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 250 | LeastSquaresOptim (Dogleg) | 308229.0 | 78 | 40992 | 5 | 5.7069e-28 | true | ok | NaN | converged |
| 250 | LeastSquaresOptim (LM) | 306646.0 | 146 | 38128 | 18 | 8.3212e-16 | true | ok | NaN | converged |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 250 | Optim (Newton) | 387646.0 | 576 | 853216 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 250 | JSOSolvers (trunk) | 1.044541e6 | 432 | 72816 | 7 | 1.0154e-16 | false | not_converged | NaN | not\_desc; cost test passes |
| 250 | JSOSolvers (tron) | 2.387458e6 | 428 | 85216 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 250 | Ipopt | 2.939104e6 | 556 | 231056 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 250 | MadNLP | 3.3232875e7 | 11808 | 375248 | 51 | 2.0488e-12 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 250 | NonlinearSolve (LM) | 1.4865563e7 | 816 | 2028896 | 10 | 2.0215e-17 | true | ok | NaN | Success |
| 250 | NonlinearSolve (TrustRegion) | 296000.0 | 908 | 457616 | 9 | 7.5608e-18 | true | ok | NaN | Success |
| 250 | CaNNOLeS | 330437.5 | 232 | 403744 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 500 | SecondOrderOptimization (Dogleg) | 277104.5 | 284 | 562368 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM) | 298042.0 | 278 | 554032 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (Gauss-Newton) | 282708.0 | 268 | 533232 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM, tall) | 1.5065205e6 | 370 | 1838928 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM, tall, LSMR) | 595312.5 | 156 | 248592 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 500 | LeastSquaresOptim (Dogleg) | 598667.0 | 88 | 74400 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 500 | LeastSquaresOptim (LM) | 610521.0 | 155 | 69856 | 18 | 7.3225e-16 | true | ok | NaN | converged |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 500 | Optim (Newton) | 641458.5 | 602 | 1691584 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 500 | JSOSolvers (trunk) | 1.85625e6 | 445 | 120480 | 7 | 9.5090e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 500 | JSOSolvers (tron) | 4.433167e6 | 445 | 151824 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 500 | Ipopt | 4.85275e6 | 587 | 458496 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 500 | MadNLP | 1.667479e6 | 707 | 340528 | 5 | 3.4126e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 500 | NonlinearSolve (LM) | 4.91945005e7 | 2520 | 11430752 | 10 | 4.0306e-17 | true | ok | NaN | Success |
| 500 | NonlinearSolve (TrustRegion) | 452020.5 | 966 | 889824 | 9 | 7.7191e-18 | true | ok | NaN | Success |
| 500 | CaNNOLeS | 699041.5 | 246 | 795392 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 1000 | SecondOrderOptimization (Dogleg) | 566062.5 | 289 | 1098144 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM) | 539958.0 | 283 | 1081616 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (Gauss-Newton) | 499249.5 | 273 | 1040336 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM, tall) | 3.106708e6 | 370 | 3408016 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM, tall, LSMR) | 1.174667e6 | 156 | 490384 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 1000 | LeastSquaresOptim (Dogleg) | 1.226854e6 | 88 | 140256 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 1000 | LeastSquaresOptim (LM) | 1.148896e6 | 149 | 132064 | 17 | 5.7105e-15 | true | ok | NaN | converged |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000 | Optim (Newton) | 1.120125e6 | 622 | 3366336 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 1000 | JSOSolvers (trunk) | 3.494208e6 | 447 | 214720 | 7 | 8.5552e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 1000 | JSOSolvers (tron) | 8.483625e6 | 446 | 283488 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 1000 | Ipopt | 9.5070625e6 | 591 | 931424 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 1000 | MadNLP | 3.2682715e6 | 719 | 632400 | 5 | 3.4126e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1000 | NonlinearSolve (LM) | 2.06505917e8 | 2619 | 24037104 | 11 | 1.3975e-19 | true | ok | NaN | Success |
| 1000 | NonlinearSolve (TrustRegion) | 814687.5 | 977 | 1622176 | 9 | 7.7994e-18 | true | ok | NaN | Success |
| 1000 | CaNNOLeS | 1.3188755e6 | 250 | 1610560 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 2500 | SecondOrderOptimization (Dogleg) | 1.1365205e6 | 424 | 3078800 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM) | 1.0957295e6 | 418 | 3037696 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (Gauss-Newton) | 1.0385205e6 | 408 | 2930880 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM, tall) | 7.703916e6 | 370 | 8348080 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM, tall, LSMR) | 2.9897085e6 | 156 | 1322288 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 2500 | LeastSquaresOptim (Dogleg) | 3.0831875e6 | 88 | 362480 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 2500 | LeastSquaresOptim (LM) | 3.0849375e6 | 149 | 344496 | 17 | 5.1568e-15 | true | ok | NaN | converged |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2500 | Optim (Newton) | 2.6503535e6 | 628 | 8909056 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 2500 | JSOSolvers (trunk) | 9.797375e6 | 447 | 546496 | 7 | 7.4927e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 2500 | JSOSolvers (tron) | 2.2958125e7 | 448 | 735600 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 2500 | Ipopt | 2.515925e7 | 595 | 2350560 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 2500 | MadNLP | 1.47595125e8 | 5278 | 1664848 | 25 | 1.0882e-12 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 2500 | NonlinearSolve (LM) | 1.510751916e9 | 873 | 163359072 | 11 | 3.4921e-19 | true | ok | NaN | Success |
| 2500 | NonlinearSolve (TrustRegion) | 3.7317085e6 | 7117 | 6138304 | 9 | 7.8480e-18 | true | ok | NaN | Success |
| 2500 | CaNNOLeS | 4.3789165e6 | 252 | 4207456 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 5000 | SecondOrderOptimization (Dogleg) | 2.243834e6 | 424 | 6319040 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM) | 2.1551665e6 | 418 | 6220592 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (Gauss-Newton) | 2.0130415e6 | 408 | 5990896 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM, tall) | 1.55375e7 | 370 | 16624656 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM, tall, LSMR) | 5.859584e6 | 156 | 2645904 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5000 | LeastSquaresOptim (Dogleg) | 5.610938e6 | 88 | 749024 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 6.072958e6 | 148 | 705120 | 17 | 3.7472e-15 | true | ok | NaN | converged |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 5000 | Optim (Newton) | 5.497104e6 | 628 | 18005248 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 5000 | JSOSolvers (trunk) | 3.337325e7 | 487 | 1059136 | 7 | 6.9280e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 5000 | JSOSolvers (tron) | 7.6860708e7 | 448 | 1483632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 5000 | Ipopt | 5.6110083e7 | 599 | 4716096 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 5000 | MadNLP | 2.5587667e7 | 719 | 3221584 | 5 | 3.4126e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 4.963260125e9 | 2526 | 119081056 | 11 | 6.9833e-19 | true | ok | NaN | Success |
| 5000 | NonlinearSolve (TrustRegion) | 7.0223335e6 | 13176 | 12674208 | 9 | 7.8643e-18 | true | ok | NaN | Success |
| 5000 | CaNNOLeS | 1.1689562e7 | 254 | 8205184 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 10000 | SecondOrderOptimization (Dogleg) | 4.319958e6 | 424 | 11587184 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM) | 4.277479e6 | 418 | 11423200 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (Gauss-Newton) | 4.141208e6 | 408 | 11013280 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM, tall) | 2.93503545e7 | 370 | 33653104 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM, tall, LSMR) | 1.1456792e7 | 156 | 4842736 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 10000 | LeastSquaresOptim (LM) | 1.19650415e7 | 148 | 1257488 | 17 | 1.2073e-15 | true | ok | NaN | converged |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000 | Optim (Newton) | 1.0562271e7 | 628 | 33502464 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 10000 | JSOSolvers (trunk) | 9.7584458e7 | 447 | 1910464 | 7 | 6.5636e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 10000 | JSOSolvers (tron) | 2.6612375e8 | 450 | 2652112 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 10000 | Ipopt | 1.18682875e8 | 615 | 8799360 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 10000 | MadNLP | 6.3822667e7 | 719 | 5992576 | 5 | 3.4126e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | 2.0151002625e10 | 2574 | 233339808 | 11 | 1.3966e-18 | true | ok | NaN | Success |
| 10000 | NonlinearSolve (TrustRegion) | 1.4203583e7 | 25250 | 23634800 | 9 | 7.8724e-18 | true | ok | NaN | Success |
| 10000 | CaNNOLeS | 3.1065271e7 | 256 | 15971232 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 20000 | SecondOrderOptimization (Dogleg) | 9.231917e6 | 425 | 23139136 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM) | 9.137e6 | 419 | 22811312 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (Gauss-Newton) | 8.207875e6 | 409 | 21991792 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM, tall) | 7.26049165e7 | 372 | 63712016 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM, tall, LSMR) | 2.3414208e7 | 158 | 9678480 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 20000 | LeastSquaresOptim (LM) | 2.207275e7 | 158 | 2504416 | 16 | 3.3775e-15 | true | ok | NaN | converged |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 20000 | Optim (Newton) | 2.1854271e7 | 628 | 66790656 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 20000 | JSOSolvers (trunk) | 3.44096917e8 | 447 | 3794624 | 7 | 6.3519e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 20000 | JSOSolvers (tron) | 9.4670575e8 | 450 | 5283792 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 20000 | Ipopt | 2.62985375e8 | 619 | 17588416 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 20000 | MadNLP | 1.688979165e8 | 728 | 11705296 | 5 | 3.4126e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 20000 | NonlinearSolve (LM) | 3.5766689917e10 | 1570 | 267387104 | 5 | 5.3623e-02 | false | timeout | NaN | MaxTime |
| 20000 | NonlinearSolve (TrustRegion) | 3.0964334e7 | 49405 | 47055280 | 9 | 7.8765e-18 | true | ok | NaN | Success |
| 20000 | CaNNOLeS | 7.6905458e7 | 258 | 31765440 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 35000 | SecondOrderOptimization (Dogleg) | 1.6058896e7 | 425 | 41311552 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM) | 1.57326045e7 | 419 | 40721584 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (Gauss-Newton) | 1.45262495e7 | 409 | 39279472 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM, tall) | 1.84697354e8 | 372 | 111976208 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM, tall, LSMR) | 4.69241875e7 | 158 | 17056400 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 35000 | Optim (Newton) | 3.6775209e7 | 628 | 117114112 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 35000 | JSOSolvers (trunk) | 2.2941208e7 | 347 | 6706176 | 7 | 6.2538e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 35000 | JSOSolvers (tron) | 6.8511458e7 | 149 | 9377632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 35000 | Ipopt | 8.3322917e7 | 470 | 49397120 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 35000 | MadNLP | 5.28325e7 | 817 | 64565744 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | CaNNOLeS | 3.06396665e7 | 228 | 52255616 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 50000 | SecondOrderOptimization (Dogleg) | 3.04023125e7 | 425 | 61449536 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM) | 2.472475e7 | 419 | 60630192 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (Gauss-Newton) | 2.7792521e7 | 409 | 58598256 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM, tall) | 1.519917085e8 | 372 | 158953232 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM, tall, LSMR) | 6.23862705e7 | 158 | 23925392 | 5 | 3.3464e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 50000 | Optim (Newton) | 5.3947875e7 | 628 | 165233920 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 50000 | JSOSolvers (trunk) | 3.9177041e7 | 347 | 9344000 | 8 | 5.1989e-18 | false | not_converged | NaN | not\_desc; cost test passes |
| 50000 | JSOSolvers (tron) | 5.1524e7 | 149 | 13064032 | 5 | 5.3154e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 50000 | Ipopt | 1.16855958e8 | 470 | 69975424 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 50000 | MadNLP | 7.55849995e7 | 817 | 91273712 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | CaNNOLeS | 4.5185417e7 | 228 | 74308480 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 75000 | SecondOrderOptimization (Dogleg) | 4.8039791e7 | 425 | 88518976 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM) | 3.6953375e7 | 421 | 87308496 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (Gauss-Newton) | 3.1588875e7 | 409 | 84291440 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM, tall) | 2.24885459e8 | 372 | 236218128 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM, tall, LSMR) | 8.6173042e7 | 158 | 35695248 | 5 | 3.3464e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 75000 | Optim (Newton) | 7.7367416e7 | 672 | 246220736 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 75000 | JSOSolvers (trunk) | 5.9367146e7 | 80 | 13945424 | 9 | 6.8484e-20 | true | ok | NaN | first\_order |
| 75000 | JSOSolvers (tron) | 8.1246084e7 | 149 | 19486560 | 6 | 2.4189e-18 | false | not_converged | NaN | small\_residual; cost test passes |
| 75000 | Ipopt | 1.869915e8 | 470 | 104316288 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 75000 | MadNLP | 1.104695625e8 | 817 | 135964144 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | CaNNOLeS | 7.12866045e7 | 228 | 110943104 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
