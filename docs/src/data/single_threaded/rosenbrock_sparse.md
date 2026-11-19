# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T02:11:32
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 2c10368
- **Dependency Commits**: OptimizationVariableInterface f130043, SecondOrderOptimization 377b96e, NLLSModel 78a4ef5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 100 | NLLSModel | 252.14102564102564 | 1 | 16 | 3351.1428571428573 | 1 | 64 |
| 100 | Standalone (Sparse) | 256.25 | 1 | 16 | 4916.5 | 22 | 18544 |
| 100 | NLPModels (MathOptNLSModel) | 10791.0 | 5 | 80 | 25833.0 | 9 | 224 |
| 250 | NLLSModel | 643.21875 | 1 | 16 | 8055.666666666667 | 1 | 64 |
| 250 | Standalone (Sparse) | 498.9230769230769 | 1 | 16 | 12500.0 | 23 | 43840 |
| 250 | NLPModels (MathOptNLSModel) | 25458.0 | 5 | 80 | 62625.0 | 9 | 224 |
| 500 | NLLSModel | 1276.0 | 1 | 16 | 15500.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 1021.8095238095239 | 1 | 16 | 20917.0 | 24 | 87152 |
| 500 | NLPModels (MathOptNLSModel) | 50666.0 | 5 | 80 | 122250.0 | 9 | 224 |
| 1000 | NLLSModel | 2567.75 | 1 | 16 | 32292.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 1962.090909090909 | 1 | 16 | 47666.0 | 24 | 173712 |
| 1000 | NLPModels (MathOptNLSModel) | 100708.0 | 5 | 80 | 254083.0 | 9 | 224 |
| 2500 | NLLSModel | 6041.75 | 1 | 16 | 80500.0 | 1 | 64 |
| 2500 | Standalone (Sparse) | 5739.75 | 1 | 16 | 118042.0 | 25 | 466032 |
| 2500 | NLPModels (MathOptNLSModel) | 328000.0 | 5 | 80 | 862917.0 | 9 | 224 |
| 5000 | NLLSModel | 12375.0 | 1 | 16 | 156375.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 11000.0 | 1 | 16 | 198500.0 | 25 | 890480 |
| 5000 | NLPModels (MathOptNLSModel) | 1.213125e6 | 5 | 80 | 2.977375e6 | 9 | 224 |
| 10000 | NLLSModel | 24625.0 | 1 | 16 | 321166.0 | 1 | 64 |
| 10000 | Standalone (Sparse) | 22375.0 | 1 | 16 | 382875.0 | 25 | 1731184 |
| 10000 | NLPModels (MathOptNLSModel) | 3.119708e6 | 5 | 80 | 8.169125e6 | 9 | 224 |
| 20000 | NLLSModel | 49375.0 | 1 | 16 | 650041.0 | 1 | 64 |
| 20000 | Standalone (Sparse) | 41667.0 | 1 | 16 | 767083.0 | 25 | 3428976 |
| 20000 | NLPModels (MathOptNLSModel) | 9.4985e6 | 5 | 80 | 2.2636667e7 | 9 | 224 |
| 35000 | NLLSModel | 85416.0 | 1 | 16 | 1.142416e6 | 1 | 64 |
| 35000 | Standalone (Sparse) | 71750.0 | 1 | 16 | 1.346417e6 | 25 | 5964400 |
| 50000 | NLLSModel | 120042.0 | 1 | 16 | 1.628292e6 | 1 | 64 |
| 50000 | Standalone (Sparse) | 107167.0 | 1 | 16 | 2.05975e6 | 25 | 9011824 |
| 75000 | NLLSModel | 183583.0 | 1 | 16 | 2.652334e6 | 1 | 64 |
| 75000 | Standalone (Sparse) | 159292.0 | 1 | 16 | 3.010625e6 | 25 | 14942832 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 100 | SecondOrderOptimization (Dogleg) | 71916.0 | 228 | 122176 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM) | 70562.5 | 224 | 120304 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (Gauss-Newton) | 67083.5 | 216 | 115696 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM, tall) | 1.481875e6 | 110 | 726608 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM, tall, LSMR) | 827375.0 | 131 | 571216 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 100 | LeastSquaresOptim (Dogleg) | 135188.0 | 75 | 22064 | 5 | 5.0660e-28 | true | ok | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 127791.5 | 137 | 19856 | 17 | 1.6425e-15 | true | ok | NaN | converged |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 100 | Optim (Newton) | 217104.5 | 553 | 372912 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 100 | JSOSolvers (trunk) | 480584.0 | 426 | 45344 | 7 | 9.2500e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 100 | JSOSolvers (tron) | 946208.0 | 421 | 47136 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 100 | Ipopt | 1.575979e6 | 545 | 121456 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 100 | MadNLP | 578645.5 | 670 | 109744 | 5 | 3.4126e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 2.621146e6 | 809 | 460800 | 10 | 8.1611e-18 | true | ok | NaN | Success |
| 100 | NonlinearSolve (TrustRegion) | 165917.0 | 884 | 205328 | 9 | 7.1048e-18 | true | ok | NaN | Success |
| 100 | CaNNOLeS | 145646.0 | 218 | 177312 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 250 | SecondOrderOptimization (Dogleg) | 208416.0 | 237 | 279456 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM) | 208812.5 | 233 | 275312 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (Gauss-Newton) | 201583.5 | 225 | 264848 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM, tall) | 778958.5 | 2554 | 1042640 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM, tall, LSMR) | 338458.0 | 135 | 126464 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 250 | LeastSquaresOptim (Dogleg) | 305021.0 | 78 | 40992 | 5 | 5.7069e-28 | true | ok | NaN | converged |
| 250 | LeastSquaresOptim (LM) | 304584.0 | 146 | 38128 | 18 | 8.3212e-16 | true | ok | NaN | converged |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 250 | Optim (Newton) | 376937.5 | 576 | 853216 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 250 | JSOSolvers (trunk) | 1.038334e6 | 432 | 72816 | 7 | 1.0154e-16 | false | not_converged | NaN | not\_desc; cost test passes |
| 250 | JSOSolvers (tron) | 2.346208e6 | 428 | 85216 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 250 | Ipopt | 2.8410625e6 | 556 | 231056 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 250 | MadNLP | 3.4305791e7 | 11808 | 375248 | 51 | 2.0488e-12 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 250 | NonlinearSolve (LM) | 1.5176208e7 | 816 | 2028896 | 10 | 2.0215e-17 | true | ok | NaN | Success |
| 250 | NonlinearSolve (TrustRegion) | 312187.5 | 908 | 457616 | 9 | 7.5608e-18 | true | ok | NaN | Success |
| 250 | CaNNOLeS | 359896.0 | 232 | 403744 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 500 | SecondOrderOptimization (Dogleg) | 294791.5 | 284 | 562368 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM) | 291125.5 | 278 | 554032 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (Gauss-Newton) | 279729.5 | 268 | 533232 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM, tall) | 1.5529375e6 | 370 | 1838704 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM, tall, LSMR) | 633167.0 | 156 | 248368 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 500 | LeastSquaresOptim (Dogleg) | 576250.0 | 88 | 74400 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 500 | LeastSquaresOptim (LM) | 603333.5 | 155 | 69856 | 18 | 7.3225e-16 | true | ok | NaN | converged |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 500 | Optim (Newton) | 653895.5 | 602 | 1691584 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 500 | JSOSolvers (trunk) | 1.832084e6 | 445 | 120480 | 7 | 9.5090e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 500 | JSOSolvers (tron) | 4.349167e6 | 445 | 151824 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 500 | Ipopt | 4.9975625e6 | 587 | 458496 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 500 | MadNLP | 1.7126245e6 | 707 | 340528 | 5 | 3.4126e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 500 | NonlinearSolve (LM) | 4.8721396e7 | 2332 | 11427744 | 10 | 4.0306e-17 | true | ok | NaN | Success |
| 500 | NonlinearSolve (TrustRegion) | 481208.0 | 966 | 889824 | 9 | 7.7191e-18 | true | ok | NaN | Success |
| 500 | CaNNOLeS | 702396.0 | 246 | 795392 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 1000 | SecondOrderOptimization (Dogleg) | 564625.0 | 289 | 1098144 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM) | 597520.5 | 283 | 1081616 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (Gauss-Newton) | 517062.5 | 273 | 1040336 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM, tall) | 3.078396e6 | 370 | 3407792 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM, tall, LSMR) | 1.293667e6 | 156 | 490160 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 1000 | LeastSquaresOptim (Dogleg) | 1.2208125e6 | 88 | 140256 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 1000 | LeastSquaresOptim (LM) | 1.220875e6 | 149 | 132064 | 17 | 5.7105e-15 | true | ok | NaN | converged |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000 | Optim (Newton) | 1.161042e6 | 622 | 3366336 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 1000 | JSOSolvers (trunk) | 3.717e6 | 447 | 214720 | 7 | 8.5552e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 1000 | JSOSolvers (tron) | 9.06875e6 | 446 | 283488 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 1000 | Ipopt | 1.00784375e7 | 591 | 931424 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 1000 | MadNLP | 3.3897295e6 | 719 | 632400 | 5 | 3.4126e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1000 | NonlinearSolve (LM) | 2.07546792e8 | 2515 | 24035440 | 11 | 1.3975e-19 | true | ok | NaN | Success |
| 1000 | NonlinearSolve (TrustRegion) | 822521.0 | 977 | 1622176 | 9 | 7.7994e-18 | true | ok | NaN | Success |
| 1000 | CaNNOLeS | 1.433854e6 | 250 | 1610560 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 2500 | SecondOrderOptimization (Dogleg) | 1.3784585e6 | 295 | 2860624 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM) | 1.3238125e6 | 289 | 2819520 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (Gauss-Newton) | 1.2469585e6 | 279 | 2712704 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM, tall) | 7.5402085e6 | 370 | 8347856 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM, tall, LSMR) | 3.1990625e6 | 156 | 1322064 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 2500 | LeastSquaresOptim (Dogleg) | 3.2220205e6 | 88 | 362480 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 2500 | LeastSquaresOptim (LM) | 3.2563125e6 | 149 | 344496 | 17 | 5.1568e-15 | true | ok | NaN | converged |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2500 | Optim (Newton) | 2.6197495e6 | 628 | 8909056 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 2500 | JSOSolvers (trunk) | 9.098041e6 | 447 | 546496 | 7 | 7.4927e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 2500 | JSOSolvers (tron) | 2.2260583e7 | 448 | 735600 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 2500 | Ipopt | 2.4831042e7 | 595 | 2350560 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 2500 | MadNLP | 1.67703458e8 | 5278 | 1664848 | 25 | 1.0882e-12 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 2500 | NonlinearSolve (LM) | 1.414482625e9 | 873 | 163359072 | 11 | 3.4921e-19 | true | ok | NaN | Success |
| 2500 | NonlinearSolve (TrustRegion) | 3.5974585e6 | 7117 | 6138304 | 9 | 7.8480e-18 | true | ok | NaN | Success |
| 2500 | CaNNOLeS | 4.214729e6 | 252 | 4207456 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 5000 | SecondOrderOptimization (Dogleg) | 2.709479e6 | 295 | 5916544 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM) | 2.695667e6 | 289 | 5818096 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (Gauss-Newton) | 2.523417e6 | 279 | 5588400 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM, tall) | 1.5060583e7 | 370 | 16624432 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM, tall, LSMR) | 6.509958e6 | 156 | 2645680 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 5000 | LeastSquaresOptim (Dogleg) | 5.8628545e6 | 88 | 749024 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 5.9673335e6 | 148 | 705120 | 17 | 3.7472e-15 | true | ok | NaN | converged |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 5000 | Optim (Newton) | 5.2528125e6 | 628 | 18005248 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 5000 | JSOSolvers (trunk) | 3.2530291e7 | 447 | 1058496 | 7 | 6.9280e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 5000 | JSOSolvers (tron) | 7.1360416e7 | 448 | 1483632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 5000 | Ipopt | 5.60480415e7 | 599 | 4716096 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 5000 | MadNLP | 2.4201375e7 | 719 | 3221584 | 5 | 3.4126e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 4.957466167e9 | 2568 | 119081728 | 11 | 6.9833e-19 | true | ok | NaN | Success |
| 5000 | NonlinearSolve (TrustRegion) | 6.8501665e6 | 13176 | 12674208 | 9 | 7.8643e-18 | true | ok | NaN | Success |
| 5000 | CaNNOLeS | 1.0853146e7 | 254 | 8205184 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 10000 | SecondOrderOptimization (Dogleg) | 5.287521e6 | 295 | 10840624 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM) | 5.300104e6 | 289 | 10676640 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (Gauss-Newton) | 4.975542e6 | 279 | 10266720 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM, tall) | 2.97845e7 | 370 | 31932560 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM, tall, LSMR) | 1.234e7 | 156 | 4842512 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 10000 | LeastSquaresOptim (LM) | 1.15902915e7 | 148 | 1257488 | 17 | 1.2073e-15 | true | ok | NaN | converged |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000 | Optim (Newton) | 1.01944165e7 | 628 | 33502464 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 10000 | JSOSolvers (trunk) | 1.062095e8 | 447 | 1910464 | 7 | 6.5636e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 10000 | JSOSolvers (tron) | 2.84168458e8 | 450 | 2652112 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 10000 | Ipopt | 1.18125459e8 | 615 | 8799360 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 10000 | MadNLP | 5.90414585e7 | 719 | 5992576 | 5 | 3.4126e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | 1.9814366125e10 | 2574 | 231717792 | 11 | 1.3966e-18 | true | ok | NaN | Success |
| 10000 | NonlinearSolve (TrustRegion) | 1.3748917e7 | 25250 | 23634800 | 9 | 7.8724e-18 | true | ok | NaN | Success |
| 10000 | CaNNOLeS | 2.9075417e7 | 256 | 15971232 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 20000 | SecondOrderOptimization (Dogleg) | 1.1152958e7 | 296 | 21655296 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM) | 1.06112915e7 | 290 | 21327472 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (Gauss-Newton) | 1.00003755e7 | 280 | 20507952 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM, tall) | 6.13074165e7 | 372 | 65104432 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM, tall, LSMR) | 2.4685042e7 | 158 | 9678256 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 20000 | LeastSquaresOptim (LM) | 2.2125959e7 | 158 | 2504416 | 16 | 3.3775e-15 | true | ok | NaN | converged |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 20000 | Optim (Newton) | 2.09672915e7 | 628 | 66790656 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 20000 | JSOSolvers (trunk) | 2.71530792e8 | 471 | 3795008 | 7 | 6.3519e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 20000 | JSOSolvers (tron) | 7.22311666e8 | 450 | 5283792 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 20000 | Ipopt | 2.620794795e8 | 619 | 17588416 | 5 | 1.8489e-29 | true | ok | NaN | first\_order |
| 20000 | MadNLP | 1.54274708e8 | 728 | 11705296 | 5 | 3.4126e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 20000 | NonlinearSolve (LM) | 3.5830479375e10 | 1572 | 265912576 | 5 | 5.3623e-02 | false | timeout | NaN | MaxTime |
| 20000 | NonlinearSolve (TrustRegion) | 2.84647915e7 | 49381 | 47054896 | 9 | 7.8765e-18 | true | ok | NaN | Success |
| 20000 | CaNNOLeS | 7.6029062e7 | 258 | 31765440 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 35000 | SecondOrderOptimization (Dogleg) | 2.1285667e7 | 296 | 38910208 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM) | 1.9159333e7 | 290 | 38320240 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (Gauss-Newton) | 1.9194688e7 | 280 | 36878128 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM, tall) | 1.07295e8 | 372 | 125001264 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM, tall, LSMR) | 4.4175125e7 | 158 | 17056176 | 5 | 3.3463e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 35000 | Optim (Newton) | 3.79502915e7 | 628 | 117114112 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 35000 | JSOSolvers (trunk) | 2.3704875e7 | 347 | 6706176 | 7 | 6.2538e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 35000 | JSOSolvers (tron) | 6.6421709e7 | 149 | 9377632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 35000 | Ipopt | 8.13473955e7 | 470 | 49397120 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 35000 | MadNLP | 5.20203125e7 | 817 | 64565744 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | CaNNOLeS | 3.0471417e7 | 228 | 52255616 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 50000 | SecondOrderOptimization (Dogleg) | 2.6989167e7 | 296 | 55148800 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM) | 2.96611665e7 | 290 | 54329456 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (Gauss-Newton) | 2.6903417e7 | 280 | 52297520 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM, tall) | 1.50492271e8 | 372 | 158953008 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM, tall, LSMR) | 6.430025e7 | 158 | 23925168 | 5 | 3.3464e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 50000 | Optim (Newton) | 5.42243755e7 | 628 | 165233920 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 50000 | JSOSolvers (trunk) | 3.6331041e7 | 347 | 9344000 | 8 | 5.1989e-18 | false | not_converged | NaN | not\_desc; cost test passes |
| 50000 | JSOSolvers (tron) | 5.2076584e7 | 149 | 13064032 | 5 | 5.3154e-17 | false | not_converged | NaN | small\_residual; cost test passes |
| 50000 | Ipopt | 1.15784584e8 | 470 | 69975424 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 50000 | MadNLP | 7.3748875e7 | 817 | 91273712 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | CaNNOLeS | 4.6795709e7 | 228 | 73784192 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 75000 | SecondOrderOptimization (Dogleg) | 4.1960667e7 | 296 | 83053824 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM) | 4.3880708e7 | 290 | 81841264 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (Gauss-Newton) | 4.0326875e7 | 280 | 78826288 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM, tall) | 2.25162208e8 | 372 | 236217904 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM, tall, LSMR) | 9.2817583e7 | 158 | 35695024 | 5 | 3.3464e-17 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 75000 | Optim (Newton) | 7.7585229e7 | 652 | 246220416 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 75000 | JSOSolvers (trunk) | 5.92122295e7 | 80 | 13945424 | 9 | 6.8484e-20 | true | ok | NaN | first\_order |
| 75000 | JSOSolvers (tron) | 8.0958125e7 | 149 | 19486560 | 6 | 2.4189e-18 | false | not_converged | NaN | small\_residual; cost test passes |
| 75000 | Ipopt | 1.78666125e8 | 470 | 106642816 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 75000 | MadNLP | 1.11017417e8 | 817 | 135964144 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | CaNNOLeS | 7.07109375e7 | 228 | 110943104 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
