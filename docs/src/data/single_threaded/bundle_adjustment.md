# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T03:56:32
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 1220.5882352941176 | 1 | 16 | 23666.0 | 421 | 39536 |
| 4 | BundleAdjustmentModels | 4625.0 | 1 | 16 | 58292.0 | 22 | 190896 |
| 8 | NLLSModel | 2375.0 | 1 | 16 | 48000.0 | 841 | 78896 |
| 8 | BundleAdjustmentModels | 9152.666666666666 | 1 | 16 | 139500.0 | 22 | 479552 |
| 12 | NLLSModel | 4141.6 | 1 | 16 | 85542.0 | 1513 | 141872 |
| 12 | BundleAdjustmentModels | 16458.0 | 1 | 16 | 239708.0 | 24 | 891808 |
| 16 | NLLSModel | 7236.333333333333 | 1 | 16 | 151333.0 | 2689 | 252080 |
| 16 | BundleAdjustmentModels | 29167.0 | 1 | 16 | 424250.0 | 24 | 1551888 |
| 24 | NLLSModel | 16167.0 | 1 | 16 | 348000.0 | 6063 | 568272 |
| 24 | BundleAdjustmentModels | 65584.0 | 1 | 16 | 909292.0 | 24 | 3494080 |
| 32 | NLLSModel | 28500.0 | 1 | 16 | 617416.0 | 10753 | 1007792 |
| 32 | BundleAdjustmentModels | 119417.0 | 1 | 16 | 1.579709e6 | 24 | 6132096 |
| 48 | NLLSModel | 64583.0 | 1 | 16 | 1.40075e6 | 24193 | 2267312 |
| 48 | BundleAdjustmentModels | 262083.0 | 1 | 16 | 3.399334e6 | 24 | 13774640 |
| 64 | NLLSModel | 113834.0 | 1 | 16 | 2.569084e6 | 43009 | 4030640 |
| 64 | BundleAdjustmentModels | 466792.0 | 1 | 16 | 6.240667e6 | 24 | 24445104 |
| 96 | NLLSModel | 255666.0 | 1 | 16 | 5.612e6 | 96769 | 9068720 |
| 96 | BundleAdjustmentModels | 1.05325e6 | 1 | 16 | 1.4011292e7 | 25 | 54910064 |
| 128 | NLLSModel | 460500.0 | 1 | 16 | 1.024875e7 | 172033 | 16122032 |
| 128 | BundleAdjustmentModels | 1.873875e6 | 1 | 16 | 2.5256875e7 | 25 | 97566320 |
| 192 | NLLSModel | 1.027542e6 | 1 | 16 | 2.5711042e7 | 387073 | 36274352 |
| 192 | BundleAdjustmentModels | 4.217708e6 | 1 | 16 | 5.5673458e7 | 25 | 219453040 |
| 256 | NLLSModel | 1.826792e6 | 1 | 16 | 4.9853958e7 | 688129 | 80216432 |
| 256 | BundleAdjustmentModels | 7.474e6 | 1 | 16 | 1.00807834e8 | 25 | 390060656 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 4 | SecondOrderOptimization (LM) | 276791.5 | 3437 | 509808 | 5 | 1.7020e-23 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 361875.5 | 3469 | 615392 | 5 | 2.4137e-23 | true | ok | NaN | grad\_tol |
| 4 | CaNNOLeS | 955083.5 | 191 | 359056 | 7 | 4.7517e-16 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 7.772550415e8 | 359780 | 1188428656 | 25 | 6.8334e-14 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (tron) | 8.298082792e9 | 3630138 | 11992521024 | 501 | 5.9770e-12 | false | not_converged | NaN | max\_iter |
| 4 | Ipopt | 2.685792e6 | 632 | 2347072 | 8 | 4.0004e-15 | true | ok | NaN | first\_order |
| 4 | MadNLP | 1.475375e6 | 827 | 2362448 | 7 | 4.7778e-13 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | SecondOrderOptimization (LM) | 605979.5 | 6575 | 1151776 | 5 | 4.6799e-26 | true | ok | NaN | abs\_dcost |
| 8 | SecondOrderOptimization (Dogleg) | 848708.0 | 6607 | 1402976 | 5 | 4.7838e-26 | true | ok | NaN | abs\_dcost, step\_size |
| 8 | CaNNOLeS | 1.718333e6 | 208 | 712224 | 6 | 3.4177e-16 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 3.0008099875e10 | 6692251 | 44086675888 | 152 | 8.7299e-13 | false | timeout | NaN | max\_time |
| 8 | JSOSolvers (tron) | 3.0000652209e10 | 6675252 | 43974809920 | 355 | 1.1823e-11 | false | timeout | NaN | max\_time |
| 8 | Ipopt | 5.2363125e6 | 766 | 6821744 | 10 | 1.4563e-14 | true | ok | NaN | first\_order |
| 8 | MadNLP | 2.738271e6 | 827 | 5363552 | 7 | 1.8327e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | SecondOrderOptimization (LM) | 1.1401455e6 | 11520 | 2183792 | 5 | 1.3544e-23 | true | ok | NaN | abs\_dcost |
| 12 | SecondOrderOptimization (Dogleg) | 1.833771e6 | 13065 | 2660928 | 5 | 1.1072e-25 | true | ok | NaN | grad\_tol |
| 12 | CaNNOLeS | 3.267875e6 | 222 | 1259808 | 6 | 8.4917e-16 | true | ok | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 3.0000325083e10 | 6443146 | 75901134992 | 85 | 3.1964e-12 | false | timeout | NaN | max\_time |
| 12 | JSOSolvers (tron) | 3.0001781625e10 | 6496948 | 76534113936 | 173 | 6.6912e-12 | false | timeout | NaN | max\_time |
| 12 | Ipopt | 7.906979e6 | 740 | 11347760 | 9 | 5.4678e-14 | true | ok | NaN | first\_order |
| 12 | MadNLP | 3.632e6 | 792 | 7375296 | 5 | 6.7695e-09 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | SecondOrderOptimization (LM) | 2.048271e6 | 19860 | 3676512 | 5 | 5.2816e-23 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 3.281104e6 | 19893 | 4096144 | 5 | 1.9131e-25 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | CaNNOLeS | 5.9439375e6 | 226 | 2370400 | 5 | 1.8425e-14 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 3.0000847791e10 | 3694278 | 72394571824 | 38 | 1.6544e-11 | false | timeout | NaN | max\_time |
| 16 | JSOSolvers (tron) | 3.0002180292e10 | 3665158 | 71822572672 | 49 | 1.7702e-11 | false | timeout | NaN | max\_time |
| 16 | Ipopt | 1.23803755e7 | 740 | 19373856 | 9 | 2.8960e-14 | true | ok | NaN | first\_order |
| 16 | MadNLP | 6.5425625e6 | 833 | 14585168 | 6 | 2.3365e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 24 | SecondOrderOptimization (LM) | 4.8680205e6 | 43269 | 8317104 | 5 | 4.1232e-24 | true | ok | NaN | abs\_dcost |
| 24 | SecondOrderOptimization (Dogleg) | 6.6036255e6 | 37234 | 8220704 | 4 | 1.1060e-24 | true | ok | NaN | grad\_tol |
| 24 | CaNNOLeS | 1.35718125e7 | 228 | 4834176 | 5 | 1.9298e-17 | true | ok | NaN | first\_order |
| 24 | JSOSolvers (trunk) | 3.0001471458e10 | 1629770 | 69902112208 | 17 | 1.4485e-10 | false | timeout | NaN | max\_time |
| 24 | JSOSolvers (tron) | 3.0004106292e10 | 1623238 | 69619073840 | 12 | 5.4716e-10 | false | timeout | NaN | max\_time |
| 24 | Ipopt | 3.4436709e7 | 882 | 52291856 | 11 | 6.0972e-16 | true | ok | NaN | first\_order |
| 24 | MadNLP | 1.5378875e7 | 845 | 32202736 | 6 | 1.3226e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | SecondOrderOptimization (LM) | 9.666562e6 | 75908 | 14789488 | 5 | 3.1620e-23 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 1.2981729e7 | 65187 | 14388800 | 4 | 4.3230e-23 | true | ok | NaN | grad\_tol |
| 32 | CaNNOLeS | 3.43475e7 | 228 | 8092544 | 4 | 1.6044e-17 | true | ok | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 3.000468525e10 | 908660 | 63813061968 | 14 | 1.6559e-09 | false | timeout | NaN | max\_time |
| 32 | JSOSolvers (tron) | 3.0015606459e10 | 910228 | 63918484080 | 5 | 1.7859e-09 | false | timeout | NaN | max\_time |
| 32 | Ipopt | 4.853925e7 | 740 | 74536464 | 9 | 1.3067e-14 | true | ok | NaN | first\_order |
| 32 | MadNLP | 3.1415313e7 | 886 | 63895632 | 7 | 2.1740e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 48 | SecondOrderOptimization (LM) | 2.500825e7 | 168607 | 32647584 | 5 | 2.2178e-23 | true | ok | NaN | abs\_dcost |
| 48 | SecondOrderOptimization (Dogleg) | 4.2473959e7 | 168645 | 33823504 | 5 | 1.6030e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 48 | CaNNOLeS | 9.19968125e7 | 228 | 18045824 | 4 | 1.8343e-18 | true | ok | NaN | first\_order |
| 48 | JSOSolvers (trunk) | 3.00063625e10 | 399920 | 63826487888 | 14 | 1.8158e-04 | false | timeout | NaN | max\_time |
| 48 | JSOSolvers (tron) | 3.0077461792e10 | 401158 | 64013395360 | 2 | 2.0350e-04 | false | timeout | NaN | max\_time |
| 48 | Ipopt | 2.580867085e8 | 1542 | 351228544 | 19 | 1.4722e-23 | true | ok | NaN | acceptable |
| 48 | MadNLP | 9.5079396e7 | 804 | 105275120 | 5 | 2.7168e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | SecondOrderOptimization (LM) | 6.23053125e7 | 339969 | 63764352 | 6 | 5.4883e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (Dogleg) | 1.09209875e8 | 340014 | 66085776 | 6 | 5.1297e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | CaNNOLeS | 1.882380205e8 | 228 | 32480128 | 4 | 1.0359e-19 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 3.0013458167e10 | 221570 | 62014147536 | 9 | 8.1436e-01 | false | timeout | NaN | max\_time |
| 64 | JSOSolvers (tron) | 3.00395285e10 | 220378 | 61661558304 | 1 | 1.8122e+01 | false | timeout | NaN | max\_time |
| 64 | Ipopt | 7.87501833e8 | 1510 | 620748800 | 19 | 4.8607e-23 | true | ok | NaN | acceptable |
| 64 | MadNLP | 2.2684175e8 | 804 | 185804832 | 5 | 1.6882e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 96 | SecondOrderOptimization (LM) | 2.0415225e8 | 855373 | 179568592 | 7 | 2.7669e-22 | true | ok | NaN | abs\_dcost |
| 96 | SecondOrderOptimization (Dogleg) | 6.334866665e8 | 1532834 | 248465280 | 12 | 2.6754e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 96 | CaNNOLeS | 5.480711455e8 | 228 | 82008960 | 4 | 1.6285e-21 | true | ok | NaN | first\_order |
| 96 | JSOSolvers (trunk) | 3.003146475e10 | 92690 | 58254852048 | 5 | 5.7359e+03 | false | timeout | NaN | max\_time |
| 96 | JSOSolvers (tron) | 3.0132860292e10 | 92369 | 57948210784 | 1 | 5.4226e+03 | false | timeout | NaN | max\_time |
| 96 | Ipopt | 2.788704042e9 | 2149 | 1903528592 | 26 | 2.4973e-22 | true | ok | NaN | acceptable |
| 96 | MadNLP | 7.217894585e8 | 893 | 589069872 | 7 | 3.6600e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | SecondOrderOptimization (LM) | 4.88956083e8 | 1689381 | 302417600 | 8 | 8.0366e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (Dogleg) | 8.184383745e8 | 1689433 | 305644400 | 7 | 8.0533e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | CaNNOLeS | 1.263205e9 | 228 | 170859392 | 4 | 2.8962e-21 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 3.0054606541e10 | 51350 | 57324563152 | 5 | 1.2300e+05 | false | timeout | NaN | max\_time |
| 128 | JSOSolvers (tron) | 3.020144775e10 | 51599 | 57444782816 | 1 | 1.3416e+05 | false | timeout | NaN | max\_time |
| 128 | Ipopt | 4.616415e9 | 2257 | 3377587760 | 26 | 7.4245e-22 | true | ok | NaN | acceptable |
| 128 | MadNLP | 1.662477583e9 | 935 | 1158524880 | 8 | 1.3112e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 192 | SecondOrderOptimization (LM) | 1.756311292e9 | 4177315 | 873623616 | 9 | 4.1875e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (Dogleg) | 2.096526292e9 | 3403216 | 787891280 | 6 | 4.3744e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | CaNNOLeS | 3.955118959e9 | 228 | 335600512 | 4 | 4.2749e-21 | true | ok | NaN | first\_order |
| 192 | JSOSolvers (trunk) | 3.0129006917e10 | 22850 | 57575207888 | 3 | 1.5851e+06 | false | timeout | NaN | max\_time |
| 192 | JSOSolvers (tron) | 3.0446196125e10 | 23459 | 58676642272 | 1 | 1.5802e+06 | false | timeout | NaN | max\_time |
| 192 | Ipopt | 1.4465577041e10 | 2617 | 7880823232 | 27 | 4.0159e-21 | true | ok | NaN | acceptable |
| 192 | MadNLP | 6.135960292e9 | 1019 | 3207363936 | 10 | 6.6633e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | SecondOrderOptimization (LM) | 4.099689334e9 | 8101742 | 1956102656 | 10 | 1.3752e-20 | true | ok | NaN | abs\_dcost |
| 256 | SecondOrderOptimization (Dogleg) | 4.419138e9 | 6037232 | 1604060160 | 6 | 1.3057e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | CaNNOLeS | 1.0089009416e10 | 228 | 527276928 | 4 | 1.2505e-20 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (trunk) | 3.0382883208e10 | 12653 | 57523888640 | 3 | 3.5725e+06 | false | timeout | NaN | max\_time |
| 256 | JSOSolvers (tron) | 3.0840373708e10 | 13199 | 59488579296 | 1 | 3.5715e+06 | false | timeout | NaN | max\_time |
| 256 | Ipopt | 3.088569925e10 | 2397 | 14092057808 | 26 | 1.1618e-20 | false | timeout | NaN | max\_time |
| 256 | MadNLP | 1.594174325e10 | 1229 | 8344082064 | 15 | 1.3193e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
