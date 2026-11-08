# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-08T23:40:26
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 42d352d

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 100 | NLLSModel | 194.1747572815534 | 0 | 0 | 2857.1428571428573 | 0 | 0 |
| 100 | Standalone (Sparse) | 64.97552447552448 | 0 | 0 | 4325.0 | 21 | 18480 |
| 100 | NLPModels (MathOptNLSModel) | 458.0 | 5 | 80 | 14709.0 | 9 | 224 |
| 250 | NLLSModel | 571.7777777777778 | 0 | 0 | 7027.666666666667 | 0 | 0 |
| 250 | Standalone (Sparse) | 160.8181818181818 | 0 | 0 | 9458.0 | 22 | 43776 |
| 250 | NLPModels (MathOptNLSModel) | 1009.952380952381 | 5 | 80 | 37041.0 | 9 | 224 |
| 500 | NLLSModel | 1229.1875 | 0 | 0 | 14708.0 | 0 | 0 |
| 500 | Standalone (Sparse) | 325.14285714285717 | 0 | 0 | 18292.0 | 23 | 87088 |
| 500 | NLPModels (MathOptNLSModel) | 1937.5 | 5 | 80 | 79458.0 | 9 | 224 |
| 1000 | NLLSModel | 2588.5 | 0 | 0 | 29625.0 | 0 | 0 |
| 1000 | Standalone (Sparse) | 613.6363636363636 | 0 | 0 | 42458.0 | 23 | 173648 |
| 1000 | NLPModels (MathOptNLSModel) | 3847.1666666666665 | 5 | 80 | 180709.0 | 9 | 224 |
| 2500 | NLLSModel | 5979.25 | 0 | 0 | 71916.0 | 0 | 0 |
| 2500 | Standalone (Sparse) | 1526.7857142857142 | 0 | 0 | 90542.0 | 24 | 465968 |
| 2500 | NLPModels (MathOptNLSModel) | 9486.333333333334 | 5 | 80 | 428541.0 | 9 | 224 |
| 5000 | NLLSModel | 11958.0 | 0 | 0 | 144292.0 | 0 | 0 |
| 5000 | Standalone (Sparse) | 3017.8571428571427 | 0 | 0 | 206083.0 | 24 | 890416 |
| 5000 | NLPModels (MathOptNLSModel) | 18833.0 | 5 | 80 | 1.4865e6 | 9 | 224 |
| 10000 | NLLSModel | 24542.0 | 0 | 0 | 101541.0 | 3 | 3504 |
| 10000 | Standalone (Sparse) | 16250.0 | 0 | 0 | 386625.0 | 24 | 1731120 |
| 10000 | NLPModels (MathOptNLSModel) | 37416.0 | 5 | 80 | 6.408959e6 | 9 | 224 |
| 20000 | NLLSModel | 47542.0 | 0 | 0 | 432583.0 | 3 | 3504 |
| 20000 | Standalone (Sparse) | 11792.0 | 0 | 0 | 839583.0 | 24 | 3428912 |
| 20000 | NLPModels (MathOptNLSModel) | 74667.0 | 5 | 80 | 1.4429292e7 | 9 | 224 |
| 35000 | NLLSModel | 87875.0 | 0 | 0 | 418500.0 | 3 | 3504 |
| 35000 | Standalone (Sparse) | 20292.0 | 0 | 0 | 1.530333e6 | 24 | 5964336 |
| 50000 | NLLSModel | 119875.0 | 0 | 0 | 638458.0 | 3 | 3504 |
| 50000 | Standalone (Sparse) | 29542.0 | 0 | 0 | 2.136667e6 | 24 | 8487472 |
| 75000 | NLLSModel | 177875.0 | 0 | 0 | 781583.0 | 3 | 3504 |
| 75000 | Standalone (Sparse) | 43041.0 | 0 | 0 | 3.313709e6 | 24 | 12649008 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 100 | SecondOrderOptimization (Dogleg) | 60083.5 | 202 | 114144 | 5 | 0.0000e+00 | true |
| 100 | SecondOrderOptimization (LM) | 63375.0 | 203 | 115920 | 5 | 0.0000e+00 | true |
| 100 | LeastSquaresOptim (Dogleg) | 135604.0 | 75 | 21888 | 5 | 5.0660e-28 | true |
| 100 | LeastSquaresOptim (LM) | 120020.5 | 137 | 19664 | 17 | 1.6425e-15 | true |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 100 | Optim (Newton) | 210354.0 | 536 | 371360 | 5 | 0.0000e+00 | true |
| 100 | JSOSolvers (trunk) | 576417.0 | 426 | 45344 | 7 | 9.2500e-17 | false |
| 100 | JSOSolvers (tron) | 987500.0 | 422 | 47088 | 6 | 5.1615e-17 | false |
| 100 | Ipopt | 1.511875e6 | 534 | 110160 | 5 | 1.3564e-29 | true |
| 100 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 100 | NonlinearSolve (LM) | 2.298979e6 | 691 | 449456 | 8 | 1.3891e-18 | true |
| 100 | NonlinearSolve (TrustRegion) | 207708.0 | 2422 | 409568 | 4 | 3.3466e-17 | true |
| 100 | CaNNOLeS | 140687.5 | 218 | 177312 | 4 | 3.3466e-17 | true |
| 250 | SecondOrderOptimization (Dogleg) | 180603.5 | 211 | 263136 | 5 | 0.0000e+00 | true |
| 250 | SecondOrderOptimization (LM) | 189625.0 | 212 | 267360 | 5 | 0.0000e+00 | true |
| 250 | LeastSquaresOptim (Dogleg) | 304271.0 | 78 | 40816 | 5 | 5.7069e-28 | true |
| 250 | LeastSquaresOptim (LM) | 290000.0 | 146 | 37936 | 18 | 8.3212e-16 | true |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 250 | Optim (Newton) | 388417.0 | 559 | 851664 | 5 | 0.0000e+00 | true |
| 250 | JSOSolvers (trunk) | 1.128542e6 | 433 | 73104 | 7 | 1.0154e-16 | false |
| 250 | JSOSolvers (tron) | 2.229041e6 | 429 | 85024 | 6 | 5.1615e-17 | false |
| 250 | Ipopt | 3.0306455e6 | 543 | 204016 | 5 | 1.3564e-29 | true |
| 250 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 250 | NonlinearSolve (LM) | 1.35786255e7 | 1238 | 2026192 | 8 | 3.2714e-18 | true |
| 250 | NonlinearSolve (TrustRegion) | 726375.0 | 726 | 1497760 | 4 | 3.3466e-17 | true |
| 250 | CaNNOLeS | 325875.0 | 232 | 403744 | 4 | 3.3466e-17 | true |
| 500 | SecondOrderOptimization (Dogleg) | 246479.5 | 254 | 531232 | 5 | 0.0000e+00 | true |
| 500 | SecondOrderOptimization (LM) | 257166.5 | 254 | 539504 | 5 | 0.0000e+00 | true |
| 500 | LeastSquaresOptim (Dogleg) | 575708.5 | 88 | 74224 | 5 | 5.7562e-28 | true |
| 500 | LeastSquaresOptim (LM) | 546520.5 | 155 | 69664 | 18 | 7.3225e-16 | true |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 500 | Optim (Newton) | 627146.5 | 585 | 1690032 | 5 | 0.0000e+00 | true |
| 500 | JSOSolvers (trunk) | 2.239667e6 | 445 | 120480 | 7 | 9.5090e-17 | false |
| 500 | JSOSolvers (tron) | 4.427208e6 | 446 | 151408 | 6 | 5.1615e-17 | false |
| 500 | Ipopt | 5.3405415e6 | 574 | 404832 | 5 | 1.3564e-29 | true |
| 500 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 500 | NonlinearSolve (LM) | 4.17793335e7 | 3324 | 18064688 | 8 | 6.4152e-18 | true |
| 500 | NonlinearSolve (TrustRegion) | 2.6013755e6 | 776 | 6490528 | 4 | 3.3466e-17 | true |
| 500 | CaNNOLeS | 673479.5 | 246 | 795392 | 4 | 3.3466e-17 | true |
| 1000 | SecondOrderOptimization (Dogleg) | 503270.5 | 259 | 1037936 | 5 | 0.0000e+00 | true |
| 1000 | SecondOrderOptimization (LM) | 506354.0 | 259 | 1054400 | 5 | 0.0000e+00 | true |
| 1000 | LeastSquaresOptim (Dogleg) | 1.205084e6 | 88 | 140080 | 5 | 5.7562e-28 | true |
| 1000 | LeastSquaresOptim (LM) | 1.118354e6 | 149 | 131872 | 17 | 5.7105e-15 | true |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1000 | Optim (Newton) | 1.1169995e6 | 605 | 3364784 | 5 | 0.0000e+00 | true |
| 1000 | JSOSolvers (trunk) | 3.550792e6 | 447 | 214720 | 7 | 8.5552e-17 | false |
| 1000 | JSOSolvers (tron) | 8.837958e6 | 447 | 282592 | 6 | 5.1615e-17 | false |
| 1000 | Ipopt | 1.0340771e7 | 578 | 824512 | 5 | 1.3564e-29 | true |
| 1000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 1000 | NonlinearSolve (LM) | 1.52300417e8 | 3288 | 34639952 | 8 | 1.2694e-17 | true |
| 1000 | NonlinearSolve (TrustRegion) | 2.0331875e6 | 1217 | 6387984 | 4 | 3.3466e-17 | true |
| 1000 | CaNNOLeS | 1.320812e6 | 250 | 1610560 | 4 | 3.3466e-17 | true |
| 2500 | SecondOrderOptimization (Dogleg) | 1.236187e6 | 265 | 2708688 | 5 | 0.0000e+00 | true |
| 2500 | SecondOrderOptimization (LM) | 1.2684375e6 | 265 | 2753824 | 5 | 0.0000e+00 | true |
| 2500 | LeastSquaresOptim (Dogleg) | 3.1575e6 | 88 | 362304 | 5 | 5.7562e-28 | true |
| 2500 | LeastSquaresOptim (LM) | 2.990083e6 | 149 | 344304 | 17 | 5.1568e-15 | true |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2500 | Optim (Newton) | 2.6702085e6 | 611 | 8907504 | 5 | 0.0000e+00 | true |
| 2500 | JSOSolvers (trunk) | 9.616417e6 | 447 | 546496 | 7 | 7.4927e-17 | false |
| 2500 | JSOSolvers (tron) | 2.3640375e7 | 448 | 733408 | 6 | 5.1615e-17 | false |
| 2500 | Ipopt | 2.6839458e7 | 582 | 2055232 | 5 | 1.3564e-29 | true |
| 2500 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 2500 | NonlinearSolve (LM) | 1.1749245e9 | 755 | 163347728 | 8 | 3.1500e-17 | true |
| 2500 | NonlinearSolve (TrustRegion) | 4.9687915e6 | 1221 | 16505680 | 4 | 3.3466e-17 | true |
| 2500 | CaNNOLeS | 4.553771e6 | 252 | 4207456 | 4 | 3.3466e-17 | true |
| 5000 | SecondOrderOptimization (Dogleg) | 2.567979e6 | 265 | 5581824 | 5 | 0.0000e+00 | true |
| 5000 | SecondOrderOptimization (LM) | 2.6217085e6 | 265 | 5663824 | 5 | 0.0000e+00 | true |
| 5000 | LeastSquaresOptim (Dogleg) | 5.819521e6 | 88 | 748848 | 5 | 5.7562e-28 | true |
| 5000 | LeastSquaresOptim (LM) | 5.8269585e6 | 148 | 704928 | 17 | 3.7472e-15 | true |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | Optim (Newton) | 5.695667e6 | 611 | 18003696 | 5 | 0.0000e+00 | true |
| 5000 | JSOSolvers (trunk) | 3.2939625e7 | 447 | 1058496 | 7 | 6.9280e-17 | false |
| 5000 | JSOSolvers (tron) | 7.2361667e7 | 448 | 1479184 | 6 | 5.1615e-17 | false |
| 5000 | Ipopt | 5.8255958e7 | 586 | 4158624 | 5 | 1.3564e-29 | true |
| 5000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | NonlinearSolve (LM) | 4.032799542e9 | 3762 | 192710320 | 9 | 3.3743e-24 | true |
| 5000 | NonlinearSolve (TrustRegion) | 1.01598335e7 | 1249 | 32255248 | 4 | 3.3466e-17 | true |
| 5000 | CaNNOLeS | 1.18515415e7 | 254 | 8205184 | 4 | 3.3466e-17 | true |
| 10000 | SecondOrderOptimization (Dogleg) | 4.819479e6 | 326 | 12001136 | 5 | 0.0000e+00 | true |
| 10000 | SecondOrderOptimization (LM) | 4.660188e6 | 326 | 12165056 | 5 | 0.0000e+00 | true |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | LeastSquaresOptim (LM) | 1.1484604e7 | 148 | 1257296 | 17 | 1.2073e-15 | true |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | Optim (Newton) | 1.07576245e7 | 635 | 33501296 | 5 | 0.0000e+00 | true |
| 10000 | JSOSolvers (trunk) | 1.13265167e8 | 447 | 1910464 | 7 | 6.5636e-17 | false |
| 10000 | JSOSolvers (tron) | 2.87586292e8 | 450 | 2643232 | 6 | 5.1615e-17 | false |
| 10000 | Ipopt | 1.255841875e8 | 602 | 7733984 | 5 | 1.3564e-29 | true |
| 10000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | NonlinearSolve (LM) | 1.6102061e10 | 3608 | 376851792 | 9 | 5.7344e-24 | true |
| 10000 | NonlinearSolve (TrustRegion) | 1.9724875e7 | 1255 | 61926768 | 4 | 3.3466e-17 | true |
| 10000 | CaNNOLeS | 3.1615584e7 | 256 | 15971232 | 4 | 3.3466e-17 | true |
| 20000 | SecondOrderOptimization (Dogleg) | 9.267604e6 | 327 | 23944256 | 5 | 0.0000e+00 | true |
| 20000 | SecondOrderOptimization (LM) | 9.841083e6 | 327 | 24272016 | 5 | 0.0000e+00 | true |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | LeastSquaresOptim (LM) | 2.1935291e7 | 158 | 2504224 | 16 | 3.3775e-15 | true |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | Optim (Newton) | 2.11689585e7 | 654 | 66789792 | 5 | 0.0000e+00 | true |
| 20000 | JSOSolvers (trunk) | 3.61477458e8 | 447 | 3794624 | 7 | 6.3520e-17 | false |
| 20000 | JSOSolvers (tron) | 9.88060833e8 | 451 | 5265904 | 6 | 5.1615e-17 | false |
| 20000 | Ipopt | 2.779175e8 | 606 | 15458080 | 5 | 1.3564e-29 | true |
| 20000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | NonlinearSolve (LM) | 3.5557180542e10 | 2292 | 436849424 | 5 | 5.3623e-02 | false |
| 20000 | NonlinearSolve (TrustRegion) | 3.95820835e7 | 1253 | 126872912 | 4 | 3.3466e-17 | true |
| 20000 | CaNNOLeS | 7.7615584e7 | 258 | 31765440 | 4 | 3.3466e-17 | true |
| 35000 | SecondOrderOptimization (Dogleg) | 2.189925e7 | 327 | 42784320 | 5 | 0.0000e+00 | true |
| 35000 | SecondOrderOptimization (LM) | 1.7465958e7 | 327 | 43341456 | 5 | 0.0000e+00 | true |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | Optim (Newton) | 3.6378708e7 | 619 | 117112688 | 5 | 0.0000e+00 | true |
| 35000 | JSOSolvers (trunk) | 4.6939875e7 | 347 | 6706176 | 7 | 6.2538e-17 | false |
| 35000 | JSOSolvers (tron) | 6.8965666e7 | 150 | 9333632 | 6 | 5.1615e-17 | false |
| 35000 | Ipopt | 8.42407085e7 | 460 | 48512000 | 5 | 0.0000e+00 | true |
| 35000 | MadNLP | 4.97935625e7 | 817 | 64565744 | 5 | 0.0000e+00 | true |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | CaNNOLeS | 2.9620646e7 | 228 | 59677568 | 4 | 3.3466e-17 | true |
| 50000 | SecondOrderOptimization (Dogleg) | 2.52000205e7 | 327 | 61824576 | 5 | 0.0000e+00 | true |
| 50000 | SecondOrderOptimization (LM) | 2.5395375e7 | 327 | 62791312 | 5 | 0.0000e+00 | true |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | Optim (Newton) | 5.168225e7 | 634 | 172933216 | 5 | 0.0000e+00 | true |
| 50000 | JSOSolvers (trunk) | 3.7131333e7 | 348 | 9344288 | 8 | 5.1989e-18 | false |
| 50000 | JSOSolvers (tron) | 5.2621167e7 | 150 | 13005696 | 5 | 5.3154e-17 | false |
| 50000 | Ipopt | 1.154690415e8 | 460 | 68746240 | 5 | 0.0000e+00 | true |
| 50000 | MadNLP | 7.1698667e7 | 817 | 91273712 | 5 | 0.0000e+00 | true |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | CaNNOLeS | 4.461e7 | 228 | 78191488 | 4 | 3.3466e-17 | true |
| 75000 | SecondOrderOptimization (Dogleg) | 3.7185333e7 | 332 | 90942256 | 5 | 0.0000e+00 | true |
| 75000 | SecondOrderOptimization (LM) | 3.7178625e7 | 327 | 92695184 | 5 | 0.0000e+00 | true |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | Optim (Newton) | 7.7526646e7 | 627 | 247103472 | 5 | 0.0000e+00 | true |
| 75000 | JSOSolvers (trunk) | 6.0007125e7 | 80 | 13945424 | 9 | 6.8484e-20 | true |
| 75000 | JSOSolvers (tron) | 8.7890459e7 | 150 | 19414912 | 6 | 2.4189e-18 | false |
| 75000 | Ipopt | 1.84884917e8 | 460 | 109198336 | 5 | 0.0000e+00 | true |
| 75000 | MadNLP | 1.073490205e8 | 817 | 135964144 | 5 | 0.0000e+00 | true |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | CaNNOLeS | 6.6186854e7 | 228 | 110156672 | 4 | 3.3466e-17 | true |
