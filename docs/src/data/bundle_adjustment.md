# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-10T11:35:59
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 4aac5c9

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 1375.0 | 2 | 32 | 24709.0 | 421 | 39520 |
| 4 | BundleAdjustmentModels | 4575.0 | 1 | 16 | 52791.0 | 22 | 190896 |
| 8 | NLLSModel | 2458.3333333333335 | 2 | 32 | 49791.0 | 841 | 78880 |
| 8 | BundleAdjustmentModels | 9084.0 | 1 | 16 | 118292.0 | 22 | 479552 |
| 12 | NLLSModel | 4158.4 | 2 | 32 | 86125.0 | 1513 | 141856 |
| 12 | BundleAdjustmentModels | 16250.0 | 1 | 16 | 211125.0 | 24 | 891808 |
| 16 | NLLSModel | 7278.0 | 2 | 32 | 156583.0 | 2689 | 252064 |
| 16 | BundleAdjustmentModels | 28833.0 | 1 | 16 | 394709.0 | 24 | 1551888 |
| 24 | NLLSModel | 16750.0 | 2 | 32 | 351375.0 | 6063 | 568256 |
| 24 | BundleAdjustmentModels | 64875.0 | 1 | 16 | 924333.0 | 24 | 3494080 |
| 32 | NLLSModel | 30375.0 | 2 | 32 | 655833.0 | 10753 | 1007776 |
| 32 | BundleAdjustmentModels | 122958.0 | 1 | 16 | 1.668708e6 | 24 | 6132096 |
| 48 | NLLSModel | 75833.0 | 2 | 32 | 1.396042e6 | 24193 | 2267296 |
| 48 | BundleAdjustmentModels | 258959.0 | 1 | 16 | 3.52925e6 | 24 | 13774640 |
| 64 | NLLSModel | 113958.0 | 2 | 32 | 2.666459e6 | 43009 | 4030624 |
| 64 | BundleAdjustmentModels | 469709.0 | 1 | 16 | 6.39075e6 | 24 | 24445104 |
| 96 | NLLSModel | 279917.0 | 2 | 32 | 6.194792e6 | 96774 | 9074672 |
| 96 | BundleAdjustmentModels | 1.050209e6 | 1 | 16 | 1.3895166e7 | 25 | 54910064 |
| 128 | NLLSModel | 467458.0 | 2 | 32 | 8.30225e6 | 172038 | 16127984 |
| 128 | BundleAdjustmentModels | 1.910542e6 | 1 | 16 | 2.533475e7 | 25 | 97566320 |
| 192 | NLLSModel | 1.083125e6 | 2 | 32 | 1.8604041e7 | 387078 | 36280304 |
| 192 | BundleAdjustmentModels | 4.240042e6 | 1 | 16 | 5.9758292e7 | 25 | 219453040 |
| 256 | NLLSModel | 1.838042e6 | 2 | 32 | 2.0149833e7 | 688134 | 80227680 |
| 256 | BundleAdjustmentModels | 7.630667e6 | 1 | 16 | 1.00150583e8 | 25 | 390060656 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 4 | SecondOrderOptimization (LM) | 280770.5 | 1717 | 425920 | 1 | 1.2815e+01 | true |
| 4 | SecondOrderOptimization (Dogleg) | 3.921625e6 | 12879 | 1681856 | 23 | 1.6398e+01 | false |
| 4 | CaNNOLeS | 974270.5 | 191 | 359056 | 7 | 4.7517e-16 | true |
| 4 | JSOSolvers (trunk) | 7.04257688e8 | 359780 | 1188428656 | 25 | 6.8334e-14 | true |
| 4 | JSOSolvers (tron) | 6.756654209e9 | 3630139 | 11992520976 | 501 | 5.9770e-12 | false |
| 4 | Ipopt | 2.642562e6 | 632 | 2347072 | 8 | 4.0004e-15 | true |
| 4 | MadNLP | 1.4975e6 | 827 | 2362448 | 7 | 4.7778e-13 | true |
| 8 | SecondOrderOptimization (LM) | 409208.5 | 2990 | 1158496 | 1 | 9.2692e+01 | true |
| 8 | SecondOrderOptimization (Dogleg) | 846542.0 | 5721 | 1499632 | 4 | 8.5408e+01 | false |
| 8 | CaNNOLeS | 1.75125e6 | 208 | 712224 | 6 | 3.4177e-16 | true |
| 8 | JSOSolvers (trunk) | 3.0000254083e10 | 8866489 | 58410352016 | 198 | 4.9921e-13 | false |
| 8 | JSOSolvers (tron) | 2.9902810083e10 | 8843893 | 58261488816 | 501 | 6.9254e-12 | false |
| 8 | Ipopt | 5.639e6 | 766 | 6821744 | 10 | 1.4563e-14 | true |
| 8 | MadNLP | 2.880688e6 | 827 | 5363552 | 7 | 1.8327e-11 | true |
| 12 | SecondOrderOptimization (LM) | 663458.5 | 4961 | 2278416 | 1 | 3.8707e+02 | true |
| 12 | SecondOrderOptimization (Dogleg) | 2.318333e6 | 12910 | 3394832 | 6 | 1.2603e+02 | false |
| 12 | CaNNOLeS | 3.402542e6 | 222 | 1259808 | 6 | 8.4917e-16 | true |
| 12 | JSOSolvers (trunk) | 3.0000337e10 | 6594616 | 77685491984 | 86 | 3.0991e-12 | false |
| 12 | JSOSolvers (tron) | 3.0001289333e10 | 6625019 | 78042812448 | 178 | 6.3777e-12 | false |
| 12 | Ipopt | 7.967021e6 | 740 | 11347760 | 9 | 5.4678e-14 | true |
| 12 | MadNLP | 3.626333e6 | 792 | 7375296 | 5 | 6.7695e-09 | true |
| 16 | SecondOrderOptimization (LM) | 1.000563e6 | 8087 | 3838704 | 1 | 4.1435e+02 | true |
| 16 | SecondOrderOptimization (Dogleg) | 7.501125e6 | 41362 | 8900480 | 13 | 2.0770e+02 | false |
| 16 | CaNNOLeS | 6.0204795e6 | 226 | 2370400 | 5 | 1.8425e-14 | true |
| 16 | JSOSolvers (trunk) | 3.0001619125e10 | 3798888 | 74444593072 | 39 | 1.4271e-11 | false |
| 16 | JSOSolvers (tron) | 3.000345775e10 | 3803849 | 74540452528 | 52 | 1.4651e-11 | false |
| 16 | Ipopt | 1.2958354e7 | 740 | 19373856 | 9 | 2.8960e-14 | true |
| 16 | MadNLP | 7.167521e6 | 833 | 14585168 | 6 | 2.3365e-10 | true |
| 24 | SecondOrderOptimization (LM) | 2.2360205e6 | 16547 | 8323120 | 1 | 6.5797e+02 | true |
| 24 | SecondOrderOptimization (Dogleg) | 5.389708e6 | 34941 | 10770256 | 4 | 7.6947e+02 | false |
| 24 | CaNNOLeS | 1.4296729e7 | 228 | 4834176 | 5 | 1.9298e-17 | true |
| 24 | JSOSolvers (trunk) | 3.0001352042e10 | 1695680 | 72729176656 | 18 | 1.2651e-10 | false |
| 24 | JSOSolvers (tron) | 3.00065965e10 | 1709789 | 73331445184 | 13 | 5.2055e-10 | false |
| 24 | Ipopt | 3.36306665e7 | 882 | 52291856 | 11 | 6.0972e-16 | true |
| 24 | MadNLP | 1.4769104e7 | 845 | 32202736 | 6 | 1.3226e-10 | true |
| 32 | SecondOrderOptimization (LM) | 4.0717705e6 | 28413 | 14734704 | 1 | 1.7158e+03 | true |
| 32 | SecondOrderOptimization (Dogleg) | 2.2298459e7 | 136770 | 30884528 | 11 | 1.2021e+03 | false |
| 32 | CaNNOLeS | 3.3924375e7 | 228 | 8092544 | 4 | 1.6044e-17 | true |
| 32 | JSOSolvers (trunk) | 3.0003314584e10 | 986480 | 69278640720 | 14 | 1.5034e-09 | false |
| 32 | JSOSolvers (tron) | 3.0014491583e10 | 975449 | 68499118816 | 5 | 1.7009e-09 | false |
| 32 | Ipopt | 4.8648771e7 | 740 | 74536464 | 9 | 1.3067e-14 | true |
| 32 | MadNLP | 3.05503755e7 | 886 | 63895632 | 7 | 2.1740e-11 | true |
| 48 | SecondOrderOptimization (LM) | 7.032354e6 | 61604 | 32549376 | 1 | 6.6883e+03 | true |
| 48 | SecondOrderOptimization (Dogleg) | 7.2015167e7 | 401495 | 83918688 | 15 | 7.3523e+04 | false |
| 48 | CaNNOLeS | 9.05476665e7 | 228 | 18045824 | 4 | 1.8343e-18 | true |
| 48 | JSOSolvers (trunk) | 3.000798e10 | 426080 | 68002377296 | 14 | 1.3206e-04 | false |
| 48 | JSOSolvers (tron) | 3.0018338333e10 | 427259 | 68179706000 | 2 | 1.5554e-04 | false |
| 48 | Ipopt | 2.62359209e8 | 1542 | 351228544 | 19 | 1.4722e-23 | true |
| 48 | MadNLP | 9.2513166e7 | 804 | 105275120 | 5 | 2.7168e-08 | true |
| 64 | SecondOrderOptimization (LM) | 1.5853583e7 | 106626 | 57721008 | 1 | 1.4388e+04 | true |
| 64 | SecondOrderOptimization (Dogleg) | 1.02211417e8 | 580639 | 128601280 | 12 | 1.4297e+05 | false |
| 64 | CaNNOLeS | 1.84343896e8 | 228 | 31660928 | 4 | 1.0359e-19 | true |
| 64 | JSOSolvers (trunk) | 3.0011010125e10 | 236150 | 66096298704 | 9 | 6.3619e-01 | false |
| 64 | JSOSolvers (tron) | 3.0042286709e10 | 236639 | 66214079424 | 1 | 1.7997e+01 | false |
| 64 | Ipopt | 7.050071245e8 | 1510 | 620748800 | 19 | 4.8607e-23 | true |
| 64 | MadNLP | 1.9174225e8 | 804 | 185804832 | 5 | 1.6882e-08 | true |
| 96 | SecondOrderOptimization (LM) | 5.8360208e7 | 233507 | 281240048 | 1 | 8.1796e+04 | true |
| 96 | SecondOrderOptimization (Dogleg) | 4.66836666e8 | 1118423 | 376078960 | 5 | 4.2203e+05 | false |
| 96 | CaNNOLeS | 5.34673917e8 | 228 | 81517440 | 4 | 1.6285e-21 | true |
| 96 | JSOSolvers (trunk) | 3.002940325e10 | 99050 | 62330900944 | 5 | 5.0192e+03 | false |
| 96 | JSOSolvers (tron) | 3.0106853209e10 | 100289 | 62924722608 | 1 | 4.4828e+03 | false |
| 96 | Ipopt | 2.742607375e9 | 2149 | 1903561360 | 26 | 2.4973e-22 | true |
| 96 | MadNLP | 7.040402505e8 | 893 | 610287152 | 7 | 3.6600e-08 | true |
| 128 | SecondOrderOptimization (LM) | 8.3143125e7 | 411645 | 348266112 | 1 | 7.3542e+05 | true |
| 128 | SecondOrderOptimization (Dogleg) | 2.0624e8 | 583709 | 364270752 | 2 | 8.6529e+05 | false |
| 128 | CaNNOLeS | 1.127070333e9 | 228 | 139762560 | 4 | 2.8962e-21 | true |
| 128 | JSOSolvers (trunk) | 3.0051317166e10 | 60410 | 67558555088 | 5 | 1.1221e+05 | false |
| 128 | JSOSolvers (tron) | 3.0192523584e10 | 61259 | 68240248224 | 1 | 1.1577e+05 | false |
| 128 | Ipopt | 4.436675709e9 | 2257 | 3387221552 | 26 | 7.4245e-22 | true |
| 128 | MadNLP | 1.763084458e9 | 935 | 1186672592 | 8 | 1.3112e-07 | true |
| 192 | SecondOrderOptimization (LM) | 2.63805375e8 | 915059 | 973916800 | 1 | 2.1059e+06 | true |
| 192 | SecondOrderOptimization (Dogleg) | 1.87262e8 | 914996 | 977969248 | 1 | 1.9733e+06 | false |
| 192 | CaNNOLeS | 3.786704208e9 | 228 | 341269376 | 4 | 4.2749e-21 | true |
| 192 | JSOSolvers (trunk) | 3.0085875709e10 | 24650 | 61849962960 | 3 | 1.5719e+06 | false |
| 192 | JSOSolvers (tron) | 3.0537105167e10 | 25139 | 62746885200 | 1 | 1.5789e+06 | false |
| 192 | Ipopt | 1.3924599583e10 | 2617 | 7892980160 | 27 | 4.0159e-21 | true |
| 192 | MadNLP | 5.988482958e9 | 1019 | 3196697952 | 10 | 6.6633e-07 | true |
| 256 | SecondOrderOptimization (LM) | 1.044228584e9 | 17349435 | 1369409072 | 1 | 4.7325e+06 | true |
| 256 | SecondOrderOptimization (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 256 | CaNNOLeS | 9.689489458e9 | 229 | 677665680 | 4 | 1.2505e-20 | true |
| 256 | JSOSolvers (trunk) | 3.0182184958e10 | 13671 | 62392317664 | 3 | 3.5575e+06 | false |
| 256 | JSOSolvers (tron) | 3.0875892791e10 | 14219 | 63715192592 | 1 | 3.5586e+06 | false |
| 256 | Ipopt | 3.0341781833e10 | 2397 | 13485276368 | 26 | 1.1618e-20 | false |
| 256 | MadNLP | 1.5477776375e10 | 1229 | 8281282192 | 15 | 1.3193e-08 | true |
