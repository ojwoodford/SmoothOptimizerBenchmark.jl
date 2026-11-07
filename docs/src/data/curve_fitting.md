# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T21:06:10
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b448285

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | NLLSModel (Static) | 270.56 | 0 | 0 | 1461.8333333333333 | 0 | 0 |
| 64 | Standalone | 287.5633802816901 | 0 | 0 | 892.0454545454545 | 0 | 0 |
| 128 | NLLSModel (Static) | 547.2972972972973 | 0 | 0 | 2923.6666666666665 | 0 | 0 |
| 128 | Standalone | 552.3714285714286 | 0 | 0 | 1750.0 | 0 | 0 |
| 256 | NLLSModel (Static) | 1083.3157894736842 | 0 | 0 | 6468.75 | 0 | 0 |
| 256 | Standalone | 1046.3333333333333 | 0 | 0 | 3389.0 | 0 | 0 |
| 512 | NLLSModel (Static) | 2158.3 | 0 | 0 | 11084.0 | 0 | 0 |
| 512 | Standalone | 2187.5 | 0 | 0 | 6819.333333333333 | 0 | 0 |
| 1024 | NLLSModel (Static) | 4441.6 | 0 | 0 | 23459.0 | 0 | 0 |
| 1024 | Standalone | 4408.2 | 0 | 0 | 13750.0 | 0 | 0 |
| 2048 | NLLSModel (Static) | 8875.0 | 0 | 0 | 43708.0 | 0 | 0 |
| 2048 | Standalone | 8736.0 | 0 | 0 | 26750.0 | 0 | 0 |
| 4096 | NLLSModel (Static) | 17750.0 | 0 | 0 | 87417.0 | 0 | 0 |
| 4096 | Standalone | 17417.0 | 0 | 0 | 54459.0 | 0 | 0 |
| 8192 | NLLSModel (Static) | 35792.0 | 0 | 0 | 175042.0 | 0 | 0 |
| 8192 | Standalone | 34916.0 | 0 | 0 | 109583.0 | 0 | 0 |
| 16384 | NLLSModel (Static) | 66667.0 | 0 | 0 | 205541.0 | 3 | 544 |
| 16384 | Standalone | 70542.0 | 0 | 0 | 235292.0 | 0 | 0 |
| 32768 | NLLSModel (Static) | 143041.0 | 0 | 0 | 266000.0 | 3 | 544 |
| 32768 | Standalone | 142416.0 | 0 | 0 | 470166.0 | 0 | 0 |
| 65536 | NLLSModel (Static) | 283458.0 | 0 | 0 | 432834.0 | 3 | 544 |
| 65536 | Standalone | 279250.0 | 0 | 0 | 955166.0 | 0 | 0 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 12167.0 | 23 | 1392 | 6 | 1.3405e-02 | true |
| 64 | SecondOrderOptimization (LM) | 9750.0 | 23 | 1472 | 5 | 1.3405e-02 | true |
| 64 | LeastSquaresOptim (Dogleg) | 15312.5 | 115 | 258864 | 5 | 1.3405e-02 | true |
| 64 | LeastSquaresOptim (LM) | 19833.5 | 147 | 360576 | 7 | 1.3405e-02 | true |
| 64 | Optim (NewtonTrustRegion) | 25125.0 | 225 | 15120 | 5 | 1.3405e-02 | true |
| 64 | Optim (Newton) | 19604.5 | 116 | 3840 | 6 | 1.3405e-02 | true |
| 64 | JSOSolvers (trunk) | 20813.0 | 59 | 5824 | 6 | 1.3405e-02 | true |
| 64 | JSOSolvers (tron) | 32937.5 | 124 | 9888 | 7 | 1.3405e-02 | true |
| 64 | Ipopt | 654104.0 | 275 | 11968 | 6 | 1.3405e-02 | true |
| 64 | MadNLP | 286396.5 | 543 | 45056 | 6 | 1.3405e-02 | true |
| 64 | NonlinearSolve (LM) | 510021.0 | 1471 | 219536 | 112 | 1.3405e-02 | true |
| 64 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 64 | CaNNOLeS | 64645.5 | 176 | 65008 | 6 | 1.3405e-02 | true |
| 128 | SecondOrderOptimization (Dogleg) | 23708.5 | 23 | 1392 | 6 | 2.5926e-02 | true |
| 128 | SecondOrderOptimization (LM) | 17292.0 | 23 | 1472 | 5 | 2.5926e-02 | true |
| 128 | LeastSquaresOptim (Dogleg) | 22833.0 | 116 | 261968 | 5 | 2.5926e-02 | true |
| 128 | LeastSquaresOptim (LM) | 30958.0 | 148 | 364160 | 7 | 2.5926e-02 | true |
| 128 | Optim (NewtonTrustRegion) | 26750.0 | 197 | 13024 | 4 | 2.5926e-02 | true |
| 128 | Optim (Newton) | 24208.0 | 103 | 3568 | 5 | 2.5926e-02 | true |
| 128 | JSOSolvers (trunk) | 35854.5 | 59 | 9088 | 7 | 2.5926e-02 | true |
| 128 | JSOSolvers (tron) | 53312.5 | 124 | 13696 | 7 | 2.5926e-02 | true |
| 128 | Ipopt | 592125.0 | 245 | 10720 | 5 | 2.5926e-02 | true |
| 128 | MadNLP | 283000.0 | 543 | 45056 | 5 | 2.5926e-02 | true |
| 128 | NonlinearSolve (LM) | 704750.0 | 1475 | 345904 | 112 | 2.5926e-02 | true |
| 128 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 128 | CaNNOLeS | 98854.0 | 185 | 122864 | 5 | 2.5926e-02 | true |
| 256 | SecondOrderOptimization (Dogleg) | 44375.0 | 23 | 1392 | 6 | 5.5410e-02 | true |
| 256 | SecondOrderOptimization (LM) | 32334.0 | 23 | 1472 | 5 | 5.5410e-02 | true |
| 256 | LeastSquaresOptim (Dogleg) | 39520.5 | 119 | 268016 | 5 | 5.5410e-02 | true |
| 256 | LeastSquaresOptim (LM) | 60375.0 | 169 | 422160 | 8 | 5.5410e-02 | true |
| 256 | Optim (NewtonTrustRegion) | 34687.5 | 197 | 13024 | 4 | 5.5410e-02 | true |
| 256 | Optim (Newton) | 35791.5 | 103 | 3568 | 5 | 5.5410e-02 | true |
| 256 | JSOSolvers (trunk) | 58916.5 | 65 | 15040 | 7 | 5.5410e-02 | true |
| 256 | JSOSolvers (tron) | 79770.5 | 131 | 20640 | 6 | 5.5410e-02 | true |
| 256 | Ipopt | 562958.5 | 245 | 10720 | 5 | 5.5410e-02 | true |
| 256 | MadNLP | 294625.0 | 543 | 45056 | 5 | 5.5410e-02 | true |
| 256 | NonlinearSolve (LM) | 1.1806875e6 | 1707 | 706096 | 112 | 5.5410e-02 | true |
| 256 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 256 | CaNNOLeS | 193646.0 | 213 | 246160 | 5 | 5.5410e-02 | true |
| 512 | SecondOrderOptimization (Dogleg) | 91583.0 | 23 | 1392 | 6 | 1.0665e-01 | true |
| 512 | SecondOrderOptimization (LM) | 62541.5 | 23 | 1472 | 5 | 1.0665e-01 | true |
| 512 | LeastSquaresOptim (Dogleg) | 70958.0 | 119 | 280304 | 5 | 1.0665e-01 | true |
| 512 | LeastSquaresOptim (LM) | 96167.0 | 151 | 385056 | 7 | 1.0665e-01 | true |
| 512 | Optim (NewtonTrustRegion) | 63209.0 | 225 | 15120 | 5 | 1.0665e-01 | true |
| 512 | Optim (Newton) | 75000.0 | 116 | 3840 | 6 | 1.0665e-01 | true |
| 512 | JSOSolvers (trunk) | 136354.0 | 67 | 27360 | 9 | 1.0665e-01 | true |
| 512 | JSOSolvers (tron) | 118750.0 | 131 | 34976 | 5 | 1.0665e-01 | true |
| 512 | Ipopt | 700000.0 | 275 | 11968 | 6 | 1.0665e-01 | true |
| 512 | MadNLP | 345667.0 | 543 | 45056 | 6 | 1.0665e-01 | true |
| 512 | NonlinearSolve (LM) | 2.0752505e6 | 1693 | 1314160 | 111 | 1.0665e-01 | true |
| 512 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 512 | CaNNOLeS | 418062.5 | 218 | 485344 | 6 | 1.0665e-01 | true |
| 1024 | SecondOrderOptimization (Dogleg) | 168417.0 | 23 | 1392 | 6 | 2.0673e-01 | true |
| 1024 | SecondOrderOptimization (LM) | 119583.5 | 23 | 1472 | 5 | 2.0673e-01 | true |
| 1024 | LeastSquaresOptim (Dogleg) | 128479.0 | 119 | 304880 | 5 | 2.0673e-01 | true |
| 1024 | LeastSquaresOptim (LM) | 175604.5 | 151 | 412704 | 7 | 2.0673e-01 | true |
| 1024 | Optim (NewtonTrustRegion) | 86292.0 | 197 | 13024 | 4 | 2.0673e-01 | true |
| 1024 | Optim (Newton) | 112500.0 | 103 | 3568 | 5 | 2.0673e-01 | true |
| 1024 | JSOSolvers (trunk) | 3.546333e6 | 334 | 70800 | 320 | 2.0673e-01 | false |
| 1024 | JSOSolvers (tron) | 249062.5 | 131 | 63648 | 6 | 2.0673e-01 | true |
| 1024 | Ipopt | 679666.5 | 245 | 10720 | 5 | 2.0673e-01 | true |
| 1024 | MadNLP | 371354.5 | 543 | 45056 | 5 | 2.0673e-01 | true |
| 1024 | NonlinearSolve (LM) | 3.9985415e6 | 1707 | 2563120 | 112 | 2.0673e-01 | true |
| 1024 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1024 | CaNNOLeS | 698937.5 | 218 | 1045472 | 5 | 2.0673e-01 | true |
| 2048 | SecondOrderOptimization (Dogleg) | 331291.0 | 23 | 1392 | 6 | 4.1154e-01 | true |
| 2048 | SecondOrderOptimization (LM) | 257979.0 | 23 | 1472 | 5 | 4.1154e-01 | true |
| 2048 | LeastSquaresOptim (Dogleg) | 260625.0 | 119 | 354032 | 5 | 4.1154e-01 | true |
| 2048 | LeastSquaresOptim (LM) | 345396.0 | 151 | 476192 | 7 | 4.1154e-01 | true |
| 2048 | Optim (NewtonTrustRegion) | 189562.5 | 225 | 15120 | 5 | 4.1154e-01 | true |
| 2048 | Optim (Newton) | 254062.5 | 116 | 3840 | 6 | 4.1154e-01 | true |
| 2048 | JSOSolvers (trunk) | 286312.5 | 67 | 101088 | 5 | 4.1154e-01 | true |
| 2048 | JSOSolvers (tron) | 2.666709e6 | 303 | 134128 | 24 | 4.1154e-01 | false |
| 2048 | Ipopt | 831625.0 | 275 | 11968 | 6 | 4.1154e-01 | true |
| 2048 | MadNLP | 472708.5 | 543 | 45056 | 5 | 4.1154e-01 | true |
| 2048 | NonlinearSolve (LM) | 7.8186665e6 | 1707 | 5063728 | 112 | 4.1154e-01 | true |
| 2048 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2048 | CaNNOLeS | 1.5539585e6 | 218 | 1919968 | 6 | 4.1154e-01 | true |
| 4096 | SecondOrderOptimization (Dogleg) | 637250.5 | 23 | 1392 | 6 | 8.3061e-01 | true |
| 4096 | SecondOrderOptimization (LM) | 465604.0 | 23 | 1472 | 5 | 8.3061e-01 | true |
| 4096 | LeastSquaresOptim (Dogleg) | 499854.0 | 119 | 452336 | 5 | 8.3061e-01 | true |
| 4096 | LeastSquaresOptim (LM) | 668645.5 | 151 | 586784 | 7 | 8.3061e-01 | true |
| 4096 | Optim (NewtonTrustRegion) | 355041.5 | 225 | 15120 | 5 | 8.3061e-01 | true |
| 4096 | Optim (Newton) | 427167.0 | 103 | 3568 | 5 | 8.3061e-01 | true |
| 4096 | JSOSolvers (trunk) | 1.4635792e7 | 334 | 218256 | 328 | 8.3061e-01 | false |
| 4096 | JSOSolvers (tron) | 5.487458e6 | 303 | 248816 | 28 | 8.3061e-01 | false |
| 4096 | Ipopt | 945500.5 | 245 | 10720 | 5 | 8.3061e-01 | true |
| 4096 | MadNLP | 676708.5 | 543 | 45056 | 5 | 8.3061e-01 | true |
| 4096 | NonlinearSolve (LM) | 1.5560459e7 | 1707 | 11850800 | 112 | 8.3061e-01 | true |
| 4096 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 4096 | CaNNOLeS | 2.7900625e6 | 218 | 3775456 | 5 | 8.3061e-01 | true |
| 8192 | SecondOrderOptimization (Dogleg) | 1.275146e6 | 23 | 1392 | 6 | 1.6555e+00 | true |
| 8192 | SecondOrderOptimization (LM) | 921062.5 | 23 | 1472 | 5 | 1.6555e+00 | true |
| 8192 | LeastSquaresOptim (Dogleg) | 1.0863335e6 | 119 | 648944 | 5 | 1.6555e+00 | true |
| 8192 | LeastSquaresOptim (LM) | 1.4166255e6 | 151 | 783392 | 7 | 1.6555e+00 | true |
| 8192 | Optim (NewtonTrustRegion) | 628729.0 | 197 | 13024 | 4 | 1.6555e+00 | true |
| 8192 | Optim (Newton) | 985250.0 | 116 | 3840 | 6 | 1.6555e+00 | true |
| 8192 | JSOSolvers (trunk) | 2.8742166e7 | 334 | 414864 | 329 | 1.6555e+00 | false |
| 8192 | JSOSolvers (tron) | 2.3129375e6 | 131 | 465056 | 7 | 1.6555e+00 | true |
| 8192 | Ipopt | 1.547e6 | 275 | 11968 | 6 | 1.6555e+00 | true |
| 8192 | MadNLP | 1.0983545e6 | 543 | 45056 | 5 | 1.6555e+00 | true |
| 8192 | NonlinearSolve (LM) | 2.9801125e7 | 1707 | 19846192 | 112 | 1.6555e+00 | true |
| 8192 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | CaNNOLeS | 6.5282915e6 | 218 | 7019488 | 6 | 1.6555e+00 | true |
| 16384 | SecondOrderOptimization (Dogleg) | 1.6034375e6 | 56 | 5872 | 6 | 3.3011e+00 | true |
| 16384 | SecondOrderOptimization (LM) | 808041.5 | 53 | 5408 | 5 | 3.3011e+00 | true |
| 16384 | LeastSquaresOptim (Dogleg) | 2.3034585e6 | 119 | 1042160 | 5 | 3.3011e+00 | true |
| 16384 | LeastSquaresOptim (LM) | 2.946729e6 | 151 | 1176608 | 7 | 3.3011e+00 | true |
| 16384 | Optim (NewtonTrustRegion) | 1.1422705e6 | 197 | 13024 | 4 | 3.3011e+00 | true |
| 16384 | Optim (Newton) | 2.3142915e6 | 136 | 4224 | 6 | 3.3011e+00 | true |
| 16384 | JSOSolvers (trunk) | 5.7580541e7 | 334 | 808080 | 321 | 3.3011e+00 | false |
| 16384 | JSOSolvers (tron) | 1.8892083e7 | 303 | 936944 | 21 | 3.3011e+00 | false |
| 16384 | Ipopt | 2.655708e6 | 275 | 11968 | 6 | 3.3011e+00 | true |
| 16384 | MadNLP | 2.0174795e6 | 543 | 45056 | 5 | 3.3011e+00 | true |
| 16384 | NonlinearSolve (LM) | 5.8920146e7 | 1707 | 35836976 | 112 | 3.3011e+00 | true |
| 16384 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | CaNNOLeS | 1.25824375e7 | 218 | 13523936 | 6 | 3.3011e+00 | true |
| 32768 | SecondOrderOptimization (Dogleg) | 2.5205205e6 | 56 | 5872 | 6 | 6.5496e+00 | true |
| 32768 | SecondOrderOptimization (LM) | 1.5567505e6 | 53 | 5408 | 5 | 6.5496e+00 | true |
| 32768 | LeastSquaresOptim (Dogleg) | 4.4925835e6 | 119 | 1828592 | 5 | 6.5496e+00 | true |
| 32768 | LeastSquaresOptim (LM) | 5.72225e6 | 151 | 1963040 | 7 | 6.5496e+00 | true |
| 32768 | Optim (NewtonTrustRegion) | 2.257896e6 | 197 | 13024 | 4 | 6.5496e+00 | true |
| 32768 | Optim (Newton) | 3.928792e6 | 116 | 3840 | 6 | 6.5496e+00 | true |
| 32768 | JSOSolvers (trunk) | 1.15975916e8 | 334 | 1594512 | 323 | 6.5496e+00 | false |
| 32768 | JSOSolvers (tron) | 4.013025e7 | 303 | 1854448 | 24 | 6.5496e+00 | false |
| 32768 | Ipopt | 4.562875e6 | 275 | 11968 | 6 | 6.5496e+00 | true |
| 32768 | MadNLP | 3.612917e6 | 543 | 45056 | 5 | 6.5496e+00 | true |
| 32768 | NonlinearSolve (LM) | 1.15644334e8 | 1707 | 67818544 | 112 | 6.5496e+00 | true |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | CaNNOLeS | 2.6269541e7 | 218 | 26532832 | 6 | 6.5496e+00 | true |
| 65536 | SecondOrderOptimization (Dogleg) | 4.583292e6 | 56 | 5872 | 6 | 1.3174e+01 | true |
| 65536 | SecondOrderOptimization (LM) | 2.539646e6 | 53 | 5408 | 5 | 1.3174e+01 | true |
| 65536 | LeastSquaresOptim (Dogleg) | 8.988313e6 | 119 | 3401456 | 5 | 1.3174e+01 | true |
| 65536 | LeastSquaresOptim (LM) | 1.1665167e7 | 151 | 3535904 | 7 | 1.3174e+01 | true |
| 65536 | Optim (NewtonTrustRegion) | 4.508708e6 | 197 | 13024 | 4 | 1.3174e+01 | true |
| 65536 | Optim (Newton) | 7.959667e6 | 116 | 3840 | 6 | 1.3174e+01 | true |
| 65536 | JSOSolvers (trunk) | 2.29984708e8 | 334 | 3167376 | 321 | 1.3174e+01 | false |
| 65536 | JSOSolvers (tron) | 6.9258166e7 | 303 | 3689456 | 20 | 1.3174e+01 | false |
| 65536 | Ipopt | 8.6154585e6 | 275 | 11968 | 6 | 1.3174e+01 | true |
| 65536 | MadNLP | 7.0521245e6 | 543 | 45056 | 5 | 1.3174e+01 | true |
| 65536 | NonlinearSolve (LM) | 2.29728979e8 | 1707 | 131781680 | 112 | 1.3174e+01 | true |
| 65536 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 65536 | CaNNOLeS | 5.3439521e7 | 218 | 60382176 | 6 | 1.3174e+01 | true |
