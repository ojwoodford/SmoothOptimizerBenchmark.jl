# Benchmark Results: Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T09:13:33
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b62fcb5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel (ManifoldVar) | 283.55555555555554 | 12 | 480 | 1564.1538461538462 | 66 | 2880 |
| 2 | NLLSModel (Specialized) | 5.667 | 0 | 0 | 61.817622950819676 | 0 | 0 |
| 2 | Manifolds | 465.90909090909093 | 30 | 1232 | 1443.5 | 62 | 2704 |
| 3 | NLLSModel (ManifoldVar) | 583.3333333333334 | 24 | 960 | 6708.333333333333 | 276 | 15264 |
| 3 | NLLSModel (Specialized) | 29.089783281733745 | 0 | 0 | 189.85849056603774 | 0 | 0 |
| 3 | Manifolds | 850.0 | 54 | 2352 | 5218.75 | 218 | 10912 |
| 4 | NLLSModel (ManifoldVar) | 964.2857142857143 | 40 | 1920 | 21334.0 | 820 | 65280 |
| 4 | NLLSModel (Specialized) | 59.525606469002696 | 0 | 0 | 421.0851063829787 | 0 | 0 |
| 4 | Manifolds | 1395.857142857143 | 86 | 4528 | 15375.0 | 604 | 39536 |
| 5 | NLLSModel (ManifoldVar) | 1487.1538461538462 | 60 | 2880 | 54250.0 | 1950 | 199440 |
| 5 | NLLSModel (Specialized) | 110.51086956521739 | 0 | 0 | 2145.8 | 0 | 0 |
| 5 | Manifolds | 2391.6 | 126 | 6768 | 37167.0 | 1389 | 103872 |
| 6 | NLLSModel (ManifoldVar) | 2348.875 | 84 | 4704 | 128791.0 | 3990 | 559104 |
| 6 | NLLSModel (Specialized) | 190.07619047619048 | 0 | 0 | 6031.25 | 0 | 0 |
| 6 | Manifolds | 3375.0 | 174 | 10976 | 95750.0 | 2787 | 268400 |
| 8 | NLLSModel (ManifoldVar) | 3941.8 | 144 | 9216 | 487333.0 | 12492 | 2693952 |
| 8 | NLLSModel (Specialized) | 469.95348837209303 | 0 | 0 | 48417.0 | 0 | 0 |
| 8 | Manifolds | 5611.333333333333 | 295 | 21792 | 276375.0 | 8530 | 1112432 |
| 10 | NLLSModel (ManifoldVar) | 8055.333333333333 | 220 | 15840 | 1.568125e6 | 30360 | 9966000 |
| 10 | NLLSModel (Specialized) | 995.8 | 0 | 0 | 165958.0 | 0 | 0 |
| 10 | Manifolds | 10000.0 | 447 | 37920 | 942875.0 | 20520 | 3760992 |
| 12 | NLLSModel (ManifoldVar) | 12291.0 | 312 | 24960 | 5.616917e6 | 62712 | 29270592 |
| 12 | NLLSModel (Specialized) | 1977.2727272727273 | 0 | 0 | 536959.0 | 0 | 0 |
| 12 | Manifolds | 15667.0 | 631 | 59584 | 2.179916e6 | 42214 | 9921616 |
| 15 | NLLSModel (ManifoldVar) | 30083.0 | 480 | 42240 | 2.0135458e7 | 152640 | 108441600 |
| 15 | NLLSModel (Specialized) | 4441.8 | 0 | 0 | 2.059416e6 | 0 | 0 |
| 15 | Manifolds | 32125.0 | 967 | 103008 | 9.591042e6 | 102400 | 35021840 |
| 18 | NLLSModel (ManifoldVar) | 36958.0 | 684 | 71136 | 5.1528541e7 | 394497 | 329909616 |
| 18 | NLLSModel (Specialized) | 8763.666666666666 | 0 | 0 | 5.992209e6 | 0 | 0 |
| 18 | Manifolds | 45084.0 | 1375 | 174048 | 1.8087875e7 | 238069 | 103894288 |
| 21 | NLLSModel (ManifoldVar) | 62750.0 | 924 | 103488 | 1.52759458e8 | 730422 | 739395888 |
| 21 | NLLSModel (Specialized) | 17458.0 | 0 | 0 | 1.5028709e7 | 0 | 0 |
| 21 | Manifolds | 72208.0 | 1855 | 260320 | 4.560325e7 | 440128 | 220684272 |
| 24 | NLLSModel (ManifoldVar) | 96042.0 | 1200 | 153600 | 3.32291666e8 | 1328700 | 1758768000 |
| 24 | NLLSModel (Specialized) | 29833.0 | 0 | 0 | 3.4863417e7 | 0 | 0 |
| 24 | Manifolds | 111666.0 | 2409 | 378048 | 1.016015e8 | 750096 | 514032016 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on standard target model: `Manifolds` (`NLLSModel + SecondOrderOptimization` entries run natively on `NLLSModel` with pre-allocated `OptimizationWorkspace`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 2 | NLLSModel + SecondOrderOptimization (LM) | 542.0 | 0 | 0 | 2 | 8.1148e-23 | true |
| 2 | NLLSModel + SecondOrderOptimization (Dogleg) | 666.5 | 0 | 0 | 2 | 4.7446e-26 | true |
| 2 | SecondOrderOptimization (LM) | 6375.0 | 218 | 9856 | 2 | 3.4949e-23 | true |
| 2 | SecondOrderOptimization (Dogleg) | 7187.5 | 276 | 12192 | 2 | 1.8647e-27 | true |
| 2 | Manopt (LevenbergMarquardt) | 18708.0 | 537 | 24160 | 3 | 2.1387e-33 | true |
| 3 | NLLSModel + SecondOrderOptimization (LM) | 1292.0 | 0 | 0 | 3 | 8.4115e-24 | true |
| 3 | NLLSModel + SecondOrderOptimization (Dogleg) | 1375.0 | 0 | 0 | 3 | 2.2306e-20 | true |
| 3 | SecondOrderOptimization (LM) | 24208.0 | 936 | 48192 | 3 | 2.3958e-24 | true |
| 3 | SecondOrderOptimization (Dogleg) | 28041.5 | 1096 | 55008 | 3 | 4.0708e-21 | true |
| 3 | Manopt (LevenbergMarquardt) | 45875.5 | 1619 | 83600 | 4 | 8.1095e-33 | true |
| 4 | NLLSModel + SecondOrderOptimization (LM) | 2833.0 | 0 | 0 | 3 | 1.2985e-18 | true |
| 4 | NLLSModel + SecondOrderOptimization (Dogleg) | 3875.0 | 0 | 0 | 4 | 1.0775e-23 | true |
| 4 | SecondOrderOptimization (LM) | 65354.0 | 2492 | 166576 | 3 | 1.0658e-18 | true |
| 4 | SecondOrderOptimization (Dogleg) | 84500.0 | 3458 | 225792 | 4 | 5.0711e-24 | true |
| 4 | Manopt (LevenbergMarquardt) | 148250.0 | 3961 | 275520 | 4 | 2.1438e-32 | true |
| 5 | NLLSModel + SecondOrderOptimization (LM) | 10041.0 | 0 | 0 | 3 | 1.1876e-17 | true |
| 5 | NLLSModel + SecondOrderOptimization (Dogleg) | 13125.0 | 0 | 0 | 4 | 1.3610e-23 | true |
| 5 | SecondOrderOptimization (LM) | 159041.5 | 5650 | 429456 | 3 | 5.0176e-18 | true |
| 5 | SecondOrderOptimization (Dogleg) | 204729.0 | 7567 | 562320 | 4 | 6.5352e-24 | true |
| 5 | Manopt (LevenbergMarquardt) | 293104.0 | 9754 | 758736 | 5 | 1.9842e-31 | true |
| 6 | NLLSModel + SecondOrderOptimization (LM) | 26458.0 | 0 | 0 | 3 | 1.7633e-21 | true |
| 6 | NLLSModel + SecondOrderOptimization (Dogleg) | 35833.0 | 0 | 0 | 4 | 5.4526e-24 | true |
| 6 | SecondOrderOptimization (LM) | 366250.5 | 11242 | 1096464 | 3 | 8.0121e-22 | true |
| 6 | SecondOrderOptimization (Dogleg) | 466834.0 | 14745 | 1409824 | 4 | 3.3088e-24 | true |
| 6 | Manopt (LevenbergMarquardt) | 537312.5 | 15411 | 1522320 | 4 | 8.1040e-32 | true |
| 8 | NLLSModel + SecondOrderOptimization (LM) | 210708.5 | 9 | 21744 | 3 | 2.7388e-20 | true |
| 8 | NLLSModel + SecondOrderOptimization (Dogleg) | 264583.5 | 9 | 21744 | 4 | 2.0570e-23 | true |
| 8 | SecondOrderOptimization (LM) | 1.169479e6 | 34219 | 4504480 | 3 | 2.5529e-20 | true |
| 8 | SecondOrderOptimization (Dogleg) | 1.513333e6 | 43950 | 5702176 | 4 | 1.4720e-23 | true |
| 8 | Manopt (LevenbergMarquardt) | 1.640833e6 | 44887 | 5968160 | 4 | 4.4155e-31 | true |
| 10 | NLLSModel + SecondOrderOptimization (LM) | 716083.0 | 9 | 49392 | 3 | 5.1714e-19 | true |
| 10 | NLLSModel + SecondOrderOptimization (Dogleg) | 887667.0 | 9 | 49392 | 4 | 3.3281e-22 | true |
| 10 | SecondOrderOptimization (LM) | 3.920291e6 | 82179 | 15154832 | 3 | 3.9166e-19 | true |
| 10 | SecondOrderOptimization (Dogleg) | 5.027083e6 | 104510 | 19060336 | 4 | 2.9149e-22 | true |
| 10 | Manopt (LevenbergMarquardt) | 6.668167e6 | 126826 | 23535136 | 5 | 4.5490e-31 | true |
| 12 | NLLSModel + SecondOrderOptimization (LM) | 2.2306255e6 | 9 | 147696 | 3 | 5.2405e-20 | true |
| 12 | NLLSModel + SecondOrderOptimization (Dogleg) | 2.7446875e6 | 9 | 147696 | 4 | 1.0925e-22 | true |
| 12 | SecondOrderOptimization (LM) | 1.20734165e7 | 168955 | 39971296 | 3 | 3.7729e-20 | true |
| 12 | SecondOrderOptimization (Dogleg) | 1.5105542e7 | 213716 | 50094688 | 4 | 8.2407e-23 | true |
| 12 | Manopt (LevenbergMarquardt) | 1.8978208e7 | 258278 | 61543440 | 5 | 5.7506e-31 | true |
| 15 | NLLSModel + SecondOrderOptimization (LM) | 8.515542e6 | 33 | 314400 | 3 | 2.7564e-19 | true |
| 15 | NLLSModel + SecondOrderOptimization (Dogleg) | 1.0812667e7 | 41 | 320816 | 4 | 3.9112e-21 | true |
| 15 | SecondOrderOptimization (LM) | 6.48755e7 | 409699 | 140640176 | 3 | 1.9531e-19 | true |
| 15 | SecondOrderOptimization (Dogleg) | 7.3895875e7 | 515992 | 175997840 | 4 | 2.9426e-21 | true |
| 15 | Manopt (LevenbergMarquardt) | 8.7904166e7 | 621748 | 214466048 | 5 | 1.5232e-30 | true |
| 18 | NLLSModel + SecondOrderOptimization (LM) | 2.4363541e7 | 42 | 619056 | 3 | 3.0835e-21 | true |
| 18 | NLLSModel + SecondOrderOptimization (Dogleg) | 3.00993125e7 | 53 | 628720 | 4 | 1.6985e-23 | true |
| 18 | SecondOrderOptimization (LM) | 1.37000667e8 | 952402 | 418060704 | 3 | 2.6496e-21 | true |
| 18 | SecondOrderOptimization (Dogleg) | 1.532557705e8 | 1196003 | 521354144 | 4 | 1.5865e-23 | true |
| 18 | Manopt (LevenbergMarquardt) | 1.89371333e8 | 1438725 | 632475568 | 5 | 1.8740e-30 | true |
| 21 | NLLSModel + SecondOrderOptimization (LM) | 6.2246417e7 | 42 | 1115232 | 3 | 2.0541e-21 | true |
| 21 | NLLSModel + SecondOrderOptimization (Dogleg) | 7.8086875e7 | 53 | 1126448 | 4 | 2.1128e-23 | true |
| 21 | SecondOrderOptimization (LM) | 3.24053e8 | 1760638 | 884646416 | 3 | 1.7672e-21 | true |
| 21 | SecondOrderOptimization (Dogleg) | 3.82790375e8 | 2208215 | 1121542368 | 4 | 1.9371e-23 | true |
| 21 | Manopt (LevenbergMarquardt) | 4.36448958e8 | 2654439 | 1356658848 | 5 | 2.9123e-30 | true |
| 24 | NLLSModel + SecondOrderOptimization (LM) | 1.41781083e8 | 42 | 1915584 | 3 | 4.6393e-20 | true |
| 24 | NLLSModel + SecondOrderOptimization (Dogleg) | 1.771969795e8 | 67 | 2569968 | 5 | 3.7208e-30 | true |
| 24 | SecondOrderOptimization (LM) | 5.84480125e8 | 3000513 | 2073711744 | 3 | 4.1481e-20 | true |
| 24 | SecondOrderOptimization (Dogleg) | 7.25571083e8 | 3762720 | 2589726224 | 5 | 4.5958e-30 | true |
| 24 | Manopt (LevenbergMarquardt) | 8.587845e8 | 4518136 | 3114270512 | 5 | 3.3504e-30 | true |
