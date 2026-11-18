# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T02:24:27
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
| 64 | NLLSModel (Static) | 319.44444444444446 | 1 | 16 | 1727.6153846153845 | 1 | 32 |
| 64 | Standalone | 323.6166666666667 | 1 | 16 | 930.5555555555555 | 1 | 32 |
| 128 | NLLSModel (Static) | 615.4571428571429 | 1 | 16 | 3319.5 | 1 | 32 |
| 128 | Standalone | 569.4444444444445 | 1 | 16 | 1732.6666666666667 | 1 | 32 |
| 256 | NLLSModel (Static) | 1100.842105263158 | 1 | 16 | 6083.25 | 1 | 32 |
| 256 | Standalone | 1070.157894736842 | 1 | 16 | 3409.6666666666665 | 1 | 32 |
| 512 | NLLSModel (Static) | 2141.6 | 1 | 16 | 12042.0 | 1 | 32 |
| 512 | Standalone | 2095.8 | 1 | 16 | 6916.666666666667 | 1 | 32 |
| 1024 | NLLSModel (Static) | 4250.0 | 1 | 16 | 25417.0 | 1 | 32 |
| 1024 | Standalone | 4166.8 | 1 | 16 | 13417.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 9000.0 | 1 | 16 | 47750.0 | 1 | 32 |
| 2048 | Standalone | 8208.333333333334 | 1 | 16 | 27625.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 16750.0 | 1 | 16 | 104500.0 | 1 | 32 |
| 4096 | Standalone | 17208.0 | 1 | 16 | 54666.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 33875.0 | 1 | 16 | 207625.0 | 1 | 32 |
| 8192 | Standalone | 33250.0 | 1 | 16 | 109875.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 66958.0 | 1 | 16 | 393125.0 | 1 | 32 |
| 16384 | Standalone | 67000.0 | 1 | 16 | 233875.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 146292.0 | 1 | 16 | 838958.0 | 1 | 32 |
| 32768 | Standalone | 132167.0 | 1 | 16 | 455750.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 274917.0 | 1 | 16 | 1.543292e6 | 1 | 32 |
| 65536 | Standalone | 282542.0 | 1 | 16 | 900625.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 10938.0 | 34 | 2144 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM) | 10895.5 | 32 | 2064 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, tall) | 24312.5 | 102 | 20896 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | LeastSquaresOptim (Dogleg) | 16042.0 | 115 | 258864 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 20375.0 | 147 | 360576 | 7 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 27312.5 | 225 | 15120 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (Newton) | 21479.0 | 116 | 3840 | 6 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 20083.5 | 59 | 5824 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (tron) | 34124.5 | 123 | 9856 | 7 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | Ipopt | 693271.0 | 275 | 11968 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | MadNLP | 294958.5 | 543 | 45056 | 6 | 1.3405e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 386729.0 | 1174 | 195232 | 112 | 1.3405e-02 | true | ok | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 227084.0 | 1563 | 4094688 | 16 | 1.3405e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 64 | CaNNOLeS | 63854.0 | 176 | 65008 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 18333.0 | 34 | 2144 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM) | 18541.0 | 32 | 2064 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, tall) | 37541.5 | 106 | 34272 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | LeastSquaresOptim (Dogleg) | 22291.0 | 116 | 261968 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 29500.0 | 148 | 364160 | 7 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 26500.0 | 197 | 13024 | 4 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (Newton) | 24187.5 | 103 | 3568 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 34396.0 | 59 | 9088 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (tron) | 52750.0 | 123 | 13664 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | Ipopt | 615062.5 | 245 | 10720 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | MadNLP | 280291.5 | 543 | 45056 | 5 | 2.5926e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 536938.0 | 1178 | 321600 | 112 | 2.5926e-02 | true | ok | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 195834.0 | 885 | 2266464 | 9 | 2.5926e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 128 | CaNNOLeS | 104625.0 | 185 | 122864 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 35479.0 | 34 | 2144 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM) | 34208.0 | 32 | 2064 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, tall) | 67396.0 | 116 | 61600 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | LeastSquaresOptim (Dogleg) | 39500.0 | 119 | 268016 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 58083.5 | 169 | 422160 | 8 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 35604.5 | 197 | 13024 | 4 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (Newton) | 37334.0 | 103 | 3568 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 59833.5 | 65 | 15040 | 7 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (tron) | 79646.0 | 130 | 20608 | 6 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | Ipopt | 638792.0 | 245 | 10720 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | MadNLP | 296167.0 | 543 | 45056 | 5 | 5.5410e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 892646.0 | 1410 | 681792 | 112 | 5.5410e-02 | true | ok | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 477333.0 | 1587 | 4213632 | 11 | 5.5410e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 256 | CaNNOLeS | 190667.0 | 213 | 246160 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 64479.0 | 34 | 2144 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM) | 64354.0 | 32 | 2064 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, tall) | 124708.0 | 116 | 115872 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | LeastSquaresOptim (Dogleg) | 69458.5 | 119 | 280304 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 92750.0 | 151 | 385056 | 7 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 62312.5 | 225 | 15120 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (Newton) | 73084.0 | 116 | 3840 | 6 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 131479.5 | 67 | 27360 | 9 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | JSOSolvers (tron) | 114020.5 | 130 | 34944 | 5 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | Ipopt | 771354.5 | 275 | 11968 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | MadNLP | 379459.0 | 543 | 45056 | 6 | 1.0665e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 1.6008125e6 | 1399 | 1290096 | 111 | 1.0665e-01 | true | ok | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 1.91975e6 | 3149 | 9589424 | 59 | 1.0665e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 512 | CaNNOLeS | 433000.5 | 218 | 485344 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 130000.0 | 34 | 2144 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM) | 133729.0 | 32 | 2064 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, tall) | 242021.0 | 116 | 224416 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | LeastSquaresOptim (Dogleg) | 133520.5 | 119 | 304880 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 178625.0 | 151 | 412704 | 7 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 90041.5 | 197 | 13024 | 4 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (Newton) | 119687.5 | 103 | 3568 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.605042e6 | 334 | 70800 | 320 | 2.0673e-01 | false | not_converged | NaN | not\_desc |
| 1024 | JSOSolvers (tron) | 249646.0 | 130 | 63616 | 6 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | Ipopt | 716645.5 | 245 | 10720 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 403541.5 | 543 | 45056 | 5 | 2.0673e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 2.8822085e6 | 1410 | 2538816 | 112 | 2.0673e-01 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 1.356042e6 | 1543 | 5815520 | 8 | 2.0673e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 1024 | CaNNOLeS | 697083.5 | 218 | 1045472 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 254416.5 | 34 | 2144 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM) | 254479.5 | 32 | 2064 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, tall) | 462666.0 | 116 | 441504 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | LeastSquaresOptim (Dogleg) | 256687.5 | 119 | 354032 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 346188.0 | 151 | 476192 | 7 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 189958.5 | 225 | 15120 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (Newton) | 254104.0 | 116 | 3840 | 6 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 283146.0 | 67 | 101088 | 5 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 2.415042e6 | 302 | 134096 | 24 | 4.1154e-01 | false | not_converged | NaN | small\_step |
| 2048 | Ipopt | 904062.5 | 275 | 11968 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 480979.5 | 543 | 45056 | 5 | 4.1154e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 5.6245835e6 | 1410 | 5039424 | 112 | 4.1154e-01 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 2.508041e6 | 1455 | 7643040 | 9 | 4.1154e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 2048 | CaNNOLeS | 1.5890415e6 | 218 | 1919968 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 508333.0 | 34 | 2144 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM) | 791208.5 | 32 | 2064 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, tall) | 961145.5 | 116 | 892064 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | LeastSquaresOptim (Dogleg) | 514271.0 | 119 | 452336 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 698312.5 | 151 | 586784 | 7 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 370708.5 | 225 | 15120 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (Newton) | 439021.0 | 103 | 3568 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 1.4922208e7 | 334 | 218256 | 328 | 8.3061e-01 | false | not_converged | NaN | not\_desc |
| 4096 | JSOSolvers (tron) | 5.815125e6 | 302 | 248784 | 28 | 8.3061e-01 | false | not_converged | NaN | small\_step |
| 4096 | Ipopt | 1.054e6 | 245 | 10720 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 687354.5 | 543 | 45056 | 5 | 8.3061e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 1.075975e7 | 1410 | 11826496 | 112 | 8.3061e-01 | true | ok | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion) | 3.107833e6 | 905 | 7416016 | 7 | 8.3061e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 4096 | CaNNOLeS | 2.7062705e6 | 218 | 3775456 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 1.0122915e6 | 34 | 2144 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM) | 1.010875e6 | 32 | 2064 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, tall) | 2.1051875e6 | 116 | 1744032 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | LeastSquaresOptim (Dogleg) | 1.094896e6 | 119 | 648944 | 5 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 1.429896e6 | 151 | 783392 | 7 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 576187.5 | 197 | 13024 | 4 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (Newton) | 1.012167e6 | 116 | 3840 | 6 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 2.915875e7 | 334 | 414864 | 329 | 1.6555e+00 | false | not_converged | NaN | not\_desc |
| 8192 | JSOSolvers (tron) | 2.3398125e6 | 130 | 465024 | 7 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | Ipopt | 1.6534375e6 | 275 | 11968 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.129229e6 | 543 | 45056 | 5 | 1.6555e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | 2.0919333e7 | 1410 | 19821888 | 112 | 1.6555e+00 | true | ok | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion) | 7.127708e6 | 949 | 13416304 | 8 | 1.6555e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 8192 | CaNNOLeS | 6.333979e6 | 218 | 7019488 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 2.083646e6 | 34 | 2144 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM) | 2.055375e6 | 32 | 2064 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, tall) | 4.017479e6 | 116 | 3447968 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | LeastSquaresOptim (Dogleg) | 2.290062e6 | 119 | 1042160 | 5 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 3.0196875e6 | 151 | 1176608 | 7 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 1.178979e6 | 197 | 13024 | 4 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (Newton) | 2.295479e6 | 136 | 4224 | 6 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 5.8364e7 | 334 | 808080 | 321 | 3.3011e+00 | false | not_converged | NaN | not\_desc |
| 16384 | JSOSolvers (tron) | 1.8879917e7 | 302 | 936912 | 21 | 3.3011e+00 | false | not_converged | NaN | small\_step |
| 16384 | Ipopt | 2.649292e6 | 275 | 11968 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 1.975625e6 | 543 | 45056 | 5 | 3.3011e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | 4.3971166e7 | 1410 | 35812672 | 112 | 3.3011e+00 | true | ok | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion) | 1.4387041e7 | 905 | 23537872 | 8 | 3.3011e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 16384 | CaNNOLeS | 1.2732521e7 | 218 | 13523936 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 32768 | SecondOrderOptimization (Dogleg) | 4.1584375e6 | 34 | 2144 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM) | 4.1360835e6 | 32 | 2064 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, tall) | 8.184583e6 | 116 | 6855840 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | LeastSquaresOptim (Dogleg) | 4.49325e6 | 119 | 1828592 | 5 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 5.911229e6 | 151 | 1963040 | 7 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 2.3298955e6 | 197 | 13024 | 4 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (Newton) | 3.9982915e6 | 116 | 3840 | 6 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | JSOSolvers (trunk) | 1.17568125e8 | 334 | 1594512 | 323 | 6.5496e+00 | false | not_converged | NaN | not\_desc |
| 32768 | JSOSolvers (tron) | 4.1968875e7 | 302 | 1854416 | 24 | 6.5496e+00 | false | not_converged | NaN | small\_step |
| 32768 | Ipopt | 4.7787505e6 | 275 | 11968 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 3.666542e6 | 543 | 45056 | 5 | 6.5496e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | 8.73860835e7 | 1410 | 67794240 | 112 | 6.5496e+00 | true | ok | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion) | 5.0006583e7 | 1543 | 76922080 | 9 | 6.5496e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 32768 | CaNNOLeS | 2.5803667e7 | 218 | 26565600 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 65536 | SecondOrderOptimization (Dogleg) | 8.416979e6 | 34 | 2144 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM) | 8.1415835e6 | 32 | 2064 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, tall) | 1.6230958e7 | 116 | 13671584 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | LeastSquaresOptim (Dogleg) | 9.043229e6 | 119 | 3401456 | 5 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | LeastSquaresOptim (LM) | 1.1735021e7 | 151 | 3535904 | 7 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 4.5422295e6 | 197 | 13024 | 4 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (Newton) | 8.1075e6 | 116 | 3840 | 6 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | JSOSolvers (trunk) | 2.30351083e8 | 334 | 3167376 | 321 | 1.3174e+01 | false | not_converged | NaN | not\_desc |
| 65536 | JSOSolvers (tron) | 6.9787042e7 | 302 | 3689424 | 20 | 1.3174e+01 | false | not_converged | NaN | small\_step |
| 65536 | Ipopt | 8.712667e6 | 275 | 11968 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
| 65536 | MadNLP | 7.294021e6 | 543 | 45056 | 5 | 1.3174e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM) | 1.68106875e8 | 1410 | 131757376 | 112 | 1.3174e+01 | true | ok | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion) | 9.4236292e7 | 1543 | 150322400 | 11 | 1.3174e+01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 65536 | CaNNOLeS | 5.3793583e7 | 218 | 55843808 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
