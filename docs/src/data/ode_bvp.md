# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-13T01:27:45
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 520587c

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 32 | NLLSModel (Sparse) | 213.10416666666666 | 1 | 16 | 1473.2142857142858 | 1 | 32 |
| 32 | Standalone (Sparse) | 196.25 | 1 | 16 | 2510.375 | 20 | 7856 |
| 32 | NLPModels (MathOptNLSModel) | 5406.25 | 2 | 32 | 12708.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 351.2931034482759 | 1 | 16 | 2976.285714285714 | 1 | 64 |
| 64 | Standalone (Sparse) | 319.87692307692305 | 1 | 16 | 3645.8333333333335 | 20 | 17200 |
| 64 | NLPModels (MathOptNLSModel) | 10750.0 | 2 | 32 | 25167.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 635.7741935483871 | 1 | 16 | 5823.0 | 1 | 64 |
| 128 | Standalone (Sparse) | 570.5833333333334 | 1 | 16 | 7694.666666666667 | 22 | 33584 |
| 128 | NLPModels (MathOptNLSModel) | 21166.0 | 2 | 32 | 50542.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 1208.2941176470588 | 1 | 16 | 11541.0 | 1 | 64 |
| 256 | Standalone (Sparse) | 1074.578947368421 | 1 | 16 | 14584.0 | 24 | 67440 |
| 256 | NLPModels (MathOptNLSModel) | 42083.0 | 2 | 32 | 101167.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 2342.5555555555557 | 1 | 16 | 22667.0 | 1 | 64 |
| 512 | Standalone (Sparse) | 2083.4 | 1 | 16 | 28667.0 | 24 | 134256 |
| 512 | NLPModels (MathOptNLSModel) | 83375.0 | 2 | 32 | 207542.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 4650.0 | 1 | 16 | 49916.0 | 1 | 64 |
| 1024 | Standalone (Sparse) | 4145.75 | 1 | 16 | 59500.0 | 24 | 267920 |
| 1024 | NLPModels (MathOptNLSModel) | 166875.0 | 2 | 32 | 405792.0 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 9222.333333333334 | 1 | 16 | 36708.0 | 2 | 464 |
| 2048 | Standalone (Sparse) | 8694.333333333334 | 1 | 16 | 121375.0 | 25 | 502384 |
| 2048 | NLPModels (MathOptNLSModel) | 387708.0 | 2 | 32 | 1.059709e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 18417.0 | 1 | 16 | 46166.0 | 2 | 464 |
| 4096 | Standalone (Sparse) | 16958.0 | 1 | 16 | 239041.0 | 25 | 1020528 |
| 4096 | NLPModels (MathOptNLSModel) | 1.392041e6 | 2 | 32 | 3.128542e6 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 37042.0 | 1 | 16 | 82292.0 | 2 | 464 |
| 8192 | Standalone (Sparse) | 33209.0 | 1 | 16 | 485584.0 | 25 | 2007664 |
| 8192 | NLPModels (MathOptNLSModel) | 3.660083e6 | 2 | 32 | 9.608125e6 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 73500.0 | 1 | 16 | 156166.0 | 2 | 464 |
| 16384 | Standalone (Sparse) | 65291.0 | 1 | 16 | 999875.0 | 25 | 3981936 |
| 16384 | NLPModels (MathOptNLSModel) | 9.939917e6 | 2 | 32 | 2.9156458e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 148959.0 | 1 | 16 | 302041.0 | 2 | 464 |
| 32768 | Standalone (Sparse) | 130292.0 | 1 | 16 | 1.965416e6 | 25 | 7897712 |
| 32768 | NLPModels (MathOptNLSModel) | 2.67495e7 | 2 | 32 | 7.378575e7 | 5 | 128 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 32 | SecondOrderOptimization (Dogleg) | 29145.5 | 148 | 70944 | 3 | 5.6402e-27 | true |
| 32 | SecondOrderOptimization (LM) | 34292.0 | 144 | 70288 | 4 | 7.9500e-20 | true |
| 32 | LeastSquaresOptim (Dogleg) | 203250.0 | 139 | 22864 | 13 | 1.4747e-11 | true |
| 32 | LeastSquaresOptim (LM) | 355083.0 | 187 | 34496 | 19 | 1.1774e-15 | true |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32 | Optim (Newton) | 97562.0 | 355 | 103392 | 3 | 2.8725e-27 | true |
| 32 | JSOSolvers (trunk) | 509333.0 | 617 | 39760 | 6 | 7.8113e-20 | false |
| 32 | JSOSolvers (tron) | 741291.0 | 716 | 40832 | 4 | 2.2735e-21 | false |
| 32 | Ipopt | 693188.0 | 390 | 30832 | 3 | 3.4854e-63 | true |
| 32 | MadNLP | 304958.5 | 578 | 67344 | 3 | 5.7856e-23 | true |
| 32 | NonlinearSolve (LM) | 500604.5 | 666 | 92912 | 17 | 1.5166e-18 | true |
| 32 | NonlinearSolve (TrustRegion) | 86812.5 | 671 | 76480 | 3 | 1.9509e-19 | true |
| 32 | CaNNOLeS | 51229.5 | 180 | 48880 | 3 | 3.3924e-27 | true |
| 64 | SecondOrderOptimization (Dogleg) | 45583.0 | 227 | 100464 | 3 | 9.0812e-26 | true |
| 64 | SecondOrderOptimization (LM) | 55958.0 | 223 | 99296 | 5 | 1.0959e-18 | true |
| 64 | LeastSquaresOptim (Dogleg) | 2.9416125e7 | 5035 | 2512096 | 500 | 8.4437e-03 | false |
| 64 | LeastSquaresOptim (LM) | 2.6445e6 | 297 | 131872 | 27 | 8.3599e-14 | true |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 64 | Optim (Newton) | 130209.0 | 359 | 203744 | 3 | 1.0023e-25 | true |
| 64 | JSOSolvers (trunk) | 2.640167e6 | 1467 | 84912 | 7 | 5.2143e-22 | false |
| 64 | JSOSolvers (tron) | 7.250375e6 | 3560 | 188624 | 13 | 6.3499e-17 | false |
| 64 | Ipopt | 728666.0 | 338 | 49680 | 2 | 3.8541e-47 | true |
| 64 | MadNLP | 497146.0 | 580 | 87536 | 3 | 1.1280e-22 | true |
| 64 | NonlinearSolve (LM) | 1.7631875e6 | 673 | 214672 | 20 | 3.0467e-21 | true |
| 64 | NonlinearSolve (TrustRegion) | 103791.0 | 678 | 176176 | 3 | 2.4609e-19 | true |
| 64 | CaNNOLeS | 97959.0 | 194 | 97008 | 3 | 9.6264e-26 | true |
| 128 | SecondOrderOptimization (Dogleg) | 105562.5 | 241 | 193392 | 4 | 2.3553e-24 | true |
| 128 | SecondOrderOptimization (LM) | 133333.0 | 235 | 190016 | 7 | 3.5241e-24 | true |
| 128 | LeastSquaresOptim (Dogleg) | 1.03876916e8 | 5035 | 2527168 | 500 | 1.6872e+01 | false |
| 128 | LeastSquaresOptim (LM) | 2.25126209e8 | 5335 | 8514864 | 443 | 1.1009e-09 | true |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 128 | Optim (Newton) | 267354.5 | 477 | 505984 | 4 | 2.9738e-24 | true |
| 128 | JSOSolvers (trunk) | 2.0332166e7 | 4457 | 237680 | 8 | 4.9369e-18 | false |
| 128 | JSOSolvers (tron) | 1.288041583e9 | 259830 | 12503200 | 12 | 1.1094e-16 | false |
| 128 | Ipopt | 968833.0 | 349 | 69744 | 2 | 7.4496e-46 | true |
| 128 | MadNLP | 760854.5 | 591 | 127184 | 3 | 2.2634e-22 | true |
| 128 | NonlinearSolve (LM) | 6.9615625e6 | 693 | 493264 | 22 | 3.6239e-18 | true |
| 128 | NonlinearSolve (TrustRegion) | 122729.5 | 688 | 150288 | 3 | 3.8619e-19 | true |
| 128 | CaNNOLeS | 190604.0 | 217 | 174944 | 3 | 2.6889e-24 | true |
| 256 | SecondOrderOptimization (Dogleg) | 234083.5 | 287 | 383776 | 4 | 1.0706e-22 | true |
| 256 | SecondOrderOptimization (LM) | 294604.0 | 278 | 377424 | 8 | 1.2124e-22 | true |
| 256 | LeastSquaresOptim (Dogleg) | 4.41448083e8 | 11648 | 9821664 | 500 | 8.4444e+01 | false |
| 256 | LeastSquaresOptim (LM) | 9.25897459e8 | 6033 | 9654480 | 500 | 2.5926e+01 | false |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 256 | Optim (Newton) | 413875.5 | 505 | 1004416 | 4 | 8.2267e-23 | true |
| 256 | JSOSolvers (trunk) | 4.127712875e9 | 422824 | 20335344 | 208 | 2.5351e-17 | false |
| 256 | JSOSolvers (tron) | 3.00001695e10 | 3098253 | 148740640 | 62 | 1.7515e-12 | false |
| 256 | Ipopt | 1.470708e6 | 369 | 138704 | 2 | 1.2199e-51 | true |
| 256 | MadNLP | 1.1769375e6 | 621 | 204128 | 3 | 5.0789e-22 | true |
| 256 | NonlinearSolve (LM) | 3.0095959e7 | 744 | 1519824 | 25 | 9.2283e-19 | true |
| 256 | NonlinearSolve (TrustRegion) | 155687.5 | 746 | 290400 | 3 | 6.8203e-19 | true |
| 256 | CaNNOLeS | 350396.0 | 240 | 352864 | 3 | 9.7289e-23 | true |
| 512 | SecondOrderOptimization (Dogleg) | 372146.0 | 287 | 754432 | 4 | 2.5649e-21 | true |
| 512 | SecondOrderOptimization (LM) | 523645.5 | 281 | 746096 | 9 | 4.0273e-21 | true |
| 512 | LeastSquaresOptim (Dogleg) | 1.100761292e9 | 6048 | 9774688 | 500 | 2.0403e+02 | false |
| 512 | LeastSquaresOptim (LM) | 1.186641417e9 | 6125 | 12003088 | 500 | 2.0331e+02 | false |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 512 | Optim (Newton) | 688271.0 | 521 | 1995136 | 4 | 2.5808e-21 | true |
| 512 | JSOSolvers (trunk) | 3.000012275e10 | 1583309 | 76055488 | 388 | 2.3302e+01 | false |
| 512 | JSOSolvers (tron) | 3.0000394166e10 | 1588775 | 76362528 | 17 | 1.0658e+01 | false |
| 512 | Ipopt | 2.352687e6 | 371 | 283760 | 2 | 1.6725e-50 | true |
| 512 | MadNLP | 1.9516665e6 | 633 | 362384 | 3 | 3.4618e-21 | true |
| 512 | NonlinearSolve (LM) | 1.04423e8 | 10024 | 52028624 | 28 | 2.7934e-17 | true |
| 512 | NonlinearSolve (TrustRegion) | 231813.0 | 752 | 581104 | 3 | 1.2830e-18 | true |
| 512 | CaNNOLeS | 689937.5 | 248 | 725728 | 3 | 3.4085e-21 | true |
| 1024 | SecondOrderOptimization (Dogleg) | 648271.0 | 290 | 1573696 | 4 | 9.5650e-20 | true |
| 1024 | SecondOrderOptimization (LM) | 1.194646e6 | 284 | 1557168 | 11 | 8.5848e-20 | true |
| 1024 | LeastSquaresOptim (Dogleg) | 1.772039042e9 | 6108 | 11335456 | 500 | 4.6396e+02 | false |
| 1024 | LeastSquaresOptim (LM) | 2.065548416e9 | 6077 | 10903824 | 500 | 4.6397e+02 | false |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1024 | Optim (Newton) | 1.2093955e6 | 521 | 4205600 | 4 | 8.5372e-20 | true |
| 1024 | JSOSolvers (trunk) | 3.0000444666e10 | 795373 | 38315968 | 99 | 3.9544e+02 | false |
| 1024 | JSOSolvers (tron) | 3.00007095e10 | 788128 | 38028176 | 4 | 4.1356e+02 | false |
| 1024 | Ipopt | 4.6093955e6 | 375 | 454864 | 2 | 1.9886e-46 | true |
| 1024 | MadNLP | 1.4894875e7 | 957 | 682192 | 8 | 9.1699e-20 | false |
| 1024 | NonlinearSolve (LM) | 2.254896125e9 | 56330 | 588935152 | 166 | 6.5760e-16 | true |
| 1024 | NonlinearSolve (TrustRegion) | 1.0091875e6 | 769 | 3160224 | 3 | 2.5744e-18 | true |
| 1024 | CaNNOLeS | 1.484312e6 | 248 | 1405664 | 3 | 8.9525e-20 | true |
| 2048 | SecondOrderOptimization (Dogleg) | 1.5598125e6 | 33198 | 5000480 | 4 | 2.8872e-18 | true |
| 2048 | SecondOrderOptimization (LM) | 2.2251875e6 | 33197 | 4954320 | 12 | 3.1310e-18 | true |
| 2048 | LeastSquaresOptim (Dogleg) | 2.977298834e9 | 6096 | 11472992 | 500 | 9.8231e+02 | false |
| 2048 | LeastSquaresOptim (LM) | 3.654603667e9 | 6053 | 10475920 | 500 | 9.8236e+02 | false |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2048 | Optim (Newton) | 2.372896e6 | 526 | 7774080 | 4 | 2.8565e-18 | true |
| 2048 | JSOSolvers (trunk) | 3.0001255959e10 | 407259 | 19825760 | 27 | 9.0756e+02 | false |
| 2048 | JSOSolvers (tron) | 3.0002081833e10 | 405623 | 19878624 | 2 | 9.2963e+02 | false |
| 2048 | Ipopt | 9.63675e6 | 379 | 915984 | 2 | 3.7204e-44 | true |
| 2048 | MadNLP | 3.4603958e7 | 945 | 1310864 | 8 | 2.9149e-18 | false |
| 2048 | NonlinearSolve (LM) | 8.918065208e9 | 58066 | 1226869360 | 171 | 2.2750e-14 | true |
| 2048 | NonlinearSolve (TrustRegion) | 1.8441665e6 | 955 | 6266944 | 3 | 8.0194e-18 | true |
| 2048 | CaNNOLeS | 3.8685e6 | 250 | 2700032 | 3 | 2.9864e-18 | true |
| 4096 | SecondOrderOptimization (Dogleg) | 2.896333e6 | 65963 | 10038752 | 4 | 9.0408e-17 | true |
| 4096 | SecondOrderOptimization (LM) | 4.683333e6 | 65966 | 9976672 | 13 | 9.6032e-17 | true |
| 4096 | LeastSquaresOptim (Dogleg) | 1.4589775e8 | 80 | 729472 | 2 | 2.0477e+03 | true |
| 4096 | LeastSquaresOptim (LM) | 5.792313875e9 | 5687 | 7927472 | 500 | 2.0119e+03 | false |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 4096 | Optim (Newton) | 4.876646e6 | 582 | 15960832 | 4 | 9.6838e-17 | true |
| 4096 | JSOSolvers (trunk) | 3.0002616041e10 | 150073 | 7759360 | 7 | 1.9485e+03 | false |
| 4096 | JSOSolvers (tron) | 3.0007856458e10 | 146045 | 7828736 | 1 | 1.9640e+03 | false |
| 4096 | Ipopt | 2.228625e7 | 383 | 1846544 | 2 | 0.0000e+00 | true |
| 4096 | MadNLP | 1.0593275e8 | 1037 | 2570096 | 9 | 9.4483e-17 | false |
| 4096 | NonlinearSolve (LM) | 3.0210695917e10 | 755 | 291010832 | 106 | 8.5849e-13 | false |
| 4096 | NonlinearSolve (TrustRegion) | 4.3334208e7 | 2139 | 111084096 | 35 | 9.6297e-17 | true |
| 4096 | CaNNOLeS | 1.04447295e7 | 252 | 5288736 | 3 | 9.9773e-17 | true |
| 8192 | SecondOrderOptimization (Dogleg) | 7.0615205e6 | 131517 | 19854368 | 6 | 3.3009e-15 | true |
| 8192 | SecondOrderOptimization (LM) | 1.0968e7 | 131521 | 19727152 | 16 | 3.0848e-15 | true |
| 8192 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | LeastSquaresOptim (LM) | 2.529458e6 | 53 | 790240 | 1 | 4.0954e+03 | true |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | Optim (Newton) | 1.49735205e7 | 742 | 44575968 | 6 | 3.1978e-15 | true |
| 8192 | JSOSolvers (trunk) | 3.0006483167e10 | 34783 | 2782496 | 3 | 4.0416e+03 | false |
| 8192 | JSOSolvers (tron) | 3.0022746875e10 | 35114 | 3323792 | 1 | 4.0420e+03 | false |
| 8192 | Ipopt | 4.748475e7 | 393 | 3674448 | 2 | 0.0000e+00 | true |
| 8192 | MadNLP | 1.2734630542e10 | 4609 | 5199632 | 500 | 1.3036e-01 | false |
| 8192 | NonlinearSolve (LM) | 3.0370682791e10 | 13376 | 1060837168 | 38 | 3.1470e-11 | false |
| 8192 | NonlinearSolve (TrustRegion) | 8.4080104e7 | 2149 | 210924256 | 35 | 3.0302e-15 | true |
| 8192 | CaNNOLeS | 2.561675e7 | 254 | 10449728 | 3 | 3.1855e-15 | true |
| 16384 | SecondOrderOptimization (Dogleg) | 1.42410625e7 | 262607 | 39426704 | 7 | 4.2624e-13 | true |
| 16384 | SecondOrderOptimization (LM) | 2.34705835e7 | 262613 | 39169216 | 19 | 1.3437e-13 | true |
| 16384 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | LeastSquaresOptim (LM) | 4.8973335e6 | 54 | 1577664 | 1 | 8.1914e+03 | true |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | Optim (Newton) | 3.83631245e7 | 990 | 114533440 | 8 | 1.1880e-13 | true |
| 16384 | JSOSolvers (trunk) | 3.0014888792e10 | 12009 | 2803456 | 3 | 8.1609e+03 | false |
| 16384 | JSOSolvers (tron) | 3.00634795e10 | 12082 | 3857600 | 1 | 8.1609e+03 | false |
| 16384 | Ipopt | 1.03910583e8 | 403 | 7346384 | 2 | 0.0000e+00 | true |
| 16384 | MadNLP | 2.941609275e10 | 4618 | 10189296 | 500 | 4.1475e+00 | false |
| 16384 | NonlinearSolve (LM) | 3.1439044e10 | 3972 | 557546352 | 10 | 8.1849e+03 | false |
| 16384 | NonlinearSolve (TrustRegion) | 1.68714167e8 | 2151 | 411357952 | 35 | 9.5663e-14 | true |
| 16384 | CaNNOLeS | 6.691561042e9 | 1252 | 21081632 | 501 | 1.0151e-13 | false |
| 32768 | SecondOrderOptimization (Dogleg) | 4.0321792e7 | 524764 | 78944896 | 2 | 4.7013e+00 | true |
| 32768 | SecondOrderOptimization (LM) | 5.477859995e8 | 524996 | 78480944 | 132 | 1.3439e-08 | true |
| 32768 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | Optim (Newton) | 8.8247667e7 | 805 | 234449664 | 5 | 5.9465e-08 | false |
| 32768 | JSOSolvers (trunk) | 3.0036017958e10 | 4397 | 4666304 | 3 | 1.6366e+04 | false |
| 32768 | JSOSolvers (tron) | 3.0160556708e10 | 4394 | 6767296 | 1 | 1.6366e+04 | false |
| 32768 | Ipopt | 2.03511041e8 | 407 | 14674192 | 2 | 0.0000e+00 | true |
| 32768 | MadNLP | 3.0037530375e10 | 2618 | 20129200 | 250 | 1.4769e+04 | false |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | CaNNOLeS | 1.3315032792e10 | 1254 | 43839040 | 501 | 3.2323e-12 | false |
