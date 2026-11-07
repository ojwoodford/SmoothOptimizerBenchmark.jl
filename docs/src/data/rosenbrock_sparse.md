# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T21:02:37
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b448285

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 100 | NLLSModel | 200.4 | 0 | 0 | 3077.4285714285716 | 0 | 0 |
| 100 | Standalone (Sparse) | 58.56643356643357 | 0 | 0 | 4166.6 | 21 | 18480 |
| 100 | NLPModels (MathOptNLSModel) | 458.0 | 5 | 80 | 14584.0 | 9 | 224 |
| 250 | NLLSModel | 595.2571428571429 | 0 | 0 | 7263.666666666667 | 0 | 0 |
| 250 | Standalone (Sparse) | 147.7863247863248 | 0 | 0 | 9334.0 | 22 | 43776 |
| 250 | NLPModels (MathOptNLSModel) | 1035.4 | 5 | 80 | 36875.0 | 9 | 224 |
| 500 | NLLSModel | 1268.25 | 0 | 0 | 15084.0 | 0 | 0 |
| 500 | Standalone (Sparse) | 326.1551724137931 | 0 | 0 | 19125.0 | 23 | 87088 |
| 500 | NLPModels (MathOptNLSModel) | 1924.2727272727273 | 5 | 80 | 80583.0 | 9 | 224 |
| 1000 | NLLSModel | 2439.777777777778 | 0 | 0 | 28916.0 | 0 | 0 |
| 1000 | Standalone (Sparse) | 588.7096774193549 | 0 | 0 | 36833.0 | 23 | 173648 |
| 1000 | NLPModels (MathOptNLSModel) | 3808.4 | 5 | 80 | 150125.0 | 9 | 224 |
| 2500 | NLLSModel | 5968.75 | 0 | 0 | 72625.0 | 0 | 0 |
| 2500 | Standalone (Sparse) | 1401.7857142857142 | 0 | 0 | 115792.0 | 24 | 465968 |
| 2500 | NLPModels (MathOptNLSModel) | 9458.0 | 5 | 80 | 400083.0 | 9 | 224 |
| 5000 | NLLSModel | 11958.0 | 0 | 0 | 145250.0 | 0 | 0 |
| 5000 | Standalone (Sparse) | 2791.714285714286 | 0 | 0 | 200167.0 | 24 | 890416 |
| 5000 | NLPModels (MathOptNLSModel) | 18792.0 | 5 | 80 | 1.945625e6 | 9 | 224 |
| 10000 | NLLSModel | 23792.0 | 0 | 0 | 117500.0 | 3 | 3504 |
| 10000 | Standalone (Sparse) | 15083.0 | 0 | 0 | 443583.0 | 24 | 1731120 |
| 10000 | NLPModels (MathOptNLSModel) | 37417.0 | 5 | 80 | 6.638083e6 | 9 | 224 |
| 20000 | NLLSModel | 50542.0 | 0 | 0 | 554417.0 | 3 | 3504 |
| 20000 | Standalone (Sparse) | 12292.0 | 0 | 0 | 764083.0 | 24 | 3428912 |
| 20000 | NLPModels (MathOptNLSModel) | 79375.0 | 5 | 80 | 1.356575e7 | 9 | 224 |
| 35000 | NLLSModel | 83417.0 | 0 | 0 | 348958.0 | 3 | 3504 |
| 35000 | Standalone (Sparse) | 20292.0 | 0 | 0 | 1.31625e6 | 24 | 5964336 |
| 50000 | NLLSModel | 123750.0 | 0 | 0 | 477750.0 | 3 | 3504 |
| 50000 | Standalone (Sparse) | 29417.0 | 0 | 0 | 2.19125e6 | 24 | 8487472 |
| 75000 | NLLSModel | 187041.0 | 0 | 0 | 863709.0 | 3 | 3504 |
| 75000 | Standalone (Sparse) | 42959.0 | 0 | 0 | 3.161542e6 | 24 | 12649008 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 100 | SecondOrderOptimization (Dogleg) | 125125.0 | 196 | 111408 | 16 | 0.0000e+00 | true |
| 100 | SecondOrderOptimization (LM) | 147375.0 | 197 | 113184 | 16 | 1.4005e-21 | true |
| 100 | LeastSquaresOptim (Dogleg) | 921895.5 | 257 | 56992 | 33 | 8.2795e-27 | true |
| 100 | LeastSquaresOptim (LM) | 1.0517915e6 | 291 | 57472 | 33 | 4.4801e-17 | true |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 100 | Optim (Newton) | 1.343562e6 | 3220 | 2229152 | 33 | 1.2351e-29 | true |
| 100 | JSOSolvers (trunk) | 2.353667e6 | 956 | 70784 | 20 | 6.6210e-18 | false |
| 100 | JSOSolvers (tron) | 1.8490205e6 | 729 | 61824 | 16 | 1.3012e-20 | true |
| 100 | Ipopt | 6.061791e6 | 1766 | 253072 | 23 | 4.5740e-22 | true |
| 100 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 100 | NonlinearSolve (LM) | 1.09292295e7 | 691 | 449456 | 39 | 9.1612e-19 | true |
| 100 | NonlinearSolve (TrustRegion) | 842271.0 | 876 | 517888 | 26 | 1.4840e-29 | true |
| 100 | CaNNOLeS | 369313.0 | 238 | 178272 | 14 | 3.0735e-17 | true |
| 250 | SecondOrderOptimization (Dogleg) | 304166.5 | 205 | 256816 | 14 | 0.0000e+00 | true |
| 250 | SecondOrderOptimization (LM) | 382541.5 | 206 | 261040 | 15 | 1.4849e-19 | true |
| 250 | LeastSquaresOptim (Dogleg) | 2.2363125e6 | 276 | 79216 | 35 | 0.0000e+00 | true |
| 250 | LeastSquaresOptim (LM) | 2.0771045e6 | 290 | 72784 | 33 | 2.2900e-17 | true |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 250 | Optim (Newton) | 2.5099165e6 | 4319 | 5128848 | 33 | 0.0000e+00 | true |
| 250 | JSOSolvers (trunk) | 5.503583e6 | 939 | 97152 | 20 | 1.5854e-18 | false |
| 250 | JSOSolvers (tron) | 6.063812e6 | 875 | 106432 | 23 | 4.1438e-20 | true |
| 250 | Ipopt | 1.25930835e7 | 1779 | 473680 | 23 | 2.7357e-21 | true |
| 250 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 250 | NonlinearSolve (LM) | 6.4497479e7 | 698 | 2017552 | 39 | 9.1612e-19 | true |
| 250 | NonlinearSolve (TrustRegion) | 3.346958e6 | 862 | 1743920 | 21 | 2.7930e-18 | true |
| 250 | CaNNOLeS | 921916.5 | 252 | 404704 | 14 | 9.7316e-17 | true |
| 500 | SecondOrderOptimization (Dogleg) | 492146.0 | 248 | 518768 | 13 | 3.6323e-28 | true |
| 500 | SecondOrderOptimization (LM) | 641791.5 | 248 | 527040 | 15 | 1.2314e-17 | true |
| 500 | LeastSquaresOptim (Dogleg) | 3.5447915e6 | 230 | 105536 | 26 | 2.2908e-29 | true |
| 500 | LeastSquaresOptim (LM) | 4.034625e6 | 307 | 104624 | 34 | 1.8856e-17 | true |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 500 | Optim (Newton) | 4.0716875e6 | 3465 | 10149104 | 33 | 0.0000e+00 | true |
| 500 | JSOSolvers (trunk) | 1.0501333e7 | 934 | 143952 | 20 | 4.0510e-17 | false |
| 500 | JSOSolvers (tron) | 1.26630835e7 | 965 | 176320 | 22 | 4.6034e-19 | true |
| 500 | Ipopt | 2.3954125e7 | 1918 | 900864 | 23 | 2.7357e-21 | true |
| 500 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 500 | NonlinearSolve (LM) | 2.198572085e8 | 13925 | 86749760 | 39 | 9.1613e-19 | true |
| 500 | NonlinearSolve (TrustRegion) | 1.4650375e7 | 965 | 7768416 | 25 | 1.1967e-28 | true |
| 500 | CaNNOLeS | 1.819208e6 | 266 | 796352 | 14 | 9.7316e-17 | true |
| 1000 | SecondOrderOptimization (Dogleg) | 966396.0 | 253 | 1013184 | 13 | 0.0000e+00 | true |
| 1000 | SecondOrderOptimization (LM) | 1.4184165e6 | 253 | 1029648 | 16 | 6.6270e-22 | true |
| 1000 | LeastSquaresOptim (Dogleg) | 7.6614375e6 | 246 | 174768 | 29 | 0.0000e+00 | true |
| 1000 | LeastSquaresOptim (LM) | 8.94275e6 | 347 | 165200 | 41 | 3.5043e-17 | true |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 1000 | Optim (Newton) | 8.092688e6 | 3597 | 20213104 | 33 | 0.0000e+00 | true |
| 1000 | JSOSolvers (trunk) | 2.0750833e7 | 936 | 238192 | 20 | 5.9308e-18 | false |
| 1000 | JSOSolvers (tron) | 1.90674795e7 | 769 | 298048 | 16 | 1.4045e-18 | true |
| 1000 | Ipopt | 4.7574417e7 | 1922 | 1762912 | 23 | 2.7357e-21 | true |
| 1000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 1000 | NonlinearSolve (LM) | 7.34786854e8 | 13588 | 166264592 | 39 | 9.1613e-19 | true |
| 1000 | NonlinearSolve (TrustRegion) | 1.27880205e7 | 4744 | 37810688 | 25 | 0.0000e+00 | true |
| 1000 | CaNNOLeS | 3.5638745e6 | 270 | 1611520 | 14 | 9.7316e-17 | true |
| 2500 | SecondOrderOptimization (Dogleg) | 2.4846455e6 | 259 | 2642976 | 14 | 1.2351e-29 | true |
| 2500 | SecondOrderOptimization (LM) | 3.3190835e6 | 259 | 2688112 | 15 | 7.4722e-20 | true |
| 2500 | LeastSquaresOptim (Dogleg) | 1.9871646e7 | 238 | 401056 | 27 | 0.0000e+00 | true |
| 2500 | LeastSquaresOptim (LM) | 2.2626146e7 | 315 | 381152 | 36 | 9.6888e-19 | true |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 2500 | Optim (Newton) | 1.73642705e7 | 3800 | 53555136 | 33 | 0.0000e+00 | true |
| 2500 | JSOSolvers (trunk) | 4.77130625e7 | 617 | 548608 | 20 | 1.7148e-19 | true |
| 2500 | JSOSolvers (tron) | 6.8814459e7 | 1012 | 760480 | 21 | 1.3105e-17 | false |
| 2500 | Ipopt | 1.16532667e8 | 1426 | 3276816 | 18 | 3.0293e-28 | true |
| 2500 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 2500 | NonlinearSolve (LM) | 5.815148917e9 | 755 | 163347728 | 39 | 9.1612e-19 | true |
| 2500 | NonlinearSolve (TrustRegion) | 3.06482085e7 | 4783 | 97643504 | 25 | 0.0000e+00 | true |
| 2500 | CaNNOLeS | 1.1406167e7 | 272 | 4208416 | 14 | 9.7316e-17 | true |
| 5000 | SecondOrderOptimization (Dogleg) | 1.32495979e8 | 259 | 5450576 | 422 | 1.3376e-28 | true |
| 5000 | SecondOrderOptimization (LM) | 7.978271e6 | 259 | 5532576 | 21 | 3.5660e-21 | true |
| 5000 | LeastSquaresOptim (Dogleg) | 4.0197083e7 | 266 | 800160 | 33 | 0.0000e+00 | true |
| 5000 | LeastSquaresOptim (LM) | 4.8324125e7 | 357 | 755264 | 42 | 2.2955e-17 | true |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | Optim (Newton) | 4.3165125e7 | 4623 | 133891120 | 41 | 0.0000e+00 | true |
| 5000 | JSOSolvers (trunk) | 1.38747646e8 | 625 | 1060992 | 20 | 5.9684e-19 | true |
| 5000 | JSOSolvers (tron) | 2.71138812e8 | 1230 | 1516720 | 34 | 1.1854e-20 | true |
| 5000 | Ipopt | 2.78401479e8 | 1430 | 7043184 | 18 | 3.0293e-28 | true |
| 5000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | NonlinearSolve (LM) | 1.7477465334e10 | 13720 | 823889168 | 39 | 9.1613e-19 | true |
| 5000 | NonlinearSolve (TrustRegion) | 7.7532979e7 | 5771 | 235775408 | 31 | 0.0000e+00 | true |
| 5000 | CaNNOLeS | 2.7735625e7 | 274 | 8206144 | 14 | 9.7316e-17 | true |
| 10000 | SecondOrderOptimization (Dogleg) | 1.12417416e8 | 1022 | 12575136 | 240 | 3.3325e+01 | true |
| 10000 | SecondOrderOptimization (LM) | 1.29244795e7 | 371 | 11978688 | 21 | 3.5662e-21 | true |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | LeastSquaresOptim (LM) | 9.3456125e7 | 361 | 1324624 | 43 | 2.8014e-17 | true |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | Optim (Newton) | 8.51444375e7 | 4635 | 249253104 | 41 | 0.0000e+00 | true |
| 10000 | JSOSolvers (trunk) | 5.90879083e8 | 895 | 1931968 | 20 | 1.1534e-17 | false |
| 10000 | JSOSolvers (tron) | 7.69420042e8 | 994 | 2669344 | 21 | 5.7840e-18 | false |
| 10000 | Ipopt | 7.892203125e8 | 1446 | 12519088 | 18 | 3.0293e-28 | true |
| 10000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | NonlinearSolve (LM) | 3.0406518083e10 | 6324 | 709924624 | 17 | 2.6682e+00 | false |
| 10000 | NonlinearSolve (TrustRegion) | 1.7861375e8 | 4927 | 381488880 | 26 | 2.0443e-29 | true |
| 10000 | CaNNOLeS | 9.0686625e7 | 276 | 15972192 | 14 | 9.7316e-17 | true |
| 20000 | SecondOrderOptimization (Dogleg) | 1.47126875e7 | 333 | 23466576 | 10 | 1.9933e+00 | true |
| 20000 | SecondOrderOptimization (LM) | 3.44314165e7 | 372 | 23839888 | 21 | 3.5665e-21 | true |
| 20000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | LeastSquaresOptim (LM) | 1.827208335e8 | 390 | 2602080 | 41 | 1.4274e-17 | true |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | Optim (Newton) | 1.699983125e8 | 4648 | 497016256 | 41 | 0.0000e+00 | true |
| 20000 | JSOSolvers (trunk) | 1.625122792e9 | 845 | 3813728 | 19 | 1.1667e-18 | false |
| 20000 | JSOSolvers (tron) | 2.480664e9 | 923 | 5288560 | 17 | 1.6291e-18 | true |
| 20000 | Ipopt | 2.422930417e9 | 1457 | 24994656 | 18 | 3.0293e-28 | true |
| 20000 | MadNLP | NaN | 0 | 0 | 0 | NaN | false |
| 20000 | NonlinearSolve (LM) | 3.5422307834e10 | 2292 | 461556496 | 5 | 4.3434e+04 | false |
| 20000 | NonlinearSolve (TrustRegion) | 4.14191042e8 | 5781 | 931792464 | 31 | 0.0000e+00 | true |
| 20000 | CaNNOLeS | 2.2566075e8 | 278 | 31766400 | 14 | 9.7316e-17 | true |
| 35000 | SecondOrderOptimization (Dogleg) | 4.12053955e7 | 342 | 41907552 | 13 | 1.9933e+00 | true |
| 35000 | SecondOrderOptimization (LM) | 6.0250625e7 | 372 | 42499728 | 21 | 3.5671e-21 | true |
| 35000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | Optim (Newton) | 3.05684979e8 | 4639 | 871595312 | 41 | 0.0000e+00 | true |
| 35000 | JSOSolvers (trunk) | 1.17818458e8 | 347 | 6706176 | 20 | 2.6823e-18 | false |
| 35000 | JSOSolvers (tron) | 1.70470042e8 | 150 | 9333632 | 20 | 4.2684e-19 | true |
| 35000 | Ipopt | 2.907819165e8 | 1596 | 170809104 | 18 | 0.0000e+00 | true |
| 35000 | MadNLP | 2.41832541e8 | 1363 | 186835424 | 18 | 0.0000e+00 | true |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 35000 | CaNNOLeS | 8.1304542e7 | 228 | 59038592 | 14 | 9.7316e-17 | true |
| 50000 | SecondOrderOptimization (Dogleg) | 3.31271875e7 | 327 | 62142704 | 8 | 0.0000e+00 | true |
| 50000 | SecondOrderOptimization (LM) | 6.6550125e7 | 372 | 61638288 | 21 | 3.5677e-21 | true |
| 50000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | Optim (Newton) | 4.19288625e8 | 4635 | 1251261680 | 41 | 0.0000e+00 | true |
| 50000 | JSOSolvers (trunk) | 1.8575375e8 | 80 | 9325136 | 21 | 1.3351e-17 | true |
| 50000 | JSOSolvers (tron) | 2.37687375e8 | 150 | 13005696 | 23 | 2.9362e-20 | true |
| 50000 | Ipopt | 4.03144125e8 | 1596 | 242161424 | 18 | 0.0000e+00 | true |
| 50000 | MadNLP | 3.22807584e8 | 1363 | 271165920 | 18 | 0.0000e+00 | true |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 50000 | CaNNOLeS | 1.185199165e8 | 228 | 77552512 | 14 | 9.7316e-17 | true |
| 75000 | SecondOrderOptimization (Dogleg) | 9.1362875e7 | 371 | 89732656 | 16 | 1.9933e+00 | true |
| 75000 | SecondOrderOptimization (LM) | 1.06741625e8 | 378 | 90100656 | 21 | 3.5686e-21 | true |
| 75000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | Optim (Newton) | 7.148197705e8 | 4639 | 1851129136 | 41 | 0.0000e+00 | true |
| 75000 | JSOSolvers (trunk) | 3.7377405e9 | 92 | 13945616 | 256 | 7.8045e-20 | true |
| 75000 | JSOSolvers (tron) | 3.170165415e8 | 150 | 19414912 | 17 | 1.2912e-20 | true |
| 75000 | Ipopt | 6.79712479e8 | 1596 | 361109264 | 18 | 0.0000e+00 | true |
| 75000 | MadNLP | 5.43644458e8 | 1363 | 394548704 | 18 | 0.0000e+00 | true |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 75000 | CaNNOLeS | 1.814180835e8 | 228 | 110156672 | 14 | 9.7316e-17 | true |
