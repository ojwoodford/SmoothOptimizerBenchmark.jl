# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-09T12:06:03
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: eba33b8

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 1074.578947368421 | 0 | 0 | 26125.0 | 185 | 79104 |
| 4 | BundleAdjustmentModels | 3465.3333333333335 | 0 | 0 | 54709.0 | 21 | 190832 |
| 8 | NLLSModel | 2129.2 | 0 | 0 | 34625.0 | 0 | 0 |
| 8 | BundleAdjustmentModels | 6903.0 | 0 | 0 | 111875.0 | 21 | 479488 |
| 12 | NLLSModel | 3944.5 | 0 | 0 | 68708.0 | 0 | 0 |
| 12 | BundleAdjustmentModels | 12459.0 | 0 | 0 | 237250.0 | 23 | 891744 |
| 16 | NLLSModel | 6903.0 | 0 | 0 | 119000.0 | 0 | 0 |
| 16 | BundleAdjustmentModels | 23417.0 | 0 | 0 | 381791.0 | 23 | 1551824 |
| 24 | NLLSModel | 15750.0 | 0 | 0 | 263542.0 | 0 | 0 |
| 24 | BundleAdjustmentModels | 50583.0 | 0 | 0 | 867083.0 | 23 | 3494016 |
| 32 | NLLSModel | 27583.0 | 0 | 0 | 491750.0 | 0 | 0 |
| 32 | BundleAdjustmentModels | 91000.0 | 0 | 0 | 1.529708e6 | 23 | 6132032 |
| 48 | NLLSModel | 65167.0 | 0 | 0 | 1.053125e6 | 0 | 0 |
| 48 | BundleAdjustmentModels | 204375.0 | 0 | 0 | 3.364125e6 | 23 | 13774576 |
| 64 | NLLSModel | 110458.0 | 0 | 0 | 1.889792e6 | 0 | 0 |
| 64 | BundleAdjustmentModels | 377250.0 | 0 | 0 | 7.02475e6 | 23 | 24445040 |
| 96 | NLLSModel | 268875.0 | 0 | 0 | 2.742292e6 | 3 | 3504 |
| 96 | BundleAdjustmentModels | 844542.0 | 0 | 0 | 1.6438917e7 | 24 | 54910000 |
| 128 | NLLSModel | 1.664542e6 | 0 | 0 | 7.1535e6 | 3 | 3504 |
| 128 | BundleAdjustmentModels | 2.437833e6 | 0 | 0 | 3.1335375e7 | 24 | 97566256 |
| 192 | NLLSModel | 1.104625e6 | 0 | 0 | 1.1877208e7 | 3 | 3504 |
| 192 | BundleAdjustmentModels | 3.605875e6 | 0 | 0 | 6.1914459e7 | 24 | 219452976 |
| 256 | NLLSModel | 1.786917e6 | 0 | 0 | 1.6710583e7 | 3 | 3504 |
| 256 | BundleAdjustmentModels | 6.792083e6 | 0 | 0 | 1.2071025e8 | 24 | 390060592 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 4 | SecondOrderOptimization (Sparse LM) | 881333.5 | 6550 | 2854608 | 5 | 1.6891e-23 | true |
| 4 | CaNNOLeS | 960479.0 | 188 | 306320 | 7 | 4.7517e-16 | true |
| 4 | JSOSolvers (trunk) | 6.02172208e8 | 359780 | 1188428656 | 25 | 6.8334e-14 | true |
| 4 | JSOSolvers (tron) | 5.058790209e9 | 3630139 | 11992520976 | 501 | 5.9770e-12 | false |
| 4 | Ipopt | 2.696063e6 | 632 | 2347072 | 8 | 4.0004e-15 | true |
| 4 | MadNLP | 1.4703125e6 | 827 | 2362448 | 7 | 4.7778e-13 | true |
| 8 | SecondOrderOptimization (Sparse LM) | 714583.0 | 211 | 637168 | 5 | 5.3025e-26 | true |
| 8 | CaNNOLeS | 1.757333e6 | 205 | 623136 | 6 | 3.4177e-16 | true |
| 8 | JSOSolvers (trunk) | 2.9325585209e10 | 10798466 | 71138337728 | 501 | 3.3699e-13 | false |
| 8 | JSOSolvers (tron) | 2.4289683875e10 | 8843893 | 58261488816 | 501 | 6.9254e-12 | false |
| 8 | Ipopt | 5.831958e6 | 766 | 6821744 | 10 | 1.4563e-14 | true |
| 8 | MadNLP | 2.748229e6 | 827 | 5363552 | 7 | 1.8327e-11 | true |
| 12 | SecondOrderOptimization (Sparse LM) | 1.422875e6 | 242 | 1069232 | 5 | 1.3397e-23 | true |
| 12 | CaNNOLeS | 3.4548535e6 | 219 | 1100064 | 6 | 8.4917e-16 | true |
| 12 | JSOSolvers (trunk) | 3.0000319625e10 | 6794026 | 80034594960 | 89 | 2.9859e-12 | false |
| 12 | JSOSolvers (tron) | 3.0001533708e10 | 6733799 | 79324269856 | 183 | 6.2432e-12 | false |
| 12 | Ipopt | 8.115771e6 | 740 | 11347760 | 9 | 5.4678e-14 | true |
| 12 | MadNLP | 3.550708e6 | 792 | 7375296 | 5 | 6.7695e-09 | true |
| 16 | SecondOrderOptimization (Sparse LM) | 2.759562e6 | 243 | 1773456 | 5 | 5.3040e-23 | true |
| 16 | CaNNOLeS | 6.160791e6 | 223 | 2104160 | 5 | 1.8425e-14 | true |
| 16 | JSOSolvers (trunk) | 3.0001542e10 | 3913758 | 76695677488 | 40 | 1.2956e-11 | false |
