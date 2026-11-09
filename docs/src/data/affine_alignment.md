# Benchmark Results: Dense Affine Alignment

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-09T19:50:23
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 5a66143

---

## Model Evaluation Scaling

This problem uses `Standalone` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 1 | SecondOrderOptimization (Dogleg) | 2916.0 | 44 | 7664 | 1 | 3.0815e-32 | true |
| 1 | SecondOrderOptimization (LM) | 3687.0 | 55 | 10048 | 2 | 1.1986e-26 | true |
| 1 | LeastSquaresOptim (Dogleg) | 5520.5 | 107 | 161952 | 3 | 6.1630e-33 | true |
| 1 | LeastSquaresOptim (LM) | 10500.0 | 184 | 321904 | 6 | 1.6897e-26 | true |
| 1 | Optim (NewtonTrustRegion) | 4333.5 | 78 | 9136 | 1 | 3.0815e-32 | true |
| 1 | Optim (Newton) | 4125.0 | 67 | 8464 | 1 | 3.0815e-32 | true |
| 1 | JSOSolvers (trunk) | 8167.0 | 109 | 19264 | 4 | 1.2326e-32 | true |
| 1 | JSOSolvers (tron) | 9375.0 | 154 | 16320 | 2 | 2.4652e-32 | true |
| 1 | Ipopt | 342062.5 | 144 | 11712 | 1 | 3.0815e-32 | true |
| 1 | MadNLP | 195187.5 | 562 | 50640 | 1 | 3.0815e-32 | true |
| 1 | NonlinearSolve (LM) | 26291.5 | 284 | 39904 | 7 | 4.7548e-21 | true |
| 1 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1 | CaNNOLeS | 7979.0 | 186 | 16624 | 1 | 3.0815e-32 | true |
| 2 | SecondOrderOptimization (Dogleg) | 12521.0 | 84 | 36928 | 5 | 4.8074e-28 | true |
| 2 | SecondOrderOptimization (LM) | 12125.0 | 82 | 34928 | 5 | 4.6020e-28 | true |
| 2 | LeastSquaresOptim (Dogleg) | 23853.5 | 188 | 345728 | 6 | 1.3066e-30 | true |
| 2 | LeastSquaresOptim (LM) | 35458.0 | 265 | 516992 | 9 | 2.0141e-26 | true |
| 2 | Optim (NewtonTrustRegion) | 36917.0 | 273 | 60992 | 5 | 1.8442e-28 | true |
| 2 | Optim (Newton) | 18103.5 | 151 | 39792 | 5 | 4.8900e-28 | true |
| 2 | JSOSolvers (trunk) | 33499.5 | 159 | 60992 | 9 | 3.5039e-21 | true |
| 2 | JSOSolvers (tron) | 69749.5 | 195 | 48304 | 6 | 2.3227e-17 | true |
| 2 | Ipopt | 586958.0 | 304 | 44608 | 5 | 4.5875e-28 | true |
| 2 | MadNLP | 278292.0 | 602 | 81536 | 5 | 4.4364e-28 | true |
| 2 | NonlinearSolve (LM) | 92749.5 | 372 | 108864 | 11 | 1.1056e-19 | true |
| 2 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2 | CaNNOLeS | 34041.5 | 226 | 64096 | 5 | 4.4295e-28 | true |
| 3 | SecondOrderOptimization (Dogleg) | 37917.0 | 115 | 96544 | 8 | 4.0949e-21 | true |
| 3 | SecondOrderOptimization (LM) | 37604.0 | 110 | 94688 | 8 | 4.0881e-21 | true |
| 3 | LeastSquaresOptim (Dogleg) | 78583.0 | 279 | 574832 | 9 | 1.5346e-30 | true |
| 3 | LeastSquaresOptim (LM) | 91124.5 | 303 | 639040 | 10 | 1.4701e-24 | true |
| 3 | Optim (NewtonTrustRegion) | 145270.5 | 389 | 188960 | 8 | 2.9832e-20 | true |
| 3 | Optim (Newton) | 52250.0 | 214 | 106304 | 8 | 4.0949e-21 | true |
| 3 | JSOSolvers (trunk) | 103417.0 | 190 | 134336 | 12 | 1.9175e-19 | true |
| 3 | JSOSolvers (tron) | 159833.0 | 246 | 129424 | 11 | 4.9719e-18 | true |
| 3 | Ipopt | 847021.0 | 424 | 103168 | 8 | 4.0949e-21 | true |
| 3 | MadNLP | 387146.0 | 632 | 145008 | 8 | 4.0949e-21 | true |
| 3 | NonlinearSolve (LM) | 352646.0 | 507 | 322800 | 19 | 1.5514e-21 | true |
| 3 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 3 | CaNNOLeS | 172458.5 | 273 | 186160 | 8 | 4.0949e-21 | true |
| 4 | SecondOrderOptimization (Dogleg) | 178291.5 | 257 | 296432 | 18 | 7.7407e-20 | true |
| 4 | SecondOrderOptimization (LM) | 167000.0 | 228 | 269136 | 14 | 2.6685e-19 | true |
| 4 | LeastSquaresOptim (Dogleg) | 336833.5 | 537 | 1146608 | 22 | 8.2584e-30 | true |
| 4 | LeastSquaresOptim (LM) | 486938.0 | 663 | 1572576 | 23 | 1.8795e-27 | true |
| 4 | Optim (NewtonTrustRegion) | 490416.5 | 828 | 609136 | 10 | 7.5510e-20 | true |
| 4 | Optim (Newton) | 223604.0 | 532 | 327392 | 19 | 3.9824e-23 | true |
| 4 | JSOSolvers (trunk) | 321417.0 | 474 | 202592 | 11 | 8.8233e-17 | false |
| 4 | JSOSolvers (tron) | 502854.5 | 414 | 361856 | 23 | 5.5807e-17 | true |
| 4 | Ipopt | 1.825292e6 | 871 | 276304 | 15 | 1.1586e-21 | true |
| 4 | MadNLP | 818291.5 | 761 | 322992 | 15 | 1.1585e-21 | true |
| 4 | NonlinearSolve (LM) | 2.1327083e7 | 10821 | 11381520 | 500 | 1.0115e+00 | false |
| 4 | NonlinearSolve (TrustRegion) | 425791.5 | 442 | 430752 | 19 | 7.2488e-24 | true |
| 4 | CaNNOLeS | 794291.5 | 359 | 460912 | 13 | 8.9437e-29 | true |
| 6 | SecondOrderOptimization (Dogleg) | 316312.0 | 139 | 312784 | 7 | 2.1842e-29 | true |
| 6 | SecondOrderOptimization (LM) | 316584.0 | 137 | 337472 | 7 | 3.0913e-29 | true |
| 6 | LeastSquaresOptim (Dogleg) | 858896.0 | 283 | 790608 | 8 | 1.3337e-29 | true |
| 6 | LeastSquaresOptim (LM) | 1.238708e6 | 343 | 989952 | 10 | 1.4854e-24 | true |
| 6 | Optim (NewtonTrustRegion) | 1.805166e6 | 635 | 1312480 | 9 | 1.9574e-29 | true |
| 6 | Optim (Newton) | 361979.5 | 227 | 274272 | 7 | 1.9081e-29 | true |
| 6 | JSOSolvers (trunk) | 962667.0 | 524 | 437808 | 13 | 7.2811e-17 | false |
| 6 | JSOSolvers (tron) | 873896.0 | 265 | 310080 | 9 | 6.7945e-19 | true |
| 6 | Ipopt | 1.2076665e6 | 416 | 245440 | 7 | 1.7478e-29 | true |
| 6 | MadNLP | 729499.5 | 678 | 413456 | 7 | 1.2449e-29 | true |
| 6 | NonlinearSolve (LM) | 2.621104e6 | 528 | 1391072 | 14 | 6.7856e-22 | true |
| 6 | NonlinearSolve (TrustRegion) | 756646.0 | 289 | 630192 | 8 | 2.3148e-29 | true |
| 6 | CaNNOLeS | 2.5646045e6 | 303 | 1440400 | 7 | 2.1373e-29 | true |
| 8 | SecondOrderOptimization (Dogleg) | 936041.5 | 147 | 570752 | 6 | 6.6550e-26 | true |
| 8 | SecondOrderOptimization (LM) | 930667.0 | 146 | 665360 | 6 | 6.9767e-26 | true |
| 8 | LeastSquaresOptim (Dogleg) | 2.7765625e6 | 275 | 982384 | 7 | 3.7175e-29 | true |
| 8 | LeastSquaresOptim (LM) | 4.499187e6 | 341 | 1266416 | 9 | 6.0108e-22 | true |
| 8 | Optim (NewtonTrustRegion) | 3.8816665e6 | 447 | 2168160 | 7 | 3.8950e-29 | true |
| 8 | Optim (Newton) | 976333.0 | 223 | 433760 | 6 | 6.7361e-26 | true |
| 8 | JSOSolvers (trunk) | 2.751187e6 | 287 | 614512 | 12 | 3.4005e-17 | true |
| 8 | JSOSolvers (tron) | 3.853e6 | 302 | 487408 | 9 | 4.6727e-17 | true |
| 8 | Ipopt | 2.1294165e6 | 393 | 333392 | 6 | 6.5895e-26 | true |
| 8 | MadNLP | 1.5718125e6 | 685 | 769744 | 6 | 6.6360e-26 | true |
| 8 | NonlinearSolve (LM) | 7.2915e6 | 546 | 2578608 | 12 | 3.2827e-20 | true |
| 8 | NonlinearSolve (TrustRegion) | 1.765187e6 | 278 | 1083968 | 6 | 3.6932e-20 | true |
| 8 | CaNNOLeS | 9.518729e6 | 332 | 3512320 | 6 | 6.6806e-26 | true |
| 12 | SecondOrderOptimization (Dogleg) | 6.1310215e6 | 196 | 1799776 | 6 | 1.9899e-28 | true |
| 12 | SecondOrderOptimization (LM) | 6.113729e6 | 195 | 2188560 | 6 | 2.2266e-28 | true |
| 12 | LeastSquaresOptim (Dogleg) | 2.36542085e7 | 331 | 2142320 | 7 | 2.1289e-28 | true |
| 12 | LeastSquaresOptim (LM) | 4.1639584e7 | 456 | 2936128 | 10 | 5.6439e-24 | true |
| 12 | Optim (NewtonTrustRegion) | 2.6026917e7 | 802 | 15060768 | 9 | 6.1614e-24 | true |
| 12 | Optim (Newton) | 6.2147705e6 | 272 | 1089056 | 6 | 1.6004e-28 | true |
| 12 | JSOSolvers (trunk) | 1.7688792e7 | 697 | 1510592 | 14 | 7.3466e-17 | false |
| 12 | JSOSolvers (tron) | 1.7597125e7 | 372 | 1027760 | 9 | 1.2153e-17 | true |
| 12 | Ipopt | 8.9519995e6 | 442 | 690992 | 6 | 1.8094e-28 | true |
| 12 | MadNLP | 7.90625e6 | 734 | 2435008 | 6 | 1.7197e-28 | true |
| 12 | NonlinearSolve (LM) | 4.9685e7 | 684 | 7697440 | 14 | 1.8307e-20 | true |
| 12 | NonlinearSolve (TrustRegion) | 1.0153042e7 | 320 | 3456480 | 6 | 2.5253e-28 | true |
| 12 | CaNNOLeS | 7.6228208e7 | 386 | 15218128 | 6 | 1.7020e-28 | true |
| 16 | SecondOrderOptimization (Dogleg) | 2.57870625e7 | 272 | 4648848 | 7 | 4.8515e-28 | true |
| 16 | SecondOrderOptimization (LM) | 2.9011292e7 | 302 | 6021568 | 7 | 6.1689e-28 | true |
| 16 | LeastSquaresOptim (Dogleg) | 1.280302915e8 | 484 | 4751040 | 10 | 6.6619e-28 | true |
| 16 | LeastSquaresOptim (LM) | 2.02560666e8 | 688 | 7309120 | 12 | 2.3284e-21 | true |
| 16 | Optim (NewtonTrustRegion) | 1.49547e8 | 1780 | 91270464 | 14 | 6.0911e-20 | true |
| 16 | Optim (Newton) | 2.9343375e7 | 395 | 2583936 | 7 | 6.0782e-28 | true |
| 16 | JSOSolvers (trunk) | 9.9344417e7 | 769 | 3427024 | 19 | 7.0921e-17 | true |
| 16 | JSOSolvers (tron) | 1.039995e8 | 593 | 2282288 | 12 | 1.2439e-17 | true |
| 16 | Ipopt | 3.829175e7 | 581 | 1361840 | 7 | 5.7469e-28 | true |
| 16 | MadNLP | 3.4545958e7 | 857 | 6550720 | 7 | 5.5062e-28 | true |
| 16 | NonlinearSolve (LM) | 2.15830833e8 | 900 | 18423920 | 15 | 4.8064e-20 | true |
| 16 | NonlinearSolve (TrustRegion) | 4.7651167e7 | 442 | 9201808 | 7 | 5.1749e-28 | true |
| 16 | CaNNOLeS | 3.69039709e8 | 464 | 53883728 | 6 | 4.2658e-16 | true |
| 20 | SecondOrderOptimization (Dogleg) | 8.1464666e7 | 355 | 10056560 | 6 | 2.1717e-27 | true |
| 20 | SecondOrderOptimization (LM) | 8.058175e7 | 353 | 12900688 | 6 | 2.6691e-27 | true |
| 20 | LeastSquaresOptim (Dogleg) | 3.065970625e8 | 503 | 8480496 | 7 | 6.8355e-28 | true |
| 20 | LeastSquaresOptim (LM) | 5.854770415e8 | 765 | 13745456 | 11 | 3.7237e-26 | true |
| 20 | Optim (NewtonTrustRegion) | 2.709300415e8 | 1107 | 101340208 | 9 | 3.6931e-22 | true |
| 20 | Optim (Newton) | 8.07e7 | 434 | 4675488 | 6 | 2.4072e-27 | true |
| 20 | JSOSolvers (trunk) | 2.03514375e8 | 1083 | 4221728 | 15 | 8.1386e-17 | false |
| 20 | JSOSolvers (tron) | 2.48271958e8 | 657 | 2972704 | 10 | 4.6362e-17 | true |
| 20 | Ipopt | 9.7759916e7 | 601 | 1811520 | 6 | 2.2830e-27 | true |
| 20 | MadNLP | 9.1329875e7 | 907 | 13444416 | 6 | 2.1986e-27 | true |
| 20 | NonlinearSolve (LM) | 5.953203335e8 | 969 | 36394624 | 13 | 2.3705e-21 | true |
| 20 | NonlinearSolve (TrustRegion) | 1.240377705e8 | 471 | 19561296 | 6 | 2.2471e-27 | true |
| 20 | CaNNOLeS | 1.357834041e9 | 548 | 122180944 | 6 | 2.4991e-27 | true |
| 24 | SecondOrderOptimization (Dogleg) | 2.11160792e8 | 460 | 26882032 | 6 | 4.3478e-22 | true |
| 24 | SecondOrderOptimization (LM) | 2.11035917e8 | 458 | 35196880 | 6 | 4.4061e-22 | true |
| 24 | LeastSquaresOptim (Dogleg) | 8.522607285e8 | 608 | 15316560 | 7 | 1.7300e-27 | true |
| 24 | LeastSquaresOptim (LM) | 1.610228917e9 | 930 | 22167312 | 11 | 8.6559e-26 | true |
| 24 | Optim (NewtonTrustRegion) | 7.87779875e8 | 1504 | 419739888 | 10 | 7.3913e-20 | true |
| 24 | Optim (Newton) | 2.10745541e8 | 539 | 8360512 | 6 | 4.3499e-22 | true |
| 24 | JSOSolvers (trunk) | 5.11411791e8 | 1386 | 6364496 | 16 | 9.1900e-17 | false |
| 24 | JSOSolvers (tron) | 5.246597295e8 | 760 | 3867280 | 9 | 4.3392e-18 | true |
| 24 | Ipopt | 2.50297271e8 | 706 | 2574528 | 6 | 4.3478e-22 | true |
| 24 | MadNLP | 2.45016959e8 | 1024 | 26163872 | 6 | 4.3506e-22 | true |
| 24 | NonlinearSolve (LM) | 1.813133959e9 | 1170 | 73223232 | 14 | 6.9072e-18 | true |
| 24 | NonlinearSolve (TrustRegion) | 3.271349795e8 | 561 | 42387024 | 6 | 4.3483e-22 | true |
| 24 | CaNNOLeS | 1.475056525e10 | 653 | 272360400 | 6 | 3.3894e-21 | true |
| 28 | SecondOrderOptimization (Dogleg) | 4.90118208e8 | 586 | 34677488 | 6 | 6.4252e-20 | true |
| 28 | SecondOrderOptimization (LM) | 4.92776146e8 | 584 | 56769232 | 6 | 6.4928e-20 | true |
| 28 | LeastSquaresOptim (Dogleg) | 1.963192625e9 | 734 | 26100160 | 7 | 2.6663e-27 | true |
| 28 | LeastSquaresOptim (LM) | 3.784957667e9 | 1128 | 40611520 | 11 | 2.2506e-21 | true |
| 28 | Optim (NewtonTrustRegion) | 1.779092792e9 | 1702 | 511680496 | 10 | 1.5929e-21 | true |
| 28 | Optim (Newton) | 4.8932375e8 | 665 | 14074784 | 6 | 6.4248e-20 | true |
| 28 | JSOSolvers (trunk) | 1.116419291e9 | 1590 | 9621920 | 18 | 4.9691e-17 | true |
| 28 | JSOSolvers (tron) | 1.088001625e9 | 940 | 5264544 | 9 | 1.9849e-18 | true |
| 28 | Ipopt | 5.500751045e8 | 832 | 3496896 | 6 | 6.4252e-20 | true |
| 28 | MadNLP | 5.695520415e8 | 1150 | 46817840 | 6 | 6.4250e-20 | true |
| 28 | NonlinearSolve (LM) | 3.99701475e9 | 1386 | 148584512 | 14 | 4.3998e-18 | true |
| 28 | NonlinearSolve (TrustRegion) | 7.94098e8 | 669 | 79506512 | 6 | 6.4250e-20 | true |
| 28 | CaNNOLeS | 3.0864142041e10 | 700 | 523995584 | 5 | 1.6868e-08 | false |
| 32 | SecondOrderOptimization (Dogleg) | 1.098615708e9 | 726 | 82074864 | 6 | 4.4334e-27 | true |
| 32 | SecondOrderOptimization (LM) | 1.033703e9 | 724 | 99920080 | 6 | 4.7367e-27 | true |
| 32 | LeastSquaresOptim (Dogleg) | 4.578955459e9 | 874 | 66969760 | 7 | 3.1831e-27 | true |
| 32 | LeastSquaresOptim (LM) | 8.302310833e9 | 1348 | 54865440 | 11 | 4.0982e-22 | true |
| 32 | Optim (NewtonTrustRegion) | 4.146132708e9 | 2116 | 924300368 | 11 | 3.5175e-27 | true |
| 32 | Optim (Newton) | 1.029702542e9 | 805 | 22386208 | 6 | 4.2413e-27 | true |
| 32 | JSOSolvers (trunk) | 2.359673917e9 | 1967 | 12334400 | 18 | 7.9618e-17 | true |
| 32 | JSOSolvers (tron) | 2.494883791e9 | 1240 | 7379440 | 10 | 1.0315e-18 | true |
| 32 | Ipopt | 1.14318625e9 | 972 | 4490688 | 6 | 4.7888e-27 | true |
| 32 | MadNLP | 1.134825084e9 | 1290 | 105982800 | 6 | 4.1896e-27 | true |
| 32 | NonlinearSolve (LM) | 1.0462704417e10 | 1885 | 230088032 | 17 | 4.8201e-22 | true |
| 32 | NonlinearSolve (TrustRegion) | 1.712090208e9 | 789 | 120925264 | 6 | 4.5072e-27 | true |
| 32 | CaNNOLeS | 4.1194296542e10 | 622 | 849213344 | 3 | 3.4751e+00 | false |
