# Benchmark Results: Robust Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone (fudged)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T01:21:32
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=1
- **Git Commit**: 2c10368
- **Dependency Commits**: OptimizationVariableInterface f130043, SecondOrderOptimization 377b96e, NLLSModel 78a4ef5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | NLLSModel (Static) | 400.51020408163265 | 1 | 16 | 2572.875 | 1 | 32 |
| 64 | Standalone (fudged) | 421.7755102040816 | 1 | 16 | 1625.0 | 1 | 32 |
| 128 | NLLSModel (Static) | 739.5714285714286 | 1 | 16 | 5291.8 | 1 | 32 |
| 128 | Standalone (fudged) | 751.6153846153846 | 1 | 16 | 3363.1428571428573 | 1 | 32 |
| 256 | NLLSModel (Static) | 1170.2608695652175 | 1 | 16 | 10291.666666666666 | 1 | 32 |
| 256 | Standalone (fudged) | 1419.642857142857 | 1 | 16 | 5927.25 | 1 | 32 |
| 512 | NLLSModel (Static) | 1311.5238095238096 | 1 | 16 | 20542.0 | 1 | 32 |
| 512 | Standalone (fudged) | 2822.875 | 1 | 16 | 11750.0 | 1 | 32 |
| 1024 | NLLSModel (Static) | 1483.4 | 1 | 16 | 14166.0 | 1 | 32 |
| 1024 | Standalone (fudged) | 5875.0 | 1 | 16 | 23375.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 2708.0 | 1 | 16 | 35875.0 | 1 | 32 |
| 2048 | Standalone (fudged) | 11542.0 | 1 | 16 | 46750.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 3729.0 | 1 | 16 | 73167.0 | 1 | 32 |
| 4096 | Standalone (fudged) | 21917.0 | 1 | 16 | 99084.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 7750.0 | 1 | 16 | 147292.0 | 1 | 32 |
| 8192 | Standalone (fudged) | 43791.0 | 1 | 16 | 200334.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 12375.0 | 1 | 16 | 315459.0 | 1 | 32 |
| 16384 | Standalone (fudged) | 86625.0 | 1 | 16 | 430042.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 23875.0 | 1 | 16 | 342625.0 | 1 | 32 |
| 32768 | Standalone (fudged) | 179583.0 | 1 | 16 | 822709.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 47084.0 | 1 | 16 | 1.10225e6 | 1 | 32 |
| 65536 | Standalone (fudged) | 349417.0 | 1 | 16 | 1.586292e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 27145.5 | 34 | 2144 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM) | 29542.0 | 32 | 2064 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (Gauss-Newton) | 27020.5 | 29 | 1856 | 8 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, tall) | 45521.0 | 102 | 20896 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, fudged) | 27375.0 | 31 | 4384 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | LeastSquaresOptim (Dogleg, fudged) | 38083.5 | 191 | 462720 | 10 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | LeastSquaresOptim (LM, fudged) | 25125.0 | 147 | 360592 | 7 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 47708.5 | 309 | 21552 | 8 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | Optim (Newton) | 47562.0 | 191 | 5584 | 11 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 57416.5 | 59 | 5824 | 14 | 9.2008e-01 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (tron) | 122417.0 | 123 | 9856 | 23 | 9.2008e-01 | true | ok | NaN | first\_order |
| 64 | Ipopt | 1.2970415e6 | 542 | 23504 | 14 | 9.2008e-01 | true | ok | NaN | first\_order |
| 64 | MadNLP | 497666.5 | 543 | 45056 | 14 | 9.2008e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM, fudged) | 490083.0 | 1318 | 220288 | 128 | 9.2008e-01 | true | ok | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion, fudged) | 238750.0 | 1343 | 3510208 | 20 | 9.2008e-01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 64 | CaNNOLeS (fudged) | 136916.0 | 176 | 65008 | 14 | 9.2008e-01 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 57229.5 | 34 | 2144 | 9 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM) | 69270.5 | 32 | 2064 | 10 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (Gauss-Newton) | 66666.5 | 29 | 1856 | 11 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, tall) | 97896.5 | 106 | 34272 | 10 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, fudged) | 41375.5 | 32 | 6400 | 8 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | LeastSquaresOptim (Dogleg, fudged) | 61750.0 | 214 | 516880 | 12 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | LeastSquaresOptim (LM, fudged) | 52958.0 | 184 | 466032 | 9 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 59895.5 | 309 | 21552 | 8 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | Optim (Newton) | 86375.0 | 227 | 6352 | 13 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 120208.0 | 59 | 9088 | 19 | 1.8517e+00 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (tron) | 145958.0 | 123 | 13664 | 15 | 1.8517e+00 | true | ok | NaN | first\_order |
| 128 | Ipopt | 1.449479e6 | 566 | 24848 | 14 | 1.8517e+00 | true | ok | NaN | first\_order |
| 128 | MadNLP | 623979.0 | 543 | 45056 | 14 | 1.8517e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM, fudged) | 682479.0 | 1295 | 355312 | 125 | 1.8517e+00 | true | ok | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion, fudged) | 389500.0 | 1620 | 4196800 | 23 | 1.8517e+00 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 128 | CaNNOLeS (fudged) | 1.7945835e6 | 591 | 138640 | 76 | 1.8517e+00 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 182812.5 | 34 | 2144 | 14 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM) | 174375.0 | 32 | 2064 | 13 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (Gauss-Newton) | 183437.5 | 29 | 1856 | 15 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, tall) | 138979.5 | 116 | 61664 | 13 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, fudged) | 127771.0 | 33 | 10464 | 14 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | LeastSquaresOptim (Dogleg, fudged) | 126000.0 | 231 | 573728 | 12 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | LeastSquaresOptim (LM, fudged) | 128479.5 | 241 | 625888 | 12 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 145979.0 | 449 | 32112 | 13 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | Optim (Newton) | 151500.5 | 225 | 6352 | 14 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 1.813833e6 | 332 | 33904 | 367 | 3.7582e+00 | false | not_converged | NaN | not\_desc; cost test passes |
| 256 | JSOSolvers (tron) | 1.033334e6 | 302 | 33744 | 57 | 3.7582e+00 | false | not_converged | NaN | small\_step; cost test passes |
| 256 | Ipopt | 2.240938e6 | 932 | 39728 | 27 | 3.7582e+00 | true | ok | NaN | first\_order |
| 256 | MadNLP | 925229.0 | 543 | 45056 | 27 | 3.7582e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM, fudged) | 1.4475625e6 | 1894 | 927712 | 156 | 3.7582e+00 | true | ok | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion, fudged) | 662250.0 | 1455 | 3858352 | 32 | 3.7582e+00 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 256 | CaNNOLeS (fudged) | 1.0408335e6 | 213 | 246160 | 31 | 3.7582e+00 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 223354.5 | 34 | 2144 | 9 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM) | 245896.0 | 32 | 2064 | 9 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (Gauss-Newton) | 245458.5 | 29 | 1856 | 10 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, tall) | 144521.0 | 116 | 116064 | 9 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, fudged) | 152500.0 | 33 | 18656 | 8 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | LeastSquaresOptim (Dogleg, fudged) | 193312.5 | 199 | 484288 | 11 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | LeastSquaresOptim (LM, fudged) | 166583.5 | 169 | 436000 | 8 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 165146.0 | 309 | 21552 | 8 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | Optim (Newton) | 247187.5 | 196 | 5680 | 11 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 2.853958e6 | 334 | 46224 | 355 | 7.4865e+00 | false | not_converged | NaN | not\_desc; cost test passes |
| 512 | JSOSolvers (tron) | 679854.5 | 130 | 34944 | 22 | 7.4865e+00 | true | ok | NaN | first\_order |
| 512 | Ipopt | 1.531958e6 | 566 | 24848 | 14 | 7.4865e+00 | true | ok | NaN | first\_order |
| 512 | MadNLP | 1.92225e6 | 543 | 45056 | 21 | 7.4865e+00 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 512 | NonlinearSolve (LM, fudged) | 2.068208e6 | 1520 | 1408064 | 122 | 7.4865e+00 | true | ok | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion, fudged) | 852458.0 | 1125 | 3387904 | 17 | 7.4865e+00 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 512 | CaNNOLeS (fudged) | 1.127625e6 | 218 | 485344 | 16 | 7.4865e+00 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 130729.0 | 56 | 3424 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM) | 130646.0 | 54 | 3344 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (Gauss-Newton) | 167812.0 | 51 | 3136 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, tall) | 202833.5 | 116 | 224640 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, fudged) | 302208.5 | 33 | 35040 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | LeastSquaresOptim (Dogleg, fudged) | 296604.5 | 159 | 406880 | 8 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | LeastSquaresOptim (LM, fudged) | 330167.0 | 169 | 463648 | 8 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 276312.5 | 281 | 19440 | 7 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | Optim (Newton) | 288250.0 | 134 | 4336 | 7 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 4.366e6 | 334 | 70800 | 333 | 1.4950e+01 | false | not_converged | NaN | not\_desc; cost test passes |
| 1024 | JSOSolvers (tron) | 3.161125e6 | 302 | 76752 | 44 | 1.4950e+01 | false | not_converged | NaN | small\_step; cost test passes |
| 1024 | Ipopt | 1.4375625e6 | 452 | 19760 | 11 | 1.4950e+01 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 998479.5 | 543 | 45056 | 12 | 1.4950e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM, fudged) | 3.8815415e6 | 1520 | 2748480 | 122 | 1.4950e+01 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion, fudged) | 2.196583e6 | 1719 | 6485872 | 23 | 1.4950e+01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 1024 | CaNNOLeS (fudged) | 1.81075e6 | 218 | 1045472 | 13 | 1.4950e+01 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 379604.0 | 58 | 3632 | 9 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM) | 374792.0 | 56 | 3552 | 8 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (Gauss-Newton) | 402292.0 | 53 | 3344 | 9 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, tall) | 421688.0 | 116 | 441728 | 8 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, fudged) | 624354.5 | 33 | 67808 | 8 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | LeastSquaresOptim (Dogleg, fudged) | 681958.5 | 177 | 506960 | 9 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | LeastSquaresOptim (LM, fudged) | 669625.5 | 169 | 527136 | 8 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 560646.0 | 281 | 19440 | 7 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | Optim (Newton) | 758250.0 | 160 | 4912 | 9 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 9.621375e6 | 334 | 119952 | 344 | 2.9833e+01 | false | not_converged | NaN | not\_desc; cost test passes |
| 2048 | JSOSolvers (tron) | 5.538792e6 | 302 | 134096 | 37 | 2.9833e+01 | false | not_converged | NaN | small\_step; cost test passes |
| 2048 | Ipopt | 2.323271e6 | 512 | 22256 | 13 | 2.9833e+01 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 1.695229e6 | 543 | 45056 | 13 | 2.9833e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM, fudged) | 8.3210205e6 | 1520 | 5453888 | 122 | 2.9833e+01 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion, fudged) | 3.216583e6 | 1433 | 7526496 | 14 | 2.9833e+01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 2048 | CaNNOLeS (fudged) | 3.891271e6 | 218 | 1919968 | 14 | 2.9833e+01 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 573104.0 | 58 | 3632 | 9 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM) | 480250.0 | 56 | 3552 | 8 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (Gauss-Newton) | 472999.5 | 53 | 3344 | 8 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, tall) | 810583.5 | 116 | 892288 | 8 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, fudged) | 1.2374375e6 | 33 | 133344 | 7 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | LeastSquaresOptim (Dogleg, fudged) | 1.2404795e6 | 159 | 554336 | 8 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM, fudged) | 1.356792e6 | 169 | 637728 | 8 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 1.0790205e6 | 281 | 19440 | 7 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | Optim (Newton) | 1.3763125e6 | 147 | 4624 | 8 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 2.0354167e7 | 334 | 218256 | 342 | 5.9807e+01 | false | not_converged | NaN | not\_desc; cost test passes |
| 4096 | JSOSolvers (tron) | 1.4585208e7 | 302 | 248784 | 48 | 5.9807e+01 | false | not_converged | NaN | small\_step; cost test passes |
| 4096 | Ipopt | 3.0298745e6 | 452 | 19760 | 11 | 5.9807e+01 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 4.6430625e6 | 543 | 45056 | 18 | 5.9807e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM, fudged) | 1.5590708e7 | 1520 | 12814400 | 122 | 5.9807e+01 | true | ok | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion, fudged) | 4.830375e6 | 993 | 8144416 | 12 | 5.9807e+01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 4096 | CaNNOLeS (fudged) | 7.5963335e6 | 218 | 3775456 | 13 | 5.9807e+01 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 1.2764165e6 | 58 | 3632 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM) | 920000.0 | 56 | 3552 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (Gauss-Newton) | 1.175375e6 | 53 | 3344 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, tall) | 1.547459e6 | 116 | 1744256 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, fudged) | 2.4349375e6 | 33 | 264416 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | LeastSquaresOptim (Dogleg, fudged) | 2.5791875e6 | 159 | 750944 | 8 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | LeastSquaresOptim (LM, fudged) | 2.837625e6 | 169 | 834336 | 8 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 2.172354e6 | 281 | 19440 | 7 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | Optim (Newton) | 2.3498125e6 | 134 | 4336 | 7 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 4.367925e7 | 334 | 414864 | 351 | 1.1959e+02 | false | not_converged | NaN | not\_desc; cost test passes |
| 8192 | JSOSolvers (tron) | 2.5776417e7 | 302 | 478160 | 44 | 1.1959e+02 | false | not_converged | NaN | small\_step; cost test passes |
| 8192 | Ipopt | 4.918375e6 | 452 | 19760 | 11 | 1.1959e+02 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 4.343417e6 | 543 | 45056 | 11 | 1.1959e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM, fudged) | 3.1760208e7 | 1520 | 21465152 | 122 | 1.1959e+02 | true | ok | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion, fudged) | 1.3299416e7 | 1411 | 19992848 | 12 | 1.1959e+02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 8192 | CaNNOLeS (fudged) | 1.51395835e7 | 218 | 7019488 | 13 | 1.1959e+02 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 3.1416875e6 | 58 | 3632 | 9 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM) | 2.7595005e6 | 56 | 3552 | 8 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (Gauss-Newton) | 1.8897285e6 | 53 | 3344 | 8 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, tall) | 3.3659995e6 | 116 | 3448192 | 8 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, fudged) | 4.5526045e6 | 33 | 526560 | 6 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | LeastSquaresOptim (Dogleg, fudged) | 5.410583e6 | 159 | 1144160 | 8 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | LeastSquaresOptim (LM, fudged) | 6.0424165e6 | 169 | 1227552 | 8 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 4.3894165e6 | 281 | 19440 | 7 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | Optim (Newton) | 5.653396e6 | 147 | 4624 | 8 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 8.5131375e7 | 334 | 808080 | 335 | 2.3926e+02 | false | not_converged | NaN | not\_desc; cost test passes |
| 16384 | JSOSolvers (tron) | 4.772375e7 | 302 | 936912 | 35 | 2.3926e+02 | false | not_converged | NaN | small\_step; cost test passes |
| 16384 | Ipopt | 1.02159585e7 | 482 | 21008 | 12 | 2.3926e+02 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 9.0680005e6 | 543 | 45056 | 12 | 2.3926e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM, fudged) | 6.7809292e7 | 1520 | 38766656 | 122 | 2.3926e+02 | true | ok | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion, fudged) | 3.3094958e7 | 1565 | 40797248 | 14 | 2.3926e+02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 16384 | CaNNOLeS (fudged) | 3.0809458e7 | 218 | 13523936 | 13 | 2.3926e+02 | true | ok | NaN | first\_order |
| 32768 | SecondOrderOptimization (Dogleg) | 5.2268335e6 | 58 | 3632 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM) | 4.8399585e6 | 56 | 3552 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (Gauss-Newton) | 3.7925e6 | 53 | 3344 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, tall) | 6.970562e6 | 116 | 6856064 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, fudged) | 8.971104e6 | 33 | 1050848 | 7 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | LeastSquaresOptim (Dogleg, fudged) | 1.06041665e7 | 159 | 1930592 | 8 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | LeastSquaresOptim (LM, fudged) | 1.2035396e7 | 169 | 2013984 | 8 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 8.957375e6 | 281 | 19440 | 7 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | Optim (Newton) | 1.00991455e7 | 134 | 4336 | 7 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | JSOSolvers (trunk) | 1.72869708e8 | 334 | 1594512 | 336 | 4.7821e+02 | false | not_converged | NaN | not\_desc; cost test passes |
| 32768 | JSOSolvers (tron) | 1.19652458e8 | 302 | 1854416 | 45 | 4.7821e+02 | false | not_converged | NaN | small\_step; cost test passes |
| 32768 | Ipopt | 1.91331045e7 | 482 | 21008 | 12 | 4.7821e+02 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 1.85355625e7 | 543 | 45056 | 12 | 4.7821e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM, fudged) | 1.4082575e8 | 1520 | 73369664 | 122 | 4.7821e+02 | true | ok | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion, fudged) | 6.4440584e7 | 1543 | 76922096 | 13 | 4.7821e+02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 32768 | CaNNOLeS (fudged) | 6.43689995e7 | 224 | 30252224 | 13 | 4.7821e+02 | true | ok | NaN | first\_order |
| 65536 | SecondOrderOptimization (Dogleg) | 1.47948955e7 | 58 | 3632 | 9 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM) | 1.15633335e7 | 56 | 3552 | 8 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (Gauss-Newton) | 9.8986455e6 | 53 | 3344 | 8 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, tall) | 2.26630835e7 | 116 | 13671808 | 8 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, fudged) | 2.0563875e7 | 33 | 2099424 | 7 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | LeastSquaresOptim (Dogleg, fudged) | 2.19135835e7 | 159 | 3503456 | 8 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | LeastSquaresOptim (LM, fudged) | 2.4029167e7 | 169 | 3586848 | 8 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 1.8267333e7 | 281 | 19440 | 7 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | Optim (Newton) | 2.37411455e7 | 147 | 4624 | 8 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | JSOSolvers (trunk) | 3.50596625e8 | 334 | 3167376 | 337 | 9.5686e+02 | false | not_converged | NaN | not\_desc; cost test passes |
| 65536 | JSOSolvers (tron) | 2.099115e8 | 302 | 3689424 | 40 | 9.5686e+02 | false | not_converged | NaN | small\_step; cost test passes |
| 65536 | Ipopt | 3.77851045e7 | 482 | 21008 | 12 | 9.5686e+02 | true | ok | NaN | first\_order |
| 65536 | MadNLP | 3.4081959e7 | 543 | 45056 | 11 | 9.5686e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM, fudged) | 2.883372085e8 | 1520 | 142575680 | 122 | 9.5686e+02 | true | ok | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion, fudged) | 1.7128425e8 | 1807 | 176100528 | 21 | 9.5686e+02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 65536 | CaNNOLeS (fudged) | 1.37220167e8 | 218 | 52534240 | 14 | 9.5686e+02 | true | ok | NaN | first\_order |
