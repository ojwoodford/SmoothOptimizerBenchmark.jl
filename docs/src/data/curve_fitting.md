# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T09:01:35
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b62fcb5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | NLLSModel (Static) | 288.85135135135135 | 0 | 0 | 1426.2307692307693 | 0 | 0 |
| 64 | Standalone | 288.1 | 0 | 0 | 898.5652173913044 | 0 | 0 |
| 128 | NLLSModel (Static) | 589.1388888888889 | 0 | 0 | 3023.8571428571427 | 0 | 0 |
| 128 | Standalone | 566.6571428571428 | 0 | 0 | 1708.3333333333333 | 0 | 0 |
| 256 | NLLSModel (Static) | 1083.3333333333333 | 0 | 0 | 5645.75 | 0 | 0 |
| 256 | Standalone | 1071.7222222222222 | 0 | 0 | 3388.8333333333335 | 0 | 0 |
| 512 | NLLSModel (Static) | 2095.8 | 0 | 0 | 11208.0 | 0 | 0 |
| 512 | Standalone | 2062.5 | 0 | 0 | 6625.0 | 0 | 0 |
| 1024 | NLLSModel (Static) | 4175.0 | 0 | 0 | 21958.0 | 0 | 0 |
| 1024 | Standalone | 4366.8 | 0 | 0 | 14125.0 | 0 | 0 |
| 2048 | NLLSModel (Static) | 8896.0 | 0 | 0 | 46625.0 | 0 | 0 |
| 2048 | Standalone | 8708.333333333334 | 0 | 0 | 28500.0 | 0 | 0 |
| 4096 | NLLSModel (Static) | 16750.0 | 0 | 0 | 87833.0 | 0 | 0 |
| 4096 | Standalone | 17792.0 | 0 | 0 | 57917.0 | 0 | 0 |
| 8192 | NLLSModel (Static) | 36125.0 | 0 | 0 | 176209.0 | 0 | 0 |
| 8192 | Standalone | 35042.0 | 0 | 0 | 116792.0 | 0 | 0 |
| 16384 | NLLSModel (Static) | 70875.0 | 0 | 0 | 104000.0 | 3 | 544 |
| 16384 | Standalone | 69500.0 | 0 | 0 | 233083.0 | 0 | 0 |
| 32768 | NLLSModel (Static) | 141791.0 | 0 | 0 | 340250.0 | 3 | 544 |
| 32768 | Standalone | 142416.0 | 0 | 0 | 491875.0 | 0 | 0 |
| 65536 | NLLSModel (Static) | 283458.0 | 0 | 0 | 609917.0 | 3 | 544 |
| 65536 | Standalone | 281375.0 | 0 | 0 | 941958.0 | 0 | 0 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on standard target model: `Standalone` (`NLLSModel + SecondOrderOptimization` entries run natively on `NLLSModel` with pre-allocated `OptimizationWorkspace`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 64 | NLLSModel + SecondOrderOptimization (Dogleg) | 11333.5 | 0 | 0 | 6 | 1.3405e-02 | true |
| 64 | NLLSModel + SecondOrderOptimization (LM) | 8334.0 | 0 | 0 | 5 | 1.3405e-02 | true |
| 64 | SecondOrderOptimization (Dogleg) | 10666.0 | 32 | 4272 | 6 | 1.3405e-02 | true |
| 64 | SecondOrderOptimization (LM) | 8167.0 | 32 | 4368 | 5 | 1.3405e-02 | true |
| 64 | LeastSquaresOptim (Dogleg) | 14625.0 | 113 | 258640 | 5 | 1.3405e-02 | true |
| 64 | LeastSquaresOptim (LM) | 19374.5 | 145 | 360352 | 7 | 1.3405e-02 | true |
| 64 | Optim (NewtonTrustRegion) | 22875.0 | 181 | 14064 | 5 | 1.3405e-02 | true |
| 64 | Optim (Newton) | 16083.5 | 60 | 2528 | 6 | 1.3405e-02 | true |
| 64 | JSOSolvers (trunk) | 16834.0 | 50 | 2432 | 6 | 1.3405e-02 | true |
| 64 | JSOSolvers (tron) | 30750.0 | 124 | 6432 | 6 | 1.3405e-02 | true |
| 64 | Ipopt | 620479.5 | 275 | 11968 | 6 | 1.3405e-02 | true |
| 64 | MadNLP | 285458.0 | 543 | 45056 | 6 | 1.3405e-02 | true |
| 64 | NonlinearSolve (LM) | 503583.0 | 1471 | 219536 | 112 | 1.3405e-02 | true |
| 64 | NonlinearSolve (TrustRegion) | 100313.0 | 349 | 50096 | 39 | 1.3405e-02 | true |
| 128 | NLLSModel + SecondOrderOptimization (Dogleg) | 22354.0 | 0 | 0 | 6 | 2.5926e-02 | true |
| 128 | NLLSModel + SecondOrderOptimization (LM) | 15520.5 | 0 | 0 | 5 | 2.5926e-02 | true |
| 128 | SecondOrderOptimization (Dogleg) | 17916.5 | 33 | 6288 | 6 | 2.5926e-02 | true |
| 128 | SecondOrderOptimization (LM) | 12937.0 | 33 | 6384 | 5 | 2.5926e-02 | true |
| 128 | LeastSquaresOptim (Dogleg) | 22583.0 | 114 | 261744 | 5 | 2.5926e-02 | true |
| 128 | LeastSquaresOptim (LM) | 30145.5 | 146 | 363936 | 7 | 2.5926e-02 | true |
| 128 | Optim (NewtonTrustRegion) | 27687.5 | 160 | 12096 | 4 | 2.5926e-02 | true |
| 128 | Optim (Newton) | 23000.0 | 55 | 2416 | 5 | 2.5926e-02 | true |
| 128 | JSOSolvers (trunk) | 27583.0 | 50 | 2432 | 6 | 2.5926e-02 | true |
| 128 | JSOSolvers (tron) | 40854.5 | 124 | 6432 | 6 | 2.5926e-02 | true |
| 128 | Ipopt | 546292.0 | 245 | 10720 | 5 | 2.5926e-02 | true |
| 128 | MadNLP | 286333.0 | 543 | 45056 | 5 | 2.5926e-02 | true |
| 128 | NonlinearSolve (LM) | 695937.0 | 1475 | 345904 | 112 | 2.5926e-02 | true |
| 128 | NonlinearSolve (TrustRegion) | 130500.0 | 340 | 76720 | 37 | 2.5926e-02 | true |
| 256 | NLLSModel + SecondOrderOptimization (Dogleg) | 42104.5 | 0 | 0 | 6 | 5.5410e-02 | true |
| 256 | NLLSModel + SecondOrderOptimization (LM) | 29750.0 | 0 | 0 | 5 | 5.5410e-02 | true |
| 256 | SecondOrderOptimization (Dogleg) | 30896.0 | 34 | 10352 | 6 | 5.5410e-02 | true |
| 256 | SecondOrderOptimization (LM) | 23354.5 | 34 | 10448 | 5 | 5.5410e-02 | true |
| 256 | LeastSquaresOptim (Dogleg) | 37479.0 | 117 | 267792 | 5 | 5.5410e-02 | true |
| 256 | LeastSquaresOptim (LM) | 57729.5 | 167 | 421936 | 8 | 5.5410e-02 | true |
| 256 | Optim (NewtonTrustRegion) | 41062.5 | 160 | 12096 | 4 | 5.5410e-02 | true |
| 256 | Optim (Newton) | 37917.0 | 55 | 2416 | 5 | 5.5410e-02 | true |
| 256 | JSOSolvers (trunk) | 47500.0 | 50 | 2432 | 6 | 5.5410e-02 | true |
| 256 | JSOSolvers (tron) | 66708.5 | 124 | 6432 | 6 | 5.5410e-02 | true |
| 256 | Ipopt | 602375.0 | 245 | 10720 | 5 | 5.5410e-02 | true |
| 256 | MadNLP | 281104.0 | 543 | 45056 | 5 | 5.5410e-02 | true |
| 256 | NonlinearSolve (LM) | 1.2154585e6 | 1707 | 706096 | 112 | 5.5410e-02 | true |
| 256 | NonlinearSolve (TrustRegion) | 213395.5 | 384 | 129584 | 37 | 5.5410e-02 | true |
| 512 | NLLSModel + SecondOrderOptimization (Dogleg) | 82041.5 | 0 | 0 | 6 | 1.0665e-01 | true |
| 512 | NLLSModel + SecondOrderOptimization (LM) | 59854.0 | 0 | 0 | 5 | 1.0665e-01 | true |
| 512 | SecondOrderOptimization (Dogleg) | 60708.0 | 34 | 18544 | 6 | 1.0665e-01 | true |
| 512 | SecondOrderOptimization (LM) | 41520.5 | 34 | 18640 | 5 | 1.0665e-01 | true |
| 512 | LeastSquaresOptim (Dogleg) | 66645.5 | 117 | 280080 | 5 | 1.0665e-01 | true |
| 512 | LeastSquaresOptim (LM) | 94604.0 | 149 | 384832 | 7 | 1.0665e-01 | true |
| 512 | Optim (NewtonTrustRegion) | 79042.0 | 181 | 14064 | 5 | 1.0665e-01 | true |
| 512 | Optim (Newton) | 81312.5 | 60 | 2528 | 6 | 1.0665e-01 | true |
| 512 | JSOSolvers (trunk) | 85042.0 | 50 | 2432 | 6 | 1.0665e-01 | true |
| 512 | JSOSolvers (tron) | 106645.5 | 124 | 6432 | 6 | 1.0665e-01 | true |
| 512 | Ipopt | 638792.0 | 275 | 11968 | 6 | 1.0665e-01 | true |
| 512 | MadNLP | 329625.0 | 543 | 45056 | 6 | 1.0665e-01 | true |
| 512 | NonlinearSolve (LM) | 2.123875e6 | 1693 | 1314160 | 111 | 1.0665e-01 | true |
| 512 | NonlinearSolve (TrustRegion) | 372458.5 | 384 | 238128 | 37 | 1.0665e-01 | true |
| 1024 | NLLSModel + SecondOrderOptimization (Dogleg) | 154042.0 | 0 | 0 | 6 | 2.0673e-01 | true |
| 1024 | NLLSModel + SecondOrderOptimization (LM) | 115687.5 | 0 | 0 | 5 | 2.0673e-01 | true |
| 1024 | SecondOrderOptimization (Dogleg) | 117271.5 | 34 | 34928 | 6 | 2.0673e-01 | true |
| 1024 | SecondOrderOptimization (LM) | 79792.0 | 34 | 35024 | 5 | 2.0673e-01 | true |
| 1024 | LeastSquaresOptim (Dogleg) | 134979.0 | 117 | 304656 | 5 | 2.0673e-01 | true |
| 1024 | LeastSquaresOptim (LM) | 181083.5 | 149 | 412480 | 7 | 2.0673e-01 | true |
| 1024 | Optim (NewtonTrustRegion) | 127083.0 | 160 | 12096 | 4 | 2.0673e-01 | true |
| 1024 | Optim (Newton) | 136770.5 | 55 | 2416 | 5 | 2.0673e-01 | true |
| 1024 | JSOSolvers (trunk) | 152562.5 | 50 | 2432 | 6 | 2.0673e-01 | true |
| 1024 | JSOSolvers (tron) | 290771.0 | 124 | 6432 | 8 | 2.0673e-01 | true |
| 1024 | Ipopt | 649604.5 | 245 | 10720 | 5 | 2.0673e-01 | true |
| 1024 | MadNLP | 372541.5 | 543 | 45056 | 5 | 2.0673e-01 | true |
| 1024 | NonlinearSolve (LM) | 4.098896e6 | 1707 | 2563120 | 112 | 2.0673e-01 | true |
| 1024 | NonlinearSolve (TrustRegion) | 695812.5 | 384 | 455216 | 37 | 2.0673e-01 | true |
| 2048 | NLLSModel + SecondOrderOptimization (Dogleg) | 328729.5 | 0 | 0 | 6 | 4.1154e-01 | true |
| 2048 | NLLSModel + SecondOrderOptimization (LM) | 234541.5 | 0 | 0 | 5 | 4.1154e-01 | true |
| 2048 | SecondOrderOptimization (Dogleg) | 219354.0 | 34 | 67696 | 6 | 4.1154e-01 | true |
| 2048 | SecondOrderOptimization (LM) | 153062.0 | 34 | 67792 | 5 | 4.1154e-01 | true |
| 2048 | LeastSquaresOptim (Dogleg) | 246083.0 | 117 | 353808 | 5 | 4.1154e-01 | true |
| 2048 | LeastSquaresOptim (LM) | 332187.5 | 149 | 475968 | 7 | 4.1154e-01 | true |
| 2048 | Optim (NewtonTrustRegion) | 274541.5 | 181 | 14064 | 5 | 4.1154e-01 | true |
| 2048 | Optim (Newton) | 308042.0 | 60 | 2528 | 6 | 4.1154e-01 | true |
| 2048 | JSOSolvers (trunk) | 261208.0 | 50 | 2432 | 5 | 4.1154e-01 | true |
| 2048 | JSOSolvers (tron) | 418875.5 | 124 | 6432 | 6 | 4.1154e-01 | true |
| 2048 | Ipopt | 813375.0 | 275 | 11968 | 6 | 4.1154e-01 | true |
| 2048 | MadNLP | 467708.5 | 543 | 45056 | 5 | 4.1154e-01 | true |
| 2048 | NonlinearSolve (LM) | 8.108458e6 | 1707 | 5063728 | 112 | 4.1154e-01 | true |
| 2048 | NonlinearSolve (TrustRegion) | 1.4062295e6 | 384 | 889392 | 37 | 4.1154e-01 | true |
| 4096 | NLLSModel + SecondOrderOptimization (Dogleg) | 636166.5 | 0 | 0 | 6 | 8.3061e-01 | true |
| 4096 | NLLSModel + SecondOrderOptimization (LM) | 455124.5 | 0 | 0 | 5 | 8.3061e-01 | true |
| 4096 | SecondOrderOptimization (Dogleg) | 440250.0 | 34 | 133232 | 6 | 8.3061e-01 | true |
| 4096 | SecondOrderOptimization (LM) | 300854.5 | 34 | 133328 | 5 | 8.3061e-01 | true |
| 4096 | LeastSquaresOptim (Dogleg) | 491208.5 | 117 | 452112 | 5 | 8.3061e-01 | true |
| 4096 | LeastSquaresOptim (LM) | 670479.0 | 149 | 586560 | 7 | 8.3061e-01 | true |
| 4096 | Optim (NewtonTrustRegion) | 538750.0 | 181 | 14064 | 5 | 8.3061e-01 | true |
| 4096 | Optim (Newton) | 530187.5 | 55 | 2416 | 5 | 8.3061e-01 | true |
| 4096 | JSOSolvers (trunk) | 606875.0 | 50 | 2432 | 6 | 8.3061e-01 | true |
| 4096 | JSOSolvers (tron) | 778521.0 | 124 | 6432 | 6 | 8.3061e-01 | true |
| 4096 | Ipopt | 1.0135205e6 | 245 | 10720 | 5 | 8.3061e-01 | true |
| 4096 | MadNLP | 748958.5 | 543 | 45056 | 5 | 8.3061e-01 | true |
| 4096 | NonlinearSolve (LM) | 1.549125e7 | 1707 | 11850800 | 112 | 8.3061e-01 | true |
| 4096 | NonlinearSolve (TrustRegion) | 2.765021e6 | 384 | 1757744 | 37 | 8.3061e-01 | true |
| 8192 | NLLSModel + SecondOrderOptimization (Dogleg) | 1.2816875e6 | 0 | 0 | 6 | 1.6555e+00 | true |
| 8192 | NLLSModel + SecondOrderOptimization (LM) | 921374.5 | 0 | 0 | 5 | 1.6555e+00 | true |
| 8192 | SecondOrderOptimization (Dogleg) | 885938.0 | 34 | 264304 | 6 | 1.6555e+00 | true |
| 8192 | SecondOrderOptimization (LM) | 597229.5 | 34 | 264400 | 5 | 1.6555e+00 | true |
| 8192 | LeastSquaresOptim (Dogleg) | 1.0818125e6 | 117 | 648720 | 5 | 1.6555e+00 | true |
| 8192 | LeastSquaresOptim (LM) | 1.438625e6 | 149 | 783168 | 7 | 1.6555e+00 | true |
| 8192 | Optim (NewtonTrustRegion) | 914708.5 | 160 | 12096 | 4 | 1.6555e+00 | true |
| 8192 | Optim (Newton) | 1.2515415e6 | 60 | 2528 | 6 | 1.6555e+00 | true |
| 8192 | JSOSolvers (trunk) | 1.252271e6 | 50 | 2432 | 6 | 1.6555e+00 | true |
| 8192 | JSOSolvers (tron) | 1.4811045e6 | 124 | 6432 | 5 | 1.6555e+00 | true |
| 8192 | Ipopt | 1.6446245e6 | 275 | 11968 | 6 | 1.6555e+00 | true |
| 8192 | MadNLP | 1.105083e6 | 543 | 45056 | 5 | 1.6555e+00 | true |
| 8192 | NonlinearSolve (LM) | 2.8803042e7 | 1707 | 19846192 | 112 | 1.6555e+00 | true |
| 8192 | NonlinearSolve (TrustRegion) | 5.103979e6 | 384 | 3494448 | 37 | 1.6555e+00 | true |
| 16384 | NLLSModel + SecondOrderOptimization (Dogleg) | 2.574625e6 | 0 | 0 | 6 | 3.3011e+00 | true |
| 16384 | NLLSModel + SecondOrderOptimization (LM) | 1.877625e6 | 0 | 0 | 5 | 3.3011e+00 | true |
| 16384 | SecondOrderOptimization (Dogleg) | 1.780979e6 | 34 | 526448 | 6 | 3.3011e+00 | true |
| 16384 | SecondOrderOptimization (LM) | 1.2205835e6 | 34 | 526544 | 5 | 3.3011e+00 | true |
| 16384 | LeastSquaresOptim (Dogleg) | 2.239042e6 | 117 | 1041936 | 5 | 3.3011e+00 | true |
| 16384 | LeastSquaresOptim (LM) | 2.9503545e6 | 149 | 1176384 | 7 | 3.3011e+00 | true |
| 16384 | Optim (NewtonTrustRegion) | 1.815729e6 | 160 | 12096 | 4 | 3.3011e+00 | true |
| 16384 | Optim (Newton) | 2.800896e6 | 72 | 2720 | 6 | 3.3011e+00 | true |
| 16384 | JSOSolvers (trunk) | 2.6511035e6 | 50 | 2432 | 6 | 3.3011e+00 | true |
| 16384 | JSOSolvers (tron) | 4.6213545e6 | 124 | 6432 | 7 | 3.3011e+00 | true |
| 16384 | Ipopt | 2.717291e6 | 275 | 11968 | 6 | 3.3011e+00 | true |
| 16384 | MadNLP | 1.9406255e6 | 543 | 45056 | 5 | 3.3011e+00 | true |
| 16384 | NonlinearSolve (LM) | 5.7621542e7 | 1707 | 35836976 | 112 | 3.3011e+00 | true |
| 16384 | NonlinearSolve (TrustRegion) | 1.04143125e7 | 384 | 6967856 | 37 | 3.3011e+00 | true |
| 32768 | NLLSModel + SecondOrderOptimization (Dogleg) | 5.0677295e6 | 0 | 0 | 6 | 6.5496e+00 | true |
| 32768 | NLLSModel + SecondOrderOptimization (LM) | 3.837708e6 | 0 | 0 | 5 | 6.5496e+00 | true |
| 32768 | SecondOrderOptimization (Dogleg) | 3.6005205e6 | 34 | 1050736 | 6 | 6.5496e+00 | true |
| 32768 | SecondOrderOptimization (LM) | 2.4600835e6 | 34 | 1050832 | 5 | 6.5496e+00 | true |
| 32768 | LeastSquaresOptim (Dogleg) | 4.6018965e6 | 117 | 1828368 | 5 | 6.5496e+00 | true |
| 32768 | LeastSquaresOptim (LM) | 5.9563955e6 | 149 | 1962816 | 7 | 6.5496e+00 | true |
| 32768 | Optim (NewtonTrustRegion) | 3.6215e6 | 160 | 12096 | 4 | 6.5496e+00 | true |
| 32768 | Optim (Newton) | 5.0726455e6 | 60 | 2528 | 6 | 6.5496e+00 | true |
| 32768 | JSOSolvers (trunk) | 5.2773545e6 | 50 | 2432 | 6 | 6.5496e+00 | true |
| 32768 | JSOSolvers (tron) | 7.0570625e6 | 124 | 6432 | 6 | 6.5496e+00 | true |
| 32768 | Ipopt | 4.551042e6 | 275 | 11968 | 6 | 6.5496e+00 | true |
| 32768 | MadNLP | 3.647896e6 | 543 | 45056 | 5 | 6.5496e+00 | true |
| 32768 | NonlinearSolve (LM) | 1.149253955e8 | 1707 | 67818544 | 112 | 6.5496e+00 | true |
| 32768 | NonlinearSolve (TrustRegion) | 2.1072833e7 | 384 | 13914672 | 37 | 6.5496e+00 | true |
| 65536 | NLLSModel + SecondOrderOptimization (Dogleg) | 1.06221245e7 | 0 | 0 | 6 | 1.3174e+01 | true |
| 65536 | NLLSModel + SecondOrderOptimization (LM) | 7.6779375e6 | 0 | 0 | 5 | 1.3174e+01 | true |
| 65536 | SecondOrderOptimization (Dogleg) | 7.185458e6 | 34 | 2099312 | 6 | 1.3174e+01 | true |
| 65536 | SecondOrderOptimization (LM) | 4.9320625e6 | 34 | 2099408 | 5 | 1.3174e+01 | true |
| 65536 | LeastSquaresOptim (Dogleg) | 9.220292e6 | 117 | 3401232 | 5 | 1.3174e+01 | true |
| 65536 | LeastSquaresOptim (LM) | 1.14470415e7 | 149 | 3535680 | 7 | 1.3174e+01 | true |
| 65536 | Optim (NewtonTrustRegion) | 7.1234585e6 | 160 | 12096 | 4 | 1.3174e+01 | true |
| 65536 | Optim (Newton) | 9.898542e6 | 60 | 2528 | 6 | 1.3174e+01 | true |
| 65536 | JSOSolvers (trunk) | 1.02823545e7 | 50 | 2432 | 6 | 1.3174e+01 | true |
| 65536 | JSOSolvers (tron) | 1.41032915e7 | 124 | 6432 | 6 | 1.3174e+01 | true |
| 65536 | Ipopt | 8.4592085e6 | 275 | 11968 | 6 | 1.3174e+01 | true |
| 65536 | MadNLP | 7.2308755e6 | 543 | 45056 | 5 | 1.3174e+01 | true |
| 65536 | NonlinearSolve (LM) | 2.489492495e8 | 1707 | 131781680 | 112 | 1.3174e+01 | true |
| 65536 | NonlinearSolve (TrustRegion) | 4.4111333e7 | 384 | 27808304 | 37 | 1.3174e+01 | true |
