# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Derivatives**: mixed
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T02:41:06
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 2c10368
- **Dependency Commits**: OptimizationVariableInterface f130043, SecondOrderOptimization 377b96e, NLLSModel 78a4ef5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 1259.8235294117646 | 1 | 16 | 24792.0 | 421 | 49216 |
| 4 | BundleAdjustmentModels | 4758.4 | 1 | 16 | 56750.0 | 22 | 190896 |
| 8 | NLLSModel | 2351.8888888888887 | 1 | 16 | 50917.0 | 841 | 98176 |
| 8 | BundleAdjustmentModels | 9458.333333333334 | 1 | 16 | 134458.0 | 22 | 479552 |
| 12 | NLLSModel | 4266.6 | 1 | 16 | 92041.0 | 1513 | 176512 |
| 12 | BundleAdjustmentModels | 17375.0 | 1 | 16 | 219333.0 | 24 | 891808 |
| 16 | NLLSModel | 7694.333333333333 | 1 | 16 | 157250.0 | 2689 | 313600 |
| 16 | BundleAdjustmentModels | 30458.0 | 1 | 16 | 418833.0 | 24 | 1551888 |
| 24 | NLLSModel | 16750.0 | 1 | 16 | 367667.0 | 6063 | 706912 |
| 24 | BundleAdjustmentModels | 65625.0 | 1 | 16 | 877708.0 | 24 | 3494080 |
| 32 | NLLSModel | 28542.0 | 1 | 16 | 677958.0 | 10753 | 1253632 |
| 32 | BundleAdjustmentModels | 116375.0 | 1 | 16 | 1.56775e6 | 24 | 6132096 |
| 48 | NLLSModel | 64417.0 | 1 | 16 | 1.463375e6 | 24193 | 2820352 |
| 48 | BundleAdjustmentModels | 272083.0 | 1 | 16 | 3.350208e6 | 24 | 13774640 |
| 64 | NLLSModel | 121000.0 | 1 | 16 | 2.735542e6 | 43009 | 5013760 |
| 64 | BundleAdjustmentModels | 477834.0 | 1 | 16 | 6.038708e6 | 24 | 24445104 |
| 96 | NLLSModel | 263458.0 | 1 | 16 | 5.976083e6 | 96769 | 11280640 |
| 96 | BundleAdjustmentModels | 1.125666e6 | 1 | 16 | 1.4260333e7 | 25 | 54910064 |
| 128 | NLLSModel | 469375.0 | 1 | 16 | 1.1375959e7 | 172033 | 20054272 |
| 128 | BundleAdjustmentModels | 1.879792e6 | 1 | 16 | 2.610375e7 | 25 | 97566320 |
| 192 | NLLSModel | 1.076e6 | 1 | 16 | 2.6665458e7 | 387073 | 45121792 |
| 192 | BundleAdjustmentModels | 4.379708e6 | 1 | 16 | 5.834075e7 | 25 | 219453040 |
| 256 | NLLSModel | 1.877916e6 | 1 | 16 | 5.8332e7 | 688129 | 97518016 |
| 256 | BundleAdjustmentModels | 7.633167e6 | 1 | 16 | 1.09250917e8 | 25 | 390060656 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 4 | SecondOrderOptimization (LM) | 312167.0 | 2984 | 608880 | 5 | 1.6977e-23 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 322042.0 | 2984 | 608880 | 5 | 2.4149e-23 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Gauss-Newton) | 315333.5 | 2951 | 548800 | 5 | 3.8913e-25 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall) | 550791.5 | 2346 | 657328 | 5 | 1.6940e-23 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall, LSMR) | 2.427771e6 | 2384 | 541456 | 5 | 7.3938e-23 | true | ok | NaN | grad\_tol |
| 4 | CaNNOLeS | 955604.0 | 191 | 359056 | 7 | 4.7517e-16 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 8.237143125e8 | 359780 | 1188428656 | 25 | 6.8334e-14 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (tron) | 8.345789833e9 | 3630138 | 11992521024 | 501 | 5.9770e-12 | false | not_converged | NaN | max\_iter; cost test passes |
| 4 | Ipopt | 2.6929795e6 | 639 | 2349808 | 8 | 4.0004e-15 | true | ok | NaN | first\_order |
| 4 | MadNLP | 1.5818335e6 | 827 | 2362448 | 7 | 4.7778e-13 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | SecondOrderOptimization (LM) | 646500.0 | 5646 | 1437200 | 5 | 4.5742e-26 | true | ok | NaN | abs\_dcost |
| 8 | SecondOrderOptimization (Dogleg) | 834625.0 | 5646 | 1437200 | 5 | 4.5531e-26 | true | ok | NaN | abs\_dcost, step\_size |
| 8 | SecondOrderOptimization (Gauss-Newton) | 749229.5 | 5611 | 1244944 | 5 | 4.5531e-26 | true | ok | NaN | abs\_dcost, step\_size |
| 8 | SecondOrderOptimization (LM, tall) | 1.728104e6 | 4476 | 1578688 | 5 | 5.1991e-26 | true | ok | NaN | abs\_dcost |
| 8 | SecondOrderOptimization (LM, tall, LSMR) | 6.5529375e6 | 4348 | 1111840 | 5 | 1.3568e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 8 | CaNNOLeS | 1.785354e6 | 208 | 712224 | 6 | 3.4177e-16 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 3.0000233375e10 | 7746405 | 51031154832 | 174 | 6.5145e-13 | false | timeout | NaN | max\_time; cost test passes |
| 8 | JSOSolvers (tron) | 3.0000758708e10 | 7749042 | 51048779360 | 429 | 8.2789e-12 | false | timeout | NaN | max\_time; cost test passes |
| 8 | Ipopt | 5.318729e6 | 773 | 6826928 | 10 | 1.4563e-14 | true | ok | NaN | first\_order |
| 8 | MadNLP | 2.848479e6 | 827 | 5363552 | 7 | 1.8327e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | SecondOrderOptimization (LM) | 1.1246875e6 | 9939 | 2688912 | 5 | 1.3519e-23 | true | ok | NaN | abs\_dcost |
| 12 | SecondOrderOptimization (Dogleg) | 1.6886245e6 | 11365 | 2863792 | 5 | 1.1215e-25 | true | ok | NaN | grad\_tol |
| 12 | SecondOrderOptimization (Gauss-Newton) | 1.979125e6 | 12841 | 2677376 | 7 | 1.2415e-25 | true | ok | NaN | abs\_dcost, step\_size |
| 12 | SecondOrderOptimization (LM, tall) | 5.53075e6 | 7381 | 3256432 | 5 | 1.3435e-23 | true | ok | NaN | abs\_dcost |
| 12 | SecondOrderOptimization (LM, tall, LSMR) | 1.30324165e7 | 7423 | 2129696 | 5 | 5.4962e-23 | true | ok | NaN | abs\_dcost |
| 12 | CaNNOLeS | 3.3251665e6 | 222 | 1259808 | 6 | 8.4917e-16 | true | ok | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 3.0000498625e10 | 6354376 | 74855400720 | 84 | 3.2660e-12 | false | timeout | NaN | max\_time; cost test passes |
| 12 | JSOSolvers (tron) | 3.0001717791e10 | 6306628 | 74292093584 | 167 | 7.1698e-12 | false | timeout | NaN | max\_time; cost test passes |
| 12 | Ipopt | 8.0905205e6 | 750 | 11355824 | 9 | 5.4678e-14 | true | ok | NaN | first\_order |
| 12 | MadNLP | 3.787646e6 | 792 | 7375296 | 5 | 6.7695e-09 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | SecondOrderOptimization (LM) | 2.089292e6 | 17090 | 4574864 | 5 | 5.2716e-23 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 3.003375e6 | 17090 | 4574864 | 5 | 1.7662e-25 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | SecondOrderOptimization (Gauss-Newton) | 2.774625e6 | 17051 | 3906080 | 5 | 1.7662e-25 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | SecondOrderOptimization (LM, tall) | 1.33773335e7 | 12632 | 6161744 | 5 | 5.2676e-23 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (LM, tall, LSMR) | 1.8953417e7 | 12674 | 3711776 | 5 | 5.2298e-22 | true | ok | NaN | grad\_tol |
| 16 | CaNNOLeS | 6.038708e6 | 226 | 2370400 | 5 | 1.8425e-14 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 3.000057075e10 | 3631218 | 71158797616 | 38 | 1.7254e-11 | false | timeout | NaN | max\_time; cost test passes |
| 16 | JSOSolvers (tron) | 3.000256775e10 | 3641998 | 71368710784 | 49 | 1.7789e-11 | false | timeout | NaN | max\_time; cost test passes |
| 16 | Ipopt | 1.26995625e7 | 750 | 19383456 | 9 | 2.8960e-14 | true | ok | NaN | first\_order |
| 16 | MadNLP | 6.493729e6 | 833 | 14585168 | 6 | 2.3365e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 24 | SecondOrderOptimization (LM) | 5.1601875e6 | 37652 | 10231456 | 5 | 4.0136e-24 | true | ok | NaN | abs\_dcost |
| 24 | SecondOrderOptimization (Dogleg) | 6.00875e6 | 31590 | 9524800 | 4 | 1.0712e-24 | true | ok | NaN | grad\_tol |
| 24 | SecondOrderOptimization (Gauss-Newton) | 5.530833e6 | 31578 | 8150320 | 4 | 1.0712e-24 | true | ok | NaN | grad\_tol |
| 24 | SecondOrderOptimization (LM, tall) | 5.2361834e7 | 27462 | 17224400 | 5 | 4.4354e-24 | true | ok | NaN | abs\_dcost |
| 24 | SecondOrderOptimization (LM, tall, LSMR) | 6.13471665e7 | 27491 | 9758688 | 5 | 4.5762e-24 | true | ok | NaN | abs\_dcost |
| 24 | CaNNOLeS | 1.3800417e7 | 228 | 4834176 | 5 | 1.9298e-17 | true | ok | NaN | first\_order |
| 24 | JSOSolvers (trunk) | 3.0001775959e10 | 1620956 | 69523797808 | 17 | 1.4514e-10 | false | timeout | NaN | max\_time; cost test passes |
| 24 | JSOSolvers (tron) | 3.0003182459e10 | 1628038 | 69824959280 | 12 | 5.4625e-10 | false | timeout | NaN | max\_time; cost test passes |
| 24 | Ipopt | 3.4629833e7 | 892 | 52307600 | 11 | 6.0972e-16 | true | ok | NaN | first\_order |
| 24 | MadNLP | 1.5232063e7 | 845 | 32202736 | 6 | 1.3226e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | SecondOrderOptimization (LM) | 9.898521e6 | 66227 | 18066800 | 5 | 3.1263e-23 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 1.1138771e7 | 55475 | 16813424 | 4 | 4.3259e-23 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Gauss-Newton) | 1.1452354e7 | 55434 | 14396304 | 4 | 4.3259e-23 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 1.354736665e8 | 48031 | 39166400 | 5 | 3.0756e-23 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall, LSMR) | 1.19785e8 | 48091 | 19323328 | 5 | 1.9643e-23 | true | ok | NaN | abs\_dcost |
| 32 | CaNNOLeS | 3.49386455e7 | 228 | 8092544 | 4 | 1.6044e-17 | true | ok | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 3.000243975e10 | 922580 | 64790713680 | 14 | 1.6297e-09 | false | timeout | NaN | max\_time; cost test passes |
| 32 | JSOSolvers (tron) | 3.0015344708e10 | 926008 | 65026770288 | 5 | 1.7741e-09 | false | timeout | NaN | max\_time; cost test passes |
| 32 | Ipopt | 5.128775e7 | 750 | 87908240 | 9 | 1.3067e-14 | true | ok | NaN | first\_order |
| 32 | MadNLP | 3.03510415e7 | 886 | 63895632 | 7 | 2.1740e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 48 | SecondOrderOptimization (LM) | 2.5085792e7 | 147582 | 39966112 | 5 | 2.2190e-23 | true | ok | NaN | abs\_dcost |
| 48 | SecondOrderOptimization (Dogleg) | 3.5952167e7 | 147582 | 39966112 | 5 | 1.6863e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 48 | SecondOrderOptimization (Gauss-Newton) | 3.38664165e7 | 147541 | 34596800 | 5 | 1.6863e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 48 | SecondOrderOptimization (LM, tall) | 6.169747705e8 | 106426 | 106571120 | 5 | 2.2296e-23 | true | ok | NaN | abs\_dcost |
| 48 | SecondOrderOptimization (LM, tall, LSMR) | 3.24653187e8 | 106479 | 52594944 | 5 | 2.4037e-23 | true | ok | NaN | abs\_dcost |
| 48 | CaNNOLeS | 8.80016045e7 | 228 | 18045824 | 4 | 1.8343e-18 | true | ok | NaN | first\_order |
| 48 | JSOSolvers (trunk) | 3.0006503166e10 | 402870 | 64295796720 | 14 | 1.7687e-04 | false | timeout | NaN | max\_time |
| 48 | JSOSolvers (tron) | 3.0019690083e10 | 404878 | 64607214496 | 2 | 1.9467e-04 | false | timeout | NaN | max\_time |
| 48 | Ipopt | 2.661757915e8 | 1552 | 430951424 | 19 | 1.4722e-23 | true | ok | NaN | acceptable |
| 48 | MadNLP | 9.3708333e7 | 804 | 105275120 | 5 | 2.7168e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | SecondOrderOptimization (LM) | 5.9982771e7 | 304172 | 77493552 | 6 | 5.5126e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (Dogleg) | 1.08238667e8 | 304168 | 77493488 | 6 | 5.0796e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (Gauss-Newton) | 1.049878335e8 | 304130 | 68090176 | 6 | 5.0796e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (LM, tall) | 1.869355167e9 | 218560 | 239444992 | 6 | 5.0393e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (LM, tall, LSMR) | 9.796821045e8 | 218611 | 115050864 | 6 | 5.1718e-19 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | CaNNOLeS | 1.85221333e8 | 228 | 40147840 | 4 | 1.0359e-19 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 3.0017446417e10 | 229730 | 64298808272 | 9 | 7.0203e-01 | false | timeout | NaN | max\_time |
| 64 | JSOSolvers (tron) | 3.0038960542e10 | 231658 | 64819765792 | 1 | 1.8024e+01 | false | timeout | NaN | max\_time |
| 64 | Ipopt | 7.284056045e8 | 1520 | 980152704 | 19 | 4.8607e-23 | true | ok | NaN | acceptable |
| 64 | MadNLP | 1.89687416e8 | 804 | 185804832 | 5 | 1.6882e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 96 | SecondOrderOptimization (LM) | 2.18833917e8 | 778595 | 223513536 | 7 | 2.7990e-22 | true | ok | NaN | abs\_dcost |
| 96 | SecondOrderOptimization (Dogleg) | 5.319771875e8 | 1455971 | 308145088 | 12 | 2.6579e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 96 | SecondOrderOptimization (Gauss-Newton) | 2.10930167e8 | 488253 | 160421920 | 4 | 4.6596e+05 | false | not_converged | NaN | max\_fails |
| 96 | SecondOrderOptimization (LM, tall) | 9.751942583e9 | 557975 | 762901952 | 7 | 2.7272e-22 | true | ok | NaN | abs\_dcost |
| 96 | SecondOrderOptimization (LM, tall, LSMR) | 3.650638458e9 | 558026 | 350384944 | 7 | 2.9533e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 96 | CaNNOLeS | 5.40681396e8 | 228 | 79584128 | 4 | 1.6285e-21 | true | ok | NaN | first\_order |
| 96 | JSOSolvers (trunk) | 3.0025590292e10 | 101210 | 63619139024 | 5 | 4.8282e+03 | false | timeout | NaN | max\_time |
| 96 | JSOSolvers (tron) | 3.0104262417e10 | 99389 | 62379478880 | 1 | 4.6327e+03 | false | timeout | NaN | max\_time |
| 96 | Ipopt | 2.821030708e9 | 2159 | 1903492112 | 26 | 2.4973e-22 | true | ok | NaN | acceptable |
| 96 | MadNLP | 6.482190835e8 | 893 | 586038832 | 7 | 3.6600e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | SecondOrderOptimization (LM) | 5.763975e8 | 1554574 | 373286816 | 8 | 8.0193e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (Dogleg) | 6.34646042e8 | 1554573 | 373286800 | 7 | 8.0595e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (Gauss-Newton) | 6.54961271e8 | 1382501 | 315144144 | 7 | 8.3482e-22 | true | ok | NaN | step\_size |
| 128 | SecondOrderOptimization (LM, tall) | 3.24199575e10 | 1112931 | 1737403648 | 8 | 8.2214e-22 | true | ok | NaN | abs\_dcost, step\_size, max\_time |
| 128 | SecondOrderOptimization (LM, tall, LSMR) | 1.0315862584e10 | 1112982 | 784674416 | 8 | 4.1854e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | CaNNOLeS | 1.128632667e9 | 228 | 175741824 | 4 | 2.8962e-21 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 3.0041238584e10 | 52070 | 58167502544 | 5 | 1.2275e+05 | false | timeout | NaN | max\_time |
| 128 | JSOSolvers (tron) | 3.0386259958e10 | 52799 | 58784528096 | 1 | 1.3271e+05 | false | timeout | NaN | max\_time |
| 128 | Ipopt | 4.541391208e9 | 2267 | 3377694640 | 26 | 7.4245e-22 | true | ok | NaN | acceptable |
| 128 | MadNLP | 1.825504708e9 | 935 | 1174597584 | 8 | 1.3112e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 192 | SecondOrderOptimization (LM) | 1.8088565e9 | 3880075 | 1109461664 | 9 | 4.1437e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (Dogleg) | 1.587133792e9 | 3105931 | 945900192 | 6 | 4.3985e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (Gauss-Newton) | 2.130332583e9 | 3492965 | 836528896 | 8 | 4.2955e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (LM, tall) | 3.946953125e10 | 839839 | 5472986736 | 2 | 7.5129e-03 | false | timeout | NaN | max\_time |
| 192 | SecondOrderOptimization (LM, tall, LSMR) | 3.100042375e10 | 1392852 | 2362824704 | 4 | 4.1795e-07 | false | timeout | NaN | max\_time; cost test passes |
| 192 | CaNNOLeS | 3.676235834e9 | 228 | 368532352 | 4 | 4.2749e-21 | true | ok | NaN | first\_order |
| 192 | JSOSolvers (trunk) | 3.0101800959e10 | 22670 | 57440888016 | 3 | 1.5858e+06 | false | timeout | NaN | max\_time |
| 192 | JSOSolvers (tron) | 3.0484189417e10 | 23399 | 58403618016 | 1 | 1.5802e+06 | false | timeout | NaN | max\_time |
| 192 | Ipopt | 1.4359625958e10 | 2627 | 7881118528 | 27 | 4.0159e-21 | true | ok | NaN | acceptable |
| 192 | MadNLP | 6.227541542e9 | 1019 | 3222453600 | 10 | 6.6633e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | SecondOrderOptimization (LM) | 4.220132916e9 | 7582070 | 2112208112 | 10 | 1.3623e-20 | true | ok | NaN | abs\_dcost |
| 256 | SecondOrderOptimization (Dogleg) | 4.333581541e9 | 5517554 | 1705590384 | 6 | 1.2868e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (Gauss-Newton) | 4.37024e9 | 4829382 | 1509409488 | 6 | 1.2273e-20 | true | ok | NaN | step\_size |
| 256 | SecondOrderOptimization (LM, tall) | 7.6075267542e10 | 1979921 | 27411551872 | 3 | 4.9862e-02 | false | timeout | NaN | max\_time |
| 256 | SecondOrderOptimization (LM, tall, LSMR) | 4.631494975e10 | 1979808 | 5180297856 | 3 | 4.9862e-02 | false | timeout | NaN | max\_time |
| 256 | CaNNOLeS | 1.0305750917e10 | 228 | 685104000 | 4 | 1.2505e-20 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (trunk) | 3.0191669833e10 | 12050 | 54091100112 | 3 | 3.5784e+06 | false | timeout | NaN | max\_time |
| 256 | JSOSolvers (tron) | 3.10335455e10 | 13439 | 59608220384 | 1 | 3.5662e+06 | false | timeout | NaN | max\_time |
| 256 | Ipopt | 3.1040164333e10 | 2407 | 14087929424 | 26 | 1.1618e-20 | false | timeout | NaN | max\_time; cost test passes |
| 256 | MadNLP | 1.5781098292e10 | 1229 | 8351962768 | 15 | 1.3193e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
