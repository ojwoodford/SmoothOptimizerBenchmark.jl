# Benchmark Results: Dense Affine Alignment

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T12:11:07
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 8d8728c

---

## Model Evaluation Scaling

This problem uses `Standalone` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on standard target model: `Standalone` (`NLLSModel + SecondOrderOptimization` entries run natively on `NLLSModel` from a cold start).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 1 | SecondOrderOptimization (Dogleg) | 3000.0 | 53 | 10880 | 2 | 6.1630e-33 | true |
| 1 | SecondOrderOptimization (LM) | 3333.0 | 53 | 9968 | 2 | 1.1986e-26 | true |
| 1 | LeastSquaresOptim (Dogleg) | 5312.5 | 107 | 161952 | 3 | 6.1630e-33 | true |
| 1 | LeastSquaresOptim (LM) | 15833.0 | 184 | 321904 | 6 | 1.6897e-26 | true |
| 1 | Optim (NewtonTrustRegion) | 4209.0 | 78 | 9136 | 1 | 3.0815e-32 | true |
| 1 | Optim (Newton) | 3875.0 | 67 | 8464 | 1 | 3.0815e-32 | true |
| 1 | JSOSolvers (trunk) | 7084.0 | 109 | 19264 | 4 | 1.2326e-32 | true |
| 1 | JSOSolvers (tron) | 8854.5 | 154 | 16320 | 2 | 2.4652e-32 | true |
| 1 | Ipopt | 330354.0 | 144 | 11712 | 1 | 3.0815e-32 | true |
| 1 | MadNLP | 190146.5 | 562 | 50640 | 1 | 3.0815e-32 | true |
| 1 | NonlinearSolve (LM) | 22937.5 | 284 | 39904 | 7 | 4.7548e-21 | true |
| 1 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1 | CaNNOLeS | 7437.5 | 183 | 16016 | 1 | 3.0815e-32 | true |
| 2 | SecondOrderOptimization (Dogleg) | 15083.5 | 83 | 36880 | 5 | 6.1675e-25 | true |
| 2 | SecondOrderOptimization (LM) | 12354.0 | 80 | 34848 | 5 | 4.6020e-28 | true |
| 2 | LeastSquaresOptim (Dogleg) | 22416.5 | 188 | 345728 | 6 | 1.3066e-30 | true |
| 2 | LeastSquaresOptim (LM) | 34895.5 | 265 | 516992 | 9 | 2.0141e-26 | true |
| 2 | Optim (NewtonTrustRegion) | 37375.5 | 273 | 60992 | 5 | 1.8442e-28 | true |
| 2 | Optim (Newton) | 20083.0 | 151 | 39792 | 5 | 4.8900e-28 | true |
| 2 | JSOSolvers (trunk) | 34437.5 | 159 | 60992 | 9 | 3.5039e-21 | true |
| 2 | JSOSolvers (tron) | 77521.0 | 195 | 48304 | 6 | 2.3227e-17 | true |
| 2 | Ipopt | 556958.5 | 304 | 44608 | 5 | 4.5875e-28 | true |
| 2 | MadNLP | 322145.5 | 602 | 81536 | 5 | 4.4364e-28 | true |
| 2 | NonlinearSolve (LM) | 90750.0 | 372 | 108864 | 11 | 1.1056e-19 | true |
| 2 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2 | CaNNOLeS | 34875.0 | 223 | 60640 | 5 | 4.4295e-28 | true |
| 3 | SecondOrderOptimization (Dogleg) | 34375.0 | 114 | 96496 | 8 | 1.3000e-19 | true |
| 3 | SecondOrderOptimization (LM) | 37187.5 | 108 | 94608 | 8 | 4.0881e-21 | true |
| 3 | LeastSquaresOptim (Dogleg) | 83125.0 | 279 | 574832 | 9 | 1.5346e-30 | true |
| 3 | LeastSquaresOptim (LM) | 84312.5 | 303 | 639040 | 10 | 1.4701e-24 | true |
| 3 | Optim (NewtonTrustRegion) | 135104.0 | 389 | 188960 | 8 | 2.9832e-20 | true |
| 3 | Optim (Newton) | 45062.0 | 214 | 106304 | 8 | 4.0949e-21 | true |
| 3 | JSOSolvers (trunk) | 89312.5 | 190 | 134336 | 12 | 1.9175e-19 | true |
| 3 | JSOSolvers (tron) | 150250.5 | 246 | 129424 | 11 | 4.9719e-18 | true |
| 3 | Ipopt | 836604.5 | 424 | 103168 | 8 | 4.0949e-21 | true |
| 3 | MadNLP | 369042.0 | 632 | 145008 | 8 | 4.0949e-21 | true |
| 3 | NonlinearSolve (LM) | 350499.5 | 507 | 322800 | 19 | 1.5514e-21 | true |
| 3 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 3 | CaNNOLeS | 172583.0 | 270 | 173104 | 8 | 4.0949e-21 | true |
| 4 | SecondOrderOptimization (Dogleg) | 135333.0 | 209 | 238880 | 14 | 4.1908e-30 | true |
| 4 | SecondOrderOptimization (LM) | 169312.5 | 226 | 269056 | 14 | 2.6685e-19 | true |
| 4 | LeastSquaresOptim (Dogleg) | 321999.5 | 537 | 1146608 | 22 | 8.2584e-30 | true |
| 4 | LeastSquaresOptim (LM) | 464146.0 | 663 | 1572576 | 23 | 1.8795e-27 | true |
| 4 | Optim (NewtonTrustRegion) | 473479.0 | 828 | 609136 | 10 | 7.5510e-20 | true |
| 4 | Optim (Newton) | 214583.5 | 532 | 327392 | 19 | 3.9824e-23 | true |
| 4 | JSOSolvers (trunk) | 5.3925958e7 | 82311 | 4747552 | 11 | 8.8233e-17 | false |
| 4 | JSOSolvers (tron) | 505916.5 | 414 | 361856 | 23 | 5.5807e-17 | true |
| 4 | Ipopt | 1.713229e6 | 871 | 276304 | 15 | 1.1586e-21 | true |
| 4 | MadNLP | 769979.0 | 761 | 322992 | 15 | 1.1585e-21 | true |
| 4 | NonlinearSolve (LM) | 2.0702125e7 | 10821 | 11381520 | 500 | 1.0115e+00 | false |
| 4 | NonlinearSolve (TrustRegion) | 403562.5 | 442 | 430752 | 19 | 7.2488e-24 | true |
| 4 | CaNNOLeS | 802874.5 | 356 | 426608 | 13 | 8.9437e-29 | true |
| 6 | SecondOrderOptimization (Dogleg) | 376833.0 | 153 | 342176 | 8 | 4.9737e-25 | true |
| 6 | SecondOrderOptimization (LM) | 318895.5 | 135 | 337392 | 7 | 3.0913e-29 | true |
| 6 | LeastSquaresOptim (Dogleg) | 868478.5 | 283 | 790608 | 8 | 1.3337e-29 | true |
| 6 | LeastSquaresOptim (LM) | 1.2389795e6 | 343 | 989952 | 10 | 1.4854e-24 | true |
| 6 | Optim (NewtonTrustRegion) | 1.738812e6 | 635 | 1312480 | 9 | 1.9574e-29 | true |
| 6 | Optim (Newton) | 349937.0 | 227 | 274272 | 7 | 1.9081e-29 | true |
| 6 | JSOSolvers (trunk) | 1.152041e6 | 523 | 437520 | 13 | 7.2811e-17 | false |
| 6 | JSOSolvers (tron) | 871291.5 | 265 | 310080 | 9 | 6.7945e-19 | true |
| 6 | Ipopt | 1.212125e6 | 416 | 245440 | 7 | 1.7478e-29 | true |
| 6 | MadNLP | 759167.0 | 678 | 413456 | 7 | 1.2449e-29 | true |
| 6 | NonlinearSolve (LM) | 2.6215625e6 | 528 | 1391072 | 14 | 6.7856e-22 | true |
| 6 | NonlinearSolve (TrustRegion) | 743645.5 | 289 | 630192 | 8 | 2.3148e-29 | true |
| 6 | CaNNOLeS | 2.550125e6 | 300 | 1306256 | 7 | 2.1373e-29 | true |
| 8 | SecondOrderOptimization (Dogleg) | 1.036771e6 | 163 | 616288 | 7 | 1.0038e-28 | true |
| 8 | SecondOrderOptimization (LM) | 914375.0 | 144 | 665280 | 6 | 6.9767e-26 | true |
| 8 | LeastSquaresOptim (Dogleg) | 2.7344585e6 | 275 | 982384 | 7 | 3.7175e-29 | true |
| 8 | LeastSquaresOptim (LM) | 4.432562e6 | 341 | 1266416 | 9 | 6.0108e-22 | true |
| 8 | Optim (NewtonTrustRegion) | 3.6973955e6 | 447 | 2168160 | 7 | 3.8950e-29 | true |
| 8 | Optim (Newton) | 969938.0 | 223 | 433760 | 6 | 6.7361e-26 | true |
| 8 | JSOSolvers (trunk) | 2.662104e6 | 287 | 614512 | 12 | 3.4005e-17 | true |
| 8 | JSOSolvers (tron) | 3.6870415e6 | 302 | 487408 | 9 | 4.6727e-17 | true |
| 8 | Ipopt | 1.9447085e6 | 393 | 333392 | 6 | 6.5895e-26 | true |
| 8 | MadNLP | 1.497312e6 | 685 | 769744 | 6 | 6.6360e-26 | true |
| 8 | NonlinearSolve (LM) | 6.992354e6 | 546 | 2578608 | 12 | 3.2827e-20 | true |
| 8 | NonlinearSolve (TrustRegion) | 1.7073755e6 | 278 | 1083968 | 6 | 3.6932e-20 | true |
| 8 | CaNNOLeS | 9.466375e6 | 329 | 3129344 | 6 | 6.6806e-26 | true |
| 12 | SecondOrderOptimization (Dogleg) | 6.8535205e6 | 222 | 1897504 | 8 | 1.9189e-28 | true |
| 12 | SecondOrderOptimization (LM) | 6.1188125e6 | 193 | 2188480 | 6 | 2.2266e-28 | true |
| 12 | LeastSquaresOptim (Dogleg) | 2.33486045e7 | 331 | 2142320 | 7 | 2.1289e-28 | true |
| 12 | LeastSquaresOptim (LM) | 4.04984585e7 | 456 | 2936128 | 10 | 5.6439e-24 | true |
| 12 | Optim (NewtonTrustRegion) | 2.6016375e7 | 802 | 15060768 | 9 | 6.1614e-24 | true |
| 12 | Optim (Newton) | 6.154313e6 | 272 | 1089056 | 6 | 1.6004e-28 | true |
| 12 | JSOSolvers (trunk) | 1.7673416e7 | 697 | 1510592 | 14 | 7.3466e-17 | false |
| 12 | JSOSolvers (tron) | 1.72436045e7 | 372 | 1027760 | 9 | 1.2153e-17 | true |
| 12 | Ipopt | 8.634771e6 | 442 | 690992 | 6 | 1.8094e-28 | true |
| 12 | MadNLP | 7.618479e6 | 734 | 2435008 | 6 | 1.7197e-28 | true |
| 12 | NonlinearSolve (LM) | 4.84764165e7 | 684 | 7697440 | 14 | 1.8307e-20 | true |
| 12 | NonlinearSolve (TrustRegion) | 9.9841875e6 | 320 | 3456480 | 6 | 2.5253e-28 | true |
| 12 | CaNNOLeS | 7.42223955e7 | 383 | 13436368 | 6 | 1.7020e-28 | true |
| 16 | SecondOrderOptimization (Dogleg) | 3.3328313e7 | 342 | 4968160 | 9 | 4.9856e-28 | true |
| 16 | SecondOrderOptimization (LM) | 2.9732e7 | 300 | 6005104 | 7 | 6.1689e-28 | true |
| 16 | LeastSquaresOptim (Dogleg) | 1.313831875e8 | 484 | 4734656 | 10 | 6.6619e-28 | true |
| 16 | LeastSquaresOptim (LM) | 2.09199084e8 | 688 | 6571840 | 12 | 2.3284e-21 | true |
| 16 | Optim (NewtonTrustRegion) | 1.54984875e8 | 1780 | 91270464 | 14 | 6.0911e-20 | true |
| 16 | Optim (Newton) | 3.0043291e7 | 395 | 2583936 | 7 | 6.0782e-28 | true |
| 16 | JSOSolvers (trunk) | 1.00656e8 | 769 | 3427024 | 19 | 7.0921e-17 | true |
| 16 | JSOSolvers (tron) | 1.04188146e8 | 593 | 2282288 | 12 | 1.2439e-17 | true |
| 16 | Ipopt | 3.9034e7 | 581 | 1361840 | 7 | 5.7469e-28 | true |
| 16 | MadNLP | 3.59374165e7 | 857 | 6550720 | 7 | 5.5062e-28 | true |
| 16 | NonlinearSolve (LM) | 2.21015875e8 | 900 | 18423920 | 15 | 4.8064e-20 | true |
| 16 | NonlinearSolve (TrustRegion) | 5.0119042e7 | 442 | 9201808 | 7 | 5.1749e-28 | true |
| 16 | CaNNOLeS | 3.81673208e8 | 461 | 41259856 | 6 | 4.2658e-16 | true |
| 20 | SecondOrderOptimization (Dogleg) | 9.503475e7 | 403 | 10312752 | 8 | 6.4726e-28 | true |
| 20 | SecondOrderOptimization (LM) | 8.3971666e7 | 351 | 12900608 | 6 | 2.6691e-27 | true |
| 20 | LeastSquaresOptim (Dogleg) | 3.21971854e8 | 503 | 8480496 | 7 | 6.8355e-28 | true |
| 20 | LeastSquaresOptim (LM) | 6.283360625e8 | 765 | 11615536 | 11 | 3.7237e-26 | true |
| 20 | Optim (NewtonTrustRegion) | 2.83752167e8 | 1107 | 101340208 | 9 | 3.6931e-22 | true |
| 20 | Optim (Newton) | 8.49694585e7 | 434 | 4675488 | 6 | 2.4072e-27 | true |
| 20 | JSOSolvers (trunk) | 2.09558042e8 | 1083 | 4221728 | 15 | 8.1386e-17 | false |
| 20 | JSOSolvers (tron) | 2.523334165e8 | 657 | 2972704 | 10 | 4.6362e-17 | true |
| 20 | Ipopt | 1.012515625e8 | 601 | 1811520 | 6 | 2.2830e-27 | true |
| 20 | MadNLP | 9.73539995e7 | 907 | 13444416 | 6 | 2.1986e-27 | true |
| 20 | NonlinearSolve (LM) | 6.114571665e8 | 969 | 36394624 | 13 | 2.3705e-21 | true |
| 20 | NonlinearSolve (TrustRegion) | 1.28660292e8 | 471 | 19561296 | 6 | 2.2471e-27 | true |
| 20 | CaNNOLeS | 1.445793125e9 | 545 | 99554640 | 6 | 2.4991e-27 | true |
| 24 | SecondOrderOptimization (Dogleg) | 2.39449188e8 | 523 | 29261360 | 8 | 1.6349e-27 | true |
| 24 | SecondOrderOptimization (LM) | 2.1147025e8 | 456 | 39669632 | 6 | 4.4061e-22 | true |
| 24 | LeastSquaresOptim (Dogleg) | 8.419865625e8 | 608 | 15316560 | 7 | 1.7300e-27 | true |
| 24 | LeastSquaresOptim (LM) | 1.622077792e9 | 930 | 22167312 | 11 | 8.6559e-26 | true |
| 24 | Optim (NewtonTrustRegion) | 8.183973545e8 | 1504 | 414759152 | 10 | 7.3913e-20 | true |
| 24 | Optim (Newton) | 2.10964834e8 | 539 | 10867264 | 6 | 4.3499e-22 | true |
| 24 | JSOSolvers (trunk) | 5.00976583e8 | 1387 | 6364784 | 16 | 9.1900e-17 | false |
| 24 | JSOSolvers (tron) | 5.208317495e8 | 760 | 3867280 | 9 | 4.3392e-18 | true |
| 24 | Ipopt | 2.4260725e8 | 706 | 2574528 | 6 | 4.3478e-22 | true |
| 24 | MadNLP | 2.44471125e8 | 1024 | 26163872 | 6 | 4.3506e-22 | true |
| 24 | NonlinearSolve (LM) | 1.672160667e9 | 1170 | 77696064 | 14 | 6.9072e-18 | true |
| 24 | NonlinearSolve (TrustRegion) | 3.40265709e8 | 561 | 37914192 | 6 | 4.3483e-22 | true |
| 24 | CaNNOLeS | 1.5292735833e10 | 650 | 240608208 | 6 | 3.3894e-21 | true |
| 28 | SecondOrderOptimization (Dogleg) | 6.18156625e8 | 745 | 46985504 | 8 | 4.7742e-27 | true |
| 28 | SecondOrderOptimization (LM) | 4.949777285e8 | 582 | 56769152 | 6 | 6.4928e-20 | true |
| 28 | LeastSquaresOptim (Dogleg) | 2.015487875e9 | 734 | 37421504 | 7 | 2.6663e-27 | true |
| 28 | LeastSquaresOptim (LM) | 3.794844667e9 | 1128 | 41201344 | 11 | 2.2506e-21 | true |
| 28 | Optim (NewtonTrustRegion) | 1.829153959e9 | 1702 | 499965936 | 10 | 1.5929e-21 | true |
| 28 | Optim (Newton) | 4.85454416e8 | 665 | 14304160 | 6 | 6.4248e-20 | true |
| 28 | JSOSolvers (trunk) | 1.147525875e9 | 1590 | 9621920 | 18 | 4.9691e-17 | true |
| 28 | JSOSolvers (tron) | 1.117754333e9 | 940 | 5264544 | 9 | 1.9849e-18 | true |
| 28 | Ipopt | 5.488202085e8 | 832 | 3496896 | 6 | 6.4252e-20 | true |
| 28 | MadNLP | 5.770726455e8 | 1150 | 46588464 | 6 | 6.4250e-20 | true |
| 28 | NonlinearSolve (LM) | 4.155061209e9 | 1386 | 143128640 | 14 | 4.3998e-18 | true |
| 28 | NonlinearSolve (TrustRegion) | 7.916738545e8 | 669 | 72870992 | 6 | 6.4250e-20 | true |
| 28 | CaNNOLeS | 3.1767061917e10 | 697 | 449120704 | 5 | 1.6868e-08 | false |
| 32 | SecondOrderOptimization (Dogleg) | 1.181882791e9 | 827 | 85297712 | 8 | 3.6863e-27 | true |
| 32 | SecondOrderOptimization (LM) | 1.030545875e9 | 722 | 109111424 | 6 | 4.7367e-27 | true |
| 32 | LeastSquaresOptim (Dogleg) | 4.712802166e9 | 874 | 41869472 | 7 | 3.1831e-27 | true |
| 32 | LeastSquaresOptim (LM) | 8.465508916e9 | 1348 | 69365280 | 11 | 4.0982e-22 | true |
| 32 | Optim (NewtonTrustRegion) | 4.174276834e9 | 2116 | 946238544 | 11 | 3.5175e-27 | true |
| 32 | Optim (Newton) | 1.032000792e9 | 805 | 22386208 | 6 | 4.2413e-27 | true |
| 32 | JSOSolvers (trunk) | 2.372785333e9 | 1967 | 12334400 | 18 | 7.9618e-17 | true |
| 32 | JSOSolvers (tron) | 2.497547875e9 | 1240 | 7379440 | 10 | 1.0315e-18 | true |
| 32 | Ipopt | 1.139636792e9 | 972 | 4490688 | 6 | 4.7888e-27 | true |
| 32 | MadNLP | 1.18857225e9 | 1290 | 91450192 | 6 | 4.1896e-27 | true |
| 32 | NonlinearSolve (LM) | 1.0891974125e10 | 1885 | 251845984 | 17 | 4.8201e-22 | true |
| 32 | NonlinearSolve (TrustRegion) | 1.684346291e9 | 789 | 169454672 | 6 | 4.5072e-27 | true |
| 32 | CaNNOLeS | 4.3068994458e10 | 619 | 772634528 | 3 | 3.4751e+00 | false |
