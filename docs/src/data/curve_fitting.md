# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T01:34:15
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
| 64 | NLLSModel (Static) | 320.17543859649123 | 1 | 16 | 1625.0 | 1 | 32 |
| 64 | Standalone | 329.2295081967213 | 1 | 16 | 969.7272727272727 | 1 | 32 |
| 128 | NLLSModel (Static) | 580.9428571428572 | 1 | 16 | 3125.0 | 1 | 32 |
| 128 | Standalone | 583.3142857142857 | 1 | 16 | 1784.75 | 1 | 32 |
| 256 | NLLSModel (Static) | 735.6206896551724 | 1 | 16 | 6135.5 | 1 | 32 |
| 256 | Standalone | 1074.5263157894738 | 1 | 16 | 3666.6666666666665 | 1 | 32 |
| 512 | NLLSModel (Static) | 781.68 | 1 | 16 | 13750.0 | 1 | 32 |
| 512 | Standalone | 2162.0 | 1 | 16 | 6694.333333333333 | 1 | 32 |
| 1024 | NLLSModel (Static) | 3576.3333333333335 | 1 | 16 | 9916.0 | 1 | 32 |
| 1024 | Standalone | 4258.4 | 1 | 16 | 14208.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 6375.0 | 1 | 16 | 16625.0 | 1 | 32 |
| 2048 | Standalone | 8708.333333333334 | 1 | 16 | 26791.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 3065.4285714285716 | 1 | 16 | 44458.0 | 1 | 32 |
| 4096 | Standalone | 17708.0 | 1 | 16 | 54250.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 5281.25 | 1 | 16 | 99875.0 | 1 | 32 |
| 8192 | Standalone | 33625.0 | 1 | 16 | 125458.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 9667.0 | 1 | 16 | 136500.0 | 1 | 32 |
| 16384 | Standalone | 65667.0 | 1 | 16 | 240625.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 18708.0 | 1 | 16 | 461541.0 | 1 | 32 |
| 32768 | Standalone | 136334.0 | 1 | 16 | 454792.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 36709.0 | 1 | 16 | 563917.0 | 1 | 32 |
| 65536 | Standalone | 280417.0 | 1 | 16 | 892666.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 11708.0 | 34 | 2144 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM) | 11645.5 | 32 | 2064 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, tall) | 24500.0 | 102 | 20896 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | LeastSquaresOptim (Dogleg) | 16667.0 | 115 | 258864 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 23375.0 | 147 | 360576 | 7 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 30042.0 | 225 | 15120 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (Newton) | 23062.5 | 116 | 3840 | 6 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 21625.0 | 59 | 5824 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (tron) | 35583.0 | 123 | 9856 | 7 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | Ipopt | 734666.5 | 275 | 11968 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | MadNLP | 326895.5 | 543 | 45056 | 6 | 1.3405e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 450874.5 | 1174 | 195232 | 112 | 1.3405e-02 | true | ok | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 237458.0 | 1563 | 4094688 | 16 | 1.3405e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 64 | CaNNOLeS | 69562.5 | 176 | 65008 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 18208.0 | 34 | 2144 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM) | 18208.5 | 32 | 2064 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, tall) | 38083.5 | 106 | 34272 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | LeastSquaresOptim (Dogleg) | 22479.0 | 116 | 261968 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 31458.5 | 148 | 364160 | 7 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 26666.5 | 197 | 13024 | 4 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (Newton) | 23250.0 | 103 | 3568 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 33874.5 | 59 | 9088 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (tron) | 52000.0 | 123 | 13664 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | Ipopt | 585291.5 | 245 | 10720 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | MadNLP | 286208.5 | 543 | 45056 | 5 | 2.5926e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 529812.5 | 1178 | 321600 | 112 | 2.5926e-02 | true | ok | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 169166.0 | 885 | 2266464 | 9 | 2.5926e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 128 | CaNNOLeS | 94520.5 | 185 | 122864 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 34375.0 | 34 | 2144 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM) | 34250.0 | 32 | 2064 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, tall) | 45687.5 | 116 | 61664 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | LeastSquaresOptim (Dogleg) | 39979.0 | 119 | 268016 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 57291.5 | 169 | 422160 | 8 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 34146.0 | 197 | 13024 | 4 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (Newton) | 36063.0 | 103 | 3568 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 57750.0 | 65 | 15040 | 7 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (tron) | 74562.5 | 130 | 20608 | 6 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | Ipopt | 600271.0 | 245 | 10720 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | MadNLP | 298104.0 | 543 | 45056 | 5 | 5.5410e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 880624.5 | 1410 | 681792 | 112 | 5.5410e-02 | true | ok | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 485708.0 | 1587 | 4213632 | 11 | 5.5410e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 256 | CaNNOLeS | 179250.0 | 213 | 246160 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 67292.0 | 34 | 2144 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM) | 67083.0 | 32 | 2064 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, tall) | 74208.5 | 116 | 116064 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | LeastSquaresOptim (Dogleg) | 70667.0 | 119 | 280304 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 92479.5 | 151 | 385056 | 7 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 62667.0 | 225 | 15120 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (Newton) | 70958.5 | 116 | 3840 | 6 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 127708.5 | 67 | 27360 | 9 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | JSOSolvers (tron) | 113541.5 | 130 | 34944 | 5 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | Ipopt | 709208.5 | 275 | 11968 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | MadNLP | 347167.0 | 543 | 45056 | 6 | 1.0665e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 1.463208e6 | 1399 | 1290096 | 111 | 1.0665e-01 | true | ok | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 3.245041e6 | 3149 | 9589424 | 59 | 1.0665e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 512 | CaNNOLeS | 395229.0 | 218 | 485344 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 55208.0 | 56 | 3424 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM) | 54583.5 | 54 | 3344 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, tall) | 131542.0 | 116 | 224640 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | LeastSquaresOptim (Dogleg) | 136333.5 | 119 | 304880 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 172229.5 | 151 | 412704 | 7 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 87021.0 | 197 | 13024 | 4 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (Newton) | 111667.0 | 103 | 3568 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.377083e6 | 334 | 70800 | 320 | 2.0673e-01 | false | not_converged | NaN | not\_desc |
| 1024 | JSOSolvers (tron) | 246292.0 | 130 | 63616 | 6 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | Ipopt | 680687.0 | 245 | 10720 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 370646.0 | 543 | 45056 | 5 | 2.0673e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 2.93975e6 | 1410 | 2538816 | 112 | 2.0673e-01 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 1.368459e6 | 1543 | 5815520 | 8 | 2.0673e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 1024 | CaNNOLeS | 696541.5 | 218 | 1045472 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 92958.5 | 58 | 3632 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM) | 88875.0 | 56 | 3552 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, tall) | 241396.0 | 116 | 441728 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | LeastSquaresOptim (Dogleg) | 263479.0 | 119 | 354032 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 339062.5 | 151 | 476192 | 7 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 183229.5 | 225 | 15120 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (Newton) | 250791.5 | 116 | 3840 | 6 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 278187.5 | 67 | 101088 | 5 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 2.358709e6 | 302 | 134096 | 24 | 4.1154e-01 | false | not_converged | NaN | small\_step |
| 2048 | Ipopt | 892667.0 | 275 | 11968 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 469854.0 | 543 | 45056 | 5 | 4.1154e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 5.492417e6 | 1410 | 5039424 | 112 | 4.1154e-01 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 3.5115e6 | 1455 | 7643040 | 9 | 4.1154e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 2048 | CaNNOLeS | 1.5438955e6 | 218 | 1919968 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 174166.5 | 58 | 3632 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM) | 180604.5 | 56 | 3552 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, tall) | 466000.0 | 116 | 892288 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | LeastSquaresOptim (Dogleg) | 507917.0 | 119 | 452336 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 663896.0 | 151 | 586784 | 7 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 351583.5 | 225 | 15120 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (Newton) | 422666.0 | 103 | 3568 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 1.430225e7 | 334 | 218256 | 328 | 8.3061e-01 | false | not_converged | NaN | not\_desc |
| 4096 | JSOSolvers (tron) | 5.24175e6 | 302 | 248784 | 28 | 8.3061e-01 | false | not_converged | NaN | small\_step |
| 4096 | Ipopt | 994062.5 | 245 | 10720 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 680688.0 | 543 | 45056 | 5 | 8.3061e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 1.10372295e7 | 1410 | 11826496 | 112 | 8.3061e-01 | true | ok | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion) | 3.264958e6 | 905 | 7416016 | 7 | 8.3061e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 4096 | CaNNOLeS | 2.6772085e6 | 218 | 3775456 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 344833.0 | 58 | 3632 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM) | 345125.0 | 56 | 3552 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, tall) | 907271.0 | 116 | 1744256 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | LeastSquaresOptim (Dogleg) | 1.098604e6 | 119 | 648944 | 5 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 1.4514375e6 | 151 | 783392 | 7 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 570062.5 | 197 | 13024 | 4 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (Newton) | 980041.5 | 116 | 3840 | 6 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 2.8452958e7 | 334 | 414864 | 329 | 1.6555e+00 | false | not_converged | NaN | not\_desc |
| 8192 | JSOSolvers (tron) | 2.302646e6 | 130 | 465024 | 7 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | Ipopt | 1.6714795e6 | 275 | 11968 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.1224165e6 | 543 | 45056 | 5 | 1.6555e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | 2.0891208e7 | 1410 | 19821888 | 112 | 1.6555e+00 | true | ok | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion) | 6.963791e6 | 949 | 13416304 | 8 | 1.6555e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 8192 | CaNNOLeS | 6.358896e6 | 218 | 7019488 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 971167.0 | 58 | 3632 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM) | 957645.5 | 56 | 3552 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, tall) | 2.066063e6 | 116 | 3448192 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | LeastSquaresOptim (Dogleg) | 2.310583e6 | 119 | 1042160 | 5 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 2.9100415e6 | 151 | 1176608 | 7 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 1.130813e6 | 197 | 13024 | 4 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (Newton) | 2.2298125e6 | 136 | 4224 | 6 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 5.86065e7 | 334 | 808080 | 321 | 3.3011e+00 | false | not_converged | NaN | not\_desc |
| 16384 | JSOSolvers (tron) | 1.895025e7 | 302 | 936912 | 21 | 3.3011e+00 | false | not_converged | NaN | small\_step |
| 16384 | Ipopt | 2.6133545e6 | 275 | 11968 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 1.937e6 | 543 | 45056 | 5 | 3.3011e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | 4.1008958e7 | 1410 | 35812672 | 112 | 3.3011e+00 | true | ok | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion) | 1.4846917e7 | 905 | 23537872 | 8 | 3.3011e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 16384 | CaNNOLeS | 1.3046166e7 | 218 | 13523936 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 32768 | SecondOrderOptimization (Dogleg) | 1.4453335e6 | 58 | 3632 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM) | 1.8434165e6 | 56 | 3552 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, tall) | 3.699354e6 | 116 | 6856064 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | LeastSquaresOptim (Dogleg) | 4.478625e6 | 119 | 1828592 | 5 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 5.994313e6 | 151 | 1963040 | 7 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 2.251875e6 | 197 | 13024 | 4 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (Newton) | 3.9784995e6 | 116 | 3840 | 6 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | JSOSolvers (trunk) | 1.15695708e8 | 334 | 1594512 | 323 | 6.5496e+00 | false | not_converged | NaN | not\_desc |
| 32768 | JSOSolvers (tron) | 4.0141375e7 | 302 | 1854416 | 24 | 6.5496e+00 | false | not_converged | NaN | small\_step |
| 32768 | Ipopt | 4.5855625e6 | 275 | 11968 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 3.6066875e6 | 543 | 45056 | 5 | 6.5496e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | 8.2924084e7 | 1410 | 67794240 | 112 | 6.5496e+00 | true | ok | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion) | 4.9204375e7 | 1543 | 76922080 | 9 | 6.5496e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 32768 | CaNNOLeS | 2.5641583e7 | 218 | 26532832 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 65536 | SecondOrderOptimization (Dogleg) | 2.8731875e6 | 58 | 3632 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM) | 3.969562e6 | 56 | 3552 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, tall) | 8.772313e6 | 116 | 13671808 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | LeastSquaresOptim (Dogleg) | 9.0845625e6 | 119 | 3401456 | 5 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | LeastSquaresOptim (LM) | 1.17839585e7 | 151 | 3535904 | 7 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 4.4886665e6 | 197 | 13024 | 4 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (Newton) | 7.9647915e6 | 116 | 3840 | 6 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | JSOSolvers (trunk) | 2.348555e8 | 334 | 3167376 | 321 | 1.3174e+01 | false | not_converged | NaN | not\_desc |
| 65536 | JSOSolvers (tron) | 7.1471291e7 | 302 | 3689424 | 20 | 1.3174e+01 | false | not_converged | NaN | small\_step |
| 65536 | Ipopt | 8.6010415e6 | 275 | 11968 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
| 65536 | MadNLP | 7.220354e6 | 543 | 45056 | 5 | 1.3174e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM) | 1.67348896e8 | 1410 | 131757376 | 112 | 1.3174e+01 | true | ok | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion) | 9.8642333e7 | 1543 | 150322400 | 11 | 1.3174e+01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 65536 | CaNNOLeS | 5.4983583e7 | 218 | 52534240 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
