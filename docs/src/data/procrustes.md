# Benchmark Results: Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T21:17:58
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b448285

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel (ManifoldVar) | 277.9605263157895 | 12 | 480 | 1652.75 | 66 | 2880 |
| 2 | NLLSModel (Specialized) | 5.708 | 0 | 0 | 65.10989010989012 | 0 | 0 |
| 2 | Manifolds | 96.83333333333333 | 0 | 0 | 294.4864864864865 | 0 | 0 |
| 3 | NLLSModel (ManifoldVar) | 580.8823529411765 | 24 | 960 | 6792.0 | 276 | 15264 |
| 3 | NLLSModel (Specialized) | 29.42937062937063 | 0 | 0 | 140.10526315789474 | 0 | 0 |
| 3 | Manifolds | 230.38823529411764 | 0 | 0 | 802.4814814814815 | 0 | 0 |
| 4 | NLLSModel (ManifoldVar) | 1033.7142857142858 | 40 | 1920 | 21250.0 | 820 | 65280 |
| 4 | NLLSModel (Specialized) | 52.922077922077925 | 0 | 0 | 418.4255319148936 | 0 | 0 |
| 4 | Manifolds | 453.7111111111111 | 0 | 0 | 2108.3 | 0 | 0 |
| 5 | NLLSModel (ManifoldVar) | 1494.0714285714287 | 60 | 2880 | 55417.0 | 1950 | 199440 |
| 5 | NLLSModel (Specialized) | 107.11413043478261 | 0 | 0 | 2070.8 | 0 | 0 |
| 5 | Manifolds | 900.0 | 0 | 0 | 5385.25 | 0 | 0 |
| 6 | NLLSModel (ManifoldVar) | 2314.777777777778 | 84 | 4704 | 127334.0 | 3990 | 559104 |
| 6 | NLLSModel (Specialized) | 184.74528301886792 | 0 | 0 | 6021.0 | 0 | 0 |
| 6 | Manifolds | 1413.9333333333334 | 0 | 0 | 12667.0 | 0 | 0 |
| 8 | NLLSModel (ManifoldVar) | 3965.1666666666665 | 144 | 9216 | 426459.0 | 12492 | 2693952 |
| 8 | NLLSModel (Specialized) | 461.1818181818182 | 0 | 0 | 49792.0 | 0 | 0 |
| 8 | Manifolds | 3486.1666666666665 | 0 | 0 | 49417.0 | 0 | 0 |
| 10 | NLLSModel (ManifoldVar) | 8097.0 | 220 | 15840 | 1.497416e6 | 30360 | 9966000 |
| 10 | NLLSModel (Specialized) | 1052.1 | 0 | 0 | 165875.0 | 0 | 0 |
| 10 | Manifolds | 6791.666666666667 | 0 | 0 | 171375.0 | 0 | 0 |
| 12 | NLLSModel (ManifoldVar) | 12125.0 | 312 | 24960 | 5.315e6 | 62712 | 29270592 |
| 12 | NLLSModel (Specialized) | 1920.4545454545455 | 0 | 0 | 538084.0 | 0 | 0 |
| 12 | Manifolds | 11708.0 | 0 | 0 | 518250.0 | 0 | 0 |
| 15 | NLLSModel (ManifoldVar) | 26166.0 | 480 | 42240 | 1.8712667e7 | 152640 | 108441600 |
| 15 | NLLSModel (Specialized) | 4883.2 | 0 | 0 | 2.008166e6 | 0 | 0 |
| 15 | Manifolds | 23583.0 | 0 | 0 | 1.811208e6 | 0 | 0 |
| 18 | NLLSModel (ManifoldVar) | 37083.0 | 684 | 71136 | 6.0172375e7 | 394497 | 329909616 |
| 18 | NLLSModel (Specialized) | 8777.666666666666 | 0 | 0 | 5.873084e6 | 0 | 0 |
| 18 | Manifolds | 41834.0 | 0 | 0 | 5.358583e6 | 0 | 0 |
| 21 | NLLSModel (ManifoldVar) | 61167.0 | 924 | 103488 | 1.70656291e8 | 730422 | 739395888 |
| 21 | NLLSModel (Specialized) | 17375.0 | 0 | 0 | 1.4959333e7 | 0 | 0 |
| 21 | Manifolds | 70167.0 | 0 | 0 | 1.3712458e7 | 0 | 0 |
| 24 | NLLSModel (ManifoldVar) | 93167.0 | 1200 | 153600 | 2.09906875e8 | 1328700 | 1758768000 |
| 24 | NLLSModel (Specialized) | 28417.0 | 0 | 0 | 3.3374625e7 | 0 | 0 |
| 24 | Manifolds | 115166.0 | 0 | 0 | 3.1391667e7 | 0 | 0 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 2 | SecondOrderOptimization (LM) | 1395.5 | 23 | 1280 | 2 | 8.1148e-23 | true |
| 2 | SecondOrderOptimization (Dogleg) | 29875.0 | 23 | 1248 | 2 | 4.7446e-26 | false |
| 2 | Manopt (LevenbergMarquardt) | 13583.0 | 157 | 8640 | 3 | 2.1387e-33 | true |
| 3 | SecondOrderOptimization (LM) | 2084.0 | 23 | 1808 | 3 | 8.4115e-24 | true |
| 3 | SecondOrderOptimization (Dogleg) | 2187.5 | 23 | 1728 | 3 | 2.2306e-20 | true |
| 3 | Manopt (LevenbergMarquardt) | 20521.0 | 228 | 17744 | 4 | 8.1095e-33 | true |
| 4 | SecondOrderOptimization (LM) | 4104.5 | 23 | 3056 | 3 | 1.2985e-18 | true |
| 4 | SecondOrderOptimization (Dogleg) | 5875.0 | 23 | 2784 | 4 | 1.0775e-23 | true |
| 4 | Manopt (LevenbergMarquardt) | 57229.0 | 448 | 55600 | 4 | 1.7754e-32 | true |
| 5 | SecondOrderOptimization (LM) | 11875.0 | 23 | 5280 | 3 | 1.1876e-17 | true |
| 5 | SecondOrderOptimization (Dogleg) | 14458.5 | 23 | 4528 | 4 | 1.3610e-23 | true |
| 5 | Manopt (LevenbergMarquardt) | 104937.5 | 566 | 97264 | 5 | 2.1605e-31 | true |
| 6 | SecondOrderOptimization (LM) | 29708.5 | 23 | 9056 | 3 | 1.7633e-21 | true |
| 6 | SecondOrderOptimization (Dogleg) | 35312.5 | 23 | 7344 | 4 | 5.4526e-24 | true |
| 6 | Manopt (LevenbergMarquardt) | 132041.0 | 455 | 127312 | 4 | 7.8034e-32 | true |
| 8 | SecondOrderOptimization (LM) | 207521.0 | 41 | 42400 | 3 | 2.7388e-20 | true |
| 8 | SecondOrderOptimization (Dogleg) | 260124.5 | 37 | 28160 | 4 | 2.0570e-23 | true |
| 8 | Manopt (LevenbergMarquardt) | 368729.0 | 501 | 304640 | 4 | 5.2475e-31 | true |
| 10 | SecondOrderOptimization (LM) | 710104.5 | 41 | 91232 | 3 | 5.1714e-19 | true |
| 10 | SecondOrderOptimization (Dogleg) | 871354.0 | 37 | 58704 | 4 | 3.3281e-22 | true |
| 10 | Manopt (LevenbergMarquardt) | 1.274604e6 | 617 | 771728 | 5 | 4.9974e-31 | true |
| 12 | SecondOrderOptimization (LM) | 2.15175e6 | 41 | 258384 | 3 | 5.2405e-20 | true |
| 12 | SecondOrderOptimization (Dogleg) | 2.767396e6 | 37 | 160496 | 4 | 1.0925e-22 | true |
| 12 | Manopt (LevenbergMarquardt) | 3.358396e6 | 617 | 1704576 | 5 | 6.7433e-31 | true |
| 15 | SecondOrderOptimization (LM) | 8.4080835e6 | 65 | 529776 | 3 | 2.7564e-19 | true |
| 15 | SecondOrderOptimization (Dogleg) | 1.03720625e7 | 69 | 340320 | 4 | 3.9112e-21 | true |
| 15 | Manopt (LevenbergMarquardt) | 1.1556104e7 | 619 | 3828368 | 5 | 1.4513e-30 | true |
| 18 | SecondOrderOptimization (LM) | 2.3816417e7 | 74 | 1038432 | 3 | 3.0835e-21 | true |
| 18 | SecondOrderOptimization (Dogleg) | 2.9832125e7 | 81 | 655968 | 4 | 1.6985e-23 | true |
| 18 | Manopt (LevenbergMarquardt) | 3.32200005e7 | 726 | 8265664 | 5 | 1.8437e-30 | true |
| 21 | SecondOrderOptimization (LM) | 6.1532604e7 | 74 | 1871872 | 3 | 2.0541e-21 | true |
| 21 | SecondOrderOptimization (Dogleg) | 7.7134792e7 | 81 | 1163840 | 4 | 2.1128e-23 | true |
| 21 | Manopt (LevenbergMarquardt) | 8.13355e7 | 726 | 15872112 | 5 | 2.9298e-30 | true |
| 24 | SecondOrderOptimization (LM) | 1.400146255e8 | 79 | 3207728 | 3 | 4.6393e-20 | true |
| 24 | SecondOrderOptimization (Dogleg) | 1.719329585e8 | 98 | 1996688 | 5 | 3.7365e-30 | true |
| 24 | Manopt (LevenbergMarquardt) | 1.84156042e8 | 737 | 33348128 | 5 | 3.1988e-30 | true |
