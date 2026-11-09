# Benchmark Results: Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-09T20:12:02
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 5a66143

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel (ManifoldVar) | 179.30327868852459 | 12 | 480 | 1294.4666666666667 | 66 | 2880 |
| 2 | NLLSModel (Specialized) | 6.084 | 0 | 0 | 65.62768031189084 | 0 | 0 |
| 2 | Manifolds | 69.95652173913044 | 0 | 0 | 285.63157894736844 | 0 | 0 |
| 3 | NLLSModel (ManifoldVar) | 481.14285714285717 | 24 | 960 | 5208.25 | 276 | 15264 |
| 3 | NLLSModel (Specialized) | 29.003896103896103 | 0 | 0 | 219.6601941747573 | 2 | 64 |
| 3 | Manifolds | 203.23469387755102 | 0 | 0 | 729.1785714285714 | 0 | 0 |
| 4 | NLLSModel (ManifoldVar) | 641.304347826087 | 40 | 1920 | 15542.0 | 820 | 65280 |
| 4 | NLLSModel (Specialized) | 55.36657681940701 | 0 | 0 | 423.74468085106383 | 0 | 0 |
| 4 | Manifolds | 427.0833333333333 | 0 | 0 | 2179.2 | 0 | 0 |
| 5 | NLLSModel (ManifoldVar) | 988.0952380952381 | 60 | 2880 | 42167.0 | 1950 | 199440 |
| 5 | NLLSModel (Specialized) | 113.7720207253886 | 0 | 0 | 2133.3 | 0 | 0 |
| 5 | Manifolds | 871.5416666666666 | 0 | 0 | 5291.75 | 0 | 0 |
| 6 | NLLSModel (ManifoldVar) | 1924.2727272727273 | 84 | 4704 | 107959.0 | 3990 | 559104 |
| 6 | NLLSModel (Specialized) | 191.74757281553397 | 0 | 0 | 5698.0 | 0 | 0 |
| 6 | Manifolds | 1427.8 | 0 | 0 | 12542.0 | 0 | 0 |
| 8 | NLLSModel (ManifoldVar) | 3714.285714285714 | 144 | 9216 | 373583.0 | 12492 | 2693952 |
| 8 | NLLSModel (Specialized) | 479.6585365853659 | 0 | 0 | 49083.0 | 0 | 0 |
| 8 | Manifolds | 3458.3333333333335 | 0 | 0 | 50834.0 | 0 | 0 |
| 10 | NLLSModel (ManifoldVar) | 7208.333333333333 | 220 | 15840 | 1.332625e6 | 30360 | 9966000 |
| 10 | NLLSModel (Specialized) | 991.65 | 0 | 0 | 169541.0 | 0 | 0 |
| 10 | Manifolds | 6764.0 | 0 | 0 | 170708.0 | 0 | 0 |
| 12 | NLLSModel (ManifoldVar) | 10458.0 | 312 | 24960 | 4.77725e6 | 62712 | 29270592 |
| 12 | NLLSModel (Specialized) | 1924.2727272727273 | 0 | 0 | 536292.0 | 0 | 0 |
| 12 | Manifolds | 11708.0 | 0 | 0 | 485833.0 | 0 | 0 |
| 15 | NLLSModel (ManifoldVar) | 23375.0 | 480 | 42240 | 1.9426375e7 | 152640 | 108441600 |
| 15 | NLLSModel (Specialized) | 5100.0 | 0 | 0 | 2.039291e6 | 0 | 0 |
| 15 | Manifolds | 24500.0 | 0 | 0 | 1.83675e6 | 0 | 0 |
| 18 | NLLSModel (ManifoldVar) | 33375.0 | 684 | 71136 | 7.2178458e7 | 394497 | 329909616 |
| 18 | NLLSModel (Specialized) | 8889.0 | 0 | 0 | 5.971959e6 | 0 | 0 |
| 18 | Manifolds | 43208.0 | 0 | 0 | 5.588916e6 | 0 | 0 |
| 21 | NLLSModel (ManifoldVar) | 58250.0 | 924 | 103488 | 1.86615917e8 | 730422 | 739395888 |
| 21 | NLLSModel (Specialized) | 17292.0 | 0 | 0 | 1.4773375e7 | 0 | 0 |
| 21 | Manifolds | 74916.0 | 0 | 0 | 1.3677833e7 | 0 | 0 |
| 24 | NLLSModel (ManifoldVar) | 86750.0 | 1200 | 153600 | 2.293005e8 | 1328700 | 1758768000 |
| 24 | NLLSModel (Specialized) | 28583.0 | 0 | 0 | 3.4669042e7 | 0 | 0 |
| 24 | Manifolds | 114750.0 | 0 | 0 | 3.1366375e7 | 0 | 0 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 2 | SecondOrderOptimization (LM) | 1250.0 | 25 | 1376 | 2 | 8.1148e-23 | true |
| 2 | SecondOrderOptimization (Dogleg) | 19166.0 | 26 | 1344 | 2 | 4.7446e-26 | false |
| 2 | Manopt (LevenbergMarquardt) | 10083.0 | 157 | 8640 | 3 | 2.1387e-33 | true |
| 3 | SecondOrderOptimization (LM) | 1854.0 | 25 | 1952 | 3 | 8.4115e-24 | true |
| 3 | SecondOrderOptimization (Dogleg) | 16834.0 | 27 | 1872 | 3 | 8.4340e-24 | false |
| 3 | Manopt (LevenbergMarquardt) | 16791.0 | 228 | 17744 | 4 | 8.1095e-33 | true |
| 4 | SecondOrderOptimization (LM) | 3541.5 | 25 | 3232 | 3 | 1.2985e-18 | true |
| 4 | SecondOrderOptimization (Dogleg) | 4270.5 | 27 | 2944 | 3 | 1.2978e-18 | true |
| 4 | Manopt (LevenbergMarquardt) | 49854.5 | 448 | 55600 | 4 | 1.7754e-32 | true |
| 5 | SecondOrderOptimization (LM) | 11250.0 | 25 | 5520 | 3 | 1.1876e-17 | true |
| 5 | SecondOrderOptimization (Dogleg) | 12291.0 | 27 | 4720 | 3 | 1.1874e-17 | true |
| 5 | Manopt (LevenbergMarquardt) | 101500.5 | 566 | 97264 | 5 | 2.1605e-31 | true |
| 6 | SecondOrderOptimization (LM) | 26770.5 | 25 | 9392 | 3 | 1.7633e-21 | true |
| 6 | SecondOrderOptimization (Dogleg) | 27437.5 | 27 | 7584 | 3 | 1.7596e-21 | true |
| 6 | Manopt (LevenbergMarquardt) | 124583.0 | 455 | 127312 | 4 | 7.8034e-32 | true |
| 8 | SecondOrderOptimization (LM) | 210083.5 | 43 | 42512 | 3 | 2.7388e-20 | true |
| 8 | SecondOrderOptimization (Dogleg) | 212875.0 | 41 | 28288 | 3 | 2.7345e-20 | true |
| 8 | Manopt (LevenbergMarquardt) | 352229.5 | 501 | 304640 | 4 | 5.2475e-31 | true |
| 10 | SecondOrderOptimization (LM) | 704292.0 | 43 | 91344 | 3 | 5.1714e-19 | true |
| 10 | SecondOrderOptimization (Dogleg) | 729354.5 | 41 | 58832 | 3 | 5.1611e-19 | true |
| 10 | Manopt (LevenbergMarquardt) | 1.256625e6 | 617 | 771728 | 5 | 4.9974e-31 | true |
| 12 | SecondOrderOptimization (LM) | 2.207667e6 | 43 | 258496 | 3 | 5.2405e-20 | true |
| 12 | SecondOrderOptimization (Dogleg) | 2.1919165e6 | 41 | 160624 | 3 | 5.2212e-20 | true |
| 12 | Manopt (LevenbergMarquardt) | 3.3621875e6 | 617 | 1704576 | 5 | 6.7433e-31 | true |
| 15 | SecondOrderOptimization (LM) | 8.328584e6 | 67 | 529760 | 3 | 2.7564e-19 | true |
| 15 | SecondOrderOptimization (Dogleg) | 8.5079585e6 | 65 | 333904 | 3 | 2.7482e-19 | true |
| 15 | Manopt (LevenbergMarquardt) | 1.1479854e7 | 619 | 3828368 | 5 | 1.4513e-30 | true |
| 18 | SecondOrderOptimization (LM) | 2.40943545e7 | 76 | 1038544 | 3 | 3.0835e-21 | true |
| 18 | SecondOrderOptimization (Dogleg) | 2.3918e7 | 74 | 646432 | 3 | 3.0744e-21 | true |
| 18 | Manopt (LevenbergMarquardt) | 3.30565835e7 | 726 | 8265664 | 5 | 1.8437e-30 | true |
| 21 | SecondOrderOptimization (LM) | 6.16550835e7 | 76 | 1871984 | 3 | 2.0541e-21 | true |
| 21 | SecondOrderOptimization (Dogleg) | 6.1249917e7 | 74 | 1152752 | 3 | 2.0437e-21 | true |
| 21 | Manopt (LevenbergMarquardt) | 8.1516625e7 | 726 | 15872112 | 5 | 2.9298e-30 | true |
| 24 | SecondOrderOptimization (LM) | 1.389086875e8 | 75 | 3198304 | 3 | 4.6393e-20 | true |
| 24 | SecondOrderOptimization (Dogleg) | 1.39270354e8 | 74 | 1955568 | 3 | 4.6256e-20 | true |
| 24 | Manopt (LevenbergMarquardt) | 1.86520125e8 | 737 | 33348128 | 5 | 3.1988e-30 | true |
