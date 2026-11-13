# Benchmark Results: Dense Affine Alignment

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-13T01:16:36
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 520587c

---

## Model Evaluation Scaling

This problem uses `Standalone` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 1 | SecondOrderOptimization (Dogleg) | 2917.0 | 50 | 7504 | 1 | 3.0815e-32 | true |
| 1 | SecondOrderOptimization (LM) | 3916.0 | 55 | 10048 | 2 | 1.1986e-26 | true |
| 1 | LeastSquaresOptim (Dogleg) | 8500.0 | 107 | 161952 | 3 | 6.1630e-33 | true |
| 1 | LeastSquaresOptim (LM) | 16979.0 | 184 | 321904 | 6 | 1.6897e-26 | true |
| 1 | Optim (NewtonTrustRegion) | 4958.5 | 78 | 9136 | 1 | 3.0815e-32 | true |
| 1 | Optim (Newton) | 4709.0 | 67 | 8464 | 1 | 3.0815e-32 | true |
| 1 | JSOSolvers (trunk) | 8937.5 | 109 | 19264 | 4 | 1.2326e-32 | true |
| 1 | JSOSolvers (tron) | 10583.5 | 154 | 16320 | 2 | 2.4652e-32 | true |
| 1 | Ipopt | 346167.0 | 144 | 11712 | 1 | 3.0815e-32 | true |
| 1 | MadNLP | 195917.0 | 562 | 50640 | 1 | 3.0815e-32 | true |
| 1 | NonlinearSolve (LM) | 26771.0 | 284 | 40016 | 7 | 4.7548e-21 | true |
| 1 | NonlinearSolve (TrustRegion) | 12042.0 | 138 | 164960 | 3 | 3.0815e-32 | true |
| 1 | CaNNOLeS | 9583.0 | 186 | 16624 | 1 | 3.0815e-32 | true |
| 2 | SecondOrderOptimization (Dogleg) | 12979.0 | 86 | 35168 | 5 | 4.8074e-28 | true |
| 2 | SecondOrderOptimization (LM) | 12083.0 | 82 | 34928 | 5 | 4.6020e-28 | true |
| 2 | LeastSquaresOptim (Dogleg) | 29541.5 | 188 | 345728 | 6 | 1.3066e-30 | true |
| 2 | LeastSquaresOptim (LM) | 44833.0 | 265 | 516992 | 9 | 2.0141e-26 | true |
| 2 | Optim (NewtonTrustRegion) | 39812.5 | 273 | 60992 | 5 | 1.8442e-28 | true |
| 2 | Optim (Newton) | 18625.0 | 151 | 39792 | 5 | 4.8900e-28 | true |
| 2 | JSOSolvers (trunk) | 33145.5 | 159 | 60992 | 9 | 3.5039e-21 | true |
| 2 | JSOSolvers (tron) | 74771.0 | 195 | 48304 | 6 | 2.3227e-17 | true |
| 2 | Ipopt | 607167.0 | 304 | 44608 | 5 | 4.5875e-28 | true |
| 2 | MadNLP | 274896.5 | 602 | 81536 | 5 | 4.4364e-28 | true |
| 2 | NonlinearSolve (LM) | 90208.0 | 372 | 109152 | 11 | 1.1056e-19 | true |
| 2 | NonlinearSolve (TrustRegion) | 30354.0 | 228 | 357440 | 6 | 1.1532e-22 | true |
| 2 | CaNNOLeS | 35604.5 | 226 | 64096 | 5 | 4.4295e-28 | true |
| 3 | SecondOrderOptimization (Dogleg) | 39979.5 | 114 | 95024 | 8 | 4.0949e-21 | true |
| 3 | SecondOrderOptimization (LM) | 35312.5 | 110 | 94688 | 8 | 4.0881e-21 | true |
| 3 | LeastSquaresOptim (Dogleg) | 85854.0 | 279 | 574832 | 9 | 1.5346e-30 | true |
| 3 | LeastSquaresOptim (LM) | 93375.0 | 303 | 639040 | 10 | 1.4701e-24 | true |
| 3 | Optim (NewtonTrustRegion) | 148458.5 | 389 | 188960 | 8 | 2.9832e-20 | true |
| 3 | Optim (Newton) | 52833.0 | 214 | 106304 | 8 | 4.0949e-21 | true |
| 3 | JSOSolvers (trunk) | 109687.5 | 190 | 134336 | 12 | 1.9175e-19 | true |
| 3 | JSOSolvers (tron) | 161896.0 | 246 | 129424 | 11 | 4.9719e-18 | true |
| 3 | Ipopt | 829916.5 | 424 | 103168 | 8 | 4.0949e-21 | true |
| 3 | MadNLP | 377625.0 | 632 | 145008 | 8 | 4.0949e-21 | true |
| 3 | NonlinearSolve (LM) | 366458.5 | 507 | 322928 | 19 | 1.5514e-21 | true |
| 3 | NonlinearSolve (TrustRegion) | 92375.0 | 337 | 623856 | 9 | 1.5772e-25 | true |
| 3 | CaNNOLeS | 175563.0 | 273 | 186160 | 8 | 4.0949e-21 | true |
| 4 | SecondOrderOptimization (Dogleg) | 190062.5 | 270 | 322208 | 18 | 7.7407e-20 | true |
| 4 | SecondOrderOptimization (LM) | 160895.5 | 228 | 269136 | 14 | 2.6685e-19 | true |
| 4 | LeastSquaresOptim (Dogleg) | 338354.5 | 537 | 1146608 | 22 | 8.2584e-30 | true |
| 4 | LeastSquaresOptim (LM) | 480750.0 | 663 | 1572576 | 23 | 1.8795e-27 | true |
| 4 | Optim (NewtonTrustRegion) | 488520.5 | 828 | 609136 | 10 | 7.5510e-20 | true |
| 4 | Optim (Newton) | 225854.0 | 532 | 327392 | 19 | 3.9824e-23 | true |
| 4 | JSOSolvers (trunk) | 295500.0 | 474 | 202592 | 11 | 8.8233e-17 | false |
| 4 | JSOSolvers (tron) | 511917.0 | 414 | 361856 | 23 | 5.5807e-17 | true |
| 4 | Ipopt | 1.857104e6 | 871 | 276304 | 15 | 1.1586e-21 | true |
| 4 | MadNLP | 766708.5 | 761 | 322992 | 15 | 1.1585e-21 | true |
| 4 | NonlinearSolve (LM) | 2.0666667e7 | 10821 | 11381600 | 500 | 1.0115e+00 | false |
| 4 | NonlinearSolve (TrustRegion) | 421791.5 | 442 | 430960 | 19 | 7.2488e-24 | true |
| 4 | CaNNOLeS | 792166.5 | 359 | 460912 | 13 | 8.9437e-29 | true |
| 6 | SecondOrderOptimization (Dogleg) | 316666.5 | 141 | 338288 | 7 | 2.1842e-29 | true |
| 6 | SecondOrderOptimization (LM) | 311729.0 | 137 | 337472 | 7 | 3.0913e-29 | true |
| 6 | LeastSquaresOptim (Dogleg) | 864125.0 | 283 | 790608 | 8 | 1.3337e-29 | true |
| 6 | LeastSquaresOptim (LM) | 1.250292e6 | 343 | 989952 | 10 | 1.4854e-24 | true |
| 6 | Optim (NewtonTrustRegion) | 1.7378125e6 | 635 | 1312480 | 9 | 1.9574e-29 | true |
| 6 | Optim (Newton) | 360625.5 | 227 | 274272 | 7 | 1.9081e-29 | true |
| 6 | JSOSolvers (trunk) | 931042.0 | 523 | 437520 | 13 | 7.2811e-17 | false |
| 6 | JSOSolvers (tron) | 864812.0 | 265 | 310080 | 9 | 6.7945e-19 | true |
| 6 | Ipopt | 1.249917e6 | 416 | 245440 | 7 | 1.7478e-29 | true |
| 6 | MadNLP | 734604.5 | 678 | 413456 | 7 | 1.2449e-29 | true |
| 6 | NonlinearSolve (LM) | 2.6307915e6 | 528 | 1391072 | 14 | 6.7856e-22 | true |
| 6 | NonlinearSolve (TrustRegion) | 750812.5 | 289 | 630320 | 8 | 2.3148e-29 | true |
| 6 | CaNNOLeS | 2.553188e6 | 303 | 1440400 | 7 | 2.1373e-29 | true |
| 8 | SecondOrderOptimization (Dogleg) | 926021.0 | 150 | 666688 | 6 | 6.6550e-26 | true |
| 8 | SecondOrderOptimization (LM) | 958104.0 | 146 | 665360 | 6 | 6.9767e-26 | true |
| 8 | LeastSquaresOptim (Dogleg) | 2.743792e6 | 275 | 982384 | 7 | 3.7175e-29 | true |
| 8 | LeastSquaresOptim (LM) | 4.430417e6 | 341 | 1266416 | 9 | 6.0108e-22 | true |
| 8 | Optim (NewtonTrustRegion) | 3.7395205e6 | 447 | 2168160 | 7 | 3.8950e-29 | true |
| 8 | Optim (Newton) | 983229.0 | 223 | 433760 | 6 | 6.7361e-26 | true |
| 8 | JSOSolvers (trunk) | 2.7245835e6 | 287 | 614512 | 12 | 3.4005e-17 | true |
| 8 | JSOSolvers (tron) | 3.711542e6 | 302 | 487408 | 9 | 4.6727e-17 | true |
| 8 | Ipopt | 2.033021e6 | 393 | 333392 | 6 | 6.5895e-26 | true |
| 8 | MadNLP | 1.5215415e6 | 685 | 769744 | 6 | 6.6360e-26 | true |
| 8 | NonlinearSolve (LM) | 6.9573965e6 | 546 | 2578736 | 12 | 3.2827e-20 | true |
| 8 | NonlinearSolve (TrustRegion) | 1.712771e6 | 278 | 1084096 | 6 | 3.6932e-20 | true |
| 8 | CaNNOLeS | 9.3288955e6 | 332 | 3512320 | 6 | 6.6806e-26 | true |
| 12 | SecondOrderOptimization (Dogleg) | 6.1015e6 | 199 | 2191360 | 6 | 1.9899e-28 | true |
| 12 | SecondOrderOptimization (LM) | 6.0771245e6 | 195 | 2188560 | 6 | 2.2266e-28 | true |
| 12 | LeastSquaresOptim (Dogleg) | 2.3290042e7 | 331 | 2142320 | 7 | 2.1289e-28 | true |
| 12 | LeastSquaresOptim (LM) | 4.0693208e7 | 456 | 2936128 | 10 | 5.6439e-24 | true |
| 12 | Optim (NewtonTrustRegion) | 2.61635415e7 | 802 | 15060768 | 9 | 6.1614e-24 | true |
| 12 | Optim (Newton) | 6.114e6 | 272 | 1089056 | 6 | 1.6004e-28 | true |
| 12 | JSOSolvers (trunk) | 1.7332709e7 | 697 | 1510592 | 14 | 7.3466e-17 | false |
| 12 | JSOSolvers (tron) | 1.7260521e7 | 372 | 1027760 | 9 | 1.2153e-17 | true |
| 12 | Ipopt | 8.722271e6 | 442 | 690992 | 6 | 1.8094e-28 | true |
| 12 | MadNLP | 7.6065e6 | 734 | 2435008 | 6 | 1.7197e-28 | true |
| 12 | NonlinearSolve (LM) | 4.8767166e7 | 684 | 7697568 | 14 | 1.8307e-20 | true |
| 12 | NonlinearSolve (TrustRegion) | 1.01537495e7 | 320 | 3456608 | 6 | 2.5253e-28 | true |
| 12 | CaNNOLeS | 7.4137396e7 | 386 | 15218128 | 6 | 1.7020e-28 | true |
| 16 | SecondOrderOptimization (Dogleg) | 2.97135e7 | 308 | 6010448 | 7 | 4.8515e-28 | true |
| 16 | SecondOrderOptimization (LM) | 2.9413084e7 | 302 | 6005184 | 7 | 6.1689e-28 | true |
| 16 | LeastSquaresOptim (Dogleg) | 1.31919541e8 | 484 | 4734656 | 10 | 6.6619e-28 | true |
| 16 | LeastSquaresOptim (LM) | 2.10498166e8 | 688 | 6571840 | 12 | 2.3284e-21 | true |
| 16 | Optim (NewtonTrustRegion) | 1.5334075e8 | 1780 | 91270464 | 14 | 6.0911e-20 | true |
| 16 | Optim (Newton) | 3.0012875e7 | 395 | 2583936 | 7 | 6.0782e-28 | true |
| 16 | JSOSolvers (trunk) | 1.005188545e8 | 769 | 3427024 | 19 | 7.0921e-17 | true |
| 16 | JSOSolvers (tron) | 1.039976455e8 | 593 | 2282288 | 12 | 1.2439e-17 | true |
| 16 | Ipopt | 3.9334771e7 | 581 | 1361840 | 7 | 5.7469e-28 | true |
| 16 | MadNLP | 3.54545625e7 | 857 | 6550720 | 7 | 5.5062e-28 | true |
| 16 | NonlinearSolve (LM) | 2.22860042e8 | 900 | 18424048 | 15 | 4.8064e-20 | true |
| 16 | NonlinearSolve (TrustRegion) | 4.939675e7 | 442 | 9201936 | 7 | 5.1749e-28 | true |
| 16 | CaNNOLeS | 3.83573958e8 | 464 | 49689424 | 6 | 4.2658e-16 | true |
| 20 | SecondOrderOptimization (Dogleg) | 8.1785834e7 | 359 | 12908000 | 6 | 2.1717e-27 | true |
| 20 | SecondOrderOptimization (LM) | 8.0303291e7 | 353 | 12900688 | 6 | 2.6691e-27 | true |
| 20 | LeastSquaresOptim (Dogleg) | 3.07484625e8 | 503 | 8480496 | 7 | 6.8355e-28 | true |
| 20 | LeastSquaresOptim (LM) | 5.851961665e8 | 765 | 11615536 | 11 | 3.7237e-26 | true |
| 20 | Optim (NewtonTrustRegion) | 2.673200415e8 | 1107 | 101340208 | 9 | 3.6931e-22 | true |
| 20 | Optim (Newton) | 8.27799375e7 | 434 | 4675488 | 6 | 2.4072e-27 | true |
| 20 | JSOSolvers (trunk) | 2.04393792e8 | 1083 | 4221728 | 15 | 8.1386e-17 | false |
| 20 | JSOSolvers (tron) | 2.50327104e8 | 657 | 2972704 | 10 | 4.6362e-17 | true |
| 20 | Ipopt | 9.6910625e7 | 601 | 1811520 | 6 | 2.2830e-27 | true |
| 20 | MadNLP | 9.18648955e7 | 907 | 13444416 | 6 | 2.1986e-27 | true |
| 20 | NonlinearSolve (LM) | 6.05905792e8 | 969 | 36394752 | 13 | 2.3705e-21 | true |
| 20 | NonlinearSolve (TrustRegion) | 1.24248292e8 | 471 | 20970448 | 6 | 2.2471e-27 | true |
| 20 | CaNNOLeS | 1.495288291e9 | 548 | 112334160 | 6 | 2.4991e-27 | true |
| 24 | SecondOrderOptimization (Dogleg) | 2.13158375e8 | 464 | 25180256 | 6 | 4.3478e-22 | true |
| 24 | SecondOrderOptimization (LM) | 2.119175e8 | 458 | 25169872 | 6 | 4.4061e-22 | true |
| 24 | LeastSquaresOptim (Dogleg) | 8.327570625e8 | 608 | 15316560 | 7 | 1.7300e-27 | true |
| 24 | LeastSquaresOptim (LM) | 1.600892417e9 | 930 | 22167312 | 11 | 8.6559e-26 | true |
| 24 | Optim (NewtonTrustRegion) | 7.88341396e8 | 1504 | 269252848 | 10 | 7.3913e-20 | true |
| 24 | Optim (Newton) | 2.10939208e8 | 539 | 8360512 | 6 | 4.3499e-22 | true |
| 24 | JSOSolvers (trunk) | 5.02839667e8 | 1386 | 6364496 | 16 | 9.1900e-17 | false |
| 24 | JSOSolvers (tron) | 5.204241875e8 | 760 | 3867280 | 9 | 4.3392e-18 | true |
| 24 | Ipopt | 2.4404575e8 | 706 | 2574528 | 6 | 4.3478e-22 | true |
| 24 | MadNLP | 2.394764165e8 | 1024 | 26163872 | 6 | 4.3506e-22 | true |
| 24 | NonlinearSolve (LM) | 1.695556708e9 | 1170 | 68455616 | 14 | 6.9072e-18 | true |
| 24 | NonlinearSolve (TrustRegion) | 3.27968833e8 | 561 | 40797904 | 6 | 4.3483e-22 | true |
| 24 | CaNNOLeS | 1.4554529916e10 | 653 | 255337424 | 6 | 3.3894e-21 | true |
| 28 | SecondOrderOptimization (Dogleg) | 4.88881875e8 | 590 | 45003616 | 6 | 6.4252e-20 | true |
| 28 | SecondOrderOptimization (LM) | 4.8821025e8 | 584 | 44989136 | 6 | 6.4928e-20 | true |
| 28 | LeastSquaresOptim (Dogleg) | 1.950834334e9 | 734 | 26100160 | 7 | 2.6663e-27 | true |
| 28 | LeastSquaresOptim (LM) | 3.772976042e9 | 1128 | 41201344 | 11 | 2.2506e-21 | true |
| 28 | Optim (NewtonTrustRegion) | 1.765767917e9 | 1702 | 489463792 | 10 | 1.5929e-21 | true |
| 28 | Optim (Newton) | 4.86704667e8 | 665 | 14074784 | 6 | 6.4248e-20 | true |
| 28 | JSOSolvers (trunk) | 1.102891209e9 | 1590 | 9621920 | 18 | 4.9691e-17 | true |
| 28 | JSOSolvers (tron) | 1.090403292e9 | 940 | 5264544 | 9 | 1.9849e-18 | true |
| 28 | Ipopt | 5.501122705e8 | 832 | 3496896 | 6 | 6.4252e-20 | true |
| 28 | MadNLP | 5.78391333e8 | 1150 | 67101232 | 6 | 6.4250e-20 | true |
| 28 | NonlinearSolve (LM) | 3.968167458e9 | 1386 | 118536384 | 14 | 4.3998e-18 | true |
| 28 | NonlinearSolve (TrustRegion) | 7.43491917e8 | 669 | 67595472 | 6 | 6.4250e-20 | true |
| 28 | CaNNOLeS | 3.0645150833e10 | 700 | 468470208 | 5 | 1.6868e-08 | false |
| 32 | SecondOrderOptimization (Dogleg) | 1.029980917e9 | 730 | 74840416 | 6 | 4.4334e-27 | true |
| 32 | SecondOrderOptimization (LM) | 1.022839583e9 | 724 | 74819792 | 6 | 4.7367e-27 | true |
| 32 | LeastSquaresOptim (Dogleg) | 4.515941083e9 | 874 | 41869472 | 7 | 3.1831e-27 | true |
| 32 | LeastSquaresOptim (LM) | 8.215843709e9 | 1348 | 60452384 | 11 | 4.0982e-22 | true |
| 32 | Optim (NewtonTrustRegion) | 4.085075125e9 | 2116 | 924300368 | 11 | 3.5175e-27 | true |
| 32 | Optim (Newton) | 1.030981875e9 | 805 | 22386208 | 6 | 4.2413e-27 | true |
| 32 | JSOSolvers (trunk) | 2.324476875e9 | 1967 | 12334400 | 18 | 7.9618e-17 | true |
| 32 | JSOSolvers (tron) | 2.470095375e9 | 1240 | 7379440 | 10 | 1.0315e-18 | true |
| 32 | Ipopt | 1.2218845e9 | 972 | 4490688 | 6 | 4.7888e-27 | true |
| 32 | MadNLP | 1.216408e9 | 1290 | 94251856 | 6 | 4.1896e-27 | true |
| 32 | NonlinearSolve (LM) | 1.0576713458e10 | 1885 | 219504096 | 17 | 4.8201e-22 | true |
| 32 | NonlinearSolve (TrustRegion) | 1.639690667e9 | 789 | 120925392 | 6 | 4.5072e-27 | true |
| 32 | CaNNOLeS | 4.1686961834e10 | 622 | 798734240 | 3 | 3.4751e+00 | false |
