# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-13T01:15:56
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 520587c

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | NLLSModel (Static) | 319.43859649122805 | 1 | 16 | 1746.5 | 1 | 32 |
| 64 | Standalone | 323.7704918032787 | 1 | 16 | 960.2272727272727 | 1 | 32 |
| 128 | NLLSModel (Static) | 579.6470588235294 | 1 | 16 | 3327.285714285714 | 1 | 32 |
| 128 | Standalone | 570.6111111111111 | 1 | 16 | 1784.75 | 1 | 32 |
| 256 | NLLSModel (Static) | 1097.2222222222222 | 1 | 16 | 6520.75 | 1 | 32 |
| 256 | Standalone | 1074.578947368421 | 1 | 16 | 3423.6666666666665 | 1 | 32 |
| 512 | NLLSModel (Static) | 2150.0 | 1 | 16 | 12958.0 | 1 | 32 |
| 512 | Standalone | 2112.5 | 1 | 16 | 6889.0 | 1 | 32 |
| 1024 | NLLSModel (Static) | 4225.0 | 1 | 16 | 22125.0 | 1 | 32 |
| 1024 | Standalone | 4183.2 | 1 | 16 | 13541.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 8402.666666666666 | 1 | 16 | 43833.0 | 1 | 32 |
| 2048 | Standalone | 8222.333333333334 | 1 | 16 | 27625.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 18000.0 | 1 | 16 | 91208.0 | 1 | 32 |
| 4096 | Standalone | 16375.0 | 1 | 16 | 54500.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 35000.0 | 1 | 16 | 175291.0 | 1 | 32 |
| 8192 | Standalone | 35166.0 | 1 | 16 | 109625.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 66791.0 | 1 | 16 | 150458.0 | 4 | 576 |
| 16384 | Standalone | 67833.0 | 1 | 16 | 230834.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 141500.0 | 1 | 16 | 291083.0 | 4 | 576 |
| 32768 | Standalone | 133292.0 | 1 | 16 | 442208.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 269541.0 | 1 | 16 | 786500.0 | 4 | 576 |
| 65536 | Standalone | 265875.0 | 1 | 16 | 895750.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 9229.5 | 28 | 1744 | 5 | 1.3405e-02 | true |
| 64 | SecondOrderOptimization (LM) | 9229.5 | 26 | 1664 | 5 | 1.3405e-02 | true |
| 64 | LeastSquaresOptim (Dogleg) | 15125.0 | 115 | 258864 | 5 | 1.3405e-02 | true |
| 64 | LeastSquaresOptim (LM) | 19625.0 | 147 | 360576 | 7 | 1.3405e-02 | true |
| 64 | Optim (NewtonTrustRegion) | 23875.5 | 225 | 15120 | 5 | 1.3405e-02 | true |
| 64 | Optim (Newton) | 18812.0 | 116 | 3840 | 6 | 1.3405e-02 | true |
| 64 | JSOSolvers (trunk) | 19708.0 | 59 | 5824 | 6 | 1.3405e-02 | true |
| 64 | JSOSolvers (tron) | 32500.0 | 124 | 9888 | 7 | 1.3405e-02 | true |
| 64 | Ipopt | 655333.5 | 275 | 11968 | 6 | 1.3405e-02 | true |
| 64 | MadNLP | 281708.0 | 543 | 45056 | 6 | 1.3405e-02 | true |
| 64 | NonlinearSolve (LM) | 503562.5 | 1471 | 219632 | 112 | 1.3405e-02 | true |
| 64 | NonlinearSolve (TrustRegion) | 1.9436917e7 | 1588 | 4095696 | 16 | 1.3405e-02 | false |
| 64 | CaNNOLeS | 64542.0 | 176 | 65008 | 6 | 1.3405e-02 | true |
| 128 | SecondOrderOptimization (Dogleg) | 16875.0 | 28 | 1744 | 5 | 2.5926e-02 | true |
| 128 | SecondOrderOptimization (LM) | 16458.0 | 26 | 1664 | 5 | 2.5926e-02 | true |
| 128 | LeastSquaresOptim (Dogleg) | 23729.5 | 116 | 261968 | 5 | 2.5926e-02 | true |
| 128 | LeastSquaresOptim (LM) | 31062.5 | 148 | 364160 | 7 | 2.5926e-02 | true |
| 128 | Optim (NewtonTrustRegion) | 24479.0 | 197 | 13024 | 4 | 2.5926e-02 | true |
| 128 | Optim (Newton) | 22125.0 | 103 | 3568 | 5 | 2.5926e-02 | true |
| 128 | JSOSolvers (trunk) | 33666.5 | 59 | 9088 | 7 | 2.5926e-02 | true |
| 128 | JSOSolvers (tron) | 51333.5 | 124 | 13696 | 7 | 2.5926e-02 | true |
| 128 | Ipopt | 584625.0 | 245 | 10720 | 5 | 2.5926e-02 | true |
| 128 | MadNLP | 274209.0 | 543 | 45056 | 5 | 2.5926e-02 | true |
| 128 | NonlinearSolve (LM) | 721708.0 | 1475 | 346000 | 112 | 2.5926e-02 | true |
| 128 | NonlinearSolve (TrustRegion) | 176708.0 | 910 | 2267472 | 9 | 2.5926e-02 | false |
| 128 | CaNNOLeS | 97708.0 | 185 | 122864 | 5 | 2.5926e-02 | true |
| 256 | SecondOrderOptimization (Dogleg) | 30146.0 | 28 | 1744 | 5 | 5.5410e-02 | true |
| 256 | SecondOrderOptimization (LM) | 30625.0 | 26 | 1664 | 5 | 5.5410e-02 | true |
| 256 | LeastSquaresOptim (Dogleg) | 37250.0 | 119 | 268016 | 5 | 5.5410e-02 | true |
| 256 | LeastSquaresOptim (LM) | 57041.5 | 169 | 422160 | 8 | 5.5410e-02 | true |
| 256 | Optim (NewtonTrustRegion) | 32958.0 | 197 | 13024 | 4 | 5.5410e-02 | true |
| 256 | Optim (Newton) | 34917.0 | 103 | 3568 | 5 | 5.5410e-02 | true |
| 256 | JSOSolvers (trunk) | 56479.5 | 65 | 15040 | 7 | 5.5410e-02 | true |
| 256 | JSOSolvers (tron) | 74958.5 | 131 | 20640 | 6 | 5.5410e-02 | true |
| 256 | Ipopt | 604041.5 | 245 | 10720 | 5 | 5.5410e-02 | true |
| 256 | MadNLP | 281375.0 | 543 | 45056 | 5 | 5.5410e-02 | true |
| 256 | NonlinearSolve (LM) | 1.174208e6 | 1707 | 706192 | 112 | 5.5410e-02 | true |
| 256 | NonlinearSolve (TrustRegion) | 489000.0 | 1612 | 4214640 | 11 | 5.5410e-02 | false |
| 256 | CaNNOLeS | 178125.0 | 213 | 246160 | 5 | 5.5410e-02 | true |
| 512 | SecondOrderOptimization (Dogleg) | 59041.5 | 28 | 1744 | 5 | 1.0665e-01 | true |
| 512 | SecondOrderOptimization (LM) | 59562.5 | 26 | 1664 | 5 | 1.0665e-01 | true |
| 512 | LeastSquaresOptim (Dogleg) | 68000.0 | 119 | 280304 | 5 | 1.0665e-01 | true |
| 512 | LeastSquaresOptim (LM) | 90021.0 | 151 | 385056 | 7 | 1.0665e-01 | true |
| 512 | Optim (NewtonTrustRegion) | 59292.0 | 225 | 15120 | 5 | 1.0665e-01 | true |
| 512 | Optim (Newton) | 70229.0 | 116 | 3840 | 6 | 1.0665e-01 | true |
| 512 | JSOSolvers (trunk) | 125541.5 | 67 | 27360 | 9 | 1.0665e-01 | true |
| 512 | JSOSolvers (tron) | 109895.5 | 131 | 34976 | 5 | 1.0665e-01 | true |
| 512 | Ipopt | 712083.0 | 275 | 11968 | 6 | 1.0665e-01 | true |
| 512 | MadNLP | 337541.5 | 543 | 45056 | 6 | 1.0665e-01 | true |
| 512 | NonlinearSolve (LM) | 2.0792505e6 | 1693 | 1314256 | 111 | 1.0665e-01 | true |
| 512 | NonlinearSolve (TrustRegion) | 3.066375e6 | 3174 | 9590432 | 59 | 1.0665e-01 | false |
| 512 | CaNNOLeS | 401396.0 | 218 | 485344 | 6 | 1.0665e-01 | true |
| 1024 | SecondOrderOptimization (Dogleg) | 116437.5 | 28 | 1744 | 5 | 2.0673e-01 | true |
| 1024 | SecondOrderOptimization (LM) | 116125.0 | 26 | 1664 | 5 | 2.0673e-01 | true |
| 1024 | LeastSquaresOptim (Dogleg) | 129833.5 | 119 | 304880 | 5 | 2.0673e-01 | true |
| 1024 | LeastSquaresOptim (LM) | 171083.5 | 151 | 412704 | 7 | 2.0673e-01 | true |
| 1024 | Optim (NewtonTrustRegion) | 84167.0 | 197 | 13024 | 4 | 2.0673e-01 | true |
| 1024 | Optim (Newton) | 110521.0 | 103 | 3568 | 5 | 2.0673e-01 | true |
| 1024 | JSOSolvers (trunk) | 3.365917e6 | 334 | 70800 | 320 | 2.0673e-01 | false |
| 1024 | JSOSolvers (tron) | 244708.0 | 131 | 63648 | 6 | 2.0673e-01 | true |
| 1024 | Ipopt | 680042.0 | 245 | 10720 | 5 | 2.0673e-01 | true |
| 1024 | MadNLP | 362083.5 | 543 | 45056 | 5 | 2.0673e-01 | true |
| 1024 | NonlinearSolve (LM) | 3.868479e6 | 1707 | 2563216 | 112 | 2.0673e-01 | true |
| 1024 | NonlinearSolve (TrustRegion) | 2.441708e6 | 1568 | 5816528 | 8 | 2.0673e-01 | false |
| 1024 | CaNNOLeS | 667521.0 | 218 | 1045472 | 5 | 2.0673e-01 | true |
| 2048 | SecondOrderOptimization (Dogleg) | 230937.5 | 28 | 1744 | 5 | 4.1154e-01 | true |
| 2048 | SecondOrderOptimization (LM) | 229187.5 | 26 | 1664 | 5 | 4.1154e-01 | true |
| 2048 | LeastSquaresOptim (Dogleg) | 248125.0 | 119 | 354032 | 5 | 4.1154e-01 | true |
| 2048 | LeastSquaresOptim (LM) | 335583.5 | 151 | 476192 | 7 | 4.1154e-01 | true |
| 2048 | Optim (NewtonTrustRegion) | 182833.5 | 225 | 15120 | 5 | 4.1154e-01 | true |
| 2048 | Optim (Newton) | 250625.0 | 116 | 3840 | 6 | 4.1154e-01 | true |
| 2048 | JSOSolvers (trunk) | 278813.0 | 67 | 101088 | 5 | 4.1154e-01 | true |
| 2048 | JSOSolvers (tron) | 2.402958e6 | 303 | 134128 | 24 | 4.1154e-01 | false |
| 2048 | Ipopt | 879125.0 | 275 | 11968 | 6 | 4.1154e-01 | true |
| 2048 | MadNLP | 466062.5 | 543 | 45056 | 5 | 4.1154e-01 | true |
| 2048 | NonlinearSolve (LM) | 7.758396e6 | 1707 | 5063824 | 112 | 4.1154e-01 | true |
| 2048 | NonlinearSolve (TrustRegion) | 2.653625e6 | 1612 | 8343408 | 11 | 4.1154e-01 | false |
| 2048 | CaNNOLeS | 1.5402495e6 | 218 | 1919968 | 6 | 4.1154e-01 | true |
| 4096 | SecondOrderOptimization (Dogleg) | 455583.5 | 28 | 1744 | 5 | 8.3061e-01 | true |
| 4096 | SecondOrderOptimization (LM) | 457042.0 | 26 | 1664 | 5 | 8.3061e-01 | true |
| 4096 | LeastSquaresOptim (Dogleg) | 492145.5 | 119 | 452336 | 5 | 8.3061e-01 | true |
| 4096 | LeastSquaresOptim (LM) | 663500.5 | 151 | 586784 | 7 | 8.3061e-01 | true |
| 4096 | Optim (NewtonTrustRegion) | 349562.5 | 225 | 15120 | 5 | 8.3061e-01 | true |
| 4096 | Optim (Newton) | 420437.5 | 103 | 3568 | 5 | 8.3061e-01 | true |
| 4096 | JSOSolvers (trunk) | 1.4230166e7 | 334 | 218256 | 328 | 8.3061e-01 | false |
| 4096 | JSOSolvers (tron) | 5.272292e6 | 303 | 248816 | 28 | 8.3061e-01 | false |
| 4096 | Ipopt | 986145.5 | 245 | 10720 | 5 | 8.3061e-01 | true |
| 4096 | MadNLP | 666625.0 | 543 | 45056 | 5 | 8.3061e-01 | true |
| 4096 | NonlinearSolve (LM) | 1.45582085e7 | 1707 | 11850896 | 112 | 8.3061e-01 | true |
| 4096 | NonlinearSolve (TrustRegion) | 3.749959e6 | 886 | 7052832 | 6 | 8.3061e-01 | false |
| 4096 | CaNNOLeS | 2.670417e6 | 218 | 3775456 | 5 | 8.3061e-01 | true |
| 8192 | SecondOrderOptimization (Dogleg) | 909104.5 | 28 | 1744 | 5 | 1.6555e+00 | true |
| 8192 | SecondOrderOptimization (LM) | 929395.5 | 26 | 1664 | 5 | 1.6555e+00 | true |
| 8192 | LeastSquaresOptim (Dogleg) | 1.0637705e6 | 119 | 648944 | 5 | 1.6555e+00 | true |
| 8192 | LeastSquaresOptim (LM) | 1.405333e6 | 151 | 783392 | 7 | 1.6555e+00 | true |
| 8192 | Optim (NewtonTrustRegion) | 570083.5 | 197 | 13024 | 4 | 1.6555e+00 | true |
| 8192 | Optim (Newton) | 979708.0 | 116 | 3840 | 6 | 1.6555e+00 | true |
| 8192 | JSOSolvers (trunk) | 2.8299e7 | 334 | 414864 | 329 | 1.6555e+00 | false |
| 8192 | JSOSolvers (tron) | 2.3195415e6 | 131 | 465056 | 7 | 1.6555e+00 | true |
| 8192 | Ipopt | 1.6249165e6 | 275 | 11968 | 6 | 1.6555e+00 | true |
| 8192 | MadNLP | 1.0953125e6 | 543 | 45056 | 5 | 1.6555e+00 | true |
| 8192 | NonlinearSolve (LM) | 2.8797333e7 | 1707 | 19846288 | 112 | 1.6555e+00 | true |
| 8192 | NonlinearSolve (TrustRegion) | 7.779167e6 | 974 | 13417312 | 8 | 1.6555e+00 | false |
| 8192 | CaNNOLeS | 6.225625e6 | 218 | 7019488 | 6 | 1.6555e+00 | true |
| 16384 | SecondOrderOptimization (Dogleg) | 595416.5 | 76 | 6672 | 5 | 3.3011e+00 | true |
| 16384 | SecondOrderOptimization (LM) | 628958.5 | 74 | 6592 | 5 | 3.3011e+00 | true |
| 16384 | LeastSquaresOptim (Dogleg) | 2.232354e6 | 119 | 1042160 | 5 | 3.3011e+00 | true |
| 16384 | LeastSquaresOptim (LM) | 2.8473125e6 | 151 | 1176608 | 7 | 3.3011e+00 | true |
| 16384 | Optim (NewtonTrustRegion) | 1.1305415e6 | 197 | 13024 | 4 | 3.3011e+00 | true |
| 16384 | Optim (Newton) | 2.2297085e6 | 136 | 4224 | 6 | 3.3011e+00 | true |
| 16384 | JSOSolvers (trunk) | 5.7190083e7 | 334 | 808080 | 321 | 3.3011e+00 | false |
| 16384 | JSOSolvers (tron) | 1.8581e7 | 303 | 936944 | 21 | 3.3011e+00 | false |
| 16384 | Ipopt | 2.607771e6 | 275 | 11968 | 6 | 3.3011e+00 | true |
| 16384 | MadNLP | 1.923958e6 | 543 | 45056 | 5 | 3.3011e+00 | true |
| 16384 | NonlinearSolve (LM) | 5.86814375e7 | 1707 | 35837072 | 112 | 3.3011e+00 | true |
| 16384 | NonlinearSolve (TrustRegion) | 1.5195166e7 | 930 | 23538880 | 8 | 3.3011e+00 | false |
| 16384 | CaNNOLeS | 1.248575e7 | 218 | 13523936 | 6 | 3.3011e+00 | true |
| 32768 | SecondOrderOptimization (Dogleg) | 1.14125e6 | 76 | 6672 | 5 | 6.5496e+00 | true |
| 32768 | SecondOrderOptimization (LM) | 1.190229e6 | 74 | 6592 | 5 | 6.5496e+00 | true |
| 32768 | LeastSquaresOptim (Dogleg) | 4.5385625e6 | 119 | 1828592 | 5 | 6.5496e+00 | true |
| 32768 | LeastSquaresOptim (LM) | 5.7350415e6 | 151 | 1963040 | 7 | 6.5496e+00 | true |
| 32768 | Optim (NewtonTrustRegion) | 2.251625e6 | 197 | 13024 | 4 | 6.5496e+00 | true |
| 32768 | Optim (Newton) | 3.92275e6 | 116 | 3840 | 6 | 6.5496e+00 | true |
| 32768 | JSOSolvers (trunk) | 1.14834875e8 | 334 | 1594512 | 323 | 6.5496e+00 | false |
| 32768 | JSOSolvers (tron) | 3.9691959e7 | 303 | 1854448 | 24 | 6.5496e+00 | false |
| 32768 | Ipopt | 4.5898125e6 | 275 | 11968 | 6 | 6.5496e+00 | true |
| 32768 | MadNLP | 3.6326665e6 | 543 | 45056 | 5 | 6.5496e+00 | true |
| 32768 | NonlinearSolve (LM) | 1.14670708e8 | 1707 | 67818640 | 112 | 6.5496e+00 | true |
| 32768 | NonlinearSolve (TrustRegion) | 4.9149542e7 | 1568 | 76923088 | 8 | 6.5496e+00 | false |
| 32768 | CaNNOLeS | 2.5505646e7 | 218 | 26532832 | 6 | 6.5496e+00 | true |
| 65536 | SecondOrderOptimization (Dogleg) | 2.17475e6 | 76 | 6672 | 5 | 1.3174e+01 | true |
| 65536 | SecondOrderOptimization (LM) | 2.206917e6 | 74 | 6592 | 5 | 1.3174e+01 | true |
| 65536 | LeastSquaresOptim (Dogleg) | 9.0795205e6 | 119 | 3401456 | 5 | 1.3174e+01 | true |
| 65536 | LeastSquaresOptim (LM) | 1.15246875e7 | 151 | 3535904 | 7 | 1.3174e+01 | true |
| 65536 | Optim (NewtonTrustRegion) | 4.561375e6 | 197 | 13024 | 4 | 1.3174e+01 | true |
| 65536 | Optim (Newton) | 7.831833e6 | 116 | 3840 | 6 | 1.3174e+01 | true |
| 65536 | JSOSolvers (trunk) | 2.26685084e8 | 334 | 3167376 | 321 | 1.3174e+01 | false |
| 65536 | JSOSolvers (tron) | 6.8611209e7 | 303 | 3689456 | 20 | 1.3174e+01 | false |
| 65536 | Ipopt | 8.5175835e6 | 275 | 11968 | 6 | 1.3174e+01 | true |
| 65536 | MadNLP | 6.9737085e6 | 543 | 45056 | 5 | 1.3174e+01 | true |
| 65536 | NonlinearSolve (LM) | 2.32592875e8 | 1707 | 131781776 | 112 | 1.3174e+01 | true |
| 65536 | NonlinearSolve (TrustRegion) | 1.72475666e8 | 1568 | 150323408 | 11 | 1.3174e+01 | false |
| 65536 | CaNNOLeS | 5.16635e7 | 218 | 52534240 | 6 | 1.3174e+01 | true |
