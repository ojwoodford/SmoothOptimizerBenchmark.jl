# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-10T11:23:07
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 4aac5c9

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 32 | NLLSModel (Sparse) | 209.18367346938774 | 1 | 16 | 1428.5714285714287 | 1 | 32 |
| 32 | Standalone (Sparse) | 224.10679611650485 | 1 | 16 | 2375.0 | 20 | 7856 |
| 32 | NLPModels (MathOptNLSModel) | 5489.75 | 2 | 32 | 13166.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 362.2881355932203 | 1 | 16 | 3142.8571428571427 | 1 | 64 |
| 64 | Standalone (Sparse) | 320.953125 | 1 | 16 | 4007.0 | 20 | 17200 |
| 64 | NLPModels (MathOptNLSModel) | 10625.0 | 2 | 32 | 25000.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 636.71875 | 1 | 16 | 5916.75 | 1 | 64 |
| 128 | Standalone (Sparse) | 585.6388888888889 | 1 | 16 | 7583.333333333333 | 22 | 33584 |
| 128 | NLPModels (MathOptNLSModel) | 24209.0 | 2 | 32 | 56708.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 1285.3076923076924 | 1 | 16 | 13000.0 | 1 | 64 |
| 256 | Standalone (Sparse) | 1067.9473684210527 | 1 | 16 | 17667.0 | 24 | 67440 |
| 256 | NLPModels (MathOptNLSModel) | 42459.0 | 2 | 32 | 109458.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 2354.125 | 1 | 16 | 22416.0 | 1 | 64 |
| 512 | Standalone (Sparse) | 2233.3 | 1 | 16 | 28208.0 | 24 | 134256 |
| 512 | NLPModels (MathOptNLSModel) | 89042.0 | 2 | 32 | 202625.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 4645.75 | 1 | 16 | 51125.0 | 1 | 64 |
| 1024 | Standalone (Sparse) | 4133.2 | 1 | 16 | 62083.0 | 24 | 267920 |
| 1024 | NLPModels (MathOptNLSModel) | 188209.0 | 2 | 32 | 405959.0 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 9222.0 | 1 | 16 | 96792.0 | 1 | 64 |
| 2048 | Standalone (Sparse) | 8194.333333333334 | 1 | 16 | 122750.0 | 25 | 502384 |
| 2048 | NLPModels (MathOptNLSModel) | 402000.0 | 2 | 32 | 1.576e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 20000.0 | 1 | 16 | 190666.0 | 1 | 64 |
| 4096 | Standalone (Sparse) | 16375.0 | 1 | 16 | 255500.0 | 25 | 1020528 |
| 4096 | NLPModels (MathOptNLSModel) | 1.904458e6 | 2 | 32 | 4.458084e6 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 38333.0 | 1 | 16 | 360125.0 | 1 | 64 |
| 8192 | Standalone (Sparse) | 33375.0 | 1 | 16 | 518500.0 | 25 | 2007664 |
| 8192 | NLPModels (MathOptNLSModel) | 4.598666e6 | 2 | 32 | 1.0153459e7 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 79834.0 | 1 | 16 | 230041.0 | 6 | 6608 |
| 16384 | Standalone (Sparse) | 65750.0 | 1 | 16 | 926042.0 | 25 | 3981936 |
| 16384 | NLPModels (MathOptNLSModel) | 1.0793125e7 | 2 | 32 | 3.0425542e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 160792.0 | 1 | 16 | 568792.0 | 6 | 6608 |
| 32768 | Standalone (Sparse) | 131375.0 | 1 | 16 | 1.941083e6 | 25 | 7897712 |
| 32768 | NLPModels (MathOptNLSModel) | 2.4368292e7 | 2 | 32 | 6.6087417e7 | 5 | 128 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 32 | SecondOrderOptimization (Dogleg) | 28792.0 | 141 | 54000 | 3 | 5.6402e-27 | true |
| 32 | SecondOrderOptimization (LM) | 34062.5 | 143 | 70240 | 4 | 7.9500e-20 | true |
| 32 | LeastSquaresOptim (Dogleg) | 202042.0 | 139 | 22864 | 13 | 1.4747e-11 | true |
| 32 | LeastSquaresOptim (LM) | 344812.5 | 187 | 34496 | 19 | 1.1774e-15 | true |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32 | Optim (Newton) | 104021.0 | 355 | 103392 | 3 | 2.8725e-27 | true |
| 32 | JSOSolvers (trunk) | 583500.0 | 617 | 39760 | 6 | 7.8113e-20 | false |
| 32 | JSOSolvers (tron) | 808459.0 | 716 | 40832 | 4 | 2.2735e-21 | false |
| 32 | Ipopt | 656146.0 | 390 | 30832 | 3 | 3.4854e-63 | true |
| 32 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 32 | NonlinearSolve (LM) | 509208.0 | 666 | 92768 | 17 | 1.5166e-18 | true |
| 32 | NonlinearSolve (TrustRegion) | 83708.0 | 671 | 76384 | 3 | 1.9509e-19 | true |
| 32 | CaNNOLeS | 50958.0 | 180 | 48880 | 3 | 3.3924e-27 | true |
| 64 | SecondOrderOptimization (Dogleg) | 48583.0 | 221 | 96656 | 3 | 9.0812e-26 | true |
| 64 | SecondOrderOptimization (LM) | 56417.0 | 222 | 99344 | 5 | 1.0959e-18 | true |
| 64 | LeastSquaresOptim (Dogleg) | 2.93375e7 | 5035 | 2512096 | 500 | 8.4437e-03 | false |
| 64 | LeastSquaresOptim (LM) | 2.615875e6 | 297 | 131872 | 27 | 8.3599e-14 | true |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 64 | Optim (Newton) | 127520.5 | 359 | 203744 | 3 | 1.0023e-25 | true |
| 64 | JSOSolvers (trunk) | 2.691792e6 | 1467 | 84912 | 7 | 5.2143e-22 | false |
| 64 | JSOSolvers (tron) | 7.380125e6 | 3560 | 188624 | 13 | 6.3499e-17 | false |
| 64 | Ipopt | 676541.5 | 338 | 49680 | 2 | 3.8541e-47 | true |
| 64 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 64 | NonlinearSolve (LM) | 1.810354e6 | 673 | 214528 | 20 | 3.0467e-21 | true |
| 64 | NonlinearSolve (TrustRegion) | 111229.0 | 678 | 176080 | 3 | 2.4609e-19 | true |
| 64 | CaNNOLeS | 102479.0 | 194 | 97008 | 3 | 9.6264e-26 | true |
| 128 | SecondOrderOptimization (Dogleg) | 99625.0 | 236 | 185888 | 4 | 2.3553e-24 | true |
| 128 | SecondOrderOptimization (LM) | 130812.5 | 234 | 190000 | 7 | 3.5241e-24 | true |
| 128 | LeastSquaresOptim (Dogleg) | 1.04801958e8 | 5035 | 2527168 | 500 | 1.6872e+01 | false |
| 128 | LeastSquaresOptim (LM) | 2.25510417e8 | 5335 | 8514864 | 443 | 1.1009e-09 | true |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 128 | Optim (Newton) | 256500.5 | 477 | 505984 | 4 | 2.9738e-24 | true |
| 128 | JSOSolvers (trunk) | 2.16345e7 | 4457 | 237680 | 8 | 4.9369e-18 | false |
| 128 | JSOSolvers (tron) | 1.292115333e9 | 259830 | 12503200 | 12 | 1.1094e-16 | false |
| 128 | Ipopt | 953041.5 | 349 | 69744 | 2 | 7.4496e-46 | true |
| 128 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 128 | NonlinearSolve (LM) | 7.079104e6 | 693 | 493120 | 22 | 3.6239e-18 | true |
| 128 | NonlinearSolve (TrustRegion) | 131854.5 | 688 | 150192 | 3 | 3.8619e-19 | true |
| 128 | CaNNOLeS | 201020.5 | 217 | 174944 | 3 | 2.6889e-24 | true |
| 256 | SecondOrderOptimization (Dogleg) | 219812.5 | 280 | 369040 | 4 | 1.0706e-22 | true |
| 256 | SecondOrderOptimization (LM) | 315750.0 | 277 | 377280 | 8 | 1.2124e-22 | true |
| 256 | LeastSquaresOptim (Dogleg) | 3.88224125e8 | 6048 | 9732064 | 500 | 8.4444e+01 | false |
| 256 | LeastSquaresOptim (LM) | 9.399475e8 | 6033 | 9654480 | 500 | 2.5926e+01 | false |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 256 | Optim (Newton) | 410395.5 | 505 | 1004416 | 4 | 8.2267e-23 | true |
| 256 | JSOSolvers (trunk) | 4.125527334e9 | 422824 | 20335344 | 208 | 2.5351e-17 | false |
| 256 | JSOSolvers (tron) | 3.0004496208e10 | 3050296 | 146446768 | 61 | 2.0411e-12 | false |
| 256 | Ipopt | 1.360313e6 | 369 | 138704 | 2 | 1.2199e-51 | true |
| 256 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 256 | NonlinearSolve (LM) | 3.0416167e7 | 744 | 1519680 | 25 | 9.2283e-19 | true |
| 256 | NonlinearSolve (TrustRegion) | 155937.5 | 746 | 290304 | 3 | 6.8203e-19 | true |
| 256 | CaNNOLeS | 351125.0 | 240 | 352864 | 3 | 9.7289e-23 | true |
| 512 | SecondOrderOptimization (Dogleg) | 352458.0 | 280 | 725104 | 4 | 2.5649e-21 | true |
| 512 | SecondOrderOptimization (LM) | 547520.5 | 280 | 745696 | 9 | 4.0273e-21 | true |
| 512 | LeastSquaresOptim (Dogleg) | 1.121061375e9 | 6048 | 9774688 | 500 | 2.0403e+02 | false |
| 512 | LeastSquaresOptim (LM) | 1.202939041e9 | 6125 | 12003088 | 500 | 2.0331e+02 | false |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 512 | Optim (Newton) | 666479.0 | 521 | 1995136 | 4 | 2.5808e-21 | true |
| 512 | JSOSolvers (trunk) | 3.0000367959e10 | 1545593 | 74256896 | 379 | 2.4478e+01 | false |
| 512 | JSOSolvers (tron) | 3.0000389792e10 | 1536273 | 73833600 | 16 | 1.1095e+01 | false |
| 512 | Ipopt | 2.478208e6 | 371 | 283760 | 2 | 1.6725e-50 | true |
| 512 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 512 | NonlinearSolve (LM) | 1.08619104e8 | 10044 | 52028800 | 28 | 2.7934e-17 | true |
| 512 | NonlinearSolve (TrustRegion) | 236917.0 | 752 | 581008 | 3 | 1.2830e-18 | true |
| 512 | CaNNOLeS | 707750.5 | 248 | 725728 | 3 | 3.4085e-21 | true |
| 1024 | SecondOrderOptimization (Dogleg) | 671854.5 | 283 | 1506960 | 4 | 9.5650e-20 | true |
| 1024 | SecondOrderOptimization (LM) | 1.2846455e6 | 283 | 1556224 | 11 | 8.5848e-20 | true |
| 1024 | LeastSquaresOptim (Dogleg) | 1.794517041e9 | 6108 | 11335456 | 500 | 4.6396e+02 | false |
| 1024 | LeastSquaresOptim (LM) | 2.096032834e9 | 6077 | 10903824 | 500 | 4.6397e+02 | false |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1024 | Optim (Newton) | 1.272729e6 | 521 | 4205600 | 4 | 8.5372e-20 | true |
| 1024 | JSOSolvers (trunk) | 3.0000542875e10 | 777383 | 37452448 | 97 | 3.9596e+02 | false |
| 1024 | JSOSolvers (tron) | 3.0000800333e10 | 772286 | 37273520 | 4 | 4.1397e+02 | false |
| 1024 | Ipopt | 5.342771e6 | 375 | 454864 | 2 | 1.9886e-46 | true |
| 1024 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 1024 | NonlinearSolve (LM) | 2.314512458e9 | 56338 | 588935136 | 166 | 6.5760e-16 | true |
| 1024 | NonlinearSolve (TrustRegion) | 1.0059585e6 | 769 | 3160128 | 3 | 2.5744e-18 | true |
| 1024 | CaNNOLeS | 1.507542e6 | 248 | 1405664 | 3 | 8.9525e-20 | true |
| 2048 | SecondOrderOptimization (Dogleg) | 1.2719785e6 | 288 | 2841200 | 4 | 2.7584e-18 | true |
| 2048 | SecondOrderOptimization (LM) | 2.662042e6 | 288 | 2923232 | 12 | 2.8708e-18 | true |
| 2048 | LeastSquaresOptim (Dogleg) | 3.092730541e9 | 6096 | 11472992 | 500 | 9.8231e+02 | false |
| 2048 | LeastSquaresOptim (LM) | 3.758780083e9 | 6053 | 10475920 | 500 | 9.8236e+02 | false |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2048 | Optim (Newton) | 2.3518955e6 | 638 | 7775872 | 4 | 2.8565e-18 | true |
| 2048 | JSOSolvers (trunk) | 3.0001228625e10 | 391639 | 19076000 | 26 | 9.0879e+02 | false |
| 2048 | JSOSolvers (tron) | 3.0003033875e10 | 386943 | 18981984 | 1 | 9.3074e+02 | false |
| 2048 | Ipopt | 1.0826646e7 | 379 | 915984 | 2 | 3.7204e-44 | true |
| 2048 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 2048 | NonlinearSolve (LM) | 9.002970875e9 | 58078 | 1226869408 | 171 | 2.2750e-14 | true |
| 2048 | NonlinearSolve (TrustRegion) | 1.9488755e6 | 775 | 6263968 | 3 | 8.0194e-18 | true |
| 2048 | CaNNOLeS | 4.1622915e6 | 250 | 2700032 | 3 | 2.9864e-18 | true |
| 4096 | SecondOrderOptimization (Dogleg) | 2.507042e6 | 288 | 5813104 | 4 | 9.7013e-17 | true |
| 4096 | SecondOrderOptimization (LM) | 5.7838545e6 | 288 | 5977056 | 13 | 9.6078e-17 | true |
| 4096 | LeastSquaresOptim (Dogleg) | 1.48298625e8 | 80 | 729472 | 2 | 2.0477e+03 | true |
| 4096 | LeastSquaresOptim (LM) | 5.331067667e9 | 5687 | 7927472 | 500 | 2.0119e+03 | false |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 4096 | Optim (Newton) | 4.9529785e6 | 526 | 15959936 | 4 | 9.6838e-17 | true |
| 4096 | JSOSolvers (trunk) | 3.000295975e10 | 136025 | 7085056 | 7 | 1.9504e+03 | false |
| 4096 | JSOSolvers (tron) | 3.0007861084e10 | 130952 | 7104272 | 1 | 1.9664e+03 | false |
| 4096 | Ipopt | 2.5389917e7 | 383 | 1846544 | 2 | 0.0000e+00 | true |
| 4096 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 4096 | NonlinearSolve (LM) | 3.003979075e10 | 755 | 291010688 | 103 | 8.6762e-13 | false |
| 4096 | NonlinearSolve (TrustRegion) | 4.3811375e7 | 2140 | 111084016 | 35 | 9.6297e-17 | true |
| 4096 | CaNNOLeS | 1.28863335e7 | 252 | 5288736 | 3 | 9.9773e-17 | true |
| 8192 | SecondOrderOptimization (Dogleg) | 6.5652085e6 | 290 | 11363760 | 6 | 3.2591e-15 | true |
| 8192 | SecondOrderOptimization (LM) | 1.34463335e7 | 288 | 11691520 | 16 | 3.0995e-15 | true |
| 8192 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | LeastSquaresOptim (LM) | 2.5416875e6 | 53 | 790240 | 1 | 4.0954e+03 | true |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | Optim (Newton) | 1.5485229e7 | 769 | 44576400 | 6 | 3.1978e-15 | true |
| 8192 | JSOSolvers (trunk) | 3.0007671875e10 | 32157 | 2656448 | 3 | 4.0438e+03 | false |
| 8192 | JSOSolvers (tron) | 3.0026454334e10 | 32123 | 3180224 | 1 | 4.0439e+03 | false |
| 8192 | Ipopt | 5.0145333e7 | 393 | 3674448 | 2 | 0.0000e+00 | true |
| 8192 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | NonlinearSolve (LM) | 3.0192070166e10 | 13032 | 1033041184 | 37 | 3.1470e-11 | false |
| 8192 | NonlinearSolve (TrustRegion) | 8.63508745e7 | 2139 | 210924000 | 35 | 3.0302e-15 | true |
| 8192 | CaNNOLeS | 2.98665e7 | 254 | 10449728 | 3 | 3.1855e-15 | true |
| 16384 | SecondOrderOptimization (Dogleg) | 5.986875e6 | 339 | 26064176 | 1 | 1.3833e-01 | false |
| 16384 | SecondOrderOptimization (LM) | 2.5789e7 | 432 | 26837488 | 19 | 1.2684e-13 | true |
| 16384 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | LeastSquaresOptim (LM) | 5.0382085e6 | 54 | 1577664 | 1 | 8.1914e+03 | true |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | Optim (Newton) | 3.9390917e7 | 958 | 114532928 | 8 | 1.1880e-13 | true |
| 16384 | JSOSolvers (trunk) | 3.0021120125e10 | 9463 | 2681248 | 3 | 8.1645e+03 | false |
| 16384 | JSOSolvers (tron) | 3.0078579917e10 | 9534 | 3735296 | 1 | 8.1646e+03 | false |
| 16384 | Ipopt | 1.09162708e8 | 554 | 7348800 | 2 | 0.0000e+00 | true |
| 16384 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | NonlinearSolve (LM) | 3.2195999292e10 | 3972 | 560167648 | 10 | 8.1849e+03 | false |
| 16384 | NonlinearSolve (TrustRegion) | 1.69736292e8 | 2171 | 411358176 | 35 | 9.5663e-14 | true |
| 16384 | CaNNOLeS | 7.274384208e9 | 1252 | 21081632 | 501 | 1.0151e-13 | false |
| 32768 | SecondOrderOptimization (Dogleg) | 1.77312295e7 | 340 | 52067648 | 2 | 4.7013e+00 | true |
| 32768 | SecondOrderOptimization (LM) | 5.13359604e8 | 937 | 54157248 | 120 | 2.0568e-08 | true |
| 32768 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | Optim (Newton) | 8.3251584e7 | 805 | 234449664 | 5 | 5.9465e-08 | false |
| 32768 | JSOSolvers (trunk) | 3.0036910667e10 | 4429 | 4667840 | 3 | 1.6366e+04 | false |
| 32768 | JSOSolvers (tron) | 3.0159815958e10 | 4538 | 6774336 | 1 | 1.6366e+04 | false |
| 32768 | Ipopt | 2.07966875e8 | 407 | 14674192 | 2 | 0.0000e+00 | true |
| 32768 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | CaNNOLeS | 1.3871611334e10 | 1254 | 43839040 | 501 | 3.2323e-12 | false |
