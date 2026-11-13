# Benchmark Results: Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-13T01:42:07
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 520587c

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel (ManifoldVar) | 292.0 | 13 | 496 | 1464.7692307692307 | 67 | 2912 |
| 2 | NLLSModel (Specialized) | 21.93448275862069 | 1 | 16 | 76.0746887966805 | 1 | 32 |
| 2 | Manifolds | 92.20833333333333 | 1 | 16 | 308.75409836065575 | 1 | 32 |
| 3 | NLLSModel (ManifoldVar) | 584.0 | 25 | 976 | 5500.0 | 277 | 15296 |
| 3 | NLLSModel (Specialized) | 42.58435207823961 | 1 | 16 | 250.0 | 1 | 32 |
| 3 | Manifolds | 250.0 | 1 | 16 | 833.0 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 875.0 | 41 | 1936 | 15500.0 | 821 | 65312 |
| 4 | NLLSModel (Specialized) | 67.74475524475524 | 1 | 16 | 500.0 | 1 | 32 |
| 4 | Manifolds | 542.0 | 1 | 16 | 2195.9 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1291.0 | 61 | 2896 | 40333.0 | 1951 | 199472 |
| 5 | NLLSModel (Specialized) | 125.0 | 1 | 16 | 2100.0 | 1 | 32 |
| 5 | Manifolds | 894.9130434782609 | 1 | 16 | 5375.0 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2125.0 | 85 | 4720 | 104959.0 | 3991 | 559136 |
| 6 | NLLSModel (Specialized) | 209.59595959595958 | 1 | 16 | 5760.5 | 1 | 32 |
| 6 | Manifolds | 1413.8666666666666 | 1 | 16 | 12458.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 3847.3333333333335 | 145 | 9232 | 398208.0 | 12493 | 2693984 |
| 8 | NLLSModel (Specialized) | 492.9024390243902 | 1 | 16 | 49417.0 | 1 | 32 |
| 8 | Manifolds | 3486.0 | 1 | 16 | 49500.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 7750.0 | 221 | 15856 | 1.370625e6 | 30361 | 9966032 |
| 10 | NLLSModel (Specialized) | 1020.85 | 1 | 16 | 168708.0 | 1 | 32 |
| 10 | Manifolds | 6791.666666666667 | 1 | 16 | 171250.0 | 1 | 32 |
| 12 | NLLSModel (ManifoldVar) | 11167.0 | 313 | 24976 | 4.562e6 | 62713 | 29270624 |
| 12 | NLLSModel (Specialized) | 1962.1818181818182 | 1 | 16 | 524375.0 | 1 | 32 |
| 12 | Manifolds | 11750.0 | 1 | 16 | 486167.0 | 1 | 32 |
| 15 | NLLSModel (ManifoldVar) | 24542.0 | 481 | 42256 | 2.1692334e7 | 152641 | 108441632 |
| 15 | NLLSModel (Specialized) | 4483.4 | 1 | 16 | 2.011958e6 | 1 | 32 |
| 15 | Manifolds | 23584.0 | 1 | 16 | 1.785333e6 | 1 | 32 |
| 18 | NLLSModel (ManifoldVar) | 35542.0 | 685 | 71152 | 4.2252458e7 | 394498 | 329909648 |
| 18 | NLLSModel (Specialized) | 8958.0 | 1 | 16 | 5.781959e6 | 1 | 32 |
| 18 | Manifolds | 41875.0 | 1 | 16 | 4.149417e6 | 1 | 32 |
| 21 | NLLSModel (ManifoldVar) | 59042.0 | 925 | 103504 | 8.9631792e7 | 730423 | 739395920 |
| 21 | NLLSModel (Specialized) | 17667.0 | 1 | 16 | 1.6481416e7 | 1 | 32 |
| 21 | Manifolds | 70084.0 | 1 | 16 | 1.00975e7 | 1 | 32 |
| 23 | NLLSModel (ManifoldVar) | 77167.0 | 1105 | 132496 | 1.49099125e8 | 1120837 | 1429340000 |
| 23 | NLLSModel (Specialized) | 24916.0 | 1 | 16 | 2.3310542e7 | 1 | 32 |
| 23 | Manifolds | 99584.0 | 1 | 16 | 1.7188542e7 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 2 | SecondOrderOptimization (LM) | 1292.0 | 26 | 1424 | 2 | 8.1148e-23 | true |
| 2 | SecondOrderOptimization (Dogleg) | 1291.0 | 28 | 1472 | 2 | 4.7439e-26 | true |
| 2 | Manopt (LevenbergMarquardt) | 10584.0 | 157 | 8640 | 3 | 2.1387e-33 | true |
| 3 | SecondOrderOptimization (LM) | 1875.0 | 26 | 2016 | 3 | 8.4115e-24 | true |
| 3 | SecondOrderOptimization (Dogleg) | 1812.5 | 28 | 2096 | 3 | 8.4340e-24 | true |
| 3 | Manopt (LevenbergMarquardt) | 15958.0 | 228 | 17744 | 4 | 8.1095e-33 | true |
| 4 | SecondOrderOptimization (LM) | 3542.0 | 26 | 3280 | 3 | 1.2985e-18 | true |
| 4 | SecondOrderOptimization (Dogleg) | 3437.5 | 28 | 3424 | 3 | 1.2978e-18 | true |
| 4 | Manopt (LevenbergMarquardt) | 49958.0 | 448 | 55600 | 4 | 1.7754e-32 | true |
| 5 | SecondOrderOptimization (LM) | 10958.0 | 26 | 5584 | 3 | 1.1876e-17 | true |
| 5 | SecondOrderOptimization (Dogleg) | 11000.0 | 28 | 5792 | 3 | 1.1874e-17 | true |
| 5 | Manopt (LevenbergMarquardt) | 95708.0 | 566 | 97264 | 5 | 2.1605e-31 | true |
| 6 | SecondOrderOptimization (LM) | 26458.0 | 26 | 9440 | 3 | 1.7633e-21 | true |
| 6 | SecondOrderOptimization (Dogleg) | 26771.0 | 28 | 9712 | 3 | 1.7596e-21 | true |
| 6 | Manopt (LevenbergMarquardt) | 124146.0 | 455 | 127312 | 4 | 7.8034e-32 | true |
| 8 | SecondOrderOptimization (LM) | 211187.0 | 43 | 42512 | 3 | 2.7388e-20 | true |
| 8 | SecondOrderOptimization (Dogleg) | 211854.0 | 47 | 43104 | 3 | 2.7345e-20 | true |
| 8 | Manopt (LevenbergMarquardt) | 366458.0 | 501 | 304640 | 4 | 5.2475e-31 | true |
| 10 | SecondOrderOptimization (LM) | 702666.5 | 43 | 91344 | 3 | 5.1714e-19 | true |
| 10 | SecondOrderOptimization (Dogleg) | 703583.0 | 47 | 92224 | 3 | 5.1611e-19 | true |
| 10 | Manopt (LevenbergMarquardt) | 1.2602915e6 | 617 | 771728 | 5 | 4.9974e-31 | true |
| 12 | SecondOrderOptimization (LM) | 2.122292e6 | 43 | 258496 | 3 | 5.2405e-20 | true |
| 12 | SecondOrderOptimization (Dogleg) | 2.166437e6 | 47 | 259728 | 3 | 5.2212e-20 | true |
| 12 | Manopt (LevenbergMarquardt) | 3.248271e6 | 617 | 1704576 | 5 | 6.7433e-31 | true |
| 15 | SecondOrderOptimization (LM) | 8.677729e6 | 67 | 529760 | 3 | 2.7564e-19 | true |
| 15 | SecondOrderOptimization (Dogleg) | 8.746854e6 | 71 | 531632 | 3 | 2.7482e-19 | true |
| 15 | Manopt (LevenbergMarquardt) | 1.11155e7 | 619 | 3828368 | 5 | 1.4513e-30 | true |
| 18 | SecondOrderOptimization (LM) | 2.4919271e7 | 76 | 1038544 | 3 | 3.0835e-21 | true |
| 18 | SecondOrderOptimization (Dogleg) | 2.4966042e7 | 80 | 1041120 | 3 | 3.0744e-21 | true |
| 18 | Manopt (LevenbergMarquardt) | 2.6273084e7 | 726 | 8265664 | 5 | 1.9048e-30 | true |
| 21 | SecondOrderOptimization (LM) | 6.4405458e7 | 76 | 1871984 | 3 | 2.0541e-21 | true |
| 21 | SecondOrderOptimization (Dogleg) | 6.11476245e7 | 80 | 1875680 | 3 | 2.0437e-21 | true |
| 21 | Manopt (LevenbergMarquardt) | 6.3518667e7 | 726 | 15872112 | 5 | 2.6825e-30 | true |
| 23 | SecondOrderOptimization (LM) | 9.5001333e7 | 81 | 2711152 | 3 | 2.3479e-21 | true |
| 23 | SecondOrderOptimization (Dogleg) | 9.3996125e7 | 87 | 2715392 | 3 | 2.3394e-21 | true |
| 23 | Manopt (LevenbergMarquardt) | 1.0678075e8 | 737 | 23756992 | 5 | 3.1170e-30 | true |
