# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-10T11:08:26
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 4aac5c9

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 100 | NLLSModel | 234.19540229885058 | 1 | 16 | 3125.0 | 1 | 64 |
| 100 | Standalone (Sparse) | 70.69288389513109 | 1 | 16 | 4667.0 | 22 | 18544 |
| 100 | NLPModels (MathOptNLSModel) | 10042.0 | 5 | 80 | 25541.0 | 9 | 224 |
| 250 | NLLSModel | 658.84375 | 1 | 16 | 7486.0 | 1 | 64 |
| 250 | Standalone (Sparse) | 172.10434782608695 | 1 | 16 | 9763.666666666666 | 23 | 43840 |
| 250 | NLPModels (MathOptNLSModel) | 25917.0 | 5 | 80 | 64042.0 | 9 | 224 |
| 500 | NLLSModel | 1307.25 | 1 | 16 | 15542.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 342.50847457627117 | 1 | 16 | 19625.0 | 24 | 87152 |
| 500 | NLPModels (MathOptNLSModel) | 48834.0 | 5 | 80 | 128000.0 | 9 | 224 |
| 1000 | NLLSModel | 2630.25 | 1 | 16 | 31500.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 617.1875 | 1 | 16 | 40750.0 | 24 | 173712 |
| 1000 | NLPModels (MathOptNLSModel) | 101917.0 | 5 | 80 | 249208.0 | 9 | 224 |
| 2500 | NLLSModel | 6416.75 | 1 | 16 | 74833.0 | 1 | 64 |
| 2500 | Standalone (Sparse) | 1446.4285714285713 | 1 | 16 | 117250.0 | 25 | 466032 |
| 2500 | NLPModels (MathOptNLSModel) | 305833.0 | 5 | 80 | 691750.0 | 9 | 224 |
| 5000 | NLLSModel | 12750.0 | 1 | 16 | 156792.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 2875.0 | 1 | 16 | 217208.0 | 25 | 890480 |
| 5000 | NLPModels (MathOptNLSModel) | 1.328916e6 | 5 | 80 | 2.8925e6 | 9 | 224 |
| 10000 | NLLSModel | 25583.0 | 1 | 16 | 294417.0 | 6 | 6608 |
| 10000 | Standalone (Sparse) | 6270.75 | 1 | 16 | 503834.0 | 25 | 1731184 |
| 10000 | NLPModels (MathOptNLSModel) | 3.6605e6 | 5 | 80 | 9.979583e6 | 9 | 224 |
| 20000 | NLLSModel | 51542.0 | 1 | 16 | 207000.0 | 6 | 6608 |
| 20000 | Standalone (Sparse) | 11792.0 | 1 | 16 | 930000.0 | 25 | 3428976 |
| 20000 | NLPModels (MathOptNLSModel) | 1.08795e7 | 5 | 80 | 2.5047042e7 | 9 | 224 |
| 35000 | NLLSModel | 84375.0 | 1 | 16 | 330875.0 | 6 | 6608 |
| 35000 | Standalone (Sparse) | 19625.0 | 1 | 16 | 1.415916e6 | 25 | 5964400 |
| 50000 | NLLSModel | 122209.0 | 1 | 16 | 1.01025e6 | 6 | 6608 |
| 50000 | Standalone (Sparse) | 28667.0 | 1 | 16 | 2.167458e6 | 25 | 8487536 |
| 75000 | NLLSModel | 182583.0 | 1 | 16 | 1.360542e6 | 6 | 6608 |
| 75000 | Standalone (Sparse) | 41375.0 | 1 | 16 | 3.096042e6 | 25 | 12649072 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 100 | SecondOrderOptimization (Dogleg) | 69979.0 | 225 | 116032 | 5 | 0.0000e+00 | true |
| 100 | SecondOrderOptimization (LM) | 68395.5 | 224 | 118688 | 5 | 0.0000e+00 | true |
| 100 | LeastSquaresOptim (Dogleg) | 134250.5 | 75 | 21888 | 5 | 5.0660e-28 | true |
| 100 | LeastSquaresOptim (LM) | 119646.0 | 137 | 19664 | 17 | 1.6425e-15 | true |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 100 | Optim (Newton) | 215771.0 | 536 | 371360 | 5 | 0.0000e+00 | true |
| 100 | JSOSolvers (trunk) | 502500.0 | 426 | 45344 | 7 | 9.2500e-17 | false |
| 100 | JSOSolvers (tron) | 969458.0 | 422 | 47088 | 6 | 5.1615e-17 | false |
| 100 | Ipopt | 1.476959e6 | 534 | 110160 | 5 | 1.3564e-29 | true |
| 100 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 100 | NonlinearSolve (LM) | 2.316813e6 | 691 | 449456 | 8 | 1.3891e-18 | true |
| 100 | NonlinearSolve (TrustRegion) | 222291.5 | 700 | 382016 | 4 | 3.3466e-17 | true |
| 100 | CaNNOLeS | 145708.5 | 218 | 177312 | 4 | 3.3466e-17 | true |
| 250 | SecondOrderOptimization (Dogleg) | 204354.5 | 234 | 266160 | 5 | 0.0000e+00 | true |
| 250 | SecondOrderOptimization (LM) | 211583.0 | 233 | 272400 | 5 | 0.0000e+00 | true |
| 250 | LeastSquaresOptim (Dogleg) | 293604.5 | 78 | 40816 | 5 | 5.7069e-28 | true |
| 250 | LeastSquaresOptim (LM) | 297958.5 | 146 | 37936 | 18 | 8.3212e-16 | true |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 250 | Optim (Newton) | 391500.0 | 2121 | 876656 | 5 | 0.0000e+00 | true |
| 250 | JSOSolvers (trunk) | 1.016792e6 | 432 | 72816 | 7 | 1.0154e-16 | false |
| 250 | JSOSolvers (tron) | 2.376875e6 | 429 | 85024 | 6 | 5.1615e-17 | false |
| 250 | Ipopt | 2.8916875e6 | 543 | 204016 | 5 | 1.3564e-29 | true |
| 250 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 250 | NonlinearSolve (LM) | 1.3648021e7 | 698 | 2017552 | 8 | 3.2714e-18 | true |
| 250 | NonlinearSolve (TrustRegion) | 749104.0 | 726 | 1497760 | 4 | 3.3466e-17 | true |
| 250 | CaNNOLeS | 335333.0 | 232 | 403744 | 4 | 3.3466e-17 | true |
| 500 | SecondOrderOptimization (Dogleg) | 267437.5 | 278 | 536352 | 5 | 0.0000e+00 | true |
| 500 | SecondOrderOptimization (LM) | 270354.0 | 277 | 548736 | 5 | 0.0000e+00 | true |
| 500 | LeastSquaresOptim (Dogleg) | 575708.0 | 88 | 74224 | 5 | 5.7562e-28 | true |
| 500 | LeastSquaresOptim (LM) | 555333.5 | 155 | 69664 | 18 | 7.3225e-16 | true |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 500 | Optim (Newton) | 593521.0 | 585 | 1690032 | 5 | 0.0000e+00 | true |
| 500 | JSOSolvers (trunk) | 1.874334e6 | 445 | 120480 | 7 | 9.5090e-17 | false |
| 500 | JSOSolvers (tron) | 4.691e6 | 446 | 151408 | 6 | 5.1615e-17 | false |
| 500 | Ipopt | 4.845417e6 | 574 | 404832 | 5 | 1.3564e-29 | true |
| 500 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 500 | NonlinearSolve (LM) | 4.12154585e7 | 3320 | 18064624 | 8 | 6.4152e-18 | true |
| 500 | NonlinearSolve (TrustRegion) | 2.5199165e6 | 776 | 7162272 | 4 | 3.3466e-17 | true |
| 500 | CaNNOLeS | 650333.0 | 246 | 795392 | 4 | 3.3466e-17 | true |
| 1000 | SecondOrderOptimization (Dogleg) | 540771.0 | 283 | 1047152 | 5 | 0.0000e+00 | true |
| 1000 | SecondOrderOptimization (LM) | 519541.5 | 282 | 1071824 | 5 | 0.0000e+00 | true |
| 1000 | LeastSquaresOptim (Dogleg) | 1.186271e6 | 88 | 140080 | 5 | 5.7562e-28 | true |
| 1000 | LeastSquaresOptim (LM) | 1.0977705e6 | 149 | 131872 | 17 | 5.7105e-15 | true |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1000 | Optim (Newton) | 1.0841665e6 | 605 | 3364784 | 5 | 0.0000e+00 | true |
| 1000 | JSOSolvers (trunk) | 3.821083e6 | 447 | 214720 | 7 | 8.5552e-17 | false |
| 1000 | JSOSolvers (tron) | 9.375167e6 | 447 | 282592 | 6 | 5.1615e-17 | false |
| 1000 | Ipopt | 9.6787705e6 | 578 | 824512 | 5 | 1.3564e-29 | true |
| 1000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 1000 | NonlinearSolve (LM) | 1.52537875e8 | 3284 | 34639888 | 8 | 1.2694e-17 | true |
| 1000 | NonlinearSolve (TrustRegion) | 1.973229e6 | 1357 | 6390224 | 4 | 3.3466e-17 | true |
| 1000 | CaNNOLeS | 1.3381665e6 | 250 | 1610560 | 4 | 3.3466e-17 | true |
| 2500 | SecondOrderOptimization (Dogleg) | 1.280709e6 | 289 | 2730192 | 5 | 0.0000e+00 | true |
| 2500 | SecondOrderOptimization (LM) | 1.292562e6 | 288 | 2795824 | 5 | 0.0000e+00 | true |
| 2500 | LeastSquaresOptim (Dogleg) | 3.1515835e6 | 88 | 362304 | 5 | 5.7562e-28 | true |
| 2500 | LeastSquaresOptim (LM) | 2.971646e6 | 149 | 344304 | 17 | 5.1568e-15 | true |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2500 | Optim (Newton) | 2.800167e6 | 611 | 8907504 | 5 | 0.0000e+00 | true |
| 2500 | JSOSolvers (trunk) | 9.8055e6 | 447 | 546496 | 7 | 7.4927e-17 | false |
| 2500 | JSOSolvers (tron) | 2.3263084e7 | 448 | 733408 | 6 | 5.1615e-17 | false |
| 2500 | Ipopt | 2.6085917e7 | 582 | 2055232 | 5 | 1.3564e-29 | true |
| 2500 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 2500 | NonlinearSolve (LM) | 1.078756375e9 | 1235 | 163355408 | 8 | 3.1500e-17 | true |
| 2500 | NonlinearSolve (TrustRegion) | 4.958375e6 | 1276 | 16506560 | 4 | 3.3466e-17 | true |
| 2500 | CaNNOLeS | 4.0529585e6 | 252 | 4207456 | 4 | 3.3466e-17 | true |
| 5000 | SecondOrderOptimization (Dogleg) | 2.5941665e6 | 289 | 5632000 | 5 | 0.0000e+00 | true |
| 5000 | SecondOrderOptimization (LM) | 2.6501875e6 | 288 | 5763168 | 5 | 0.0000e+00 | true |
| 5000 | LeastSquaresOptim (Dogleg) | 5.74875e6 | 88 | 748848 | 5 | 5.7562e-28 | true |
| 5000 | LeastSquaresOptim (LM) | 5.861771e6 | 148 | 704928 | 17 | 3.7472e-15 | true |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | Optim (Newton) | 5.2651665e6 | 647 | 18004272 | 5 | 0.0000e+00 | true |
| 5000 | JSOSolvers (trunk) | 2.713825e7 | 447 | 1058496 | 7 | 6.9280e-17 | false |
| 5000 | JSOSolvers (tron) | 7.1505375e7 | 448 | 1479184 | 6 | 5.1615e-17 | false |
| 5000 | Ipopt | 5.391425e7 | 586 | 4158624 | 5 | 1.3564e-29 | true |
| 5000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | NonlinearSolve (LM) | 4.042601542e9 | 3634 | 192708272 | 9 | 3.3743e-24 | true |
| 5000 | NonlinearSolve (TrustRegion) | 1.02295e7 | 1221 | 32254800 | 4 | 3.3466e-17 | true |
| 5000 | CaNNOLeS | 1.07094585e7 | 254 | 8205184 | 4 | 3.3466e-17 | true |
| 10000 | SecondOrderOptimization (Dogleg) | 3.231875e6 | 344 | 12084224 | 2 | 1.9640e-02 | false |
| 10000 | SecondOrderOptimization (LM) | 4.3971665e6 | 361 | 12349760 | 5 | 0.0000e+00 | true |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | LeastSquaresOptim (LM) | 1.1213125e7 | 148 | 1257296 | 17 | 1.2073e-15 | true |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | Optim (Newton) | 1.10641665e7 | 631 | 33501232 | 5 | 0.0000e+00 | true |
| 10000 | JSOSolvers (trunk) | 1.13299167e8 | 447 | 1910464 | 7 | 6.5636e-17 | false |
| 10000 | JSOSolvers (tron) | 2.96658209e8 | 450 | 2643232 | 6 | 5.1615e-17 | false |
| 10000 | Ipopt | 1.13995416e8 | 602 | 7733984 | 5 | 1.3564e-29 | true |
| 10000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | NonlinearSolve (LM) | 1.6049458375e10 | 3572 | 380521232 | 9 | 5.7344e-24 | true |
| 10000 | NonlinearSolve (TrustRegion) | 1.9419875e7 | 1251 | 61926704 | 4 | 3.3466e-17 | true |
| 10000 | CaNNOLeS | 2.9951833e7 | 256 | 15971232 | 4 | 3.3466e-17 | true |
| 20000 | SecondOrderOptimization (Dogleg) | 8.596084e6 | 345 | 24109264 | 2 | 1.9640e-02 | false |
| 20000 | SecondOrderOptimization (LM) | 1.0298896e7 | 362 | 24620560 | 5 | 0.0000e+00 | true |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | LeastSquaresOptim (LM) | 2.14820835e7 | 158 | 2504224 | 16 | 3.3775e-15 | true |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | Optim (Newton) | 2.1093959e7 | 611 | 66789104 | 5 | 0.0000e+00 | true |
| 20000 | JSOSolvers (trunk) | 3.17075458e8 | 495 | 3795392 | 7 | 6.3520e-17 | false |
| 20000 | JSOSolvers (tron) | 8.83428666e8 | 451 | 5265904 | 6 | 5.1615e-17 | false |
| 20000 | Ipopt | 2.533478955e8 | 606 | 15458080 | 5 | 1.3564e-29 | true |
| 20000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | NonlinearSolve (LM) | 3.5242876708e10 | 2292 | 441174800 | 5 | 5.3623e-02 | false |
| 20000 | NonlinearSolve (TrustRegion) | 3.9056625e7 | 1245 | 126872784 | 4 | 3.3466e-17 | true |
| 20000 | CaNNOLeS | 7.2129e7 | 258 | 31765440 | 4 | 3.3466e-17 | true |
| 35000 | SecondOrderOptimization (Dogleg) | 1.1301583e7 | 345 | 43080400 | 2 | 1.9640e-02 | false |
| 35000 | SecondOrderOptimization (LM) | 1.8872792e7 | 362 | 43952144 | 5 | 0.0000e+00 | true |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | Optim (Newton) | 3.56008335e7 | 611 | 117112560 | 5 | 0.0000e+00 | true |
| 35000 | JSOSolvers (trunk) | 2.1971875e7 | 347 | 6706176 | 7 | 6.2538e-17 | false |
| 35000 | JSOSolvers (tron) | 6.7023709e7 | 150 | 9333632 | 6 | 5.1615e-17 | false |
| 35000 | Ipopt | 8.2037209e7 | 460 | 48512000 | 5 | 0.0000e+00 | true |
| 35000 | MadNLP | 5.0316e7 | 817 | 64565744 | 5 | 0.0000e+00 | true |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | CaNNOLeS | 2.9728042e7 | 228 | 59677568 | 4 | 3.3466e-17 | true |
| 50000 | SecondOrderOptimization (Dogleg) | 1.6468958e7 | 345 | 62235344 | 2 | 1.9640e-02 | false |
| 50000 | SecondOrderOptimization (LM) | 2.3710542e7 | 362 | 63336464 | 5 | 0.0000e+00 | true |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | Optim (Newton) | 5.1853e7 | 611 | 165232368 | 5 | 0.0000e+00 | true |
| 50000 | JSOSolvers (trunk) | 3.4812583e7 | 347 | 9344000 | 8 | 5.1989e-18 | false |
| 50000 | JSOSolvers (tron) | 5.1574375e7 | 150 | 13005696 | 5 | 5.3154e-17 | false |
| 50000 | Ipopt | 1.167400625e8 | 460 | 68746240 | 5 | 0.0000e+00 | true |
| 50000 | MadNLP | 7.1988584e7 | 817 | 91273712 | 5 | 0.0000e+00 | true |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | CaNNOLeS | 4.29466465e7 | 228 | 84925312 | 4 | 3.3466e-17 | true |
| 75000 | SecondOrderOptimization (Dogleg) | 3.6755292e7 | 363 | 88941328 | 5 | 0.0000e+00 | true |
| 75000 | SecondOrderOptimization (LM) | 3.7062792e7 | 362 | 90749968 | 5 | 0.0000e+00 | true |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | Optim (Newton) | 7.81222505e7 | 619 | 246218608 | 5 | 0.0000e+00 | true |
| 75000 | JSOSolvers (trunk) | 5.68615e7 | 80 | 13945424 | 9 | 6.8484e-20 | true |
| 75000 | JSOSolvers (tron) | 8.1686625e7 | 150 | 19414912 | 6 | 2.4189e-18 | false |
| 75000 | Ipopt | 1.766735e8 | 460 | 102497280 | 5 | 0.0000e+00 | true |
| 75000 | MadNLP | 1.14185292e8 | 817 | 135964144 | 5 | 0.0000e+00 | true |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | CaNNOLeS | 6.8343271e7 | 228 | 110156672 | 4 | 3.3466e-17 | true |
