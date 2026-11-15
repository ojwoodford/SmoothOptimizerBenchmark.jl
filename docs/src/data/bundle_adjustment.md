# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T03:15:30
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 1225.5294117647059 | 1 | 16 | 9834.0 | 421 | 39536 |
| 4 | BundleAdjustmentModels | 4841.6 | 1 | 16 | 56209.0 | 22 | 190896 |
| 8 | NLLSModel | 1526.7857142857142 | 1 | 16 | 19209.0 | 841 | 78896 |
| 8 | BundleAdjustmentModels | 9777.666666666666 | 1 | 16 | 121500.0 | 22 | 479552 |
| 12 | NLLSModel | 2428.0 | 1 | 16 | 37125.0 | 1513 | 141872 |
| 12 | BundleAdjustmentModels | 17500.0 | 1 | 16 | 238625.0 | 24 | 891808 |
| 16 | NLLSModel | 3047.5714285714284 | 1 | 16 | 72708.0 | 2689 | 252080 |
| 16 | BundleAdjustmentModels | 29833.0 | 1 | 16 | 412541.0 | 24 | 1551888 |
| 24 | NLLSModel | 4300.0 | 1 | 16 | 142000.0 | 6063 | 568272 |
| 24 | BundleAdjustmentModels | 65833.0 | 1 | 16 | 944834.0 | 24 | 3494080 |
| 32 | NLLSModel | 6073.0 | 1 | 16 | 243750.0 | 10753 | 1007792 |
| 32 | BundleAdjustmentModels | 116583.0 | 1 | 16 | 1.591833e6 | 24 | 6132096 |
| 48 | NLLSModel | 11583.0 | 1 | 16 | 541875.0 | 24193 | 2267312 |
| 48 | BundleAdjustmentModels | 262541.0 | 1 | 16 | 3.520209e6 | 24 | 13774640 |
| 64 | NLLSModel | 19500.0 | 1 | 16 | 1.002625e6 | 43009 | 4030640 |
| 64 | BundleAdjustmentModels | 497167.0 | 1 | 16 | 6.30225e6 | 24 | 24445104 |
| 96 | NLLSModel | 40750.0 | 1 | 16 | 2.268583e6 | 96769 | 9068720 |
| 96 | BundleAdjustmentModels | 1.117542e6 | 1 | 16 | 1.4731917e7 | 25 | 54910064 |
| 128 | NLLSModel | 66958.0 | 1 | 16 | 4.523708e6 | 172033 | 16122032 |
| 128 | BundleAdjustmentModels | 1.987208e6 | 1 | 16 | 2.7130416e7 | 25 | 97566320 |
| 192 | NLLSModel | 1.370167e6 | 1 | 16 | 1.0332e7 | 387073 | 36274352 |
| 192 | BundleAdjustmentModels | 4.4775e6 | 1 | 16 | 6.0633167e7 | 25 | 219453040 |
| 256 | NLLSModel | 297750.0 | 1 | 16 | 1.6566666e7 | 688129 | 80216432 |
| 256 | BundleAdjustmentModels | 7.935416e6 | 1 | 16 | 1.13508834e8 | 25 | 390060656 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 4 | SecondOrderOptimization (LM) | 214895.5 | 3496 | 559664 | 5 | 1.6988e-23 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 354916.5 | 4374 | 764912 | 6 | 3.8645e-26 | true | ok | NaN | grad\_tol |
| 4 | CaNNOLeS | 943583.5 | 191 | 359056 | 7 | 4.7517e-16 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 7.461754795e8 | 359780 | 1188428656 | 25 | 6.8334e-14 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (tron) | 7.626427833e9 | 3630138 | 11992521024 | 501 | 5.9770e-12 | false | not_converged | NaN | max\_iter |
| 4 | Ipopt | 2.685104e6 | 632 | 2347072 | 8 | 4.0004e-15 | true | ok | NaN | first\_order |
| 4 | MadNLP | 1.4843755e6 | 827 | 2362448 | 7 | 4.7778e-13 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | SecondOrderOptimization (LM) | 463854.0 | 6635 | 1319152 | 5 | 4.7458e-26 | true | ok | NaN | abs\_dcost |
| 8 | SecondOrderOptimization (Dogleg) | 737146.0 | 6667 | 1570352 | 5 | 1.1273e-25 | true | ok | NaN | grad\_tol |
| 8 | CaNNOLeS | 1.7188755e6 | 208 | 712224 | 6 | 3.4177e-16 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 3.0000269e10 | 7321562 | 48232693824 | 165 | 7.2787e-13 | false | timeout | NaN | max\_time |
| 8 | JSOSolvers (tron) | 3.000078625e10 | 7416807 | 48860064400 | 403 | 8.7780e-12 | false | timeout | NaN | max\_time |
| 8 | Ipopt | 5.277625e6 | 766 | 6821744 | 10 | 1.4563e-14 | true | ok | NaN | first\_order |
| 8 | MadNLP | 2.662583e6 | 827 | 5363552 | 7 | 1.8327e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | SecondOrderOptimization (LM) | 885750.0 | 11583 | 2508304 | 5 | 1.3549e-23 | true | ok | NaN | abs\_dcost |
| 12 | SecondOrderOptimization (Dogleg) | 1.8164995e6 | 14646 | 3193696 | 6 | 8.1889e-26 | true | ok | NaN | step\_size |
| 12 | CaNNOLeS | 3.284521e6 | 222 | 1259808 | 6 | 8.4917e-16 | true | ok | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 3.0002560458e10 | 6588256 | 77610569488 | 86 | 3.1101e-12 | false | timeout | NaN | max\_time |
| 12 | JSOSolvers (tron) | 3.0001197167e10 | 6538318 | 77021463568 | 174 | 6.5269e-12 | false | timeout | NaN | max\_time |
| 12 | Ipopt | 7.6559375e6 | 740 | 11347760 | 9 | 5.4678e-14 | true | ok | NaN | first\_order |
| 12 | MadNLP | 3.452792e6 | 792 | 7375296 | 5 | 6.7695e-09 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | SecondOrderOptimization (LM) | 1.531479e6 | 19927 | 4259008 | 5 | 5.3154e-23 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 2.8201455e6 | 19960 | 4678640 | 5 | 1.7398e-25 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | CaNNOLeS | 5.8911665e6 | 226 | 2370400 | 5 | 1.8425e-14 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 3.0000586541e10 | 3736998 | 73231747120 | 38 | 1.5497e-11 | false | timeout | NaN | max\_time |
| 16 | JSOSolvers (tron) | 3.0002552959e10 | 3724198 | 72979567744 | 51 | 1.7234e-11 | false | timeout | NaN | max\_time |
| 16 | Ipopt | 1.2326875e7 | 740 | 19373856 | 9 | 2.8960e-14 | true | ok | NaN | first\_order |
| 16 | MadNLP | 7.1214795e6 | 833 | 14585168 | 6 | 2.3365e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 24 | SecondOrderOptimization (LM) | 4.0674795e6 | 43336 | 9529344 | 5 | 3.9394e-24 | true | ok | NaN | abs\_dcost |
| 24 | SecondOrderOptimization (Dogleg) | 7.1600625e6 | 43369 | 10117664 | 5 | 1.0599e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 24 | CaNNOLeS | 1.3554479e7 | 228 | 4834176 | 5 | 1.9298e-17 | true | ok | NaN | first\_order |
| 24 | JSOSolvers (trunk) | 3.0001714708e10 | 1675310 | 71855450320 | 17 | 1.3578e-10 | false | timeout | NaN | max\_time |
| 24 | JSOSolvers (tron) | 3.0003568125e10 | 1668898 | 71577559088 | 12 | 5.3496e-10 | false | timeout | NaN | max\_time |
| 24 | Ipopt | 3.2253063e7 | 882 | 52291856 | 11 | 6.0972e-16 | true | ok | NaN | first\_order |
| 24 | MadNLP | 1.49114165e7 | 845 | 32202736 | 6 | 1.3226e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | SecondOrderOptimization (LM) | 7.445604e6 | 75961 | 16931328 | 5 | 3.0721e-23 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 1.15989585e7 | 65240 | 16530640 | 4 | 2.9511e-24 | true | ok | NaN | grad\_tol |
| 32 | CaNNOLeS | 3.3721333e7 | 228 | 8092544 | 4 | 1.6044e-17 | true | ok | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 3.0002473417e10 | 941360 | 66109700688 | 14 | 1.6115e-09 | false | timeout | NaN | max\_time |
| 32 | JSOSolvers (tron) | 3.0016220375e10 | 948028 | 66573314160 | 5 | 1.7500e-09 | false | timeout | NaN | max\_time |
| 32 | Ipopt | 4.80897085e7 | 740 | 74536464 | 9 | 1.3067e-14 | true | ok | NaN | first\_order |
| 32 | MadNLP | 3.1137979e7 | 886 | 63895632 | 7 | 2.1740e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 48 | SecondOrderOptimization (LM) | 2.0014625e7 | 168680 | 37441872 | 5 | 2.1838e-23 | true | ok | NaN | abs\_dcost |
| 48 | SecondOrderOptimization (Dogleg) | 8.7999125e7 | 338095 | 55653312 | 10 | 1.6149e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 48 | CaNNOLeS | 8.8074104e7 | 228 | 18045824 | 4 | 1.8343e-18 | true | ok | NaN | first\_order |
| 48 | JSOSolvers (trunk) | 3.000609875e10 | 421040 | 67197848144 | 14 | 1.4537e-04 | false | timeout | NaN | max\_time |
| 48 | JSOSolvers (tron) | 3.0020378541e10 | 414058 | 66072606880 | 2 | 1.7688e-04 | false | timeout | NaN | max\_time |
| 48 | Ipopt | 2.548929165e8 | 1542 | 351228544 | 19 | 1.4722e-23 | true | ok | NaN | acceptable |
| 48 | MadNLP | 9.3376792e7 | 804 | 105275120 | 5 | 2.7168e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | SecondOrderOptimization (LM) | 3.2763208e7 | 340061 | 72176224 | 6 | 5.9433e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (Dogleg) | 9.96032705e7 | 426142 | 82355520 | 7 | 5.1770e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | CaNNOLeS | 1.78955916e8 | 228 | 40147840 | 4 | 1.0359e-19 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 3.001065075e10 | 226370 | 63358065616 | 9 | 7.3912e-01 | false | timeout | NaN | max\_time |
| 64 | JSOSolvers (tron) | 3.004180425e10 | 227938 | 63778229280 | 1 | 1.8050e+01 | false | timeout | NaN | max\_time |
| 64 | Ipopt | 6.91653583e8 | 1510 | 620748800 | 19 | 4.8607e-23 | true | ok | NaN | acceptable |
| 64 | MadNLP | 1.86862792e8 | 804 | 185804832 | 5 | 1.6882e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 96 | SecondOrderOptimization (LM) | 1.18274125e8 | 855462 | 204246384 | 7 | 2.7074e-22 | true | ok | NaN | abs\_dcost |
| 96 | SecondOrderOptimization (Dogleg) | 1.80601417e8 | 758746 | 198947680 | 6 | 2.6032e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 96 | CaNNOLeS | 5.404014375e8 | 234 | 71965664 | 4 | 1.6285e-21 | true | ok | NaN | first\_order |
| 96 | JSOSolvers (trunk) | 3.003117525e10 | 96530 | 60726181840 | 5 | 5.2470e+03 | false | timeout | NaN | max\_time |
| 96 | JSOSolvers (tron) | 3.0114657541e10 | 96029 | 60247963488 | 1 | 5.0292e+03 | false | timeout | NaN | max\_time |
| 96 | Ipopt | 2.566210792e9 | 2149 | 1903430288 | 26 | 2.4973e-22 | true | ok | NaN | acceptable |
| 96 | MadNLP | 6.937299375e8 | 893 | 562232880 | 7 | 3.6600e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | SecondOrderOptimization (LM) | 2.81854375e8 | 1689477 | 348444608 | 8 | 7.6073e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (Dogleg) | 3.33088167e8 | 1173416 | 292504704 | 5 | 7.9228e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | CaNNOLeS | 1.095972166e9 | 228 | 153918336 | 4 | 2.8962e-21 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 3.0047860833e10 | 52612 | 58725889008 | 5 | 1.2254e+05 | false | timeout | NaN | max\_time |
| 128 | JSOSolvers (tron) | 3.03251505e10 | 53459 | 59521388000 | 1 | 1.3040e+05 | false | timeout | NaN | max\_time |
| 128 | Ipopt | 4.518377417e9 | 2257 | 3377587760 | 26 | 7.4245e-22 | true | ok | NaN | acceptable |
| 128 | MadNLP | 1.746555292e9 | 935 | 1169240016 | 8 | 1.3112e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 192 | SecondOrderOptimization (LM) | 8.517098545e8 | 4177412 | 1021461568 | 9 | 4.3345e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (Dogleg) | 1.03746375e9 | 2629160 | 859135520 | 5 | 4.3081e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | CaNNOLeS | 3.621260958e9 | 228 | 347904896 | 4 | 4.2749e-21 | true | ok | NaN | first\_order |
| 192 | JSOSolvers (trunk) | 3.01144795e10 | 23570 | 59354935248 | 3 | 1.5806e+06 | false | timeout | NaN | max\_time |
| 192 | JSOSolvers (tron) | 3.0444965333e10 | 24239 | 60511535840 | 1 | 1.5799e+06 | false | timeout | NaN | max\_time |
| 192 | Ipopt | 1.3975590709e10 | 2617 | 7904842176 | 27 | 4.0159e-21 | true | ok | NaN | acceptable |
| 192 | MadNLP | 5.834529375e9 | 1019 | 3210214752 | 10 | 6.6633e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | SecondOrderOptimization (LM) | 1.608750875e9 | 8101842 | 1990594128 | 10 | 1.3795e-20 | true | ok | NaN | abs\_dcost |
| 256 | SecondOrderOptimization (Dogleg) | 3.9157035e9 | 9478005 | 2113614096 | 9 | 1.2919e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | CaNNOLeS | 9.701750167e9 | 234 | 505076704 | 4 | 1.2505e-20 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (trunk) | 3.0147706792e10 | 13070 | 58899727568 | 3 | 3.5651e+06 | false | timeout | NaN | max\_time |
| 256 | JSOSolvers (tron) | 3.0861135625e10 | 13739 | 61591886816 | 1 | 3.5635e+06 | false | timeout | NaN | max\_time |
| 256 | Ipopt | 3.1385175167e10 | 2573 | 14103147552 | 27 | 1.1618e-20 | false | timeout | NaN | max\_time |
| 256 | MadNLP | 1.5554067208e10 | 1229 | 8303449744 | 15 | 1.3193e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
