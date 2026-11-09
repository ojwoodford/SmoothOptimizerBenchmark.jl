# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-09T19:47:27
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 1bf5675

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 100 | NLLSModel | 194.86868686868686 | 0 | 0 | 3035.714285714286 | 0 | 0 |
| 100 | Standalone (Sparse) | 62.35314685314685 | 0 | 0 | 4489.75 | 21 | 18480 |
| 100 | NLPModels (MathOptNLSModel) | 458.0 | 5 | 80 | 14667.0 | 9 | 224 |
| 250 | NLLSModel | 574.0555555555555 | 0 | 0 | 7361.0 | 0 | 0 |
| 250 | Standalone (Sparse) | 151.5748031496063 | 0 | 0 | 9583.0 | 22 | 43776 |
| 250 | NLPModels (MathOptNLSModel) | 1059.5238095238096 | 5 | 80 | 37000.0 | 9 | 224 |
| 500 | NLLSModel | 1269.5882352941176 | 0 | 0 | 16208.0 | 0 | 0 |
| 500 | Standalone (Sparse) | 315.4761904761905 | 0 | 0 | 18334.0 | 23 | 87088 |
| 500 | NLPModels (MathOptNLSModel) | 2050.0 | 5 | 80 | 73959.0 | 9 | 224 |
| 1000 | NLLSModel | 2435.222222222222 | 0 | 0 | 30459.0 | 0 | 0 |
| 1000 | Standalone (Sparse) | 595.969696969697 | 0 | 0 | 40167.0 | 23 | 173648 |
| 1000 | NLPModels (MathOptNLSModel) | 3908.4 | 5 | 80 | 163042.0 | 9 | 224 |
| 2500 | NLLSModel | 5968.75 | 0 | 0 | 75666.0 | 0 | 0 |
| 2500 | Standalone (Sparse) | 1398.7857142857142 | 0 | 0 | 87167.0 | 24 | 465968 |
| 2500 | NLPModels (MathOptNLSModel) | 9708.333333333334 | 5 | 80 | 454375.0 | 9 | 224 |
| 5000 | NLLSModel | 12334.0 | 0 | 0 | 152791.0 | 0 | 0 |
| 5000 | Standalone (Sparse) | 2791.75 | 0 | 0 | 218125.0 | 24 | 890416 |
| 5000 | NLPModels (MathOptNLSModel) | 18917.0 | 5 | 80 | 2.170417e6 | 9 | 224 |
| 10000 | NLLSModel | 24583.0 | 0 | 0 | 273666.0 | 5 | 6544 |
| 10000 | Standalone (Sparse) | 6333.25 | 0 | 0 | 413500.0 | 24 | 1731120 |
| 10000 | NLPModels (MathOptNLSModel) | 38667.0 | 5 | 80 | 5.243333e6 | 9 | 224 |
| 20000 | NLLSModel | 49125.0 | 0 | 0 | 483041.0 | 5 | 6544 |
| 20000 | Standalone (Sparse) | 11750.0 | 0 | 0 | 840125.0 | 24 | 3428912 |
| 20000 | NLPModels (MathOptNLSModel) | 79042.0 | 5 | 80 | 1.448925e7 | 9 | 224 |
| 35000 | NLLSModel | 86750.0 | 0 | 0 | 551166.0 | 5 | 6544 |
| 35000 | Standalone (Sparse) | 20250.0 | 0 | 0 | 1.270333e6 | 24 | 5964336 |
| 50000 | NLLSModel | 119834.0 | 0 | 0 | 1.353042e6 | 5 | 6544 |
| 50000 | Standalone (Sparse) | 29458.0 | 0 | 0 | 2.05975e6 | 24 | 8487472 |
| 75000 | NLLSModel | 177709.0 | 0 | 0 | 1.72425e6 | 5 | 6544 |
| 75000 | Standalone (Sparse) | 42958.0 | 0 | 0 | 3.172334e6 | 24 | 12649008 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 100 | SecondOrderOptimization (Dogleg) | 71208.5 | 225 | 116032 | 5 | 0.0000e+00 | true |
| 100 | SecondOrderOptimization (LM) | 65333.5 | 224 | 118688 | 5 | 0.0000e+00 | true |
| 100 | LeastSquaresOptim (Dogleg) | 133708.0 | 75 | 21888 | 5 | 5.0660e-28 | true |
| 100 | LeastSquaresOptim (LM) | 124437.5 | 137 | 19664 | 17 | 1.6425e-15 | true |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 100 | Optim (Newton) | 209916.5 | 536 | 371360 | 5 | 0.0000e+00 | true |
| 100 | JSOSolvers (trunk) | 549041.0 | 426 | 45344 | 7 | 9.2500e-17 | false |
| 100 | JSOSolvers (tron) | 1.103959e6 | 422 | 47088 | 6 | 5.1615e-17 | false |
| 100 | Ipopt | 1.605542e6 | 534 | 110160 | 5 | 1.3564e-29 | true |
| 100 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 100 | NonlinearSolve (LM) | 2.283083e6 | 691 | 449456 | 8 | 1.3891e-18 | true |
| 100 | NonlinearSolve (TrustRegion) | 199458.0 | 700 | 382016 | 4 | 3.3466e-17 | true |
| 100 | CaNNOLeS | 135145.5 | 218 | 177312 | 4 | 3.3466e-17 | true |
| 250 | SecondOrderOptimization (Dogleg) | 187708.0 | 234 | 266160 | 5 | 0.0000e+00 | true |
| 250 | SecondOrderOptimization (LM) | 195291.0 | 233 | 272400 | 5 | 0.0000e+00 | true |
| 250 | LeastSquaresOptim (Dogleg) | 298312.5 | 78 | 40816 | 5 | 5.7069e-28 | true |
| 250 | LeastSquaresOptim (LM) | 282333.0 | 146 | 37936 | 18 | 8.3212e-16 | true |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 250 | Optim (Newton) | 377125.5 | 559 | 851664 | 5 | 0.0000e+00 | true |
| 250 | JSOSolvers (trunk) | 992458.0 | 432 | 72816 | 7 | 1.0154e-16 | false |
| 250 | JSOSolvers (tron) | 2.205e6 | 429 | 85024 | 6 | 5.1615e-17 | false |
| 250 | Ipopt | 2.860292e6 | 543 | 204016 | 5 | 1.3564e-29 | true |
| 250 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 250 | NonlinearSolve (LM) | 1.36227915e7 | 698 | 2017552 | 8 | 3.2714e-18 | true |
| 250 | NonlinearSolve (TrustRegion) | 744250.0 | 726 | 1497760 | 4 | 3.3466e-17 | true |
| 250 | CaNNOLeS | 337146.0 | 232 | 403744 | 4 | 3.3466e-17 | true |
| 500 | SecondOrderOptimization (Dogleg) | 274583.0 | 278 | 536352 | 5 | 0.0000e+00 | true |
| 500 | SecondOrderOptimization (LM) | 306000.0 | 277 | 548736 | 5 | 0.0000e+00 | true |
| 500 | LeastSquaresOptim (Dogleg) | 589166.5 | 88 | 74224 | 5 | 5.7562e-28 | true |
| 500 | LeastSquaresOptim (LM) | 560229.5 | 155 | 69664 | 18 | 7.3225e-16 | true |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 500 | Optim (Newton) | 646583.0 | 585 | 1690032 | 5 | 0.0000e+00 | true |
| 500 | JSOSolvers (trunk) | 1.99325e6 | 445 | 120480 | 7 | 9.5090e-17 | false |
| 500 | JSOSolvers (tron) | 4.613041e6 | 446 | 151408 | 6 | 5.1615e-17 | false |
| 500 | Ipopt | 5.656125e6 | 574 | 404832 | 5 | 1.3564e-29 | true |
| 500 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 500 | NonlinearSolve (LM) | 4.1496896e7 | 3328 | 18064752 | 8 | 6.4152e-18 | true |
| 500 | NonlinearSolve (TrustRegion) | 2.5660415e6 | 776 | 7162272 | 4 | 3.3466e-17 | true |
| 500 | CaNNOLeS | 660666.5 | 246 | 795392 | 4 | 3.3466e-17 | true |
| 1000 | SecondOrderOptimization (Dogleg) | 551459.0 | 283 | 1047152 | 5 | 0.0000e+00 | true |
| 1000 | SecondOrderOptimization (LM) | 535917.0 | 282 | 1071824 | 5 | 0.0000e+00 | true |
| 1000 | LeastSquaresOptim (Dogleg) | 1.2135625e6 | 88 | 140080 | 5 | 5.7562e-28 | true |
| 1000 | LeastSquaresOptim (LM) | 1.1272915e6 | 149 | 131872 | 17 | 5.7105e-15 | true |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1000 | Optim (Newton) | 1.116146e6 | 605 | 3364784 | 5 | 0.0000e+00 | true |
| 1000 | JSOSolvers (trunk) | 3.525625e6 | 448 | 215008 | 7 | 8.5552e-17 | false |
| 1000 | JSOSolvers (tron) | 9.309292e6 | 447 | 282592 | 6 | 5.1615e-17 | false |
| 1000 | Ipopt | 1.05129165e7 | 578 | 824512 | 5 | 1.3564e-29 | true |
| 1000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 1000 | NonlinearSolve (LM) | 1.52205583e8 | 3288 | 34639952 | 8 | 1.2694e-17 | true |
| 1000 | NonlinearSolve (TrustRegion) | 2.003e6 | 1361 | 6390288 | 4 | 3.3466e-17 | true |
| 1000 | CaNNOLeS | 1.3324795e6 | 250 | 1610560 | 4 | 3.3466e-17 | true |
| 2500 | SecondOrderOptimization (Dogleg) | 1.4560625e6 | 289 | 2730192 | 5 | 0.0000e+00 | true |
| 2500 | SecondOrderOptimization (LM) | 1.4976665e6 | 288 | 2795824 | 5 | 0.0000e+00 | true |
| 2500 | LeastSquaresOptim (Dogleg) | 3.155042e6 | 88 | 362304 | 5 | 5.7562e-28 | true |
| 2500 | LeastSquaresOptim (LM) | 3.0516665e6 | 149 | 344304 | 17 | 5.1568e-15 | true |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2500 | Optim (Newton) | 2.634625e6 | 611 | 8907504 | 5 | 0.0000e+00 | true |
| 2500 | JSOSolvers (trunk) | 9.326917e6 | 447 | 546496 | 7 | 7.4927e-17 | false |
| 2500 | JSOSolvers (tron) | 2.2791875e7 | 448 | 733408 | 6 | 5.1615e-17 | false |
| 2500 | Ipopt | 2.691425e7 | 582 | 2055232 | 5 | 1.3564e-29 | true |
| 2500 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 2500 | NonlinearSolve (LM) | 1.090000792e9 | 755 | 163347728 | 8 | 3.1500e-17 | true |
| 2500 | NonlinearSolve (TrustRegion) | 4.8053545e6 | 1278 | 16506592 | 4 | 3.3466e-17 | true |
| 2500 | CaNNOLeS | 3.793417e6 | 252 | 4207456 | 4 | 3.3466e-17 | true |
| 5000 | SecondOrderOptimization (Dogleg) | 2.5765625e6 | 289 | 5632000 | 5 | 0.0000e+00 | true |
| 5000 | SecondOrderOptimization (LM) | 2.638104e6 | 288 | 5763168 | 5 | 0.0000e+00 | true |
| 5000 | LeastSquaresOptim (Dogleg) | 5.685646e6 | 88 | 748848 | 5 | 5.7562e-28 | true |
| 5000 | LeastSquaresOptim (LM) | 5.7575625e6 | 148 | 704928 | 17 | 3.7472e-15 | true |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | Optim (Newton) | 5.3001455e6 | 611 | 18003696 | 5 | 0.0000e+00 | true |
| 5000 | JSOSolvers (trunk) | 2.642325e7 | 447 | 1058496 | 7 | 6.9280e-17 | false |
| 5000 | JSOSolvers (tron) | 6.9471292e7 | 448 | 1479184 | 6 | 5.1615e-17 | false |
| 5000 | Ipopt | 5.90310625e7 | 586 | 4158624 | 5 | 1.3564e-29 | true |
| 5000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | NonlinearSolve (LM) | 4.032318833e9 | 3778 | 192710576 | 9 | 3.3743e-24 | true |
| 5000 | NonlinearSolve (TrustRegion) | 1.01437505e7 | 1253 | 32255312 | 4 | 3.3466e-17 | true |
| 5000 | CaNNOLeS | 1.12802495e7 | 254 | 8205184 | 4 | 3.3466e-17 | true |
| 10000 | SecondOrderOptimization (Dogleg) | 5.710125e6 | 357 | 12097360 | 5 | 0.0000e+00 | true |
| 10000 | SecondOrderOptimization (LM) | 4.701958e6 | 361 | 12349760 | 5 | 0.0000e+00 | true |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | LeastSquaresOptim (LM) | 1.1243438e7 | 148 | 1257296 | 17 | 1.2073e-15 | true |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | Optim (Newton) | 1.0443333e7 | 611 | 33500912 | 5 | 0.0000e+00 | true |
| 10000 | JSOSolvers (trunk) | 1.12450417e8 | 447 | 1910464 | 7 | 6.5636e-17 | false |
| 10000 | JSOSolvers (tron) | 3.00954333e8 | 450 | 2643232 | 6 | 5.1615e-17 | false |
| 10000 | Ipopt | 1.244445205e8 | 602 | 7733984 | 5 | 1.3564e-29 | true |
| 10000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | NonlinearSolve (LM) | 1.6257223e10 | 3632 | 379473616 | 9 | 5.7344e-24 | true |
| 10000 | NonlinearSolve (TrustRegion) | 1.9576646e7 | 1367 | 61928560 | 4 | 3.3466e-17 | true |
| 10000 | CaNNOLeS | 3.12861665e7 | 256 | 15971232 | 4 | 3.3466e-17 | true |
| 20000 | SecondOrderOptimization (Dogleg) | 1.0390187e7 | 358 | 24122400 | 5 | 0.0000e+00 | true |
| 20000 | SecondOrderOptimization (LM) | 1.0209667e7 | 362 | 24620560 | 5 | 0.0000e+00 | true |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | LeastSquaresOptim (LM) | 2.1659708e7 | 158 | 2504224 | 16 | 3.3775e-15 | true |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | Optim (Newton) | 2.070875e7 | 643 | 66789616 | 5 | 0.0000e+00 | true |
| 20000 | JSOSolvers (trunk) | 3.53088791e8 | 447 | 3794624 | 7 | 6.3520e-17 | false |
| 20000 | JSOSolvers (tron) | 9.59889584e8 | 451 | 5265904 | 6 | 5.1615e-17 | false |
| 20000 | Ipopt | 2.77888354e8 | 618 | 15458272 | 5 | 1.3564e-29 | true |
| 20000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | NonlinearSolve (LM) | 3.5954134542e10 | 2288 | 502172368 | 5 | 5.3623e-02 | false |
| 20000 | NonlinearSolve (TrustRegion) | 3.97009375e7 | 1245 | 126872784 | 4 | 3.3466e-17 | true |
| 20000 | CaNNOLeS | 7.6630375e7 | 258 | 31765440 | 4 | 3.3466e-17 | true |
| 35000 | SecondOrderOptimization (Dogleg) | 2.3412958e7 | 358 | 43093536 | 5 | 0.0000e+00 | true |
| 35000 | SecondOrderOptimization (LM) | 2.0017708e7 | 362 | 43952144 | 5 | 0.0000e+00 | true |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | Optim (Newton) | 3.7215083e7 | 639 | 117113008 | 5 | 0.0000e+00 | true |
| 35000 | JSOSolvers (trunk) | 3.3056917e7 | 347 | 6706176 | 7 | 6.2538e-17 | false |
| 35000 | JSOSolvers (tron) | 7.0007959e7 | 150 | 9333632 | 6 | 5.1615e-17 | false |
| 35000 | Ipopt | 8.86104165e7 | 460 | 48512000 | 5 | 0.0000e+00 | true |
| 35000 | MadNLP | 5.2666083e7 | 817 | 64565744 | 5 | 0.0000e+00 | true |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | CaNNOLeS | 2.9416792e7 | 228 | 59038592 | 4 | 3.3466e-17 | true |
| 50000 | SecondOrderOptimization (Dogleg) | 2.5798041e7 | 358 | 62412320 | 5 | 0.0000e+00 | true |
| 50000 | SecondOrderOptimization (LM) | 2.884825e7 | 362 | 63467536 | 5 | 0.0000e+00 | true |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | Optim (Newton) | 5.5070417e7 | 631 | 167297072 | 5 | 0.0000e+00 | true |
| 50000 | JSOSolvers (trunk) | 3.5695417e7 | 347 | 9344000 | 8 | 5.1989e-18 | false |
| 50000 | JSOSolvers (tron) | 5.1244209e7 | 150 | 13005696 | 5 | 5.3154e-17 | false |
| 50000 | Ipopt | 1.23041458e8 | 460 | 68746240 | 5 | 0.0000e+00 | true |
| 50000 | MadNLP | 7.9198271e7 | 817 | 91273712 | 5 | 0.0000e+00 | true |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | CaNNOLeS | 4.3435625e7 | 228 | 77552512 | 4 | 3.3466e-17 | true |
| 75000 | SecondOrderOptimization (Dogleg) | 3.93776045e7 | 363 | 91562768 | 5 | 0.0000e+00 | true |
| 75000 | SecondOrderOptimization (LM) | 4.464425e7 | 362 | 93371408 | 5 | 0.0000e+00 | true |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | Optim (Newton) | 7.853775e7 | 647 | 248545584 | 5 | 0.0000e+00 | true |
| 75000 | JSOSolvers (trunk) | 5.8957688e7 | 80 | 13945424 | 9 | 6.8484e-20 | true |
| 75000 | JSOSolvers (tron) | 8.44145e7 | 150 | 19414912 | 6 | 2.4189e-18 | false |
| 75000 | Ipopt | 1.92165917e8 | 460 | 102497280 | 5 | 0.0000e+00 | true |
| 75000 | MadNLP | 1.20701896e8 | 817 | 135964144 | 5 | 0.0000e+00 | true |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | CaNNOLeS | 6.8592791e7 | 228 | 119495552 | 4 | 3.3466e-17 | true |
