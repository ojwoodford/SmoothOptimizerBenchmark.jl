# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-10T11:10:51
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 4aac5c9

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | NLLSModel (Static) | 317.8709677419355 | 1 | 16 | 1781.25 | 3 | 96 |
| 64 | Standalone | 324.73015873015873 | 1 | 16 | 939.3636363636364 | 1 | 32 |
| 128 | NLLSModel (Static) | 630.8055555555555 | 1 | 16 | 2944.5 | 3 | 96 |
| 128 | Standalone | 574.0833333333334 | 1 | 16 | 1743.0833333333333 | 1 | 32 |
| 256 | NLLSModel (Static) | 1098.6842105263158 | 1 | 16 | 6625.0 | 3 | 96 |
| 256 | Standalone | 1100.842105263158 | 1 | 16 | 3444.5 | 1 | 32 |
| 512 | NLLSModel (Static) | 2150.0 | 1 | 16 | 11959.0 | 3 | 96 |
| 512 | Standalone | 2106.4444444444443 | 1 | 16 | 6708.333333333333 | 1 | 32 |
| 1024 | NLLSModel (Static) | 4225.0 | 1 | 16 | 23750.0 | 3 | 96 |
| 1024 | Standalone | 4450.0 | 1 | 16 | 13875.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 8680.666666666666 | 1 | 16 | 44208.0 | 3 | 96 |
| 2048 | Standalone | 8278.0 | 1 | 16 | 26875.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 17958.0 | 1 | 16 | 90500.0 | 3 | 96 |
| 4096 | Standalone | 16917.0 | 1 | 16 | 58000.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 34958.0 | 1 | 16 | 179917.0 | 3 | 96 |
| 8192 | Standalone | 33917.0 | 1 | 16 | 113250.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 69042.0 | 1 | 16 | 153000.0 | 6 | 752 |
| 16384 | Standalone | 70417.0 | 1 | 16 | 220375.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 133333.0 | 1 | 16 | 472292.0 | 6 | 752 |
| 32768 | Standalone | 136125.0 | 1 | 16 | 468292.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 275042.0 | 1 | 16 | 731125.0 | 6 | 752 |
| 65536 | Standalone | 280208.0 | 1 | 16 | 913750.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 10687.5 | 29 | 1552 | 5 | 1.3405e-02 | true |
| 64 | SecondOrderOptimization (LM) | 9250.0 | 26 | 1616 | 5 | 1.3405e-02 | true |
| 64 | LeastSquaresOptim (Dogleg) | 14833.0 | 115 | 258864 | 5 | 1.3405e-02 | true |
| 64 | LeastSquaresOptim (LM) | 19833.5 | 147 | 360576 | 7 | 1.3405e-02 | true |
| 64 | Optim (NewtonTrustRegion) | 24000.0 | 225 | 15120 | 5 | 1.3405e-02 | true |
| 64 | Optim (Newton) | 18625.0 | 116 | 3840 | 6 | 1.3405e-02 | true |
| 64 | JSOSolvers (trunk) | 19958.0 | 59 | 5824 | 6 | 1.3405e-02 | true |
| 64 | JSOSolvers (tron) | 33375.0 | 124 | 9888 | 7 | 1.3405e-02 | true |
| 64 | Ipopt | 596542.0 | 275 | 11968 | 6 | 1.3405e-02 | true |
| 64 | MadNLP | 295396.0 | 543 | 45056 | 6 | 1.3405e-02 | true |
| 64 | NonlinearSolve (LM) | 506791.5 | 1471 | 219536 | 112 | 1.3405e-02 | true |
| 64 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 64 | CaNNOLeS | 63708.0 | 176 | 65008 | 6 | 1.3405e-02 | true |
| 128 | SecondOrderOptimization (Dogleg) | 19771.0 | 29 | 1552 | 5 | 2.5926e-02 | true |
| 128 | SecondOrderOptimization (LM) | 16917.0 | 26 | 1616 | 5 | 2.5926e-02 | true |
| 128 | LeastSquaresOptim (Dogleg) | 23499.5 | 116 | 261968 | 5 | 2.5926e-02 | true |
| 128 | LeastSquaresOptim (LM) | 33500.0 | 148 | 364160 | 7 | 2.5926e-02 | true |
| 128 | Optim (NewtonTrustRegion) | 24334.0 | 197 | 13024 | 4 | 2.5926e-02 | true |
| 128 | Optim (Newton) | 22167.0 | 103 | 3568 | 5 | 2.5926e-02 | true |
| 128 | JSOSolvers (trunk) | 33937.5 | 59 | 9088 | 7 | 2.5926e-02 | true |
| 128 | JSOSolvers (tron) | 53250.0 | 124 | 13696 | 7 | 2.5926e-02 | true |
| 128 | Ipopt | 525145.5 | 245 | 10720 | 5 | 2.5926e-02 | true |
| 128 | MadNLP | 266292.0 | 543 | 45056 | 5 | 2.5926e-02 | true |
| 128 | NonlinearSolve (LM) | 715458.0 | 1475 | 345904 | 112 | 2.5926e-02 | true |
| 128 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 128 | CaNNOLeS | 94542.0 | 185 | 122864 | 5 | 2.5926e-02 | true |
| 256 | SecondOrderOptimization (Dogleg) | 34916.0 | 29 | 1552 | 5 | 5.5410e-02 | true |
| 256 | SecondOrderOptimization (LM) | 31020.5 | 26 | 1616 | 5 | 5.5410e-02 | true |
| 256 | LeastSquaresOptim (Dogleg) | 38270.5 | 119 | 268016 | 5 | 5.5410e-02 | true |
| 256 | LeastSquaresOptim (LM) | 58750.0 | 169 | 422160 | 8 | 5.5410e-02 | true |
| 256 | Optim (NewtonTrustRegion) | 32979.5 | 197 | 13024 | 4 | 5.5410e-02 | true |
| 256 | Optim (Newton) | 34937.5 | 103 | 3568 | 5 | 5.5410e-02 | true |
| 256 | JSOSolvers (trunk) | 56854.5 | 65 | 15040 | 7 | 5.5410e-02 | true |
| 256 | JSOSolvers (tron) | 78854.5 | 131 | 20640 | 6 | 5.5410e-02 | true |
| 256 | Ipopt | 565771.0 | 245 | 10720 | 5 | 5.5410e-02 | true |
| 256 | MadNLP | 287124.5 | 543 | 45056 | 5 | 5.5410e-02 | true |
| 256 | NonlinearSolve (LM) | 1.174437e6 | 1707 | 706096 | 112 | 5.5410e-02 | true |
| 256 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 256 | CaNNOLeS | 180812.5 | 213 | 246160 | 5 | 5.5410e-02 | true |
| 512 | SecondOrderOptimization (Dogleg) | 67354.5 | 29 | 1552 | 5 | 1.0665e-01 | true |
| 512 | SecondOrderOptimization (LM) | 58854.5 | 26 | 1616 | 5 | 1.0665e-01 | true |
| 512 | LeastSquaresOptim (Dogleg) | 66750.0 | 119 | 280304 | 5 | 1.0665e-01 | true |
| 512 | LeastSquaresOptim (LM) | 90875.0 | 151 | 385056 | 7 | 1.0665e-01 | true |
| 512 | Optim (NewtonTrustRegion) | 58604.5 | 225 | 15120 | 5 | 1.0665e-01 | true |
| 512 | Optim (Newton) | 69812.5 | 116 | 3840 | 6 | 1.0665e-01 | true |
| 512 | JSOSolvers (trunk) | 130354.0 | 67 | 27360 | 9 | 1.0665e-01 | true |
| 512 | JSOSolvers (tron) | 112334.0 | 131 | 34976 | 5 | 1.0665e-01 | true |
| 512 | Ipopt | 637208.5 | 275 | 11968 | 6 | 1.0665e-01 | true |
| 512 | MadNLP | 338687.5 | 543 | 45056 | 6 | 1.0665e-01 | true |
| 512 | NonlinearSolve (LM) | 2.0606875e6 | 1693 | 1314160 | 111 | 1.0665e-01 | true |
| 512 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 512 | CaNNOLeS | 414333.5 | 218 | 485344 | 6 | 1.0665e-01 | true |
| 1024 | SecondOrderOptimization (Dogleg) | 135687.5 | 29 | 1552 | 5 | 2.0673e-01 | true |
| 1024 | SecondOrderOptimization (LM) | 115375.0 | 26 | 1616 | 5 | 2.0673e-01 | true |
| 1024 | LeastSquaresOptim (Dogleg) | 130145.5 | 119 | 304880 | 5 | 2.0673e-01 | true |
| 1024 | LeastSquaresOptim (LM) | 175625.0 | 151 | 412704 | 7 | 2.0673e-01 | true |
| 1024 | Optim (NewtonTrustRegion) | 84062.5 | 197 | 13024 | 4 | 2.0673e-01 | true |
| 1024 | Optim (Newton) | 111167.0 | 103 | 3568 | 5 | 2.0673e-01 | true |
| 1024 | JSOSolvers (trunk) | 3.351583e6 | 334 | 70800 | 320 | 2.0673e-01 | false |
| 1024 | JSOSolvers (tron) | 254791.5 | 131 | 63648 | 6 | 2.0673e-01 | true |
| 1024 | Ipopt | 623978.5 | 245 | 10720 | 5 | 2.0673e-01 | true |
| 1024 | MadNLP | 362166.5 | 543 | 45056 | 5 | 2.0673e-01 | true |
| 1024 | NonlinearSolve (LM) | 4.162e6 | 1707 | 2563120 | 112 | 2.0673e-01 | true |
| 1024 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1024 | CaNNOLeS | 682604.0 | 218 | 1045472 | 5 | 2.0673e-01 | true |
| 2048 | SecondOrderOptimization (Dogleg) | 263187.0 | 29 | 1552 | 5 | 4.1154e-01 | true |
| 2048 | SecondOrderOptimization (LM) | 229687.5 | 26 | 1616 | 5 | 4.1154e-01 | true |
| 2048 | LeastSquaresOptim (Dogleg) | 262146.0 | 119 | 354032 | 5 | 4.1154e-01 | true |
| 2048 | LeastSquaresOptim (LM) | 336083.5 | 151 | 476192 | 7 | 4.1154e-01 | true |
| 2048 | Optim (NewtonTrustRegion) | 186292.0 | 225 | 15120 | 5 | 4.1154e-01 | true |
| 2048 | Optim (Newton) | 250646.0 | 116 | 3840 | 6 | 4.1154e-01 | true |
| 2048 | JSOSolvers (trunk) | 282125.0 | 67 | 101088 | 5 | 4.1154e-01 | true |
| 2048 | JSOSolvers (tron) | 2.492625e6 | 303 | 134128 | 24 | 4.1154e-01 | false |
| 2048 | Ipopt | 826833.5 | 275 | 11968 | 6 | 4.1154e-01 | true |
| 2048 | MadNLP | 470354.5 | 543 | 45056 | 5 | 4.1154e-01 | true |
| 2048 | NonlinearSolve (LM) | 8.1294165e6 | 1707 | 5063728 | 112 | 4.1154e-01 | true |
| 2048 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2048 | CaNNOLeS | 1.5603335e6 | 218 | 1919968 | 6 | 4.1154e-01 | true |
| 4096 | SecondOrderOptimization (Dogleg) | 525000.0 | 29 | 1552 | 5 | 8.3061e-01 | true |
| 4096 | SecondOrderOptimization (LM) | 460042.0 | 26 | 1616 | 5 | 8.3061e-01 | true |
| 4096 | LeastSquaresOptim (Dogleg) | 497833.0 | 119 | 452336 | 5 | 8.3061e-01 | true |
| 4096 | LeastSquaresOptim (LM) | 664124.5 | 151 | 586784 | 7 | 8.3061e-01 | true |
| 4096 | Optim (NewtonTrustRegion) | 350583.0 | 225 | 15120 | 5 | 8.3061e-01 | true |
| 4096 | Optim (Newton) | 421708.5 | 103 | 3568 | 5 | 8.3061e-01 | true |
| 4096 | JSOSolvers (trunk) | 1.4455167e7 | 334 | 218256 | 328 | 8.3061e-01 | false |
| 4096 | JSOSolvers (tron) | 5.631125e6 | 303 | 248816 | 28 | 8.3061e-01 | false |
| 4096 | Ipopt | 927145.5 | 245 | 10720 | 5 | 8.3061e-01 | true |
| 4096 | MadNLP | 667520.5 | 543 | 45056 | 5 | 8.3061e-01 | true |
| 4096 | NonlinearSolve (LM) | 1.54999585e7 | 1707 | 11850800 | 112 | 8.3061e-01 | true |
| 4096 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 4096 | CaNNOLeS | 2.704125e6 | 218 | 3775456 | 5 | 8.3061e-01 | true |
| 8192 | SecondOrderOptimization (Dogleg) | 1.049417e6 | 29 | 1552 | 5 | 1.6555e+00 | true |
| 8192 | SecondOrderOptimization (LM) | 924103.5 | 26 | 1616 | 5 | 1.6555e+00 | true |
| 8192 | LeastSquaresOptim (Dogleg) | 1.0603545e6 | 119 | 648944 | 5 | 1.6555e+00 | true |
| 8192 | LeastSquaresOptim (LM) | 1.4149795e6 | 151 | 783392 | 7 | 1.6555e+00 | true |
| 8192 | Optim (NewtonTrustRegion) | 570916.5 | 197 | 13024 | 4 | 1.6555e+00 | true |
| 8192 | Optim (Newton) | 981833.5 | 116 | 3840 | 6 | 1.6555e+00 | true |
| 8192 | JSOSolvers (trunk) | 2.8607833e7 | 334 | 414864 | 329 | 1.6555e+00 | false |
| 8192 | JSOSolvers (tron) | 2.31725e6 | 131 | 465056 | 7 | 1.6555e+00 | true |
| 8192 | Ipopt | 1.5541045e6 | 275 | 11968 | 6 | 1.6555e+00 | true |
| 8192 | MadNLP | 1.087125e6 | 543 | 45056 | 5 | 1.6555e+00 | true |
| 8192 | NonlinearSolve (LM) | 2.9507208e7 | 1707 | 19846192 | 112 | 1.6555e+00 | true |
| 8192 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 8192 | CaNNOLeS | 6.435083e6 | 218 | 7019488 | 6 | 1.6555e+00 | true |
| 16384 | SecondOrderOptimization (Dogleg) | 405500.0 | 50 | 4144 | 1 | 5.8081e+01 | false |
| 16384 | SecondOrderOptimization (LM) | 661646.0 | 66 | 6432 | 5 | 3.3011e+00 | true |
| 16384 | LeastSquaresOptim (Dogleg) | 2.2442085e6 | 119 | 1042160 | 5 | 3.3011e+00 | true |
| 16384 | LeastSquaresOptim (LM) | 2.893521e6 | 151 | 1176608 | 7 | 3.3011e+00 | true |
| 16384 | Optim (NewtonTrustRegion) | 1.1413955e6 | 197 | 13024 | 4 | 3.3011e+00 | true |
| 16384 | Optim (Newton) | 2.2352085e6 | 136 | 4224 | 6 | 3.3011e+00 | true |
| 16384 | JSOSolvers (trunk) | 5.6682708e7 | 334 | 808080 | 321 | 3.3011e+00 | false |
| 16384 | JSOSolvers (tron) | 1.8711542e7 | 303 | 936944 | 21 | 3.3011e+00 | false |
| 16384 | Ipopt | 2.5590625e6 | 275 | 11968 | 6 | 3.3011e+00 | true |
| 16384 | MadNLP | 1.9415625e6 | 543 | 45056 | 5 | 3.3011e+00 | true |
| 16384 | NonlinearSolve (LM) | 5.8116583e7 | 1707 | 35836976 | 112 | 3.3011e+00 | true |
| 16384 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 16384 | CaNNOLeS | 1.2893208e7 | 218 | 13523936 | 6 | 3.3011e+00 | true |
| 32768 | SecondOrderOptimization (Dogleg) | 1.171084e6 | 56 | 4880 | 2 | 4.5890e+01 | false |
| 32768 | SecondOrderOptimization (LM) | 1.3641045e6 | 66 | 6432 | 5 | 6.5496e+00 | true |
| 32768 | LeastSquaresOptim (Dogleg) | 4.491e6 | 119 | 1828592 | 5 | 6.5496e+00 | true |
| 32768 | LeastSquaresOptim (LM) | 5.8681455e6 | 151 | 1963040 | 7 | 6.5496e+00 | true |
| 32768 | Optim (NewtonTrustRegion) | 2.2502495e6 | 197 | 13024 | 4 | 6.5496e+00 | true |
| 32768 | Optim (Newton) | 3.930104e6 | 116 | 3840 | 6 | 6.5496e+00 | true |
| 32768 | JSOSolvers (trunk) | 1.1502775e8 | 334 | 1594512 | 323 | 6.5496e+00 | false |
| 32768 | JSOSolvers (tron) | 4.0802791e7 | 303 | 1854448 | 24 | 6.5496e+00 | false |
| 32768 | Ipopt | 4.631604e6 | 275 | 11968 | 6 | 6.5496e+00 | true |
| 32768 | MadNLP | 3.6721875e6 | 543 | 45056 | 5 | 6.5496e+00 | true |
| 32768 | NonlinearSolve (LM) | 1.16289334e8 | 1707 | 67818544 | 112 | 6.5496e+00 | true |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 32768 | CaNNOLeS | 2.58143545e7 | 218 | 26532832 | 6 | 6.5496e+00 | true |
| 65536 | SecondOrderOptimization (Dogleg) | 3.9736045e6 | 69 | 6368 | 5 | 1.3174e+01 | true |
| 65536 | SecondOrderOptimization (LM) | 2.924375e6 | 66 | 6432 | 5 | 1.3174e+01 | true |
| 65536 | LeastSquaresOptim (Dogleg) | 9.0623125e6 | 119 | 3401456 | 5 | 1.3174e+01 | true |
| 65536 | LeastSquaresOptim (LM) | 1.1975479e7 | 151 | 3535904 | 7 | 1.3174e+01 | true |
| 65536 | Optim (NewtonTrustRegion) | 4.5236455e6 | 197 | 13024 | 4 | 1.3174e+01 | true |
| 65536 | Optim (Newton) | 7.9256665e6 | 116 | 3840 | 6 | 1.3174e+01 | true |
| 65536 | JSOSolvers (trunk) | 2.27621209e8 | 334 | 3167376 | 321 | 1.3174e+01 | false |
| 65536 | JSOSolvers (tron) | 6.9845042e7 | 303 | 3689456 | 20 | 1.3174e+01 | false |
| 65536 | Ipopt | 8.639583e6 | 275 | 11968 | 6 | 1.3174e+01 | true |
| 65536 | MadNLP | 7.166208e6 | 543 | 45056 | 5 | 1.3174e+01 | true |
| 65536 | NonlinearSolve (LM) | 2.36214542e8 | 1707 | 131781680 | 112 | 1.3174e+01 | true |
| 65536 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 65536 | CaNNOLeS | 5.3620417e7 | 218 | 52534240 | 6 | 1.3174e+01 | true |
