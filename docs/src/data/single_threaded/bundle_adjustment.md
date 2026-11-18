# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T02:50:49
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 3b3f450
- **Dependency Commits**: OptimizationVariableInterface cd7c159, SecondOrderOptimization 741d209, NLLSModel ebf8f1d

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 1220.5882352941176 | 1 | 16 | 23959.0 | 421 | 46304 |
| 4 | BundleAdjustmentModels | 4558.4 | 1 | 16 | 57792.0 | 22 | 190896 |
| 8 | NLLSModel | 2339.285714285714 | 1 | 16 | 47334.0 | 841 | 92384 |
| 8 | BundleAdjustmentModels | 9041.666666666666 | 1 | 16 | 122042.0 | 22 | 479552 |
| 12 | NLLSModel | 4133.4 | 1 | 16 | 86333.0 | 1513 | 166112 |
| 12 | BundleAdjustmentModels | 16209.0 | 1 | 16 | 221667.0 | 24 | 891808 |
| 16 | NLLSModel | 7250.0 | 1 | 16 | 152917.0 | 2689 | 295136 |
| 16 | BundleAdjustmentModels | 28750.0 | 1 | 16 | 390416.0 | 24 | 1551888 |
| 24 | NLLSModel | 16167.0 | 1 | 16 | 337875.0 | 6063 | 665312 |
| 24 | BundleAdjustmentModels | 64708.0 | 1 | 16 | 884666.0 | 24 | 3494080 |
| 32 | NLLSModel | 28542.0 | 1 | 16 | 630542.0 | 10753 | 1179872 |
| 32 | BundleAdjustmentModels | 114709.0 | 1 | 16 | 1.4915e6 | 24 | 6132096 |
| 48 | NLLSModel | 64667.0 | 1 | 16 | 1.490625e6 | 24193 | 2654432 |
| 48 | BundleAdjustmentModels | 258791.0 | 1 | 16 | 3.440042e6 | 24 | 13774640 |
| 64 | NLLSModel | 121084.0 | 1 | 16 | 2.812667e6 | 43009 | 4718816 |
| 64 | BundleAdjustmentModels | 475000.0 | 1 | 16 | 6.278042e6 | 24 | 24445104 |
| 96 | NLLSModel | 267125.0 | 1 | 16 | 5.889334e6 | 96769 | 10617056 |
| 96 | BundleAdjustmentModels | 1.0405e6 | 1 | 16 | 1.4664e7 | 25 | 54910064 |
| 128 | NLLSModel | 467625.0 | 1 | 16 | 1.1076625e7 | 172033 | 18874592 |
| 128 | BundleAdjustmentModels | 1.851e6 | 1 | 16 | 2.5210708e7 | 25 | 97566320 |
| 192 | NLLSModel | 1.032542e6 | 1 | 16 | 2.7746416e7 | 387073 | 42467552 |
| 192 | BundleAdjustmentModels | 4.300958e6 | 1 | 16 | 5.7540416e7 | 25 | 219453040 |
| 256 | NLLSModel | 1.87925e6 | 1 | 16 | 5.394975e7 | 688129 | 92799376 |
| 256 | BundleAdjustmentModels | 7.688541e6 | 1 | 16 | 1.02644917e8 | 25 | 390060656 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 4 | SecondOrderOptimization (LM) | 310729.0 | 3467 | 610992 | 5 | 1.7020e-23 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 335104.0 | 3467 | 610992 | 5 | 2.4137e-23 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 605188.0 | 2944 | 678944 | 5 | 1.6867e-23 | true | ok | NaN | grad\_tol |
| 4 | CaNNOLeS | 947999.5 | 191 | 359056 | 7 | 4.7517e-16 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 7.98106458e8 | 359780 | 1188428656 | 25 | 6.8334e-14 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (tron) | 8.313763084e9 | 3630138 | 11992521024 | 501 | 5.9770e-12 | false | not_converged | NaN | max\_iter |
| 4 | Ipopt | 2.7428955e6 | 632 | 2347072 | 8 | 4.0004e-15 | true | ok | NaN | first\_order |
| 4 | MadNLP | 1.5132705e6 | 827 | 2362448 | 7 | 4.7778e-13 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | SecondOrderOptimization (LM) | 613104.0 | 6605 | 1433968 | 5 | 4.6799e-26 | true | ok | NaN | abs\_dcost |
| 8 | SecondOrderOptimization (Dogleg) | 851125.0 | 6605 | 1433968 | 5 | 4.7838e-26 | true | ok | NaN | abs\_dcost, step\_size |
| 8 | SecondOrderOptimization (LM, tall) | 1.7944375e6 | 5500 | 1612800 | 5 | 4.6221e-26 | true | ok | NaN | abs\_dcost |
| 8 | CaNNOLeS | 1.7033335e6 | 208 | 712224 | 6 | 3.4177e-16 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 3.0023927166e10 | 6680356 | 44008234528 | 151 | 8.7468e-13 | false | timeout | NaN | max\_time |
| 8 | JSOSolvers (tron) | 3.0000932041e10 | 6692424 | 44087936512 | 356 | 1.1786e-11 | false | timeout | NaN | max\_time |
| 8 | Ipopt | 5.274729e6 | 766 | 6821744 | 10 | 1.4563e-14 | true | ok | NaN | first\_order |
| 8 | MadNLP | 2.649167e6 | 827 | 5363552 | 7 | 1.8327e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | SecondOrderOptimization (LM) | 1.1630835e6 | 11551 | 2695776 | 5 | 1.3544e-23 | true | ok | NaN | abs\_dcost |
| 12 | SecondOrderOptimization (Dogleg) | 1.6690625e6 | 13063 | 2861664 | 5 | 1.1072e-25 | true | ok | NaN | grad\_tol |
| 12 | SecondOrderOptimization (LM, tall) | 5.773896e6 | 9506 | 3338080 | 5 | 1.3482e-23 | true | ok | NaN | abs\_dcost |
| 12 | CaNNOLeS | 3.2579375e6 | 222 | 1259808 | 6 | 8.4917e-16 | true | ok | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 3.0000428208e10 | 6547216 | 77127107344 | 86 | 3.1509e-12 | false | timeout | NaN | max\_time |
| 12 | JSOSolvers (tron) | 3.0001158166e10 | 6507058 | 76653212432 | 174 | 6.5424e-12 | false | timeout | NaN | max\_time |
| 12 | Ipopt | 7.6921045e6 | 740 | 11347760 | 9 | 5.4678e-14 | true | ok | NaN | first\_order |
| 12 | MadNLP | 3.394688e6 | 792 | 7375296 | 5 | 6.7695e-09 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | SecondOrderOptimization (LM) | 2.068125e6 | 19891 | 4564784 | 5 | 5.2816e-23 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 2.9354375e6 | 19945 | 4565648 | 5 | 1.9131e-25 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | SecondOrderOptimization (LM, tall) | 1.41821875e7 | 16194 | 6281072 | 5 | 5.2728e-23 | true | ok | NaN | grad\_tol |
| 16 | CaNNOLeS | 5.877021e6 | 226 | 2370400 | 5 | 1.8425e-14 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 3.0000616625e10 | 3765408 | 73788492208 | 39 | 1.4384e-11 | false | timeout | NaN | max\_time |
| 16 | JSOSolvers (tron) | 3.0002240708e10 | 3750058 | 73486340992 | 51 | 1.6033e-11 | false | timeout | NaN | max\_time |
| 16 | Ipopt | 1.232875e7 | 740 | 19373856 | 9 | 2.8960e-14 | true | ok | NaN | first\_order |
| 16 | MadNLP | 6.42275e6 | 833 | 14585168 | 6 | 2.3365e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 24 | SecondOrderOptimization (LM) | 5.0693955e6 | 43300 | 10155072 | 5 | 4.1232e-24 | true | ok | NaN | abs\_dcost |
| 24 | SecondOrderOptimization (Dogleg) | 5.864771e6 | 37238 | 9489984 | 4 | 1.1060e-24 | true | ok | NaN | grad\_tol |
| 24 | SecondOrderOptimization (LM, tall) | 5.3807e7 | 34822 | 17440912 | 5 | 4.3340e-24 | true | ok | NaN | abs\_dcost |
| 24 | CaNNOLeS | 1.3472479e7 | 228 | 4834176 | 5 | 1.9298e-17 | true | ok | NaN | first\_order |
| 24 | JSOSolvers (trunk) | 3.0002721583e10 | 1683050 | 72187440592 | 17 | 1.2862e-10 | false | timeout | NaN | max\_time |
| 24 | JSOSolvers (tron) | 3.0006688583e10 | 1679428 | 72029220272 | 13 | 5.2164e-10 | false | timeout | NaN | max\_time |
| 24 | Ipopt | 3.4416354e7 | 882 | 52291856 | 11 | 6.0972e-16 | true | ok | NaN | first\_order |
| 24 | MadNLP | 1.4414791e7 | 845 | 32202736 | 6 | 1.3226e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | SecondOrderOptimization (LM) | 9.7833955e6 | 75927 | 17997552 | 5 | 3.1620e-23 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 1.11133755e7 | 65175 | 16817904 | 4 | 4.3230e-23 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 1.294938125e8 | 60798 | 39646768 | 5 | 3.0915e-23 | true | ok | NaN | grad\_tol |
| 32 | CaNNOLeS | 3.3355625e7 | 228 | 8092544 | 4 | 1.6044e-17 | true | ok | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 3.0002001291e10 | 956420 | 67167418704 | 14 | 1.5928e-09 | false | timeout | NaN | max\_time |
| 32 | JSOSolvers (tron) | 3.0014198417e10 | 947188 | 66514317936 | 5 | 1.7510e-09 | false | timeout | NaN | max\_time |
| 32 | Ipopt | 4.8673979e7 | 740 | 87873040 | 9 | 1.3067e-14 | true | ok | NaN | first\_order |
| 32 | MadNLP | 2.9826042e7 | 886 | 63895632 | 7 | 2.1740e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 48 | SecondOrderOptimization (LM) | 2.4578708e7 | 168650 | 39741104 | 5 | 2.2178e-23 | true | ok | NaN | abs\_dcost |
| 48 | SecondOrderOptimization (Dogleg) | 3.5027687e7 | 168640 | 39740944 | 5 | 1.6030e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 48 | SecondOrderOptimization (LM, tall) | 5.501076455e8 | 134390 | 107481520 | 5 | 2.3004e-23 | true | ok | NaN | abs\_dcost |
| 48 | CaNNOLeS | 8.79059165e7 | 228 | 18045824 | 4 | 1.8343e-18 | true | ok | NaN | first\_order |
| 48 | JSOSolvers (trunk) | 3.0008275583e10 | 416180 | 66422052176 | 14 | 1.5633e-04 | false | timeout | NaN | max\_time |
| 48 | JSOSolvers (tron) | 3.0016963542e10 | 416278 | 66426982816 | 2 | 1.7232e-04 | false | timeout | NaN | max\_time |
| 48 | Ipopt | 2.68806104e8 | 1542 | 378491520 | 19 | 1.4722e-23 | true | ok | NaN | acceptable |
| 48 | MadNLP | 9.0214417e7 | 804 | 105275120 | 5 | 2.7168e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | SecondOrderOptimization (LM) | 5.9177917e7 | 340004 | 76863440 | 6 | 5.4883e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (Dogleg) | 1.055922505e8 | 340002 | 76863408 | 6 | 5.1297e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (LM, tall) | 1.815326625e9 | 266674 | 240308944 | 6 | 5.0499e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | CaNNOLeS | 1.78421834e8 | 228 | 35527552 | 4 | 1.0359e-19 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 3.00111535e10 | 230810 | 64601189840 | 9 | 6.8990e-01 | false | timeout | NaN | max\_time |
| 64 | JSOSolvers (tron) | 3.0039562458e10 | 228898 | 64047012896 | 1 | 1.8045e+01 | false | timeout | NaN | max\_time |
| 64 | Ipopt | 7.773261665e8 | 1510 | 620748800 | 19 | 4.8607e-23 | true | ok | NaN | acceptable |
| 64 | MadNLP | 1.88414125e8 | 804 | 185804832 | 5 | 1.6882e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 96 | SecondOrderOptimization (LM) | 1.95567584e8 | 855402 | 227168176 | 7 | 2.7669e-22 | true | ok | NaN | abs\_dcost |
| 96 | SecondOrderOptimization (Dogleg) | 5.18385542e8 | 1532780 | 299683792 | 12 | 2.6754e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 96 | SecondOrderOptimization (LM, tall) | 9.425095459e9 | 662424 | 765441264 | 7 | 2.7543e-22 | true | ok | NaN | abs\_dcost |
| 96 | CaNNOLeS | 5.874175835e8 | 228 | 88988544 | 4 | 1.6285e-21 | true | ok | NaN | first\_order |
| 96 | JSOSolvers (trunk) | 3.0034361e10 | 96530 | 60673654736 | 5 | 5.2470e+03 | false | timeout | NaN | max\_time |
| 96 | JSOSolvers (tron) | 3.0099378834e10 | 94589 | 59343142752 | 1 | 5.1992e+03 | false | timeout | NaN | max\_time |
| 96 | Ipopt | 2.793876833e9 | 2149 | 1903463056 | 26 | 2.4973e-22 | true | ok | NaN | acceptable |
| 96 | MadNLP | 7.194846455e8 | 893 | 561823280 | 7 | 3.6600e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | SecondOrderOptimization (LM) | 4.94186458e8 | 1689414 | 362659648 | 8 | 8.0366e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (Dogleg) | 6.29667125e8 | 1689414 | 359153472 | 7 | 8.0533e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM, tall) | 3.2120282833e10 | 1296914 | 1725849792 | 8 | 8.1795e-22 | true | ok | NaN | abs\_dcost, step\_size, max\_time |
| 128 | CaNNOLeS | 1.095278458e9 | 228 | 148478848 | 4 | 2.8962e-21 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 3.0058231125e10 | 52250 | 58320721360 | 5 | 1.2269e+05 | false | timeout | NaN | max\_time |
| 128 | JSOSolvers (tron) | 3.0193759084e10 | 52859 | 58851515360 | 1 | 1.3255e+05 | false | timeout | NaN | max\_time |
| 128 | Ipopt | 4.611578292e9 | 2257 | 3377620528 | 26 | 7.4245e-22 | true | ok | NaN | acceptable |
| 128 | MadNLP | 1.763388875e9 | 935 | 1175269328 | 8 | 1.3112e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 192 | SecondOrderOptimization (LM) | 1.638072541e9 | 4177348 | 1095592160 | 9 | 4.1875e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (Dogleg) | 1.70895225e9 | 3403204 | 1039460576 | 6 | 4.3744e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (LM, tall) | 3.8861400375e10 | 1247696 | 5500534528 | 2 | 7.5129e-03 | false | timeout | NaN | max\_time |
| 192 | CaNNOLeS | 3.780333167e9 | 228 | 368843648 | 4 | 4.2749e-21 | true | ok | NaN | first\_order |
| 192 | JSOSolvers (trunk) | 3.009545025e10 | 22850 | 58016199632 | 3 | 1.5851e+06 | false | timeout | NaN | max\_time |
| 192 | JSOSolvers (tron) | 3.0589503375e10 | 23579 | 59096042464 | 1 | 1.5802e+06 | false | timeout | NaN | max\_time |
| 192 | Ipopt | 1.4078729333e10 | 2617 | 7880921536 | 27 | 4.0159e-21 | true | ok | NaN | acceptable |
| 192 | MadNLP | 6.128267875e9 | 1019 | 3234463072 | 10 | 6.6633e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | SecondOrderOptimization (LM) | 4.073089125e9 | 8101742 | 2065483280 | 10 | 1.3752e-20 | true | ok | NaN | abs\_dcost |
| 256 | SecondOrderOptimization (Dogleg) | 4.255348541e9 | 6037226 | 1681950608 | 6 | 1.3057e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (LM, tall) | 7.6623991875e10 | 2696199 | 27229363328 | 3 | 4.9862e-02 | false | timeout | NaN | max\_time |
| 256 | CaNNOLeS | 1.0023703625e10 | 228 | 591469440 | 4 | 1.2505e-20 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (trunk) | 3.0186103542e10 | 13010 | 57923813328 | 3 | 3.5654e+06 | false | timeout | NaN | max\_time |
| 256 | JSOSolvers (tron) | 3.1114667708e10 | 13499 | 59573831648 | 1 | 3.5656e+06 | false | timeout | NaN | max\_time |
| 256 | Ipopt | 3.0910427458e10 | 2397 | 13479902416 | 26 | 1.1618e-20 | false | timeout | NaN | max\_time |
| 256 | MadNLP | 1.5922727542e10 | 1229 | 8251201168 | 15 | 1.3193e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
