# Benchmark Results: Dense Affine Alignment

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T02:16:43
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 2c10368
- **Dependency Commits**: OptimizationVariableInterface f130043, SecondOrderOptimization 377b96e, NLLSModel 78a4ef5

---

## Model Evaluation Scaling

This problem uses `Standalone` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 1 | SecondOrderOptimization (Dogleg) | 3084.0 | 53 | 8144 | 1 | 3.0815e-32 | true | ok | NaN | grad\_tol |
| 1 | SecondOrderOptimization (LM) | 3875.0 | 58 | 10688 | 2 | 1.1986e-26 | true | ok | NaN | grad\_tol |
| 1 | SecondOrderOptimization (Gauss-Newton) | 2791.5 | 42 | 7584 | 1 | 3.0815e-32 | true | ok | NaN | grad\_tol |
| 1 | LeastSquaresOptim (Dogleg) | 5834.0 | 107 | 161952 | 3 | 6.1630e-33 | true | ok | NaN | converged |
| 1 | LeastSquaresOptim (LM) | 10291.5 | 184 | 321904 | 6 | 1.6897e-26 | true | ok | NaN | converged |
| 1 | Optim (NewtonTrustRegion) | 5917.0 | 78 | 9136 | 1 | 3.0815e-32 | true | ok | NaN | converged |
| 1 | Optim (Newton) | 5458.0 | 67 | 8464 | 1 | 3.0815e-32 | true | ok | NaN | converged |
| 1 | JSOSolvers (trunk) | 8666.5 | 109 | 19264 | 4 | 1.2326e-32 | true | ok | NaN | first\_order |
| 1 | JSOSolvers (tron) | 10937.5 | 153 | 16288 | 2 | 2.4652e-32 | true | ok | NaN | first\_order |
| 1 | Ipopt | 337812.5 | 151 | 12144 | 1 | 3.0815e-32 | true | ok | NaN | first\_order |
| 1 | MadNLP | 202000.0 | 562 | 50640 | 1 | 3.0815e-32 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1 | NonlinearSolve (LM) | 31958.5 | 300 | 40544 | 7 | 4.7548e-21 | true | ok | NaN | Success |
| 1 | NonlinearSolve (TrustRegion) | 9729.0 | 113 | 163632 | 3 | 3.0815e-32 | true | ok | NaN | Success |
| 1 | CaNNOLeS | 10812.5 | 186 | 16624 | 1 | 3.0815e-32 | true | ok | NaN | first\_order |
| 2 | SecondOrderOptimization (Dogleg) | 11062.5 | 89 | 36832 | 5 | 4.8074e-28 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (LM) | 12854.0 | 85 | 36592 | 5 | 4.6020e-28 | true | ok | NaN | grad\_tol |
| 2 | SecondOrderOptimization (Gauss-Newton) | 11812.5 | 78 | 35632 | 5 | 4.8074e-28 | true | ok | NaN | grad\_tol |
| 2 | LeastSquaresOptim (Dogleg) | 24646.0 | 188 | 345728 | 6 | 1.3066e-30 | true | ok | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 35228.5 | 265 | 516992 | 9 | 2.0141e-26 | true | ok | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 43688.0 | 273 | 60992 | 5 | 1.8442e-28 | true | ok | NaN | converged |
| 2 | Optim (Newton) | 21375.0 | 151 | 39792 | 5 | 4.8900e-28 | true | ok | NaN | converged |
| 2 | JSOSolvers (trunk) | 36333.0 | 159 | 60992 | 9 | 3.5039e-21 | true | ok | NaN | first\_order |
| 2 | JSOSolvers (tron) | 77896.0 | 194 | 48272 | 6 | 2.3227e-17 | true | ok | NaN | first\_order |
| 2 | Ipopt | 598354.5 | 311 | 45136 | 5 | 4.5875e-28 | true | ok | NaN | first\_order |
| 2 | MadNLP | 289645.5 | 602 | 81536 | 5 | 4.4364e-28 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 75937.5 | 376 | 104080 | 11 | 1.1056e-19 | true | ok | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 26770.5 | 203 | 355120 | 6 | 1.1532e-22 | true | ok | NaN | Success |
| 2 | CaNNOLeS | 42146.0 | 226 | 64096 | 5 | 4.4295e-28 | true | ok | NaN | first\_order |
| 3 | SecondOrderOptimization (Dogleg) | 38125.0 | 117 | 100432 | 8 | 4.0949e-21 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (LM) | 37666.5 | 113 | 100096 | 8 | 4.0881e-21 | true | ok | NaN | grad\_tol |
| 3 | SecondOrderOptimization (Gauss-Newton) | 39646.0 | 106 | 97264 | 8 | 4.0949e-21 | true | ok | NaN | grad\_tol |
| 3 | LeastSquaresOptim (Dogleg) | 83749.5 | 279 | 574832 | 9 | 1.5346e-30 | true | ok | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 99083.5 | 303 | 639040 | 10 | 1.4701e-24 | true | ok | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 158833.5 | 389 | 188960 | 8 | 2.9832e-20 | true | ok | NaN | converged |
| 3 | Optim (Newton) | 56958.5 | 214 | 106304 | 8 | 4.0949e-21 | true | ok | NaN | converged |
| 3 | JSOSolvers (trunk) | 106459.0 | 190 | 134336 | 12 | 1.9175e-19 | true | ok | NaN | first\_order |
| 3 | JSOSolvers (tron) | 161458.5 | 245 | 129408 | 11 | 4.9719e-18 | true | ok | NaN | first\_order |
| 3 | Ipopt | 810354.0 | 431 | 103840 | 8 | 4.0949e-21 | true | ok | NaN | first\_order |
| 3 | MadNLP | 362541.5 | 632 | 145008 | 8 | 4.0949e-21 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 236708.5 | 487 | 281024 | 19 | 1.5514e-21 | true | ok | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 84146.0 | 312 | 617744 | 9 | 1.5772e-25 | true | ok | NaN | Success |
| 3 | CaNNOLeS | 176188.0 | 273 | 186160 | 8 | 4.0949e-21 | true | ok | NaN | first\_order |
| 4 | SecondOrderOptimization (Dogleg) | 189187.5 | 273 | 326304 | 18 | 7.7407e-20 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (LM) | 168896.0 | 231 | 273232 | 14 | 2.6685e-19 | true | ok | NaN | grad\_tol |
| 4 | SecondOrderOptimization (Gauss-Newton) | 122083.5 | 183 | 219568 | 13 | 8.8895e-29 | true | ok | NaN | grad\_tol |
| 4 | LeastSquaresOptim (Dogleg) | 337979.5 | 537 | 1146608 | 22 | 8.2584e-30 | true | ok | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 494083.5 | 663 | 1572576 | 23 | 1.8795e-27 | true | ok | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 495521.0 | 828 | 609136 | 10 | 7.5510e-20 | true | ok | NaN | converged |
| 4 | Optim (Newton) | 227354.0 | 532 | 327392 | 19 | 3.9824e-23 | true | ok | NaN | converged |
| 4 | JSOSolvers (trunk) | 277375.0 | 474 | 202592 | 11 | 8.8233e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 4 | JSOSolvers (tron) | 520917.0 | 413 | 361840 | 23 | 5.5807e-17 | true | ok | NaN | first\_order |
| 4 | Ipopt | 1.785083e6 | 878 | 277168 | 15 | 1.1586e-21 | true | ok | NaN | first\_order |
| 4 | MadNLP | 798521.0 | 761 | 322992 | 15 | 1.1585e-21 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 1.2024416e7 | 8360 | 7748032 | 500 | 1.0115e+00 | false | not_converged | NaN | MaxIters |
| 4 | NonlinearSolve (TrustRegion) | 386104.0 | 264 | 204096 | 17 | 4.3219e-27 | true | ok | NaN | Success |
| 4 | CaNNOLeS | 791875.0 | 359 | 460912 | 13 | 8.9437e-29 | true | ok | NaN | first\_order |
| 6 | SecondOrderOptimization (Dogleg) | 313104.0 | 144 | 342928 | 7 | 2.1842e-29 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (LM) | 312896.0 | 140 | 342112 | 7 | 3.0913e-29 | true | ok | NaN | grad\_tol |
| 6 | SecondOrderOptimization (Gauss-Newton) | 317646.0 | 131 | 312800 | 7 | 2.1842e-29 | true | ok | NaN | grad\_tol |
| 6 | LeastSquaresOptim (Dogleg) | 863625.0 | 283 | 790608 | 8 | 1.3337e-29 | true | ok | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 1.228312e6 | 343 | 990032 | 10 | 1.4854e-24 | true | ok | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 1.7234375e6 | 635 | 1312480 | 9 | 1.9574e-29 | true | ok | NaN | converged |
| 6 | Optim (Newton) | 375000.0 | 227 | 274272 | 7 | 1.9081e-29 | true | ok | NaN | converged |
| 6 | JSOSolvers (trunk) | 939375.0 | 523 | 437520 | 13 | 7.2811e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 6 | JSOSolvers (tron) | 903417.0 | 264 | 310096 | 9 | 6.7945e-19 | true | ok | NaN | first\_order |
| 6 | Ipopt | 1.2188955e6 | 423 | 246832 | 7 | 1.7478e-29 | true | ok | NaN | first\_order |
| 6 | MadNLP | 756208.5 | 678 | 413456 | 7 | 1.2449e-29 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 1.5107915e6 | 473 | 1008160 | 14 | 3.2724e-19 | true | ok | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 1.011021e6 | 215 | 305088 | 8 | 1.2899e-19 | true | ok | NaN | Success |
| 6 | CaNNOLeS | 2.537438e6 | 303 | 1440400 | 7 | 2.1373e-29 | true | ok | NaN | first\_order |
| 8 | SecondOrderOptimization (Dogleg) | 945875.0 | 153 | 672096 | 6 | 6.6550e-26 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (LM) | 944917.0 | 149 | 670768 | 6 | 6.9767e-26 | true | ok | NaN | grad\_tol |
| 8 | SecondOrderOptimization (Gauss-Newton) | 920062.5 | 140 | 571568 | 6 | 6.6550e-26 | true | ok | NaN | grad\_tol |
| 8 | LeastSquaresOptim (Dogleg) | 2.7443965e6 | 275 | 982384 | 7 | 3.7175e-29 | true | ok | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 4.428854e6 | 341 | 1266416 | 9 | 6.0108e-22 | true | ok | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 3.7001045e6 | 447 | 2168160 | 7 | 3.8950e-29 | true | ok | NaN | converged |
| 8 | Optim (Newton) | 979250.0 | 223 | 433760 | 6 | 6.7361e-26 | true | ok | NaN | converged |
| 8 | JSOSolvers (trunk) | 2.6947915e6 | 287 | 614512 | 12 | 3.4005e-17 | true | ok | NaN | first\_order |
| 8 | JSOSolvers (tron) | 3.7627085e6 | 301 | 487424 | 9 | 4.6727e-17 | true | ok | NaN | first\_order |
| 8 | Ipopt | 2.018e6 | 400 | 335552 | 6 | 6.5895e-26 | true | ok | NaN | first\_order |
| 8 | MadNLP | 1.4996255e6 | 685 | 769744 | 6 | 6.6360e-26 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 4.018854e6 | 495 | 1926272 | 12 | 1.8616e-20 | true | ok | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 3.3811665e6 | 224 | 594080 | 8 | 4.2383e-17 | true | ok | NaN | Success |
| 8 | CaNNOLeS | 9.2295415e6 | 332 | 3512320 | 6 | 6.6806e-26 | true | ok | NaN | first\_order |
| 12 | SecondOrderOptimization (Dogleg) | 6.090958e6 | 202 | 2196768 | 6 | 1.9899e-28 | true | ok | NaN | grad\_tol |
| 12 | SecondOrderOptimization (LM) | 6.071417e6 | 198 | 2193968 | 6 | 2.2266e-28 | true | ok | NaN | grad\_tol |
| 12 | SecondOrderOptimization (Gauss-Newton) | 6.040333e6 | 189 | 1799120 | 6 | 1.9899e-28 | true | ok | NaN | grad\_tol |
| 12 | LeastSquaresOptim (Dogleg) | 2.3248458e7 | 331 | 2142320 | 7 | 2.1289e-28 | true | ok | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 4.0407208e7 | 456 | 2936128 | 10 | 5.6439e-24 | true | ok | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 2.5317416e7 | 802 | 15060768 | 9 | 6.1614e-24 | true | ok | NaN | converged |
| 12 | Optim (Newton) | 6.2048745e6 | 272 | 1089056 | 6 | 1.6004e-28 | true | ok | NaN | converged |
| 12 | JSOSolvers (trunk) | 1.7462542e7 | 697 | 1510592 | 14 | 7.3466e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 12 | JSOSolvers (tron) | 1.71729795e7 | 371 | 1027872 | 9 | 1.2153e-17 | true | ok | NaN | first\_order |
| 12 | Ipopt | 8.6461875e6 | 449 | 695360 | 6 | 1.8094e-28 | true | ok | NaN | first\_order |
| 12 | MadNLP | 7.6156045e6 | 734 | 2435008 | 6 | 1.7197e-28 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 2.6652e7 | 587 | 6092016 | 14 | 4.1740e-18 | true | ok | NaN | Success |
| 12 | NonlinearSolve (TrustRegion) | 3.29418125e7 | 251 | 2131744 | 7 | 7.6110e-19 | true | ok | NaN | Success |
| 12 | CaNNOLeS | 7.4140979e7 | 386 | 15218128 | 6 | 1.7020e-28 | true | ok | NaN | first\_order |
| 16 | SecondOrderOptimization (Dogleg) | 2.8963458e7 | 311 | 7392112 | 7 | 4.8515e-28 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | SecondOrderOptimization (LM) | 2.8873542e7 | 305 | 6010592 | 7 | 6.1689e-28 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | SecondOrderOptimization (Gauss-Newton) | 2.8633625e7 | 295 | 4795312 | 7 | 4.8515e-28 | true | ok | NaN | abs\_dcost, step\_size |
| 16 | LeastSquaresOptim (Dogleg) | 1.25566875e8 | 484 | 6110912 | 10 | 6.6619e-28 | true | ok | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 2.00318417e8 | 688 | 7341888 | 12 | 2.3284e-21 | true | ok | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 1.461657295e8 | 1780 | 91270464 | 14 | 6.0911e-20 | true | ok | NaN | converged |
| 16 | Optim (Newton) | 2.91273335e7 | 395 | 2583936 | 7 | 6.0782e-28 | true | ok | NaN | converged |
| 16 | JSOSolvers (trunk) | 9.85295e7 | 769 | 3427024 | 19 | 7.0921e-17 | true | ok | NaN | first\_order |
| 16 | JSOSolvers (tron) | 1.01406521e8 | 592 | 2282496 | 12 | 1.2439e-17 | true | ok | NaN | first\_order |
| 16 | Ipopt | 3.6927166e7 | 591 | 1369904 | 7 | 5.7469e-28 | true | ok | NaN | first\_order |
| 16 | MadNLP | 3.4120709e7 | 857 | 6550720 | 7 | 5.5062e-28 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 1.15908917e8 | 769 | 17967248 | 15 | 2.7023e-18 | true | ok | NaN | Success |
| 16 | NonlinearSolve (TrustRegion) | 4.32583875e8 | 480 | 6732128 | 17 | 6.2175e-20 | true | ok | NaN | Success |
| 16 | CaNNOLeS | 3.56008958e8 | 464 | 54522704 | 6 | 4.2658e-16 | true | ok | NaN | first\_order |
| 20 | SecondOrderOptimization (Dogleg) | 7.9995167e7 | 362 | 14043904 | 6 | 2.1717e-27 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (LM) | 7.9875625e7 | 356 | 14036592 | 6 | 2.6691e-27 | true | ok | NaN | grad\_tol |
| 20 | SecondOrderOptimization (Gauss-Newton) | 7.999925e7 | 346 | 10051392 | 6 | 2.1717e-27 | true | ok | NaN | grad\_tol |
| 20 | LeastSquaresOptim (Dogleg) | 3.06399479e8 | 503 | 8480496 | 7 | 6.8355e-28 | true | ok | NaN | converged |
| 20 | LeastSquaresOptim (LM) | 5.84231521e8 | 765 | 11615536 | 11 | 3.7237e-26 | true | ok | NaN | converged |
| 20 | Optim (NewtonTrustRegion) | 2.624222505e8 | 1107 | 101340208 | 9 | 3.6931e-22 | true | ok | NaN | converged |
| 20 | Optim (Newton) | 7.9917125e7 | 434 | 4675488 | 6 | 2.4072e-27 | true | ok | NaN | converged |
| 20 | JSOSolvers (trunk) | 2.01888792e8 | 1083 | 4221728 | 15 | 8.1386e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 20 | JSOSolvers (tron) | 2.4390425e8 | 656 | 2973040 | 10 | 4.6362e-17 | true | ok | NaN | first\_order |
| 20 | Ipopt | 9.5515541e7 | 611 | 1822656 | 6 | 2.2830e-27 | true | ok | NaN | first\_order |
| 20 | MadNLP | 9.0469417e7 | 907 | 13444416 | 6 | 2.1986e-27 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 20 | NonlinearSolve (LM) | 3.1787175e8 | 812 | 34628608 | 13 | 7.3376e-19 | true | ok | NaN | Success |
| 20 | NonlinearSolve (TrustRegion) | 6.117096665e8 | 358 | 13461136 | 7 | 4.0762e-19 | true | ok | NaN | Success |
| 20 | CaNNOLeS | 1.409932334e9 | 548 | 122934608 | 6 | 2.4991e-27 | true | ok | NaN | first\_order |
| 24 | SecondOrderOptimization (Dogleg) | 2.10160708e8 | 467 | 36113792 | 6 | 4.3478e-22 | true | ok | NaN | grad\_tol |
| 24 | SecondOrderOptimization (LM) | 2.10980416e8 | 461 | 32498928 | 6 | 4.4061e-22 | true | ok | NaN | grad\_tol |
| 24 | SecondOrderOptimization (Gauss-Newton) | 2.09369333e8 | 451 | 25317312 | 6 | 4.3478e-22 | true | ok | NaN | grad\_tol |
| 24 | LeastSquaresOptim (Dogleg) | 8.37718021e8 | 608 | 19789392 | 7 | 1.7300e-27 | true | ok | NaN | converged |
| 24 | LeastSquaresOptim (LM) | 1.612531e9 | 930 | 22167312 | 11 | 8.6559e-26 | true | ok | NaN | converged |
| 24 | Optim (NewtonTrustRegion) | 8.25695604e8 | 1504 | 390232304 | 10 | 7.3913e-20 | true | ok | NaN | converged |
| 24 | Optim (Newton) | 2.10425958e8 | 539 | 8360512 | 6 | 4.3499e-22 | true | ok | NaN | converged |
| 24 | JSOSolvers (trunk) | 4.94495291e8 | 1386 | 6364496 | 16 | 9.1900e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 24 | JSOSolvers (tron) | 5.198090625e8 | 759 | 3867760 | 9 | 4.3392e-18 | true | ok | NaN | first\_order |
| 24 | Ipopt | 2.44365125e8 | 716 | 2590272 | 6 | 4.3478e-22 | true | ok | NaN | first\_order |
| 24 | MadNLP | 2.33437958e8 | 1024 | 26163872 | 6 | 4.3506e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 24 | NonlinearSolve (LM) | 9.094011665e8 | 1023 | 67843504 | 14 | 1.1490e-17 | true | ok | NaN | Success |
| 24 | NonlinearSolve (TrustRegion) | 1.928097625e9 | 421 | 26778864 | 10 | 3.1526e-18 | true | ok | NaN | Success |
| 24 | CaNNOLeS | 1.4189633708e10 | 653 | 281338832 | 6 | 3.3894e-21 | true | ok | NaN | first\_order |
| 28 | SecondOrderOptimization (Dogleg) | 4.87223375e8 | 593 | 56789120 | 6 | 6.4252e-20 | true | ok | NaN | grad\_tol |
| 28 | SecondOrderOptimization (LM) | 5.505206875e8 | 587 | 56774640 | 6 | 6.4928e-20 | true | ok | NaN | grad\_tol |
| 28 | SecondOrderOptimization (Gauss-Newton) | 4.85246459e8 | 577 | 45986496 | 6 | 6.4252e-20 | true | ok | NaN | grad\_tol |
| 28 | LeastSquaresOptim (Dogleg) | 1.949595709e9 | 734 | 26100160 | 7 | 2.6663e-27 | true | ok | NaN | converged |
| 28 | LeastSquaresOptim (LM) | 3.723555667e9 | 1128 | 41201344 | 11 | 2.2506e-21 | true | ok | NaN | converged |
| 28 | Optim (NewtonTrustRegion) | 1.679849834e9 | 1702 | 493019120 | 10 | 1.5929e-21 | true | ok | NaN | converged |
| 28 | Optim (Newton) | 4.86906292e8 | 665 | 14074784 | 6 | 6.4248e-20 | true | ok | NaN | converged |
| 28 | JSOSolvers (trunk) | 1.115158542e9 | 1590 | 9621920 | 18 | 4.9691e-17 | true | ok | NaN | first\_order |
| 28 | JSOSolvers (tron) | 1.084316541e9 | 939 | 5265280 | 9 | 1.9849e-18 | true | ok | NaN | first\_order |
| 28 | Ipopt | 5.45994021e8 | 842 | 3518784 | 6 | 6.4252e-20 | true | ok | NaN | first\_order |
| 28 | MadNLP | 5.386429165e8 | 1150 | 59695664 | 6 | 6.4250e-20 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 28 | NonlinearSolve (LM) | 2.086665667e9 | 1203 | 129921968 | 14 | 5.0699e-18 | true | ok | NaN | Success |
| 28 | NonlinearSolve (TrustRegion) | 4.390266042e9 | 493 | 59771120 | 10 | 3.6013e-17 | true | ok | NaN | Success |
| 28 | CaNNOLeS | 3.6094018125e10 | 779 | 490589904 | 6 | 1.0709e-19 | true | ok | NaN | first\_order |
| 32 | SecondOrderOptimization (Dogleg) | 1.017300834e9 | 733 | 108498560 | 6 | 4.4334e-27 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 1.020300166e9 | 727 | 87916016 | 6 | 4.7367e-27 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Gauss-Newton) | 1.024320292e9 | 717 | 70161600 | 6 | 4.4334e-27 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 4.510797708e9 | 874 | 65298592 | 7 | 3.1831e-27 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 8.190837291e9 | 1348 | 71036448 | 11 | 4.0982e-22 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 4.063018084e9 | 2116 | 983430224 | 11 | 3.5175e-27 | true | ok | NaN | converged |
| 32 | Optim (Newton) | 1.020085458e9 | 805 | 22386208 | 6 | 4.2413e-27 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 2.324647584e9 | 1967 | 12334400 | 18 | 7.9618e-17 | true | ok | NaN | first\_order |
| 32 | JSOSolvers (tron) | 2.45357e9 | 1239 | 7380336 | 10 | 1.0315e-18 | true | ok | NaN | first\_order |
| 32 | Ipopt | 1.129335167e9 | 982 | 4521792 | 6 | 4.7888e-27 | true | ok | NaN | first\_order |
| 32 | MadNLP | 1.109642417e9 | 1290 | 107309904 | 6 | 4.1896e-27 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 5.487726667e9 | 1550 | 225559216 | 17 | 2.1982e-21 | true | ok | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 9.579793625e9 | 570 | 90152592 | 7 | 1.2469e-17 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 4.1500050208e10 | 622 | 847640480 | 3 | 3.4751e+00 | false | timeout | NaN | max\_time |
