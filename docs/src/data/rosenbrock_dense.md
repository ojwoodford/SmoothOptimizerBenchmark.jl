# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T09:05:44
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b62fcb5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel | 7.333 | 0 | 0 | 136.98125 | 0 | 0 |
| 2 | Standalone | 7.625 | 0 | 0 | 541.0 | 6 | 496 |
| 2 | NLPModels (MathOptNLSModel) | 111.994708994709 | 5 | 80 | 842.3913043478261 | 9 | 224 |
| 3 | NLLSModel | 9.208 | 0 | 0 | 162.82894736842104 | 0 | 0 |
| 3 | Standalone | 12.5 | 0 | 0 | 625.0 | 6 | 560 |
| 3 | NLPModels (MathOptNLSModel) | 114.83536585365853 | 5 | 80 | 975.4090909090909 | 9 | 224 |
| 4 | NLLSModel | 11.792 | 0 | 0 | 225.07476635514018 | 0 | 0 |
| 4 | Standalone | 17.166 | 0 | 0 | 708.0 | 6 | 656 |
| 4 | NLPModels (MathOptNLSModel) | 114.43478260869566 | 5 | 80 | 1338.8666666666666 | 9 | 224 |
| 5 | NLLSModel | 15.541 | 0 | 0 | 285.7142857142857 | 0 | 0 |
| 5 | Standalone | 22.38235294117647 | 0 | 0 | 792.0 | 6 | 752 |
| 5 | NLPModels (MathOptNLSModel) | 119.33136094674556 | 5 | 80 | 1882.5454545454545 | 9 | 224 |
| 6 | NLLSModel | 20.209 | 0 | 0 | 367.08620689655174 | 0 | 0 |
| 6 | Standalone | 25.649350649350648 | 0 | 0 | 959.0 | 6 | 912 |
| 6 | NLPModels (MathOptNLSModel) | 114.40236686390533 | 5 | 80 | 2486.1111111111113 | 9 | 224 |
| 8 | NLLSModel | 34.32374100719424 | 0 | 0 | 631.3030303030303 | 0 | 0 |
| 8 | Standalone | 32.447841726618705 | 0 | 0 | 1375.0 | 6 | 1264 |
| 8 | NLPModels (MathOptNLSModel) | 116.36686390532545 | 5 | 80 | 4541.6 | 9 | 224 |
| 10 | NLLSModel | 50.97402597402598 | 0 | 0 | 866.3333333333334 | 0 | 0 |
| 10 | Standalone | 38.67827868852459 | 0 | 0 | 2292.0 | 6 | 1776 |
| 10 | NLPModels (MathOptNLSModel) | 121.20779220779221 | 5 | 80 | 8958.333333333334 | 9 | 224 |
| 14 | NLLSModel | 103.84455958549223 | 0 | 0 | 1586.357142857143 | 0 | 0 |
| 14 | Standalone | 59.59752321981424 | 0 | 0 | 4458.0 | 7 | 1776 |
| 14 | NLPModels (MathOptNLSModel) | 134.54198473282443 | 5 | 80 | 31917.0 | 9 | 224 |
| 18 | NLLSModel | 191.03773584905662 | 0 | 0 | 2619.875 | 0 | 0 |
| 18 | Standalone | 76.58333333333333 | 0 | 0 | 8792.0 | 7 | 2592 |
| 18 | NLPModels (MathOptNLSModel) | 157.8031496062992 | 5 | 80 | 52083.0 | 9 | 224 |
| 22 | NLLSModel | 292.910447761194 | 0 | 0 | 3875.0 | 0 | 0 |
| 22 | Standalone | 106.60893854748603 | 0 | 0 | 18792.0 | 8 | 3520 |
| 22 | NLPModels (MathOptNLSModel) | 160.90425531914894 | 5 | 80 | 119750.0 | 9 | 224 |
| 26 | NLLSModel | 420.1458333333333 | 0 | 0 | 5437.5 | 0 | 0 |
| 26 | Standalone | 141.672 | 0 | 0 | 28334.0 | 8 | 4208 |
| 26 | NLPModels (MathOptNLSModel) | 176.9908256880734 | 5 | 80 | 161792.0 | 9 | 224 |
| 32 | NLLSModel | 644.53125 | 0 | 0 | 8166.666666666667 | 0 | 0 |
| 32 | Standalone | 206.56382978723406 | 0 | 0 | 54708.0 | 8 | 6592 |
| 32 | NLPModels (MathOptNLSModel) | 192.60204081632654 | 5 | 80 | 356625.0 | 9 | 224 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on standard target model: `Standalone` (`NLLSModel + SecondOrderOptimization` entries run natively on `NLLSModel` with pre-allocated `OptimizationWorkspace`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 2 | NLLSModel + SecondOrderOptimization (Dogleg) | 3291.5 | 10 | 560 | 6 | 1.7458e-24 | true |
| 2 | NLLSModel + SecondOrderOptimization (LM) | 3333.0 | 12 | 672 | 6 | 7.7016e-25 | true |
| 2 | SecondOrderOptimization (Dogleg) | 6312.5 | 74 | 5504 | 6 | 1.7458e-24 | true |
| 2 | SecondOrderOptimization (LM) | 6500.0 | 76 | 5680 | 6 | 7.7016e-25 | true |
| 2 | LeastSquaresOptim (Dogleg) | 17604.5 | 191 | 358944 | 7 | 0.0000e+00 | true |
| 2 | LeastSquaresOptim (LM) | 14667.0 | 187 | 358816 | 7 | 1.5248e-24 | true |
| 2 | Optim (NewtonTrustRegion) | 14062.5 | 235 | 17680 | 6 | 7.7016e-25 | true |
| 2 | Optim (Newton) | 12020.5 | 144 | 9408 | 6 | 7.7016e-25 | true |
| 2 | JSOSolvers (trunk) | 12084.0 | 98 | 6400 | 7 | 4.9612e-28 | true |
| 2 | JSOSolvers (tron) | 18667.0 | 166 | 9904 | 6 | 6.0087e-20 | true |
| 2 | Ipopt | 588229.0 | 317 | 15440 | 6 | 7.7016e-25 | true |
| 2 | MadNLP | 286041.0 | 585 | 48128 | 6 | 7.7016e-25 | true |
| 2 | NonlinearSolve (LM) | 36334.0 | 343 | 22720 | 13 | 1.6316e-22 | true |
| 2 | NonlinearSolve (TrustRegion) | 17187.5 | 199 | 14512 | 7 | 1.5811e-23 | true |
| 3 | NLLSModel + SecondOrderOptimization (Dogleg) | 3729.5 | 10 | 720 | 6 | 7.3106e-21 | true |
| 3 | NLLSModel + SecondOrderOptimization (LM) | 4417.0 | 14 | 1008 | 7 | 7.5232e-20 | true |
| 3 | SecondOrderOptimization (Dogleg) | 7417.0 | 74 | 6272 | 6 | 7.3106e-21 | true |
| 3 | SecondOrderOptimization (LM) | 8708.5 | 84 | 7216 | 7 | 7.5232e-20 | true |
| 3 | LeastSquaresOptim (Dogleg) | 15666.0 | 215 | 413120 | 8 | 0.0000e+00 | true |
| 3 | LeastSquaresOptim (LM) | 17479.0 | 235 | 464512 | 9 | 5.6818e-30 | true |
| 3 | Optim (NewtonTrustRegion) | 27979.5 | 319 | 26960 | 7 | 9.2456e-22 | true |
| 3 | Optim (Newton) | 14750.0 | 161 | 11600 | 7 | 7.5249e-20 | true |
| 3 | JSOSolvers (trunk) | 13292.0 | 98 | 6912 | 7 | 5.6186e-18 | true |
| 3 | JSOSolvers (tron) | 26916.5 | 178 | 11472 | 8 | 2.8258e-20 | true |
| 3 | Ipopt | 634333.5 | 353 | 17696 | 7 | 7.5249e-20 | true |
| 3 | MadNLP | 299250.0 | 591 | 49536 | 7 | 7.5249e-20 | true |
| 3 | NonlinearSolve (LM) | 55166.0 | 373 | 29664 | 15 | 8.5268e-23 | true |
| 3 | NonlinearSolve (TrustRegion) | 21000.0 | 199 | 16992 | 7 | 7.5075e-19 | true |
| 4 | NLLSModel + SecondOrderOptimization (Dogleg) | 4917.0 | 12 | 1248 | 7 | 2.5283e-26 | true |
| 4 | NLLSModel + SecondOrderOptimization (LM) | 4875.0 | 14 | 1456 | 7 | 1.3444e-21 | true |
| 4 | SecondOrderOptimization (Dogleg) | 9104.0 | 82 | 8496 | 7 | 2.5283e-26 | true |
| 4 | SecondOrderOptimization (LM) | 9083.5 | 84 | 8848 | 7 | 1.3444e-21 | true |
| 4 | LeastSquaresOptim (Dogleg) | 18000.0 | 215 | 417248 | 8 | 0.0000e+00 | true |
| 4 | LeastSquaresOptim (LM) | 19500.0 | 235 | 469152 | 9 | 4.8047e-28 | true |
| 4 | Optim (NewtonTrustRegion) | 37999.5 | 352 | 37680 | 8 | 0.0000e+00 | true |
| 4 | Optim (Newton) | 15750.0 | 161 | 13376 | 7 | 1.3440e-21 | true |
| 4 | JSOSolvers (trunk) | 16562.5 | 104 | 8528 | 8 | 7.5387e-19 | true |
| 4 | JSOSolvers (tron) | 34875.0 | 190 | 14016 | 10 | 1.6206e-19 | true |
| 4 | Ipopt | 632812.5 | 353 | 18544 | 7 | 1.3440e-21 | true |
| 4 | MadNLP | 301375.0 | 591 | 51152 | 7 | 1.3440e-21 | true |
| 4 | NonlinearSolve (LM) | 81209.0 | 415 | 43664 | 18 | 3.9178e-20 | true |
| 4 | NonlinearSolve (TrustRegion) | 27625.0 | 211 | 22400 | 8 | 3.3132e-31 | true |
| 5 | NLLSModel + SecondOrderOptimization (Dogleg) | 5916.0 | 12 | 1632 | 7 | 4.3874e-29 | true |
| 5 | NLLSModel + SecondOrderOptimization (LM) | 10750.0 | 32 | 4352 | 9 | 4.6966e-23 | true |
| 5 | SecondOrderOptimization (Dogleg) | 10334.0 | 82 | 10000 | 7 | 4.3874e-29 | true |
| 5 | SecondOrderOptimization (LM) | 16291.5 | 120 | 15184 | 9 | 4.6966e-23 | true |
| 5 | LeastSquaresOptim (Dogleg) | 26458.0 | 255 | 474032 | 13 | 0.0000e+00 | true |
| 5 | LeastSquaresOptim (LM) | 32687.5 | 235 | 473616 | 9 | 1.0157e-25 | true |
| 5 | Optim (NewtonTrustRegion) | 49417.0 | 352 | 44592 | 8 | 2.7179e-28 | true |
| 5 | Optim (Newton) | 19604.5 | 181 | 16704 | 8 | 1.5683e-25 | true |
| 5 | JSOSolvers (trunk) | 21312.5 | 110 | 10144 | 9 | 2.8590e-19 | true |
| 5 | JSOSolvers (tron) | 38854.5 | 190 | 15072 | 10 | 2.9624e-18 | true |
| 5 | Ipopt | 786792.0 | 409 | 22432 | 8 | 1.8489e-28 | true |
| 5 | MadNLP | 364750.0 | 597 | 53472 | 8 | 1.8489e-28 | true |
| 5 | NonlinearSolve (LM) | 117625.0 | 445 | 58320 | 20 | 2.2867e-21 | true |
| 5 | NonlinearSolve (TrustRegion) | 32854.0 | 211 | 27040 | 8 | 2.0619e-28 | true |
| 6 | NLLSModel + SecondOrderOptimization (Dogleg) | 6750.0 | 12 | 2304 | 7 | 1.2761e-22 | true |
| 6 | NLLSModel + SecondOrderOptimization (LM) | 12042.0 | 32 | 6144 | 9 | 2.5627e-20 | true |
| 6 | SecondOrderOptimization (Dogleg) | 11750.0 | 82 | 12656 | 7 | 1.2761e-22 | true |
| 6 | SecondOrderOptimization (LM) | 18250.0 | 120 | 19536 | 9 | 2.5627e-20 | true |
| 6 | LeastSquaresOptim (Dogleg) | 30584.0 | 259 | 478832 | 14 | 0.0000e+00 | true |
| 6 | LeastSquaresOptim (LM) | 30292.0 | 235 | 478240 | 9 | 6.5103e-28 | true |
| 6 | Optim (NewtonTrustRegion) | 58750.0 | 352 | 55056 | 8 | 3.2466e-25 | true |
| 6 | Optim (Newton) | 22041.5 | 181 | 19920 | 8 | 4.1099e-19 | true |
| 6 | JSOSolvers (trunk) | 24687.5 | 110 | 11936 | 9 | 3.0650e-18 | true |
| 6 | JSOSolvers (tron) | 50083.0 | 196 | 18112 | 12 | 5.0367e-21 | true |
| 6 | Ipopt | 771500.0 | 409 | 23952 | 8 | 1.3644e-26 | true |
| 6 | MadNLP | 354625.0 | 597 | 56016 | 8 | 1.3644e-26 | true |
| 6 | NonlinearSolve (LM) | 161875.0 | 475 | 81936 | 22 | 5.1931e-23 | true |
| 6 | NonlinearSolve (TrustRegion) | 39416.5 | 211 | 34800 | 8 | 1.6505e-25 | true |
| 8 | NLLSModel + SecondOrderOptimization (Dogleg) | 9916.0 | 14 | 4144 | 8 | 0.0000e+00 | true |
| 8 | NLLSModel + SecondOrderOptimization (LM) | 10875.0 | 16 | 4736 | 8 | 2.0194e-24 | true |
| 8 | SecondOrderOptimization (Dogleg) | 17042.0 | 85 | 19248 | 8 | 0.0000e+00 | true |
| 8 | SecondOrderOptimization (LM) | 18770.5 | 93 | 21600 | 8 | 2.0194e-24 | true |
| 8 | LeastSquaresOptim (Dogleg) | 42729.0 | 249 | 489200 | 9 | 0.0000e+00 | true |
| 8 | LeastSquaresOptim (LM) | 44562.5 | 245 | 489472 | 9 | 1.0826e-24 | true |
| 8 | Optim (NewtonTrustRegion) | 90917.0 | 394 | 86416 | 9 | 0.0000e+00 | true |
| 8 | Optim (Newton) | 30395.5 | 178 | 26736 | 8 | 2.0175e-24 | true |
| 8 | JSOSolvers (trunk) | 35750.0 | 116 | 16912 | 10 | 2.9892e-19 | true |
| 8 | JSOSolvers (tron) | 61291.5 | 202 | 23968 | 12 | 3.0253e-20 | true |
| 8 | Ipopt | 744416.0 | 389 | 26080 | 8 | 2.0175e-24 | true |
| 8 | MadNLP | 349958.5 | 597 | 61760 | 8 | 2.0175e-24 | true |
| 8 | NonlinearSolve (LM) | 328625.0 | 605 | 159920 | 31 | 4.1941e-17 | true |
| 8 | NonlinearSolve (TrustRegion) | 56354.0 | 214 | 52688 | 8 | 1.0369e-23 | true |
| 10 | NLLSModel + SecondOrderOptimization (Dogleg) | 14479.0 | 14 | 6608 | 8 | 1.0852e-18 | true |
| 10 | NLLSModel + SecondOrderOptimization (LM) | 14625.0 | 16 | 7552 | 8 | 1.1201e-22 | true |
| 10 | SecondOrderOptimization (Dogleg) | 27979.5 | 91 | 30736 | 8 | 1.0852e-18 | true |
| 10 | SecondOrderOptimization (LM) | 27562.5 | 93 | 32512 | 8 | 1.1201e-22 | true |
| 10 | LeastSquaresOptim (Dogleg) | 62167.0 | 249 | 502432 | 9 | 0.0000e+00 | true |
| 10 | LeastSquaresOptim (LM) | 100208.5 | 377 | 827168 | 15 | 3.8422e-25 | true |
| 10 | Optim (NewtonTrustRegion) | 166833.0 | 538 | 156560 | 11 | 9.9092e-29 | true |
| 10 | Optim (Newton) | 45500.0 | 178 | 36896 | 8 | 1.1201e-22 | true |
| 10 | JSOSolvers (trunk) | 54250.0 | 122 | 24512 | 11 | 1.8086e-19 | true |
| 10 | JSOSolvers (tron) | 83833.0 | 202 | 30992 | 12 | 1.8690e-18 | true |
| 10 | Ipopt | 739312.0 | 389 | 30768 | 8 | 1.1201e-22 | true |
| 10 | MadNLP | 355875.0 | 597 | 69280 | 8 | 1.1201e-22 | true |
| 10 | NonlinearSolve (LM) | 2.132625e6 | 2039 | 821904 | 134 | 2.7100e+00 | true |
| 10 | NonlinearSolve (TrustRegion) | 79770.5 | 214 | 79904 | 8 | 5.2878e-22 | true |
| 14 | NLLSModel + SecondOrderOptimization (Dogleg) | 26729.5 | 16 | 13440 | 9 | 4.1869e-30 | true |
| 14 | NLLSModel + SecondOrderOptimization (LM) | 27417.0 | 18 | 15120 | 9 | 0.0000e+00 | true |
| 14 | SecondOrderOptimization (Dogleg) | 57333.5 | 109 | 47808 | 9 | 4.1869e-30 | true |
| 14 | SecondOrderOptimization (LM) | 55812.5 | 111 | 51024 | 9 | 0.0000e+00 | true |
| 14 | LeastSquaresOptim (Dogleg) | 118333.5 | 258 | 520832 | 9 | 0.0000e+00 | true |
| 14 | LeastSquaresOptim (LM) | 237042.0 | 460 | 1019776 | 18 | 7.5856e-27 | true |
| 14 | Optim (NewtonTrustRegion) | 255750.0 | 465 | 178496 | 9 | 5.0883e-19 | true |
| 14 | Optim (Newton) | 82146.0 | 215 | 42272 | 9 | 0.0000e+00 | true |
| 14 | JSOSolvers (trunk) | 112792.0 | 148 | 28448 | 13 | 2.7717e+00 | true |
| 14 | JSOSolvers (tron) | 170687.5 | 222 | 33504 | 13 | 2.7717e+00 | true |
| 14 | Ipopt | 895166.0 | 435 | 33952 | 9 | 0.0000e+00 | true |
| 14 | MadNLP | 442250.0 | 613 | 78528 | 9 | 0.0000e+00 | true |
| 14 | NonlinearSolve (LM) | 4.25175e6 | 2003 | 1317616 | 128 | 2.7717e+00 | true |
| 14 | NonlinearSolve (TrustRegion) | 197542.0 | 247 | 125056 | 11 | 5.1693e-25 | true |
| 18 | NLLSModel + SecondOrderOptimization (Dogleg) | 41479.0 | 24 | 25216 | 9 | 8.1291e-23 | true |
| 18 | NLLSModel + SecondOrderOptimization (LM) | 43125.0 | 27 | 28368 | 9 | 2.4559e-23 | true |
| 18 | SecondOrderOptimization (Dogleg) | 103999.5 | 118 | 86352 | 9 | 8.1291e-23 | true |
| 18 | SecondOrderOptimization (LM) | 106437.5 | 122 | 92480 | 9 | 2.4559e-23 | true |
| 18 | LeastSquaresOptim (Dogleg) | 261000.0 | 284 | 625504 | 10 | 0.0000e+00 | true |
| 18 | LeastSquaresOptim (LM) | 502062.5 | 460 | 1087184 | 18 | 5.6493e-26 | true |
| 18 | Optim (NewtonTrustRegion) | 469895.5 | 552 | 302256 | 10 | 5.6406e-24 | true |
| 18 | Optim (Newton) | 170375.0 | 217 | 61760 | 9 | 2.4556e-23 | true |
| 18 | JSOSolvers (trunk) | 222541.5 | 148 | 40256 | 13 | 2.8014e+00 | true |
| 18 | JSOSolvers (tron) | 299645.5 | 222 | 45664 | 14 | 4.1839e-21 | true |
| 18 | Ipopt | 951229.0 | 435 | 42272 | 9 | 2.4556e-23 | true |
| 18 | MadNLP | 470708.0 | 613 | 96768 | 9 | 2.4556e-23 | true |
| 18 | NonlinearSolve (LM) | 7.901625e6 | 2515 | 2349248 | 128 | 2.8014e+00 | true |
| 18 | NonlinearSolve (TrustRegion) | 359271.0 | 269 | 231504 | 11 | 1.5096e-23 | true |
| 22 | NLLSModel + SecondOrderOptimization (Dogleg) | 58812.5 | 24 | 33408 | 9 | 1.7181e-21 | true |
| 22 | NLLSModel + SecondOrderOptimization (LM) | 59583.5 | 27 | 37584 | 9 | 4.1424e-22 | true |
| 22 | SecondOrderOptimization (Dogleg) | 207729.0 | 129 | 126080 | 9 | 1.7181e-21 | true |
| 22 | SecondOrderOptimization (LM) | 211229.0 | 133 | 134224 | 9 | 4.1424e-22 | true |
| 22 | LeastSquaresOptim (Dogleg) | 473417.0 | 297 | 668960 | 10 | 0.0000e+00 | true |
| 22 | LeastSquaresOptim (LM) | 904437.5 | 477 | 1143872 | 18 | 2.3716e-25 | true |
| 22 | Optim (NewtonTrustRegion) | 1.019104e6 | 812 | 563984 | 13 | 0.0000e+00 | true |
| 22 | Optim (Newton) | 335375.0 | 237 | 82592 | 9 | 4.1424e-22 | true |
| 22 | JSOSolvers (trunk) | 413709.0 | 162 | 53632 | 13 | 2.8186e+00 | true |
| 22 | JSOSolvers (tron) | 580792.0 | 244 | 62912 | 15 | 5.1680e-20 | true |
| 22 | Ipopt | 1.0345e6 | 445 | 51712 | 9 | 4.1424e-22 | true |
| 22 | MadNLP | 588458.0 | 631 | 117904 | 9 | 4.1424e-22 | true |
| 22 | NonlinearSolve (LM) | 1.5249146e7 | 2845 | 3290384 | 129 | 2.8186e+00 | true |
| 22 | NonlinearSolve (TrustRegion) | 794875.0 | 322 | 367648 | 13 | 1.3900e-20 | true |
| 26 | NLLSModel + SecondOrderOptimization (Dogleg) | 101354.0 | 33 | 68464 | 12 | 0.0000e+00 | true |
| 26 | NLLSModel + SecondOrderOptimization (LM) | 90208.5 | 30 | 62240 | 10 | 1.2434e-30 | true |
| 26 | SecondOrderOptimization (Dogleg) | 377770.5 | 154 | 212432 | 12 | 0.0000e+00 | true |
| 26 | SecondOrderOptimization (LM) | 330854.5 | 144 | 207984 | 10 | 1.2434e-30 | true |
| 26 | LeastSquaresOptim (Dogleg) | 813875.0 | 324 | 785840 | 11 | 0.0000e+00 | true |
| 26 | LeastSquaresOptim (LM) | 1.471458e6 | 477 | 1209072 | 18 | 7.4077e-25 | true |
| 26 | Optim (NewtonTrustRegion) | 1.4208545e6 | 825 | 773472 | 13 | 1.0484e-22 | true |
| 26 | Optim (Newton) | 513562.5 | 258 | 109376 | 10 | 1.2434e-30 | true |
| 26 | JSOSolvers (trunk) | 665375.0 | 170 | 67856 | 14 | 2.8298e+00 | true |
| 26 | JSOSolvers (tron) | 882520.5 | 244 | 73968 | 15 | 6.5682e-21 | true |
| 26 | Ipopt | 1.308854e6 | 483 | 64208 | 10 | 1.2434e-30 | true |
| 26 | MadNLP | 807417.0 | 639 | 143632 | 10 | 1.2434e-30 | true |
| 26 | NonlinearSolve (LM) | 2.32485625e7 | 2845 | 4650832 | 129 | 2.8298e+00 | true |
| 26 | NonlinearSolve (TrustRegion) | 1.2189375e6 | 322 | 539760 | 13 | 6.0131e-18 | true |
| 32 | NLLSModel + SecondOrderOptimization (Dogleg) | 169667.0 | 36 | 99264 | 13 | 3.1621e-25 | true |
| 32 | NLLSModel + SecondOrderOptimization (LM) | 137479.0 | 30 | 82720 | 10 | 4.5840e-19 | true |
| 32 | SecondOrderOptimization (Dogleg) | 832833.0 | 173 | 354896 | 13 | 3.1621e-25 | true |
| 32 | SecondOrderOptimization (LM) | 659291.5 | 144 | 326560 | 10 | 4.5840e-19 | true |
| 32 | LeastSquaresOptim (Dogleg) | 1.6863335e6 | 324 | 908848 | 11 | 0.0000e+00 | true |
| 32 | LeastSquaresOptim (LM) | 3.1506045e6 | 477 | 1354816 | 18 | 3.9810e-22 | true |
| 32 | Optim (NewtonTrustRegion) | 2.7105e6 | 891 | 1134544 | 14 | 1.3363e-29 | true |
| 32 | Optim (Newton) | 1.0487085e6 | 258 | 166256 | 10 | 4.5840e-19 | true |
| 32 | JSOSolvers (trunk) | 1.3201875e6 | 170 | 104192 | 14 | 2.8407e+00 | true |
| 32 | JSOSolvers (tron) | 1.718875e6 | 244 | 110832 | 15 | 1.8535e-19 | true |
| 32 | Ipopt | 1.6470415e6 | 483 | 90672 | 10 | 4.5840e-19 | true |
| 32 | MadNLP | 1.110417e6 | 655 | 204304 | 10 | 4.5840e-19 | true |
| 32 | NonlinearSolve (LM) | 3.6421333e7 | 2827 | 6605936 | 128 | 2.8407e+00 | true |
| 32 | NonlinearSolve (TrustRegion) | 1.6398125e6 | 295 | 797392 | 10 | 3.2128e-19 | true |
