# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-09T20:13:40
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 5a66143

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 1180.5555555555557 | 1 | 16 | 19916.0 | 0 | 0 |
| 4 | BundleAdjustmentModels | 5225.0 | 0 | 0 | 54666.0 | 21 | 190832 |
| 8 | NLLSModel | 2342.5555555555557 | 1 | 16 | 39917.0 | 0 | 0 |
| 8 | BundleAdjustmentModels | 10458.0 | 0 | 0 | 118000.0 | 21 | 479488 |
| 12 | NLLSModel | 3895.8333333333335 | 1 | 16 | 69667.0 | 0 | 0 |
| 12 | BundleAdjustmentModels | 17667.0 | 0 | 0 | 229792.0 | 23 | 891744 |
| 16 | NLLSModel | 6861.333333333333 | 1 | 16 | 125791.0 | 0 | 0 |
| 16 | BundleAdjustmentModels | 33167.0 | 0 | 0 | 394000.0 | 23 | 1551824 |
| 24 | NLLSModel | 15334.0 | 1 | 16 | 297625.0 | 0 | 0 |
| 24 | BundleAdjustmentModels | 73125.0 | 0 | 0 | 857875.0 | 23 | 3494016 |
| 32 | NLLSModel | 27125.0 | 1 | 16 | 487500.0 | 0 | 0 |
| 32 | BundleAdjustmentModels | 125417.0 | 0 | 0 | 1.603542e6 | 23 | 6132032 |
| 48 | NLLSModel | 63209.0 | 1 | 16 | 1.152875e6 | 0 | 0 |
| 48 | BundleAdjustmentModels | 282125.0 | 0 | 0 | 3.652166e6 | 23 | 13774576 |
| 64 | NLLSModel | 114917.0 | 1 | 16 | 2.024542e6 | 0 | 0 |
| 64 | BundleAdjustmentModels | 511042.0 | 0 | 0 | 6.349208e6 | 23 | 24445040 |
| 96 | NLLSModel | 250958.0 | 1 | 16 | 2.83625e6 | 5 | 6544 |
| 96 | BundleAdjustmentModels | 1.203417e6 | 0 | 0 | 1.4719167e7 | 24 | 54910000 |
| 128 | NLLSModel | 433458.0 | 1 | 16 | 3.040875e6 | 5 | 6544 |
| 128 | BundleAdjustmentModels | 2.071833e6 | 0 | 0 | 2.6384e7 | 24 | 97566256 |
| 192 | NLLSModel | 1.035625e6 | 1 | 16 | 9.604958e6 | 5 | 6544 |
| 192 | BundleAdjustmentModels | 4.792709e6 | 0 | 0 | 6.0989875e7 | 24 | 219452976 |
| 256 | NLLSModel | 1.807875e6 | 1 | 16 | 1.6112042e7 | 5 | 6544 |
| 256 | BundleAdjustmentModels | 8.467834e6 | 0 | 0 | 1.10394292e8 | 24 | 390060592 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 4 | SecondOrderOptimization (Sparse LM) | 894916.5 | 5453 | 2380656 | 5 | 1.6891e-23 | true |
| 4 | SecondOrderOptimization (Sparse Dogleg) | 1.047417e6 | 6515 | 2604720 | 6 | 1.8017e-26 | true |
| 4 | CaNNOLeS | 955021.0 | 191 | 359056 | 7 | 4.7517e-16 | true |
| 4 | JSOSolvers (trunk) | 6.06651729e8 | 359780 | 1188428656 | 25 | 6.8334e-14 | true |
| 4 | JSOSolvers (tron) | 6.261256583e9 | 3630139 | 11992520976 | 501 | 5.9770e-12 | false |
| 4 | Ipopt | 2.9918125e6 | 632 | 2347072 | 8 | 4.0004e-15 | true |
| 4 | MadNLP | 1.5513955e6 | 827 | 2362448 | 7 | 4.7778e-13 | true |
| 8 | SecondOrderOptimization (Sparse LM) | 750687.0 | 228 | 722528 | 5 | 5.3025e-26 | true |
| 8 | SecondOrderOptimization (Sparse Dogleg) | 937521.0 | 230 | 655280 | 7 | 4.2491e-26 | true |
| 8 | CaNNOLeS | 1.7494585e6 | 208 | 712224 | 6 | 3.4177e-16 | true |
| 8 | JSOSolvers (trunk) | 3.0000165209e10 | 8863025 | 58387939152 | 198 | 5.0009e-13 | false |
| 8 | JSOSolvers (tron) | 2.9758894541e10 | 8843893 | 58261488816 | 501 | 6.9254e-12 | false |
| 8 | Ipopt | 5.439583e6 | 766 | 6821744 | 10 | 1.4563e-14 | true |
| 8 | MadNLP | 2.8238125e6 | 827 | 5363552 | 7 | 1.8327e-11 | true |
| 12 | SecondOrderOptimization (Sparse LM) | 1.4656665e6 | 259 | 1222000 | 5 | 1.3397e-23 | true |
| 12 | SecondOrderOptimization (Sparse Dogleg) | 1.475958e6 | 257 | 1104592 | 5 | 8.6010e-26 | true |
| 12 | CaNNOLeS | 3.46725e6 | 222 | 1259808 | 6 | 8.4917e-16 | true |
| 12 | JSOSolvers (trunk) | 3.0000401083e10 | 6500926 | 76581798800 | 85 | 3.1642e-12 | false |
| 12 | JSOSolvers (tron) | 3.0001294458e10 | 6522779 | 76838397984 | 174 | 6.5377e-12 | false |
| 12 | Ipopt | 8.173875e6 | 740 | 11347760 | 9 | 5.4678e-14 | true |
| 12 | MadNLP | 3.5406875e6 | 792 | 7375296 | 5 | 6.7695e-09 | true |
| 16 | SecondOrderOptimization (Sparse LM) | 2.8486255e6 | 260 | 2025360 | 5 | 5.3040e-23 | true |
| 16 | SecondOrderOptimization (Sparse Dogleg) | 2.718604e6 | 258 | 1825520 | 5 | 1.8070e-13 | true |
| 16 | CaNNOLeS | 6.0330835e6 | 226 | 2370400 | 5 | 1.8425e-14 | true |
| 16 | JSOSolvers (trunk) | 3.0000905541e10 | 3784848 | 74169454000 | 39 | 1.4345e-11 | false |
| 16 | JSOSolvers (tron) | 3.0002683125e10 | 3859799 | 75636893488 | 53 | 1.4382e-11 | false |
| 16 | Ipopt | 1.257975e7 | 740 | 19373856 | 9 | 2.8960e-14 | true |
| 16 | MadNLP | 6.68425e6 | 833 | 14585168 | 6 | 2.3365e-10 | true |
| 24 | SecondOrderOptimization (Sparse LM) | 7.447792e6 | 260 | 4188528 | 5 | 4.2566e-24 | true |
| 24 | SecondOrderOptimization (Sparse Dogleg) | 1.0193229e7 | 262 | 3773712 | 7 | 1.0939e-24 | true |
| 24 | CaNNOLeS | 1.3901e7 | 228 | 4834176 | 5 | 1.9298e-17 | true |
| 24 | JSOSolvers (trunk) | 3.0001136291e10 | 1717100 | 73647940432 | 18 | 1.2643e-10 | false |
| 24 | JSOSolvers (tron) | 3.0008759041e10 | 1725089 | 73987705024 | 13 | 5.1898e-10 | false |
| 24 | Ipopt | 3.4868584e7 | 882 | 52291856 | 11 | 6.0972e-16 | true |
| 24 | MadNLP | 1.666525e7 | 845 | 32202736 | 6 | 1.3226e-10 | true |
| 32 | SecondOrderOptimization (Sparse LM) | 1.70959375e7 | 265 | 7200736 | 5 | 3.1475e-23 | true |
| 32 | SecondOrderOptimization (Sparse Dogleg) | 1.2756667e7 | 262 | 6489904 | 4 | 4.8220e-13 | true |
| 32 | CaNNOLeS | 3.4171146e7 | 228 | 8092544 | 4 | 1.6044e-17 | true |
| 32 | JSOSolvers (trunk) | 3.0002012542e10 | 968120 | 67989151824 | 14 | 1.5646e-09 | false |
| 32 | JSOSolvers (tron) | 3.0014849375e10 | 975269 | 68486476768 | 5 | 1.7011e-09 | false |
| 32 | Ipopt | 4.78884165e7 | 740 | 74536464 | 9 | 1.3067e-14 | true |
| 32 | MadNLP | 3.0493125e7 | 886 | 63895632 | 7 | 2.1740e-11 | true |
| 48 | SecondOrderOptimization (Sparse LM) | 4.22106045e7 | 286 | 15706160 | 5 | 2.2597e-23 | true |
| 48 | SecondOrderOptimization (Sparse Dogleg) | 8.173725e7 | 290 | 14139376 | 10 | 1.6889e-23 | true |
| 48 | CaNNOLeS | 8.8795209e7 | 228 | 18045824 | 4 | 1.8343e-18 | true |
| 48 | JSOSolvers (trunk) | 3.00067255e10 | 425480 | 67906600016 | 14 | 1.3295e-04 | false |
| 48 | JSOSolvers (tron) | 3.0018967584e10 | 424559 | 67748708240 | 2 | 1.5868e-04 | false |
| 48 | Ipopt | 2.540538335e8 | 1542 | 351228544 | 19 | 1.4722e-23 | true |
| 48 | MadNLP | 9.15983335e7 | 804 | 105275120 | 5 | 2.7168e-08 | true |
| 64 | SecondOrderOptimization (Sparse LM) | 1.079682705e8 | 286 | 29368432 | 6 | 5.5840e-23 | true |
| 64 | SecondOrderOptimization (Sparse Dogleg) | 1.58868833e8 | 288 | 26636304 | 9 | 5.3784e-23 | true |
| 64 | CaNNOLeS | 1.83139791e8 | 228 | 40147840 | 4 | 1.0359e-19 | true |
| 64 | JSOSolvers (trunk) | 3.0010937166e10 | 246110 | 68884928720 | 9 | 5.4490e-01 | false |
| 64 | JSOSolvers (tron) | 3.0042874959e10 | 239579 | 67037229248 | 1 | 1.7978e+01 | false |
| 64 | Ipopt | 7.050139795e8 | 1510 | 620748800 | 19 | 4.8607e-23 | true |
| 64 | MadNLP | 1.91150042e8 | 804 | 185804832 | 5 | 1.6882e-08 | true |
| 96 | SecondOrderOptimization (Sparse LM) | 3.72454042e8 | 369 | 113050432 | 7 | 2.6206e-22 | true |
| 96 | SecondOrderOptimization (Sparse Dogleg) | 4.27345542e8 | 370 | 99824336 | 8 | 1.8832e-05 | true |
| 96 | CaNNOLeS | 5.673568755e8 | 228 | 74685312 | 4 | 1.6285e-21 | true |
| 96 | JSOSolvers (trunk) | 3.0030037209e10 | 98210 | 61754313680 | 5 | 5.1309e+03 | false |
| 96 | JSOSolvers (tron) | 3.0100220583e10 | 99389 | 62359209648 | 1 | 4.6327e+03 | false |
| 96 | Ipopt | 4.075725167e9 | 2149 | 1903495824 | 26 | 2.4973e-22 | true |
| 96 | MadNLP | 7.481755e8 | 893 | 563412528 | 7 | 3.6600e-08 | true |
| 128 | SecondOrderOptimization (Sparse LM) | 1.021044708e9 | 374 | 162251952 | 8 | 8.0697e-22 | true |
| 128 | SecondOrderOptimization (Sparse Dogleg) | 2.977011959e9 | 467 | 151577792 | 24 | 4.1903e-02 | true |
| 128 | CaNNOLeS | 1.147065541e9 | 228 | 178346880 | 4 | 2.8962e-21 | true |
| 128 | JSOSolvers (trunk) | 3.0037814042e10 | 54530 | 60927054800 | 5 | 1.2156e+05 | false |
| 128 | JSOSolvers (tron) | 3.0209466625e10 | 55319 | 61597990560 | 1 | 1.2806e+05 | false |
| 128 | Ipopt | 4.508301792e9 | 2257 | 3377587760 | 26 | 7.4245e-22 | true |
| 128 | MadNLP | 1.766474875e9 | 935 | 1174597584 | 8 | 1.3112e-07 | true |
| 192 | SecondOrderOptimization (Sparse LM) | 3.706976292e9 | 379 | 458732256 | 9 | 2.2981e-18 | true |
| 192 | SecondOrderOptimization (Sparse Dogleg) | 1.5870295417e10 | 556 | 429316528 | 39 | 6.1440e+00 | true |
| 192 | CaNNOLeS | 3.748666292e9 | 228 | 325114752 | 4 | 4.2749e-21 | true |
| 192 | JSOSolvers (trunk) | 3.0099395958e10 | 24050 | 61562951632 | 3 | 1.5778e+06 | false |
| 192 | JSOSolvers (tron) | 3.0459876e10 | 24659 | 61966734416 | 1 | 1.5792e+06 | false |
| 192 | Ipopt | 1.3993425791e10 | 2617 | 7880823232 | 27 | 4.0159e-21 | true |
| 192 | MadNLP | 5.88770725e9 | 1019 | 3198434656 | 10 | 6.6633e-07 | true |
| 256 | SecondOrderOptimization (Sparse LM) | 1.92805105e10 | 424 | 660367520 | 18 | 3.0661e-16 | true |
| 256 | SecondOrderOptimization (Sparse Dogleg) | 3.1212909042e10 | 490 | 615059328 | 28 | 1.5608e+06 | false |
| 256 | CaNNOLeS | 1.0179653417e10 | 228 | 671226752 | 4 | 1.2505e-20 | true |
| 256 | JSOSolvers (trunk) | 3.0209587625e10 | 13310 | 60334348496 | 3 | 3.5622e+06 | false |
| 256 | JSOSolvers (tron) | 3.0946757708e10 | 13919 | 62399796752 | 1 | 3.5621e+06 | false |
| 256 | Ipopt | 3.0285388375e10 | 2397 | 13552319696 | 26 | 1.1618e-20 | false |
| 256 | MadNLP | 1.6027255542e10 | 1229 | 8921798288 | 15 | 1.3193e-08 | true |
