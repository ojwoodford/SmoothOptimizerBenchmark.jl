# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: NLLSModel (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T02:55:12
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

This problem uses `NLLSModel (Sparse)` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 50 | SecondOrderOptimization (Dogleg) | 135500.0 | 230 | 190832 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | SecondOrderOptimization (LM) | 120771.0 | 226 | 188256 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | LeastSquaresOptim (Dogleg) | 2.885583e6 | 126 | 727472 | 5 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | LeastSquaresOptim (LM) | 1.09880625e7 | 203 | 1321680 | 9 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | Optim (Newton) | 1.131875e6 | 101 | 383568 | 5 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | JSOSolvers (trunk) | 3.0200205e6 | 60 | 23968 | 16 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | JSOSolvers (tron) | 4.2144165e6 | 124 | 37360 | 21 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | Ipopt | 960208.5 | 246 | 16784 | 5 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | MadNLP | 549812.0 | 568 | 192016 | 5 | 3.3090e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 50 | NonlinearSolve (LM) | 8.36155625e7 | 1761 | 14406528 | 122 | 3.3090e-02 | true | ok | NaN | StalledSuccess |
| 50 | NonlinearSolve (TrustRegion) | 2.57213335e7 | 148 | 668960 | 39 | 3.3090e-02 | true | ok | NaN | StalledSuccess |
| 50 | CaNNOLeS | 2.3173583e7 | 209 | 4249920 | 5 | 3.3090e-02 | true | ok | NaN | first\_order |
| 100 | SecondOrderOptimization (Dogleg) | 1.054179416e9 | 1215615 | 64750320 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | SecondOrderOptimization (LM) | 229291.0 | 375 | 425168 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | LeastSquaresOptim (Dogleg) | 1.9375125e7 | 121 | 1376160 | 4 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 9.3445334e7 | 247 | 2945104 | 10 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | Optim (Newton) | 6.793188e6 | 109 | 1476464 | 5 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | JSOSolvers (trunk) | 2.9247083e7 | 77 | 49216 | 66 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | JSOSolvers (tron) | 2.8680792e7 | 149 | 73920 | 39 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | Ipopt | 1.773375e6 | 251 | 23504 | 5 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | MadNLP | 2.931529542e9 | 5238902 | 312433760 | 5 | 4.2617e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 4.67614209e8 | 2055 | 31856672 | 124 | 4.2617e-02 | true | ok | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 1.801305625e8 | 174 | 2432144 | 38 | 4.2617e-02 | true | ok | NaN | StalledSuccess |
| 100 | CaNNOLeS | 1.17458833e8 | 221 | 15672128 | 5 | 4.2617e-02 | true | ok | NaN | first\_order |
| 200 | SecondOrderOptimization (Dogleg) | 525749.5 | 396 | 879408 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | SecondOrderOptimization (LM) | 493062.5 | 390 | 869024 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | LeastSquaresOptim (Dogleg) | 3.421101665e8 | 106 | 121040 | 6 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | LeastSquaresOptim (LM) | 2.622395835e8 | 167 | 119120 | 13 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | Optim (Newton) | 1.768979e6 | 844 | 7582752 | 6 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | JSOSolvers (trunk) | 2.16210415e7 | 81 | 95872 | 203 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | JSOSolvers (tron) | 2.0013834e7 | 149 | 141792 | 109 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | Ipopt | 2.1772915e6 | 281 | 37552 | 6 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | MadNLP | 1.573521e6 | 599 | 642176 | 6 | 4.8756e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 200 | NonlinearSolve (LM) | 6.043497583e9 | 1819988 | 233991136 | 132 | 4.8756e-02 | true | ok | NaN | StalledSuccess |
| 200 | NonlinearSolve (TrustRegion) | 2.211452458e9 | 552674 | 38825248 | 39 | 4.8756e-02 | true | ok | NaN | StalledSuccess |
| 200 | CaNNOLeS | 1.7699165e6 | 229 | 1223616 | 6 | 4.8756e-02 | true | ok | NaN | first\_order |
| 400 | SecondOrderOptimization (Dogleg) | 1.0171045e6 | 418 | 1732128 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | SecondOrderOptimization (LM) | 983270.5 | 412 | 1711504 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | LeastSquaresOptim (Dogleg) | 1.6891459e7 | 142 | 215184 | 10 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | LeastSquaresOptim (LM) | 3.2266208e7 | 209 | 240944 | 17 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | Optim (Newton) | 3.424875e6 | 744 | 15033072 | 6 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | JSOSolvers (trunk) | 8.7538e7 | 81 | 189056 | 438 | 5.3112e-02 | true | ok | NaN | first\_order |
| 400 | JSOSolvers (tron) | 6.293225e7 | 321 | 290720 | 170 | 5.3112e-02 | false | not_converged | NaN | small\_step |
| 400 | Ipopt | 4.115791e6 | 281 | 63152 | 6 | 5.3112e-02 | true | ok | NaN | first\_order |
| 400 | MadNLP | 2.7925835e6 | 599 | 1289408 | 6 | 5.3112e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 400 | NonlinearSolve (LM) | 2.72126475e9 | 22972 | 277146560 | 135 | 5.3112e-02 | true | ok | NaN | StalledSuccess |
| 400 | NonlinearSolve (TrustRegion) | 1.40808335e7 | 4077 | 15284160 | 40 | 5.3112e-02 | true | ok | NaN | StalledSuccess |
| 400 | CaNNOLeS | 3.4096255e6 | 229 | 2407360 | 6 | 5.3112e-02 | true | ok | NaN | first\_order |
| 800 | SecondOrderOptimization (Dogleg) | 1.847292e6 | 422 | 3445024 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | SecondOrderOptimization (LM) | 1.825e6 | 416 | 3403920 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | LeastSquaresOptim (Dogleg) | 3.76442085e7 | 126 | 352656 | 8 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | LeastSquaresOptim (LM) | 8.1299834e7 | 211 | 397808 | 17 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | Optim (Newton) | 6.0335625e6 | 670 | 24958560 | 5 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | JSOSolvers (trunk) | 1.87245e8 | 81 | 375424 | 501 | 5.4356e-02 | false | not_converged | NaN | max\_iter |
| 800 | JSOSolvers (tron) | 1.69811458e8 | 322 | 562400 | 234 | 5.4356e-02 | false | not_converged | NaN | small\_step |
| 800 | Ipopt | 5.701375e6 | 251 | 113104 | 5 | 5.4356e-02 | true | ok | NaN | first\_order |
| 800 | MadNLP | 4.870021e6 | 599 | 2526816 | 5 | 5.4356e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 800 | NonlinearSolve (LM) | 1.0538983667e10 | 869 | 106213632 | 132 | 5.4356e-02 | true | ok | NaN | StalledSuccess |
| 800 | NonlinearSolve (TrustRegion) | 2.8659167e7 | 6836 | 28489600 | 39 | 5.4356e-02 | true | ok | NaN | StalledSuccess |
| 800 | CaNNOLeS | 6.3593335e6 | 229 | 4766656 | 5 | 5.4356e-02 | true | ok | NaN | first\_order |
| 1200 | SecondOrderOptimization (Dogleg) | 2.8170005e6 | 425 | 5103808 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | SecondOrderOptimization (LM) | 2.685271e6 | 421 | 5040208 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | LeastSquaresOptim (Dogleg) | 6.97750835e7 | 134 | 503248 | 9 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | LeastSquaresOptim (LM) | 1.426993335e8 | 219 | 537552 | 18 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | Optim (Newton) | 2.0387292e7 | 642 | 37111968 | 5 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | JSOSolvers (trunk) | 3.39781292e8 | 81 | 559744 | 501 | 5.4395e-02 | false | not_converged | NaN | max\_iter |
| 1200 | JSOSolvers (tron) | 2.73017916e8 | 322 | 842464 | 242 | 5.4395e-02 | false | not_converged | NaN | small\_step |
| 1200 | Ipopt | 8.920396e6 | 251 | 174544 | 5 | 5.4395e-02 | true | ok | NaN | first\_order |
| 1200 | MadNLP | 6.9843745e6 | 599 | 3587072 | 5 | 5.4395e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1200 | NonlinearSolve (LM) | 2.3454505e10 | 869 | 236307360 | 132 | 5.4395e-02 | true | ok | NaN | StalledSuccess |
| 1200 | NonlinearSolve (TrustRegion) | 5.00141665e7 | 9573 | 39509632 | 39 | 5.4395e-02 | true | ok | NaN | StalledSuccess |
| 1200 | CaNNOLeS | 8.6867915e6 | 229 | 6921152 | 5 | 5.4395e-02 | true | ok | NaN | first\_order |
| 2000 | SecondOrderOptimization (Dogleg) | 4.549479e6 | 425 | 8444304 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | SecondOrderOptimization (LM) | 4.817417e6 | 419 | 8345856 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 2000 | LeastSquaresOptim (LM) | 2.25201334e8 | 237 | 797040 | 20 | 5.4397e-02 | true | ok | NaN | converged |
| 2000 | Optim (Newton) | 2.4444646e7 | 642 | 61421728 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 2000 | JSOSolvers (trunk) | 5.77994542e8 | 81 | 936576 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 2000 | JSOSolvers (tron) | 5.45496708e8 | 322 | 1368800 | 287 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 2000 | Ipopt | 1.5032625e7 | 251 | 256464 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 2000 | MadNLP | 1.1205458e7 | 599 | 5662528 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2000 | NonlinearSolve (LM) | 3.0373196458e10 | 12148 | 684948256 | 68 | 5.4397e-02 | false | timeout | NaN | MaxTime |
| 2000 | NonlinearSolve (TrustRegion) | 8.80049375e7 | 15104 | 65683824 | 38 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 2000 | CaNNOLeS | 1.50125625e7 | 229 | 11525056 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 3500 | SecondOrderOptimization (Dogleg) | 8.612354e6 | 431 | 14745472 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | SecondOrderOptimization (LM) | 8.4866255e6 | 425 | 14548720 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 3500 | LeastSquaresOptim (LM) | 4.19879375e8 | 245 | 1351312 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 3500 | Optim (Newton) | 3.6741583e7 | 642 | 107923616 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 3500 | JSOSolvers (trunk) | 9.82724667e8 | 81 | 1673856 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 3500 | JSOSolvers (tron) | 8.1792875e8 | 322 | 2489056 | 266 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 3500 | Ipopt | 2.8447e7 | 251 | 502224 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 3500 | MadNLP | 1.8783959e7 | 599 | 10115680 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3500 | NonlinearSolve (LM) | 3.1161303458e10 | 4586 | 402922464 | 23 | 5.4397e-02 | false | timeout | NaN | MaxTime |
| 3500 | NonlinearSolve (TrustRegion) | 1.50537771e8 | 25417 | 115452496 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 3500 | CaNNOLeS | 2.6359167e7 | 229 | 20749248 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 5000 | SecondOrderOptimization (Dogleg) | 1.2521208e7 | 431 | 20927536 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | SecondOrderOptimization (LM) | 1.226625e7 | 425 | 20665248 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 5000 | LeastSquaresOptim (LM) | 5.968006875e8 | 245 | 1807792 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 5000 | Optim (Newton) | 4.4244083e7 | 658 | 152758688 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 5000 | JSOSolvers (trunk) | 1.453050917e9 | 81 | 2329216 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 5000 | JSOSolvers (tron) | 1.475482209e9 | 322 | 3427040 | 327 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 5000 | Ipopt | 4.31875e7 | 251 | 666064 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 5000 | MadNLP | 2.84763335e7 | 599 | 14086656 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 3.0408347875e10 | 2570 | 284470752 | 11 | 5.5067e-02 | false | timeout | NaN | MaxTime |
| 5000 | NonlinearSolve (TrustRegion) | 2.3701525e8 | 35771 | 178889424 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 5000 | CaNNOLeS | 4.56838125e7 | 229 | 29694912 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 7500 | SecondOrderOptimization (Dogleg) | 1.8821542e7 | 431 | 32705920 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | SecondOrderOptimization (LM) | 1.97979585e7 | 425 | 32345328 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 7500 | LeastSquaresOptim (LM) | 8.758377915e8 | 266 | 2469280 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 7500 | Optim (Newton) | 7.09845e7 | 642 | 227076256 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 7500 | JSOSolvers (trunk) | 2.029604916e9 | 81 | 3263104 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 7500 | JSOSolvers (tron) | 1.988350958e9 | 322 | 4778720 | 322 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 7500 | Ipopt | 6.1148333e7 | 251 | 911824 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 7500 | MadNLP | 4.1723042e7 | 608 | 20748208 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 7500 | NonlinearSolve (LM) | 3.1028258084e10 | 1562 | 206480096 | 5 | 1.0465e+01 | false | timeout | NaN | MaxTime |
| 7500 | NonlinearSolve (TrustRegion) | 3.67302333e8 | 52962 | 262726992 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 7500 | CaNNOLeS | 6.8504209e7 | 229 | 47225792 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 10000 | SecondOrderOptimization (Dogleg) | 2.6734854e7 | 431 | 40640224 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | SecondOrderOptimization (LM) | 3.1393625e7 | 425 | 40148560 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 10000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 10000 | Optim (Newton) | 9.3945417e7 | 654 | 311978336 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 10000 | JSOSolvers (trunk) | 2.907536792e9 | 81 | 4377216 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 10000 | JSOSolvers (tron) | 2.399741458e9 | 322 | 6425312 | 300 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 10000 | Ipopt | 8.4668541e7 | 251 | 1239504 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 10000 | MadNLP | 5.69813335e7 | 608 | 27524016 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 10000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 10000 | CaNNOLeS | 8.44946045e7 | 229 | 58760128 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
