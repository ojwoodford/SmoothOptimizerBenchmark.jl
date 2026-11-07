# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T08:58:15
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b62fcb5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 100 | NLLSModel | 194.0392156862745 | 0 | 0 | 2892.8571428571427 | 0 | 0 |
| 100 | Standalone (Sparse) | 58.391304347826086 | 0 | 0 | 4458.4 | 21 | 18480 |
| 100 | NLPModels (MathOptNLSModel) | 417.0 | 5 | 80 | 14542.0 | 9 | 224 |
| 250 | NLLSModel | 570.5833333333334 | 0 | 0 | 7444.333333333333 | 0 | 0 |
| 250 | Standalone (Sparse) | 151.98360655737704 | 0 | 0 | 9792.0 | 22 | 43776 |
| 250 | NLPModels (MathOptNLSModel) | 1006.25 | 5 | 80 | 37000.0 | 9 | 224 |
| 500 | NLLSModel | 1227.9411764705883 | 0 | 0 | 14834.0 | 0 | 0 |
| 500 | Standalone (Sparse) | 321.42857142857144 | 0 | 0 | 18375.0 | 23 | 87088 |
| 500 | NLPModels (MathOptNLSModel) | 1937.5 | 5 | 80 | 77750.0 | 9 | 224 |
| 1000 | NLLSModel | 2439.8888888888887 | 0 | 0 | 29042.0 | 0 | 0 |
| 1000 | Standalone (Sparse) | 589.6666666666666 | 0 | 0 | 38500.0 | 23 | 173648 |
| 1000 | NLPModels (MathOptNLSModel) | 3840.1666666666665 | 5 | 80 | 149083.0 | 9 | 224 |
| 2500 | NLLSModel | 5979.0 | 0 | 0 | 72583.0 | 0 | 0 |
| 2500 | Standalone (Sparse) | 1485.142857142857 | 0 | 0 | 123417.0 | 24 | 465968 |
| 2500 | NLPModels (MathOptNLSModel) | 9834.0 | 5 | 80 | 388958.0 | 9 | 224 |
| 5000 | NLLSModel | 12292.0 | 0 | 0 | 153666.0 | 0 | 0 |
| 5000 | Standalone (Sparse) | 3023.714285714286 | 0 | 0 | 220708.0 | 24 | 890416 |
| 5000 | NLPModels (MathOptNLSModel) | 18875.0 | 5 | 80 | 1.45425e6 | 9 | 224 |
| 10000 | NLLSModel | 23792.0 | 0 | 0 | 128291.0 | 3 | 3504 |
| 10000 | Standalone (Sparse) | 15292.0 | 0 | 0 | 401500.0 | 24 | 1731120 |
| 10000 | NLPModels (MathOptNLSModel) | 37542.0 | 5 | 80 | 4.695375e6 | 9 | 224 |
| 20000 | NLLSModel | 47584.0 | 0 | 0 | 264375.0 | 3 | 3504 |
| 20000 | Standalone (Sparse) | 11791.0 | 0 | 0 | 768666.0 | 24 | 3428912 |
| 20000 | NLPModels (MathOptNLSModel) | 74666.0 | 5 | 80 | 1.5003875e7 | 9 | 224 |
| 35000 | NLLSModel | 82625.0 | 0 | 0 | 337833.0 | 3 | 3504 |
| 35000 | Standalone (Sparse) | 51791.0 | 0 | 0 | 1.478667e6 | 24 | 5964336 |
| 50000 | NLLSModel | 119958.0 | 0 | 0 | 856334.0 | 3 | 3504 |
| 50000 | Standalone (Sparse) | 29417.0 | 0 | 0 | 2.170125e6 | 24 | 8487472 |
| 75000 | NLLSModel | 184833.0 | 0 | 0 | 1.421584e6 | 3 | 3504 |
| 75000 | Standalone (Sparse) | 44500.0 | 0 | 0 | 3.111875e6 | 24 | 12649008 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on standard target model: `Standalone (Sparse)` (`NLLSModel + SecondOrderOptimization` entries run natively on `NLLSModel` with pre-allocated `OptimizationWorkspace`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 100 | NLLSModel + SecondOrderOptimization (Dogleg) | 104791.0 | 0 | 0 | 18 | 0.0000e+00 | true |
| 100 | NLLSModel + SecondOrderOptimization (LM) | 109000.0 | 0 | 0 | 16 | 1.4005e-21 | true |
| 100 | SecondOrderOptimization (Dogleg) | 139312.5 | 486 | 402064 | 18 | 0.0000e+00 | true |
| 100 | SecondOrderOptimization (LM) | 165625.0 | 508 | 422320 | 16 | 1.4005e-21 | true |
| 100 | LeastSquaresOptim (Dogleg) | 964875.0 | 255 | 56736 | 33 | 8.2795e-27 | true |
| 100 | LeastSquaresOptim (LM) | 1.106896e6 | 289 | 57216 | 33 | 4.4801e-17 | true |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 100 | Optim (Newton) | 1.285917e6 | 2920 | 2217856 | 33 | 1.2351e-29 | true |
| 100 | JSOSolvers (trunk) | 209500.0 | 50 | 12608 | 20 | 1.1806e-19 | true |
| 100 | JSOSolvers (tron) | 286166.5 | 124 | 25952 | 22 | 1.0998e-21 | true |
| 100 | Ipopt | 2.562833e6 | 1424 | 533984 | 17 | 1.7412e-28 | true |
| 100 | MadNLP | 1.398667e6 | 1140 | 585968 | 17 | 1.7412e-28 | true |
| 100 | NonlinearSolve (LM) | 1.0939333e7 | 691 | 449456 | 39 | 9.1612e-19 | true |
| 100 | NonlinearSolve (TrustRegion) | 835458.5 | 876 | 517888 | 26 | 1.4840e-29 | true |
| 250 | NLLSModel + SecondOrderOptimization (Dogleg) | 195000.0 | 0 | 0 | 14 | 0.0000e+00 | true |
| 250 | NLLSModel + SecondOrderOptimization (LM) | 261312.5 | 0 | 0 | 15 | 1.4849e-19 | true |
| 250 | SecondOrderOptimization (Dogleg) | 294646.0 | 418 | 773776 | 14 | 0.0000e+00 | true |
| 250 | SecondOrderOptimization (LM) | 409375.5 | 507 | 953104 | 15 | 1.4849e-19 | true |
| 250 | LeastSquaresOptim (Dogleg) | 2.2980415e6 | 274 | 78960 | 35 | 0.0000e+00 | true |
| 250 | LeastSquaresOptim (LM) | 2.073667e6 | 288 | 72528 | 33 | 2.2900e-17 | true |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 250 | Optim (Newton) | 2.3456875e6 | 2987 | 5099904 | 33 | 0.0000e+00 | true |
| 250 | JSOSolvers (trunk) | 455125.0 | 50 | 26240 | 19 | 1.7113e-19 | true |
| 250 | JSOSolvers (tron) | 730729.5 | 124 | 52096 | 25 | 2.6479e-20 | true |
| 250 | Ipopt | 3.748584e6 | 1475 | 1215040 | 17 | 2.3665e-28 | true |
| 250 | MadNLP | 2.411896e6 | 1202 | 1332752 | 17 | 2.3665e-28 | true |
| 250 | NonlinearSolve (LM) | 6.61274585e7 | 698 | 2017552 | 39 | 9.1612e-19 | true |
| 250 | NonlinearSolve (TrustRegion) | 3.422875e6 | 862 | 1743920 | 21 | 2.7930e-18 | true |
| 500 | NLLSModel + SecondOrderOptimization (Dogleg) | 393625.0 | 0 | 0 | 14 | 0.0000e+00 | true |
| 500 | NLLSModel + SecondOrderOptimization (LM) | 533000.0 | 0 | 0 | 15 | 1.2314e-17 | true |
| 500 | SecondOrderOptimization (Dogleg) | 523250.0 | 455 | 1547360 | 14 | 0.0000e+00 | true |
| 500 | SecondOrderOptimization (LM) | 657229.0 | 547 | 1903984 | 15 | 1.2314e-17 | true |
| 500 | LeastSquaresOptim (Dogleg) | 3.526542e6 | 228 | 105280 | 26 | 2.2908e-29 | true |
| 500 | LeastSquaresOptim (LM) | 4.0854165e6 | 305 | 104368 | 34 | 1.8856e-17 | true |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 500 | Optim (Newton) | 4.0080415e6 | 3605 | 10141632 | 33 | 0.0000e+00 | true |
| 500 | JSOSolvers (trunk) | 897083.5 | 62 | 51392 | 20 | 1.4208e-19 | true |
| 500 | JSOSolvers (tron) | 1.430396e6 | 147 | 100336 | 26 | 2.4639e-21 | true |
| 500 | Ipopt | 5.7835e6 | 1507 | 2379904 | 17 | 1.3824e-21 | true |
| 500 | MadNLP | 4.165542e6 | 1283 | 2612368 | 17 | 1.3824e-21 | true |
| 500 | NonlinearSolve (LM) | 2.02207917e8 | 13460 | 86742320 | 39 | 9.1613e-19 | true |
| 500 | NonlinearSolve (TrustRegion) | 1.49633745e7 | 965 | 5704032 | 25 | 1.1967e-28 | true |
| 1000 | NLLSModel + SecondOrderOptimization (Dogleg) | 733708.5 | 0 | 0 | 13 | 1.4840e-29 | true |
| 1000 | NLLSModel + SecondOrderOptimization (LM) | 1.244104e6 | 0 | 0 | 16 | 6.6270e-22 | true |
| 1000 | SecondOrderOptimization (Dogleg) | 959708.5 | 456 | 3066960 | 13 | 1.4840e-29 | true |
| 1000 | SecondOrderOptimization (LM) | 1.5573745e6 | 617 | 4298960 | 16 | 6.6270e-22 | true |
| 1000 | LeastSquaresOptim (Dogleg) | 7.830417e6 | 244 | 174512 | 29 | 0.0000e+00 | true |
| 1000 | LeastSquaresOptim (LM) | 9.0391255e6 | 345 | 164944 | 41 | 3.5043e-17 | true |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1000 | Optim (Newton) | 7.539146e6 | 3484 | 20197488 | 33 | 0.0000e+00 | true |
| 1000 | JSOSolvers (trunk) | 1.76e6 | 66 | 100608 | 20 | 7.3812e-20 | true |
| 1000 | JSOSolvers (tron) | 3.3494165e6 | 147 | 194608 | 30 | 1.0974e-20 | true |
| 1000 | Ipopt | 9.583354e6 | 1507 | 4707488 | 17 | 1.3824e-21 | true |
| 1000 | MadNLP | 7.295708e6 | 1295 | 5166288 | 17 | 1.3824e-21 | true |
| 1000 | NonlinearSolve (LM) | 7.94959104e8 | 13318 | 166260272 | 39 | 9.1613e-19 | true |
| 1000 | NonlinearSolve (TrustRegion) | 1.2958437e7 | 4744 | 37810688 | 25 | 0.0000e+00 | true |
| 2500 | NLLSModel + SecondOrderOptimization (Dogleg) | 1.670521e6 | 0 | 0 | 12 | 2.7223e-23 | true |
| 2500 | NLLSModel + SecondOrderOptimization (LM) | 2.8386045e6 | 0 | 0 | 15 | 7.4722e-20 | true |
| 2500 | SecondOrderOptimization (Dogleg) | 2.1486875e6 | 447 | 7702592 | 12 | 2.7223e-23 | true |
| 2500 | SecondOrderOptimization (LM) | 3.453583e6 | 591 | 10543536 | 15 | 7.4722e-20 | true |
| 2500 | LeastSquaresOptim (Dogleg) | 2.0465e7 | 236 | 400800 | 27 | 0.0000e+00 | true |
| 2500 | LeastSquaresOptim (LM) | 2.27619585e7 | 313 | 380896 | 36 | 9.6888e-19 | true |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2500 | Optim (Newton) | 1.79520205e7 | 3262 | 53520432 | 33 | 0.0000e+00 | true |
| 2500 | JSOSolvers (trunk) | 4.1465415e6 | 66 | 248064 | 19 | 1.6776e-19 | true |
| 2500 | JSOSolvers (tron) | 1.59142495e7 | 147 | 477440 | 75 | 2.3372e-21 | true |
| 2500 | Ipopt | 2.0802584e7 | 1524 | 12662912 | 17 | 1.3824e-21 | true |
| 2500 | MadNLP | 1.6964854e7 | 1312 | 13867008 | 17 | 1.3824e-21 | true |
| 2500 | NonlinearSolve (LM) | 5.942990375e9 | 755 | 163347728 | 39 | 9.1612e-19 | true |
| 2500 | NonlinearSolve (TrustRegion) | 3.147225e7 | 4787 | 97643568 | 25 | 0.0000e+00 | true |
| 5000 | NLLSModel + SecondOrderOptimization (Dogleg) | 3.562542e6 | 0 | 0 | 11 | 9.5703e-26 | true |
| 5000 | NLLSModel + SecondOrderOptimization (LM) | 7.0603335e6 | 0 | 0 | 21 | 3.5660e-21 | true |
| 5000 | SecondOrderOptimization (Dogleg) | 3.8979165e6 | 423 | 14085648 | 11 | 9.5703e-26 | true |
| 5000 | SecondOrderOptimization (LM) | 8.781854e6 | 687 | 23962224 | 21 | 3.5660e-21 | true |
| 5000 | LeastSquaresOptim (Dogleg) | 4.1118709e7 | 264 | 799904 | 33 | 0.0000e+00 | true |
| 5000 | LeastSquaresOptim (LM) | 4.9222459e7 | 355 | 755008 | 42 | 2.2955e-17 | true |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | Optim (Newton) | 4.46031455e7 | 4240 | 133828944 | 41 | 0.0000e+00 | true |
| 5000 | JSOSolvers (trunk) | 1.0626542e7 | 66 | 592128 | 31 | 1.6921e-19 | true |
| 5000 | JSOSolvers (tron) | 1.80231875e7 | 147 | 1137200 | 32 | 7.5388e-21 | true |
| 5000 | Ipopt | 4.0701833e7 | 1596 | 25755408 | 18 | 0.0000e+00 | true |
| 5000 | MadNLP | 3.4361125e7 | 1354 | 28261472 | 18 | 0.0000e+00 | true |
| 5000 | NonlinearSolve (LM) | 1.7692190875e10 | 13686 | 823888624 | 39 | 9.1613e-19 | true |
| 5000 | NonlinearSolve (TrustRegion) | 7.540625e7 | 5825 | 235776272 | 31 | 0.0000e+00 | true |
| 10000 | NLLSModel + SecondOrderOptimization (Dogleg) | 2.20647042e8 | 0 | 0 | 424 | 3.0945e-26 | true |
| 10000 | NLLSModel + SecondOrderOptimization (LM) | 1.4146021e7 | 0 | 0 | 21 | 3.5662e-21 | true |
| 10000 | SecondOrderOptimization (Dogleg) | 2.64400271e8 | 10339 | 741982656 | 424 | 3.0945e-26 | true |
| 10000 | SecondOrderOptimization (LM) | 1.6986479e7 | 687 | 46236272 | 21 | 3.5662e-21 | true |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | LeastSquaresOptim (LM) | 9.4959667e7 | 359 | 1324368 | 43 | 2.8014e-17 | true |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | Optim (Newton) | 8.7436771e7 | 4195 | 249157248 | 41 | 0.0000e+00 | true |
| 10000 | JSOSolvers (trunk) | 6.9703396e7 | 66 | 985344 | 89 | 3.6923e-19 | true |
| 10000 | JSOSolvers (tron) | 3.5844104e7 | 147 | 1891552 | 32 | 2.4870e-20 | true |
| 10000 | Ipopt | 7.8888312e7 | 1596 | 49309456 | 18 | 0.0000e+00 | true |
| 10000 | MadNLP | 6.7224938e7 | 1354 | 53947536 | 18 | 0.0000e+00 | true |
| 10000 | NonlinearSolve (LM) | 3.0414565458e10 | 6324 | 708581136 | 17 | 2.6682e+00 | false |
| 10000 | NonlinearSolve (TrustRegion) | 1.386545e8 | 4941 | 381489104 | 26 | 2.0443e-29 | true |
| 20000 | NLLSModel + SecondOrderOptimization (Dogleg) | 1.1024437e7 | 0 | 0 | 10 | 1.9933e+00 | true |
| 20000 | NLLSModel + SecondOrderOptimization (LM) | 2.8553604e7 | 0 | 0 | 21 | 3.5665e-21 | true |
| 20000 | SecondOrderOptimization (Dogleg) | 1.4536104e7 | 375 | 46765488 | 10 | 1.9933e+00 | true |
| 20000 | SecondOrderOptimization (LM) | 3.43295e7 | 687 | 91669104 | 21 | 3.5665e-21 | true |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | LeastSquaresOptim (LM) | 1.89158625e8 | 388 | 2601824 | 41 | 1.4274e-17 | true |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | Optim (Newton) | 1.696444995e8 | 4192 | 496838224 | 41 | 0.0000e+00 | true |
| 20000 | JSOSolvers (trunk) | 5.83895458e8 | 70 | 1968448 | 189 | 4.7903e-20 | true |
| 20000 | JSOSolvers (tron) | 6.5159958e7 | 148 | 3776944 | 32 | 4.8231e-20 | true |
| 20000 | Ipopt | 1.68171021e8 | 1596 | 97974032 | 18 | 0.0000e+00 | true |
| 20000 | MadNLP | 1.32985292e8 | 1363 | 107014112 | 18 | 0.0000e+00 | true |
| 20000 | NonlinearSolve (LM) | 3.5502882667e10 | 2294 | 441879344 | 5 | 4.3434e+04 | false |
| 20000 | NonlinearSolve (TrustRegion) | 3.92602167e8 | 5782 | 931792480 | 31 | 0.0000e+00 | true |
| 35000 | NLLSModel + SecondOrderOptimization (Dogleg) | 2.6881166e7 | 0 | 0 | 13 | 1.9933e+00 | true |
| 35000 | NLLSModel + SecondOrderOptimization (LM) | 4.9959083e7 | 0 | 0 | 21 | 3.5671e-21 | true |
| 35000 | SecondOrderOptimization (Dogleg) | 3.34149375e7 | 447 | 99642432 | 13 | 1.9933e+00 | true |
| 35000 | SecondOrderOptimization (LM) | 5.98362085e7 | 687 | 159842928 | 21 | 3.5671e-21 | true |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | Optim (Newton) | 2.85721396e8 | 4236 | 871287056 | 41 | 0.0000e+00 | true |
| 35000 | JSOSolvers (trunk) | 1.216980042e9 | 66 | 3541248 | 215 | 1.4076e-19 | true |
| 35000 | JSOSolvers (tron) | 2.905822505e8 | 148 | 6794160 | 103 | 1.0271e-21 | true |
| 35000 | Ipopt | 2.9491675e8 | 1596 | 170809104 | 18 | 0.0000e+00 | true |
| 35000 | MadNLP | 2.34482167e8 | 1363 | 186835424 | 18 | 0.0000e+00 | true |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | NLLSModel + SecondOrderOptimization (Dogleg) | 2.282025e7 | 0 | 0 | 8 | 0.0000e+00 | true |
| 50000 | NLLSModel + SecondOrderOptimization (LM) | 7.1618125e7 | 0 | 0 | 21 | 3.5677e-21 | true |
| 50000 | SecondOrderOptimization (Dogleg) | 3.06292715e7 | 327 | 98869584 | 8 | 0.0000e+00 | true |
| 50000 | SecondOrderOptimization (LM) | 8.3651416e7 | 687 | 226984560 | 21 | 3.5677e-21 | true |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | Optim (Newton) | 4.93180875e8 | 4180 | 1228948880 | 41 | 0.0000e+00 | true |
| 50000 | JSOSolvers (trunk) | 6.983196045e8 | 66 | 4917504 | 136 | 1.0648e-19 | true |
| 50000 | JSOSolvers (tron) | 3.72472291e8 | 148 | 9434032 | 87 | 1.0197e-21 | true |
| 50000 | Ipopt | 3.99541375e8 | 1596 | 242161424 | 18 | 0.0000e+00 | true |
| 50000 | MadNLP | 3.290535e8 | 1363 | 264661472 | 18 | 0.0000e+00 | true |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | NLLSModel + SecondOrderOptimization (Dogleg) | 7.04931255e7 | 0 | 0 | 16 | 1.9933e+00 | true |
| 75000 | NLLSModel + SecondOrderOptimization (LM) | 1.08672834e8 | 0 | 0 | 21 | 3.5686e-21 | true |
| 75000 | SecondOrderOptimization (Dogleg) | 8.634225e7 | 519 | 249311952 | 16 | 1.9933e+00 | true |
| 75000 | SecondOrderOptimization (LM) | 1.264925e8 | 687 | 349733488 | 21 | 3.5686e-21 | true |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | Optim (Newton) | 6.66831437e8 | 4192 | 1865320016 | 41 | 0.0000e+00 | true |
| 75000 | JSOSolvers (trunk) | 7.314560005e8 | 66 | 7276800 | 134 | 6.8163e-20 | true |
| 75000 | JSOSolvers (tron) | 6.083127915e8 | 148 | 13959088 | 88 | 6.1379e-18 | true |
| 75000 | Ipopt | 6.82228e8 | 1596 | 361109264 | 18 | 0.0000e+00 | true |
| 75000 | MadNLP | 5.317942085e8 | 1363 | 394548704 | 18 | 0.0000e+00 | true |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
