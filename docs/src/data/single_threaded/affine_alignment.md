# Benchmark Results: Dense Affine Alignment

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T03:33:26
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

This problem uses `Standalone` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 1 | SecondOrderOptimization (Dogleg) | 3145.5 | 53 | 8144 | 1 | 3.0815e-32 | true | ok | NaN | grad\_tol |
| 1 | SecondOrderOptimization (LM) | 4250.0 | 58 | 10688 | 2 | 1.1986e-26 | true | ok | NaN | grad\_tol |
| 1 | LeastSquaresOptim (Dogleg) | 11375.0 | 107 | 161952 | 3 | 6.1630e-33 | true | ok | NaN | converged |
| 1 | LeastSquaresOptim (LM) | 18583.0 | 184 | 321904 | 6 | 1.6897e-26 | true | ok | NaN | converged |
| 1 | Optim (NewtonTrustRegion) | 6041.5 | 78 | 9136 | 1 | 3.0815e-32 | true | ok | NaN | converged |
| 1 | Optim (Newton) | 5542.0 | 67 | 8464 | 1 | 3.0815e-32 | true | ok | NaN | converged |
| 1 | JSOSolvers (trunk) | 9104.0 | 109 | 19264 | 4 | 1.2326e-32 | true | ok | NaN | first\_order |
| 1 | JSOSolvers (tron) | 11292.0 | 153 | 16288 | 2 | 2.4652e-32 | true | ok | NaN | first\_order |
| 1 | Ipopt | 367145.5 | 144 | 11712 | 1 | 3.0815e-32 | true | ok | NaN | first\_order |
| 1 | MadNLP | 225333.5 | 562 | 50640 | 1 | 3.0815e-32 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1 | NonlinearSolve (LM) | 32770.5 | 300 | 40544 | 7 | 4.7548e-21 | true | ok | NaN | Success |
| 1 | NonlinearSolve (TrustRegion) | 13770.5 | 113 | 163632 | 3 | 3.0815e-32 | true | ok | NaN | Success |
| 1 | CaNNOLeS | 11500.0 | 186 | 16624 | 1 | 3.0815e-32 | true | ok | NaN | first\_order |
| 2 | SecondOrderOptimization (Dogleg) | 13458.5 | 89 | 36832 | 5 | 4.8074e-28 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM) | 13604.5 | 85 | 36592 | 5 | 4.6020e-28 | true | ok | NaN | grad\_tol |
| 2 | LeastSquaresOptim (Dogleg) | 26291.5 | 188 | 345728 | 6 | 1.3066e-30 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 40625.0 | 265 | 516992 | 9 | 2.0141e-26 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 49458.0 | 273 | 60992 | 5 | 1.8442e-28 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 26000.0 | 151 | 39792 | 5 | 4.8900e-28 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 42667.0 | 159 | 60992 | 9 | 3.5039e-21 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 84083.0 | 194 | 48272 | 6 | 2.3227e-17 | true | ok | NaN | first\_order |
| 2 | Ipopt | 613917.0 | 304 | 44608 | 5 | 4.5875e-28 | true | ok | NaN | first\_order |
| 2 | MadNLP | 295958.5 | 602 | 81536 | 5 | 4.4364e-28 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 84729.0 | 376 | 104080 | 11 | 1.1056e-19 | true | ok | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 36875.0 | 203 | 355120 | 6 | 1.1532e-22 | true | ok | NaN | Success |
| 2 | CaNNOLeS | 40792.0 | 226 | 64096 | 5 | 4.4295e-28 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 40958.5 | 117 | 100432 | 8 | 4.0949e-21 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM) | 41958.0 | 113 | 100096 | 8 | 4.0881e-21 | true | ok | NaN | grad\_tol |
| 3 | LeastSquaresOptim (Dogleg) | 93583.5 | 279 | 574832 | 9 | 1.5346e-30 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 98770.5 | 303 | 639040 | 10 | 1.4701e-24 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 164896.0 | 389 | 188960 | 8 | 2.9832e-20 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 61250.0 | 214 | 106304 | 8 | 4.0949e-21 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 119729.0 | 190 | 134336 | 12 | 1.9175e-19 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 172521.0 | 245 | 129408 | 11 | 4.9719e-18 | true | ok | NaN | first\_order |
| 3 | Ipopt | 849479.5 | 424 | 103168 | 8 | 4.0949e-21 | true | ok | NaN | first\_order |
| 3 | MadNLP | 411750.0 | 632 | 145008 | 8 | 4.0949e-21 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 257770.5 | 487 | 281024 | 19 | 1.5514e-21 | true | ok | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 96625.5 | 312 | 617744 | 9 | 1.5772e-25 | true | ok | NaN | Success |
| 3 | CaNNOLeS | 176291.5 | 273 | 186160 | 8 | 4.0949e-21 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 188458.5 | 273 | 326304 | 18 | 7.7407e-20 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM) | 163896.0 | 231 | 273232 | 14 | 2.6685e-19 | true | ok | NaN | grad\_tol |
| 4 | LeastSquaresOptim (Dogleg) | 348958.0 | 537 | 1146608 | 22 | 8.2584e-30 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 518354.0 | 663 | 1572576 | 23 | 1.8795e-27 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 496249.5 | 828 | 609136 | 10 | 7.5510e-20 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 230604.5 | 532 | 327392 | 19 | 3.9824e-23 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 264125.0 | 474 | 202592 | 11 | 8.8233e-17 | false | not_converged | NaN | not\_desc |
| 4 | JSOSolvers (tron) | 527521.0 | 413 | 361840 | 23 | 5.5807e-17 | true | ok | NaN | first\_order |
| 4 | Ipopt | 1.8093755e6 | 871 | 276304 | 15 | 1.1586e-21 | true | ok | NaN | first\_order |
| 4 | MadNLP | 783687.5 | 761 | 322992 | 15 | 1.1585e-21 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 1.1897417e7 | 8360 | 7748032 | 500 | 1.0115e+00 | false | not_converged | NaN | MaxIters |
| 4 | NonlinearSolve (TrustRegion) | 383458.0 | 264 | 204096 | 17 | 4.3219e-27 | true | ok | NaN | Success |
| 4 | CaNNOLeS | 799875.0 | 359 | 460912 | 13 | 8.9437e-29 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 316458.0 | 144 | 342928 | 7 | 2.1842e-29 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM) | 315479.0 | 140 | 342112 | 7 | 3.0913e-29 | true | ok | NaN | grad\_tol |
| 6 | LeastSquaresOptim (Dogleg) | 878770.5 | 283 | 790608 | 8 | 1.3337e-29 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 1.263333e6 | 343 | 989952 | 10 | 1.4854e-24 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 1.7691455e6 | 635 | 1312480 | 9 | 1.9574e-29 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 365437.5 | 227 | 274272 | 7 | 1.9081e-29 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 920625.0 | 523 | 437520 | 13 | 7.2811e-17 | false | not_converged | NaN | not\_desc |
| 6 | JSOSolvers (tron) | 871791.5 | 264 | 310096 | 9 | 6.7945e-19 | true | ok | NaN | first\_order |
| 6 | Ipopt | 1.213646e6 | 416 | 245440 | 7 | 1.7478e-29 | true | ok | NaN | first\_order |
| 6 | MadNLP | 772500.5 | 678 | 413456 | 7 | 1.2449e-29 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 1.567521e6 | 473 | 1008160 | 14 | 3.2724e-19 | true | ok | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 1.028458e6 | 215 | 305088 | 8 | 1.2899e-19 | true | ok | NaN | Success |
| 6 | CaNNOLeS | 2.610479e6 | 303 | 1440400 | 7 | 2.1373e-29 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 986062.5 | 153 | 672096 | 6 | 6.6550e-26 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM) | 935458.5 | 149 | 670768 | 6 | 6.9767e-26 | true | ok | NaN | grad\_tol |
| 8 | LeastSquaresOptim (Dogleg) | 2.756104e6 | 275 | 982384 | 7 | 3.7175e-29 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 4.4495415e6 | 341 | 1266416 | 9 | 6.0108e-22 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 3.7375625e6 | 447 | 2168160 | 7 | 3.8950e-29 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 982646.0 | 223 | 433760 | 6 | 6.7361e-26 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 2.6885205e6 | 287 | 614512 | 12 | 3.4005e-17 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 3.699583e6 | 301 | 487424 | 9 | 4.6727e-17 | true | ok | NaN | first\_order |
| 8 | Ipopt | 2.0008755e6 | 393 | 333392 | 6 | 6.5895e-26 | true | ok | NaN | first\_order |
| 8 | MadNLP | 1.597542e6 | 685 | 769744 | 6 | 6.6360e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 4.1177915e6 | 495 | 1926272 | 12 | 1.8616e-20 | true | ok | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 3.3797505e6 | 224 | 594080 | 8 | 4.2383e-17 | true | ok | NaN | Success |
| 8 | CaNNOLeS | 9.67625e6 | 332 | 3512320 | 6 | 6.6806e-26 | true | ok | NaN | first\_order |
| 12 | SecondOrderOptimization (Dogleg) | 6.1118955e6 | 202 | 2196768 | 6 | 1.9899e-28 | true | ok | NaN | grad\_tol |
| 12 | SecondOrderOptimization (LM) | 6.0885415e6 | 198 | 2193968 | 6 | 2.2266e-28 | true | ok | NaN | grad\_tol |
| 12 | LeastSquaresOptim (Dogleg) | 2.34898125e7 | 331 | 2142320 | 7 | 2.1289e-28 | true | ok | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 4.04433125e7 | 456 | 2936128 | 10 | 5.6439e-24 | true | ok | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 2.6317083e7 | 802 | 15060768 | 9 | 6.1614e-24 | true | ok | NaN | converged |
| 12 | Optim (Newton) | 6.1347915e6 | 272 | 1089056 | 6 | 1.6004e-28 | true | ok | NaN | converged |
| 12 | JSOSolvers (trunk) | 1.7173083e7 | 697 | 1510592 | 14 | 7.3466e-17 | false | not_converged | NaN | not\_desc |
| 12 | JSOSolvers (tron) | 1.72554375e7 | 371 | 1027872 | 9 | 1.2153e-17 | true | ok | NaN | first\_order |
| 12 | Ipopt | 8.7264165e6 | 442 | 690992 | 6 | 1.8094e-28 | true | ok | NaN | first\_order |
| 12 | MadNLP | 7.8820835e6 | 734 | 2435008 | 6 | 1.7197e-28 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 2.67351045e7 | 587 | 6092016 | 14 | 4.1740e-18 | true | ok | NaN | Success |
| 12 | NonlinearSolve (TrustRegion) | 3.3098896e7 | 251 | 2131744 | 7 | 7.6110e-19 | true | ok | NaN | Success |
| 12 | CaNNOLeS | 7.41807085e7 | 386 | 15218128 | 6 | 1.7020e-28 | true | ok | NaN | first\_order |
| 16 | SecondOrderOptimization (Dogleg) | 2.90119585e7 | 311 | 6015856 | 7 | 4.8515e-28 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | SecondOrderOptimization (LM) | 2.8408875e7 | 305 | 6010592 | 7 | 6.1689e-28 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | LeastSquaresOptim (Dogleg) | 1.263084375e8 | 484 | 4734656 | 10 | 6.6619e-28 | true | ok | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 2.01201458e8 | 688 | 6571840 | 12 | 2.3284e-21 | true | ok | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 1.4898075e8 | 1780 | 91270464 | 14 | 6.0911e-20 | true | ok | NaN | converged |
| 16 | Optim (Newton) | 2.87439375e7 | 395 | 2583936 | 7 | 6.0782e-28 | true | ok | NaN | converged |
| 16 | JSOSolvers (trunk) | 9.7900792e7 | 769 | 3427024 | 19 | 7.0921e-17 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (tron) | 1.01391979e8 | 592 | 2282496 | 12 | 1.2439e-17 | true | ok | NaN | first\_order |
| 16 | Ipopt | 3.77973125e7 | 581 | 1361840 | 7 | 5.7469e-28 | true | ok | NaN | first\_order |
| 16 | MadNLP | 3.4772583e7 | 857 | 6550720 | 7 | 5.5062e-28 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 1.19144667e8 | 769 | 15657104 | 15 | 2.7023e-18 | true | ok | NaN | Success |
| 16 | NonlinearSolve (TrustRegion) | 4.36972792e8 | 480 | 6732128 | 17 | 6.2175e-20 | true | ok | NaN | Success |
| 16 | CaNNOLeS | 3.63749875e8 | 464 | 49574736 | 6 | 4.2658e-16 | true | ok | NaN | first\_order |
| 20 | SecondOrderOptimization (Dogleg) | 8.2997354e7 | 362 | 14043904 | 6 | 2.1717e-27 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (LM) | 8.0968542e7 | 356 | 12906096 | 6 | 2.6691e-27 | true | ok | NaN | grad\_tol |
| 20 | LeastSquaresOptim (Dogleg) | 3.1071925e8 | 503 | 8480496 | 7 | 6.8355e-28 | true | ok | NaN | converged |
| 20 | LeastSquaresOptim (LM) | 6.032826665e8 | 765 | 11615536 | 11 | 3.7237e-26 | true | ok | NaN | converged |
| 20 | Optim (NewtonTrustRegion) | 2.714291455e8 | 1107 | 101340208 | 9 | 3.6931e-22 | true | ok | NaN | converged |
| 20 | Optim (Newton) | 8.3634583e7 | 434 | 4675488 | 6 | 2.4072e-27 | true | ok | NaN | converged |
| 20 | JSOSolvers (trunk) | 2.18642208e8 | 1083 | 4221728 | 15 | 8.1386e-17 | false | not_converged | NaN | not\_desc |
| 20 | JSOSolvers (tron) | 2.52586833e8 | 656 | 2973040 | 10 | 4.6362e-17 | true | ok | NaN | first\_order |
| 20 | Ipopt | 1.001994165e8 | 601 | 1811520 | 6 | 2.2830e-27 | true | ok | NaN | first\_order |
| 20 | MadNLP | 9.4794583e7 | 907 | 13444416 | 6 | 2.1986e-27 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 20 | NonlinearSolve (LM) | 3.26801396e8 | 812 | 32498688 | 13 | 7.3376e-19 | true | ok | NaN | Success |
| 20 | NonlinearSolve (TrustRegion) | 6.26557687e8 | 358 | 13461136 | 7 | 4.0762e-19 | true | ok | NaN | Success |
| 20 | CaNNOLeS | 1.434623333e9 | 548 | 124884304 | 6 | 2.4991e-27 | true | ok | NaN | first\_order |
| 24 | SecondOrderOptimization (Dogleg) | 2.102830835e8 | 467 | 39685504 | 6 | 4.3478e-22 | true | ok | NaN | grad\_tol |
| 24 | SecondOrderOptimization (LM) | 2.0965025e8 | 461 | 35202288 | 6 | 4.4061e-22 | true | ok | NaN | grad\_tol |
| 24 | LeastSquaresOptim (Dogleg) | 8.37816771e8 | 608 | 15316560 | 7 | 1.7300e-27 | true | ok | NaN | converged |
| 24 | LeastSquaresOptim (LM) | 1.610229875e9 | 930 | 22167312 | 11 | 8.6559e-26 | true | ok | NaN | converged |
| 24 | Optim (NewtonTrustRegion) | 8.13975e8 | 1504 | 331921648 | 10 | 7.3913e-20 | true | ok | NaN | converged |
| 24 | Optim (Newton) | 2.09134458e8 | 539 | 8360512 | 6 | 4.3499e-22 | true | ok | NaN | converged |
| 24 | JSOSolvers (trunk) | 4.98225041e8 | 1386 | 6364496 | 16 | 9.1900e-17 | false | not_converged | NaN | not\_desc |
| 24 | JSOSolvers (tron) | 5.137013125e8 | 759 | 3867760 | 9 | 4.3392e-18 | true | ok | NaN | first\_order |
| 24 | Ipopt | 2.4306e8 | 706 | 2574528 | 6 | 4.3478e-22 | true | ok | NaN | first\_order |
| 24 | MadNLP | 2.32606667e8 | 1024 | 26163872 | 6 | 4.3506e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 24 | NonlinearSolve (LM) | 9.75654896e8 | 1023 | 63075760 | 14 | 1.1490e-17 | true | ok | NaN | Success |
| 24 | NonlinearSolve (TrustRegion) | 1.822137958e9 | 421 | 26778864 | 10 | 3.1526e-18 | true | ok | NaN | Success |
| 24 | CaNNOLeS | 1.4795006125e10 | 653 | 263545808 | 6 | 3.3894e-21 | true | ok | NaN | first\_order |
| 28 | SecondOrderOptimization (Dogleg) | 5.047326255e8 | 593 | 56920192 | 6 | 6.4252e-20 | true | ok | NaN | grad\_tol |
| 28 | SecondOrderOptimization (LM) | 5.517721875e8 | 587 | 56905712 | 6 | 6.4928e-20 | true | ok | NaN | grad\_tol |
| 28 | LeastSquaresOptim (Dogleg) | 1.958466375e9 | 734 | 26100160 | 7 | 2.6663e-27 | true | ok | NaN | converged |
| 28 | LeastSquaresOptim (LM) | 3.755866084e9 | 1128 | 41201344 | 11 | 2.2506e-21 | true | ok | NaN | converged |
| 28 | Optim (NewtonTrustRegion) | 1.832344083e9 | 1702 | 489463792 | 10 | 1.5929e-21 | true | ok | NaN | converged |
| 28 | Optim (Newton) | 4.9670425e8 | 665 | 14074784 | 6 | 6.4248e-20 | true | ok | NaN | converged |
| 28 | JSOSolvers (trunk) | 1.123023083e9 | 1590 | 9621920 | 18 | 4.9691e-17 | true | ok | NaN | first\_order |
| 28 | JSOSolvers (tron) | 1.101897042e9 | 939 | 5265280 | 9 | 1.9849e-18 | true | ok | NaN | first\_order |
| 28 | Ipopt | 5.668279785e8 | 832 | 3496896 | 6 | 6.4252e-20 | true | ok | NaN | first\_order |
| 28 | MadNLP | 5.507077495e8 | 1150 | 51372592 | 6 | 6.4250e-20 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 28 | NonlinearSolve (LM) | 2.156429334e9 | 1203 | 124466096 | 14 | 5.0699e-18 | true | ok | NaN | Success |
| 28 | NonlinearSolve (TrustRegion) | 4.465510083e9 | 493 | 48449776 | 10 | 3.6013e-17 | true | ok | NaN | Success |
| 28 | CaNNOLeS | 3.0951295583e10 | 700 | 463260096 | 5 | 1.6868e-08 | false | timeout | NaN | max\_time |
| 32 | SecondOrderOptimization (Dogleg) | 1.030513458e9 | 733 | 74845824 | 6 | 4.4334e-27 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 1.03383925e9 | 727 | 74825200 | 6 | 4.7367e-27 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 4.514182125e9 | 874 | 56385696 | 7 | 3.1831e-27 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 8.2196715e9 | 1348 | 71036448 | 11 | 4.0982e-22 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 4.0385095e9 | 2116 | 924300368 | 11 | 3.5175e-27 | true | ok | NaN | converged |
| 32 | Optim (Newton) | 1.036502e9 | 805 | 22386208 | 6 | 4.2413e-27 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 2.357707041e9 | 1967 | 12334400 | 18 | 7.9618e-17 | true | ok | NaN | first\_order |
| 32 | JSOSolvers (tron) | 2.501806583e9 | 1239 | 7380336 | 10 | 1.0315e-18 | true | ok | NaN | first\_order |
| 32 | Ipopt | 1.17065475e9 | 972 | 4490688 | 6 | 4.7888e-27 | true | ok | NaN | first\_order |
| 32 | MadNLP | 1.12878325e9 | 1290 | 85355344 | 6 | 4.1896e-27 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 5.7082535e9 | 1550 | 185959088 | 17 | 2.1982e-21 | true | ok | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 9.900004125e9 | 570 | 81223312 | 7 | 1.2469e-17 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 4.3044489958e10 | 622 | 816822176 | 3 | 3.4751e+00 | false | timeout | NaN | max\_time |
