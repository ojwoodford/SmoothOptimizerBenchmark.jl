# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T02:47:57
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | NLLSModel (Static) | 319.671875 | 1 | 16 | 1567.3076923076924 | 1 | 32 |
| 64 | Standalone | 331.3225806451613 | 1 | 16 | 929.9090909090909 | 1 | 32 |
| 128 | NLLSModel (Static) | 584.5428571428571 | 1 | 16 | 3261.8571428571427 | 1 | 32 |
| 128 | Standalone | 612.3636363636364 | 1 | 16 | 1738.6363636363637 | 1 | 32 |
| 256 | NLLSModel (Static) | 734.2068965517242 | 1 | 16 | 5822.75 | 1 | 32 |
| 256 | Standalone | 1087.7368421052631 | 1 | 16 | 3437.5 | 1 | 32 |
| 512 | NLLSModel (Static) | 781.25 | 1 | 16 | 12375.0 | 1 | 32 |
| 512 | Standalone | 2154.2 | 1 | 16 | 6944.333333333333 | 1 | 32 |
| 1024 | NLLSModel (Static) | 1407.7142857142858 | 1 | 16 | 13625.0 | 1 | 32 |
| 1024 | Standalone | 4266.6 | 1 | 16 | 13625.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 2083.25 | 1 | 16 | 14875.0 | 1 | 32 |
| 2048 | Standalone | 8791.666666666666 | 1 | 16 | 26917.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 3041.714285714286 | 1 | 16 | 36625.0 | 1 | 32 |
| 4096 | Standalone | 17250.0 | 1 | 16 | 54750.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 5354.25 | 1 | 16 | 93209.0 | 1 | 32 |
| 8192 | Standalone | 34000.0 | 1 | 16 | 113250.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 9834.0 | 1 | 16 | 202166.0 | 1 | 32 |
| 16384 | Standalone | 66166.0 | 1 | 16 | 221375.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 18708.0 | 1 | 16 | 294625.0 | 1 | 32 |
| 32768 | Standalone | 143375.0 | 1 | 16 | 492750.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 38208.0 | 1 | 16 | 1.05225e6 | 1 | 32 |
| 65536 | Standalone | 264167.0 | 1 | 16 | 886584.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 10167.0 | 34 | 2144 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM) | 10687.5 | 32 | 2064 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, tall) | 22291.5 | 108 | 21088 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | LeastSquaresOptim (Dogleg) | 15458.5 | 115 | 258864 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 21187.5 | 147 | 360576 | 7 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 26771.0 | 225 | 15120 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (Newton) | 21125.0 | 116 | 3840 | 6 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 22458.5 | 59 | 5824 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (tron) | 37562.0 | 123 | 9856 | 7 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | Ipopt | 685625.0 | 275 | 11968 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | MadNLP | 340166.5 | 543 | 45056 | 6 | 1.3405e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 386292.0 | 1174 | 195232 | 112 | 1.3405e-02 | true | ok | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 222750.0 | 1563 | 4094688 | 16 | 1.3405e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 64 | CaNNOLeS | 66083.0 | 176 | 65008 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 17750.0 | 34 | 2144 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM) | 17958.5 | 32 | 2064 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, tall) | 36062.5 | 112 | 34464 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | LeastSquaresOptim (Dogleg) | 22875.0 | 116 | 261968 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 30521.0 | 148 | 364160 | 7 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 26979.0 | 197 | 13024 | 4 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (Newton) | 23500.0 | 103 | 3568 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 33854.0 | 59 | 9088 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (tron) | 52062.0 | 123 | 13664 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | Ipopt | 598563.0 | 245 | 10720 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | MadNLP | 318291.5 | 543 | 45056 | 5 | 2.5926e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 533500.0 | 1178 | 321600 | 112 | 2.5926e-02 | true | ok | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 205125.0 | 885 | 2266464 | 9 | 2.5926e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 128 | CaNNOLeS | 94375.0 | 185 | 122864 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 33292.0 | 34 | 2144 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM) | 33145.5 | 32 | 2064 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, tall) | 44063.0 | 122 | 61856 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | LeastSquaresOptim (Dogleg) | 39375.0 | 119 | 268016 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 58500.0 | 169 | 422160 | 8 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 35854.0 | 197 | 13024 | 4 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (Newton) | 36000.0 | 103 | 3568 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 56687.5 | 65 | 15040 | 7 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (tron) | 76103.5 | 130 | 20608 | 6 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | Ipopt | 601146.0 | 245 | 10720 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | MadNLP | 296208.5 | 543 | 45056 | 5 | 5.5410e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 872104.0 | 1410 | 681792 | 112 | 5.5410e-02 | true | ok | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 459875.0 | 1587 | 4213632 | 11 | 5.5410e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 256 | CaNNOLeS | 182895.5 | 213 | 246160 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 63916.5 | 34 | 2144 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM) | 64750.0 | 32 | 2064 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, tall) | 73854.5 | 122 | 116256 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | LeastSquaresOptim (Dogleg) | 71000.0 | 119 | 280304 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 96000.0 | 151 | 385056 | 7 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 64125.0 | 225 | 15120 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (Newton) | 71208.0 | 116 | 3840 | 6 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 129104.0 | 67 | 27360 | 9 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | JSOSolvers (tron) | 111771.0 | 130 | 34944 | 5 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | Ipopt | 695958.0 | 275 | 11968 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | MadNLP | 341291.5 | 543 | 45056 | 6 | 1.0665e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 1.5170625e6 | 1399 | 1290096 | 111 | 1.0665e-01 | true | ok | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 1.80475e6 | 3149 | 9589424 | 59 | 1.0665e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 512 | CaNNOLeS | 394583.5 | 218 | 485344 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 53625.0 | 56 | 3424 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM) | 53958.0 | 54 | 3344 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, tall) | 138458.0 | 122 | 224832 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | LeastSquaresOptim (Dogleg) | 133771.0 | 119 | 304880 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 182124.5 | 151 | 412704 | 7 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 90667.0 | 197 | 13024 | 4 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (Newton) | 120104.5 | 103 | 3568 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.492667e6 | 334 | 70800 | 320 | 2.0673e-01 | false | not_converged | NaN | not\_desc |
| 1024 | JSOSolvers (tron) | 252541.5 | 130 | 63616 | 6 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | Ipopt | 716854.0 | 245 | 10720 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 402312.5 | 543 | 45056 | 5 | 2.0673e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 3.0445e6 | 1410 | 2538816 | 112 | 2.0673e-01 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 1.401458e6 | 1543 | 5815520 | 8 | 2.0673e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 1024 | CaNNOLeS | 690145.5 | 218 | 1045472 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 127667.0 | 58 | 3632 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM) | 129479.5 | 56 | 3552 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, tall) | 232603.5 | 122 | 441920 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | LeastSquaresOptim (Dogleg) | 265771.0 | 119 | 354032 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 359833.5 | 151 | 476192 | 7 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 194645.5 | 225 | 15120 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (Newton) | 260396.0 | 116 | 3840 | 6 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 285646.0 | 67 | 101088 | 5 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 2.381666e6 | 302 | 134096 | 24 | 4.1154e-01 | false | not_converged | NaN | small\_step |
| 2048 | Ipopt | 887437.5 | 275 | 11968 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 503583.0 | 543 | 45056 | 5 | 4.1154e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 5.5724165e6 | 1410 | 5039424 | 112 | 4.1154e-01 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 2.44175e6 | 1455 | 7643040 | 9 | 4.1154e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 2048 | CaNNOLeS | 1.547062e6 | 218 | 1919968 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 163458.5 | 58 | 3632 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM) | 233750.0 | 56 | 3552 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, tall) | 451062.5 | 122 | 892480 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | LeastSquaresOptim (Dogleg) | 498729.5 | 119 | 452336 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 661604.5 | 151 | 586784 | 7 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 350125.0 | 225 | 15120 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (Newton) | 422291.5 | 103 | 3568 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 1.4319792e7 | 334 | 218256 | 328 | 8.3061e-01 | false | not_converged | NaN | not\_desc |
| 4096 | JSOSolvers (tron) | 5.263e6 | 302 | 248784 | 28 | 8.3061e-01 | false | not_converged | NaN | small\_step |
| 4096 | Ipopt | 998104.0 | 245 | 10720 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 733208.5 | 543 | 45056 | 5 | 8.3061e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 1.12295835e7 | 1410 | 11826496 | 112 | 8.3061e-01 | true | ok | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion) | 3.056083e6 | 905 | 7416016 | 7 | 8.3061e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 4096 | CaNNOLeS | 2.6860625e6 | 218 | 3775456 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 339729.0 | 58 | 3632 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM) | 338875.0 | 56 | 3552 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, tall) | 905396.0 | 122 | 1744448 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | LeastSquaresOptim (Dogleg) | 1.0657495e6 | 119 | 648944 | 5 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 1.4133335e6 | 151 | 783392 | 7 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 570333.0 | 197 | 13024 | 4 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (Newton) | 1.0099995e6 | 116 | 3840 | 6 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 2.8378459e7 | 334 | 414864 | 329 | 1.6555e+00 | false | not_converged | NaN | not\_desc |
| 8192 | JSOSolvers (tron) | 2.4128125e6 | 130 | 465024 | 7 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | Ipopt | 1.7269375e6 | 275 | 11968 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.143334e6 | 543 | 45056 | 5 | 1.6555e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | 2.0433083e7 | 1410 | 19821888 | 112 | 1.6555e+00 | true | ok | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion) | 7.243916e6 | 949 | 13416304 | 8 | 1.6555e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 8192 | CaNNOLeS | 6.478354e6 | 218 | 7019488 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 981041.5 | 58 | 3632 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM) | 942646.0 | 56 | 3552 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, tall) | 1.8592295e6 | 122 | 3448384 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | LeastSquaresOptim (Dogleg) | 2.2212495e6 | 119 | 1042160 | 5 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 2.8464375e6 | 151 | 1176608 | 7 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 1.1313125e6 | 197 | 13024 | 4 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (Newton) | 2.2274165e6 | 136 | 4224 | 6 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 5.6757708e7 | 334 | 808080 | 321 | 3.3011e+00 | false | not_converged | NaN | not\_desc |
| 16384 | JSOSolvers (tron) | 1.8366959e7 | 302 | 936912 | 21 | 3.3011e+00 | false | not_converged | NaN | small\_step |
| 16384 | Ipopt | 2.612771e6 | 275 | 11968 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 1.9394165e6 | 543 | 45056 | 5 | 3.3011e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | 4.1828875e7 | 1410 | 35812672 | 112 | 3.3011e+00 | true | ok | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion) | 1.3960167e7 | 905 | 23537872 | 8 | 3.3011e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 16384 | CaNNOLeS | 1.28464165e7 | 218 | 13523936 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 32768 | SecondOrderOptimization (Dogleg) | 1.9212295e6 | 58 | 3632 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM) | 1.6546665e6 | 56 | 3552 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, tall) | 3.6820835e6 | 122 | 6856256 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | LeastSquaresOptim (Dogleg) | 4.552687e6 | 119 | 1828592 | 5 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 5.808583e6 | 151 | 1963040 | 7 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 2.3451875e6 | 197 | 13024 | 4 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (Newton) | 3.920854e6 | 116 | 3840 | 6 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | JSOSolvers (trunk) | 1.16199542e8 | 334 | 1594512 | 323 | 6.5496e+00 | false | not_converged | NaN | not\_desc |
| 32768 | JSOSolvers (tron) | 3.982625e7 | 302 | 1854416 | 24 | 6.5496e+00 | false | not_converged | NaN | small\_step |
| 32768 | Ipopt | 4.5694995e6 | 275 | 11968 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 3.6497505e6 | 543 | 45056 | 5 | 6.5496e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | 8.2331917e7 | 1410 | 67794240 | 112 | 6.5496e+00 | true | ok | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion) | 4.7745375e7 | 1543 | 76922080 | 9 | 6.5496e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 32768 | CaNNOLeS | 2.5692458e7 | 218 | 27532256 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 65536 | SecondOrderOptimization (Dogleg) | 3.6274795e6 | 58 | 3632 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM) | 3.8869165e6 | 56 | 3552 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, tall) | 7.4058125e6 | 122 | 13672000 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | LeastSquaresOptim (Dogleg) | 9.1604375e6 | 119 | 3401456 | 5 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | LeastSquaresOptim (LM) | 1.1508021e7 | 151 | 3535904 | 7 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 4.624542e6 | 197 | 13024 | 4 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (Newton) | 7.855271e6 | 116 | 3840 | 6 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | JSOSolvers (trunk) | 2.29171833e8 | 334 | 3167376 | 321 | 1.3174e+01 | false | not_converged | NaN | not\_desc |
| 65536 | JSOSolvers (tron) | 7.0304208e7 | 302 | 3689424 | 20 | 1.3174e+01 | false | not_converged | NaN | small\_step |
| 65536 | Ipopt | 8.8758125e6 | 275 | 11968 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
| 65536 | MadNLP | 6.991646e6 | 543 | 45056 | 5 | 1.3174e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM) | 1.67394375e8 | 1410 | 131757376 | 112 | 1.3174e+01 | true | ok | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion) | 1.00725209e8 | 1543 | 150322400 | 11 | 1.3174e+01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 65536 | CaNNOLeS | 5.3039417e7 | 218 | 63134688 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
