# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-14T13:25:49
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 4e9eec5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 100 | NLLSModel | 285.56 | 1 | 16 | 3291.6666666666665 | 1 | 64 |
| 100 | Standalone (Sparse) | 94.88636363636364 | 1 | 16 | 4541.0 | 22 | 18544 |
| 100 | NLPModels (MathOptNLSModel) | 10750.0 | 5 | 80 | 24625.0 | 9 | 224 |
| 250 | NLLSModel | 665.375 | 1 | 16 | 8069.666666666667 | 1 | 64 |
| 250 | Standalone (Sparse) | 180.045871559633 | 1 | 16 | 10083.0 | 23 | 43840 |
| 250 | NLPModels (MathOptNLSModel) | 25041.0 | 5 | 80 | 61666.0 | 9 | 224 |
| 500 | NLLSModel | 1283.875 | 1 | 16 | 16209.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 333.33898305084745 | 1 | 16 | 19583.0 | 24 | 87152 |
| 500 | NLPModels (MathOptNLSModel) | 49667.0 | 5 | 80 | 129750.0 | 9 | 224 |
| 1000 | NLLSModel | 2614.625 | 1 | 16 | 32250.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 636.3636363636364 | 1 | 16 | 39000.0 | 24 | 173712 |
| 1000 | NLPModels (MathOptNLSModel) | 101667.0 | 5 | 80 | 246083.0 | 9 | 224 |
| 2500 | NLLSModel | 6177.0 | 1 | 16 | 36208.0 | 2 | 464 |
| 2500 | Standalone (Sparse) | 1532.7142857142858 | 1 | 16 | 101084.0 | 25 | 466032 |
| 2500 | NLPModels (MathOptNLSModel) | 298291.0 | 5 | 80 | 762625.0 | 9 | 224 |
| 5000 | NLLSModel | 2505.25 | 2 | 64 | 50459.0 | 2 | 464 |
| 5000 | Standalone (Sparse) | 2904.714285714286 | 1 | 16 | 210250.0 | 25 | 890480 |
| 5000 | NLPModels (MathOptNLSModel) | 1.190208e6 | 5 | 80 | 8.985458e6 | 9 | 224 |
| 10000 | NLLSModel | 4025.0 | 2 | 64 | 211459.0 | 2 | 464 |
| 10000 | Standalone (Sparse) | 5948.0 | 1 | 16 | 451625.0 | 25 | 1731184 |
| 10000 | NLPModels (MathOptNLSModel) | 3.321417e6 | 5 | 80 | 8.68875e6 | 9 | 224 |
| 20000 | NLLSModel | 7250.0 | 2 | 64 | 130334.0 | 2 | 464 |
| 20000 | Standalone (Sparse) | 11833.0 | 1 | 16 | 747458.0 | 25 | 3428976 |
| 20000 | NLPModels (MathOptNLSModel) | 9.472667e6 | 5 | 80 | 2.2059e7 | 9 | 224 |
| 35000 | NLLSModel | 12042.0 | 2 | 64 | 216542.0 | 2 | 464 |
| 35000 | Standalone (Sparse) | 19750.0 | 1 | 16 | 1.399625e6 | 25 | 5964400 |
| 50000 | NLLSModel | 16833.0 | 2 | 64 | 695333.0 | 2 | 464 |
| 50000 | Standalone (Sparse) | 28375.0 | 1 | 16 | 2.053375e6 | 25 | 8487536 |
| 75000 | NLLSModel | 24667.0 | 2 | 64 | 446792.0 | 2 | 464 |
| 75000 | Standalone (Sparse) | 41458.0 | 1 | 16 | 2.784875e6 | 25 | 12649072 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 100 | SecondOrderOptimization (Dogleg) | 70812.5 | 231 | 121040 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | SecondOrderOptimization (LM) | 70896.0 | 227 | 119168 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 100 | LeastSquaresOptim (Dogleg) | 139958.0 | 75 | 21888 | 5 | 5.0660e-28 | true | ok | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 124083.5 | 137 | 19664 | 17 | 1.6425e-15 | true | ok | NaN | converged |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 100 | Optim (Newton) | 213354.5 | 536 | 371360 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 100 | JSOSolvers (trunk) | 487417.0 | 426 | 45344 | 7 | 9.2500e-17 | false | not_converged | NaN | not\_desc |
| 100 | JSOSolvers (tron) | 939958.0 | 421 | 47136 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 100 | Ipopt | 1.545042e6 | 534 | 110160 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 100 | MadNLP | 586021.0 | 670 | 109744 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 2.553709e6 | 809 | 456112 | 10 | 8.1611e-18 | true | ok | NaN | Success |
| 100 | NonlinearSolve (TrustRegion) | 164083.5 | 884 | 201696 | 9 | 7.1048e-18 | true | ok | NaN | Success |
| 100 | CaNNOLeS | 145771.0 | 218 | 177312 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 250 | SecondOrderOptimization (Dogleg) | 194562.5 | 240 | 277184 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | SecondOrderOptimization (LM) | 197833.0 | 236 | 273040 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 250 | LeastSquaresOptim (Dogleg) | 297958.5 | 78 | 40816 | 5 | 5.7069e-28 | true | ok | NaN | converged |
| 250 | LeastSquaresOptim (LM) | 285666.5 | 146 | 37936 | 18 | 8.3212e-16 | true | ok | NaN | converged |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 250 | Optim (Newton) | 375937.5 | 559 | 851664 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 250 | JSOSolvers (trunk) | 1.007916e6 | 432 | 72816 | 7 | 1.0154e-16 | false | not_converged | NaN | not\_desc |
| 250 | JSOSolvers (tron) | 2.279e6 | 428 | 85216 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 250 | Ipopt | 2.8364795e6 | 543 | 204016 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 250 | MadNLP | 3.4166709e7 | 11808 | 375248 | 51 | -1.3051e-11 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 250 | NonlinearSolve (LM) | 1.5109375e7 | 816 | 2024208 | 10 | 2.0215e-17 | true | ok | NaN | Success |
| 250 | NonlinearSolve (TrustRegion) | 274729.0 | 908 | 453984 | 9 | 7.5608e-18 | true | ok | NaN | Success |
| 250 | CaNNOLeS | 353499.5 | 232 | 403744 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 500 | SecondOrderOptimization (Dogleg) | 283000.0 | 286 | 557968 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | SecondOrderOptimization (LM) | 299291.5 | 280 | 549632 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 500 | LeastSquaresOptim (Dogleg) | 575416.5 | 88 | 74224 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 500 | LeastSquaresOptim (LM) | 554333.0 | 155 | 69664 | 18 | 7.3225e-16 | true | ok | NaN | converged |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 500 | Optim (Newton) | 612083.5 | 585 | 1690032 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 500 | JSOSolvers (trunk) | 1.846084e6 | 445 | 120480 | 7 | 9.5090e-17 | false | not_converged | NaN | not\_desc |
| 500 | JSOSolvers (tron) | 4.493e6 | 445 | 151824 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 500 | Ipopt | 5.1766035e6 | 574 | 404832 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 500 | MadNLP | 1.709333e6 | 707 | 340528 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 500 | NonlinearSolve (LM) | 4.8652e7 | 2332 | 11423056 | 10 | 4.0306e-17 | true | ok | NaN | Success |
| 500 | NonlinearSolve (TrustRegion) | 451771.0 | 966 | 886192 | 9 | 7.7191e-18 | true | ok | NaN | Success |
| 500 | CaNNOLeS | 667896.0 | 246 | 795392 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 1000 | SecondOrderOptimization (Dogleg) | 566583.0 | 291 | 1089792 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | SecondOrderOptimization (LM) | 547500.0 | 285 | 1073264 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 1000 | LeastSquaresOptim (Dogleg) | 1.2409585e6 | 88 | 140080 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 1000 | LeastSquaresOptim (LM) | 1.135625e6 | 149 | 131872 | 17 | 5.7105e-15 | true | ok | NaN | converged |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000 | Optim (Newton) | 1.1363125e6 | 605 | 3364784 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 1000 | JSOSolvers (trunk) | 3.548292e6 | 447 | 214720 | 7 | 8.5552e-17 | false | not_converged | NaN | not\_desc |
| 1000 | JSOSolvers (tron) | 8.630166e6 | 446 | 283488 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 1000 | Ipopt | 9.518084e6 | 578 | 824512 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 1000 | MadNLP | 3.372146e6 | 719 | 632400 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1000 | NonlinearSolve (LM) | 2.04452958e8 | 2603 | 24032160 | 11 | 1.3975e-19 | true | ok | NaN | Success |
| 1000 | NonlinearSolve (TrustRegion) | 814895.5 | 977 | 1618544 | 9 | 7.7994e-18 | true | ok | NaN | Success |
| 1000 | CaNNOLeS | 1.392208e6 | 250 | 1610560 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 2500 | SecondOrderOptimization (Dogleg) | 1.753021e6 | 80453 | 7633792 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | SecondOrderOptimization (LM) | 1.8390625e6 | 80447 | 7592688 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 2500 | LeastSquaresOptim (Dogleg) | 3.1570415e6 | 88 | 362304 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 2500 | LeastSquaresOptim (LM) | 2.984937e6 | 149 | 344304 | 17 | 5.1568e-15 | true | ok | NaN | converged |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2500 | Optim (Newton) | 2.551333e6 | 611 | 8907504 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 2500 | JSOSolvers (trunk) | 8.613625e6 | 447 | 546496 | 7 | 7.4927e-17 | false | not_converged | NaN | not\_desc |
| 2500 | JSOSolvers (tron) | 2.1675792e7 | 448 | 735600 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 2500 | Ipopt | 2.4884166e7 | 582 | 2055232 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 2500 | MadNLP | 1.65977333e8 | 5278 | 1664848 | 25 | -7.1963e-11 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 2500 | NonlinearSolve (LM) | 1.400033583e9 | 873 | 163354384 | 11 | 3.4921e-19 | true | ok | NaN | Success |
| 2500 | NonlinearSolve (TrustRegion) | 3.7516045e6 | 7117 | 6134672 | 9 | 7.8480e-18 | true | ok | NaN | Success |
| 2500 | CaNNOLeS | 3.9880625e6 | 252 | 4207456 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 5000 | SecondOrderOptimization (Dogleg) | 3.489583e6 | 160485 | 15555504 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | SecondOrderOptimization (LM) | 3.691667e6 | 160479 | 15457056 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 5000 | LeastSquaresOptim (Dogleg) | 5.8267505e6 | 88 | 748848 | 5 | 5.7562e-28 | true | ok | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 5.825313e6 | 148 | 704928 | 17 | 3.7472e-15 | true | ok | NaN | converged |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 5000 | Optim (Newton) | 5.533e6 | 611 | 18003696 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 5000 | JSOSolvers (trunk) | 2.9985916e7 | 447 | 1058496 | 7 | 6.9280e-17 | false | not_converged | NaN | not\_desc |
| 5000 | JSOSolvers (tron) | 7.6947875e7 | 448 | 1483632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 5000 | Ipopt | 5.6135541e7 | 586 | 4158624 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 5000 | MadNLP | 2.63401875e7 | 719 | 3221584 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 4.956621083e9 | 2652 | 119078384 | 11 | 6.9833e-19 | true | ok | NaN | Success |
| 5000 | NonlinearSolve (TrustRegion) | 6.941875e6 | 13212 | 12671152 | 9 | 7.8643e-18 | true | ok | NaN | Success |
| 5000 | CaNNOLeS | 1.15795e7 | 254 | 8205184 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 10000 | SecondOrderOptimization (Dogleg) | 7.078708e6 | 320485 | 29792352 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | SecondOrderOptimization (LM) | 8.060812e6 | 320479 | 29628368 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 10000 | LeastSquaresOptim (LM) | 1.13444165e7 | 148 | 1257296 | 17 | 1.2073e-15 | true | ok | NaN | converged |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000 | Optim (Newton) | 1.0531667e7 | 611 | 33500912 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 10000 | JSOSolvers (trunk) | 1.0589625e8 | 447 | 1910464 | 7 | 6.5636e-17 | false | not_converged | NaN | not\_desc |
| 10000 | JSOSolvers (tron) | 2.72896584e8 | 450 | 2652112 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 10000 | Ipopt | 1.16187708e8 | 602 | 7733984 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 10000 | MadNLP | 7.1310896e7 | 719 | 5992576 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | 1.972690025e10 | 2574 | 234907984 | 11 | 1.3966e-18 | true | ok | NaN | Success |
| 10000 | NonlinearSolve (TrustRegion) | 1.4081604e7 | 25250 | 23631168 | 9 | 7.8724e-18 | true | ok | NaN | Success |
| 10000 | CaNNOLeS | 2.95781665e7 | 256 | 15971232 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 20000 | SecondOrderOptimization (Dogleg) | 1.55395e7 | 640518 | 59700016 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | SecondOrderOptimization (LM) | 1.72791245e7 | 640512 | 59372192 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 20000 | LeastSquaresOptim (LM) | 2.1745541e7 | 158 | 2504224 | 16 | 3.3775e-15 | true | ok | NaN | converged |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 20000 | Optim (Newton) | 2.0992292e7 | 611 | 66789104 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 20000 | JSOSolvers (trunk) | 2.93894042e8 | 447 | 3794624 | 7 | 6.3520e-17 | false | not_converged | NaN | not\_desc |
| 20000 | JSOSolvers (tron) | 1.003066875e9 | 450 | 5283792 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 20000 | Ipopt | 2.73576208e8 | 606 | 15458080 | 5 | 1.3564e-29 | true | ok | NaN | first\_order |
| 20000 | MadNLP | 1.59810938e8 | 728 | 11705296 | 5 | 2.5216e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 20000 | NonlinearSolve (LM) | 3.5688481584e10 | 1570 | 277130896 | 5 | 5.3623e-02 | false | timeout | NaN | MaxTime |
| 20000 | NonlinearSolve (TrustRegion) | 2.91106665e7 | 49393 | 47051456 | 9 | 7.8765e-18 | true | ok | NaN | Success |
| 20000 | CaNNOLeS | 7.1593584e7 | 258 | 31765440 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 35000 | SecondOrderOptimization (Dogleg) | 3.90095e7 | 1120550 | 107359536 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | SecondOrderOptimization (LM) | 2.6834604e7 | 1120544 | 106769568 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 35000 | Optim (Newton) | 3.572375e7 | 611 | 117112560 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 35000 | JSOSolvers (trunk) | 2.3889458e7 | 367 | 6706496 | 7 | 6.2538e-17 | false | not_converged | NaN | not\_desc |
| 35000 | JSOSolvers (tron) | 6.9287375e7 | 149 | 9377632 | 6 | 5.1615e-17 | false | not_converged | NaN | small\_residual |
| 35000 | Ipopt | 8.3322958e7 | 460 | 48512000 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 35000 | MadNLP | 5.1243417e7 | 817 | 64565744 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 35000 | CaNNOLeS | 2.9518084e7 | 228 | 59038592 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 50000 | SecondOrderOptimization (Dogleg) | 4.37887505e7 | 1600550 | 149963568 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | SecondOrderOptimization (LM) | 4.8954542e7 | 1600544 | 149144224 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 50000 | Optim (Newton) | 5.186025e7 | 611 | 165232368 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 50000 | JSOSolvers (trunk) | 3.5488084e7 | 347 | 9344000 | 8 | 5.1989e-18 | false | not_converged | NaN | not\_desc |
| 50000 | JSOSolvers (tron) | 5.1195958e7 | 149 | 13064032 | 5 | 5.3154e-17 | false | not_converged | NaN | small\_residual |
| 50000 | Ipopt | 1.15786291e8 | 460 | 68746240 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 50000 | MadNLP | 7.24393125e7 | 817 | 91273712 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 50000 | CaNNOLeS | 4.463625e7 | 228 | 77552512 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
| 75000 | SecondOrderOptimization (Dogleg) | 6.7663479e7 | 2400582 | 224498480 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | SecondOrderOptimization (LM) | 6.5466e7 | 2400576 | 225366688 | 5 | 0.0000e+00 | true | ok | NaN | abs\_dcost, step\_size |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 75000 | Optim (Newton) | 8.11883125e7 | 611 | 246218480 | 5 | 0.0000e+00 | true | ok | NaN | converged |
| 75000 | JSOSolvers (trunk) | 5.7231146e7 | 80 | 13945424 | 9 | 6.8484e-20 | true | ok | NaN | first\_order |
| 75000 | JSOSolvers (tron) | 8.318475e7 | 149 | 19486560 | 6 | 2.4189e-18 | false | not_converged | NaN | small\_residual |
| 75000 | Ipopt | 1.82645542e8 | 460 | 102497280 | 5 | 0.0000e+00 | true | ok | NaN | first\_order |
| 75000 | MadNLP | 1.11021083e8 | 817 | 135964144 | 5 | 0.0000e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 75000 | CaNNOLeS | 6.7674271e7 | 228 | 110156672 | 4 | 3.3466e-17 | true | ok | NaN | first\_order |
