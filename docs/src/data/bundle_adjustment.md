# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Derivatives**: mixed
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T01:52:15
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=1
- **Git Commit**: 2c10368
- **Dependency Commits**: OptimizationVariableInterface f130043, SecondOrderOptimization 377b96e, NLLSModel 78a4ef5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 1320.3125 | 1 | 16 | 10375.0 | 421 | 49216 |
| 4 | BundleAdjustmentModels | 4641.8 | 1 | 16 | 59333.0 | 22 | 190896 |
| 8 | NLLSModel | 1473.2142857142858 | 1 | 16 | 27500.0 | 841 | 98176 |
| 8 | BundleAdjustmentModels | 9180.666666666666 | 1 | 16 | 139417.0 | 22 | 479552 |
| 12 | NLLSModel | 3204.2 | 1 | 16 | 44583.0 | 1513 | 176512 |
| 12 | BundleAdjustmentModels | 17500.0 | 1 | 16 | 236833.0 | 24 | 891808 |
| 16 | NLLSModel | 3208.0 | 1 | 16 | 66416.0 | 2689 | 313600 |
| 16 | BundleAdjustmentModels | 29166.0 | 1 | 16 | 419125.0 | 24 | 1551888 |
| 24 | NLLSModel | 4308.4 | 1 | 16 | 161083.0 | 6063 | 706912 |
| 24 | BundleAdjustmentModels | 65667.0 | 1 | 16 | 899500.0 | 24 | 3494080 |
| 32 | NLLSModel | 6541.75 | 1 | 16 | 251666.0 | 10753 | 1253632 |
| 32 | BundleAdjustmentModels | 121542.0 | 1 | 16 | 1.661334e6 | 24 | 6132096 |
| 48 | NLLSModel | 11417.0 | 1 | 16 | 586042.0 | 24193 | 2820352 |
| 48 | BundleAdjustmentModels | 270375.0 | 1 | 16 | 3.575e6 | 24 | 13774640 |
| 64 | NLLSModel | 19333.0 | 1 | 16 | 1.188083e6 | 43009 | 5013760 |
| 64 | BundleAdjustmentModels | 467291.0 | 1 | 16 | 6.18425e6 | 24 | 24445104 |
| 96 | NLLSModel | 40875.0 | 1 | 16 | 2.5785e6 | 96769 | 11280640 |
| 96 | BundleAdjustmentModels | 1.058334e6 | 1 | 16 | 1.4612208e7 | 25 | 54910064 |
| 128 | NLLSModel | 67167.0 | 1 | 16 | 4.46975e6 | 172033 | 20054272 |
| 128 | BundleAdjustmentModels | 1.907667e6 | 1 | 16 | 2.5482792e7 | 25 | 97566320 |
| 192 | NLLSModel | 144833.0 | 1 | 16 | 1.2172667e7 | 387073 | 45121792 |
| 192 | BundleAdjustmentModels | 4.26925e6 | 1 | 16 | 6.0909125e7 | 25 | 219453040 |
| 256 | NLLSModel | 278208.0 | 1 | 16 | 1.8248083e7 | 688129 | 97518016 |
| 256 | BundleAdjustmentModels | 7.744042e6 | 1 | 16 | 1.03607292e8 | 25 | 390060656 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 4 | SecondOrderOptimization (LM) | 280771.0 | 3037 | 660240 | 5 | 1.6928e-23 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 356854.0 | 3877 | 758160 | 6 | 4.4130e-26 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Gauss-Newton) | 384875.0 | 2586 | 553040 | 4 | 6.5221e+02 | false | not_converged | NaN | max\_fails |
| 4 | SecondOrderOptimization (LM, tall) | 490250.0 | 2354 | 658032 | 5 | 1.6940e-23 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM, tall, LSMR) | 1.7571455e6 | 2392 | 542160 | 5 | 7.3938e-23 | true | ok | NaN | grad\_tol |
| 4 | CaNNOLeS | 981291.5 | 191 | 359056 | 7 | 4.7517e-16 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 7.843832915e8 | 359780 | 1188428656 | 25 | 6.8334e-14 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (tron) | 7.709470625e9 | 3630138 | 11992521024 | 501 | 5.9770e-12 | false | not_converged | NaN | max\_iter; cost test passes |
| 4 | Ipopt | 2.9517915e6 | 639 | 2349808 | 8 | 4.0004e-15 | true | ok | NaN | first\_order |
| 4 | MadNLP | 1.617188e6 | 827 | 2362448 | 7 | 4.7778e-13 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | SecondOrderOptimization (LM) | 471979.0 | 5700 | 1606080 | 5 | 5.1870e-26 | true | ok | NaN | abs\_dcost |
| 8 | SecondOrderOptimization (Dogleg) | 694542.0 | 5700 | 1606080 | 5 | 1.1867e-25 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (Gauss-Newton) | 675895.5 | 5665 | 1413824 | 5 | 1.1867e-25 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM, tall) | 1.5306045e6 | 4314 | 1576768 | 5 | 5.1991e-26 | true | ok | NaN | abs\_dcost |
| 8 | SecondOrderOptimization (LM, tall, LSMR) | 3.4130835e6 | 4356 | 1112640 | 5 | 1.3568e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 8 | CaNNOLeS | 1.7807915e6 | 208 | 712224 | 6 | 3.4177e-16 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 3.0002413708e10 | 8046194 | 53006777536 | 181 | 6.0503e-13 | false | timeout | NaN | max\_time; cost test passes |
| 8 | JSOSolvers (tron) | 3.0023895833e10 | 7994553 | 52666169456 | 445 | 7.9357e-12 | false | timeout | NaN | max\_time; cost test passes |
| 8 | Ipopt | 5.384813e6 | 773 | 6826928 | 10 | 1.4563e-14 | true | ok | NaN | first\_order |
| 8 | MadNLP | 2.6949585e6 | 827 | 5363552 | 7 | 1.8327e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | SecondOrderOptimization (LM) | 854042.0 | 9910 | 3013552 | 5 | 1.3527e-23 | true | ok | NaN | abs\_dcost |
| 12 | SecondOrderOptimization (Dogleg) | 1.606333e6 | 12934 | 3366064 | 6 | 7.5220e-26 | true | ok | NaN | step\_size |
| 12 | SecondOrderOptimization (Gauss-Newton) | 1.118875e6 | 8362 | 2474624 | 4 | 9.9957e+03 | false | not_converged | NaN | max\_fails |
| 12 | SecondOrderOptimization (LM, tall) | 4.907083e6 | 7389 | 3257232 | 5 | 1.3435e-23 | true | ok | NaN | abs\_dcost |
| 12 | SecondOrderOptimization (LM, tall, LSMR) | 7.049229e6 | 7431 | 2130496 | 5 | 5.4962e-23 | true | ok | NaN | abs\_dcost |
| 12 | CaNNOLeS | 3.4459585e6 | 222 | 1259808 | 6 | 8.4917e-16 | true | ok | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 3.0002059958e10 | 6406876 | 75473864720 | 84 | 3.2300e-12 | false | timeout | NaN | max\_time; cost test passes |
| 12 | JSOSolvers (tron) | 3.0003178833e10 | 6409618 | 75505343248 | 170 | 7.0070e-12 | false | timeout | NaN | max\_time; cost test passes |
| 12 | Ipopt | 8.0312915e6 | 750 | 11355824 | 9 | 5.4678e-14 | true | ok | NaN | first\_order |
| 12 | MadNLP | 3.5680005e6 | 792 | 7375296 | 5 | 6.7695e-09 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | SecondOrderOptimization (LM) | 1.539667e6 | 17197 | 5162400 | 5 | 5.3168e-23 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 2.448271e6 | 17151 | 5158864 | 5 | 1.8116e-25 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | SecondOrderOptimization (Gauss-Newton) | 2.3626255e6 | 17112 | 4490080 | 5 | 1.8116e-25 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | SecondOrderOptimization (LM, tall) | 1.27204995e7 | 12640 | 6162544 | 5 | 5.2676e-23 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (LM, tall, LSMR) | 9.1951465e6 | 12682 | 3712576 | 5 | 5.2298e-22 | true | ok | NaN | grad\_tol |
| 16 | CaNNOLeS | 5.942229e6 | 226 | 2370400 | 5 | 1.8425e-14 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 3.0000566e10 | 3719958 | 72897817648 | 38 | 1.6087e-11 | false | timeout | NaN | max\_time; cost test passes |
| 16 | JSOSolvers (tron) | 3.00021095e10 | 3673558 | 71987185792 | 49 | 1.7663e-11 | false | timeout | NaN | max\_time; cost test passes |
| 16 | Ipopt | 1.2657187e7 | 750 | 19383456 | 9 | 2.8960e-14 | true | ok | NaN | first\_order |
| 16 | MadNLP | 6.579396e6 | 833 | 14585168 | 6 | 2.3365e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 24 | SecondOrderOptimization (LM) | 3.842375e6 | 37713 | 11445200 | 5 | 3.9667e-24 | true | ok | NaN | abs\_dcost |
| 24 | SecondOrderOptimization (Dogleg) | 6.0684375e6 | 37713 | 11445200 | 5 | 1.1162e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 24 | SecondOrderOptimization (Gauss-Newton) | 5.66325e6 | 37673 | 10070272 | 5 | 1.1162e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 24 | SecondOrderOptimization (LM, tall) | 5.5802958e7 | 27470 | 17225200 | 5 | 4.4354e-24 | true | ok | NaN | abs\_dcost |
| 24 | SecondOrderOptimization (LM, tall, LSMR) | 1.7555625e7 | 27499 | 9759488 | 5 | 4.5762e-24 | true | ok | NaN | abs\_dcost |
| 24 | CaNNOLeS | 1.393275e7 | 228 | 4834176 | 5 | 1.9298e-17 | true | ok | NaN | first\_order |
| 24 | JSOSolvers (trunk) | 3.0001541459e10 | 1661150 | 71248088272 | 17 | 1.4349e-10 | false | timeout | NaN | max\_time; cost test passes |
| 24 | JSOSolvers (tron) | 3.0003467584e10 | 1647838 | 70674236720 | 12 | 5.4214e-10 | false | timeout | NaN | max\_time; cost test passes |
| 24 | Ipopt | 3.303725e7 | 892 | 52307600 | 11 | 6.0972e-16 | true | ok | NaN | first\_order |
| 24 | MadNLP | 1.50881455e7 | 845 | 32202736 | 6 | 1.3226e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | SecondOrderOptimization (LM) | 7.3790415e6 | 66288 | 20210368 | 5 | 3.0736e-23 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 9.5311665e6 | 55536 | 18956992 | 4 | 2.8701e-24 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Gauss-Newton) | 9.008604e6 | 55495 | 16539872 | 4 | 2.8701e-24 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 1.31956708e8 | 48041 | 37659904 | 5 | 3.0756e-23 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall, LSMR) | 3.7469167e7 | 48099 | 20110560 | 5 | 1.9643e-23 | true | ok | NaN | abs\_dcost |
| 32 | CaNNOLeS | 3.4189167e7 | 228 | 8092544 | 4 | 1.6044e-17 | true | ok | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 3.0002636666e10 | 936260 | 65751509328 | 14 | 1.6157e-09 | false | timeout | NaN | max\_time; cost test passes |
| 32 | JSOSolvers (tron) | 3.0013871708e10 | 935428 | 65688370800 | 5 | 1.7655e-09 | false | timeout | NaN | max\_time; cost test passes |
| 32 | Ipopt | 5.0333917e7 | 750 | 89841552 | 9 | 1.3067e-14 | true | ok | NaN | first\_order |
| 32 | MadNLP | 3.1019583e7 | 886 | 63895632 | 7 | 2.1740e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 48 | SecondOrderOptimization (LM) | 2.0152666e7 | 147649 | 44761904 | 5 | 2.2202e-23 | true | ok | NaN | abs\_dcost |
| 48 | SecondOrderOptimization (Dogleg) | 8.3511417e7 | 316990 | 64502528 | 10 | 1.6592e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 48 | SecondOrderOptimization (Gauss-Newton) | 7.5377125e7 | 341168 | 61978336 | 13 | 1.6541e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 48 | SecondOrderOptimization (LM, tall) | 5.09719792e8 | 106434 | 106571920 | 5 | 2.2296e-23 | true | ok | NaN | abs\_dcost |
| 48 | SecondOrderOptimization (LM, tall, LSMR) | 7.68901465e7 | 106487 | 52595744 | 5 | 2.4037e-23 | true | ok | NaN | abs\_dcost |
| 48 | CaNNOLeS | 9.1781709e7 | 228 | 18045824 | 4 | 1.8343e-18 | true | ok | NaN | first\_order |
| 48 | JSOSolvers (trunk) | 3.00050145e10 | 410300 | 65483434832 | 14 | 1.6736e-04 | false | timeout | NaN | max\_time |
| 48 | JSOSolvers (tron) | 3.0020077708e10 | 411598 | 65679920032 | 2 | 1.8104e-04 | false | timeout | NaN | max\_time |
| 48 | Ipopt | 2.590354585e8 | 1552 | 351259648 | 19 | 1.4722e-23 | true | ok | NaN | acceptable |
| 48 | MadNLP | 9.2575708e7 | 804 | 105275120 | 5 | 2.7168e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | SecondOrderOptimization (LM) | 4.38641875e7 | 304232 | 85902000 | 6 | 5.9951e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (Dogleg) | 7.36324165e7 | 390248 | 96436912 | 7 | 5.0972e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (Gauss-Newton) | 9.6361166e7 | 347204 | 82048816 | 7 | 5.2936e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (LM, tall) | 1.806771875e9 | 218568 | 239101728 | 6 | 5.0393e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (LM, tall, LSMR) | 2.22491e8 | 218617 | 115559536 | 6 | 5.1718e-19 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | CaNNOLeS | 1.861931875e8 | 228 | 32070528 | 4 | 1.0359e-19 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 3.0008882833e10 | 234472 | 65625927408 | 9 | 6.5017e-01 | false | timeout | NaN | max\_time |
| 64 | JSOSolvers (tron) | 3.0043209541e10 | 235918 | 66012493088 | 1 | 1.8001e+01 | false | timeout | NaN | max\_time |
| 64 | Ipopt | 6.98916021e8 | 1520 | 945975680 | 19 | 4.8607e-23 | true | ok | NaN | acceptable |
| 64 | MadNLP | 1.89598792e8 | 804 | 185804832 | 5 | 1.6882e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 96 | SecondOrderOptimization (LM) | 1.54145375e8 | 778657 | 264030560 | 7 | 2.7394e-22 | true | ok | NaN | abs\_dcost |
| 96 | SecondOrderOptimization (Dogleg) | 1.6989975e8 | 681891 | 201484672 | 6 | 2.5929e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 96 | SecondOrderOptimization (Gauss-Newton) | 1.83024791e8 | 681848 | 179705216 | 6 | 2.5929e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 96 | SecondOrderOptimization (LM, tall) | 9.17951525e9 | 557985 | 755480832 | 7 | 2.7272e-22 | true | ok | NaN | abs\_dcost |
| 96 | SecondOrderOptimization (LM, tall, LSMR) | 1.060837875e9 | 558038 | 350385808 | 7 | 2.9533e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 96 | CaNNOLeS | 5.26680104e8 | 228 | 81386368 | 4 | 1.6285e-21 | true | ok | NaN | first\_order |
| 96 | JSOSolvers (trunk) | 3.0027239041e10 | 97070 | 61020957904 | 5 | 5.2309e+03 | false | timeout | NaN | max\_time |
| 96 | JSOSolvers (tron) | 3.0101702584e10 | 97409 | 61115083360 | 1 | 4.8990e+03 | false | timeout | NaN | max\_time |
| 96 | Ipopt | 2.740496875e9 | 2159 | 1903623184 | 26 | 2.4973e-22 | true | ok | NaN | acceptable |
| 96 | MadNLP | 7.12950396e8 | 893 | 610287152 | 7 | 3.6600e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | SecondOrderOptimization (LM) | 2.672825415e8 | 1554637 | 396911952 | 8 | 7.6500e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (Dogleg) | 2.924455e8 | 1038541 | 337749328 | 5 | 7.8314e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (Gauss-Newton) | 3.31573709e8 | 1038499 | 298825056 | 5 | 7.8314e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM, tall) | 3.1161362708e10 | 1112938 | 1722167312 | 8 | 8.2214e-22 | true | ok | NaN | abs\_dcost, step\_size, max\_time |
| 128 | SecondOrderOptimization (LM, tall, LSMR) | 3.23165775e9 | 1112990 | 771289488 | 8 | 4.1854e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | CaNNOLeS | 1.13581175e9 | 228 | 160537472 | 4 | 2.8962e-21 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 3.0032466167e10 | 59030 | 67078023888 | 5 | 1.1466e+05 | false | timeout | NaN | max\_time |
| 128 | JSOSolvers (tron) | 3.0187402166e10 | 59759 | 67792108256 | 1 | 1.1914e+05 | false | timeout | NaN | max\_time |
| 128 | Ipopt | 4.621434792e9 | 2267 | 3436070832 | 26 | 7.4245e-22 | true | ok | NaN | acceptable |
| 128 | MadNLP | 1.610809791e9 | 935 | 1165373392 | 8 | 1.3112e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 192 | SecondOrderOptimization (LM) | 9.645226045e8 | 3880139 | 1160382560 | 9 | 4.3244e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (Dogleg) | 8.94268021e8 | 2331851 | 921995360 | 5 | 4.2484e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (Gauss-Newton) | 8.226945e8 | 2331810 | 775891072 | 5 | 4.2484e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (LM, tall) | 3.8400332291e10 | 839847 | 5467810192 | 2 | 7.5129e-03 | false | timeout | NaN | max\_time |
| 192 | SecondOrderOptimization (LM, tall, LSMR) | 1.4470474625e10 | 2775263 | 2481003360 | 9 | 4.3443e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | CaNNOLeS | 3.782256834e9 | 228 | 370842496 | 4 | 4.2749e-21 | true | ok | NaN | first\_order |
| 192 | JSOSolvers (trunk) | 3.0109460208e10 | 23210 | 58790957520 | 3 | 1.5831e+06 | false | timeout | NaN | max\_time |
| 192 | JSOSolvers (tron) | 3.0439815959e10 | 23819 | 59436310496 | 1 | 1.5802e+06 | false | timeout | NaN | max\_time |
| 192 | Ipopt | 1.3838265667e10 | 2627 | 7880971072 | 27 | 4.0159e-21 | true | ok | NaN | acceptable |
| 192 | MadNLP | 6.049421125e9 | 1019 | 3186425184 | 10 | 6.6633e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | SecondOrderOptimization (LM) | 1.514070875e9 | 7582134 | 2135224128 | 10 | 1.3614e-20 | true | ok | NaN | abs\_dcost |
| 256 | SecondOrderOptimization (Dogleg) | 4.216472125e9 | 8958300 | 2299286848 | 9 | 1.2771e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (Gauss-Newton) | 1.90121325e9 | 3453161 | 1301033488 | 4 | 4.7326e+06 | false | not_converged | NaN | max\_fails |
| 256 | SecondOrderOptimization (LM, tall) | 7.1998165708e10 | 1979928 | 26078730640 | 3 | 4.9862e-02 | false | timeout | NaN | max\_time |
| 256 | SecondOrderOptimization (LM, tall, LSMR) | 3.266541225e10 | 3945896 | 5251519904 | 7 | 2.0576e-09 | false | timeout | NaN | max\_time; cost test passes |
| 256 | CaNNOLeS | 9.96352525e9 | 228 | 636066688 | 4 | 1.2505e-20 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (trunk) | 3.03542155e10 | 12530 | 55686092752 | 3 | 3.5743e+06 | false | timeout | NaN | max\_time |
| 256 | JSOSolvers (tron) | 3.0859997333e10 | 13739 | 60767575008 | 1 | 3.5635e+06 | false | timeout | NaN | max\_time |
| 256 | Ipopt | 3.0349731625e10 | 2407 | 13480050256 | 26 | 1.1618e-20 | false | timeout | NaN | max\_time; cost test passes |
| 256 | MadNLP | 1.5896998292e10 | 1229 | 8293865104 | 15 | 1.3193e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
