# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-09T19:49:49
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 5a66143

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | NLLSModel (Static) | 279.1095890410959 | 0 | 0 | 1482.5833333333333 | 2 | 64 |
| 64 | Standalone | 282.9861111111111 | 0 | 0 | 940.4761904761905 | 0 | 0 |
| 128 | NLLSModel (Static) | 562.5 | 0 | 0 | 2861.1666666666665 | 2 | 64 |
| 128 | Standalone | 524.1052631578947 | 0 | 0 | 1697.9166666666667 | 0 | 0 |
| 256 | NLLSModel (Static) | 1083.3157894736842 | 0 | 0 | 6906.25 | 2 | 64 |
| 256 | Standalone | 1081.0 | 0 | 0 | 3514.0 | 0 | 0 |
| 512 | NLLSModel (Static) | 2150.0 | 0 | 0 | 11166.0 | 2 | 64 |
| 512 | Standalone | 2054.2 | 0 | 0 | 6635.25 | 0 | 0 |
| 1024 | NLLSModel (Static) | 4241.8 | 0 | 0 | 22000.0 | 2 | 64 |
| 1024 | Standalone | 4125.0 | 0 | 0 | 13333.0 | 0 | 0 |
| 2048 | NLLSModel (Static) | 8347.0 | 0 | 0 | 46625.0 | 2 | 64 |
| 2048 | Standalone | 8152.666666666667 | 0 | 0 | 26750.0 | 0 | 0 |
| 4096 | NLLSModel (Static) | 17250.0 | 0 | 0 | 92708.0 | 2 | 64 |
| 4096 | Standalone | 16584.0 | 0 | 0 | 55209.0 | 0 | 0 |
| 8192 | NLLSModel (Static) | 34917.0 | 0 | 0 | 180750.0 | 2 | 64 |
| 8192 | Standalone | 34458.0 | 0 | 0 | 113375.0 | 0 | 0 |
| 16384 | NLLSModel (Static) | 70583.0 | 0 | 0 | 303458.0 | 5 | 720 |
| 16384 | Standalone | 71333.0 | 0 | 0 | 234917.0 | 0 | 0 |
| 32768 | NLLSModel (Static) | 141875.0 | 0 | 0 | 452292.0 | 5 | 720 |
| 32768 | Standalone | 141459.0 | 0 | 0 | 460083.0 | 0 | 0 |
| 65536 | NLLSModel (Static) | 266875.0 | 0 | 0 | 997208.0 | 5 | 720 |
| 65536 | Standalone | 279375.0 | 0 | 0 | 946709.0 | 0 | 0 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 10292.0 | 29 | 1552 | 5 | 1.3405e-02 | true |
| 64 | SecondOrderOptimization (LM) | 9146.0 | 26 | 1616 | 5 | 1.3405e-02 | true |
| 64 | LeastSquaresOptim (Dogleg) | 14833.0 | 115 | 258864 | 5 | 1.3405e-02 | true |
| 64 | LeastSquaresOptim (LM) | 20042.0 | 147 | 360576 | 7 | 1.3405e-02 | true |
| 64 | Optim (NewtonTrustRegion) | 23041.5 | 225 | 15120 | 5 | 1.3405e-02 | true |
| 64 | Optim (Newton) | 16958.0 | 116 | 3840 | 6 | 1.3405e-02 | true |
| 64 | JSOSolvers (trunk) | 19395.5 | 59 | 5824 | 6 | 1.3405e-02 | true |
| 64 | JSOSolvers (tron) | 31416.5 | 124 | 9888 | 7 | 1.3405e-02 | true |
| 64 | Ipopt | 708229.5 | 275 | 11968 | 6 | 1.3405e-02 | true |
| 64 | MadNLP | 289708.5 | 543 | 45056 | 6 | 1.3405e-02 | true |
| 64 | NonlinearSolve (LM) | 514708.0 | 1471 | 219536 | 112 | 1.3405e-02 | true |
| 64 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 64 | CaNNOLeS | 61187.0 | 176 | 65008 | 6 | 1.3405e-02 | true |
| 128 | SecondOrderOptimization (Dogleg) | 19625.0 | 29 | 1552 | 5 | 2.5926e-02 | true |
| 128 | SecondOrderOptimization (LM) | 16167.0 | 26 | 1616 | 5 | 2.5926e-02 | true |
| 128 | LeastSquaresOptim (Dogleg) | 21208.0 | 116 | 261968 | 5 | 2.5926e-02 | true |
| 128 | LeastSquaresOptim (LM) | 30396.0 | 148 | 364160 | 7 | 2.5926e-02 | true |
| 128 | Optim (NewtonTrustRegion) | 24083.0 | 197 | 13024 | 4 | 2.5926e-02 | true |
| 128 | Optim (Newton) | 21583.5 | 103 | 3568 | 5 | 2.5926e-02 | true |
| 128 | JSOSolvers (trunk) | 34020.5 | 59 | 9088 | 7 | 2.5926e-02 | true |
| 128 | JSOSolvers (tron) | 51729.0 | 124 | 13696 | 7 | 2.5926e-02 | true |
| 128 | Ipopt | 618562.5 | 245 | 10720 | 5 | 2.5926e-02 | true |
| 128 | MadNLP | 273584.0 | 543 | 45056 | 5 | 2.5926e-02 | true |
| 128 | NonlinearSolve (LM) | 731145.5 | 1475 | 345904 | 112 | 2.5926e-02 | true |
| 128 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 128 | CaNNOLeS | 94667.0 | 185 | 122864 | 5 | 2.5926e-02 | true |
| 256 | SecondOrderOptimization (Dogleg) | 37000.0 | 29 | 1552 | 5 | 5.5410e-02 | true |
| 256 | SecondOrderOptimization (LM) | 31187.5 | 26 | 1616 | 5 | 5.5410e-02 | true |
| 256 | LeastSquaresOptim (Dogleg) | 37729.0 | 119 | 268016 | 5 | 5.5410e-02 | true |
| 256 | LeastSquaresOptim (LM) | 56750.0 | 169 | 422160 | 8 | 5.5410e-02 | true |
| 256 | Optim (NewtonTrustRegion) | 31667.0 | 197 | 13024 | 4 | 5.5410e-02 | true |
| 256 | Optim (Newton) | 34437.0 | 103 | 3568 | 5 | 5.5410e-02 | true |
| 256 | JSOSolvers (trunk) | 59896.0 | 65 | 15040 | 7 | 5.5410e-02 | true |
| 256 | JSOSolvers (tron) | 75604.0 | 131 | 20640 | 6 | 5.5410e-02 | true |
| 256 | Ipopt | 633083.5 | 245 | 10720 | 5 | 5.5410e-02 | true |
| 256 | MadNLP | 287062.5 | 543 | 45056 | 5 | 5.5410e-02 | true |
| 256 | NonlinearSolve (LM) | 1.2125625e6 | 1707 | 706096 | 112 | 5.5410e-02 | true |
| 256 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 256 | CaNNOLeS | 186750.0 | 213 | 246160 | 5 | 5.5410e-02 | true |
| 512 | SecondOrderOptimization (Dogleg) | 69146.0 | 29 | 1552 | 5 | 1.0665e-01 | true |
| 512 | SecondOrderOptimization (LM) | 61959.0 | 26 | 1616 | 5 | 1.0665e-01 | true |
| 512 | LeastSquaresOptim (Dogleg) | 68292.0 | 119 | 280304 | 5 | 1.0665e-01 | true |
| 512 | LeastSquaresOptim (LM) | 92645.5 | 151 | 385056 | 7 | 1.0665e-01 | true |
| 512 | Optim (NewtonTrustRegion) | 60250.0 | 225 | 15120 | 5 | 1.0665e-01 | true |
| 512 | Optim (Newton) | 71270.5 | 116 | 3840 | 6 | 1.0665e-01 | true |
| 512 | JSOSolvers (trunk) | 132041.5 | 67 | 27360 | 9 | 1.0665e-01 | true |
| 512 | JSOSolvers (tron) | 116146.0 | 131 | 34976 | 5 | 1.0665e-01 | true |
| 512 | Ipopt | 758104.0 | 275 | 11968 | 6 | 1.0665e-01 | true |
| 512 | MadNLP | 355208.5 | 543 | 45056 | 6 | 1.0665e-01 | true |
| 512 | NonlinearSolve (LM) | 2.0759795e6 | 1693 | 1314160 | 111 | 1.0665e-01 | true |
| 512 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 512 | CaNNOLeS | 420250.5 | 218 | 485344 | 6 | 1.0665e-01 | true |
| 1024 | SecondOrderOptimization (Dogleg) | 133396.0 | 29 | 1552 | 5 | 2.0673e-01 | true |
| 1024 | SecondOrderOptimization (LM) | 122563.0 | 26 | 1616 | 5 | 2.0673e-01 | true |
| 1024 | LeastSquaresOptim (Dogleg) | 129562.5 | 119 | 304880 | 5 | 2.0673e-01 | true |
| 1024 | LeastSquaresOptim (LM) | 171854.5 | 151 | 412704 | 7 | 2.0673e-01 | true |
| 1024 | Optim (NewtonTrustRegion) | 84083.5 | 197 | 13024 | 4 | 2.0673e-01 | true |
| 1024 | Optim (Newton) | 112000.0 | 103 | 3568 | 5 | 2.0673e-01 | true |
| 1024 | JSOSolvers (trunk) | 3.55e6 | 334 | 70800 | 320 | 2.0673e-01 | false |
| 1024 | JSOSolvers (tron) | 255812.5 | 131 | 63648 | 6 | 2.0673e-01 | true |
| 1024 | Ipopt | 713708.0 | 245 | 10720 | 5 | 2.0673e-01 | true |
| 1024 | MadNLP | 375041.5 | 543 | 45056 | 5 | 2.0673e-01 | true |
| 1024 | NonlinearSolve (LM) | 4.22325e6 | 1707 | 2563120 | 112 | 2.0673e-01 | true |
| 1024 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1024 | CaNNOLeS | 805000.5 | 218 | 1045472 | 5 | 2.0673e-01 | true |
| 2048 | SecondOrderOptimization (Dogleg) | 279250.0 | 29 | 1552 | 5 | 4.1154e-01 | true |
| 2048 | SecondOrderOptimization (LM) | 255291.5 | 26 | 1616 | 5 | 4.1154e-01 | true |
| 2048 | LeastSquaresOptim (Dogleg) | 265542.0 | 119 | 354032 | 5 | 4.1154e-01 | true |
| 2048 | LeastSquaresOptim (LM) | 360437.5 | 151 | 476192 | 7 | 4.1154e-01 | true |
| 2048 | Optim (NewtonTrustRegion) | 202042.0 | 225 | 15120 | 5 | 4.1154e-01 | true |
| 2048 | Optim (Newton) | 274375.5 | 116 | 3840 | 6 | 4.1154e-01 | true |
| 2048 | JSOSolvers (trunk) | 302687.5 | 67 | 101088 | 5 | 4.1154e-01 | true |
| 2048 | JSOSolvers (tron) | 2.519583e6 | 303 | 134128 | 24 | 4.1154e-01 | false |
| 2048 | Ipopt | 946166.5 | 275 | 11968 | 6 | 4.1154e-01 | true |
| 2048 | MadNLP | 497771.0 | 543 | 45056 | 5 | 4.1154e-01 | true |
| 2048 | NonlinearSolve (LM) | 8.147438e6 | 1707 | 5063728 | 112 | 4.1154e-01 | true |
| 2048 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2048 | CaNNOLeS | 1.6417085e6 | 218 | 1919968 | 6 | 4.1154e-01 | true |
| 4096 | SecondOrderOptimization (Dogleg) | 554396.0 | 29 | 1552 | 5 | 8.3061e-01 | true |
| 4096 | SecondOrderOptimization (LM) | 485667.0 | 26 | 1616 | 5 | 8.3061e-01 | true |
| 4096 | LeastSquaresOptim (Dogleg) | 509187.5 | 119 | 452336 | 5 | 8.3061e-01 | true |
| 4096 | LeastSquaresOptim (LM) | 689292.0 | 151 | 586784 | 7 | 8.3061e-01 | true |
| 4096 | Optim (NewtonTrustRegion) | 367437.5 | 225 | 15120 | 5 | 8.3061e-01 | true |
| 4096 | Optim (Newton) | 434917.0 | 103 | 3568 | 5 | 8.3061e-01 | true |
| 4096 | JSOSolvers (trunk) | 1.5127166e7 | 334 | 218256 | 328 | 8.3061e-01 | false |
| 4096 | JSOSolvers (tron) | 5.459292e6 | 303 | 248816 | 28 | 8.3061e-01 | false |
| 4096 | Ipopt | 1.0904165e6 | 245 | 10720 | 5 | 8.3061e-01 | true |
| 4096 | MadNLP | 713021.0 | 543 | 45056 | 5 | 8.3061e-01 | true |
| 4096 | NonlinearSolve (LM) | 1.5165938e7 | 1707 | 11850800 | 112 | 8.3061e-01 | true |
| 4096 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 4096 | CaNNOLeS | 2.8072495e6 | 218 | 3775456 | 5 | 8.3061e-01 | true |
| 8192 | SecondOrderOptimization (Dogleg) | 1.069146e6 | 29 | 1552 | 5 | 1.6555e+00 | true |
| 8192 | SecondOrderOptimization (LM) | 926438.0 | 26 | 1616 | 5 | 1.6555e+00 | true |
| 8192 | LeastSquaresOptim (Dogleg) | 1.1143535e6 | 119 | 648944 | 5 | 1.6555e+00 | true |
| 8192 | LeastSquaresOptim (LM) | 1.4953335e6 | 151 | 783392 | 7 | 1.6555e+00 | true |
| 8192 | Optim (NewtonTrustRegion) | 602375.0 | 197 | 13024 | 4 | 1.6555e+00 | true |
| 8192 | Optim (Newton) | 1.032354e6 | 116 | 3840 | 6 | 1.6555e+00 | true |
| 8192 | JSOSolvers (trunk) | 2.9789958e7 | 334 | 414864 | 329 | 1.6555e+00 | false |
| 8192 | JSOSolvers (tron) | 2.382334e6 | 131 | 465056 | 7 | 1.6555e+00 | true |
| 8192 | Ipopt | 1.736542e6 | 275 | 11968 | 6 | 1.6555e+00 | true |
| 8192 | MadNLP | 1.164417e6 | 543 | 45056 | 5 | 1.6555e+00 | true |
| 8192 | NonlinearSolve (LM) | 2.9408833e7 | 1707 | 19846192 | 112 | 1.6555e+00 | true |
| 8192 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | CaNNOLeS | 6.317896e6 | 218 | 7019488 | 6 | 1.6555e+00 | true |
| 16384 | SecondOrderOptimization (Dogleg) | 962416.5 | 69 | 6368 | 5 | 3.3011e+00 | true |
| 16384 | SecondOrderOptimization (LM) | 748000.0 | 66 | 6432 | 5 | 3.3011e+00 | true |
| 16384 | LeastSquaresOptim (Dogleg) | 2.247604e6 | 119 | 1042160 | 5 | 3.3011e+00 | true |
| 16384 | LeastSquaresOptim (LM) | 2.947396e6 | 151 | 1176608 | 7 | 3.3011e+00 | true |
| 16384 | Optim (NewtonTrustRegion) | 1.171771e6 | 197 | 13024 | 4 | 3.3011e+00 | true |
| 16384 | Optim (Newton) | 2.260917e6 | 136 | 4224 | 6 | 3.3011e+00 | true |
| 16384 | JSOSolvers (trunk) | 5.7705041e7 | 334 | 808080 | 321 | 3.3011e+00 | false |
| 16384 | JSOSolvers (tron) | 1.9174958e7 | 303 | 936944 | 21 | 3.3011e+00 | false |
| 16384 | Ipopt | 2.746291e6 | 275 | 11968 | 6 | 3.3011e+00 | true |
| 16384 | MadNLP | 2.0241035e6 | 543 | 45056 | 5 | 3.3011e+00 | true |
| 16384 | NonlinearSolve (LM) | 5.9080458e7 | 1707 | 35836976 | 112 | 3.3011e+00 | true |
| 16384 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | CaNNOLeS | 1.2714104e7 | 218 | 13523936 | 6 | 3.3011e+00 | true |
| 32768 | SecondOrderOptimization (Dogleg) | 2.1958545e6 | 69 | 6368 | 5 | 6.5496e+00 | true |
| 32768 | SecondOrderOptimization (LM) | 1.526271e6 | 66 | 6432 | 5 | 6.5496e+00 | true |
| 32768 | LeastSquaresOptim (Dogleg) | 4.6182295e6 | 119 | 1828592 | 5 | 6.5496e+00 | true |
| 32768 | LeastSquaresOptim (LM) | 5.9412705e6 | 151 | 1963040 | 7 | 6.5496e+00 | true |
| 32768 | Optim (NewtonTrustRegion) | 2.332792e6 | 197 | 13024 | 4 | 6.5496e+00 | true |
| 32768 | Optim (Newton) | 4.0965835e6 | 116 | 3840 | 6 | 6.5496e+00 | true |
| 32768 | JSOSolvers (trunk) | 1.19678083e8 | 334 | 1594512 | 323 | 6.5496e+00 | false |
| 32768 | JSOSolvers (tron) | 4.1340084e7 | 303 | 1854448 | 24 | 6.5496e+00 | false |
| 32768 | Ipopt | 4.887417e6 | 275 | 11968 | 6 | 6.5496e+00 | true |
| 32768 | MadNLP | 3.8325625e6 | 543 | 45056 | 5 | 6.5496e+00 | true |
| 32768 | NonlinearSolve (LM) | 1.18051833e8 | 1707 | 67818544 | 112 | 6.5496e+00 | true |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | CaNNOLeS | 2.64928955e7 | 218 | 27253728 | 6 | 6.5496e+00 | true |
| 65536 | SecondOrderOptimization (Dogleg) | 4.498979e6 | 69 | 6368 | 5 | 1.3174e+01 | true |
| 65536 | SecondOrderOptimization (LM) | 3.138625e6 | 66 | 6432 | 5 | 1.3174e+01 | true |
| 65536 | LeastSquaresOptim (Dogleg) | 9.2353745e6 | 119 | 3401456 | 5 | 1.3174e+01 | true |
| 65536 | LeastSquaresOptim (LM) | 1.21328955e7 | 151 | 3535904 | 7 | 1.3174e+01 | true |
| 65536 | Optim (NewtonTrustRegion) | 4.6704795e6 | 197 | 13024 | 4 | 1.3174e+01 | true |
| 65536 | Optim (Newton) | 8.104833e6 | 116 | 3840 | 6 | 1.3174e+01 | true |
| 65536 | JSOSolvers (trunk) | 2.33391959e8 | 334 | 3167376 | 321 | 1.3174e+01 | false |
| 65536 | JSOSolvers (tron) | 7.0354334e7 | 303 | 3689456 | 20 | 1.3174e+01 | false |
| 65536 | Ipopt | 8.9618125e6 | 275 | 11968 | 6 | 1.3174e+01 | true |
| 65536 | MadNLP | 7.3785625e6 | 543 | 45056 | 5 | 1.3174e+01 | true |
| 65536 | NonlinearSolve (LM) | 2.493947505e8 | 1707 | 131781680 | 112 | 1.3174e+01 | true |
| 65536 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 65536 | CaNNOLeS | 5.65362295e7 | 218 | 54828000 | 6 | 1.3174e+01 | true |
