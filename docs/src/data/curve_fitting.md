# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T01:20:43
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
| 64 | NLLSModel (Static) | 319.672131147541 | 1 | 16 | 1663.4615384615386 | 1 | 32 |
| 64 | Standalone | 368.75 | 1 | 16 | 1511.9285714285713 | 1 | 32 |
| 128 | NLLSModel (Static) | 582.0909090909091 | 1 | 16 | 3327.4285714285716 | 1 | 32 |
| 128 | Standalone | 664.0625 | 1 | 16 | 2828.125 | 1 | 32 |
| 256 | NLLSModel (Static) | 1118.421052631579 | 1 | 16 | 6486.333333333333 | 1 | 32 |
| 256 | Standalone | 1161.764705882353 | 1 | 16 | 5791.5 | 1 | 32 |
| 512 | NLLSModel (Static) | 783.3333333333334 | 1 | 16 | 13542.0 | 1 | 32 |
| 512 | Standalone | 2287.5 | 1 | 16 | 10583.0 | 1 | 32 |
| 1024 | NLLSModel (Static) | 4694.466666666666 | 1 | 16 | 10500.0 | 1 | 32 |
| 1024 | Standalone | 4541.8 | 1 | 16 | 22167.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 1885.5 | 1 | 16 | 24125.0 | 1 | 32 |
| 2048 | Standalone | 8791.666666666666 | 1 | 16 | 71208.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 2982.1428571428573 | 1 | 16 | 42042.0 | 1 | 32 |
| 4096 | Standalone | 18875.0 | 1 | 16 | 83167.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 5250.0 | 1 | 16 | 91375.0 | 1 | 32 |
| 8192 | Standalone | 37333.0 | 1 | 16 | 172125.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 9722.0 | 1 | 16 | 163750.0 | 1 | 32 |
| 16384 | Standalone | 70250.0 | 1 | 16 | 343959.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 18542.0 | 1 | 16 | 378708.0 | 1 | 32 |
| 32768 | Standalone | 143375.0 | 1 | 16 | 711083.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 36625.0 | 1 | 16 | 586542.0 | 1 | 32 |
| 65536 | Standalone | 282917.0 | 1 | 16 | 1.430667e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 11125.0 | 34 | 2144 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM) | 10542.0 | 32 | 2064 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (Gauss-Newton) | 11291.0 | 29 | 1856 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, tall) | 21583.5 | 102 | 20896 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | LeastSquaresOptim (Dogleg) | 17666.0 | 115 | 258976 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 23145.5 | 147 | 360688 | 7 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 29645.5 | 225 | 15792 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (Newton) | 24229.5 | 116 | 4816 | 6 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 23417.0 | 59 | 5824 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (tron) | 36708.0 | 123 | 9856 | 7 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | Ipopt | 660750.0 | 282 | 12400 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | MadNLP | 297542.0 | 543 | 45056 | 6 | 1.3405e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 413834.0 | 1174 | 198336 | 112 | 1.3405e-02 | true | ok | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 231666.0 | 1563 | 4094944 | 16 | 1.3405e-02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 64 | CaNNOLeS | 68750.5 | 176 | 65008 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 18042.0 | 34 | 2144 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM) | 18187.5 | 32 | 2064 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (Gauss-Newton) | 20125.0 | 29 | 1856 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, tall) | 37208.5 | 106 | 34272 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | LeastSquaresOptim (Dogleg) | 26979.0 | 116 | 262080 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 36312.5 | 148 | 364272 | 7 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 31979.5 | 197 | 13584 | 4 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (Newton) | 29854.5 | 103 | 4400 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 41937.5 | 59 | 9088 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (tron) | 59833.5 | 123 | 13664 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | Ipopt | 611562.5 | 252 | 11152 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | MadNLP | 285541.5 | 543 | 45056 | 5 | 2.5926e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 578500.0 | 1178 | 324704 | 112 | 2.5926e-02 | true | ok | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 202000.0 | 885 | 2266720 | 9 | 2.5926e-02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 128 | CaNNOLeS | 106271.0 | 185 | 122864 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 34083.0 | 34 | 2144 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM) | 34125.0 | 32 | 2064 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (Gauss-Newton) | 39250.0 | 29 | 1856 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, tall) | 45958.5 | 116 | 61664 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | LeastSquaresOptim (Dogleg) | 50854.5 | 119 | 268128 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 72375.0 | 169 | 422272 | 8 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 46667.0 | 197 | 13584 | 4 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (Newton) | 48500.0 | 103 | 4400 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 72500.0 | 65 | 15040 | 7 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (tron) | 87666.0 | 130 | 20608 | 6 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | Ipopt | 648187.5 | 252 | 11152 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | MadNLP | 344750.5 | 543 | 45056 | 5 | 5.5410e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 1.0201875e6 | 1410 | 684896 | 112 | 5.5410e-02 | true | ok | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 508625.0 | 1587 | 4213888 | 11 | 5.5410e-02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 256 | CaNNOLeS | 217812.5 | 213 | 246160 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 67520.5 | 34 | 2144 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM) | 67458.0 | 32 | 2064 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (Gauss-Newton) | 78625.0 | 29 | 1856 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, tall) | 75541.5 | 116 | 116064 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | LeastSquaresOptim (Dogleg) | 90958.0 | 119 | 280416 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 124688.0 | 151 | 385168 | 7 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 86000.0 | 225 | 15792 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (Newton) | 100416.5 | 116 | 4816 | 6 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 168187.5 | 67 | 27360 | 9 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | JSOSolvers (tron) | 135000.5 | 130 | 34944 | 5 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | Ipopt | 739437.5 | 282 | 12400 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | MadNLP | 373104.0 | 543 | 45056 | 6 | 1.0665e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 1.7268125e6 | 1410 | 1303904 | 112 | 1.0665e-01 | true | ok | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 2.103333e6 | 3149 | 9589680 | 59 | 1.0665e-01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 512 | CaNNOLeS | 431375.0 | 218 | 485344 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 52750.0 | 56 | 3424 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM) | 54750.0 | 54 | 3344 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (Gauss-Newton) | 71416.0 | 51 | 3136 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, tall) | 127604.0 | 116 | 224640 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | LeastSquaresOptim (Dogleg) | 171604.0 | 119 | 304992 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 232625.0 | 151 | 412816 | 7 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 129791.5 | 197 | 13584 | 4 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (Newton) | 167458.5 | 103 | 4400 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.709916e6 | 334 | 70800 | 320 | 2.0673e-01 | false | not_converged | NaN | not\_desc; cost test passes |
| 1024 | JSOSolvers (tron) | 314625.5 | 130 | 63616 | 6 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | Ipopt | 744354.5 | 252 | 11152 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 436729.5 | 543 | 45056 | 5 | 2.0673e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 3.3609375e6 | 1399 | 2520976 | 111 | 2.0673e-01 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 1.509958e6 | 1543 | 5815776 | 8 | 2.0673e-01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 1024 | CaNNOLeS | 731937.0 | 218 | 1045472 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 90833.5 | 58 | 3632 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM) | 87271.0 | 56 | 3552 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (Gauss-Newton) | 108958.0 | 53 | 3344 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, tall) | 233749.5 | 116 | 441728 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | LeastSquaresOptim (Dogleg) | 479313.0 | 119 | 354144 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 645771.0 | 151 | 476304 | 7 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 449937.0 | 225 | 15792 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (Newton) | 564770.5 | 116 | 4816 | 6 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 468541.5 | 67 | 101088 | 5 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 3.857625e6 | 302 | 134096 | 24 | 4.1154e-01 | false | not_converged | NaN | small\_step; cost test passes |
| 2048 | Ipopt | 995979.0 | 282 | 12400 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 564562.0 | 543 | 45056 | 5 | 4.1154e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 6.2175e6 | 1388 | 4959680 | 110 | 4.1154e-01 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 2.85225e6 | 1455 | 7643296 | 9 | 4.1154e-01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 2048 | CaNNOLeS | 1.665375e6 | 218 | 1919968 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 177187.5 | 58 | 3632 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM) | 231521.0 | 56 | 3552 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (Gauss-Newton) | 255375.0 | 53 | 3344 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, tall) | 450083.5 | 116 | 892288 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | LeastSquaresOptim (Dogleg) | 938667.0 | 119 | 452448 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 1.318479e6 | 151 | 586896 | 7 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 774187.5 | 225 | 15792 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (Newton) | 649666.5 | 103 | 4400 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 1.68795e7 | 334 | 218256 | 330 | 8.3061e-01 | false | not_converged | NaN | not\_desc; cost test passes |
| 4096 | JSOSolvers (tron) | 7.345042e6 | 302 | 248784 | 28 | 8.3061e-01 | false | not_converged | NaN | small\_step; cost test passes |
| 4096 | Ipopt | 1.201938e6 | 252 | 11152 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 932916.5 | 543 | 45056 | 5 | 8.3061e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 1.3691292e7 | 1410 | 11829600 | 112 | 8.3061e-01 | true | ok | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion) | 3.4285e6 | 905 | 7416272 | 7 | 8.3061e-01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 4096 | CaNNOLeS | 2.8782915e6 | 218 | 3775456 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 331229.0 | 58 | 3632 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM) | 335208.0 | 56 | 3552 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (Gauss-Newton) | 393229.5 | 53 | 3344 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, tall) | 907229.5 | 116 | 1744256 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | LeastSquaresOptim (Dogleg) | 1.951312e6 | 119 | 649056 | 5 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 2.641625e6 | 151 | 783504 | 7 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 871833.5 | 197 | 13584 | 4 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (Newton) | 1.503979e6 | 116 | 4816 | 6 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 3.3297334e7 | 334 | 414864 | 329 | 1.6555e+00 | false | not_converged | NaN | not\_desc; cost test passes |
| 8192 | JSOSolvers (tron) | 2.928021e6 | 130 | 465024 | 7 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | Ipopt | 2.179208e6 | 282 | 12400 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.4628755e6 | 543 | 45056 | 5 | 1.6555e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | 2.4071813e7 | 1410 | 19824992 | 112 | 1.6555e+00 | true | ok | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion) | 7.805833e6 | 949 | 13416560 | 8 | 1.6555e+00 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 8192 | CaNNOLeS | 6.704604e6 | 218 | 7019488 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 749520.5 | 58 | 3632 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM) | 989458.5 | 56 | 3552 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (Gauss-Newton) | 1.1339375e6 | 53 | 3344 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, tall) | 1.843625e6 | 116 | 3448192 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | LeastSquaresOptim (Dogleg) | 3.2715835e6 | 119 | 1042272 | 5 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 5.3065e6 | 151 | 1176720 | 7 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 2.8808745e6 | 197 | 13584 | 4 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (Newton) | 3.369125e6 | 136 | 5328 | 6 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 6.1375167e7 | 334 | 808080 | 321 | 3.3011e+00 | false | not_converged | NaN | not\_desc; cost test passes |
| 16384 | JSOSolvers (tron) | 2.9697666e7 | 302 | 936912 | 28 | 3.3011e+00 | false | not_converged | NaN | small\_step; cost test passes |
| 16384 | Ipopt | 3.6080415e6 | 282 | 12400 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 2.6905835e6 | 543 | 45056 | 5 | 3.3011e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | 4.7543917e7 | 1399 | 35520400 | 111 | 3.3011e+00 | true | ok | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion) | 1.5955583e7 | 905 | 23538128 | 8 | 3.3011e+00 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 16384 | CaNNOLeS | 1.3826729e7 | 218 | 13523936 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 32768 | SecondOrderOptimization (Dogleg) | 1.443937e6 | 58 | 3632 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM) | 1.898417e6 | 56 | 3552 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (Gauss-Newton) | 1.820146e6 | 53 | 3344 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, tall) | 4.245541e6 | 116 | 6856064 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | LeastSquaresOptim (Dogleg) | 6.1582915e6 | 119 | 1828704 | 5 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 7.862917e6 | 151 | 1963152 | 7 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 3.965291e6 | 197 | 13584 | 4 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (Newton) | 6.0200005e6 | 116 | 4816 | 6 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | JSOSolvers (trunk) | 1.2652725e8 | 334 | 1594512 | 322 | 6.5496e+00 | false | not_converged | NaN | not\_desc; cost test passes |
| 32768 | JSOSolvers (tron) | 5.1959209e7 | 302 | 1854416 | 23 | 6.5496e+00 | false | not_converged | NaN | small\_step; cost test passes |
| 32768 | Ipopt | 6.6598335e6 | 282 | 12400 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 5.184375e6 | 543 | 45056 | 5 | 6.5496e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | 9.6264021e7 | 1410 | 67797344 | 112 | 6.5496e+00 | true | ok | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion) | 5.1777208e7 | 1543 | 76922336 | 9 | 6.5496e+00 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 32768 | CaNNOLeS | 2.8183375e7 | 218 | 27532256 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 65536 | SecondOrderOptimization (Dogleg) | 3.0641875e6 | 58 | 3632 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM) | 4.1765205e6 | 56 | 3552 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (Gauss-Newton) | 3.6402915e6 | 53 | 3344 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, tall) | 9.230812e6 | 116 | 13671808 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | LeastSquaresOptim (Dogleg) | 1.22241255e7 | 119 | 3401568 | 5 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | LeastSquaresOptim (LM) | 1.55809165e7 | 151 | 3536016 | 7 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 7.6996045e6 | 197 | 13584 | 4 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (Newton) | 1.2071437e7 | 116 | 4816 | 6 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | JSOSolvers (trunk) | 2.54212625e8 | 334 | 3167376 | 321 | 1.3174e+01 | false | not_converged | NaN | not\_desc; cost test passes |
| 65536 | JSOSolvers (tron) | 9.0936541e7 | 302 | 3689424 | 20 | 1.3174e+01 | false | not_converged | NaN | small\_step; cost test passes |
| 65536 | Ipopt | 1.2494521e7 | 282 | 12400 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
| 65536 | MadNLP | 1.0090062e7 | 543 | 45056 | 5 | 1.3174e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM) | 1.905529375e8 | 1410 | 131760480 | 112 | 1.3174e+01 | true | ok | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion) | 1.24494875e8 | 1719 | 167508064 | 15 | 1.3174e+01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 65536 | CaNNOLeS | 5.86496665e7 | 218 | 64183264 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
