# Benchmark Results: Dense Affine Alignment

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T21:06:41
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b448285

---

## Model Evaluation Scaling

This problem uses `Standalone` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 1 | SecondOrderOptimization (Dogleg) | 3500.0 | 53 | 10880 | 2 | 6.1630e-33 | true |
| 1 | SecondOrderOptimization (LM) | 3896.0 | 53 | 9968 | 2 | 1.1986e-26 | true |
| 1 | LeastSquaresOptim (Dogleg) | 6250.0 | 107 | 161952 | 3 | 6.1630e-33 | true |
| 1 | LeastSquaresOptim (LM) | 10209.0 | 184 | 321904 | 6 | 1.6897e-26 | true |
| 1 | Optim (NewtonTrustRegion) | 5125.0 | 78 | 9136 | 1 | 3.0815e-32 | true |
| 1 | Optim (Newton) | 4833.0 | 67 | 8464 | 1 | 3.0815e-32 | true |
| 1 | JSOSolvers (trunk) | 8812.0 | 109 | 19264 | 4 | 1.2326e-32 | true |
| 1 | JSOSolvers (tron) | 10875.0 | 154 | 16320 | 2 | 2.4652e-32 | true |
| 1 | Ipopt | 313604.0 | 144 | 11712 | 1 | 3.0815e-32 | true |
| 1 | MadNLP | 205938.0 | 562 | 50640 | 1 | 3.0815e-32 | true |
| 1 | NonlinearSolve (LM) | 25750.0 | 284 | 39904 | 7 | 4.7548e-21 | true |
| 1 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1 | CaNNOLeS | 9562.5 | 186 | 16624 | 1 | 3.0815e-32 | true |
| 2 | SecondOrderOptimization (Dogleg) | 11979.0 | 83 | 36880 | 5 | 6.1675e-25 | true |
| 2 | SecondOrderOptimization (LM) | 14229.0 | 80 | 34848 | 5 | 4.6020e-28 | true |
| 2 | LeastSquaresOptim (Dogleg) | 26208.5 | 188 | 345728 | 6 | 1.3066e-30 | true |
| 2 | LeastSquaresOptim (LM) | 40208.5 | 265 | 516992 | 9 | 2.0141e-26 | true |
| 2 | Optim (NewtonTrustRegion) | 46728.5 | 273 | 60992 | 5 | 1.8442e-28 | true |
| 2 | Optim (Newton) | 22292.0 | 151 | 39792 | 5 | 4.8900e-28 | true |
| 2 | JSOSolvers (trunk) | 33604.5 | 159 | 60992 | 9 | 3.5039e-21 | true |
| 2 | JSOSolvers (tron) | 74458.5 | 195 | 48304 | 6 | 2.3227e-17 | true |
| 2 | Ipopt | 562395.5 | 304 | 44608 | 5 | 4.5875e-28 | true |
| 2 | MadNLP | 270062.0 | 602 | 81536 | 5 | 4.4364e-28 | true |
| 2 | NonlinearSolve (LM) | 87500.5 | 372 | 108864 | 11 | 1.1056e-19 | true |
| 2 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2 | CaNNOLeS | 35687.0 | 226 | 64096 | 5 | 4.4295e-28 | true |
| 3 | SecondOrderOptimization (Dogleg) | 33145.5 | 114 | 96496 | 8 | 1.3000e-19 | true |
| 3 | SecondOrderOptimization (LM) | 40312.5 | 108 | 94608 | 8 | 4.0881e-21 | true |
| 3 | LeastSquaresOptim (Dogleg) | 80063.0 | 279 | 574832 | 9 | 1.5346e-30 | true |
| 3 | LeastSquaresOptim (LM) | 86458.0 | 303 | 639040 | 10 | 1.4701e-24 | true |
| 3 | Optim (NewtonTrustRegion) | 150041.5 | 389 | 188960 | 8 | 2.9832e-20 | true |
| 3 | Optim (Newton) | 53229.5 | 214 | 106304 | 8 | 4.0949e-21 | true |
| 3 | JSOSolvers (trunk) | 106187.5 | 190 | 134336 | 12 | 1.9175e-19 | true |
| 3 | JSOSolvers (tron) | 168208.5 | 246 | 129424 | 11 | 4.9719e-18 | true |
| 3 | Ipopt | 756625.0 | 424 | 103168 | 8 | 4.0949e-21 | true |
| 3 | MadNLP | 367771.0 | 632 | 145008 | 8 | 4.0949e-21 | true |
| 3 | NonlinearSolve (LM) | 367208.0 | 507 | 322800 | 19 | 1.5514e-21 | true |
| 3 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 3 | CaNNOLeS | 171812.5 | 273 | 186160 | 8 | 4.0949e-21 | true |
| 4 | SecondOrderOptimization (Dogleg) | 137854.0 | 209 | 238880 | 14 | 4.1908e-30 | true |
| 4 | SecondOrderOptimization (LM) | 160667.0 | 226 | 269056 | 14 | 2.6685e-19 | true |
| 4 | LeastSquaresOptim (Dogleg) | 325458.0 | 537 | 1146608 | 22 | 8.2584e-30 | true |
| 4 | LeastSquaresOptim (LM) | 469979.5 | 663 | 1572576 | 23 | 1.8795e-27 | true |
| 4 | Optim (NewtonTrustRegion) | 494645.5 | 828 | 609136 | 10 | 7.5510e-20 | true |
| 4 | Optim (Newton) | 224021.0 | 532 | 327392 | 19 | 3.9824e-23 | true |
| 4 | JSOSolvers (trunk) | 443000.0 | 474 | 202592 | 11 | 8.8233e-17 | false |
| 4 | JSOSolvers (tron) | 512166.5 | 414 | 361856 | 23 | 5.5807e-17 | true |
| 4 | Ipopt | 1.618146e6 | 871 | 276304 | 15 | 1.1586e-21 | true |
| 4 | MadNLP | 778083.5 | 761 | 322992 | 15 | 1.1585e-21 | true |
| 4 | NonlinearSolve (LM) | 2.0788542e7 | 10821 | 11381520 | 500 | 1.0115e+00 | false |
| 4 | NonlinearSolve (TrustRegion) | 425521.0 | 442 | 430752 | 19 | 7.2488e-24 | true |
| 4 | CaNNOLeS | 787416.5 | 359 | 460912 | 13 | 8.9437e-29 | true |
| 6 | SecondOrderOptimization (Dogleg) | 357291.5 | 153 | 342176 | 8 | 4.9737e-25 | true |
| 6 | SecondOrderOptimization (LM) | 320145.5 | 135 | 337392 | 7 | 3.0913e-29 | true |
| 6 | LeastSquaresOptim (Dogleg) | 882937.0 | 283 | 790608 | 8 | 1.3337e-29 | true |
| 6 | LeastSquaresOptim (LM) | 1.2374165e6 | 343 | 989952 | 10 | 1.4854e-24 | true |
| 6 | Optim (NewtonTrustRegion) | 1.779146e6 | 635 | 1312480 | 9 | 1.9574e-29 | true |
| 6 | Optim (Newton) | 353146.0 | 227 | 274272 | 7 | 1.9081e-29 | true |
| 6 | JSOSolvers (trunk) | 1.001292e6 | 523 | 437520 | 13 | 7.2811e-17 | false |
| 6 | JSOSolvers (tron) | 869542.0 | 265 | 310080 | 9 | 6.7945e-19 | true |
| 6 | Ipopt | 1.161042e6 | 416 | 245440 | 7 | 1.7478e-29 | true |
| 6 | MadNLP | 742750.0 | 678 | 413456 | 7 | 1.2449e-29 | true |
| 6 | NonlinearSolve (LM) | 2.6864795e6 | 528 | 1391072 | 14 | 6.7856e-22 | true |
| 6 | NonlinearSolve (TrustRegion) | 735854.0 | 289 | 630192 | 8 | 2.3148e-29 | true |
| 6 | CaNNOLeS | 2.5581665e6 | 303 | 1440400 | 7 | 2.1373e-29 | true |
| 8 | SecondOrderOptimization (Dogleg) | 1.050021e6 | 163 | 616288 | 7 | 1.0038e-28 | true |
| 8 | SecondOrderOptimization (LM) | 941041.5 | 144 | 665280 | 6 | 6.9767e-26 | true |
| 8 | LeastSquaresOptim (Dogleg) | 2.782896e6 | 275 | 982384 | 7 | 3.7175e-29 | true |
| 8 | LeastSquaresOptim (LM) | 4.5435835e6 | 341 | 1266416 | 9 | 6.0108e-22 | true |
| 8 | Optim (NewtonTrustRegion) | 3.76975e6 | 447 | 2168160 | 7 | 3.8950e-29 | true |
| 8 | Optim (Newton) | 1.013937e6 | 223 | 433760 | 6 | 6.7361e-26 | true |
| 8 | JSOSolvers (trunk) | 2.748146e6 | 287 | 614512 | 12 | 3.4005e-17 | true |
| 8 | JSOSolvers (tron) | 3.7788125e6 | 302 | 487408 | 9 | 4.6727e-17 | true |
| 8 | Ipopt | 2.0168955e6 | 393 | 333392 | 6 | 6.5895e-26 | true |
| 8 | MadNLP | 1.5521255e6 | 685 | 769744 | 6 | 6.6360e-26 | true |
| 8 | NonlinearSolve (LM) | 7.049166e6 | 546 | 2578608 | 12 | 3.2827e-20 | true |
| 8 | NonlinearSolve (TrustRegion) | 1.7655625e6 | 278 | 1083968 | 6 | 3.6932e-20 | true |
| 8 | CaNNOLeS | 9.3069795e6 | 332 | 3512320 | 6 | 6.6806e-26 | true |
| 12 | SecondOrderOptimization (Dogleg) | 6.9999375e6 | 222 | 1897504 | 8 | 1.9189e-28 | true |
| 12 | SecondOrderOptimization (LM) | 6.2120415e6 | 193 | 2188480 | 6 | 2.2266e-28 | true |
| 12 | LeastSquaresOptim (Dogleg) | 2.3625167e7 | 331 | 2142320 | 7 | 2.1289e-28 | true |
| 12 | LeastSquaresOptim (LM) | 4.0579666e7 | 456 | 2936128 | 10 | 5.6439e-24 | true |
| 12 | Optim (NewtonTrustRegion) | 2.61599995e7 | 802 | 15060768 | 9 | 6.1614e-24 | true |
| 12 | Optim (Newton) | 6.207396e6 | 272 | 1089056 | 6 | 1.6004e-28 | true |
| 12 | JSOSolvers (trunk) | 1.7642416e7 | 697 | 1510592 | 14 | 7.3466e-17 | false |
| 12 | JSOSolvers (tron) | 1.7433396e7 | 372 | 1027760 | 9 | 1.2153e-17 | true |
| 12 | Ipopt | 8.727104e6 | 442 | 690992 | 6 | 1.8094e-28 | true |
| 12 | MadNLP | 7.6705e6 | 734 | 2435008 | 6 | 1.7197e-28 | true |
| 12 | NonlinearSolve (LM) | 4.9534896e7 | 684 | 7697440 | 14 | 1.8307e-20 | true |
| 12 | NonlinearSolve (TrustRegion) | 1.01299585e7 | 320 | 3456480 | 6 | 2.5253e-28 | true |
| 12 | CaNNOLeS | 7.436875e7 | 386 | 15218128 | 6 | 1.7020e-28 | true |
| 16 | SecondOrderOptimization (Dogleg) | 3.26499585e7 | 342 | 4984544 | 9 | 4.9856e-28 | true |
| 16 | SecondOrderOptimization (LM) | 2.8883021e7 | 300 | 6021488 | 7 | 6.1689e-28 | true |
| 16 | LeastSquaresOptim (Dogleg) | 1.26232813e8 | 484 | 4734656 | 10 | 6.6619e-28 | true |
| 16 | LeastSquaresOptim (LM) | 2.03234833e8 | 688 | 6571840 | 12 | 2.3284e-21 | true |
| 16 | Optim (NewtonTrustRegion) | 1.47192666e8 | 1780 | 91270464 | 14 | 6.0911e-20 | true |
| 16 | Optim (Newton) | 2.914425e7 | 395 | 2583936 | 7 | 6.0782e-28 | true |
| 16 | JSOSolvers (trunk) | 9.8705292e7 | 769 | 3427024 | 19 | 7.0921e-17 | true |
| 16 | JSOSolvers (tron) | 1.02156667e8 | 593 | 2282288 | 12 | 1.2439e-17 | true |
| 16 | Ipopt | 3.70785835e7 | 581 | 1361840 | 7 | 5.7469e-28 | true |
| 16 | MadNLP | 3.4543333e7 | 857 | 6550720 | 7 | 5.5062e-28 | true |
| 16 | NonlinearSolve (LM) | 2.133475e8 | 900 | 18423920 | 15 | 4.8064e-20 | true |
| 16 | NonlinearSolve (TrustRegion) | 4.940325e7 | 442 | 9201808 | 7 | 5.1749e-28 | true |
| 16 | CaNNOLeS | 3.76667709e8 | 464 | 46625616 | 6 | 4.2658e-16 | true |
| 20 | SecondOrderOptimization (Dogleg) | 9.5350417e7 | 403 | 10312752 | 8 | 6.4726e-28 | true |
| 20 | SecondOrderOptimization (LM) | 8.34179165e7 | 351 | 12900608 | 6 | 2.6691e-27 | true |
| 20 | LeastSquaresOptim (Dogleg) | 3.117103955e8 | 503 | 8480496 | 7 | 6.8355e-28 | true |
| 20 | LeastSquaresOptim (LM) | 5.958170005e8 | 765 | 11615536 | 11 | 3.7237e-26 | true |
| 20 | Optim (NewtonTrustRegion) | 2.782304795e8 | 1107 | 101340208 | 9 | 3.6931e-22 | true |
| 20 | Optim (Newton) | 8.0307417e7 | 434 | 4675488 | 6 | 2.4072e-27 | true |
| 20 | JSOSolvers (trunk) | 2.05918166e8 | 1083 | 4221728 | 15 | 8.1386e-17 | false |
| 20 | JSOSolvers (tron) | 2.47670334e8 | 657 | 2972704 | 10 | 4.6362e-17 | true |
| 20 | Ipopt | 9.7366833e7 | 601 | 1811520 | 6 | 2.2830e-27 | true |
| 20 | MadNLP | 9.2593771e7 | 907 | 13444416 | 6 | 2.1986e-27 | true |
| 20 | NonlinearSolve (LM) | 5.93722521e8 | 969 | 36394624 | 13 | 2.3705e-21 | true |
| 20 | NonlinearSolve (TrustRegion) | 1.24306292e8 | 471 | 19561296 | 6 | 2.2471e-27 | true |
| 20 | CaNNOLeS | 1.444677167e9 | 548 | 119297360 | 6 | 2.4991e-27 | true |
| 24 | SecondOrderOptimization (Dogleg) | 2.40019958e8 | 523 | 19775024 | 8 | 1.6349e-27 | true |
| 24 | SecondOrderOptimization (LM) | 2.101495e8 | 456 | 25169792 | 6 | 4.4061e-22 | true |
| 24 | LeastSquaresOptim (Dogleg) | 8.339296455e8 | 608 | 15316560 | 7 | 1.7300e-27 | true |
| 24 | LeastSquaresOptim (LM) | 1.635610583e9 | 930 | 22167312 | 11 | 8.6559e-26 | true |
| 24 | Optim (NewtonTrustRegion) | 7.851773755e8 | 1504 | 269252848 | 10 | 7.3913e-20 | true |
| 24 | Optim (Newton) | 2.113405e8 | 539 | 8360512 | 6 | 4.3499e-22 | true |
| 24 | JSOSolvers (trunk) | 4.97333542e8 | 1386 | 6364496 | 16 | 9.1900e-17 | false |
| 24 | JSOSolvers (tron) | 5.171613335e8 | 760 | 3867280 | 9 | 4.3392e-18 | true |
| 24 | Ipopt | 2.43652459e8 | 706 | 2574528 | 6 | 4.3478e-22 | true |
| 24 | MadNLP | 2.382874375e8 | 1024 | 26163872 | 6 | 4.3506e-22 | true |
| 24 | NonlinearSolve (LM) | 1.691150333e9 | 1170 | 70044736 | 14 | 6.9072e-18 | true |
| 24 | NonlinearSolve (TrustRegion) | 3.242190205e8 | 561 | 37914192 | 6 | 4.3483e-22 | true |
| 24 | CaNNOLeS | 1.4672626417e10 | 653 | 264741840 | 6 | 3.3894e-21 | true |
| 28 | SecondOrderOptimization (Dogleg) | 6.25320104e8 | 745 | 46870816 | 8 | 4.7742e-27 | true |
| 28 | SecondOrderOptimization (LM) | 4.86323792e8 | 582 | 56425088 | 6 | 6.4928e-20 | true |
| 28 | LeastSquaresOptim (Dogleg) | 1.959566417e9 | 734 | 37421504 | 7 | 2.6663e-27 | true |
| 28 | LeastSquaresOptim (LM) | 3.874274917e9 | 1128 | 34565824 | 11 | 2.2506e-21 | true |
| 28 | Optim (NewtonTrustRegion) | 1.83592025e9 | 1702 | 489693168 | 10 | 1.5929e-21 | true |
| 28 | Optim (Newton) | 4.973848335e8 | 665 | 14074784 | 6 | 6.4248e-20 | true |
| 28 | JSOSolvers (trunk) | 1.120896916e9 | 1590 | 9621920 | 18 | 4.9691e-17 | true |
| 28 | JSOSolvers (tron) | 1.103451792e9 | 940 | 5264544 | 9 | 1.9849e-18 | true |
| 28 | Ipopt | 5.53837938e8 | 832 | 3496896 | 6 | 6.4252e-20 | true |
| 28 | MadNLP | 6.00093104e8 | 1150 | 62317104 | 6 | 6.4250e-20 | true |
| 28 | NonlinearSolve (LM) | 3.999595458e9 | 1386 | 137082944 | 14 | 4.3998e-18 | true |
| 28 | NonlinearSolve (TrustRegion) | 7.62548625e8 | 669 | 90057808 | 6 | 6.4250e-20 | true |
| 28 | CaNNOLeS | 3.2307812375e10 | 700 | 523782592 | 5 | 1.6868e-08 | false |
| 32 | SecondOrderOptimization (Dogleg) | 1.256471416e9 | 827 | 59738672 | 8 | 3.6863e-27 | true |
| 32 | SecondOrderOptimization (LM) | 1.049087167e9 | 722 | 76949632 | 6 | 4.7367e-27 | true |
| 32 | LeastSquaresOptim (Dogleg) | 4.853112625e9 | 874 | 41869472 | 7 | 3.1831e-27 | true |
| 32 | LeastSquaresOptim (LM) | 8.660101167e9 | 1348 | 69365280 | 11 | 4.0982e-22 | true |
| 32 | Optim (NewtonTrustRegion) | 4.343431959e9 | 2116 | 928560208 | 11 | 3.5175e-27 | true |
| 32 | Optim (Newton) | 1.119483625e9 | 805 | 22386208 | 6 | 4.2413e-27 | true |
| 32 | JSOSolvers (trunk) | 2.3581365e9 | 1967 | 12334400 | 18 | 7.9618e-17 | true |
| 32 | JSOSolvers (tron) | 2.491105666e9 | 1240 | 7379440 | 10 | 1.0315e-18 | true |
| 32 | Ipopt | 1.205729334e9 | 972 | 4490688 | 6 | 4.7888e-27 | true |
| 32 | MadNLP | 1.20087725e9 | 1290 | 83471184 | 6 | 4.1896e-27 | true |
| 32 | NonlinearSolve (LM) | 1.1167274125e10 | 1885 | 253517152 | 17 | 4.8201e-22 | true |
| 32 | NonlinearSolve (TrustRegion) | 1.712542709e9 | 789 | 146025552 | 6 | 4.5072e-27 | true |
| 32 | CaNNOLeS | 4.3953066583e10 | 622 | 847542176 | 3 | 3.4751e+00 | false |
