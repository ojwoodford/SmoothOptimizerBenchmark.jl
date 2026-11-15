# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T03:32:05
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | NLLSModel (Static) | 328.04761904761904 | 1 | 16 | 1553.5714285714287 | 1 | 32 |
| 64 | Standalone | 322.74603174603175 | 1 | 16 | 933.7272727272727 | 1 | 32 |
| 128 | NLLSModel (Static) | 588.1142857142858 | 1 | 16 | 2982.1428571428573 | 1 | 32 |
| 128 | Standalone | 567.1388888888889 | 1 | 16 | 1736.0833333333333 | 1 | 32 |
| 256 | NLLSModel (Static) | 1103.0526315789473 | 1 | 16 | 5979.25 | 1 | 32 |
| 256 | Standalone | 1085.5263157894738 | 1 | 16 | 3458.3333333333335 | 1 | 32 |
| 512 | NLLSModel (Static) | 2145.8 | 1 | 16 | 11750.0 | 1 | 32 |
| 512 | Standalone | 2079.2 | 1 | 16 | 6656.25 | 1 | 32 |
| 1024 | NLLSModel (Static) | 4216.6 | 1 | 16 | 24917.0 | 1 | 32 |
| 1024 | Standalone | 4141.6 | 1 | 16 | 13375.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 8375.0 | 1 | 16 | 49791.0 | 1 | 32 |
| 2048 | Standalone | 8194.333333333334 | 1 | 16 | 26833.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 16750.0 | 1 | 16 | 92500.0 | 1 | 32 |
| 4096 | Standalone | 16708.0 | 1 | 16 | 54666.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 33917.0 | 1 | 16 | 198458.0 | 1 | 32 |
| 8192 | Standalone | 32875.0 | 1 | 16 | 110417.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 66792.0 | 1 | 16 | 370583.0 | 1 | 32 |
| 16384 | Standalone | 66125.0 | 1 | 16 | 221125.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 133333.0 | 1 | 16 | 736041.0 | 1 | 32 |
| 32768 | Standalone | 131625.0 | 1 | 16 | 440083.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 266542.0 | 1 | 16 | 1.490209e6 | 1 | 32 |
| 65536 | Standalone | 264625.0 | 1 | 16 | 887209.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 10145.5 | 34 | 2144 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM) | 10333.0 | 32 | 2064 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, tall) | 23083.0 | 108 | 21088 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | LeastSquaresOptim (Dogleg) | 22667.0 | 115 | 258864 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 28937.5 | 147 | 360576 | 7 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 27188.0 | 225 | 15120 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (Newton) | 20729.5 | 116 | 3840 | 6 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 20229.5 | 59 | 5824 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (tron) | 34083.5 | 123 | 9856 | 7 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | Ipopt | 668791.5 | 275 | 11968 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | MadNLP | 298625.0 | 543 | 45056 | 6 | 1.3405e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 387375.0 | 1174 | 195232 | 112 | 1.3405e-02 | true | ok | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 336333.0 | 1563 | 4094688 | 16 | 1.3405e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 64 | CaNNOLeS | 65500.0 | 176 | 65008 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 17604.0 | 34 | 2144 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM) | 17667.0 | 32 | 2064 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, tall) | 38291.5 | 112 | 34464 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | LeastSquaresOptim (Dogleg) | 29687.5 | 116 | 261968 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 36896.0 | 148 | 364160 | 7 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 27833.5 | 197 | 13024 | 4 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (Newton) | 24541.5 | 103 | 3568 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 34770.5 | 59 | 9088 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (tron) | 53229.5 | 123 | 13664 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | Ipopt | 621083.5 | 245 | 10720 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | MadNLP | 289562.0 | 543 | 45056 | 5 | 2.5926e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 540145.5 | 1178 | 321600 | 112 | 2.5926e-02 | true | ok | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 254375.0 | 885 | 2266464 | 9 | 2.5926e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 128 | CaNNOLeS | 100916.5 | 185 | 122864 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 32562.5 | 34 | 2144 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM) | 32709.0 | 32 | 2064 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, tall) | 65625.0 | 122 | 61792 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | LeastSquaresOptim (Dogleg) | 43188.0 | 119 | 268016 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 66854.0 | 169 | 422160 | 8 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 35541.0 | 197 | 13024 | 4 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (Newton) | 37375.0 | 103 | 3568 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 58374.5 | 65 | 15040 | 7 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (tron) | 77604.0 | 130 | 20608 | 6 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | Ipopt | 630687.5 | 245 | 10720 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | MadNLP | 303437.5 | 543 | 45056 | 5 | 5.5410e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 892688.0 | 1410 | 681792 | 112 | 5.5410e-02 | true | ok | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 554125.0 | 1587 | 4213632 | 11 | 5.5410e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 256 | CaNNOLeS | 192979.0 | 213 | 246160 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 62249.5 | 34 | 2144 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM) | 62500.0 | 32 | 2064 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, tall) | 118750.5 | 122 | 116064 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | LeastSquaresOptim (Dogleg) | 76291.5 | 119 | 280304 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 99229.5 | 151 | 385056 | 7 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 63813.0 | 225 | 15120 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (Newton) | 72625.0 | 116 | 3840 | 6 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 128937.5 | 67 | 27360 | 9 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | JSOSolvers (tron) | 110021.0 | 130 | 34944 | 5 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | Ipopt | 692750.5 | 275 | 11968 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | MadNLP | 343271.0 | 543 | 45056 | 6 | 1.0665e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 1.5232705e6 | 1399 | 1290096 | 111 | 1.0665e-01 | true | ok | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 1.798041e6 | 3149 | 9589424 | 59 | 1.0665e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 512 | CaNNOLeS | 419354.5 | 218 | 485344 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 120563.0 | 34 | 2144 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM) | 122312.5 | 32 | 2064 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, tall) | 241875.0 | 122 | 224608 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | LeastSquaresOptim (Dogleg) | 132895.5 | 119 | 304880 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 175979.0 | 151 | 412704 | 7 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 88312.5 | 197 | 13024 | 4 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (Newton) | 121562.5 | 103 | 3568 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.350208e6 | 334 | 70800 | 320 | 2.0673e-01 | false | not_converged | NaN | not\_desc |
| 1024 | JSOSolvers (tron) | 244521.0 | 130 | 63616 | 6 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | Ipopt | 684104.5 | 245 | 10720 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 388729.5 | 543 | 45056 | 5 | 2.0673e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 2.9638125e6 | 1410 | 2538816 | 112 | 2.0673e-01 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 1.427792e6 | 1543 | 5815520 | 8 | 2.0673e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 1024 | CaNNOLeS | 722854.5 | 218 | 1045472 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 241375.0 | 34 | 2144 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM) | 241104.0 | 32 | 2064 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, tall) | 442208.5 | 122 | 441696 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | LeastSquaresOptim (Dogleg) | 255333.0 | 119 | 354032 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 344062.0 | 151 | 476192 | 7 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 190666.5 | 225 | 15120 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (Newton) | 255541.5 | 116 | 3840 | 6 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 288229.5 | 67 | 101088 | 5 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 2.397375e6 | 302 | 134096 | 24 | 4.1154e-01 | false | not_converged | NaN | small\_step |
| 2048 | Ipopt | 899375.0 | 275 | 11968 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 485250.0 | 543 | 45056 | 5 | 4.1154e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 5.595875e6 | 1410 | 5039424 | 112 | 4.1154e-01 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 2.479541e6 | 1455 | 7643040 | 9 | 4.1154e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 2048 | CaNNOLeS | 1.551396e6 | 218 | 1919968 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 489687.5 | 34 | 2144 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM) | 500229.0 | 32 | 2064 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, tall) | 888042.0 | 122 | 892256 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | LeastSquaresOptim (Dogleg) | 499375.0 | 119 | 452336 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 670895.5 | 151 | 586784 | 7 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 357146.0 | 225 | 15120 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (Newton) | 424937.5 | 103 | 3568 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 1.4316292e7 | 334 | 218256 | 328 | 8.3061e-01 | false | not_converged | NaN | not\_desc |
| 4096 | JSOSolvers (tron) | 5.259709e6 | 302 | 248784 | 28 | 8.3061e-01 | false | not_converged | NaN | small\_step |
| 4096 | Ipopt | 995500.5 | 245 | 10720 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 681125.0 | 543 | 45056 | 5 | 8.3061e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 1.0553167e7 | 1410 | 11826496 | 112 | 8.3061e-01 | true | ok | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion) | 3.03e6 | 905 | 7416016 | 7 | 8.3061e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 4096 | CaNNOLeS | 2.6846875e6 | 218 | 3775456 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 960521.0 | 34 | 2144 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM) | 961041.5 | 32 | 2064 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, tall) | 1.7409585e6 | 122 | 1744224 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | LeastSquaresOptim (Dogleg) | 1.063042e6 | 119 | 648944 | 5 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 1.411271e6 | 151 | 783392 | 7 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 571875.0 | 197 | 13024 | 4 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (Newton) | 983729.0 | 116 | 3840 | 6 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 2.8304875e7 | 334 | 414864 | 329 | 1.6555e+00 | false | not_converged | NaN | not\_desc |
| 8192 | JSOSolvers (tron) | 2.2960415e6 | 130 | 465024 | 7 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | Ipopt | 1.613083e6 | 275 | 11968 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.1003745e6 | 543 | 45056 | 5 | 1.6555e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | 1.9909875e7 | 1410 | 19821888 | 112 | 1.6555e+00 | true | ok | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion) | 6.929708e6 | 949 | 13416304 | 8 | 1.6555e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 8192 | CaNNOLeS | 6.226209e6 | 218 | 7019488 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 1.9364375e6 | 34 | 2144 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM) | 1.9246035e6 | 32 | 2064 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, tall) | 3.531354e6 | 122 | 3448160 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | LeastSquaresOptim (Dogleg) | 2.2224165e6 | 119 | 1042160 | 5 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 2.8468545e6 | 151 | 1176608 | 7 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 1.1308545e6 | 197 | 13024 | 4 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (Newton) | 2.2254165e6 | 136 | 4224 | 6 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 5.6082791e7 | 334 | 808080 | 321 | 3.3011e+00 | false | not_converged | NaN | not\_desc |
| 16384 | JSOSolvers (tron) | 1.8544916e7 | 302 | 936912 | 21 | 3.3011e+00 | false | not_converged | NaN | small\_step |
| 16384 | Ipopt | 2.6184585e6 | 275 | 11968 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 1.938396e6 | 543 | 45056 | 5 | 3.3011e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | 4.1943375e7 | 1410 | 35812672 | 112 | 3.3011e+00 | true | ok | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion) | 1.3946916e7 | 905 | 23537872 | 8 | 3.3011e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 16384 | CaNNOLeS | 1.26705835e7 | 218 | 13523936 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 32768 | SecondOrderOptimization (Dogleg) | 3.8511665e6 | 34 | 2144 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM) | 3.8831875e6 | 32 | 2064 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, tall) | 7.520333e6 | 122 | 6856032 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | LeastSquaresOptim (Dogleg) | 4.466125e6 | 119 | 1828592 | 5 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 5.7241875e6 | 151 | 1963040 | 7 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 2.2554375e6 | 197 | 13024 | 4 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (Newton) | 3.912854e6 | 116 | 3840 | 6 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | JSOSolvers (trunk) | 1.150905e8 | 334 | 1594512 | 323 | 6.5496e+00 | false | not_converged | NaN | not\_desc |
| 32768 | JSOSolvers (tron) | 3.9588209e7 | 302 | 1854416 | 24 | 6.5496e+00 | false | not_converged | NaN | small\_step |
| 32768 | Ipopt | 4.5672705e6 | 275 | 11968 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 3.6204585e6 | 543 | 45056 | 5 | 6.5496e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | 8.3566708e7 | 1410 | 67794240 | 112 | 6.5496e+00 | true | ok | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion) | 4.8470375e7 | 1543 | 76922080 | 9 | 6.5496e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 32768 | CaNNOLeS | 2.5238e7 | 218 | 26532832 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 65536 | SecondOrderOptimization (Dogleg) | 7.7199375e6 | 34 | 2144 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM) | 7.7179795e6 | 32 | 2064 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, tall) | 1.48273335e7 | 122 | 13671776 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | LeastSquaresOptim (Dogleg) | 8.9319375e6 | 119 | 3401456 | 5 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | LeastSquaresOptim (LM) | 1.15265e7 | 151 | 3535904 | 7 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 4.487354e6 | 197 | 13024 | 4 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (Newton) | 7.818313e6 | 116 | 3840 | 6 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | JSOSolvers (trunk) | 2.26958167e8 | 334 | 3167376 | 321 | 1.3174e+01 | false | not_converged | NaN | not\_desc |
| 65536 | JSOSolvers (tron) | 6.8732375e7 | 302 | 3689424 | 20 | 1.3174e+01 | false | not_converged | NaN | small\_step |
| 65536 | Ipopt | 8.464229e6 | 275 | 11968 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
| 65536 | MadNLP | 6.958646e6 | 543 | 45056 | 5 | 1.3174e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM) | 1.65895583e8 | 1410 | 131757376 | 112 | 1.3174e+01 | true | ok | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion) | 9.81645e7 | 1543 | 150322400 | 11 | 1.3174e+01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 65536 | CaNNOLeS | 5.4470979e7 | 218 | 52534240 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
