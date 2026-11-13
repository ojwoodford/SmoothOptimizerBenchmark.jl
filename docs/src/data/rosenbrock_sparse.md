# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-13T01:13:26
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 520587c

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 100 | NLLSModel | 227.56043956043956 | 1 | 16 | 3125.0 | 1 | 64 |
| 100 | Standalone (Sparse) | 69.33195020746888 | 1 | 16 | 4334.0 | 22 | 18544 |
| 100 | NLPModels (MathOptNLSModel) | 9916.0 | 5 | 80 | 25791.0 | 9 | 224 |
| 250 | NLLSModel | 618.8529411764706 | 1 | 16 | 7347.333333333333 | 1 | 64 |
| 250 | Standalone (Sparse) | 157.672 | 1 | 16 | 9889.0 | 23 | 43840 |
| 250 | NLPModels (MathOptNLSModel) | 24416.0 | 5 | 80 | 59667.0 | 9 | 224 |
| 500 | NLLSModel | 1227.9411764705883 | 1 | 16 | 14833.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 321.9032258064516 | 1 | 16 | 19583.0 | 24 | 87152 |
| 500 | NLPModels (MathOptNLSModel) | 47959.0 | 5 | 80 | 119833.0 | 9 | 224 |
| 1000 | NLLSModel | 2472.222222222222 | 1 | 16 | 29667.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 599.2647058823529 | 1 | 16 | 35709.0 | 24 | 173712 |
| 1000 | NLPModels (MathOptNLSModel) | 95000.0 | 5 | 80 | 239750.0 | 9 | 224 |
| 2500 | NLLSModel | 6031.25 | 1 | 16 | 35458.0 | 2 | 464 |
| 2500 | Standalone (Sparse) | 1452.357142857143 | 1 | 16 | 107542.0 | 25 | 466032 |
| 2500 | NLPModels (MathOptNLSModel) | 275250.0 | 5 | 80 | 723625.0 | 9 | 224 |
| 5000 | NLLSModel | 12000.0 | 1 | 16 | 58500.0 | 2 | 464 |
| 5000 | Standalone (Sparse) | 2988.1428571428573 | 1 | 16 | 219459.0 | 25 | 890480 |
| 5000 | NLPModels (MathOptNLSModel) | 988166.0 | 5 | 80 | 2.474542e6 | 9 | 224 |
| 10000 | NLLSModel | 23959.0 | 1 | 16 | 82209.0 | 2 | 464 |
| 10000 | Standalone (Sparse) | 6062.5 | 1 | 16 | 468542.0 | 25 | 1731184 |
| 10000 | NLPModels (MathOptNLSModel) | 3.198209e6 | 5 | 80 | 8.149667e6 | 9 | 224 |
| 20000 | NLLSModel | 47583.0 | 1 | 16 | 134875.0 | 2 | 464 |
| 20000 | Standalone (Sparse) | 11417.0 | 1 | 16 | 731417.0 | 25 | 3428976 |
| 20000 | NLPModels (MathOptNLSModel) | 9.412042e6 | 5 | 80 | 2.163675e7 | 9 | 224 |
| 35000 | NLLSModel | 82833.0 | 1 | 16 | 199500.0 | 2 | 464 |
| 35000 | Standalone (Sparse) | 19625.0 | 1 | 16 | 1.331584e6 | 25 | 5964400 |
| 50000 | NLLSModel | 119959.0 | 1 | 16 | 281417.0 | 2 | 464 |
| 50000 | Standalone (Sparse) | 29417.0 | 1 | 16 | 1.983292e6 | 25 | 8487536 |
| 75000 | NLLSModel | 177791.0 | 1 | 16 | 421291.0 | 2 | 464 |
| 75000 | Standalone (Sparse) | 40709.0 | 1 | 16 | 3.0765e6 | 25 | 12649072 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 100 | SecondOrderOptimization (Dogleg) | 79250.0 | 229 | 120544 | 5 | 0.0000e+00 | true |
| 100 | SecondOrderOptimization (LM) | 68521.0 | 225 | 118672 | 5 | 0.0000e+00 | true |
| 100 | LeastSquaresOptim (Dogleg) | 132458.5 | 75 | 21888 | 5 | 5.0660e-28 | true |
| 100 | LeastSquaresOptim (LM) | 122312.5 | 137 | 19664 | 17 | 1.6425e-15 | true |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 100 | Optim (Newton) | 218729.5 | 536 | 371360 | 5 | 0.0000e+00 | true |
| 100 | JSOSolvers (trunk) | 531667.0 | 426 | 45344 | 7 | 9.2500e-17 | false |
| 100 | JSOSolvers (tron) | 950125.0 | 422 | 47088 | 6 | 5.1615e-17 | false |
| 100 | Ipopt | 1.669125e6 | 534 | 110160 | 5 | 1.3564e-29 | true |
| 100 | MadNLP | 580479.5 | 670 | 109744 | 5 | 2.5216e-26 | true |
| 100 | NonlinearSolve (LM) | 2.36775e6 | 691 | 449520 | 8 | 1.3891e-18 | true |
| 100 | NonlinearSolve (TrustRegion) | 212458.5 | 700 | 382048 | 4 | 3.3466e-17 | true |
| 100 | CaNNOLeS | 139250.5 | 218 | 177312 | 4 | 3.3466e-17 | true |
| 250 | SecondOrderOptimization (Dogleg) | 233500.0 | 238 | 276688 | 5 | 0.0000e+00 | true |
| 250 | SecondOrderOptimization (LM) | 201021.0 | 234 | 272544 | 5 | 0.0000e+00 | true |
| 250 | LeastSquaresOptim (Dogleg) | 293833.5 | 78 | 40816 | 5 | 5.7069e-28 | true |
| 250 | LeastSquaresOptim (LM) | 285895.5 | 146 | 37936 | 18 | 8.3212e-16 | true |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 250 | Optim (Newton) | 384563.0 | 559 | 851664 | 5 | 0.0000e+00 | true |
| 250 | JSOSolvers (trunk) | 998584.0 | 432 | 72816 | 7 | 1.0154e-16 | false |
| 250 | JSOSolvers (tron) | 2.575e6 | 429 | 85024 | 6 | 5.1615e-17 | false |
| 250 | Ipopt | 2.949833e6 | 543 | 204016 | 5 | 1.3564e-29 | true |
| 250 | MadNLP | 3.4438e7 | 11808 | 375248 | 51 | -1.3051e-11 | false |
| 250 | NonlinearSolve (LM) | 1.36486665e7 | 698 | 2017616 | 8 | 3.2714e-18 | true |
| 250 | NonlinearSolve (TrustRegion) | 762979.0 | 726 | 1497792 | 4 | 3.3466e-17 | true |
| 250 | CaNNOLeS | 342396.0 | 232 | 403744 | 4 | 3.3466e-17 | true |
| 500 | SecondOrderOptimization (Dogleg) | 346396.0 | 284 | 557472 | 5 | 0.0000e+00 | true |
| 500 | SecondOrderOptimization (LM) | 263708.5 | 278 | 549136 | 5 | 0.0000e+00 | true |
| 500 | LeastSquaresOptim (Dogleg) | 571584.0 | 88 | 74224 | 5 | 5.7562e-28 | true |
| 500 | LeastSquaresOptim (LM) | 552771.0 | 155 | 69664 | 18 | 7.3225e-16 | true |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 500 | Optim (Newton) | 620166.5 | 585 | 1690032 | 5 | 0.0000e+00 | true |
| 500 | JSOSolvers (trunk) | 1.8135e6 | 445 | 120480 | 7 | 9.5090e-17 | false |
| 500 | JSOSolvers (tron) | 4.555958e6 | 446 | 151408 | 6 | 5.1615e-17 | false |
| 500 | Ipopt | 5.2474165e6 | 574 | 404832 | 5 | 1.3564e-29 | true |
| 500 | MadNLP | 1.754667e6 | 707 | 340528 | 5 | 2.5216e-26 | true |
| 500 | NonlinearSolve (LM) | 4.15099165e7 | 3328 | 18064816 | 8 | 6.4152e-18 | true |
| 500 | NonlinearSolve (TrustRegion) | 2.5622705e6 | 776 | 7162304 | 4 | 3.3466e-17 | true |
| 500 | CaNNOLeS | 669312.5 | 246 | 795392 | 4 | 3.3466e-17 | true |
| 1000 | SecondOrderOptimization (Dogleg) | 698250.0 | 289 | 1089296 | 5 | 0.0000e+00 | true |
| 1000 | SecondOrderOptimization (LM) | 521458.0 | 283 | 1072768 | 5 | 0.0000e+00 | true |
| 1000 | LeastSquaresOptim (Dogleg) | 1.227813e6 | 88 | 140080 | 5 | 5.7562e-28 | true |
| 1000 | LeastSquaresOptim (LM) | 1.1097915e6 | 149 | 131872 | 17 | 5.7105e-15 | true |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1000 | Optim (Newton) | 1.096979e6 | 605 | 3364784 | 5 | 0.0000e+00 | true |
| 1000 | JSOSolvers (trunk) | 3.739e6 | 447 | 214720 | 7 | 8.5552e-17 | false |
| 1000 | JSOSolvers (tron) | 9.457833e6 | 447 | 282592 | 6 | 5.1615e-17 | false |
| 1000 | Ipopt | 1.0115125e7 | 578 | 824512 | 5 | 1.3564e-29 | true |
| 1000 | MadNLP | 3.374104e6 | 719 | 632400 | 5 | 2.5216e-26 | true |
| 1000 | NonlinearSolve (LM) | 1.52523375e8 | 3288 | 34640016 | 8 | 1.2694e-17 | true |
| 1000 | NonlinearSolve (TrustRegion) | 2.085021e6 | 1217 | 6388016 | 4 | 3.3466e-17 | true |
| 1000 | CaNNOLeS | 1.4185625e6 | 250 | 1610560 | 4 | 3.3466e-17 | true |
| 2500 | SecondOrderOptimization (Dogleg) | 1.8870625e6 | 80451 | 7633264 | 5 | 0.0000e+00 | true |
| 2500 | SecondOrderOptimization (LM) | 1.859875e6 | 80445 | 7592160 | 5 | 0.0000e+00 | true |
| 2500 | LeastSquaresOptim (Dogleg) | 3.1796875e6 | 88 | 362304 | 5 | 5.7562e-28 | true |
| 2500 | LeastSquaresOptim (LM) | 2.999042e6 | 149 | 344304 | 17 | 5.1568e-15 | true |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2500 | Optim (Newton) | 2.676125e6 | 675 | 8908528 | 5 | 0.0000e+00 | true |
| 2500 | JSOSolvers (trunk) | 9.770708e6 | 447 | 546496 | 7 | 7.4927e-17 | false |
| 2500 | JSOSolvers (tron) | 2.3765417e7 | 448 | 733408 | 6 | 5.1615e-17 | false |
| 2500 | Ipopt | 2.7323875e7 | 582 | 2055232 | 5 | 1.3564e-29 | true |
| 2500 | MadNLP | 1.79874e8 | 5278 | 1664848 | 25 | -7.1963e-11 | false |
| 2500 | NonlinearSolve (LM) | 1.086435666e9 | 755 | 163347792 | 8 | 3.1500e-17 | true |
| 2500 | NonlinearSolve (TrustRegion) | 4.889104e6 | 1221 | 16505712 | 4 | 3.3466e-17 | true |
| 2500 | CaNNOLeS | 4.7048335e6 | 252 | 4207456 | 4 | 3.3466e-17 | true |
| 5000 | SecondOrderOptimization (Dogleg) | 4.0627915e6 | 160483 | 15554976 | 5 | 0.0000e+00 | true |
| 5000 | SecondOrderOptimization (LM) | 3.891729e6 | 160477 | 15456528 | 5 | 0.0000e+00 | true |
| 5000 | LeastSquaresOptim (Dogleg) | 5.8234375e6 | 88 | 748848 | 5 | 5.7562e-28 | true |
| 5000 | LeastSquaresOptim (LM) | 5.8424165e6 | 148 | 704928 | 17 | 3.7472e-15 | true |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | Optim (Newton) | 5.644521e6 | 611 | 18003696 | 5 | 0.0000e+00 | true |
| 5000 | JSOSolvers (trunk) | 2.7047667e7 | 447 | 1058496 | 7 | 6.9280e-17 | false |
| 5000 | JSOSolvers (tron) | 6.2160666e7 | 448 | 1479184 | 6 | 5.1615e-17 | false |
| 5000 | Ipopt | 5.6372417e7 | 762 | 4161440 | 5 | 1.3564e-29 | true |
| 5000 | MadNLP | 2.1732604e7 | 719 | 3221584 | 5 | 2.5216e-26 | true |
| 5000 | NonlinearSolve (LM) | 3.983350916e9 | 3624 | 192708176 | 9 | 3.3743e-24 | true |
| 5000 | NonlinearSolve (TrustRegion) | 9.7412295e6 | 1249 | 32255280 | 4 | 3.3466e-17 | true |
| 5000 | CaNNOLeS | 9.791042e6 | 254 | 8205184 | 4 | 3.3466e-17 | true |
| 10000 | SecondOrderOptimization (Dogleg) | 7.311833e6 | 320483 | 29791824 | 5 | 0.0000e+00 | true |
| 10000 | SecondOrderOptimization (LM) | 6.984e6 | 320477 | 29627840 | 5 | 0.0000e+00 | true |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | LeastSquaresOptim (LM) | 1.11135415e7 | 148 | 1257296 | 17 | 1.2073e-15 | true |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | Optim (Newton) | 1.05085205e7 | 611 | 33500912 | 5 | 0.0000e+00 | true |
| 10000 | JSOSolvers (trunk) | 9.9360084e7 | 447 | 1910464 | 7 | 6.5636e-17 | false |
| 10000 | JSOSolvers (tron) | 2.66194916e8 | 450 | 2643232 | 6 | 5.1615e-17 | false |
| 10000 | Ipopt | 1.14625916e8 | 602 | 7733984 | 5 | 1.3564e-29 | true |
| 10000 | MadNLP | 6.1931875e7 | 719 | 5992576 | 5 | 2.5216e-26 | true |
| 10000 | NonlinearSolve (LM) | 1.5790107042e10 | 3636 | 375246672 | 9 | 5.7344e-24 | true |
| 10000 | NonlinearSolve (TrustRegion) | 1.9356166e7 | 1221 | 61926256 | 4 | 3.3466e-17 | true |
| 10000 | CaNNOLeS | 2.72652085e7 | 256 | 15971232 | 4 | 3.3466e-17 | true |
| 20000 | SecondOrderOptimization (Dogleg) | 1.9184375e7 | 640516 | 59699488 | 5 | 0.0000e+00 | true |
| 20000 | SecondOrderOptimization (LM) | 1.5090687e7 | 640510 | 59371664 | 5 | 0.0000e+00 | true |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | LeastSquaresOptim (LM) | 2.1234146e7 | 158 | 2504224 | 16 | 3.3775e-15 | true |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | Optim (Newton) | 2.06414375e7 | 643 | 66789616 | 5 | 0.0000e+00 | true |
| 20000 | JSOSolvers (trunk) | 2.72907958e8 | 447 | 3794624 | 7 | 6.3520e-17 | false |
| 20000 | JSOSolvers (tron) | 7.30385583e8 | 451 | 5265904 | 6 | 5.1615e-17 | false |
| 20000 | Ipopt | 2.503275835e8 | 606 | 15458080 | 5 | 1.3564e-29 | true |
| 20000 | MadNLP | 1.53267666e8 | 728 | 11705296 | 5 | 2.5216e-26 | true |
| 20000 | NonlinearSolve (LM) | 3.4930740292e10 | 2292 | 440027984 | 5 | 5.3623e-02 | false |
| 20000 | NonlinearSolve (TrustRegion) | 3.8723541e7 | 1251 | 126872912 | 4 | 3.3466e-17 | true |
| 20000 | CaNNOLeS | 6.6803583e7 | 258 | 31765440 | 4 | 3.3466e-17 | true |
| 35000 | SecondOrderOptimization (Dogleg) | 3.46356455e7 | 1120548 | 105999136 | 5 | 0.0000e+00 | true |
| 35000 | SecondOrderOptimization (LM) | 2.5992041e7 | 1120542 | 105409168 | 5 | 0.0000e+00 | true |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | Optim (Newton) | 3.5275458e7 | 639 | 117113008 | 5 | 0.0000e+00 | true |
| 35000 | JSOSolvers (trunk) | 2.1798334e7 | 347 | 6706176 | 7 | 6.2538e-17 | false |
| 35000 | JSOSolvers (tron) | 6.6083167e7 | 150 | 9333632 | 6 | 5.1615e-17 | false |
| 35000 | Ipopt | 8.1200083e7 | 460 | 48512000 | 5 | 0.0000e+00 | true |
| 35000 | MadNLP | 4.9173083e7 | 817 | 64565744 | 5 | 0.0000e+00 | true |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | CaNNOLeS | 2.9266021e7 | 228 | 59677568 | 4 | 3.3466e-17 | true |
| 50000 | SecondOrderOptimization (Dogleg) | 4.4500792e7 | 1600548 | 148767008 | 5 | 0.0000e+00 | true |
| 50000 | SecondOrderOptimization (LM) | 4.6432563e7 | 1600542 | 147947664 | 5 | 0.0000e+00 | true |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | Optim (Newton) | 5.2113146e7 | 619 | 165232496 | 5 | 0.0000e+00 | true |
| 50000 | JSOSolvers (trunk) | 3.4634834e7 | 347 | 9344000 | 8 | 5.1989e-18 | false |
| 50000 | JSOSolvers (tron) | 5.0442041e7 | 150 | 13005696 | 5 | 5.3154e-17 | false |
| 50000 | Ipopt | 1.16988791e8 | 460 | 68746240 | 5 | 0.0000e+00 | true |
| 50000 | MadNLP | 7.0170042e7 | 817 | 91273712 | 5 | 0.0000e+00 | true |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | CaNNOLeS | 4.28061875e7 | 228 | 84925312 | 4 | 3.3466e-17 | true |
| 75000 | SecondOrderOptimization (Dogleg) | 6.5013084e7 | 2400580 | 226267424 | 5 | 0.0000e+00 | true |
| 75000 | SecondOrderOptimization (LM) | 6.1271209e7 | 2400574 | 222122128 | 5 | 0.0000e+00 | true |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | Optim (Newton) | 7.88610835e7 | 620 | 246218624 | 5 | 0.0000e+00 | true |
| 75000 | JSOSolvers (trunk) | 5.6372875e7 | 80 | 13945424 | 9 | 6.8484e-20 | true |
| 75000 | JSOSolvers (tron) | 8.11595e7 | 150 | 19414912 | 6 | 2.4189e-18 | false |
| 75000 | Ipopt | 1.8476875e8 | 460 | 102497280 | 5 | 0.0000e+00 | true |
| 75000 | MadNLP | 1.08799625e8 | 817 | 135964144 | 5 | 0.0000e+00 | true |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | CaNNOLeS | 6.7153625e7 | 228 | 110156672 | 4 | 3.3466e-17 | true |
