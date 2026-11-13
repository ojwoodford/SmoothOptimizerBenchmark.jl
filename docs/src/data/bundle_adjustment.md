# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-13T01:43:46
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 520587c

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 1199.0555555555557 | 1 | 16 | 19666.0 | 421 | 39536 |
| 4 | BundleAdjustmentModels | 3486.1666666666665 | 1 | 16 | 58042.0 | 22 | 190896 |
| 8 | NLLSModel | 2314.777777777778 | 1 | 16 | 40917.0 | 841 | 78896 |
| 8 | BundleAdjustmentModels | 6930.333333333333 | 1 | 16 | 111250.0 | 22 | 479552 |
| 12 | NLLSModel | 4108.4 | 1 | 16 | 69709.0 | 1513 | 141872 |
| 12 | BundleAdjustmentModels | 12458.0 | 1 | 16 | 222375.0 | 24 | 891808 |
| 16 | NLLSModel | 7222.333333333333 | 1 | 16 | 133500.0 | 2689 | 252080 |
| 16 | BundleAdjustmentModels | 22084.0 | 1 | 16 | 386541.0 | 24 | 1551888 |
| 24 | NLLSModel | 16125.0 | 1 | 16 | 283750.0 | 6063 | 568272 |
| 24 | BundleAdjustmentModels | 49625.0 | 1 | 16 | 862708.0 | 24 | 3494080 |
| 32 | NLLSModel | 28541.0 | 1 | 16 | 258875.0 | 10754 | 1010992 |
| 32 | BundleAdjustmentModels | 88459.0 | 1 | 16 | 1.525125e6 | 24 | 6132096 |
| 48 | NLLSModel | 11417.0 | 2 | 48 | 571500.0 | 24194 | 2270512 |
| 48 | BundleAdjustmentModels | 199042.0 | 1 | 16 | 3.395375e6 | 24 | 13774640 |
| 64 | NLLSModel | 19542.0 | 2 | 48 | 1.001792e6 | 43010 | 4033840 |
| 64 | BundleAdjustmentModels | 376917.0 | 1 | 16 | 6.365333e6 | 24 | 24445104 |
| 96 | NLLSModel | 39709.0 | 2 | 48 | 2.2735e6 | 96770 | 9071920 |
| 96 | BundleAdjustmentModels | 846334.0 | 1 | 16 | 1.4291e7 | 25 | 54910064 |
| 128 | NLLSModel | 68667.0 | 2 | 48 | 4.510917e6 | 172034 | 16125232 |
| 128 | BundleAdjustmentModels | 1.5045e6 | 1 | 16 | 2.4788542e7 | 25 | 97566320 |
| 192 | NLLSModel | 145417.0 | 2 | 48 | 1.0416709e7 | 387074 | 36277552 |
| 192 | BundleAdjustmentModels | 3.387916e6 | 1 | 16 | 5.667825e7 | 25 | 219453040 |
| 256 | NLLSModel | 256458.0 | 2 | 48 | 1.0207666e7 | 688130 | 80222576 |
| 256 | BundleAdjustmentModels | 6.015625e6 | 1 | 16 | 1.06995125e8 | 25 | 390060656 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 4 | SecondOrderOptimization (LM) | 234875.5 | 3440 | 509408 | 5 | 1.6978e-23 | true |
| 4 | SecondOrderOptimization (Dogleg) | 344145.5 | 3892 | 654352 | 5 | 1.6222e-26 | true |
| 4 | CaNNOLeS | 924125.0 | 191 | 359056 | 7 | 4.7517e-16 | true |
| 4 | JSOSolvers (trunk) | 6.148118335e8 | 359780 | 1188428656 | 25 | 6.8334e-14 | true |
| 4 | JSOSolvers (tron) | 6.050817042e9 | 3630139 | 11992520976 | 501 | 5.9770e-12 | false |
| 4 | Ipopt | 2.7376875e6 | 632 | 2347072 | 8 | 4.0004e-15 | true |
| 4 | MadNLP | 1.453479e6 | 827 | 2362448 | 7 | 4.7778e-13 | true |
| 8 | SecondOrderOptimization (LM) | 547333.5 | 6578 | 1151152 | 5 | 6.1146e-26 | true |
| 8 | SecondOrderOptimization (Dogleg) | 1.062834e6 | 8302 | 1659600 | 7 | 3.8331e-26 | true |
| 8 | CaNNOLeS | 1.669729e6 | 208 | 712224 | 6 | 3.4177e-16 | true |
| 8 | JSOSolvers (trunk) | 3.0000081083e10 | 9261620 | 61013508512 | 207 | 4.5488e-13 | false |
| 8 | JSOSolvers (tron) | 2.8264316416e10 | 8843893 | 58261488816 | 501 | 6.9254e-12 | false |
| 8 | Ipopt | 5.4250835e6 | 766 | 6821744 | 10 | 1.4563e-14 | true |
| 8 | MadNLP | 2.663625e6 | 827 | 5363552 | 7 | 1.8327e-11 | true |
| 12 | SecondOrderOptimization (LM) | 1.022646e6 | 11523 | 2182992 | 5 | 1.3566e-23 | true |
| 12 | SecondOrderOptimization (Dogleg) | 1.623e6 | 11556 | 2518432 | 5 | 1.0937e-25 | true |
| 12 | CaNNOLeS | 3.2052705e6 | 222 | 1259808 | 6 | 8.4917e-16 | true |
| 12 | JSOSolvers (trunk) | 3.0000329916e10 | 7011226 | 82593268880 | 91 | 2.8683e-12 | false |
| 12 | JSOSolvers (tron) | 3.0001139291e10 | 7026809 | 82776005792 | 192 | 5.8196e-12 | false |
| 12 | Ipopt | 7.6443545e6 | 740 | 11347760 | 9 | 5.4678e-14 | true |
| 12 | MadNLP | 3.3609375e6 | 792 | 7375296 | 5 | 6.7695e-09 | true |
| 16 | SecondOrderOptimization (LM) | 1.8141875e6 | 19863 | 3675520 | 5 | 5.2943e-23 | true |
| 16 | SecondOrderOptimization (Dogleg) | 3.0288545e6 | 19896 | 4095152 | 5 | 2.0287e-25 | true |
| 16 | CaNNOLeS | 5.7545205e6 | 226 | 2370400 | 5 | 1.8425e-14 | true |
| 16 | JSOSolvers (trunk) | 3.0000604417e10 | 4018938 | 78756868912 | 40 | 1.1612e-11 | false |
| 16 | JSOSolvers (tron) | 3.0002181583e10 | 4000619 | 78396514864 | 55 | 1.2124e-11 | false |
| 16 | Ipopt | 1.22580625e7 | 740 | 19373856 | 9 | 2.8960e-14 | true |
| 16 | MadNLP | 6.395875e6 | 833 | 14585168 | 6 | 2.3365e-10 | true |
| 24 | SecondOrderOptimization (LM) | 4.618e6 | 43272 | 8315680 | 5 | 4.4427e-24 | true |
| 24 | SecondOrderOptimization (Dogleg) | 9.493229e6 | 55435 | 10156816 | 6 | 1.1622e-24 | true |
| 24 | CaNNOLeS | 1.3284375e7 | 228 | 4834176 | 5 | 1.9298e-17 | true |
| 24 | JSOSolvers (trunk) | 3.0001239042e10 | 1784300 | 76530336592 | 18 | 1.2420e-10 | false |
| 24 | JSOSolvers (tron) | 3.0005351209e10 | 1783229 | 76481492416 | 13 | 4.9419e-10 | false |
| 24 | Ipopt | 3.2623125e7 | 882 | 52291856 | 11 | 6.0972e-16 | true |
| 24 | MadNLP | 1.44984375e7 | 845 | 32202736 | 6 | 1.3226e-10 | true |
| 32 | SecondOrderOptimization (LM) | 7.426458e6 | 75992 | 19661632 | 5 | 3.1482e-23 | true |
| 32 | SecondOrderOptimization (Dogleg) | 1.1838979e7 | 65270 | 19257744 | 4 | 4.5704e-24 | true |
| 32 | CaNNOLeS | 3.33308545e7 | 228 | 8092544 | 4 | 1.6044e-17 | true |
| 32 | JSOSolvers (trunk) | 3.0001870375e10 | 1023260 | 71861832528 | 14 | 1.4253e-09 | false |
| 32 | JSOSolvers (tron) | 3.00147815e10 | 1023029 | 71840833504 | 5 | 1.6101e-09 | false |
| 32 | Ipopt | 4.68105835e7 | 740 | 74536464 | 9 | 1.3067e-14 | true |
| 32 | MadNLP | 3.0302125e7 | 886 | 63895632 | 7 | 2.1740e-11 | true |
| 48 | SecondOrderOptimization (LM) | 2.0559125e7 | 168704 | 43529840 | 5 | 2.3721e-23 | true |
| 48 | SecondOrderOptimization (Dogleg) | 4.9131334e7 | 217136 | 49479584 | 6 | 1.6441e-23 | true |
| 48 | CaNNOLeS | 8.7959875e7 | 228 | 18045824 | 4 | 1.8343e-18 | true |
| 48 | JSOSolvers (trunk) | 3.0004322416e10 | 440378 | 70281876848 | 14 | 1.0130e-04 | false |
| 48 | JSOSolvers (tron) | 3.0022317167e10 | 442919 | 70679493008 | 3 | 7.4677e-05 | false |
| 48 | Ipopt | 2.515955e8 | 1542 | 351228544 | 19 | 1.4722e-23 | true |
| 48 | MadNLP | 9.0665917e7 | 804 | 105275120 | 5 | 2.7168e-08 | true |
| 64 | SecondOrderOptimization (LM) | 3.3618104e7 | 340090 | 83370560 | 6 | 5.4810e-23 | true |
| 64 | SecondOrderOptimization (Dogleg) | 7.2510396e7 | 297124 | 80852192 | 5 | 5.4102e-23 | true |
| 64 | CaNNOLeS | 1.81255521e8 | 228 | 32070528 | 4 | 1.0359e-19 | true |
| 64 | JSOSolvers (trunk) | 3.0014529875e10 | 237232 | 66398680304 | 9 | 6.2235e-01 | false |
| 64 | JSOSolvers (tron) | 3.0041031958e10 | 238379 | 66701249728 | 1 | 1.7984e+01 | false |
| 64 | Ipopt | 6.952991045e8 | 1510 | 620748800 | 19 | 4.8607e-23 | true |
| 64 | MadNLP | 1.90681083e8 | 804 | 185804832 | 5 | 1.6882e-08 | true |
| 96 | SecondOrderOptimization (LM) | 1.17766729e8 | 855500 | 249310816 | 7 | 2.6396e-22 | true |
| 96 | SecondOrderOptimization (Dogleg) | 1.58397708e8 | 661996 | 247033072 | 5 | 2.7891e-22 | true |
| 96 | CaNNOLeS | 5.344264165e8 | 232 | 71965632 | 4 | 1.6285e-21 | true |
| 96 | JSOSolvers (trunk) | 3.0031006375e10 | 104090 | 65427797456 | 5 | 4.4499e+03 | false |
| 96 | JSOSolvers (tron) | 3.00941675e10 | 103919 | 65205624880 | 1 | 4.3793e+03 | false |
| 96 | Ipopt | 2.642305333e9 | 2149 | 1903463056 | 26 | 2.4973e-22 | true |
| 96 | MadNLP | 6.736270625e8 | 893 | 601194032 | 7 | 3.6600e-08 | true |
| 128 | SecondOrderOptimization (LM) | 2.542879375e8 | 1689506 | 378877056 | 8 | 7.7917e-22 | true |
| 128 | SecondOrderOptimization (Dogleg) | 3.219868125e8 | 1173446 | 337607680 | 5 | 7.8946e-22 | true |
| 128 | CaNNOLeS | 1.106799459e9 | 228 | 166632320 | 4 | 2.8962e-21 | true |
| 128 | JSOSolvers (trunk) | 3.0044658833e10 | 57352 | 64013229808 | 5 | 1.1863e+05 | false |
| 128 | JSOSolvers (tron) | 3.01793845e10 | 57719 | 64277481120 | 1 | 1.2222e+05 | false |
| 128 | Ipopt | 4.393581125e9 | 2257 | 3377653296 | 26 | 7.4245e-22 | true |
| 128 | MadNLP | 1.708491833e9 | 935 | 1183969232 | 8 | 1.3112e-07 | true |
| 192 | SecondOrderOptimization (LM) | 8.26976854e8 | 4177446 | 1066687936 | 9 | 2.2975e-18 | true |
| 192 | SecondOrderOptimization (Dogleg) | 9.69914e8 | 2629190 | 903038368 | 5 | 4.3556e-21 | true |
| 192 | CaNNOLeS | 3.631726291e9 | 228 | 366173056 | 4 | 4.2749e-21 | true |
| 192 | JSOSolvers (trunk) | 3.0077745459e10 | 25610 | 65844369872 | 3 | 1.5652e+06 | false |
| 192 | JSOSolvers (tron) | 3.0554429958e10 | 25319 | 63444126544 | 1 | 1.5787e+06 | false |
| 192 | Ipopt | 1.3868062542e10 | 2617 | 7892881856 | 27 | 4.0159e-21 | true |
| 192 | MadNLP | 5.856297666e9 | 1019 | 3202760032 | 10 | 6.6633e-07 | true |
| 256 | SecondOrderOptimization (LM) | 2.412983916e9 | 13607102 | 2886099568 | 18 | 3.0661e-16 | true |
| 256 | SecondOrderOptimization (Dogleg) | 3.440508375e9 | 7413645 | 1909906256 | 8 | 1.2417e-20 | true |
| 256 | CaNNOLeS | 9.639292417e9 | 228 | 505076608 | 4 | 1.2505e-20 | true |
| 256 | JSOSolvers (trunk) | 3.013309675e10 | 14273 | 63876524288 | 3 | 3.5497e+06 | false |
| 256 | JSOSolvers (tron) | 3.0952520584e10 | 14759 | 65234443280 | 1 | 3.5521e+06 | false |
| 256 | Ipopt | 3.0833901667e10 | 2573 | 14143452192 | 27 | 1.1618e-20 | false |
| 256 | MadNLP | 1.52815765e10 | 1229 | 8278333072 | 15 | 1.3193e-08 | true |
