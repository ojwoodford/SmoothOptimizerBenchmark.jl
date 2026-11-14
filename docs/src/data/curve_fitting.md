# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-14T13:28:32
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 4e9eec5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | NLLSModel (Static) | 320.77777777777777 | 1 | 16 | 1583.3076923076924 | 1 | 32 |
| 64 | Standalone | 321.241935483871 | 1 | 16 | 952.6818181818181 | 1 | 32 |
| 128 | NLLSModel (Static) | 591.6666666666666 | 1 | 16 | 3083.285714285714 | 1 | 32 |
| 128 | Standalone | 604.7878787878788 | 1 | 16 | 1765.1818181818182 | 1 | 32 |
| 256 | NLLSModel (Static) | 1122.6666666666667 | 1 | 16 | 6802.25 | 1 | 32 |
| 256 | Standalone | 1102.7333333333333 | 1 | 16 | 3708.3333333333335 | 1 | 32 |
| 512 | NLLSModel (Static) | 2222.222222222222 | 1 | 16 | 13750.0 | 1 | 32 |
| 512 | Standalone | 2115.777777777778 | 1 | 16 | 6694.333333333333 | 1 | 32 |
| 1024 | NLLSModel (Static) | 4308.4 | 1 | 16 | 25000.0 | 1 | 32 |
| 1024 | Standalone | 4208.2 | 1 | 16 | 13750.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 8555.333333333334 | 1 | 16 | 46917.0 | 1 | 32 |
| 2048 | Standalone | 8375.0 | 1 | 16 | 28542.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 21042.0 | 1 | 16 | 98333.0 | 1 | 32 |
| 4096 | Standalone | 16500.0 | 1 | 16 | 56000.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 34583.0 | 1 | 16 | 204792.0 | 1 | 32 |
| 8192 | Standalone | 33916.0 | 1 | 16 | 111750.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 9541.0 | 2 | 64 | 107208.0 | 4 | 576 |
| 16384 | Standalone | 68042.0 | 1 | 16 | 224625.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 83042.0 | 2 | 64 | 475583.0 | 4 | 576 |
| 32768 | Standalone | 140042.0 | 1 | 16 | 453625.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 35792.0 | 2 | 64 | 480666.0 | 4 | 576 |
| 65536 | Standalone | 270958.0 | 1 | 16 | 944042.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 10145.5 | 31 | 2000 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM) | 9958.0 | 29 | 1920 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, tall) | 21916.0 | 106 | 21072 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | LeastSquaresOptim (Dogleg) | 15166.0 | 115 | 258864 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 19562.0 | 147 | 360576 | 7 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 25896.0 | 225 | 15120 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (Newton) | 21000.0 | 116 | 3840 | 6 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 20563.0 | 59 | 5824 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (tron) | 34250.0 | 123 | 9856 | 7 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | Ipopt | 708354.0 | 275 | 11968 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | MadNLP | 311604.5 | 543 | 45056 | 6 | 1.3405e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 385375.0 | 1174 | 195232 | 112 | 1.3405e-02 | true | ok | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 213875.0 | 1563 | 4094688 | 16 | 1.3405e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 64 | CaNNOLeS | 64895.5 | 176 | 65008 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 17896.0 | 31 | 2000 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM) | 18229.5 | 29 | 1920 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, tall) | 36791.0 | 110 | 34448 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | LeastSquaresOptim (Dogleg) | 22604.0 | 116 | 261968 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 30021.0 | 148 | 364160 | 7 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 27520.5 | 197 | 13024 | 4 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (Newton) | 24958.0 | 103 | 3568 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 35604.5 | 59 | 9088 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (tron) | 55375.0 | 123 | 13664 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | Ipopt | 631333.5 | 245 | 10720 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | MadNLP | 302000.0 | 543 | 45056 | 5 | 2.5926e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 544375.0 | 1178 | 321600 | 112 | 2.5926e-02 | true | ok | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 186209.0 | 885 | 2266464 | 9 | 2.5926e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 128 | CaNNOLeS | 101667.0 | 185 | 122864 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 33333.0 | 31 | 2000 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM) | 34000.0 | 29 | 1920 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, tall) | 64833.5 | 120 | 61776 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | LeastSquaresOptim (Dogleg) | 38896.0 | 119 | 268016 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 58458.5 | 169 | 422160 | 8 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 35854.5 | 197 | 13024 | 4 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (Newton) | 38354.5 | 103 | 3568 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 59146.0 | 65 | 15040 | 7 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (tron) | 78604.5 | 130 | 20608 | 6 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | Ipopt | 617812.5 | 245 | 10720 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | MadNLP | 305416.5 | 543 | 45056 | 5 | 5.5410e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 919792.0 | 1410 | 681792 | 112 | 5.5410e-02 | true | ok | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 461875.0 | 1587 | 4213632 | 11 | 5.5410e-02 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 256 | CaNNOLeS | 181937.5 | 213 | 246160 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 63333.5 | 31 | 2000 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM) | 62625.0 | 29 | 1920 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, tall) | 119458.5 | 120 | 116048 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | LeastSquaresOptim (Dogleg) | 66208.5 | 119 | 280304 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 89666.5 | 151 | 385056 | 7 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 60771.0 | 225 | 15120 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (Newton) | 71792.0 | 116 | 3840 | 6 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 129333.0 | 67 | 27360 | 9 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | JSOSolvers (tron) | 112645.5 | 130 | 34944 | 5 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | Ipopt | 706583.0 | 275 | 11968 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | MadNLP | 350208.0 | 543 | 45056 | 6 | 1.0665e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 1.468125e6 | 1399 | 1290096 | 111 | 1.0665e-01 | true | ok | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 1.794417e6 | 3149 | 9589424 | 59 | 1.0665e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 512 | CaNNOLeS | 407062.5 | 218 | 485344 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 121979.5 | 31 | 2000 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM) | 121812.5 | 29 | 1920 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, tall) | 240896.0 | 120 | 224592 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | LeastSquaresOptim (Dogleg) | 129583.5 | 119 | 304880 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 173708.0 | 151 | 412704 | 7 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 86604.0 | 197 | 13024 | 4 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (Newton) | 113812.5 | 103 | 3568 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.379583e6 | 334 | 70800 | 320 | 2.0673e-01 | false | not_converged | NaN | not\_desc |
| 1024 | JSOSolvers (tron) | 251458.5 | 130 | 63616 | 6 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | Ipopt | 690250.0 | 245 | 10720 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 372917.0 | 543 | 45056 | 5 | 2.0673e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 2.8049375e6 | 1410 | 2538816 | 112 | 2.0673e-01 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 1.391167e6 | 1543 | 5815520 | 8 | 2.0673e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 1024 | CaNNOLeS | 705146.0 | 218 | 1045472 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 247771.0 | 31 | 2000 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM) | 251604.0 | 29 | 1920 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, tall) | 457770.5 | 120 | 441680 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | LeastSquaresOptim (Dogleg) | 252041.5 | 119 | 354032 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 344104.0 | 151 | 476192 | 7 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 195458.5 | 225 | 15120 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (Newton) | 266979.5 | 116 | 3840 | 6 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 289354.5 | 67 | 101088 | 5 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 2.587667e6 | 302 | 134096 | 24 | 4.1154e-01 | false | not_converged | NaN | small\_step |
| 2048 | Ipopt | 959646.5 | 275 | 11968 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 498479.0 | 543 | 45056 | 5 | 4.1154e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 5.7076875e6 | 1410 | 5039424 | 112 | 4.1154e-01 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 2.457916e6 | 1455 | 7643040 | 9 | 4.1154e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 2048 | CaNNOLeS | 1.570833e6 | 218 | 1919968 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 489854.0 | 31 | 2000 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM) | 489666.0 | 29 | 1920 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, tall) | 886771.0 | 120 | 892240 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | LeastSquaresOptim (Dogleg) | 497854.5 | 119 | 452336 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 674354.5 | 151 | 586784 | 7 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 357375.0 | 225 | 15120 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (Newton) | 428771.0 | 103 | 3568 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 1.468175e7 | 334 | 218256 | 328 | 8.3061e-01 | false | not_converged | NaN | not\_desc |
| 4096 | JSOSolvers (tron) | 5.358958e6 | 302 | 248784 | 28 | 8.3061e-01 | false | not_converged | NaN | small\_step |
| 4096 | Ipopt | 1.009667e6 | 245 | 10720 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 693041.5 | 543 | 45056 | 5 | 8.3061e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 1.0553729e7 | 1410 | 11826496 | 112 | 8.3061e-01 | true | ok | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion) | 3.064792e6 | 905 | 7416016 | 7 | 8.3061e-01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 4096 | CaNNOLeS | 2.7104585e6 | 218 | 3775456 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 973041.5 | 31 | 2000 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM) | 978625.0 | 29 | 1920 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, tall) | 1.8500835e6 | 120 | 1744208 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | LeastSquaresOptim (Dogleg) | 1.0815e6 | 119 | 648944 | 5 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 1.4409165e6 | 151 | 783392 | 7 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 580646.0 | 197 | 13024 | 4 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (Newton) | 1.0032505e6 | 116 | 3840 | 6 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 2.8730916e7 | 334 | 414864 | 329 | 1.6555e+00 | false | not_converged | NaN | not\_desc |
| 8192 | JSOSolvers (tron) | 2.3581665e6 | 130 | 465024 | 7 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | Ipopt | 1.7180205e6 | 275 | 11968 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.1191245e6 | 543 | 45056 | 5 | 1.6555e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | 2.11774795e7 | 1410 | 19821888 | 112 | 1.6555e+00 | true | ok | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion) | 7.369042e6 | 949 | 13416304 | 8 | 1.6555e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 8192 | CaNNOLeS | 6.544729e6 | 218 | 7019488 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 528292.0 | 79 | 7056 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM) | 551437.5 | 77 | 6976 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, tall) | 2.855e6 | 126 | 3450032 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | LeastSquaresOptim (Dogleg) | 2.3132495e6 | 119 | 1042160 | 5 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 2.917708e6 | 151 | 1176608 | 7 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 1.1557915e6 | 197 | 13024 | 4 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (Newton) | 2.2628125e6 | 136 | 4224 | 6 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 5.7631333e7 | 334 | 808080 | 321 | 3.3011e+00 | false | not_converged | NaN | not\_desc |
| 16384 | JSOSolvers (tron) | 1.8679292e7 | 302 | 936912 | 21 | 3.3011e+00 | false | not_converged | NaN | small\_step |
| 16384 | Ipopt | 2.646771e6 | 275 | 11968 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 1.9843955e6 | 543 | 45056 | 5 | 3.3011e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | 4.1978021e7 | 1410 | 35812672 | 112 | 3.3011e+00 | true | ok | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion) | 1.4157458e7 | 905 | 23537872 | 8 | 3.3011e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 16384 | CaNNOLeS | 1.28339795e7 | 218 | 13523936 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 32768 | SecondOrderOptimization (Dogleg) | 997833.5 | 79 | 7056 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM) | 1.0072705e6 | 77 | 6976 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, tall) | 4.0857505e6 | 126 | 6857904 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | LeastSquaresOptim (Dogleg) | 4.5571245e6 | 119 | 1828592 | 5 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 5.911792e6 | 151 | 1963040 | 7 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 2.2956875e6 | 197 | 13024 | 4 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (Newton) | 3.9882915e6 | 116 | 3840 | 6 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | JSOSolvers (trunk) | 1.16612417e8 | 334 | 1594512 | 323 | 6.5496e+00 | false | not_converged | NaN | not\_desc |
| 32768 | JSOSolvers (tron) | 4.0301583e7 | 302 | 1854416 | 24 | 6.5496e+00 | false | not_converged | NaN | small\_step |
| 32768 | Ipopt | 4.7539165e6 | 275 | 11968 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 3.7941875e6 | 543 | 45056 | 5 | 6.5496e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | 8.5348042e7 | 1410 | 67794240 | 112 | 6.5496e+00 | true | ok | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion) | 4.9638625e7 | 1543 | 76922080 | 9 | 6.5496e+00 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 32768 | CaNNOLeS | 2.6929458e7 | 218 | 30252000 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 65536 | SecondOrderOptimization (Dogleg) | 2.337646e6 | 79 | 7056 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM) | 2.2325835e6 | 77 | 6976 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, tall) | 8.9666045e6 | 126 | 13673648 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | LeastSquaresOptim (Dogleg) | 9.283479e6 | 119 | 3401456 | 5 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | LeastSquaresOptim (LM) | 1.17788955e7 | 151 | 3535904 | 7 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 4.7691255e6 | 197 | 13024 | 4 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (Newton) | 8.038583e6 | 116 | 3840 | 6 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | JSOSolvers (trunk) | 2.338065e8 | 334 | 3167376 | 321 | 1.3174e+01 | false | not_converged | NaN | not\_desc |
| 65536 | JSOSolvers (tron) | 7.1117959e7 | 302 | 3689424 | 20 | 1.3174e+01 | false | not_converged | NaN | small\_step |
| 65536 | Ipopt | 8.6343125e6 | 275 | 11968 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
| 65536 | MadNLP | 7.343375e6 | 543 | 45056 | 5 | 1.3174e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM) | 1.69936104e8 | 1410 | 131757376 | 112 | 1.3174e+01 | true | ok | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion) | 1.01566584e8 | 1543 | 150322400 | 11 | 1.3174e+01 | false | not_converged | NaN | ShrinkThresholdExceeded |
| 65536 | CaNNOLeS | 5.5789458e7 | 218 | 52534240 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
