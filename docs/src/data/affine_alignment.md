# Benchmark Results: Dense Affine Alignment

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-10T11:11:31
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 4aac5c9

---

## Model Evaluation Scaling

This problem uses `Standalone` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 1 | SecondOrderOptimization (Dogleg) | 2770.5 | 44 | 7664 | 1 | 3.0815e-32 | true |
| 1 | SecondOrderOptimization (LM) | 3708.0 | 55 | 10048 | 2 | 1.1986e-26 | true |
| 1 | LeastSquaresOptim (Dogleg) | 6042.0 | 107 | 161952 | 3 | 6.1630e-33 | true |
| 1 | LeastSquaresOptim (LM) | 18312.5 | 184 | 321904 | 6 | 1.6897e-26 | true |
| 1 | Optim (NewtonTrustRegion) | 4916.0 | 78 | 9136 | 1 | 3.0815e-32 | true |
| 1 | Optim (Newton) | 4666.0 | 67 | 8464 | 1 | 3.0815e-32 | true |
| 1 | JSOSolvers (trunk) | 8062.5 | 109 | 19264 | 4 | 1.2326e-32 | true |
| 1 | JSOSolvers (tron) | 10666.0 | 154 | 16320 | 2 | 2.4652e-32 | true |
| 1 | Ipopt | 323062.5 | 144 | 11712 | 1 | 3.0815e-32 | true |
| 1 | MadNLP | 193229.5 | 562 | 50640 | 1 | 3.0815e-32 | true |
| 1 | NonlinearSolve (LM) | 26500.0 | 284 | 39904 | 7 | 4.7548e-21 | true |
| 1 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1 | CaNNOLeS | 9562.5 | 186 | 16624 | 1 | 3.0815e-32 | true |
| 2 | SecondOrderOptimization (Dogleg) | 13145.5 | 84 | 36928 | 5 | 4.8074e-28 | true |
| 2 | SecondOrderOptimization (LM) | 12166.5 | 82 | 34928 | 5 | 4.6020e-28 | true |
| 2 | LeastSquaresOptim (Dogleg) | 25124.5 | 188 | 345728 | 6 | 1.3066e-30 | true |
| 2 | LeastSquaresOptim (LM) | 33271.0 | 265 | 516992 | 9 | 2.0141e-26 | true |
| 2 | Optim (NewtonTrustRegion) | 41354.0 | 273 | 60992 | 5 | 1.8442e-28 | true |
| 2 | Optim (Newton) | 19917.0 | 151 | 39792 | 5 | 4.8900e-28 | true |
| 2 | JSOSolvers (trunk) | 36875.0 | 159 | 60992 | 9 | 3.5039e-21 | true |
| 2 | JSOSolvers (tron) | 77708.5 | 195 | 48304 | 6 | 2.3227e-17 | true |
| 2 | Ipopt | 529791.5 | 304 | 44608 | 5 | 4.5875e-28 | true |
| 2 | MadNLP | 271666.5 | 602 | 81536 | 5 | 4.4364e-28 | true |
| 2 | NonlinearSolve (LM) | 95813.0 | 372 | 108864 | 11 | 1.1056e-19 | true |
| 2 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2 | CaNNOLeS | 35375.0 | 226 | 64096 | 5 | 4.4295e-28 | true |
| 3 | SecondOrderOptimization (Dogleg) | 38604.0 | 115 | 96544 | 8 | 4.0949e-21 | true |
| 3 | SecondOrderOptimization (LM) | 36666.5 | 110 | 94688 | 8 | 4.0881e-21 | true |
| 3 | LeastSquaresOptim (Dogleg) | 79625.0 | 279 | 574832 | 9 | 1.5346e-30 | true |
| 3 | LeastSquaresOptim (LM) | 89167.0 | 303 | 639040 | 10 | 1.4701e-24 | true |
| 3 | Optim (NewtonTrustRegion) | 144500.0 | 389 | 188960 | 8 | 2.9832e-20 | true |
| 3 | Optim (Newton) | 49708.0 | 214 | 106304 | 8 | 4.0949e-21 | true |
| 3 | JSOSolvers (trunk) | 103750.0 | 190 | 134336 | 12 | 1.9175e-19 | true |
| 3 | JSOSolvers (tron) | 165958.5 | 246 | 129424 | 11 | 4.9719e-18 | true |
| 3 | Ipopt | 766500.0 | 424 | 103168 | 8 | 4.0949e-21 | true |
| 3 | MadNLP | 369708.5 | 632 | 145008 | 8 | 4.0949e-21 | true |
| 3 | NonlinearSolve (LM) | 357563.0 | 507 | 322800 | 19 | 1.5514e-21 | true |
| 3 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 3 | CaNNOLeS | 170958.0 | 273 | 186160 | 8 | 4.0949e-21 | true |
| 4 | SecondOrderOptimization (Dogleg) | 173604.5 | 257 | 296432 | 18 | 7.7407e-20 | true |
| 4 | SecondOrderOptimization (LM) | 161854.0 | 228 | 269136 | 14 | 2.6685e-19 | true |
| 4 | LeastSquaresOptim (Dogleg) | 357187.5 | 537 | 1146608 | 22 | 8.2584e-30 | true |
| 4 | LeastSquaresOptim (LM) | 488791.5 | 663 | 1572576 | 23 | 1.8795e-27 | true |
| 4 | Optim (NewtonTrustRegion) | 487854.5 | 828 | 609136 | 10 | 7.5510e-20 | true |
| 4 | Optim (Newton) | 218479.0 | 532 | 327392 | 19 | 3.9824e-23 | true |
| 4 | JSOSolvers (trunk) | 375875.0 | 474 | 202592 | 11 | 8.8233e-17 | false |
| 4 | JSOSolvers (tron) | 493937.5 | 414 | 361856 | 23 | 5.5807e-17 | true |
| 4 | Ipopt | 1.619896e6 | 871 | 276304 | 15 | 1.1586e-21 | true |
| 4 | MadNLP | 779541.5 | 761 | 322992 | 15 | 1.1585e-21 | true |
| 4 | NonlinearSolve (LM) | 2.0854958e7 | 10821 | 11381520 | 500 | 1.0115e+00 | false |
| 4 | NonlinearSolve (TrustRegion) | 418438.0 | 442 | 430752 | 19 | 7.2488e-24 | true |
| 4 | CaNNOLeS | 793459.0 | 359 | 460912 | 13 | 8.9437e-29 | true |
| 6 | SecondOrderOptimization (Dogleg) | 328979.0 | 139 | 312784 | 7 | 2.1842e-29 | true |
| 6 | SecondOrderOptimization (LM) | 323125.0 | 137 | 337472 | 7 | 3.0913e-29 | true |
| 6 | LeastSquaresOptim (Dogleg) | 863354.0 | 283 | 790608 | 8 | 1.3337e-29 | true |
| 6 | LeastSquaresOptim (LM) | 1.2226665e6 | 343 | 989952 | 10 | 1.4854e-24 | true |
| 6 | Optim (NewtonTrustRegion) | 1.731646e6 | 635 | 1312480 | 9 | 1.9574e-29 | true |
| 6 | Optim (Newton) | 355437.5 | 227 | 274272 | 7 | 1.9081e-29 | true |
| 6 | JSOSolvers (trunk) | 940917.0 | 523 | 437520 | 13 | 7.2811e-17 | false |
| 6 | JSOSolvers (tron) | 880583.0 | 265 | 310080 | 9 | 6.7945e-19 | true |
| 6 | Ipopt | 1.1467915e6 | 416 | 245440 | 7 | 1.7478e-29 | true |
| 6 | MadNLP | 749958.5 | 678 | 413456 | 7 | 1.2449e-29 | true |
| 6 | NonlinearSolve (LM) | 2.626646e6 | 528 | 1391072 | 14 | 6.7856e-22 | true |
| 6 | NonlinearSolve (TrustRegion) | 736417.0 | 289 | 630192 | 8 | 2.3148e-29 | true |
| 6 | CaNNOLeS | 2.580062e6 | 303 | 1440400 | 7 | 2.1373e-29 | true |
| 8 | SecondOrderOptimization (Dogleg) | 936750.5 | 147 | 570752 | 6 | 6.6550e-26 | true |
| 8 | SecondOrderOptimization (LM) | 947416.5 | 146 | 665360 | 6 | 6.9767e-26 | true |
| 8 | LeastSquaresOptim (Dogleg) | 2.755521e6 | 275 | 982384 | 7 | 3.7175e-29 | true |
| 8 | LeastSquaresOptim (LM) | 4.404125e6 | 341 | 1266416 | 9 | 6.0108e-22 | true |
| 8 | Optim (NewtonTrustRegion) | 3.6805205e6 | 447 | 2168160 | 7 | 3.8950e-29 | true |
| 8 | Optim (Newton) | 975875.0 | 223 | 433760 | 6 | 6.7361e-26 | true |
| 8 | JSOSolvers (trunk) | 2.673854e6 | 287 | 614512 | 12 | 3.4005e-17 | true |
| 8 | JSOSolvers (tron) | 3.69825e6 | 302 | 487408 | 9 | 4.6727e-17 | true |
| 8 | Ipopt | 1.934313e6 | 393 | 333392 | 6 | 6.5895e-26 | true |
| 8 | MadNLP | 1.499917e6 | 685 | 769744 | 6 | 6.6360e-26 | true |
| 8 | NonlinearSolve (LM) | 7.028229e6 | 546 | 2578608 | 12 | 3.2827e-20 | true |
| 8 | NonlinearSolve (TrustRegion) | 1.7229585e6 | 278 | 1083968 | 6 | 3.6932e-20 | true |
| 8 | CaNNOLeS | 9.3153125e6 | 332 | 3512320 | 6 | 6.6806e-26 | true |
| 12 | SecondOrderOptimization (Dogleg) | 6.0453745e6 | 196 | 1799776 | 6 | 1.9899e-28 | true |
| 12 | SecondOrderOptimization (LM) | 6.0630625e6 | 195 | 2188560 | 6 | 2.2266e-28 | true |
| 12 | LeastSquaresOptim (Dogleg) | 2.317875e7 | 331 | 2142320 | 7 | 2.1289e-28 | true |
| 12 | LeastSquaresOptim (LM) | 4.047425e7 | 456 | 2936128 | 10 | 5.6439e-24 | true |
| 12 | Optim (NewtonTrustRegion) | 2.61573745e7 | 802 | 15060768 | 9 | 6.1614e-24 | true |
| 12 | Optim (Newton) | 6.2240005e6 | 272 | 1089056 | 6 | 1.6004e-28 | true |
| 12 | JSOSolvers (trunk) | 1.7434917e7 | 697 | 1510592 | 14 | 7.3466e-17 | false |
| 12 | JSOSolvers (tron) | 1.74099375e7 | 372 | 1027760 | 9 | 1.2153e-17 | true |
| 12 | Ipopt | 8.792e6 | 442 | 690992 | 6 | 1.8094e-28 | true |
| 12 | MadNLP | 7.895104e6 | 734 | 2435008 | 6 | 1.7197e-28 | true |
| 12 | NonlinearSolve (LM) | 5.0627938e7 | 684 | 7697440 | 14 | 1.8307e-20 | true |
| 12 | NonlinearSolve (TrustRegion) | 1.03416665e7 | 320 | 3456480 | 6 | 2.5253e-28 | true |
| 12 | CaNNOLeS | 7.8202542e7 | 386 | 15218128 | 6 | 1.7020e-28 | true |
| 16 | SecondOrderOptimization (Dogleg) | 2.58455625e7 | 272 | 4632464 | 7 | 4.8515e-28 | true |
| 16 | SecondOrderOptimization (LM) | 2.90533535e7 | 302 | 6005184 | 7 | 6.1689e-28 | true |
| 16 | LeastSquaresOptim (Dogleg) | 1.28102437e8 | 484 | 4734656 | 10 | 6.6619e-28 | true |
| 16 | LeastSquaresOptim (LM) | 2.04794541e8 | 688 | 6571840 | 12 | 2.3284e-21 | true |
| 16 | Optim (NewtonTrustRegion) | 1.50921125e8 | 1780 | 91270464 | 14 | 6.0911e-20 | true |
| 16 | Optim (Newton) | 2.9283146e7 | 395 | 2583936 | 7 | 6.0782e-28 | true |
| 16 | JSOSolvers (trunk) | 9.8398167e7 | 769 | 3427024 | 19 | 7.0921e-17 | true |
| 16 | JSOSolvers (tron) | 1.02388875e8 | 593 | 2282288 | 12 | 1.2439e-17 | true |
| 16 | Ipopt | 3.7773875e7 | 581 | 1361840 | 7 | 5.7469e-28 | true |
| 16 | MadNLP | 3.4593208e7 | 857 | 6550720 | 7 | 5.5062e-28 | true |
| 16 | NonlinearSolve (LM) | 2.174005e8 | 900 | 18423920 | 15 | 4.8064e-20 | true |
| 16 | NonlinearSolve (TrustRegion) | 4.8228583e7 | 442 | 9201808 | 7 | 5.1749e-28 | true |
| 16 | CaNNOLeS | 3.81642083e8 | 464 | 46625616 | 6 | 4.2658e-16 | true |
| 20 | SecondOrderOptimization (Dogleg) | 8.2176958e7 | 355 | 10056560 | 6 | 2.1717e-27 | true |
| 20 | SecondOrderOptimization (LM) | 8.1245333e7 | 353 | 12900688 | 6 | 2.6691e-27 | true |
| 20 | LeastSquaresOptim (Dogleg) | 3.146607495e8 | 503 | 8480496 | 7 | 6.8355e-28 | true |
| 20 | LeastSquaresOptim (LM) | 5.95273417e8 | 765 | 11615536 | 11 | 3.7237e-26 | true |
| 20 | Optim (NewtonTrustRegion) | 2.70399562e8 | 1107 | 101340208 | 9 | 3.6931e-22 | true |
| 20 | Optim (Newton) | 8.1624792e7 | 434 | 4675488 | 6 | 2.4072e-27 | true |
| 20 | JSOSolvers (trunk) | 2.05673459e8 | 1083 | 4221728 | 15 | 8.1386e-17 | false |
| 20 | JSOSolvers (tron) | 2.48137188e8 | 657 | 2972704 | 10 | 4.6362e-17 | true |
| 20 | Ipopt | 9.8618083e7 | 601 | 1811520 | 6 | 2.2830e-27 | true |
| 20 | MadNLP | 9.3126375e7 | 907 | 13444416 | 6 | 2.1986e-27 | true |
| 20 | NonlinearSolve (LM) | 6.015040005e8 | 969 | 36394624 | 13 | 2.3705e-21 | true |
| 20 | NonlinearSolve (TrustRegion) | 1.25948875e8 | 471 | 20970320 | 6 | 2.2471e-27 | true |
| 20 | CaNNOLeS | 1.454119209e9 | 548 | 117904720 | 6 | 2.4991e-27 | true |
| 24 | SecondOrderOptimization (Dogleg) | 2.12019084e8 | 460 | 19410928 | 6 | 4.3478e-22 | true |
| 24 | SecondOrderOptimization (LM) | 2.11750375e8 | 458 | 30183376 | 6 | 4.4061e-22 | true |
| 24 | LeastSquaresOptim (Dogleg) | 8.43883583e8 | 608 | 15316560 | 7 | 1.7300e-27 | true |
| 24 | LeastSquaresOptim (LM) | 1.613631084e9 | 930 | 22167312 | 11 | 8.6559e-26 | true |
| 24 | Optim (NewtonTrustRegion) | 7.844280415e8 | 1504 | 291813616 | 10 | 7.3913e-20 | true |
| 24 | Optim (Newton) | 2.10710667e8 | 539 | 8360512 | 6 | 4.3499e-22 | true |
| 24 | JSOSolvers (trunk) | 4.94964e8 | 1386 | 6364496 | 16 | 9.1900e-17 | false |
| 24 | JSOSolvers (tron) | 5.159290835e8 | 760 | 3867280 | 9 | 4.3392e-18 | true |
| 24 | Ipopt | 2.45010125e8 | 706 | 2574528 | 6 | 4.3478e-22 | true |
| 24 | MadNLP | 2.409837705e8 | 1024 | 26163872 | 6 | 4.3506e-22 | true |
| 24 | NonlinearSolve (LM) | 1.709593625e9 | 1170 | 68455488 | 14 | 6.9072e-18 | true |
| 24 | NonlinearSolve (TrustRegion) | 3.25408083e8 | 561 | 40797776 | 6 | 4.3483e-22 | true |
| 24 | CaNNOLeS | 1.5269793917e10 | 653 | 258188240 | 6 | 3.3894e-21 | true |
| 28 | SecondOrderOptimization (Dogleg) | 5.020444165e8 | 586 | 34448112 | 6 | 6.4252e-20 | true |
| 28 | SecondOrderOptimization (LM) | 5.403241045e8 | 584 | 44989136 | 6 | 6.4928e-20 | true |
| 28 | LeastSquaresOptim (Dogleg) | 2.042900833e9 | 734 | 26100160 | 7 | 2.6663e-27 | true |
| 28 | LeastSquaresOptim (LM) | 3.92153525e9 | 1128 | 34565824 | 11 | 2.2506e-21 | true |
| 28 | Optim (NewtonTrustRegion) | 1.871065e9 | 1702 | 489693168 | 10 | 1.5929e-21 | true |
| 28 | Optim (Newton) | 5.090861455e8 | 665 | 14074784 | 6 | 6.4248e-20 | true |
| 28 | JSOSolvers (trunk) | 1.138328833e9 | 1590 | 9621920 | 18 | 4.9691e-17 | true |
| 28 | JSOSolvers (tron) | 1.132905e9 | 940 | 5264544 | 9 | 1.9849e-18 | true |
| 28 | Ipopt | 5.621824165e8 | 832 | 3496896 | 6 | 6.4252e-20 | true |
| 28 | MadNLP | 5.55955104e8 | 1150 | 67101232 | 6 | 6.4250e-20 | true |
| 28 | NonlinearSolve (LM) | 4.097597167e9 | 1386 | 118536256 | 14 | 4.3998e-18 | true |
| 28 | NonlinearSolve (TrustRegion) | 8.203287085e8 | 669 | 72870992 | 6 | 6.4250e-20 | true |
| 28 | CaNNOLeS | 3.2342080834e10 | 700 | 487901632 | 5 | 1.6868e-08 | false |
| 32 | SecondOrderOptimization (Dogleg) | 1.043982667e9 | 726 | 56974576 | 6 | 4.4334e-27 | true |
| 32 | SecondOrderOptimization (LM) | 1.032601917e9 | 724 | 74819792 | 6 | 4.7367e-27 | true |
| 32 | LeastSquaresOptim (Dogleg) | 4.675884375e9 | 874 | 41869472 | 7 | 3.1831e-27 | true |
| 32 | LeastSquaresOptim (LM) | 8.58326325e9 | 1348 | 54865440 | 11 | 4.0982e-22 | true |
| 32 | Optim (NewtonTrustRegion) | 4.177944875e9 | 2116 | 924300368 | 11 | 3.5175e-27 | true |
| 32 | Optim (Newton) | 1.061608167e9 | 805 | 22386208 | 6 | 4.2413e-27 | true |
| 32 | JSOSolvers (trunk) | 2.386739417e9 | 1967 | 12334400 | 18 | 7.9618e-17 | true |
| 32 | JSOSolvers (tron) | 2.516143416e9 | 1240 | 7379440 | 10 | 1.0315e-18 | true |
| 32 | Ipopt | 1.159818958e9 | 972 | 4490688 | 6 | 4.7888e-27 | true |
| 32 | MadNLP | 1.133252708e9 | 1290 | 89811792 | 6 | 4.1896e-27 | true |
| 32 | NonlinearSolve (LM) | 1.0683189125e10 | 1885 | 197746016 | 17 | 4.8201e-22 | true |
| 32 | NonlinearSolve (TrustRegion) | 1.714117666e9 | 789 | 111995984 | 6 | 4.5072e-27 | true |
| 32 | CaNNOLeS | 4.3432688042e10 | 622 | 793196448 | 3 | 3.4751e+00 | false |
