# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T02:14:11
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
| 64 | NLLSModel (Static) | 320.96875 | 1 | 16 | 1657.076923076923 | 1 | 32 |
| 64 | Standalone | 360.1694915254237 | 1 | 16 | 1464.7692307692307 | 1 | 32 |
| 128 | NLLSModel (Static) | 597.6285714285714 | 1 | 16 | 3339.285714285714 | 1 | 32 |
| 128 | Standalone | 607.3333333333334 | 1 | 16 | 2796.875 | 1 | 32 |
| 256 | NLLSModel (Static) | 1136.611111111111 | 1 | 16 | 6260.25 | 1 | 32 |
| 256 | Standalone | 1240.1764705882354 | 1 | 16 | 5541.75 | 1 | 32 |
| 512 | NLLSModel (Static) | 2229.1 | 1 | 16 | 12791.0 | 1 | 32 |
| 512 | Standalone | 2212.5 | 1 | 16 | 10458.0 | 1 | 32 |
| 1024 | NLLSModel (Static) | 4225.0 | 1 | 16 | 25375.0 | 1 | 32 |
| 1024 | Standalone | 4458.4 | 1 | 16 | 20792.0 | 1 | 32 |
| 2048 | NLLSModel (Static) | 8388.666666666666 | 1 | 16 | 49500.0 | 1 | 32 |
| 2048 | Standalone | 8764.0 | 1 | 16 | 71083.0 | 1 | 32 |
| 4096 | NLLSModel (Static) | 16916.0 | 1 | 16 | 100958.0 | 1 | 32 |
| 4096 | Standalone | 19292.0 | 1 | 16 | 87000.0 | 1 | 32 |
| 8192 | NLLSModel (Static) | 34209.0 | 1 | 16 | 204292.0 | 1 | 32 |
| 8192 | Standalone | 36333.0 | 1 | 16 | 170208.0 | 1 | 32 |
| 16384 | NLLSModel (Static) | 69041.0 | 1 | 16 | 399041.0 | 1 | 32 |
| 16384 | Standalone | 72750.0 | 1 | 16 | 351291.0 | 1 | 32 |
| 32768 | NLLSModel (Static) | 137875.0 | 1 | 16 | 788125.0 | 1 | 32 |
| 32768 | Standalone | 146292.0 | 1 | 16 | 707750.0 | 1 | 32 |
| 65536 | NLLSModel (Static) | 276166.0 | 1 | 16 | 1.614917e6 | 1 | 32 |
| 65536 | Standalone | 291125.0 | 1 | 16 | 1.405291e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 64 | SecondOrderOptimization (Dogleg) | 10500.0 | 34 | 2144 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM) | 10500.0 | 32 | 2064 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (Gauss-Newton) | 11375.0 | 29 | 1856 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | SecondOrderOptimization (LM, tall) | 21917.0 | 102 | 20896 | 5 | 1.3405e-02 | true | ok | NaN | rel\_dcost |
| 64 | LeastSquaresOptim (Dogleg) | 17750.0 | 115 | 258976 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 23333.5 | 147 | 360688 | 7 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 29583.0 | 225 | 15792 | 5 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | Optim (Newton) | 24271.0 | 116 | 4816 | 6 | 1.3405e-02 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 23583.5 | 59 | 5824 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | JSOSolvers (tron) | 37229.0 | 123 | 9856 | 7 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | Ipopt | 665250.0 | 282 | 12400 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 64 | MadNLP | 308354.0 | 543 | 45056 | 6 | 1.3405e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 407895.5 | 1174 | 198336 | 112 | 1.3405e-02 | true | ok | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 222833.0 | 1563 | 4094944 | 16 | 1.3405e-02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 64 | CaNNOLeS | 68145.5 | 176 | 65008 | 6 | 1.3405e-02 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 18375.0 | 34 | 2144 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM) | 18458.5 | 32 | 2064 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (Gauss-Newton) | 20625.0 | 29 | 1856 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | SecondOrderOptimization (LM, tall) | 36604.0 | 106 | 34272 | 5 | 2.5926e-02 | true | ok | NaN | rel\_dcost |
| 128 | LeastSquaresOptim (Dogleg) | 27562.5 | 116 | 262080 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 36937.5 | 148 | 364272 | 7 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 32354.5 | 197 | 13584 | 4 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | Optim (Newton) | 30833.5 | 103 | 4400 | 5 | 2.5926e-02 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 42833.5 | 59 | 9088 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | JSOSolvers (tron) | 61583.0 | 123 | 13664 | 7 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | Ipopt | 631104.0 | 252 | 11152 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 128 | MadNLP | 307354.0 | 543 | 45056 | 5 | 2.5926e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 598021.0 | 1178 | 324704 | 112 | 2.5926e-02 | true | ok | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 203083.0 | 885 | 2266720 | 9 | 2.5926e-02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 128 | CaNNOLeS | 110271.0 | 185 | 122864 | 5 | 2.5926e-02 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 33646.0 | 34 | 2144 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM) | 33687.5 | 32 | 2064 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (Gauss-Newton) | 38167.0 | 29 | 1856 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | SecondOrderOptimization (LM, tall) | 65062.5 | 116 | 61600 | 5 | 5.5410e-02 | true | ok | NaN | rel\_dcost |
| 256 | LeastSquaresOptim (Dogleg) | 47666.5 | 119 | 268128 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 72437.5 | 169 | 422272 | 8 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 45167.0 | 197 | 13584 | 4 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | Optim (Newton) | 49187.0 | 103 | 4400 | 5 | 5.5410e-02 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 75146.0 | 65 | 15040 | 7 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | JSOSolvers (tron) | 92500.0 | 130 | 20608 | 6 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | Ipopt | 662874.5 | 252 | 11152 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 256 | MadNLP | 308937.0 | 543 | 45056 | 5 | 5.5410e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 986625.0 | 1410 | 684896 | 112 | 5.5410e-02 | true | ok | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 478375.0 | 1587 | 4213888 | 11 | 5.5410e-02 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 256 | CaNNOLeS | 223292.0 | 213 | 246160 | 5 | 5.5410e-02 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 64541.5 | 34 | 2144 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM) | 64458.5 | 32 | 2064 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (Gauss-Newton) | 73916.0 | 29 | 1856 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | SecondOrderOptimization (LM, tall) | 119416.5 | 116 | 115872 | 5 | 1.0665e-01 | true | ok | NaN | rel\_dcost |
| 512 | LeastSquaresOptim (Dogleg) | 87854.5 | 119 | 280416 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 122041.5 | 151 | 385168 | 7 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 87187.5 | 225 | 15792 | 5 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | Optim (Newton) | 103437.5 | 116 | 4816 | 6 | 1.0665e-01 | true | ok | NaN | converged |
| 512 | JSOSolvers (trunk) | 171958.0 | 67 | 27360 | 9 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | JSOSolvers (tron) | 137375.0 | 130 | 34944 | 5 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | Ipopt | 752604.0 | 282 | 12400 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 512 | MadNLP | 374625.0 | 543 | 45056 | 6 | 1.0665e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 1.7621255e6 | 1410 | 1303904 | 112 | 1.0665e-01 | true | ok | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 2.091292e6 | 3149 | 9589680 | 59 | 1.0665e-01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 512 | CaNNOLeS | 447125.0 | 218 | 485344 | 6 | 1.0665e-01 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 131750.0 | 34 | 2144 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM) | 130833.0 | 32 | 2064 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (Gauss-Newton) | 152021.5 | 29 | 1856 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | SecondOrderOptimization (LM, tall) | 238958.0 | 116 | 224416 | 5 | 2.0673e-01 | true | ok | NaN | rel\_dcost |
| 1024 | LeastSquaresOptim (Dogleg) | 178229.0 | 119 | 304992 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 243333.5 | 151 | 412816 | 7 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 134125.0 | 197 | 13584 | 4 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | Optim (Newton) | 172916.0 | 103 | 4400 | 5 | 2.0673e-01 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 4.077459e6 | 334 | 70800 | 320 | 2.0673e-01 | false | not_converged | NaN | not\_desc; cost test passes |
| 1024 | JSOSolvers (tron) | 319250.5 | 130 | 63616 | 6 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | Ipopt | 810645.5 | 252 | 11152 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 441833.5 | 543 | 45056 | 5 | 2.0673e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 3.5224795e6 | 1399 | 2520976 | 111 | 2.0673e-01 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 1.526458e6 | 1543 | 5815776 | 8 | 2.0673e-01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 1024 | CaNNOLeS | 800333.5 | 218 | 1045472 | 5 | 2.0673e-01 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 257125.0 | 34 | 2144 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM) | 252917.0 | 32 | 2064 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (Gauss-Newton) | 294042.0 | 29 | 1856 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | SecondOrderOptimization (LM, tall) | 456937.5 | 116 | 441504 | 5 | 4.1154e-01 | true | ok | NaN | rel\_dcost |
| 2048 | LeastSquaresOptim (Dogleg) | 486416.5 | 119 | 354144 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 667187.5 | 151 | 476304 | 7 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 458667.0 | 225 | 15792 | 5 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | Optim (Newton) | 582687.5 | 116 | 4816 | 6 | 4.1154e-01 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 564166.5 | 67 | 101088 | 5 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 4.2405e6 | 302 | 134096 | 24 | 4.1154e-01 | false | not_converged | NaN | small\_step; cost test passes |
| 2048 | Ipopt | 1.01325e6 | 282 | 12400 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 569895.5 | 543 | 45056 | 5 | 4.1154e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 6.3236665e6 | 1388 | 4959680 | 110 | 4.1154e-01 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 2.710083e6 | 1455 | 7643296 | 9 | 4.1154e-01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 2048 | CaNNOLeS | 1.686125e6 | 218 | 1919968 | 6 | 4.1154e-01 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 532042.0 | 34 | 2144 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM) | 517395.5 | 32 | 2064 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (Gauss-Newton) | 587604.0 | 29 | 1856 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | SecondOrderOptimization (LM, tall) | 913542.0 | 116 | 892064 | 5 | 8.3061e-01 | true | ok | NaN | rel\_dcost |
| 4096 | LeastSquaresOptim (Dogleg) | 969167.0 | 119 | 452448 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 1.2855835e6 | 151 | 586896 | 7 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 691145.5 | 225 | 15792 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | Optim (Newton) | 647895.5 | 103 | 4400 | 5 | 8.3061e-01 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 1.6166292e7 | 334 | 218256 | 330 | 8.3061e-01 | false | not_converged | NaN | not\_desc; cost test passes |
| 4096 | JSOSolvers (tron) | 6.775375e6 | 302 | 248784 | 28 | 8.3061e-01 | false | not_converged | NaN | small\_step; cost test passes |
| 4096 | Ipopt | 1.217833e6 | 252 | 11152 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 906917.0 | 543 | 45056 | 5 | 8.3061e-01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 1.3939166e7 | 1410 | 11829600 | 112 | 8.3061e-01 | true | ok | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion) | 3.615542e6 | 905 | 7416272 | 7 | 8.3061e-01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 4096 | CaNNOLeS | 2.9288545e6 | 218 | 3775456 | 5 | 8.3061e-01 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 1.028771e6 | 34 | 2144 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM) | 1.0125e6 | 32 | 2064 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (Gauss-Newton) | 1.188521e6 | 29 | 1856 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | SecondOrderOptimization (LM, tall) | 1.862021e6 | 116 | 1744032 | 5 | 1.6555e+00 | true | ok | NaN | rel\_dcost |
| 8192 | LeastSquaresOptim (Dogleg) | 1.9851455e6 | 119 | 649056 | 5 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 2.638979e6 | 151 | 783504 | 7 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 899875.0 | 197 | 13584 | 4 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | Optim (Newton) | 1.5180625e6 | 116 | 4816 | 6 | 1.6555e+00 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 3.1032542e7 | 334 | 414864 | 329 | 1.6555e+00 | false | not_converged | NaN | not\_desc; cost test passes |
| 8192 | JSOSolvers (tron) | 2.864333e6 | 130 | 465024 | 7 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | Ipopt | 2.1093335e6 | 282 | 12400 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.5306875e6 | 543 | 45056 | 5 | 1.6555e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | 2.4801833e7 | 1410 | 19824992 | 112 | 1.6555e+00 | true | ok | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion) | 7.722875e6 | 949 | 13416560 | 8 | 1.6555e+00 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 8192 | CaNNOLeS | 6.925313e6 | 218 | 7019488 | 6 | 1.6555e+00 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 2.07625e6 | 34 | 2144 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM) | 2.0490835e6 | 32 | 2064 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (Gauss-Newton) | 2.3605835e6 | 29 | 1856 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | SecondOrderOptimization (LM, tall) | 3.8088335e6 | 116 | 3447968 | 5 | 3.3011e+00 | true | ok | NaN | rel\_dcost |
| 16384 | LeastSquaresOptim (Dogleg) | 3.825e6 | 119 | 1042272 | 5 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 5.387667e6 | 151 | 1176720 | 7 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 2.8829375e6 | 197 | 13584 | 4 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | Optim (Newton) | 4.557833e6 | 136 | 5328 | 6 | 3.3011e+00 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 6.183225e7 | 334 | 808080 | 321 | 3.3011e+00 | false | not_converged | NaN | not\_desc; cost test passes |
| 16384 | JSOSolvers (tron) | 2.9220083e7 | 302 | 936912 | 28 | 3.3011e+00 | false | not_converged | NaN | small\_step; cost test passes |
| 16384 | Ipopt | 3.575229e6 | 282 | 12400 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 2.755125e6 | 543 | 45056 | 5 | 3.3011e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | 4.7471875e7 | 1399 | 35520400 | 111 | 3.3011e+00 | true | ok | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion) | 1.5713416e7 | 905 | 23538128 | 8 | 3.3011e+00 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 16384 | CaNNOLeS | 1.37945005e7 | 218 | 13523936 | 6 | 3.3011e+00 | true | ok | NaN | first\_order |
| 32768 | SecondOrderOptimization (Dogleg) | 4.131271e6 | 34 | 2144 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM) | 4.0828955e6 | 32 | 2064 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (Gauss-Newton) | 4.785937e6 | 29 | 1856 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | SecondOrderOptimization (LM, tall) | 7.9721455e6 | 116 | 6855840 | 5 | 6.5496e+00 | true | ok | NaN | rel\_dcost |
| 32768 | LeastSquaresOptim (Dogleg) | 6.2183545e6 | 119 | 1828704 | 5 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 7.917354e6 | 151 | 1963152 | 7 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 4.019e6 | 197 | 13584 | 4 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | Optim (Newton) | 6.2154585e6 | 116 | 4816 | 6 | 6.5496e+00 | true | ok | NaN | converged |
| 32768 | JSOSolvers (trunk) | 1.27424334e8 | 334 | 1594512 | 322 | 6.5496e+00 | false | not_converged | NaN | not\_desc; cost test passes |
| 32768 | JSOSolvers (tron) | 4.982625e7 | 302 | 1854416 | 23 | 6.5496e+00 | false | not_converged | NaN | small\_step; cost test passes |
| 32768 | Ipopt | 6.392625e6 | 282 | 12400 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 5.180354e6 | 543 | 45056 | 5 | 6.5496e+00 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | 9.5642208e7 | 1410 | 67797344 | 112 | 6.5496e+00 | true | ok | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion) | 5.2384666e7 | 1543 | 76922336 | 9 | 6.5496e+00 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 32768 | CaNNOLeS | 2.774325e7 | 218 | 27532256 | 6 | 6.5496e+00 | true | ok | NaN | first\_order |
| 65536 | SecondOrderOptimization (Dogleg) | 8.003125e6 | 34 | 2144 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM) | 8.123875e6 | 32 | 2064 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (Gauss-Newton) | 9.2447085e6 | 29 | 1856 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | SecondOrderOptimization (LM, tall) | 1.5408e7 | 116 | 13671584 | 5 | 1.3174e+01 | true | ok | NaN | rel\_dcost |
| 65536 | LeastSquaresOptim (Dogleg) | 1.23596665e7 | 119 | 3401568 | 5 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | LeastSquaresOptim (LM) | 1.5727458e7 | 151 | 3536016 | 7 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 7.7753745e6 | 197 | 13584 | 4 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | Optim (Newton) | 1.2156625e7 | 116 | 4816 | 6 | 1.3174e+01 | true | ok | NaN | converged |
| 65536 | JSOSolvers (trunk) | 2.45071042e8 | 334 | 3167376 | 321 | 1.3174e+01 | false | not_converged | NaN | not\_desc; cost test passes |
| 65536 | JSOSolvers (tron) | 8.7400417e7 | 302 | 3689424 | 20 | 1.3174e+01 | false | not_converged | NaN | small\_step; cost test passes |
| 65536 | Ipopt | 1.21285e7 | 282 | 12400 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
| 65536 | MadNLP | 1.0081042e7 | 543 | 45056 | 5 | 1.3174e+01 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM) | 1.8895775e8 | 1410 | 131760480 | 112 | 1.3174e+01 | true | ok | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion) | 1.24883375e8 | 1719 | 167508064 | 15 | 1.3174e+01 | false | not_converged | NaN | ShrinkThresholdExceeded; cost test passes |
| 65536 | CaNNOLeS | 5.8082833e7 | 218 | 71277536 | 6 | 1.3174e+01 | true | ok | NaN | first\_order |
