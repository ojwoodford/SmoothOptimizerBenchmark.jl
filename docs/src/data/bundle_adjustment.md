# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T02:03:59
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 3b3f450
- **Dependency Commits**: OptimizationVariableInterface cd7c159, SecondOrderOptimization 741d209, NLLSModel ebf8f1d

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 1218.1764705882354 | 1 | 16 | 9958.0 | 421 | 46304 |
| 4 | BundleAdjustmentModels | 4566.8 | 1 | 16 | 54083.0 | 22 | 190896 |
| 8 | NLLSModel | 2604.1428571428573 | 1 | 16 | 19250.0 | 841 | 92384 |
| 8 | BundleAdjustmentModels | 9611.0 | 1 | 16 | 116375.0 | 22 | 479552 |
| 12 | NLLSModel | 1857.142857142857 | 1 | 16 | 38250.0 | 1513 | 166112 |
| 12 | BundleAdjustmentModels | 17250.0 | 1 | 16 | 215000.0 | 24 | 891808 |
| 16 | NLLSModel | 3232.1428571428573 | 1 | 16 | 71250.0 | 2689 | 295136 |
| 16 | BundleAdjustmentModels | 30541.0 | 1 | 16 | 375792.0 | 24 | 1551888 |
| 24 | NLLSModel | 4333.4 | 1 | 16 | 142542.0 | 6063 | 665312 |
| 24 | BundleAdjustmentModels | 64709.0 | 1 | 16 | 872791.0 | 24 | 3494080 |
| 32 | NLLSModel | 6073.0 | 1 | 16 | 292167.0 | 10753 | 1179872 |
| 32 | BundleAdjustmentModels | 114708.0 | 1 | 16 | 1.488166e6 | 24 | 6132096 |
| 48 | NLLSModel | 11792.0 | 1 | 16 | 540166.0 | 24193 | 2654432 |
| 48 | BundleAdjustmentModels | 258667.0 | 1 | 16 | 3.316958e6 | 24 | 14102320 |
| 64 | NLLSModel | 19625.0 | 1 | 16 | 1.026083e6 | 43009 | 4718816 |
| 64 | BundleAdjustmentModels | 489875.0 | 1 | 16 | 6.202875e6 | 24 | 24445104 |
| 96 | NLLSModel | 37542.0 | 1 | 16 | 2.286459e6 | 96769 | 10617056 |
| 96 | BundleAdjustmentModels | 1.101292e6 | 1 | 16 | 1.5027666e7 | 25 | 54910064 |
| 128 | NLLSModel | 65750.0 | 1 | 16 | 4.253291e6 | 172033 | 18874592 |
| 128 | BundleAdjustmentModels | 1.95525e6 | 1 | 16 | 2.47725e7 | 25 | 97566320 |
| 192 | NLLSModel | 144916.0 | 1 | 16 | 1.0859375e7 | 387073 | 42467552 |
| 192 | BundleAdjustmentModels | 4.397375e6 | 1 | 16 | 6.0638791e7 | 25 | 219453040 |
| 256 | NLLSModel | 257250.0 | 1 | 16 | 1.6614541e7 | 688129 | 92799376 |
| 256 | BundleAdjustmentModels | 7.823334e6 | 1 | 16 | 1.08835625e8 | 25 | 390060656 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 4 | SecondOrderOptimization (LM) | 269895.5 | 3526 | 661728 | 5 | 1.6988e-23 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 356312.5 | 4366 | 753888 | 6 | 3.8645e-26 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 473729.0 | 2952 | 679648 | 5 | 1.6867e-23 | true | ok | NaN | grad\_tol |
| 4 | CaNNOLeS | 948375.0 | 191 | 359056 | 7 | 4.7517e-16 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 7.004223745e8 | 359780 | 1188428656 | 25 | 6.8334e-14 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (tron) | 7.071667167e9 | 3630138 | 11992521024 | 501 | 5.9770e-12 | false | not_converged | NaN | max\_iter |
| 4 | Ipopt | 2.714917e6 | 632 | 2347072 | 8 | 4.0004e-15 | true | ok | NaN | first\_order |
| 4 | MadNLP | 1.5286255e6 | 827 | 2362448 | 7 | 4.7778e-13 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | SecondOrderOptimization (LM) | 475604.0 | 6665 | 1602224 | 5 | 4.7458e-26 | true | ok | NaN | abs\_dcost |
| 8 | SecondOrderOptimization (Dogleg) | 656791.0 | 6665 | 1602224 | 5 | 1.1273e-25 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 1.4370415e6 | 5508 | 1613600 | 5 | 4.6221e-26 | true | ok | NaN | abs\_dcost |
| 8 | CaNNOLeS | 1.7065e6 | 208 | 712224 | 6 | 3.4177e-16 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 3.0000242708e10 | 8031217 | 52908058704 | 180 | 6.0660e-13 | false | timeout | NaN | max\_time |
| 8 | JSOSolvers (tron) | 3.0000774083e10 | 8010699 | 52772536912 | 446 | 7.9232e-12 | false | timeout | NaN | max\_time |
| 8 | Ipopt | 5.2980415e6 | 766 | 6821744 | 10 | 1.4563e-14 | true | ok | NaN | first\_order |
| 8 | MadNLP | 2.6817915e6 | 827 | 5363552 | 7 | 1.8327e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | SecondOrderOptimization (LM) | 881812.0 | 11614 | 3021168 | 5 | 1.3549e-23 | true | ok | NaN | abs\_dcost |
| 12 | SecondOrderOptimization (Dogleg) | 1.6108335e6 | 14638 | 3352944 | 6 | 8.1889e-26 | true | ok | NaN | step\_size |
| 12 | SecondOrderOptimization (LM, tall) | 4.931646e6 | 9514 | 3338880 | 5 | 1.3482e-23 | true | ok | NaN | abs\_dcost |
| 12 | CaNNOLeS | 3.3017295e6 | 222 | 1259808 | 6 | 8.4917e-16 | true | ok | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 3.0000426333e10 | 6651530 | 78355907024 | 87 | 3.0775e-12 | false | timeout | NaN | max\_time |
| 12 | JSOSolvers (tron) | 3.000118025e10 | 6597478 | 77718384144 | 178 | 6.3896e-12 | false | timeout | NaN | max\_time |
| 12 | Ipopt | 7.66275e6 | 740 | 11347760 | 9 | 5.4678e-14 | true | ok | NaN | first\_order |
| 12 | MadNLP | 3.393625e6 | 792 | 7375296 | 5 | 6.7695e-09 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | SecondOrderOptimization (LM) | 1.5598125e6 | 19958 | 5148160 | 5 | 5.3154e-23 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 2.479833e6 | 19958 | 5148160 | 5 | 1.7398e-25 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | SecondOrderOptimization (LM, tall) | 1.2681125e7 | 16202 | 6281872 | 5 | 5.2728e-23 | true | ok | NaN | grad\_tol |
| 16 | CaNNOLeS | 5.8816045e6 | 226 | 2370400 | 5 | 1.8425e-14 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 3.0000846417e10 | 3803688 | 74538657712 | 39 | 1.4250e-11 | false | timeout | NaN | max\_time |
| 16 | JSOSolvers (tron) | 3.0003550125e10 | 3802348 | 74511057664 | 52 | 1.4656e-11 | false | timeout | NaN | max\_time |
| 16 | Ipopt | 1.21856665e7 | 740 | 19373856 | 9 | 2.8960e-14 | true | ok | NaN | first\_order |
| 16 | MadNLP | 6.4331045e6 | 833 | 14585168 | 6 | 2.3365e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 24 | SecondOrderOptimization (LM) | 3.8791875e6 | 43367 | 11368192 | 5 | 3.9394e-24 | true | ok | NaN | abs\_dcost |
| 24 | SecondOrderOptimization (Dogleg) | 6.0480415e6 | 43367 | 11368192 | 5 | 1.0599e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 24 | SecondOrderOptimization (LM, tall) | 5.00424585e7 | 34830 | 17441712 | 5 | 4.3340e-24 | true | ok | NaN | abs\_dcost |
| 24 | CaNNOLeS | 1.35287705e7 | 228 | 4834176 | 5 | 1.9298e-17 | true | ok | NaN | first\_order |
| 24 | JSOSolvers (trunk) | 3.0001527e10 | 1701938 | 72996828016 | 18 | 1.2649e-10 | false | timeout | NaN | max\_time |
| 24 | JSOSolvers (tron) | 3.0006473125e10 | 1702828 | 73032911792 | 13 | 5.2108e-10 | false | timeout | NaN | max\_time |
| 24 | Ipopt | 3.4152208e7 | 882 | 52291856 | 11 | 6.0972e-16 | true | ok | NaN | first\_order |
| 24 | MadNLP | 1.5439e7 | 845 | 32202736 | 6 | 1.3226e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | SecondOrderOptimization (LM) | 7.5295625e6 | 75994 | 20140496 | 5 | 3.0721e-23 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 9.6033755e6 | 65242 | 18960848 | 4 | 2.9511e-24 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 1.2079475e8 | 60800 | 39614704 | 5 | 3.0915e-23 | true | ok | NaN | grad\_tol |
| 32 | CaNNOLeS | 3.3396146e7 | 228 | 8092544 | 4 | 1.6044e-17 | true | ok | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 3.0004509375e10 | 965240 | 67786879056 | 14 | 1.5715e-09 | false | timeout | NaN | max\_time |
| 32 | JSOSolvers (tron) | 3.0015509792e10 | 951688 | 66830369136 | 5 | 1.7443e-09 | false | timeout | NaN | max\_time |
| 32 | Ipopt | 4.8534188e7 | 740 | 88675856 | 9 | 1.3067e-14 | true | ok | NaN | first\_order |
| 32 | MadNLP | 2.97560205e7 | 886 | 63895632 | 7 | 2.1740e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 48 | SecondOrderOptimization (LM) | 2.0102959e7 | 168707 | 44536016 | 5 | 2.1838e-23 | true | ok | NaN | abs\_dcost |
| 48 | SecondOrderOptimization (Dogleg) | 7.3063125e7 | 338051 | 63115472 | 10 | 1.6149e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 48 | SecondOrderOptimization (LM, tall) | 5.271773955e8 | 134398 | 107482320 | 5 | 2.3004e-23 | true | ok | NaN | abs\_dcost |
| 48 | CaNNOLeS | 8.7530625e7 | 228 | 18045824 | 4 | 1.8343e-18 | true | ok | NaN | first\_order |
| 48 | JSOSolvers (trunk) | 3.0006432125e10 | 419840 | 67006293584 | 14 | 1.4780e-04 | false | timeout | NaN | max\_time |
| 48 | JSOSolvers (tron) | 3.0017823167e10 | 415318 | 66273739168 | 2 | 1.7458e-04 | false | timeout | NaN | max\_time |
| 48 | Ipopt | 2.55304917e8 | 1542 | 382685824 | 19 | 1.4722e-23 | true | ok | NaN | acceptable |
| 48 | MadNLP | 9.4948166e7 | 804 | 105275120 | 5 | 2.7168e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | SecondOrderOptimization (LM) | 3.66209795e7 | 340076 | 86467392 | 6 | 5.9433e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (Dogleg) | 1.027375415e8 | 426091 | 95904560 | 7 | 5.1770e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (LM, tall) | 1.79835525e9 | 266680 | 241669584 | 6 | 5.0499e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | CaNNOLeS | 1.862889785e8 | 228 | 37067648 | 4 | 1.0359e-19 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 3.0010185709e10 | 230450 | 64500395984 | 9 | 6.9715e-01 | false | timeout | NaN | max\_time |
| 64 | JSOSolvers (tron) | 3.0037119208e10 | 230758 | 64567781152 | 1 | 1.8028e+01 | false | timeout | NaN | max\_time |
| 64 | Ipopt | 7.01227854e8 | 1510 | 718528512 | 19 | 4.8607e-23 | true | ok | NaN | acceptable |
| 64 | MadNLP | 1.88752e8 | 804 | 186132512 | 5 | 1.6882e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 96 | SecondOrderOptimization (LM) | 1.291414375e8 | 855474 | 253053728 | 7 | 2.7074e-22 | true | ok | NaN | abs\_dcost |
| 96 | SecondOrderOptimization (Dogleg) | 2.119175e8 | 758710 | 200624992 | 6 | 2.6032e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 96 | SecondOrderOptimization (LM, tall) | 9.390193208e9 | 662432 | 758364176 | 7 | 2.7543e-22 | true | ok | NaN | abs\_dcost |
| 96 | CaNNOLeS | 5.15575042e8 | 228 | 85384064 | 4 | 1.6285e-21 | true | ok | NaN | first\_order |
| 96 | JSOSolvers (trunk) | 3.0036231792e10 | 96050 | 60384892880 | 5 | 5.2944e+03 | false | timeout | NaN | max\_time |
| 96 | JSOSolvers (tron) | 3.009934575e10 | 96749 | 60700373856 | 1 | 5.0025e+03 | false | timeout | NaN | max\_time |
| 96 | Ipopt | 2.796610416e9 | 2149 | 1903463056 | 26 | 2.4973e-22 | true | ok | NaN | acceptable |
| 96 | MadNLP | 6.684163755e8 | 893 | 567852592 | 7 | 3.6600e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | SecondOrderOptimization (LM) | 2.85129166e8 | 1689484 | 403946128 | 8 | 7.6073e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (Dogleg) | 3.20915666e8 | 1173386 | 346126960 | 5 | 7.9228e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM, tall) | 3.1636345166e10 | 1296924 | 1735681024 | 8 | 8.1795e-22 | true | ok | NaN | abs\_dcost, step\_size, max\_time |
| 128 | CaNNOLeS | 1.290611083e9 | 228 | 157801344 | 4 | 2.8962e-21 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 3.0041060125e10 | 58010 | 64807990736 | 5 | 1.1678e+05 | false | timeout | NaN | max\_time |
| 128 | JSOSolvers (tron) | 3.020664775e10 | 58079 | 64709291744 | 1 | 1.2036e+05 | false | timeout | NaN | max\_time |
| 128 | Ipopt | 4.644501791e9 | 2257 | 3377587760 | 26 | 7.4245e-22 | true | ok | NaN | acceptable |
| 128 | MadNLP | 1.63404675e9 | 935 | 1138438096 | 8 | 1.3112e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 192 | SecondOrderOptimization (LM) | 9.53223146e8 | 4177418 | 1172350000 | 9 | 4.3345e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (Dogleg) | 8.948325415e8 | 2629130 | 863069232 | 5 | 4.3081e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (LM, tall) | 3.9640884333e10 | 1247704 | 5477646880 | 2 | 7.5129e-03 | false | timeout | NaN | max\_time |
| 192 | CaNNOLeS | 3.687395167e9 | 228 | 361651072 | 4 | 4.2749e-21 | true | ok | NaN | first\_order |
| 192 | JSOSolvers (trunk) | 3.0115196084e10 | 22970 | 58254753232 | 3 | 1.5849e+06 | false | timeout | NaN | max\_time |
| 192 | JSOSolvers (tron) | 3.0517377792e10 | 23879 | 59596956896 | 1 | 1.5802e+06 | false | timeout | NaN | max\_time |
| 192 | Ipopt | 1.4229116958e10 | 2617 | 7881019840 | 27 | 4.0159e-21 | true | ok | NaN | acceptable |
| 192 | MadNLP | 6.1129975e9 | 1019 | 3234463072 | 10 | 6.6633e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | SecondOrderOptimization (LM) | 1.564093542e9 | 8101812 | 2106438688 | 10 | 1.3795e-20 | true | ok | NaN | abs\_dcost |
| 256 | SecondOrderOptimization (Dogleg) | 4.481789375e9 | 9477978 | 2261948960 | 9 | 1.2919e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (LM, tall) | 7.277927425e10 | 2696204 | 26086711152 | 3 | 4.9862e-02 | false | timeout | NaN | max\_time |
| 256 | CaNNOLeS | 1.0197384166e10 | 228 | 591403904 | 4 | 1.2505e-20 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (trunk) | 3.0152019167e10 | 15470 | 69992336592 | 3 | 3.5305e+06 | false | timeout | NaN | max\_time |
| 256 | JSOSolvers (tron) | 3.0858021042e10 | 16079 | 72446910176 | 1 | 3.5279e+06 | false | timeout | NaN | max\_time |
| 256 | Ipopt | 3.0073305792e10 | 2221 | 12961449344 | 25 | 1.1618e-20 | false | timeout | NaN | max\_time |
| 256 | MadNLP | 1.583435e10 | 1229 | 8284051088 | 15 | 1.3193e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
