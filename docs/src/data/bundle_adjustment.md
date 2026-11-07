# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T21:19:28
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b448285

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 1078.7222222222222 | 0 | 0 | 22042.0 | 0 | 0 |
| 4 | BundleAdjustmentModels | 4600.0 | 0 | 0 | 53667.0 | 21 | 190832 |
| 8 | NLLSModel | 2314.777777777778 | 0 | 0 | 49959.0 | 0 | 0 |
| 8 | BundleAdjustmentModels | 9680.666666666666 | 0 | 0 | 115875.0 | 21 | 479488 |
| 12 | NLLSModel | 4066.8 | 0 | 0 | 94792.0 | 0 | 0 |
| 12 | BundleAdjustmentModels | 16875.0 | 0 | 0 | 232000.0 | 23 | 891744 |
| 16 | NLLSModel | 7430.333333333333 | 0 | 0 | 167125.0 | 0 | 0 |
| 16 | BundleAdjustmentModels | 31792.0 | 0 | 0 | 377541.0 | 23 | 1551824 |
| 24 | NLLSModel | 15333.0 | 0 | 0 | 344917.0 | 0 | 0 |
| 24 | BundleAdjustmentModels | 69708.0 | 0 | 0 | 887250.0 | 23 | 3494016 |
| 32 | NLLSModel | 27916.0 | 0 | 0 | 627459.0 | 0 | 0 |
| 32 | BundleAdjustmentModels | 116292.0 | 0 | 0 | 1.553708e6 | 23 | 6132032 |
| 48 | NLLSModel | 65375.0 | 0 | 0 | 1.434625e6 | 0 | 0 |
| 48 | BundleAdjustmentModels | 270542.0 | 0 | 0 | 3.540708e6 | 23 | 13774576 |
| 64 | NLLSModel | 116375.0 | 0 | 0 | 2.601583e6 | 0 | 0 |
| 64 | BundleAdjustmentModels | 477333.0 | 0 | 0 | 6.366208e6 | 23 | 24445040 |
| 96 | NLLSModel | 243417.0 | 0 | 0 | 1.964333e6 | 3 | 3504 |
| 96 | BundleAdjustmentModels | 1.118667e6 | 0 | 0 | 1.4743833e7 | 24 | 54910000 |
| 128 | NLLSModel | 437708.0 | 0 | 0 | 4.227833e6 | 3 | 3504 |
| 128 | BundleAdjustmentModels | 1.937291e6 | 0 | 0 | 2.5347833e7 | 24 | 97566256 |
| 192 | NLLSModel | 975292.0 | 0 | 0 | 9.737458e6 | 3 | 3504 |
| 192 | BundleAdjustmentModels | 4.294875e6 | 0 | 0 | 6.01685e7 | 24 | 219452976 |
| 256 | NLLSModel | 1.7495e6 | 0 | 0 | 1.7391084e7 | 3 | 3504 |
| 256 | BundleAdjustmentModels | 7.623375e6 | 0 | 0 | 1.06000292e8 | 24 | 390060592 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 4 | SecondOrderOptimization (Sparse LM) | 859333.5 | 168 | 838800 | 8 | 8.2673e-16 | true |
| 4 | SecondOrderOptimization (Sparse Dogleg) | 876916.5 | 164 | 675616 | 9 | 1.9846e-26 | true |
| 4 | CaNNOLeS | 950749.5 | 191 | 359056 | 7 | 4.7517e-16 | true |
| 4 | JSOSolvers (trunk) | 6.43944521e8 | 359780 | 1188428656 | 25 | 6.8334e-14 | true |
| 4 | JSOSolvers (tron) | 6.205422708e9 | 3630139 | 11992520976 | 501 | 5.9770e-12 | false |
| 4 | Ipopt | 2.6974995e6 | 632 | 2347072 | 8 | 4.0004e-15 | true |
| 4 | MadNLP | 1.5363955e6 | 827 | 2362448 | 7 | 4.7778e-13 | true |
| 8 | SecondOrderOptimization (Sparse LM) | 1.0493755e6 | 199 | 649728 | 7 | 2.8516e-15 | true |
| 8 | SecondOrderOptimization (Sparse Dogleg) | 1.5232085e6 | 198 | 585712 | 11 | 6.0395e-25 | true |
| 8 | CaNNOLeS | 1.756396e6 | 208 | 712224 | 6 | 3.4177e-16 | true |
| 8 | JSOSolvers (trunk) | 3.0000271792e10 | 8961089 | 59033970256 | 200 | 4.8776e-13 | false |
| 8 | JSOSolvers (tron) | 2.9703426958e10 | 8843893 | 58261488816 | 501 | 6.9254e-12 | false |
| 8 | Ipopt | 5.163521e6 | 766 | 6821744 | 10 | 1.4563e-14 | true |
| 8 | MadNLP | 2.6497915e6 | 827 | 5363552 | 7 | 1.8327e-11 | true |
| 12 | SecondOrderOptimization (Sparse LM) | 2.0025205e6 | 226 | 1096384 | 7 | 1.1061e-15 | true |
| 12 | SecondOrderOptimization (Sparse Dogleg) | 2.1465835e6 | 226 | 984176 | 8 | 9.7860e-26 | true |
| 12 | CaNNOLeS | 3.3447505e6 | 222 | 1259808 | 6 | 8.4917e-16 | true |
| 12 | JSOSolvers (trunk) | 3.0000492708e10 | 6611146 | 77880219792 | 87 | 3.0898e-12 | false |
| 12 | JSOSolvers (tron) | 3.0001443083e10 | 6638999 | 78207500576 | 180 | 6.3665e-12 | false |
| 12 | Ipopt | 7.6820835e6 | 740 | 11347760 | 9 | 5.4678e-14 | true |
| 12 | MadNLP | 3.4619165e6 | 792 | 7375296 | 5 | 6.7695e-09 | true |
| 16 | SecondOrderOptimization (Sparse LM) | 3.9623955e6 | 227 | 1815968 | 7 | 2.5031e-15 | true |
| 16 | SecondOrderOptimization (Sparse Dogleg) | 4.521042e6 | 227 | 1622352 | 9 | 1.9672e-25 | true |
| 16 | CaNNOLeS | 6.0194585e6 | 226 | 2370400 | 5 | 1.8425e-14 | true |
| 16 | JSOSolvers (trunk) | 3.0000890083e10 | 3798348 | 74434010800 | 39 | 1.4273e-11 | false |
| 16 | JSOSolvers (tron) | 3.0003315459e10 | 3820889 | 74874382000 | 52 | 1.4587e-11 | false |
| 16 | Ipopt | 1.2924333e7 | 740 | 19373856 | 9 | 2.8960e-14 | true |
| 16 | MadNLP | 6.5989585e6 | 833 | 14585168 | 6 | 2.3365e-10 | true |
| 24 | SecondOrderOptimization (Sparse LM) | 1.060125e7 | 227 | 3758384 | 7 | 8.8448e-15 | true |
| 24 | SecondOrderOptimization (Sparse Dogleg) | 1.0854292e7 | 227 | 3353824 | 8 | 1.1723e-24 | true |
| 24 | CaNNOLeS | 1.38327915e7 | 228 | 4834176 | 5 | 1.9298e-17 | true |
| 24 | JSOSolvers (trunk) | 3.000155625e10 | 1696100 | 72747191632 | 18 | 1.2651e-10 | false |
| 24 | JSOSolvers (tron) | 3.000627325e10 | 1713809 | 73503874240 | 13 | 5.2016e-10 | false |
| 24 | Ipopt | 3.30161665e7 | 882 | 52291856 | 11 | 6.0972e-16 | true |
| 24 | MadNLP | 1.55202915e7 | 845 | 32202736 | 6 | 1.3226e-10 | true |
| 32 | SecondOrderOptimization (Sparse LM) | 2.73205625e7 | 232 | 6471968 | 9 | 1.2027e-17 | true |
| 32 | SecondOrderOptimization (Sparse Dogleg) | 1.9799708e7 | 232 | 5773520 | 7 | 2.9399e-24 | true |
| 32 | CaNNOLeS | 3.332375e7 | 228 | 8092544 | 4 | 1.6044e-17 | true |
| 32 | JSOSolvers (trunk) | 3.0004391708e10 | 974720 | 68452693584 | 14 | 1.5487e-09 | false |
| 32 | JSOSolvers (tron) | 3.0016256375e10 | 960929 | 67479326944 | 5 | 1.7252e-09 | false |
| 32 | Ipopt | 4.9632917e7 | 740 | 74536464 | 9 | 1.3067e-14 | true |
| 32 | MadNLP | 3.1862916e7 | 886 | 63895632 | 7 | 2.1740e-11 | true |
| 48 | SecondOrderOptimization (Sparse LM) | 1.03815896e8 | 254 | 14110000 | 12 | 1.8196e-23 | true |
| 48 | SecondOrderOptimization (Sparse Dogleg) | 1.059340415e8 | 254 | 12563680 | 13 | 1.5955e-23 | true |
| 48 | CaNNOLeS | 9.08985e7 | 228 | 18045824 | 4 | 1.8343e-18 | true |
| 48 | JSOSolvers (trunk) | 3.0005454542e10 | 412880 | 65895277136 | 14 | 1.6217e-04 | false |
| 48 | JSOSolvers (tron) | 3.0016821916e10 | 416279 | 66426981776 | 2 | 1.7232e-04 | false |
| 48 | Ipopt | 2.66797417e8 | 1542 | 351228544 | 19 | 1.4722e-23 | true |
| 48 | MadNLP | 9.54515835e7 | 804 | 105275120 | 5 | 2.7168e-08 | true |
| 64 | SecondOrderOptimization (Sparse LM) | 2.48635625e8 | 254 | 27453296 | 13 | 5.3414e-23 | true |
| 64 | SecondOrderOptimization (Sparse Dogleg) | 2.47640271e8 | 254 | 24745760 | 14 | 5.5091e-23 | true |
| 64 | CaNNOLeS | 1.88581916e8 | 228 | 40147840 | 4 | 1.0359e-19 | true |
| 64 | JSOSolvers (trunk) | 3.0009746042e10 | 238790 | 66835453648 | 9 | 6.1471e-01 | false |
| 64 | JSOSolvers (tron) | 3.0045013625e10 | 238679 | 66785244608 | 1 | 1.7984e+01 | false |
| 64 | Ipopt | 7.049169375e8 | 1510 | 620748800 | 19 | 4.8607e-23 | true |
| 64 | MadNLP | 2.037508755e8 | 804 | 185804832 | 5 | 1.6882e-08 | true |
| 96 | SecondOrderOptimization (Sparse LM) | 7.471406255e8 | 342 | 104533216 | 14 | 2.1437e-21 | true |
| 96 | SecondOrderOptimization (Sparse Dogleg) | 8.481932705e8 | 348 | 87980016 | 17 | 2.4382e-22 | true |
| 96 | CaNNOLeS | 5.37221229e8 | 228 | 77273984 | 4 | 1.6285e-21 | true |
| 96 | JSOSolvers (trunk) | 3.0022955292e10 | 104150 | 65598307024 | 5 | 4.4481e+03 | false |
| 96 | JSOSolvers (tron) | 3.0104549667e10 | 105419 | 66148146480 | 1 | 4.3682e+03 | false |
| 96 | Ipopt | 2.756437791e9 | 2149 | 1903594128 | 26 | 2.4973e-22 | true |
| 96 | MadNLP | 7.222942085e8 | 893 | 564854320 | 7 | 3.6600e-08 | true |
| 128 | SecondOrderOptimization (Sparse LM) | 1.893810917e9 | 345 | 148211312 | 15 | 4.6305e-21 | true |
| 128 | SecondOrderOptimization (Sparse Dogleg) | 2.322499042e9 | 354 | 135581488 | 19 | 8.0831e-22 | true |
| 128 | CaNNOLeS | 1.147284708e9 | 228 | 164436864 | 4 | 2.8962e-21 | true |
| 128 | JSOSolvers (trunk) | 3.0039017375e10 | 53870 | 60391062736 | 5 | 1.2181e+05 | false |
| 128 | JSOSolvers (tron) | 3.0206521667e10 | 55079 | 61330041504 | 1 | 1.2845e+05 | false |
| 128 | Ipopt | 4.609293166e9 | 2257 | 3377587760 | 26 | 7.4245e-22 | true |
| 128 | MadNLP | 1.781851584e9 | 935 | 1181265872 | 8 | 1.3112e-07 | true |
| 192 | SecondOrderOptimization (Sparse LM) | 7.092149667e9 | 351 | 394937968 | 17 | 4.4028e-21 | true |
| 192 | SecondOrderOptimization (Sparse Dogleg) | 7.527567875e9 | 354 | 351146960 | 19 | 4.3125e-21 | true |
| 192 | CaNNOLeS | 4.0038005e9 | 228 | 325180288 | 4 | 4.2749e-21 | true |
| 192 | JSOSolvers (trunk) | 3.0112061041e10 | 23990 | 60995162832 | 3 | 1.5779e+06 | false |
| 192 | JSOSolvers (tron) | 3.0568119333e10 | 24599 | 61605334864 | 1 | 1.5792e+06 | false |
| 192 | Ipopt | 1.4018228916e10 | 2617 | 7880823232 | 27 | 4.0159e-21 | true |
| 192 | MadNLP | 5.884508917e9 | 1019 | 3196730720 | 10 | 6.6633e-07 | true |
| 256 | SecondOrderOptimization (Sparse LM) | 1.9592554875e10 | 354 | 598551504 | 18 | 1.3115e-20 | true |
| 256 | SecondOrderOptimization (Sparse Dogleg) | 2.1330759958e10 | 360 | 548223344 | 20 | 1.2362e-20 | true |
| 256 | CaNNOLeS | 1.0111620125e10 | 228 | 633215872 | 4 | 1.2505e-20 | true |
| 256 | JSOSolvers (trunk) | 3.0243002083e10 | 13190 | 59524353744 | 3 | 3.5626e+06 | false |
| 256 | JSOSolvers (tron) | 3.083085725e10 | 13499 | 60241490704 | 1 | 3.5656e+06 | false |
| 256 | Ipopt | 3.0906483208e10 | 2397 | 13493124304 | 26 | 1.1618e-20 | false |
| 256 | MadNLP | 1.5691301709e10 | 1229 | 8333891216 | 15 | 1.3193e-08 | true |
