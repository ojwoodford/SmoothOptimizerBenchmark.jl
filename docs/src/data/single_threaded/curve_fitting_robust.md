# Benchmark Results: Robust Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone (fudged)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T02:14:57
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 2c10368
- **Dependency Commits**: OptimizationVariableInterface f130043, SecondOrderOptimization 377b96e, NLLSModel 78a4ef5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | NLLSModel (Static) | 395.4313725490196 | 1 | 16 | 2509.222222222222 | 1 | 32 |
| 64 | Standalone (fudged) | 421.5686274509804 | 1 | 16 | 1612.2307692307693 | 1 | 32 |
| 128 | NLLSModel (Static) | 732.1428571428571 | 1 | 16 | 4883.2 | 1 | 32 |
| 128 | Standalone (fudged) | 748.5 | 1 | 16 | 3035.714285714286 | 1 | 32 |
| 256 | NLLSModel (Static) | 1416.6666666666667 | 1 | 16 | 9680.666666666666 | 1 | 32 |
| 256 | Standalone (fudged) | 1408.3333333333333 | 1 | 16 | 5937.5 | 1 | 32 |
| 512 | NLLSModel (Static) | 2755.25 | 1 | 16 | 19291.0 | 1 | 32 |
| 512 | Standalone (fudged) | 2729.125 | 1 | 16 | 11750.0 | 1 | 32 |
| 1024 | NLLSModel (Static) | 5458.5 | 1 | 16 | 38375.0 | 1 | 32 |
| 1024 | Standalone (fudged) | 5437.5 | 1 | 16 | 23333.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 10916.0 | 1 | 16 | 77125.0 | 1 | 32 |
| 2048 | Standalone (fudged) | 10792.0 | 1 | 16 | 47042.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 21750.0 | 1 | 16 | 153792.0 | 1 | 32 |
| 4096 | Standalone (fudged) | 21875.0 | 1 | 16 | 96292.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 43542.0 | 1 | 16 | 309250.0 | 1 | 32 |
| 8192 | Standalone (fudged) | 45083.0 | 1 | 16 | 194958.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 86416.0 | 1 | 16 | 615875.0 | 1 | 32 |
| 16384 | Standalone (fudged) | 86000.0 | 1 | 16 | 391916.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 172791.0 | 1 | 16 | 1.233834e6 | 1 | 32 |
| 32768 | Standalone (fudged) | 172792.0 | 1 | 16 | 787875.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 345542.0 | 1 | 16 | 2.478375e6 | 1 | 32 |
| 65536 | Standalone (fudged) | 353167.0 | 1 | 16 | 1.593792e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 27062.5 | 34 | 2144 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM) | 28937.5 | 32 | 2064 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (Gauss-Newton) | 26354.5 | 29 | 1856 | 8 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, tall) | 45270.5 | 102 | 20896 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, fudged) | 25916.0 | 31 | 4384 | 9 | 9.2008e-01 | true | ok | NaN | rel\_dcost |
| 64 | LeastSquaresOptim (Dogleg, fudged) | 33583.5 | 191 | 462720 | 10 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | LeastSquaresOptim (LM, fudged) | 25166.0 | 147 | 360592 | 7 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 46104.5 | 309 | 21552 | 8 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | Optim (Newton) | 47375.0 | 191 | 5584 | 11 | 9.2008e-01 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 56479.5 | 59 | 5824 | 14 | 9.2008e-01 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (tron) | 125624.5 | 123 | 9856 | 23 | 9.2008e-01 | true | ok | NaN | first\_order |
| 64 | Ipopt | 1.225521e6 | 542 | 23504 | 14 | 9.2008e-01 | true | ok | NaN | first\_order |
| 64 | MadNLP | 474417.0 | 543 | 45056 | 14 | 9.2008e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM, fudged) | 467083.5 | 1318 | 220288 | 128 | 9.2008e-01 | true | ok | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion, fudged) | 211292.0 | 1343 | 3510208 | 20 | 9.2008e-01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 64 | CaNNOLeS (fudged) | 136166.5 | 176 | 65008 | 14 | 9.2008e-01 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 55500.0 | 34 | 2144 | 9 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM) | 67500.0 | 32 | 2064 | 10 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (Gauss-Newton) | 64708.5 | 29 | 1856 | 11 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, tall) | 96437.5 | 106 | 34272 | 10 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, fudged) | 40833.0 | 32 | 6400 | 8 | 1.8517e+00 | true | ok | NaN | rel\_dcost |
| 128 | LeastSquaresOptim (Dogleg, fudged) | 60396.0 | 214 | 516880 | 12 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | LeastSquaresOptim (LM, fudged) | 51584.0 | 184 | 466032 | 9 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 60583.0 | 309 | 21552 | 8 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | Optim (Newton) | 84104.0 | 227 | 6352 | 13 | 1.8517e+00 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 115750.0 | 59 | 9088 | 19 | 1.8517e+00 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (tron) | 133895.5 | 123 | 13664 | 15 | 1.8517e+00 | true | ok | NaN | first\_order |
| 128 | Ipopt | 1.312521e6 | 566 | 24848 | 14 | 1.8517e+00 | true | ok | NaN | first\_order |
| 128 | MadNLP | 560438.0 | 543 | 45056 | 14 | 1.8517e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM, fudged) | 659854.5 | 1295 | 355312 | 125 | 1.8517e+00 | true | ok | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion, fudged) | 358542.0 | 1620 | 4196800 | 23 | 1.8517e+00 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 128 | CaNNOLeS (fudged) | 1.7613125e6 | 591 | 138640 | 76 | 1.8517e+00 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 175021.0 | 34 | 2144 | 14 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM) | 167542.0 | 32 | 2064 | 13 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (Gauss-Newton) | 171479.0 | 29 | 1856 | 15 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, tall) | 223312.0 | 116 | 61600 | 13 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, fudged) | 123583.0 | 33 | 10464 | 14 | 3.7582e+00 | true | ok | NaN | rel\_dcost |
| 256 | LeastSquaresOptim (Dogleg, fudged) | 123000.0 | 231 | 573728 | 12 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | LeastSquaresOptim (LM, fudged) | 132520.5 | 241 | 625888 | 12 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 150167.0 | 449 | 32112 | 13 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | Optim (Newton) | 156750.0 | 225 | 6352 | 14 | 3.7582e+00 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 1.84025e6 | 332 | 33904 | 367 | 3.7582e+00 | false | not_converged | NaN | not\_desc; cost test passes |
| 256 | JSOSolvers (tron) | 1.04525e6 | 302 | 33744 | 57 | 3.7582e+00 | false | not_converged | NaN | small\_step; cost test passes |
| 256 | Ipopt | 2.1625415e6 | 932 | 39728 | 27 | 3.7582e+00 | true | ok | NaN | first\_order |
| 256 | MadNLP | 888500.0 | 543 | 45056 | 27 | 3.7582e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM, fudged) | 1.435292e6 | 1894 | 927712 | 156 | 3.7582e+00 | true | ok | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion, fudged) | 673167.0 | 1455 | 3858352 | 32 | 3.7582e+00 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 256 | CaNNOLeS (fudged) | 1.0357085e6 | 213 | 246160 | 31 | 3.7582e+00 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 213958.5 | 34 | 2144 | 9 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM) | 238312.5 | 32 | 2064 | 9 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (Gauss-Newton) | 230395.5 | 29 | 1856 | 10 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, tall) | 315542.0 | 116 | 115872 | 9 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, fudged) | 144500.0 | 33 | 18656 | 8 | 7.4865e+00 | true | ok | NaN | rel\_dcost |
| 512 | LeastSquaresOptim (Dogleg, fudged) | 198937.5 | 199 | 484288 | 11 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | LeastSquaresOptim (LM, fudged) | 171041.5 | 169 | 436000 | 8 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 172958.5 | 309 | 21552 | 8 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | Optim (Newton) | 237021.5 | 196 | 5680 | 11 | 7.4865e+00 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 2.911458e6 | 334 | 46224 | 355 | 7.4865e+00 | false | not_converged | NaN | not\_desc; cost test passes |
| 512 | JSOSolvers (tron) | 668396.0 | 130 | 34944 | 22 | 7.4865e+00 | true | ok | NaN | first\_order |
| 512 | Ipopt | 1.555021e6 | 566 | 24848 | 14 | 7.4865e+00 | true | ok | NaN | first\_order |
| 512 | MadNLP | 1.962291e6 | 543 | 45056 | 21 | 7.4865e+00 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 512 | NonlinearSolve (LM, fudged) | 2.059104e6 | 1520 | 1408064 | 122 | 7.4865e+00 | true | ok | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion, fudged) | 784125.0 | 1125 | 3387904 | 17 | 7.4865e+00 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 512 | CaNNOLeS (fudged) | 1.1116665e6 | 218 | 485344 | 16 | 7.4865e+00 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 344916.5 | 34 | 2144 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM) | 363187.5 | 32 | 2064 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (Gauss-Newton) | 380937.0 | 29 | 1856 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, tall) | 494666.5 | 116 | 224416 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, fudged) | 287666.5 | 33 | 35040 | 8 | 1.4950e+01 | true | ok | NaN | rel\_dcost |
| 1024 | LeastSquaresOptim (Dogleg, fudged) | 299500.0 | 159 | 406880 | 8 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | LeastSquaresOptim (LM, fudged) | 345229.5 | 169 | 463648 | 8 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 283479.0 | 281 | 19440 | 7 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | Optim (Newton) | 290916.5 | 134 | 4336 | 7 | 1.4950e+01 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 4.358833e6 | 334 | 70800 | 333 | 1.4950e+01 | false | not_converged | NaN | not\_desc; cost test passes |
| 1024 | JSOSolvers (tron) | 3.205083e6 | 302 | 76752 | 44 | 1.4950e+01 | false | not_converged | NaN | small\_step; cost test passes |
| 1024 | Ipopt | 1.456875e6 | 452 | 19760 | 11 | 1.4950e+01 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 1.021104e6 | 543 | 45056 | 12 | 1.4950e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM, fudged) | 3.9000625e6 | 1520 | 2748480 | 122 | 1.4950e+01 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion, fudged) | 2.179e6 | 1719 | 6485872 | 23 | 1.4950e+01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 1024 | CaNNOLeS (fudged) | 1.8102085e6 | 218 | 1045472 | 13 | 1.4950e+01 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 937708.5 | 34 | 2144 | 9 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM) | 798312.5 | 32 | 2064 | 8 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (Gauss-Newton) | 829958.5 | 29 | 1856 | 9 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, tall) | 1.0827495e6 | 116 | 441504 | 8 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, fudged) | 599104.0 | 33 | 67808 | 8 | 2.9833e+01 | true | ok | NaN | rel\_dcost |
| 2048 | LeastSquaresOptim (Dogleg, fudged) | 674000.0 | 177 | 506960 | 9 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | LeastSquaresOptim (LM, fudged) | 663041.0 | 169 | 527136 | 8 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 546104.0 | 281 | 19440 | 7 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | Optim (Newton) | 735771.0 | 160 | 4912 | 9 | 2.9833e+01 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 9.523709e6 | 334 | 119952 | 344 | 2.9833e+01 | false | not_converged | NaN | not\_desc; cost test passes |
| 2048 | JSOSolvers (tron) | 5.502e6 | 302 | 134096 | 37 | 2.9833e+01 | false | not_converged | NaN | small\_step; cost test passes |
| 2048 | Ipopt | 2.232875e6 | 512 | 22256 | 13 | 2.9833e+01 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 1.6164165e6 | 543 | 45056 | 13 | 2.9833e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM, fudged) | 7.9338755e6 | 1520 | 5453888 | 122 | 2.9833e+01 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion, fudged) | 3.230208e6 | 1433 | 7526496 | 14 | 2.9833e+01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 2048 | CaNNOLeS (fudged) | 3.9089375e6 | 218 | 1919968 | 14 | 2.9833e+01 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 1.8782705e6 | 34 | 2144 | 9 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM) | 1.5792085e6 | 32 | 2064 | 8 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (Gauss-Newton) | 1.502729e6 | 29 | 1856 | 8 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, tall) | 2.153834e6 | 116 | 892064 | 8 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, fudged) | 1.2107295e6 | 33 | 133344 | 7 | 5.9807e+01 | true | ok | NaN | rel\_dcost |
| 4096 | LeastSquaresOptim (Dogleg, fudged) | 1.186333e6 | 159 | 554336 | 8 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM, fudged) | 1.342125e6 | 169 | 637728 | 8 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 1.078979e6 | 281 | 19440 | 7 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | Optim (Newton) | 1.3483955e6 | 147 | 4624 | 8 | 5.9807e+01 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 1.9993375e7 | 334 | 218256 | 342 | 5.9807e+01 | false | not_converged | NaN | not\_desc; cost test passes |
| 4096 | JSOSolvers (tron) | 1.3865708e7 | 302 | 248784 | 48 | 5.9807e+01 | false | not_converged | NaN | small\_step; cost test passes |
| 4096 | Ipopt | 2.9166875e6 | 452 | 19760 | 11 | 5.9807e+01 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 4.610875e6 | 543 | 45056 | 18 | 5.9807e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM, fudged) | 1.56204375e7 | 1520 | 12814400 | 122 | 5.9807e+01 | true | ok | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion, fudged) | 4.601208e6 | 993 | 8144416 | 12 | 5.9807e+01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 4096 | CaNNOLeS (fudged) | 7.324542e6 | 218 | 3775456 | 13 | 5.9807e+01 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 2.670583e6 | 34 | 2144 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM) | 2.6811665e6 | 32 | 2064 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (Gauss-Newton) | 2.983125e6 | 29 | 1856 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, tall) | 3.8534585e6 | 116 | 1744032 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, fudged) | 2.410229e6 | 33 | 264416 | 8 | 1.1959e+02 | true | ok | NaN | rel\_dcost |
| 8192 | LeastSquaresOptim (Dogleg, fudged) | 2.5328335e6 | 159 | 750944 | 8 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | LeastSquaresOptim (LM, fudged) | 2.837958e6 | 169 | 834336 | 8 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 2.166375e6 | 281 | 19440 | 7 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | Optim (Newton) | 2.3588545e6 | 134 | 4336 | 7 | 1.1959e+02 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 4.3629e7 | 334 | 414864 | 351 | 1.1959e+02 | false | not_converged | NaN | not\_desc; cost test passes |
| 8192 | JSOSolvers (tron) | 2.6002625e7 | 302 | 478160 | 44 | 1.1959e+02 | false | not_converged | NaN | small\_step; cost test passes |
| 8192 | Ipopt | 4.894521e6 | 452 | 19760 | 11 | 1.1959e+02 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 4.230188e6 | 543 | 45056 | 11 | 1.1959e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM, fudged) | 3.0804208e7 | 1520 | 21465152 | 122 | 1.1959e+02 | true | ok | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion, fudged) | 1.3049792e7 | 1411 | 19992848 | 12 | 1.1959e+02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 8192 | CaNNOLeS (fudged) | 1.48056665e7 | 218 | 7019488 | 13 | 1.1959e+02 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 7.499875e6 | 34 | 2144 | 9 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM) | 6.2289995e6 | 32 | 2064 | 8 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (Gauss-Newton) | 5.9678125e6 | 29 | 1856 | 8 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, tall) | 8.873479e6 | 116 | 3447968 | 8 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, fudged) | 4.413542e6 | 33 | 526560 | 6 | 2.3926e+02 | true | ok | NaN | rel\_dcost |
| 16384 | LeastSquaresOptim (Dogleg, fudged) | 5.204771e6 | 159 | 1144160 | 8 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | LeastSquaresOptim (LM, fudged) | 5.786104e6 | 169 | 1227552 | 8 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 4.387125e6 | 281 | 19440 | 7 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | Optim (Newton) | 5.592625e6 | 147 | 4624 | 8 | 2.3926e+02 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 8.2180375e7 | 334 | 808080 | 335 | 2.3926e+02 | false | not_converged | NaN | not\_desc; cost test passes |
| 16384 | JSOSolvers (tron) | 4.5757708e7 | 302 | 936912 | 35 | 2.3926e+02 | false | not_converged | NaN | small\_step; cost test passes |
| 16384 | Ipopt | 9.878167e6 | 482 | 21008 | 12 | 2.3926e+02 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 9.0617915e6 | 543 | 45056 | 12 | 2.3926e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM, fudged) | 6.6772667e7 | 1520 | 38766656 | 122 | 2.3926e+02 | true | ok | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion, fudged) | 3.1667833e7 | 1565 | 40797248 | 14 | 2.3926e+02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 16384 | CaNNOLeS (fudged) | 3.0112625e7 | 218 | 13523936 | 13 | 2.3926e+02 | true | ok | NaN | first\_order |
| 32768 | SecondOrderOptimization (Dogleg) | 1.06454795e7 | 34 | 2144 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM) | 1.0749896e7 | 32 | 2064 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (Gauss-Newton) | 1.1919375e7 | 29 | 1856 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, tall) | 1.55478335e7 | 116 | 6855840 | 8 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, fudged) | 8.5797085e6 | 33 | 1050848 | 7 | 4.7821e+02 | true | ok | NaN | rel\_dcost |
| 32768 | LeastSquaresOptim (Dogleg, fudged) | 1.06158335e7 | 159 | 1930592 | 8 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | LeastSquaresOptim (LM, fudged) | 1.1772229e7 | 169 | 2013984 | 8 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 8.8362915e6 | 281 | 19440 | 7 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | Optim (Newton) | 1.00308545e7 | 134 | 4336 | 7 | 4.7821e+02 | true | ok | NaN | converged |
| 32768 | JSOSolvers (trunk) | 1.68103333e8 | 334 | 1594512 | 336 | 4.7821e+02 | false | not_converged | NaN | not\_desc; cost test passes |
| 32768 | JSOSolvers (tron) | 1.150445e8 | 302 | 1854416 | 45 | 4.7821e+02 | false | not_converged | NaN | small\_step; cost test passes |
| 32768 | Ipopt | 1.88085205e7 | 482 | 21008 | 12 | 4.7821e+02 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 1.8086562e7 | 543 | 45056 | 12 | 4.7821e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM, fudged) | 1.36027479e8 | 1520 | 73369664 | 122 | 4.7821e+02 | true | ok | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion, fudged) | 6.5405333e7 | 1543 | 76922096 | 13 | 4.7821e+02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 32768 | CaNNOLeS (fudged) | 6.26107085e7 | 224 | 27532480 | 13 | 4.7821e+02 | true | ok | NaN | first\_order |
| 65536 | SecondOrderOptimization (Dogleg) | 2.9836875e7 | 34 | 2144 | 9 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM) | 2.4925291e7 | 32 | 2064 | 8 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (Gauss-Newton) | 2.3838458e7 | 29 | 1856 | 8 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, tall) | 3.49875e7 | 116 | 13671584 | 8 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, fudged) | 2.0166584e7 | 33 | 2099424 | 7 | 9.5686e+02 | true | ok | NaN | rel\_dcost |
| 65536 | LeastSquaresOptim (Dogleg, fudged) | 2.1279375e7 | 159 | 3503456 | 8 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | LeastSquaresOptim (LM, fudged) | 2.3647708e7 | 169 | 3586848 | 8 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 1.7843417e7 | 281 | 19440 | 7 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | Optim (Newton) | 2.3290104e7 | 147 | 4624 | 8 | 9.5686e+02 | true | ok | NaN | converged |
| 65536 | JSOSolvers (trunk) | 3.38686042e8 | 334 | 3167376 | 337 | 9.5686e+02 | false | not_converged | NaN | not\_desc; cost test passes |
| 65536 | JSOSolvers (tron) | 2.07362666e8 | 302 | 3689424 | 40 | 9.5686e+02 | false | not_converged | NaN | small\_step; cost test passes |
| 65536 | Ipopt | 3.6948458e7 | 482 | 21008 | 12 | 9.5686e+02 | true | ok | NaN | first\_order |
| 65536 | MadNLP | 3.3794875e7 | 543 | 45056 | 11 | 9.5686e+02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM, fudged) | 2.796580205e8 | 1520 | 142575680 | 122 | 9.5686e+02 | true | ok | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion, fudged) | 1.75144958e8 | 1807 | 176100528 | 21 | 9.5686e+02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 65536 | CaNNOLeS (fudged) | 1.33273541e8 | 218 | 71277536 | 14 | 9.5686e+02 | true | ok | NaN | first\_order |
