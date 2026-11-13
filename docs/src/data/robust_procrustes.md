# Benchmark Results: Robust Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-13T20:50:22
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 36c309e

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 3 | NLLSModel (ManifoldVar) | 533.5806451612904 | 25 | 976 | 5416.0 | 253 | 13952 |
| 3 | NLLSModel (Specialized) | 43.50122249388753 | 1 | 16 | 314.5833333333333 | 1 | 32 |
| 3 | Manifolds | 329.2295081967213 | 1 | 16 | 1411.1333333333334 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 936.6086956521739 | 41 | 1936 | 14167.0 | 781 | 60352 |
| 4 | NLLSModel (Specialized) | 69.82870370370371 | 1 | 16 | 742.5714285714286 | 1 | 32 |
| 4 | Manifolds | 364.98148148148147 | 1 | 16 | 5000.0 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1269.2307692307693 | 61 | 2896 | 38541.0 | 1891 | 183152 |
| 5 | NLLSModel (Specialized) | 125.0 | 1 | 16 | 2802.0 | 1 | 32 |
| 5 | Manifolds | 642.6666666666666 | 1 | 16 | 12459.0 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2180.5555555555557 | 85 | 4720 | 91667.0 | 3907 | 511760 |
| 6 | NLLSModel (Specialized) | 218.010101010101 | 1 | 16 | 8875.0 | 1 | 32 |
| 6 | Manifolds | 1631.3846153846155 | 1 | 16 | 25375.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 3937.5 | 145 | 9232 | 342875.0 | 12313 | 2422688 |
| 8 | NLLSModel (Specialized) | 531.7380952380952 | 1 | 16 | 35917.0 | 1 | 32 |
| 8 | Manifolds | 2765.625 | 1 | 16 | 89833.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 8291.0 | 221 | 15856 | 1.231167e6 | 30086 | 9036752 |
| 10 | NLLSModel (Specialized) | 1129.421052631579 | 1 | 16 | 137500.0 | 1 | 32 |
| 10 | Manifolds | 6083.25 | 1 | 16 | 299542.0 | 1 | 32 |
| 13 | NLLSModel (ManifoldVar) | 14833.0 | 365 | 29136 | 7.910667e6 | 85814 | 40757840 |
| 13 | NLLSModel (Specialized) | 3321.4285714285716 | 1 | 16 | 870375.0 | 1 | 32 |
| 13 | Manifolds | 10541.0 | 1 | 16 | 1.341208e6 | 1 | 32 |
| 16 | NLLSModel (ManifoldVar) | 24625.0 | 545 | 52240 | 2.407225e7 | 245753 | 129717920 |
| 16 | NLLSModel (Specialized) | 6593.75 | 1 | 16 | 3.847292e6 | 1 | 32 |
| 16 | Manifolds | 20416.0 | 1 | 16 | 4.234292e6 | 1 | 32 |
| 20 | NLLSModel (ManifoldVar) | 53791.0 | 841 | 94096 | 9.7128291e7 | 599971 | 529841792 |
| 20 | NLLSModel (Specialized) | 15167.0 | 1 | 16 | 1.78845e7 | 1 | 32 |
| 20 | Manifolds | 42416.0 | 1 | 16 | 2.1798875e7 | 1 | 32 |
| 26 | NLLSModel (ManifoldVar) | 106917.0 | 1405 | 190960 | 3.00860125e8 | 1827658 | 2578777376 |
| 26 | NLLSModel (Specialized) | 43417.0 | 1 | 16 | 9.8295583e7 | 1 | 32 |
| 26 | Manifolds | 94375.0 | 1 | 16 | 9.3193042e7 | 1 | 32 |
| 32 | NLLSModel (ManifoldVar) | 136084.0 | 2113 | 337936 | 4.88489833e8 | 4193908 | 7825661856 |
| 32 | NLLSModel (Specialized) | 93458.0 | 1 | 16 | 4.02496208e8 | 1 | 32 |
| 32 | Manifolds | 119708.0 | 1 | 16 | 3.46354625e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 3 | SecondOrderOptimization (LM) | 10104.0 | 31 | 2480 | 22 | 3.7711e-06 | true |
| 3 | SecondOrderOptimization (Dogleg) | 10042.0 | 33 | 2560 | 22 | 3.7711e-06 | true |
| 3 | Manopt (LevenbergMarquardt) | 514562.5 | 8166 | 450960 | 26 | 3.7711e-06 | true |
| 4 | SecondOrderOptimization (LM) | 13583.0 | 31 | 3808 | 12 | 3.9226e-06 | true |
| 4 | SecondOrderOptimization (Dogleg) | 13333.5 | 33 | 3952 | 12 | 3.9226e-06 | true |
| 4 | Manopt (LevenbergMarquardt) | 582020.5 | 8316 | 604992 | 14 | 3.9226e-06 | true |
| 5 | SecondOrderOptimization (LM) | 47416.5 | 31 | 6176 | 14 | 3.9226e-06 | true |
| 5 | SecondOrderOptimization (Dogleg) | 47791.5 | 33 | 6384 | 14 | 3.9226e-06 | true |
| 5 | Manopt (LevenbergMarquardt) | 662041.5 | 8913 | 748272 | 11 | 3.9226e-06 | true |
| 6 | SecondOrderOptimization (LM) | 143688.0 | 31 | 10128 | 14 | 3.9226e-06 | true |
| 6 | SecondOrderOptimization (Dogleg) | 144042.0 | 33 | 10400 | 14 | 3.9226e-06 | true |
| 6 | Manopt (LevenbergMarquardt) | 959354.0 | 11882 | 1302720 | 12 | 3.9226e-06 | true |
| 8 | SecondOrderOptimization (LM) | 589124.5 | 48 | 43440 | 14 | 3.9226e-06 | true |
| 8 | SecondOrderOptimization (Dogleg) | 586688.0 | 52 | 44032 | 14 | 3.9226e-06 | true |
| 8 | Manopt (LevenbergMarquardt) | 1.7044375e6 | 16685 | 2713440 | 11 | 3.9226e-06 | true |
| 10 | SecondOrderOptimization (LM) | 2.4058335e6 | 48 | 92544 | 15 | 3.9226e-06 | true |
| 10 | SecondOrderOptimization (Dogleg) | 2.334125e6 | 52 | 93424 | 15 | 3.9226e-06 | true |
| 10 | Manopt (LevenbergMarquardt) | 4.328479e6 | 23789 | 5906384 | 11 | 3.9226e-06 | true |
| 13 | SecondOrderOptimization (LM) | 1.3456916e7 | 48 | 262256 | 14 | 3.9226e-06 | true |
| 13 | SecondOrderOptimization (Dogleg) | 1.33047085e7 | 52 | 263680 | 14 | 3.9226e-06 | true |
| 13 | Manopt (LevenbergMarquardt) | 1.22794165e7 | 34094 | 13706272 | 10 | 3.9226e-06 | true |
| 16 | SecondOrderOptimization (LM) | 6.15571045e7 | 213 | 778160 | 15 | 3.9226e-06 | true |
| 16 | SecondOrderOptimization (Dogleg) | 6.181375e7 | 217 | 780256 | 15 | 3.9226e-06 | true |
| 16 | Manopt (LevenbergMarquardt) | 4.70705625e7 | 58112 | 29763616 | 10 | 3.9226e-06 | true |
| 20 | SecondOrderOptimization (LM) | 3.12226604e8 | 258 | 1734256 | 15 | 3.9226e-06 | true |
| 20 | SecondOrderOptimization (Dogleg) | 3.10067479e8 | 262 | 1737600 | 15 | 3.9226e-06 | true |
| 20 | Manopt (LevenbergMarquardt) | 1.46396687e8 | 87786 | 76374560 | 10 | 3.9226e-06 | true |
| 26 | SecondOrderOptimization (LM) | 1.551621458e9 | 263 | 4698752 | 15 | 3.9226e-06 | true |
| 26 | SecondOrderOptimization (Dogleg) | 1.566344583e9 | 269 | 4705040 | 15 | 3.9226e-06 | true |
| 26 | Manopt (LevenbergMarquardt) | 6.427743755e8 | 134392 | 213252912 | 9 | 3.9226e-06 | true |
| 32 | SecondOrderOptimization (LM) | 2.011144417e9 | 374 | 28360768 | 14 | 3.9226e-06 | true |
| 32 | SecondOrderOptimization (Dogleg) | 1.911464625e9 | 380 | 28369104 | 14 | 3.9226e-06 | true |
| 32 | Manopt (LevenbergMarquardt) | 2.129885542e9 | 241841 | 513695024 | 11 | 3.9226e-06 | true |
