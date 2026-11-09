# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-09T20:01:11
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 5a66143

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 32 | NLLSModel (Sparse) | 156.82677165354332 | 0 | 0 | 1346.375 | 0 | 0 |
| 32 | Standalone (Sparse) | 139.28571428571428 | 0 | 0 | 2380.25 | 19 | 7792 |
| 32 | NLPModels (MathOptNLSModel) | 84.89211618257261 | 2 | 32 | 7069.333333333333 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 297.79411764705884 | 0 | 0 | 2869.1428571428573 | 0 | 0 |
| 64 | Standalone (Sparse) | 264.44 | 0 | 0 | 3633.2 | 19 | 17136 |
| 64 | NLPModels (MathOptNLSModel) | 101.01463414634146 | 2 | 32 | 14917.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 584.5142857142857 | 0 | 0 | 5656.25 | 0 | 0 |
| 128 | Standalone (Sparse) | 519.2307692307693 | 0 | 0 | 7944.333333333333 | 21 | 33520 |
| 128 | NLPModels (MathOptNLSModel) | 130.31543624161074 | 2 | 32 | 29542.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 1148.1666666666667 | 0 | 0 | 11166.0 | 0 | 0 |
| 256 | Standalone (Sparse) | 1029.15 | 0 | 0 | 15875.0 | 23 | 67376 |
| 256 | NLPModels (MathOptNLSModel) | 181.85981308411215 | 2 | 32 | 59875.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 2287.0 | 0 | 0 | 22333.0 | 0 | 0 |
| 512 | Standalone (Sparse) | 2050.0 | 0 | 0 | 27917.0 | 23 | 134192 |
| 512 | NLPModels (MathOptNLSModel) | 261.27027027027026 | 2 | 32 | 124625.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 4558.2 | 0 | 0 | 44583.0 | 0 | 0 |
| 1024 | Standalone (Sparse) | 4091.8 | 0 | 0 | 56333.0 | 23 | 267856 |
| 1024 | NLPModels (MathOptNLSModel) | 421.0208333333333 | 2 | 32 | 304958.0 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 9139.0 | 0 | 0 | 89666.0 | 0 | 0 |
| 2048 | Standalone (Sparse) | 8166.666666666667 | 0 | 0 | 116666.0 | 24 | 502320 |
| 2048 | NLPModels (MathOptNLSModel) | 740.7407407407408 | 2 | 32 | 1.163042e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 18334.0 | 0 | 0 | 184875.0 | 0 | 0 |
| 4096 | Standalone (Sparse) | 17334.0 | 0 | 0 | 243333.0 | 24 | 1020464 |
| 4096 | NLPModels (MathOptNLSModel) | 1380.5333333333333 | 2 | 32 | 3.2685e6 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 37291.0 | 0 | 0 | 368500.0 | 0 | 0 |
| 8192 | Standalone (Sparse) | 33667.0 | 0 | 0 | 486916.0 | 24 | 2007600 |
| 8192 | NLPModels (MathOptNLSModel) | 2776.0 | 2 | 32 | 7.060708e6 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 73333.0 | 0 | 0 | 231542.0 | 5 | 6544 |
| 16384 | Standalone (Sparse) | 69209.0 | 0 | 0 | 872417.0 | 24 | 3981872 |
| 16384 | NLPModels (MathOptNLSModel) | 5250.0 | 2 | 32 | 1.8959875e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 151333.0 | 0 | 0 | 2.947792e6 | 5 | 6544 |
| 32768 | Standalone (Sparse) | 138667.0 | 0 | 0 | 1.956666e6 | 24 | 7897648 |
| 32768 | NLPModels (MathOptNLSModel) | 10750.0 | 2 | 32 | 4.4568917e7 | 5 | 128 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 32 | SecondOrderOptimization (Dogleg) | 26396.0 | 141 | 54000 | 3 | 5.6402e-27 | true |
| 32 | SecondOrderOptimization (LM) | 32062.5 | 143 | 70240 | 4 | 7.9500e-20 | true |
| 32 | LeastSquaresOptim (Dogleg) | 209937.5 | 139 | 22864 | 13 | 1.4747e-11 | true |
| 32 | LeastSquaresOptim (LM) | 356562.5 | 187 | 34496 | 19 | 1.1774e-15 | true |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32 | Optim (Newton) | 91312.0 | 355 | 103392 | 3 | 2.8725e-27 | true |
| 32 | JSOSolvers (trunk) | 517292.0 | 617 | 39760 | 6 | 7.8113e-20 | false |
| 32 | JSOSolvers (tron) | 766583.0 | 716 | 40832 | 4 | 2.2735e-21 | false |
| 32 | Ipopt | 688187.5 | 390 | 30832 | 3 | 3.4854e-63 | true |
| 32 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 32 | NonlinearSolve (LM) | 494396.0 | 666 | 92768 | 17 | 1.5166e-18 | true |
| 32 | NonlinearSolve (TrustRegion) | 83167.0 | 671 | 76384 | 3 | 1.9509e-19 | true |
| 32 | CaNNOLeS | 51333.0 | 180 | 48880 | 3 | 3.3924e-27 | true |
| 64 | SecondOrderOptimization (Dogleg) | 50333.0 | 221 | 96656 | 3 | 9.0812e-26 | true |
| 64 | SecondOrderOptimization (LM) | 57084.0 | 222 | 99344 | 5 | 1.0959e-18 | true |
| 64 | LeastSquaresOptim (Dogleg) | 3.0864292e7 | 5035 | 2512096 | 500 | 8.4437e-03 | false |
| 64 | LeastSquaresOptim (LM) | 2.7552705e6 | 297 | 131872 | 27 | 8.3599e-14 | true |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 64 | Optim (Newton) | 128020.5 | 359 | 203744 | 3 | 1.0023e-25 | true |
| 64 | JSOSolvers (trunk) | 2.655834e6 | 1467 | 84912 | 7 | 5.2143e-22 | false |
| 64 | JSOSolvers (tron) | 7.382875e6 | 3560 | 188624 | 13 | 6.3499e-17 | false |
| 64 | Ipopt | 737250.0 | 338 | 49680 | 2 | 3.8541e-47 | true |
| 64 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 64 | NonlinearSolve (LM) | 1.762521e6 | 673 | 214528 | 20 | 3.0467e-21 | true |
| 64 | NonlinearSolve (TrustRegion) | 95375.0 | 678 | 176080 | 3 | 2.4609e-19 | true |
| 64 | CaNNOLeS | 96395.5 | 194 | 97008 | 3 | 9.6264e-26 | true |
| 128 | SecondOrderOptimization (Dogleg) | 93750.0 | 236 | 185888 | 4 | 2.3553e-24 | true |
| 128 | SecondOrderOptimization (LM) | 125417.0 | 234 | 190000 | 7 | 3.5241e-24 | true |
| 128 | LeastSquaresOptim (Dogleg) | 1.08791208e8 | 5035 | 2527168 | 500 | 1.6872e+01 | false |
| 128 | LeastSquaresOptim (LM) | 2.35246709e8 | 5335 | 8514864 | 443 | 1.1009e-09 | true |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 128 | Optim (Newton) | 258624.5 | 477 | 505984 | 4 | 2.9738e-24 | true |
| 128 | JSOSolvers (trunk) | 2.0659625e7 | 4458 | 237968 | 8 | 4.9369e-18 | false |
| 128 | JSOSolvers (tron) | 1.293627375e9 | 259830 | 12503200 | 12 | 1.1094e-16 | false |
| 128 | Ipopt | 965958.0 | 349 | 69744 | 2 | 7.4496e-46 | true |
| 128 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 128 | NonlinearSolve (LM) | 6.996042e6 | 693 | 493120 | 22 | 3.6239e-18 | true |
| 128 | NonlinearSolve (TrustRegion) | 118104.0 | 688 | 150192 | 3 | 3.8619e-19 | true |
| 128 | CaNNOLeS | 185291.5 | 217 | 174944 | 3 | 2.6889e-24 | true |
| 256 | SecondOrderOptimization (Dogleg) | 214708.5 | 280 | 369040 | 4 | 1.0706e-22 | true |
| 256 | SecondOrderOptimization (LM) | 299042.0 | 277 | 377280 | 8 | 1.2124e-22 | true |
| 256 | LeastSquaresOptim (Dogleg) | 3.894645e8 | 6048 | 9732064 | 500 | 8.4444e+01 | false |
| 256 | LeastSquaresOptim (LM) | 9.67693958e8 | 6033 | 9654480 | 500 | 2.5926e+01 | false |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 256 | Optim (Newton) | 393708.5 | 505 | 1004416 | 4 | 8.2267e-23 | true |
| 256 | JSOSolvers (trunk) | 4.072318625e9 | 422824 | 20335344 | 208 | 2.5351e-17 | false |
| 256 | JSOSolvers (tron) | 3.0000181875e10 | 3099210 | 148787984 | 62 | 1.7483e-12 | false |
| 256 | Ipopt | 1.451604e6 | 369 | 138704 | 2 | 1.2199e-51 | true |
| 256 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 256 | NonlinearSolve (LM) | 3.0242709e7 | 744 | 1519680 | 25 | 9.2283e-19 | true |
| 256 | NonlinearSolve (TrustRegion) | 156104.0 | 746 | 290304 | 3 | 6.8203e-19 | true |
| 256 | CaNNOLeS | 348145.5 | 240 | 352864 | 3 | 9.7289e-23 | true |
| 512 | SecondOrderOptimization (Dogleg) | 350750.0 | 280 | 725104 | 4 | 2.5649e-21 | true |
| 512 | SecondOrderOptimization (LM) | 531167.0 | 280 | 745696 | 9 | 4.0273e-21 | true |
| 512 | LeastSquaresOptim (Dogleg) | 1.127480708e9 | 6048 | 9774688 | 500 | 2.0403e+02 | false |
| 512 | LeastSquaresOptim (LM) | 1.195749667e9 | 6125 | 12003088 | 500 | 2.0331e+02 | false |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 512 | Optim (Newton) | 699708.5 | 521 | 1995136 | 4 | 2.5808e-21 | true |
| 512 | JSOSolvers (trunk) | 3.0000313125e10 | 1566111 | 75241760 | 384 | 2.3890e+01 | false |
| 512 | JSOSolvers (tron) | 3.0000448417e10 | 1576795 | 75780576 | 17 | 1.0830e+01 | false |
| 512 | Ipopt | 2.395438e6 | 371 | 283760 | 2 | 1.6725e-50 | true |
| 512 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 512 | NonlinearSolve (LM) | 1.043199375e8 | 10052 | 52028928 | 28 | 2.7934e-17 | true |
| 512 | NonlinearSolve (TrustRegion) | 224333.0 | 752 | 581008 | 3 | 1.2830e-18 | true |
| 512 | CaNNOLeS | 688083.0 | 248 | 725728 | 3 | 3.4085e-21 | true |
| 1024 | SecondOrderOptimization (Dogleg) | 653937.0 | 283 | 1506960 | 4 | 9.5650e-20 | true |
| 1024 | SecondOrderOptimization (LM) | 1.26375e6 | 283 | 1556224 | 11 | 8.5848e-20 | true |
| 1024 | LeastSquaresOptim (Dogleg) | 1.802081875e9 | 6108 | 11335456 | 500 | 4.6396e+02 | false |
| 1024 | LeastSquaresOptim (LM) | 2.178906625e9 | 6077 | 10903824 | 500 | 4.6397e+02 | false |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1024 | Optim (Newton) | 1.2298545e6 | 741 | 4209120 | 4 | 8.5372e-20 | true |
| 1024 | JSOSolvers (trunk) | 3.000058575e10 | 794445 | 38271424 | 99 | 3.9549e+02 | false |
| 1024 | JSOSolvers (tron) | 3.0000870291e10 | 791881 | 38214080 | 5 | 4.1344e+02 | false |
| 1024 | Ipopt | 4.609104e6 | 375 | 454864 | 2 | 1.9886e-46 | true |
| 1024 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 1024 | NonlinearSolve (LM) | 2.267688291e9 | 56374 | 588935712 | 166 | 6.5760e-16 | true |
| 1024 | NonlinearSolve (TrustRegion) | 974771.5 | 769 | 3160128 | 3 | 2.5744e-18 | true |
| 1024 | CaNNOLeS | 1.4241875e6 | 248 | 1405664 | 3 | 8.9525e-20 | true |
| 2048 | SecondOrderOptimization (Dogleg) | 1.2533955e6 | 288 | 2841200 | 4 | 2.7584e-18 | true |
| 2048 | SecondOrderOptimization (LM) | 2.6119585e6 | 288 | 2923232 | 12 | 2.8708e-18 | true |
| 2048 | LeastSquaresOptim (Dogleg) | 2.976881958e9 | 6096 | 11472992 | 500 | 9.8231e+02 | false |
| 2048 | LeastSquaresOptim (LM) | 3.607530375e9 | 6053 | 10475920 | 500 | 9.8236e+02 | false |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2048 | Optim (Newton) | 2.4234165e6 | 526 | 7774080 | 4 | 2.8565e-18 | true |
| 2048 | JSOSolvers (trunk) | 3.0001136791e10 | 396711 | 19319456 | 27 | 9.0825e+02 | false |
| 2048 | JSOSolvers (tron) | 3.0003210875e10 | 384209 | 18850752 | 1 | 9.3100e+02 | false |
| 2048 | Ipopt | 1.1800792e7 | 379 | 915984 | 2 | 3.7204e-44 | true |
| 2048 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 2048 | NonlinearSolve (LM) | 8.988334833e9 | 58046 | 1226868896 | 171 | 2.2750e-14 | true |
| 2048 | NonlinearSolve (TrustRegion) | 1.9531875e6 | 775 | 6263968 | 3 | 8.0194e-18 | true |
| 2048 | CaNNOLeS | 4.405021e6 | 250 | 2700032 | 3 | 2.9864e-18 | true |
| 4096 | SecondOrderOptimization (Dogleg) | 2.584e6 | 288 | 5813104 | 4 | 9.7013e-17 | true |
| 4096 | SecondOrderOptimization (LM) | 5.7305e6 | 288 | 5977056 | 13 | 9.6078e-17 | true |
| 4096 | LeastSquaresOptim (Dogleg) | 1.49895792e8 | 80 | 729472 | 2 | 2.0477e+03 | true |
| 4096 | LeastSquaresOptim (LM) | 5.419062375e9 | 5687 | 7927472 | 500 | 2.0119e+03 | false |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 4096 | Optim (Newton) | 4.8411455e6 | 526 | 15959936 | 4 | 9.6838e-17 | true |
| 4096 | JSOSolvers (trunk) | 3.0003497458e10 | 128563 | 6726880 | 6 | 1.9521e+03 | false |
| 4096 | JSOSolvers (tron) | 3.0007513125e10 | 123376 | 6740624 | 1 | 1.9683e+03 | false |
| 4096 | Ipopt | 2.5135625e7 | 383 | 1846544 | 2 | 0.0000e+00 | true |
| 4096 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 4096 | NonlinearSolve (LM) | 3.0153364167e10 | 755 | 291010688 | 104 | 8.5849e-13 | false |
| 4096 | NonlinearSolve (TrustRegion) | 4.42776455e7 | 2142 | 111084048 | 35 | 9.6297e-17 | true |
| 4096 | CaNNOLeS | 1.1620333e7 | 252 | 5288736 | 3 | 9.9773e-17 | true |
| 8192 | SecondOrderOptimization (Dogleg) | 6.50525e6 | 290 | 11363760 | 6 | 3.2591e-15 | true |
| 8192 | SecondOrderOptimization (LM) | 1.3316375e7 | 288 | 11691520 | 16 | 3.0995e-15 | true |
| 8192 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | LeastSquaresOptim (LM) | 2.589771e6 | 53 | 790240 | 1 | 4.0954e+03 | true |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | Optim (Newton) | 1.5422979e7 | 770 | 44576416 | 6 | 3.1978e-15 | true |
| 8192 | JSOSolvers (trunk) | 3.0007835583e10 | 32263 | 2661536 | 3 | 4.0437e+03 | false |
| 8192 | JSOSolvers (tron) | 3.0025400125e10 | 32447 | 3195776 | 1 | 4.0437e+03 | false |
| 8192 | Ipopt | 5.1724083e7 | 393 | 3674448 | 2 | 0.0000e+00 | true |
| 8192 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | NonlinearSolve (LM) | 3.0563991458e10 | 13376 | 1060837024 | 38 | 3.1470e-11 | false |
| 8192 | NonlinearSolve (TrustRegion) | 8.4208167e7 | 2139 | 210924000 | 35 | 3.0302e-15 | true |
| 8192 | CaNNOLeS | 2.5004833e7 | 254 | 10449728 | 3 | 3.1855e-15 | true |
| 16384 | SecondOrderOptimization (Dogleg) | 1.3308125e7 | 370 | 26096992 | 7 | 4.2618e-13 | true |
| 16384 | SecondOrderOptimization (LM) | 2.54400205e7 | 432 | 26837488 | 19 | 1.2684e-13 | true |
| 16384 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | LeastSquaresOptim (LM) | 4.892896e6 | 54 | 1577664 | 1 | 8.1914e+03 | true |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | Optim (Newton) | 3.9009104e7 | 990 | 114533440 | 8 | 1.1880e-13 | true |
| 16384 | JSOSolvers (trunk) | 3.0017628042e10 | 11375 | 2773024 | 3 | 8.1617e+03 | false |
| 16384 | JSOSolvers (tron) | 3.0061303417e10 | 11342 | 3822080 | 1 | 8.1620e+03 | false |
| 16384 | Ipopt | 1.04930979e8 | 403 | 7346384 | 2 | 0.0000e+00 | true |
| 16384 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | NonlinearSolve (LM) | 3.1845317958e10 | 3972 | 559151840 | 10 | 8.1849e+03 | false |
| 16384 | NonlinearSolve (TrustRegion) | 1.68332854e8 | 2150 | 411357840 | 35 | 9.5663e-14 | true |
| 16384 | CaNNOLeS | 6.880561542e9 | 1252 | 21081632 | 501 | 1.0151e-13 | false |
| 32768 | SecondOrderOptimization (Dogleg) | 1.5710542e7 | 340 | 51772736 | 2 | 4.7013e+00 | true |
| 32768 | SecondOrderOptimization (LM) | 4.41907875e8 | 937 | 53862336 | 120 | 2.0568e-08 | true |
| 32768 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | Optim (Newton) | 7.8561417e7 | 806 | 243985168 | 5 | 5.9465e-08 | false |
| 32768 | JSOSolvers (trunk) | 3.0039793917e10 | 4595 | 4675808 | 3 | 1.6365e+04 | false |
| 32768 | JSOSolvers (tron) | 3.0150910125e10 | 4614 | 6777984 | 1 | 1.6365e+04 | false |
| 32768 | Ipopt | 2.11834958e8 | 407 | 14674192 | 2 | 0.0000e+00 | true |
| 32768 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | CaNNOLeS | 1.4110241458e10 | 1254 | 43232832 | 501 | 3.2323e-12 | false |
