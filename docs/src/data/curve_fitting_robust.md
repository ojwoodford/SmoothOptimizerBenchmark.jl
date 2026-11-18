# Benchmark Results: Robust Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone (fudged)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T01:34:59
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 3b3f450
- **Dependency Commits**: OptimizationVariableInterface cd7c159, SecondOrderOptimization 741d209, NLLSModel ebf8f1d

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | NLLSModel (Static) | 408.5098039215686 | 1 | 16 | 2833.3333333333335 | 1 | 32 |
| 64 | Standalone (fudged) | 452.5 | 1 | 16 | 1596.1538461538462 | 1 | 32 |
| 128 | NLLSModel (Static) | 735.1428571428571 | 1 | 16 | 4983.4 | 1 | 32 |
| 128 | Standalone (fudged) | 764.4230769230769 | 1 | 16 | 3029.8571428571427 | 1 | 32 |
| 256 | NLLSModel (Static) | 1198.5294117647059 | 1 | 16 | 9944.666666666666 | 1 | 32 |
| 256 | Standalone (fudged) | 1394.4 | 1 | 16 | 6000.0 | 1 | 32 |
| 512 | NLLSModel (Static) | 954.8333333333334 | 1 | 16 | 21584.0 | 1 | 32 |
| 512 | Standalone (fudged) | 2734.375 | 1 | 16 | 12125.0 | 1 | 32 |
| 1024 | NLLSModel (Static) | 1564.1538461538462 | 1 | 16 | 14042.0 | 1 | 32 |
| 1024 | Standalone (fudged) | 5760.25 | 1 | 16 | 25833.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 7731.555555555556 | 1 | 16 | 43125.0 | 1 | 32 |
| 2048 | Standalone (fudged) | 13959.0 | 1 | 16 | 49291.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 14292.0 | 1 | 16 | 45875.0 | 1 | 32 |
| 4096 | Standalone (fudged) | 22167.0 | 1 | 16 | 98583.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 7000.0 | 1 | 16 | 88750.0 | 1 | 32 |
| 8192 | Standalone (fudged) | 46916.0 | 1 | 16 | 202000.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 12292.0 | 1 | 16 | 255083.0 | 1 | 32 |
| 16384 | Standalone (fudged) | 86750.0 | 1 | 16 | 406500.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 271792.0 | 1 | 16 | 406625.0 | 1 | 32 |
| 32768 | Standalone (fudged) | 173042.0 | 1 | 16 | 831958.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 47042.0 | 1 | 16 | 757125.0 | 1 | 32 |
| 65536 | Standalone (fudged) | 355750.0 | 1 | 16 | 1.625625e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 26500.0 | 34 | 2144 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM) | 26667.0 | 32 | 2064 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, tall) | 44687.5 | 102 | 20896 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, fudged) | 25000.0 | 31 | 4384 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | LeastSquaresOptim (Dogleg, fudged) | 32895.5 | 191 | 462704 | 10 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | LeastSquaresOptim (LM, fudged) | 25958.0 | 147 | 360576 | 7 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 44937.5 | 309 | 21552 | 8 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | Optim (Newton) | 47791.5 | 191 | 5584 | 11 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 57375.0 | 59 | 5824 | 14 | 9.2008e-01 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (tron) | 124270.5 | 123 | 9856 | 23 | 9.2008e-01 | true | ok | NaN | first\_order |
| 64 | Ipopt | 1.295854e6 | 535 | 23072 | 14 | 9.2008e-01 | true | ok | NaN | first\_order |
| 64 | MadNLP | 504645.5 | 543 | 45056 | 14 | 9.2008e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM, fudged) | 483583.0 | 1318 | 220288 | 128 | 9.2008e-01 | true | ok | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion, fudged) | 212708.0 | 1343 | 3510208 | 20 | 9.2008e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 64 | CaNNOLeS (fudged) | 154875.0 | 176 | 65008 | 14 | 9.2008e-01 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 56375.0 | 34 | 2144 | 9 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM) | 66833.0 | 32 | 2064 | 10 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, tall) | 100042.0 | 106 | 34272 | 10 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, fudged) | 43812.5 | 32 | 6400 | 8 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | LeastSquaresOptim (Dogleg, fudged) | 62062.5 | 214 | 516864 | 12 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | LeastSquaresOptim (LM, fudged) | 52041.0 | 184 | 466016 | 9 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 61250.0 | 309 | 21552 | 8 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | Optim (Newton) | 86166.5 | 227 | 6352 | 13 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 120146.0 | 59 | 9088 | 19 | 1.8517e+00 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (tron) | 139646.0 | 123 | 13664 | 15 | 1.8517e+00 | true | ok | NaN | first\_order |
| 128 | Ipopt | 1.324833e6 | 559 | 24416 | 14 | 1.8517e+00 | true | ok | NaN | first\_order |
| 128 | MadNLP | 566271.0 | 543 | 45056 | 14 | 1.8517e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM, fudged) | 654729.5 | 1295 | 355312 | 125 | 1.8517e+00 | true | ok | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion, fudged) | 347083.0 | 1620 | 4196800 | 23 | 1.8517e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 128 | CaNNOLeS (fudged) | 2.0085625e6 | 591 | 138640 | 76 | 1.8517e+00 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 182812.5 | 34 | 2144 | 14 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM) | 159750.0 | 32 | 2064 | 13 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, tall) | 133145.5 | 116 | 61664 | 13 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, fudged) | 129417.0 | 33 | 10464 | 14 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | LeastSquaresOptim (Dogleg, fudged) | 131292.0 | 231 | 573712 | 12 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | LeastSquaresOptim (LM, fudged) | 137208.0 | 241 | 625872 | 12 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 147417.0 | 449 | 32112 | 13 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | Optim (Newton) | 151125.0 | 225 | 6352 | 14 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 1.825041e6 | 332 | 33904 | 367 | 3.7582e+00 | false | not_converged | NaN | not\_desc |
| 256 | JSOSolvers (tron) | 1.030541e6 | 302 | 33744 | 57 | 3.7582e+00 | false | not_converged | NaN | small\_step |
| 256 | Ipopt | 2.191375e6 | 925 | 39296 | 27 | 3.7582e+00 | true | ok | NaN | first\_order |
| 256 | MadNLP | 912521.0 | 543 | 45056 | 27 | 3.7582e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM, fudged) | 1.471625e6 | 1894 | 927712 | 156 | 3.7582e+00 | true | ok | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion, fudged) | 656041.0 | 1455 | 3858352 | 32 | 3.7582e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 256 | CaNNOLeS (fudged) | 1.1980415e6 | 213 | 246160 | 31 | 3.7582e+00 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 223500.0 | 34 | 2144 | 9 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM) | 228041.0 | 32 | 2064 | 9 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, tall) | 143000.0 | 116 | 116064 | 9 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, fudged) | 153729.5 | 33 | 18656 | 8 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | LeastSquaresOptim (Dogleg, fudged) | 196791.5 | 199 | 484272 | 11 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | LeastSquaresOptim (LM, fudged) | 167812.5 | 169 | 435984 | 8 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 163458.5 | 309 | 21552 | 8 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | Optim (Newton) | 231625.5 | 196 | 5680 | 11 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 2.79725e6 | 334 | 46224 | 355 | 7.4865e+00 | false | not_converged | NaN | not\_desc |
| 512 | JSOSolvers (tron) | 653687.5 | 130 | 34944 | 22 | 7.4865e+00 | true | ok | NaN | first\_order |
| 512 | Ipopt | 1.590979e6 | 559 | 24416 | 14 | 7.4865e+00 | true | ok | NaN | first\_order |
| 512 | MadNLP | 1.995917e6 | 543 | 45056 | 21 | 7.4865e+00 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 512 | NonlinearSolve (LM, fudged) | 2.0442495e6 | 1520 | 1408064 | 122 | 7.4865e+00 | true | ok | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion, fudged) | 813166.0 | 1125 | 3387904 | 17 | 7.4865e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 512 | CaNNOLeS (fudged) | 1.2519785e6 | 218 | 485344 | 16 | 7.4865e+00 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 131958.0 | 56 | 3424 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM) | 131084.0 | 54 | 3344 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, tall) | 205270.5 | 116 | 224640 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, fudged) | 306396.0 | 33 | 35040 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | LeastSquaresOptim (Dogleg, fudged) | 300645.5 | 159 | 406864 | 8 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | LeastSquaresOptim (LM, fudged) | 348729.0 | 169 | 463632 | 8 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 290604.0 | 281 | 19440 | 7 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | Optim (Newton) | 304583.0 | 134 | 4336 | 7 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 4.612375e6 | 334 | 70800 | 333 | 1.4950e+01 | false | not_converged | NaN | not\_desc |
| 1024 | JSOSolvers (tron) | 3.348542e6 | 302 | 76752 | 44 | 1.4950e+01 | false | not_converged | NaN | small\_step |
| 1024 | Ipopt | 1.4596455e6 | 445 | 19328 | 11 | 1.4950e+01 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 1.004896e6 | 543 | 45056 | 12 | 1.4950e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM, fudged) | 4.007104e6 | 1520 | 2748480 | 122 | 1.4950e+01 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion, fudged) | 2.224333e6 | 1719 | 6485872 | 23 | 1.4950e+01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 1024 | CaNNOLeS (fudged) | 2.0789165e6 | 218 | 1045472 | 13 | 1.4950e+01 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 288729.5 | 58 | 3632 | 9 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM) | 314791.5 | 56 | 3552 | 8 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, tall) | 421979.0 | 116 | 441728 | 8 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, fudged) | 602416.5 | 33 | 67808 | 8 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | LeastSquaresOptim (Dogleg, fudged) | 668312.5 | 177 | 506944 | 9 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | LeastSquaresOptim (LM, fudged) | 680395.5 | 169 | 527120 | 8 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 544021.0 | 281 | 19440 | 7 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | Optim (Newton) | 731854.0 | 160 | 4912 | 9 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 9.372458e6 | 334 | 119952 | 344 | 2.9833e+01 | false | not_converged | NaN | not\_desc |
| 2048 | JSOSolvers (tron) | 5.520042e6 | 302 | 134096 | 37 | 2.9833e+01 | false | not_converged | NaN | small\_step |
| 2048 | Ipopt | 2.237e6 | 505 | 21824 | 13 | 2.9833e+01 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 1.624917e6 | 543 | 45056 | 13 | 2.9833e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM, fudged) | 8.007729e6 | 1520 | 5453888 | 122 | 2.9833e+01 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion, fudged) | 3.160709e6 | 1433 | 7526496 | 14 | 2.9833e+01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 2048 | CaNNOLeS (fudged) | 4.616125e6 | 218 | 1919968 | 14 | 2.9833e+01 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 711353.5 | 58 | 3632 | 9 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM) | 608000.0 | 56 | 3552 | 8 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, tall) | 812062.5 | 116 | 892288 | 8 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, fudged) | 1.2247085e6 | 33 | 133344 | 7 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | LeastSquaresOptim (Dogleg, fudged) | 1.1718755e6 | 159 | 554320 | 8 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM, fudged) | 1.318063e6 | 169 | 637712 | 8 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 1.0547505e6 | 281 | 19440 | 7 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | Optim (Newton) | 1.3196665e6 | 147 | 4624 | 8 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 2.04145e7 | 334 | 218256 | 342 | 5.9807e+01 | false | not_converged | NaN | not\_desc |
| 4096 | JSOSolvers (tron) | 1.3962167e7 | 302 | 248784 | 48 | 5.9807e+01 | false | not_converged | NaN | small\_step |
| 4096 | Ipopt | 2.914125e6 | 445 | 19328 | 11 | 5.9807e+01 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 4.6692915e6 | 543 | 45056 | 18 | 5.9807e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM, fudged) | 1.56968545e7 | 1520 | 12814400 | 122 | 5.9807e+01 | true | ok | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion, fudged) | 4.695292e6 | 993 | 8144416 | 12 | 5.9807e+01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 4096 | CaNNOLeS (fudged) | 8.4789585e6 | 218 | 3775456 | 13 | 5.9807e+01 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 808833.5 | 58 | 3632 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM) | 990417.0 | 56 | 3552 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, tall) | 1.5271875e6 | 116 | 1744256 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, fudged) | 2.484729e6 | 33 | 264416 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | LeastSquaresOptim (Dogleg, fudged) | 2.4771465e6 | 159 | 750928 | 8 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | LeastSquaresOptim (LM, fudged) | 2.787458e6 | 169 | 834320 | 8 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 2.1165835e6 | 281 | 19440 | 7 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | Optim (Newton) | 2.3149375e6 | 134 | 4336 | 7 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 4.3065625e7 | 334 | 414864 | 351 | 1.1959e+02 | false | not_converged | NaN | not\_desc |
| 8192 | JSOSolvers (tron) | 2.5716167e7 | 302 | 478160 | 44 | 1.1959e+02 | false | not_converged | NaN | small\_step |
| 8192 | Ipopt | 4.9758955e6 | 445 | 19328 | 11 | 1.1959e+02 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 4.2682705e6 | 543 | 45056 | 11 | 1.1959e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM, fudged) | 3.1308562e7 | 1520 | 21465152 | 122 | 1.1959e+02 | true | ok | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion, fudged) | 1.3601875e7 | 1411 | 19992848 | 12 | 1.1959e+02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 8192 | CaNNOLeS (fudged) | 1.70865205e7 | 218 | 7019488 | 13 | 1.1959e+02 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 2.2198955e6 | 58 | 3632 | 9 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM) | 1.801729e6 | 56 | 3552 | 8 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, tall) | 3.4600415e6 | 116 | 3448192 | 8 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, fudged) | 4.454792e6 | 33 | 526560 | 6 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | LeastSquaresOptim (Dogleg, fudged) | 5.3154375e6 | 159 | 1144144 | 8 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | LeastSquaresOptim (LM, fudged) | 5.8925625e6 | 169 | 1227536 | 8 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 4.3969165e6 | 281 | 19440 | 7 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | Optim (Newton) | 5.590271e6 | 147 | 4624 | 8 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 8.2443958e7 | 334 | 808080 | 335 | 2.3926e+02 | false | not_converged | NaN | not\_desc |
| 16384 | JSOSolvers (tron) | 4.6803875e7 | 302 | 936912 | 35 | 2.3926e+02 | false | not_converged | NaN | small\_step |
| 16384 | Ipopt | 9.9525205e6 | 475 | 20576 | 12 | 2.3926e+02 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 9.3720005e6 | 543 | 45056 | 12 | 2.3926e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM, fudged) | 6.6463583e7 | 1520 | 38766656 | 122 | 2.3926e+02 | true | ok | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion, fudged) | 3.3966542e7 | 1565 | 40797248 | 14 | 2.3926e+02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 16384 | CaNNOLeS (fudged) | 3.4235916e7 | 218 | 13523936 | 13 | 2.3926e+02 | true | ok | NaN | first\_order |
| 32768 | SecondOrderOptimization (Dogleg) | 5.193104e6 | 58 | 3632 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM) | 4.8681455e6 | 56 | 3552 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, tall) | 7.3695625e6 | 116 | 6856064 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, fudged) | 8.657979e6 | 33 | 1050848 | 7 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | LeastSquaresOptim (Dogleg, fudged) | 1.0809625e7 | 159 | 1930576 | 8 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | LeastSquaresOptim (LM, fudged) | 1.1870479e7 | 169 | 2013968 | 8 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 8.9552505e6 | 281 | 19440 | 7 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | Optim (Newton) | 1.02794795e7 | 134 | 4336 | 7 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | JSOSolvers (trunk) | 1.6934975e8 | 334 | 1594512 | 336 | 4.7821e+02 | false | not_converged | NaN | not\_desc |
| 32768 | JSOSolvers (tron) | 1.14747042e8 | 302 | 1854416 | 45 | 4.7821e+02 | false | not_converged | NaN | small\_step |
| 32768 | Ipopt | 1.9172292e7 | 475 | 20576 | 12 | 4.7821e+02 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 1.8144812e7 | 543 | 45056 | 12 | 4.7821e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM, fudged) | 1.3794e8 | 1520 | 73369664 | 122 | 4.7821e+02 | true | ok | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion, fudged) | 6.4925e7 | 1543 | 76922096 | 13 | 4.7821e+02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 32768 | CaNNOLeS (fudged) | 7.3355625e7 | 224 | 26533056 | 13 | 4.7821e+02 | true | ok | NaN | first\_order |
| 65536 | SecondOrderOptimization (Dogleg) | 1.22169995e7 | 58 | 3632 | 9 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM) | 1.13186045e7 | 56 | 3552 | 8 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, tall) | 1.5470937e7 | 116 | 13671808 | 8 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, fudged) | 2.04844165e7 | 33 | 2099424 | 7 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | LeastSquaresOptim (Dogleg, fudged) | 2.1824833e7 | 159 | 3503440 | 8 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | LeastSquaresOptim (LM, fudged) | 2.3957917e7 | 169 | 3586832 | 8 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 1.79311455e7 | 281 | 19440 | 7 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | Optim (Newton) | 2.38926875e7 | 147 | 4624 | 8 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | JSOSolvers (trunk) | 3.36727e8 | 334 | 3167376 | 337 | 9.5686e+02 | false | not_converged | NaN | not\_desc |
| 65536 | JSOSolvers (tron) | 2.08617833e8 | 302 | 3689424 | 40 | 9.5686e+02 | false | not_converged | NaN | small\_step |
| 65536 | Ipopt | 3.81970835e7 | 475 | 20576 | 12 | 9.5686e+02 | true | ok | NaN | first\_order |
| 65536 | MadNLP | 3.3704791e7 | 543 | 45056 | 11 | 9.5686e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM, fudged) | 2.8006875e8 | 1520 | 142575680 | 122 | 9.5686e+02 | true | ok | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion, fudged) | 1.73947125e8 | 1807 | 176100528 | 21 | 9.5686e+02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 65536 | CaNNOLeS (fudged) | 1.56800667e8 | 218 | 52534240 | 14 | 9.5686e+02 | true | ok | NaN | first\_order |
