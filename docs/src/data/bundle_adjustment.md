# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-14T13:55:38
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 4e9eec5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 1223.0 | 1 | 16 | 26042.0 | 421 | 39536 |
| 4 | BundleAdjustmentModels | 4833.25 | 1 | 16 | 57791.0 | 22 | 190896 |
| 8 | NLLSModel | 2652.777777777778 | 1 | 16 | 46083.0 | 841 | 78896 |
| 8 | BundleAdjustmentModels | 9041.666666666666 | 1 | 16 | 119417.0 | 22 | 479552 |
| 12 | NLLSModel | 4175.0 | 1 | 16 | 84000.0 | 1513 | 141872 |
| 12 | BundleAdjustmentModels | 16583.0 | 1 | 16 | 220917.0 | 24 | 891808 |
| 16 | NLLSModel | 7264.0 | 1 | 16 | 163750.0 | 2689 | 252080 |
| 16 | BundleAdjustmentModels | 29667.0 | 1 | 16 | 384541.0 | 24 | 1551888 |
| 24 | NLLSModel | 16667.0 | 1 | 16 | 347542.0 | 6063 | 568272 |
| 24 | BundleAdjustmentModels | 64584.0 | 1 | 16 | 875042.0 | 24 | 3494080 |
| 32 | NLLSModel | 29458.0 | 1 | 16 | 274791.0 | 10754 | 1010992 |
| 32 | BundleAdjustmentModels | 116833.0 | 1 | 16 | 1.522833e6 | 24 | 6132096 |
| 48 | NLLSModel | 11875.0 | 2 | 48 | 599167.0 | 24194 | 2270512 |
| 48 | BundleAdjustmentModels | 258500.0 | 1 | 16 | 3.312791e6 | 24 | 14102320 |
| 64 | NLLSModel | 19292.0 | 2 | 48 | 1.057375e6 | 43010 | 4033840 |
| 64 | BundleAdjustmentModels | 489791.0 | 1 | 16 | 6.200833e6 | 24 | 24445104 |
| 96 | NLLSModel | 39292.0 | 2 | 48 | 2.482459e6 | 96770 | 9071920 |
| 96 | BundleAdjustmentModels | 1.101167e6 | 1 | 16 | 1.4787292e7 | 25 | 54910064 |
| 128 | NLLSModel | 67791.0 | 2 | 48 | 4.314708e6 | 172034 | 16125232 |
| 128 | BundleAdjustmentModels | 1.955333e6 | 1 | 16 | 2.5280208e7 | 25 | 97566320 |
| 192 | NLLSModel | 144250.0 | 2 | 48 | 1.074725e7 | 387074 | 36277552 |
| 192 | BundleAdjustmentModels | 4.401334e6 | 1 | 16 | 6.0768333e7 | 25 | 219453040 |
| 256 | NLLSModel | 257625.0 | 2 | 48 | 1.098575e7 | 688130 | 80222576 |
| 256 | BundleAdjustmentModels | 7.832584e6 | 1 | 16 | 1.065465e8 | 25 | 390060656 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 4 | SecondOrderOptimization (LM) | 291958.0 | 3443 | 510208 | 5 | 1.7020e-23 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Dogleg) | 371646.0 | 3475 | 615792 | 5 | 2.4137e-23 | true | ok | NaN | grad\_tol |
| 4 | CaNNOLeS | 971270.5 | 191 | 359056 | 7 | 4.7517e-16 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 6.464536875e8 | 359780 | 1188428656 | 25 | 6.8334e-14 | true | ok | NaN | first\_order |
| 4 | JSOSolvers (tron) | 6.778057041e9 | 3630138 | 11992521024 | 501 | 5.9770e-12 | false | not_converged | NaN | max\_iter |
| 4 | Ipopt | 2.755729e6 | 632 | 2347072 | 8 | 4.0004e-15 | true | ok | NaN | first\_order |
| 4 | MadNLP | 1.559063e6 | 827 | 2362448 | 7 | 4.7778e-13 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | SecondOrderOptimization (LM) | 619270.5 | 6581 | 1151952 | 5 | 4.6799e-26 | true | ok | NaN | abs\_dcost |
| 8 | SecondOrderOptimization (Dogleg) | 886979.0 | 6613 | 1403152 | 5 | 4.7838e-26 | true | ok | NaN | abs\_dcost, step\_size |
| 8 | CaNNOLeS | 1.7408535e6 | 208 | 712224 | 6 | 3.4177e-16 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 3.0010541375e10 | 8197223 | 54001615920 | 184 | 5.8773e-13 | false | timeout | NaN | max\_time |
| 8 | JSOSolvers (tron) | 3.0019930042e10 | 8307969 | 54730907632 | 464 | 7.5948e-12 | false | timeout | NaN | max\_time |
| 8 | Ipopt | 5.3032085e6 | 766 | 6821744 | 10 | 1.4563e-14 | true | ok | NaN | first\_order |
| 8 | MadNLP | 2.64225e6 | 827 | 5363552 | 7 | 1.8327e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | SecondOrderOptimization (LM) | 1.1390625e6 | 11526 | 2183792 | 5 | 1.3544e-23 | true | ok | NaN | abs\_dcost |
| 12 | SecondOrderOptimization (Dogleg) | 1.8486665e6 | 13071 | 2660928 | 5 | 1.1072e-25 | true | ok | NaN | grad\_tol |
| 12 | CaNNOLeS | 3.2633335e6 | 222 | 1259808 | 6 | 8.4917e-16 | true | ok | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 3.0000420792e10 | 6692776 | 78841842960 | 88 | 3.0503e-12 | false | timeout | NaN | max\_time |
| 12 | JSOSolvers (tron) | 3.00012825e10 | 6669598 | 78567976976 | 180 | 6.3319e-12 | false | timeout | NaN | max\_time |
| 12 | Ipopt | 7.7461455e6 | 740 | 11347760 | 9 | 5.4678e-14 | true | ok | NaN | first\_order |
| 12 | MadNLP | 3.4837705e6 | 792 | 7375296 | 5 | 6.7695e-09 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | SecondOrderOptimization (LM) | 1.980125e6 | 19866 | 3676320 | 5 | 5.2816e-23 | true | ok | NaN | grad\_tol |
| 16 | SecondOrderOptimization (Dogleg) | 3.2089795e6 | 19899 | 4095952 | 5 | 1.9131e-25 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | CaNNOLeS | 5.8846045e6 | 226 | 2370400 | 5 | 1.8425e-14 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 3.000055e10 | 3811128 | 74684457904 | 39 | 1.4210e-11 | false | timeout | NaN | max\_time |
| 16 | JSOSolvers (tron) | 3.0003312709e10 | 3814288 | 74745043456 | 52 | 1.4611e-11 | false | timeout | NaN | max\_time |
| 16 | Ipopt | 1.2256854e7 | 740 | 19373856 | 9 | 2.8960e-14 | true | ok | NaN | first\_order |
| 16 | MadNLP | 6.437833e6 | 833 | 14585168 | 6 | 2.3365e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 24 | SecondOrderOptimization (LM) | 4.9349165e6 | 43275 | 8316480 | 5 | 4.1232e-24 | true | ok | NaN | abs\_dcost |
| 24 | SecondOrderOptimization (Dogleg) | 6.675729e6 | 37240 | 8220080 | 4 | 1.1060e-24 | true | ok | NaN | grad\_tol |
| 24 | CaNNOLeS | 1.35556455e7 | 228 | 4834176 | 5 | 1.9298e-17 | true | ok | NaN | first\_order |
| 24 | JSOSolvers (trunk) | 3.0001928958e10 | 1710380 | 73359700816 | 18 | 1.2645e-10 | false | timeout | NaN | max\_time |
| 24 | JSOSolvers (tron) | 3.000656875e10 | 1700968 | 72953131184 | 13 | 5.2116e-10 | false | timeout | NaN | max\_time |
| 24 | Ipopt | 3.361625e7 | 882 | 52291856 | 11 | 6.0972e-16 | true | ok | NaN | first\_order |
| 24 | MadNLP | 1.4538292e7 | 845 | 32202736 | 6 | 1.3226e-10 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | SecondOrderOptimization (LM) | 7.517125e6 | 75995 | 19663696 | 5 | 3.1983e-23 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Dogleg) | 1.1776771e7 | 65273 | 19259808 | 4 | 2.9772e-24 | true | ok | NaN | step\_size |
| 32 | CaNNOLeS | 3.36010835e7 | 228 | 8092544 | 4 | 1.6044e-17 | true | ok | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 3.0003512625e10 | 965912 | 67833233424 | 14 | 1.5708e-09 | false | timeout | NaN | max\_time |
| 32 | JSOSolvers (tron) | 3.0013862584e10 | 966748 | 67888087152 | 5 | 1.7151e-09 | false | timeout | NaN | max\_time |
| 32 | Ipopt | 4.8023e7 | 740 | 74536464 | 9 | 1.3067e-14 | true | ok | NaN | first\_order |
| 32 | MadNLP | 3.1140104e7 | 886 | 63895632 | 7 | 2.1740e-11 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 48 | SecondOrderOptimization (LM) | 2.01403125e7 | 168707 | 43531904 | 5 | 2.4185e-23 | true | ok | NaN | abs\_dcost |
| 48 | SecondOrderOptimization (Dogleg) | 3.9509875e7 | 168749 | 44707888 | 5 | 1.5137e-23 | true | ok | NaN | step\_size |
| 48 | CaNNOLeS | 8.74656045e7 | 228 | 18045824 | 4 | 1.8343e-18 | true | ok | NaN | first\_order |
| 48 | JSOSolvers (trunk) | 3.0006626083e10 | 414860 | 66211342160 | 14 | 1.5904e-04 | false | timeout | NaN | max\_time |
| 48 | JSOSolvers (tron) | 3.0018010125e10 | 418318 | 66752625568 | 2 | 1.6979e-04 | false | timeout | NaN | max\_time |
| 48 | Ipopt | 2.54281333e8 | 1542 | 351228544 | 19 | 1.4722e-23 | true | ok | NaN | acceptable |
| 48 | MadNLP | 9.156575e7 | 804 | 105275120 | 5 | 2.7168e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | SecondOrderOptimization (LM) | 4.3066459e7 | 340091 | 83372592 | 6 | 5.5907e-23 | true | ok | NaN | abs\_dcost, step\_size |
| 64 | SecondOrderOptimization (Dogleg) | 8.5529625e7 | 383158 | 89223168 | 6 | 5.4880e-23 | true | ok | NaN | step\_size |
| 64 | CaNNOLeS | 1.81434208e8 | 228 | 32070528 | 4 | 1.0359e-19 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 3.0011207792e10 | 232670 | 65121958096 | 9 | 6.7374e-01 | false | timeout | NaN | max\_time |
| 64 | JSOSolvers (tron) | 3.0036542e10 | 231418 | 64752569888 | 1 | 1.8024e+01 | false | timeout | NaN | max\_time |
| 64 | Ipopt | 6.857647705e8 | 1510 | 620748800 | 19 | 4.8607e-23 | true | ok | NaN | acceptable |
| 64 | MadNLP | 1.91582792e8 | 804 | 185804832 | 5 | 1.6882e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 96 | SecondOrderOptimization (LM) | 1.28642375e8 | 855495 | 259303904 | 7 | 2.8568e-22 | true | ok | NaN | abs\_dcost |
| 96 | SecondOrderOptimization (Dogleg) | 1.97429333e8 | 758782 | 238355344 | 6 | 2.4620e-22 | true | ok | NaN | step\_size |
| 96 | CaNNOLeS | 5.20412292e8 | 228 | 83712896 | 4 | 1.6285e-21 | true | ok | NaN | first\_order |
| 96 | JSOSolvers (trunk) | 3.0035183334e10 | 98630 | 61970591440 | 5 | 5.0293e+03 | false | timeout | NaN | max\_time |
| 96 | JSOSolvers (tron) | 3.01046895e10 | 99389 | 62359211872 | 1 | 4.6327e+03 | false | timeout | NaN | max\_time |
| 96 | Ipopt | 2.588806334e9 | 2149 | 1903430288 | 26 | 2.4973e-22 | true | ok | NaN | acceptable |
| 96 | MadNLP | 6.95228688e8 | 893 | 562232880 | 7 | 3.6600e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | SecondOrderOptimization (LM) | 2.671029795e8 | 1689513 | 384842960 | 8 | 7.8455e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (Dogleg) | 3.45350041e8 | 1173451 | 336921648 | 5 | 8.0981e-22 | true | ok | NaN | step\_size |
| 128 | CaNNOLeS | 1.09373925e9 | 228 | 160881536 | 4 | 2.8962e-21 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 3.0057307917e10 | 53510 | 59936710352 | 5 | 1.2208e+05 | false | timeout | NaN | max\_time |
| 128 | JSOSolvers (tron) | 3.0210909583e10 | 54419 | 60593184224 | 1 | 1.2974e+05 | false | timeout | NaN | max\_time |
| 128 | Ipopt | 4.499933958e9 | 2257 | 3377587760 | 26 | 7.4245e-22 | true | ok | NaN | acceptable |
| 128 | MadNLP | 1.775841583e9 | 935 | 1174564816 | 8 | 1.3112e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 192 | SecondOrderOptimization (LM) | 8.60801979e8 | 4177449 | 1114744272 | 9 | 4.1954e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | SecondOrderOptimization (Dogleg) | 1.001996542e9 | 2629193 | 960089520 | 5 | 4.2081e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 192 | CaNNOLeS | 3.784218459e9 | 228 | 366353280 | 4 | 4.2749e-21 | true | ok | NaN | first\_order |
| 192 | JSOSolvers (trunk) | 3.0084996083e10 | 24230 | 61760349904 | 3 | 1.5774e+06 | false | timeout | NaN | max\_time |
| 192 | JSOSolvers (tron) | 3.0434657791e10 | 24659 | 62508770784 | 1 | 1.5792e+06 | false | timeout | NaN | max\_time |
| 192 | Ipopt | 1.3854678042e10 | 2617 | 7886737856 | 27 | 4.0159e-21 | true | ok | NaN | acceptable |
| 192 | MadNLP | 5.860524584e9 | 1019 | 3354525024 | 10 | 6.6633e-07 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | SecondOrderOptimization (LM) | 1.565202417e9 | 8101880 | 2064663168 | 10 | 1.3292e-20 | true | ok | NaN | abs\_dcost |
| 256 | SecondOrderOptimization (Dogleg) | 3.025758458e9 | 6725499 | 1811360736 | 7 | 1.2215e-20 | true | ok | NaN | step\_size |
| 256 | CaNNOLeS | 9.646881541e9 | 234 | 652057568 | 4 | 1.2505e-20 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (trunk) | 3.0131372041e10 | 13310 | 60348078288 | 3 | 3.5622e+06 | false | timeout | NaN | max\_time |
| 256 | JSOSolvers (tron) | 3.1096717166e10 | 13919 | 61989219040 | 1 | 3.5621e+06 | false | timeout | NaN | max\_time |
| 256 | Ipopt | 3.0219924667e10 | 2397 | 13519437008 | 26 | 1.1618e-20 | false | timeout | NaN | max\_time |
| 256 | MadNLP | 1.5489653292e10 | 1229 | 8229754512 | 15 | 1.3193e-08 | true | ok | NaN | SOLVE\_SUCCEEDED |
