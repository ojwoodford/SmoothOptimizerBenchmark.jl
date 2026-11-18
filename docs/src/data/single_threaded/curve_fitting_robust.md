# Benchmark Results: Robust Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone (fudged)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T02:25:07
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 3b3f450
- **Dependency Commits**: OptimizationVariableInterface cd7c159, SecondOrderOptimization 741d209, NLLSModel ebf8f1d

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | NLLSModel (Static) | 395.84 | 1 | 16 | 2562.5 | 1 | 32 |
| 64 | Standalone (fudged) | 404.16 | 1 | 16 | 1608.923076923077 | 1 | 32 |
| 128 | NLLSModel (Static) | 735.1071428571429 | 1 | 16 | 4841.8 | 1 | 32 |
| 128 | Standalone (fudged) | 750.0 | 1 | 16 | 3041.5714285714284 | 1 | 32 |
| 256 | NLLSModel (Static) | 1455.6 | 1 | 16 | 9959.0 | 1 | 32 |
| 256 | Standalone (fudged) | 1401.7857142857142 | 1 | 16 | 5927.0 | 1 | 32 |
| 512 | NLLSModel (Static) | 2838.625 | 1 | 16 | 19917.0 | 1 | 32 |
| 512 | Standalone (fudged) | 2739.625 | 1 | 16 | 12750.0 | 1 | 32 |
| 1024 | NLLSModel (Static) | 6062.5 | 1 | 16 | 41042.0 | 1 | 32 |
| 1024 | Standalone (fudged) | 5968.75 | 1 | 16 | 25417.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 11750.0 | 1 | 16 | 82583.0 | 1 | 32 |
| 2048 | Standalone (fudged) | 10792.0 | 1 | 16 | 47167.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 21708.0 | 1 | 16 | 154000.0 | 1 | 32 |
| 4096 | Standalone (fudged) | 21958.0 | 1 | 16 | 96916.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 46375.0 | 1 | 16 | 328833.0 | 1 | 32 |
| 8192 | Standalone (fudged) | 48541.0 | 1 | 16 | 202708.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 91833.0 | 1 | 16 | 692083.0 | 1 | 32 |
| 16384 | Standalone (fudged) | 86000.0 | 1 | 16 | 416000.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 178084.0 | 1 | 16 | 1.26975e6 | 1 | 32 |
| 32768 | Standalone (fudged) | 172208.0 | 1 | 16 | 795708.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 372792.0 | 1 | 16 | 2.505875e6 | 1 | 32 |
| 65536 | Standalone (fudged) | 369875.0 | 1 | 16 | 1.584125e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 26770.5 | 34 | 2144 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM) | 26833.0 | 32 | 2064 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, tall) | 47021.0 | 102 | 20896 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, fudged) | 25625.0 | 31 | 4384 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | LeastSquaresOptim (Dogleg, fudged) | 33771.0 | 191 | 462704 | 10 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | LeastSquaresOptim (LM, fudged) | 24750.0 | 147 | 360576 | 7 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 45000.0 | 309 | 21552 | 8 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | Optim (Newton) | 47375.5 | 191 | 5584 | 11 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 53708.5 | 59 | 5824 | 14 | 9.2008e-01 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (tron) | 124229.5 | 123 | 9856 | 23 | 9.2008e-01 | true | ok | NaN | first\_order |
| 64 | Ipopt | 1.2336045e6 | 535 | 23072 | 14 | 9.2008e-01 | true | ok | NaN | first\_order |
| 64 | MadNLP | 476083.5 | 543 | 45056 | 14 | 9.2008e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM, fudged) | 477416.5 | 1318 | 220288 | 128 | 9.2008e-01 | true | ok | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion, fudged) | 203709.0 | 1343 | 3510208 | 20 | 9.2008e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 64 | CaNNOLeS (fudged) | 134583.0 | 176 | 65008 | 14 | 9.2008e-01 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 55958.5 | 34 | 2144 | 9 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM) | 63833.0 | 32 | 2064 | 10 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, tall) | 105562.0 | 106 | 34272 | 10 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, fudged) | 41021.0 | 32 | 6400 | 8 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | LeastSquaresOptim (Dogleg, fudged) | 60646.0 | 214 | 516864 | 12 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | LeastSquaresOptim (LM, fudged) | 53000.0 | 184 | 466016 | 9 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 64854.0 | 309 | 21552 | 8 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | Optim (Newton) | 86167.0 | 227 | 6352 | 13 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 117208.0 | 59 | 9088 | 19 | 1.8517e+00 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (tron) | 135313.0 | 123 | 13664 | 15 | 1.8517e+00 | true | ok | NaN | first\_order |
| 128 | Ipopt | 1.330396e6 | 559 | 24416 | 14 | 1.8517e+00 | true | ok | NaN | first\_order |
| 128 | MadNLP | 566979.0 | 543 | 45056 | 14 | 1.8517e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM, fudged) | 675625.0 | 1295 | 355312 | 125 | 1.8517e+00 | true | ok | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion, fudged) | 407958.0 | 1620 | 4196800 | 23 | 1.8517e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 128 | CaNNOLeS (fudged) | 1.7557915e6 | 591 | 138640 | 76 | 1.8517e+00 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 186333.5 | 34 | 2144 | 14 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM) | 165208.0 | 32 | 2064 | 13 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, tall) | 249437.0 | 116 | 61600 | 13 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, fudged) | 125270.5 | 33 | 10464 | 14 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | LeastSquaresOptim (Dogleg, fudged) | 123521.0 | 231 | 573712 | 12 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | LeastSquaresOptim (LM, fudged) | 131875.0 | 241 | 625872 | 12 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 149062.0 | 449 | 32112 | 13 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | Optim (Newton) | 158062.5 | 225 | 6352 | 14 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 1.812625e6 | 332 | 33904 | 367 | 3.7582e+00 | false | not_converged | NaN | not\_desc |
| 256 | JSOSolvers (tron) | 1.05675e6 | 302 | 33744 | 57 | 3.7582e+00 | false | not_converged | NaN | small\_step |
| 256 | Ipopt | 2.214917e6 | 925 | 39296 | 27 | 3.7582e+00 | true | ok | NaN | first\_order |
| 256 | MadNLP | 913458.5 | 543 | 45056 | 27 | 3.7582e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM, fudged) | 1.4385e6 | 1894 | 927712 | 156 | 3.7582e+00 | true | ok | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion, fudged) | 685250.0 | 1455 | 3858352 | 32 | 3.7582e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 256 | CaNNOLeS (fudged) | 1.032146e6 | 213 | 246160 | 31 | 3.7582e+00 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 217792.0 | 34 | 2144 | 9 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM) | 229875.0 | 32 | 2064 | 9 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, tall) | 368125.0 | 116 | 115872 | 9 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, fudged) | 146750.0 | 33 | 18656 | 8 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | LeastSquaresOptim (Dogleg, fudged) | 196812.5 | 199 | 484272 | 11 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | LeastSquaresOptim (LM, fudged) | 170687.5 | 169 | 435984 | 8 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 169458.5 | 309 | 21552 | 8 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | Optim (Newton) | 236187.5 | 196 | 5680 | 11 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 2.847667e6 | 334 | 46224 | 355 | 7.4865e+00 | false | not_converged | NaN | not\_desc |
| 512 | JSOSolvers (tron) | 654416.5 | 130 | 34944 | 22 | 7.4865e+00 | true | ok | NaN | first\_order |
| 512 | Ipopt | 1.5674165e6 | 559 | 24416 | 14 | 7.4865e+00 | true | ok | NaN | first\_order |
| 512 | MadNLP | 1.980958e6 | 543 | 45056 | 21 | 7.4865e+00 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL |
| 512 | NonlinearSolve (LM, fudged) | 2.0807915e6 | 1520 | 1408064 | 122 | 7.4865e+00 | true | ok | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion, fudged) | 832875.0 | 1125 | 3387904 | 17 | 7.4865e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 512 | CaNNOLeS (fudged) | 1.1421665e6 | 218 | 485344 | 16 | 7.4865e+00 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 347208.5 | 34 | 2144 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM) | 345104.0 | 32 | 2064 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, tall) | 527500.0 | 116 | 224416 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, fudged) | 292124.5 | 33 | 35040 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | LeastSquaresOptim (Dogleg, fudged) | 297041.5 | 159 | 406864 | 8 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | LeastSquaresOptim (LM, fudged) | 337187.0 | 169 | 463632 | 8 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 290021.0 | 281 | 19440 | 7 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | Optim (Newton) | 293271.0 | 134 | 4336 | 7 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 4.406917e6 | 334 | 70800 | 333 | 1.4950e+01 | false | not_converged | NaN | not\_desc |
| 1024 | JSOSolvers (tron) | 3.296875e6 | 302 | 76752 | 44 | 1.4950e+01 | false | not_converged | NaN | small\_step |
| 1024 | Ipopt | 1.50675e6 | 445 | 19328 | 11 | 1.4950e+01 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 1.0430625e6 | 543 | 45056 | 12 | 1.4950e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM, fudged) | 3.9856045e6 | 1520 | 2748480 | 122 | 1.4950e+01 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion, fudged) | 2.19975e6 | 1719 | 6485872 | 23 | 1.4950e+01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 1024 | CaNNOLeS (fudged) | 1.846875e6 | 218 | 1045472 | 13 | 1.4950e+01 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 980000.0 | 34 | 2144 | 9 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM) | 832583.0 | 32 | 2064 | 8 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, tall) | 1.257354e6 | 116 | 441504 | 8 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, fudged) | 600750.0 | 33 | 67808 | 8 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | LeastSquaresOptim (Dogleg, fudged) | 682020.5 | 177 | 506944 | 9 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | LeastSquaresOptim (LM, fudged) | 665563.0 | 169 | 527120 | 8 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 556874.5 | 281 | 19440 | 7 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | Optim (Newton) | 745479.0 | 160 | 4912 | 9 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 9.542417e6 | 334 | 119952 | 344 | 2.9833e+01 | false | not_converged | NaN | not\_desc |
| 2048 | JSOSolvers (tron) | 5.666625e6 | 302 | 134096 | 37 | 2.9833e+01 | false | not_converged | NaN | small\_step |
| 2048 | Ipopt | 2.249208e6 | 505 | 21824 | 13 | 2.9833e+01 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 1.6305415e6 | 543 | 45056 | 13 | 2.9833e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM, fudged) | 8.0885835e6 | 1520 | 5453888 | 122 | 2.9833e+01 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion, fudged) | 3.260875e6 | 1433 | 7526496 | 14 | 2.9833e+01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 2048 | CaNNOLeS (fudged) | 3.965771e6 | 218 | 1919968 | 14 | 2.9833e+01 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 1.9705835e6 | 34 | 2144 | 9 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM) | 1.588146e6 | 32 | 2064 | 8 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, tall) | 2.470479e6 | 116 | 892064 | 8 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, fudged) | 1.2183545e6 | 33 | 133344 | 7 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | LeastSquaresOptim (Dogleg, fudged) | 1.184146e6 | 159 | 554320 | 8 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM, fudged) | 1.3368965e6 | 169 | 637712 | 8 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 1.0802915e6 | 281 | 19440 | 7 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | Optim (Newton) | 1.3499585e6 | 147 | 4624 | 8 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 1.9988916e7 | 334 | 218256 | 342 | 5.9807e+01 | false | not_converged | NaN | not\_desc |
| 4096 | JSOSolvers (tron) | 1.4061458e7 | 302 | 248784 | 48 | 5.9807e+01 | false | not_converged | NaN | small\_step |
| 4096 | Ipopt | 3.0033545e6 | 445 | 19328 | 11 | 5.9807e+01 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 4.7472295e6 | 543 | 45056 | 18 | 5.9807e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM, fudged) | 1.5809e7 | 1520 | 12814400 | 122 | 5.9807e+01 | true | ok | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion, fudged) | 7.223584e6 | 993 | 8144416 | 12 | 5.9807e+01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 4096 | CaNNOLeS (fudged) | 7.5021045e6 | 218 | 3775456 | 13 | 5.9807e+01 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 2.7547085e6 | 34 | 2144 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM) | 2.778188e6 | 32 | 2064 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, tall) | 4.2757915e6 | 116 | 1744032 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, fudged) | 2.4091875e6 | 33 | 264416 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | LeastSquaresOptim (Dogleg, fudged) | 2.5305625e6 | 159 | 750928 | 8 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | LeastSquaresOptim (LM, fudged) | 2.832812e6 | 169 | 834320 | 8 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 2.155167e6 | 281 | 19440 | 7 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | Optim (Newton) | 2.3644585e6 | 134 | 4336 | 7 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 4.4672208e7 | 334 | 414864 | 351 | 1.1959e+02 | false | not_converged | NaN | not\_desc |
| 8192 | JSOSolvers (tron) | 2.7165083e7 | 302 | 478160 | 44 | 1.1959e+02 | false | not_converged | NaN | small\_step |
| 8192 | Ipopt | 5.0264375e6 | 445 | 19328 | 11 | 1.1959e+02 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 4.2733955e6 | 543 | 45056 | 11 | 1.1959e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM, fudged) | 3.1492584e7 | 1520 | 21465152 | 122 | 1.1959e+02 | true | ok | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion, fudged) | 1.2965875e7 | 1411 | 19992848 | 12 | 1.1959e+02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 8192 | CaNNOLeS (fudged) | 1.49979585e7 | 218 | 7019488 | 13 | 1.1959e+02 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 7.7212705e6 | 34 | 2144 | 9 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM) | 6.239916e6 | 32 | 2064 | 8 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, tall) | 1.01922285e7 | 116 | 3447968 | 8 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, fudged) | 4.450583e6 | 33 | 526560 | 6 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | LeastSquaresOptim (Dogleg, fudged) | 5.4061255e6 | 159 | 1144144 | 8 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | LeastSquaresOptim (LM, fudged) | 5.8640625e6 | 169 | 1227536 | 8 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 4.4749795e6 | 281 | 19440 | 7 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | Optim (Newton) | 5.713708e6 | 147 | 4624 | 8 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 8.5055916e7 | 334 | 808080 | 335 | 2.3926e+02 | false | not_converged | NaN | not\_desc |
| 16384 | JSOSolvers (tron) | 4.6616708e7 | 302 | 936912 | 35 | 2.3926e+02 | false | not_converged | NaN | small\_step |
| 16384 | Ipopt | 1.01968955e7 | 475 | 20576 | 12 | 2.3926e+02 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 9.074438e6 | 543 | 45056 | 12 | 2.3926e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM, fudged) | 6.8489333e7 | 1520 | 38766656 | 122 | 2.3926e+02 | true | ok | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion, fudged) | 3.2445708e7 | 1565 | 40797248 | 14 | 2.3926e+02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 16384 | CaNNOLeS (fudged) | 3.0407708e7 | 218 | 13523936 | 13 | 2.3926e+02 | true | ok | NaN | first\_order |
| 32768 | SecondOrderOptimization (Dogleg) | 1.09895835e7 | 34 | 2144 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM) | 1.08584165e7 | 32 | 2064 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, tall) | 1.73614585e7 | 116 | 6855840 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, fudged) | 8.7749375e6 | 33 | 1050848 | 7 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | LeastSquaresOptim (Dogleg, fudged) | 1.08067915e7 | 159 | 1930576 | 8 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | LeastSquaresOptim (LM, fudged) | 1.1885354e7 | 169 | 2013968 | 8 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 9.005854e6 | 281 | 19440 | 7 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | Optim (Newton) | 1.0267583e7 | 134 | 4336 | 7 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | JSOSolvers (trunk) | 1.75198458e8 | 334 | 1594512 | 336 | 4.7821e+02 | false | not_converged | NaN | not\_desc |
| 32768 | JSOSolvers (tron) | 1.18318e8 | 302 | 1854416 | 45 | 4.7821e+02 | false | not_converged | NaN | small\_step |
| 32768 | Ipopt | 1.9312854e7 | 475 | 20576 | 12 | 4.7821e+02 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 1.85069165e7 | 543 | 45056 | 12 | 4.7821e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM, fudged) | 1.42411375e8 | 1520 | 73369664 | 122 | 4.7821e+02 | true | ok | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion, fudged) | 6.5769375e7 | 1543 | 76922096 | 13 | 4.7821e+02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 32768 | CaNNOLeS (fudged) | 6.4526729e7 | 224 | 26565824 | 13 | 4.7821e+02 | true | ok | NaN | first\_order |
| 65536 | SecondOrderOptimization (Dogleg) | 3.0381958e7 | 34 | 2144 | 9 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM) | 2.54166255e7 | 32 | 2064 | 8 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, tall) | 4.0517708e7 | 116 | 13671584 | 8 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, fudged) | 2.0579917e7 | 33 | 2099424 | 7 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | LeastSquaresOptim (Dogleg, fudged) | 2.18913335e7 | 159 | 3503440 | 8 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | LeastSquaresOptim (LM, fudged) | 2.4296667e7 | 169 | 3586832 | 8 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 1.81867295e7 | 281 | 19440 | 7 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | Optim (Newton) | 2.3780958e7 | 147 | 4624 | 8 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | JSOSolvers (trunk) | 3.39086125e8 | 334 | 3167376 | 337 | 9.5686e+02 | false | not_converged | NaN | not\_desc |
| 65536 | JSOSolvers (tron) | 2.10349875e8 | 302 | 3689424 | 40 | 9.5686e+02 | false | not_converged | NaN | small\_step |
| 65536 | Ipopt | 3.78127705e7 | 475 | 20576 | 12 | 9.5686e+02 | true | ok | NaN | first\_order |
| 65536 | MadNLP | 3.4222e7 | 543 | 45056 | 11 | 9.5686e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM, fudged) | 2.88901104e8 | 1520 | 142575680 | 122 | 9.5686e+02 | true | ok | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion, fudged) | 1.72147791e8 | 1807 | 176100528 | 21 | 9.5686e+02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 65536 | CaNNOLeS (fudged) | 1.36810666e8 | 218 | 67443680 | 14 | 9.5686e+02 | true | ok | NaN | first\_order |
