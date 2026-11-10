# Benchmark Results: Procrustes on SO(d)

- **Category**: manifold
- **Scaling Metric**: Matrix Dimension d
- **Optimizer Target Model**: Manifolds
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-10T11:34:09
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 4aac5c9

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 2 | NLLSModel (ManifoldVar) | 338.92537313432837 | 13 | 496 | 1787.8181818181818 | 67 | 2912 |
| 2 | NLLSModel (Specialized) | 51.64835164835165 | 1 | 16 | 109.56613756613757 | 1 | 32 |
| 2 | Manifolds | 167.0 | 1 | 16 | 367.55357142857144 | 1 | 32 |
| 3 | NLLSModel (ManifoldVar) | 638.5 | 25 | 976 | 7500.0 | 277 | 15296 |
| 3 | NLLSModel (Specialized) | 73.50187265917603 | 1 | 16 | 292.0 | 3 | 96 |
| 3 | Manifolds | 281.3766233766234 | 1 | 16 | 878.5 | 1 | 32 |
| 4 | NLLSModel (ManifoldVar) | 1002.1 | 41 | 1936 | 24500.0 | 821 | 65312 |
| 4 | NLLSModel (Specialized) | 99.05454545454545 | 1 | 16 | 542.0 | 1 | 32 |
| 4 | Manifolds | 542.0 | 1 | 16 | 2412.0 | 1 | 32 |
| 5 | NLLSModel (ManifoldVar) | 1693.5 | 61 | 2896 | 55792.0 | 1951 | 199472 |
| 5 | NLLSModel (Specialized) | 147.72727272727272 | 1 | 16 | 2208.0 | 1 | 32 |
| 5 | Manifolds | 887.2941176470588 | 1 | 16 | 5437.5 | 1 | 32 |
| 6 | NLLSModel (ManifoldVar) | 2379.5555555555557 | 85 | 4720 | 126833.0 | 3991 | 559136 |
| 6 | NLLSModel (Specialized) | 241.8658536585366 | 1 | 16 | 6125.0 | 1 | 32 |
| 6 | Manifolds | 1505.9285714285713 | 1 | 16 | 13167.0 | 1 | 32 |
| 8 | NLLSModel (ManifoldVar) | 4266.8 | 145 | 9232 | 491334.0 | 12493 | 2693984 |
| 8 | NLLSModel (Specialized) | 515.2439024390244 | 1 | 16 | 48542.0 | 1 | 32 |
| 8 | Manifolds | 3611.1666666666665 | 1 | 16 | 49292.0 | 1 | 32 |
| 10 | NLLSModel (ManifoldVar) | 8083.0 | 221 | 15856 | 1.661333e6 | 30361 | 9966032 |
| 10 | NLLSModel (Specialized) | 1085.611111111111 | 1 | 16 | 166583.0 | 1 | 32 |
| 10 | Manifolds | 7334.0 | 1 | 16 | 183625.0 | 1 | 32 |
| 12 | NLLSModel (ManifoldVar) | 12292.0 | 313 | 24976 | 5.047709e6 | 62713 | 29270624 |
| 12 | NLLSModel (Specialized) | 1991.6 | 1 | 16 | 586458.0 | 1 | 32 |
| 12 | Manifolds | 11792.0 | 1 | 16 | 502875.0 | 1 | 32 |
| 15 | NLLSModel (ManifoldVar) | 25875.0 | 481 | 42256 | 1.9080084e7 | 152641 | 108441632 |
| 15 | NLLSModel (Specialized) | 4483.4 | 1 | 16 | 2.184333e6 | 1 | 32 |
| 15 | Manifolds | 25500.0 | 1 | 16 | 1.821375e6 | 1 | 32 |
| 18 | NLLSModel (ManifoldVar) | 37000.0 | 685 | 71152 | 5.6785e7 | 394498 | 329909648 |
| 18 | NLLSModel (Specialized) | 10375.0 | 1 | 16 | 6.040833e6 | 1 | 32 |
| 18 | Manifolds | 41958.0 | 1 | 16 | 5.549208e6 | 1 | 32 |
| 21 | NLLSModel (ManifoldVar) | 65000.0 | 925 | 103504 | 1.75816959e8 | 730423 | 739395920 |
| 21 | NLLSModel (Specialized) | 18958.0 | 1 | 16 | 1.5031792e7 | 1 | 32 |
| 21 | Manifolds | 70250.0 | 1 | 16 | 1.4172333e7 | 1 | 32 |
| 24 | NLLSModel (ManifoldVar) | 97958.0 | 1201 | 153616 | 2.29380917e8 | 1328701 | 1758768032 |
| 24 | NLLSModel (Specialized) | 29833.0 | 1 | 16 | 3.45725e7 | 1 | 32 |
| 24 | Manifolds | 118834.0 | 1 | 16 | 3.1865375e7 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 2 | SecondOrderOptimization (LM) | 1458.0 | 25 | 1376 | 2 | 8.1148e-23 | true |
| 2 | SecondOrderOptimization (Dogleg) | 1791.5 | 26 | 1344 | 2 | 4.7446e-26 | true |
| 2 | Manopt (LevenbergMarquardt) | 13417.0 | 157 | 8640 | 3 | 2.1387e-33 | true |
| 3 | SecondOrderOptimization (LM) | 2083.0 | 25 | 1952 | 3 | 8.4115e-24 | true |
| 3 | SecondOrderOptimization (Dogleg) | 22458.0 | 25 | 1840 | 1 | 2.6041e-05 | false |
| 3 | Manopt (LevenbergMarquardt) | 20083.0 | 228 | 17744 | 4 | 8.1095e-33 | true |
| 4 | SecondOrderOptimization (LM) | 3854.5 | 25 | 3232 | 3 | 1.2985e-18 | true |
| 4 | SecondOrderOptimization (Dogleg) | 4458.0 | 27 | 2944 | 3 | 1.2978e-18 | true |
| 4 | Manopt (LevenbergMarquardt) | 59521.0 | 448 | 55600 | 4 | 1.7754e-32 | true |
| 5 | SecondOrderOptimization (LM) | 11250.0 | 25 | 5520 | 3 | 1.1876e-17 | true |
| 5 | SecondOrderOptimization (Dogleg) | 27625.0 | 26 | 4704 | 2 | 2.0363e-08 | false |
| 5 | Manopt (LevenbergMarquardt) | 101312.5 | 566 | 97264 | 5 | 2.1605e-31 | true |
| 6 | SecondOrderOptimization (LM) | 28292.0 | 25 | 9392 | 3 | 1.7633e-21 | true |
| 6 | SecondOrderOptimization (Dogleg) | 29375.0 | 27 | 7584 | 3 | 1.7596e-21 | true |
| 6 | Manopt (LevenbergMarquardt) | 131541.0 | 455 | 127312 | 4 | 7.8034e-32 | true |
| 8 | SecondOrderOptimization (LM) | 213729.5 | 43 | 42512 | 3 | 2.7388e-20 | true |
| 8 | SecondOrderOptimization (Dogleg) | 217604.0 | 41 | 28288 | 3 | 2.7345e-20 | true |
| 8 | Manopt (LevenbergMarquardt) | 367562.5 | 501 | 304640 | 4 | 5.2475e-31 | true |
| 10 | SecondOrderOptimization (LM) | 706562.5 | 43 | 91344 | 3 | 5.1714e-19 | true |
| 10 | SecondOrderOptimization (Dogleg) | 705062.0 | 41 | 58832 | 3 | 5.1611e-19 | true |
| 10 | Manopt (LevenbergMarquardt) | 1.2964795e6 | 617 | 771728 | 5 | 4.9974e-31 | true |
| 12 | SecondOrderOptimization (LM) | 2.1668335e6 | 43 | 258496 | 3 | 5.2405e-20 | true |
| 12 | SecondOrderOptimization (Dogleg) | 1.1255e6 | 39 | 160592 | 1 | 5.4325e-04 | false |
| 12 | Manopt (LevenbergMarquardt) | 3.369021e6 | 617 | 1704576 | 5 | 6.7433e-31 | true |
| 15 | SecondOrderOptimization (LM) | 8.3454165e6 | 67 | 529760 | 3 | 2.7564e-19 | true |
| 15 | SecondOrderOptimization (Dogleg) | 4.091625e6 | 47 | 321040 | 1 | 1.1589e-03 | false |
| 15 | Manopt (LevenbergMarquardt) | 1.15375835e7 | 619 | 3828368 | 5 | 1.4513e-30 | true |
| 18 | SecondOrderOptimization (LM) | 2.41523335e7 | 76 | 1038544 | 3 | 3.0835e-21 | true |
| 18 | SecondOrderOptimization (Dogleg) | 1.8552833e7 | 62 | 636752 | 2 | 1.1527e-09 | false |
| 18 | Manopt (LevenbergMarquardt) | 3.3110625e7 | 726 | 8265664 | 5 | 1.8437e-30 | true |
| 21 | SecondOrderOptimization (LM) | 6.17720625e7 | 76 | 1871984 | 3 | 2.0541e-21 | true |
| 21 | SecondOrderOptimization (Dogleg) | 3.021e7 | 50 | 1130288 | 1 | 6.6971e-04 | false |
| 21 | Manopt (LevenbergMarquardt) | 8.4196458e7 | 726 | 15872112 | 5 | 2.9298e-30 | true |
| 24 | SecondOrderOptimization (LM) | 1.41691167e8 | 75 | 3198304 | 3 | 4.6393e-20 | true |
| 24 | SecondOrderOptimization (Dogleg) | 6.867625e7 | 50 | 1923824 | 1 | 9.9657e-04 | false |
| 24 | Manopt (LevenbergMarquardt) | 1.96571375e8 | 737 | 28285472 | 5 | 3.1988e-30 | true |
