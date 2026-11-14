# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: NLLSModel (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-14T13:35:39
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 4e9eec5

---

## Model Evaluation Scaling

This problem uses `NLLSModel (Sparse)` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 50 | SecondOrderOptimization (Dogleg) | 119687.5 | 227 | 190032 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | SecondOrderOptimization (LM) | 116666.0 | 223 | 187456 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | LeastSquaresOptim (Dogleg) | 2.7510625e6 | 126 | 727296 | 5 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | LeastSquaresOptim (LM) | 1.0363792e7 | 203 | 1321680 | 9 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | Optim (Newton) | 1.1351245e6 | 101 | 382608 | 5 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | JSOSolvers (trunk) | 2.8982295e6 | 60 | 23968 | 16 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | JSOSolvers (tron) | 4.0214375e6 | 124 | 37360 | 21 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | Ipopt | 949729.0 | 246 | 16784 | 5 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | MadNLP | 546125.5 | 568 | 192016 | 5 | 3.3090e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 50 | NonlinearSolve (LM) | 8.0388e7 | 1761 | 14403328 | 122 | 3.3090e-02 | true | ok | NaN | StalledSuccess |
| 50 | NonlinearSolve (TrustRegion) | 2.4406958e7 | 148 | 666528 | 39 | 3.3090e-02 | true | ok | NaN | StalledSuccess |
| 50 | CaNNOLeS | 2.22606875e7 | 209 | 4249920 | 5 | 3.3090e-02 | true | ok | NaN | first\_order |
| 100 | SecondOrderOptimization (Dogleg) | 223562.5 | 256 | 383104 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | SecondOrderOptimization (LM) | 223312.5 | 250 | 377840 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | LeastSquaresOptim (Dogleg) | 1.86108955e7 | 121 | 1375984 | 4 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 8.84306875e7 | 247 | 2945104 | 10 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | Optim (Newton) | 6.3420005e6 | 109 | 1475504 | 5 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | JSOSolvers (trunk) | 2.8201583e7 | 77 | 49216 | 66 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | JSOSolvers (tron) | 2.80225835e7 | 149 | 73920 | 39 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | Ipopt | 1.2924375e6 | 251 | 23504 | 5 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | MadNLP | 834729.0 | 587 | 342368 | 5 | 4.2617e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 4.43986167e8 | 2055 | 31853472 | 124 | 4.2617e-02 | true | ok | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 1.688999585e8 | 174 | 2429712 | 38 | 4.2617e-02 | true | ok | NaN | StalledSuccess |
| 100 | CaNNOLeS | 1.085707085e8 | 221 | 15672128 | 5 | 4.2617e-02 | true | ok | NaN | first\_order |
| 200 | SecondOrderOptimization (Dogleg) | 534937.5 | 265 | 754496 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | SecondOrderOptimization (LM) | 521104.0 | 259 | 744112 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | LeastSquaresOptim (Dogleg) | 3.482635e8 | 106 | 121040 | 6 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | LeastSquaresOptim (LM) | 2.60557792e8 | 167 | 119120 | 13 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | Optim (Newton) | 1.859417e6 | 744 | 7581152 | 6 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | JSOSolvers (trunk) | 2.31278125e7 | 81 | 95872 | 203 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | JSOSolvers (tron) | 1.9762021e7 | 149 | 141792 | 109 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | Ipopt | 2.2238125e6 | 281 | 37552 | 6 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | MadNLP | 1.5817505e6 | 599 | 642176 | 6 | 4.8756e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 200 | NonlinearSolve (LM) | 5.865845125e9 | 1820299 | 234001488 | 132 | 4.8756e-02 | true | ok | NaN | StalledSuccess |
| 200 | NonlinearSolve (TrustRegion) | 2.201105042e9 | 552676 | 38824256 | 39 | 4.8756e-02 | true | ok | NaN | StalledSuccess |
| 200 | CaNNOLeS | 1.8065415e6 | 229 | 1223616 | 6 | 4.8756e-02 | true | ok | NaN | first\_order |
| 400 | SecondOrderOptimization (Dogleg) | 1.017479e6 | 286 | 1491568 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | SecondOrderOptimization (LM) | 969625.0 | 280 | 1470944 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | LeastSquaresOptim (Dogleg) | 1.64742295e7 | 142 | 215184 | 10 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | LeastSquaresOptim (LM) | 3.0600854e7 | 209 | 240944 | 17 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | Optim (Newton) | 3.3971455e6 | 744 | 15033072 | 6 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | JSOSolvers (trunk) | 9.2861125e7 | 81 | 189056 | 438 | 5.3112e-02 | true | ok | NaN | first\_order |
| 400 | JSOSolvers (tron) | 6.5534708e7 | 321 | 290720 | 170 | 5.3112e-02 | false | not_converged | NaN | small\_step |
| 400 | Ipopt | 3.7764585e6 | 281 | 63152 | 6 | 5.3112e-02 | true | ok | NaN | first\_order |
| 400 | MadNLP | 2.9138955e6 | 599 | 1289408 | 6 | 5.3112e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 400 | NonlinearSolve (LM) | 2.5367765e9 | 23368 | 277149824 | 135 | 5.3112e-02 | true | ok | NaN | StalledSuccess |
| 400 | NonlinearSolve (TrustRegion) | 1.37204165e7 | 4077 | 15281728 | 40 | 5.3112e-02 | true | ok | NaN | StalledSuccess |
| 400 | CaNNOLeS | 3.588104e6 | 229 | 2407360 | 6 | 5.3112e-02 | true | ok | NaN | first\_order |
| 800 | SecondOrderOptimization (Dogleg) | 1.915458e6 | 14467 | 3836288 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | SecondOrderOptimization (LM) | 1.8294375e6 | 14461 | 3795184 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | LeastSquaresOptim (Dogleg) | 3.6836334e7 | 126 | 352656 | 8 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | LeastSquaresOptim (LM) | 7.6937917e7 | 211 | 397808 | 17 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | Optim (Newton) | 6.1713125e6 | 642 | 24958112 | 5 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | JSOSolvers (trunk) | 2.15227042e8 | 81 | 375424 | 501 | 5.4356e-02 | false | not_converged | NaN | max\_iter |
| 800 | JSOSolvers (tron) | 1.77547625e8 | 322 | 562400 | 234 | 5.4356e-02 | false | not_converged | NaN | small\_step |
| 800 | Ipopt | 5.950312e6 | 251 | 113104 | 5 | 5.4356e-02 | true | ok | NaN | first\_order |
| 800 | MadNLP | 4.878437e6 | 599 | 2526816 | 5 | 5.4356e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 800 | NonlinearSolve (LM) | 1.060391275e10 | 859 | 106210400 | 132 | 5.4356e-02 | true | ok | NaN | StalledSuccess |
| 800 | NonlinearSolve (TrustRegion) | 2.66249375e7 | 6836 | 28487168 | 39 | 5.4356e-02 | true | ok | NaN | StalledSuccess |
| 800 | CaNNOLeS | 6.0805005e6 | 229 | 4766656 | 5 | 5.4356e-02 | true | ok | NaN | first\_order |
| 1200 | SecondOrderOptimization (Dogleg) | 2.789396e6 | 21527 | 5721296 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | SecondOrderOptimization (LM) | 2.7166045e6 | 21521 | 5655616 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | LeastSquaresOptim (Dogleg) | 6.8064208e7 | 134 | 503248 | 9 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | LeastSquaresOptim (LM) | 1.33703333e8 | 219 | 537552 | 18 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | Optim (Newton) | 8.854146e6 | 642 | 37111968 | 5 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | JSOSolvers (trunk) | 3.35383209e8 | 81 | 559744 | 501 | 5.4395e-02 | false | not_converged | NaN | max\_iter |
| 1200 | JSOSolvers (tron) | 2.7347875e8 | 322 | 842464 | 242 | 5.4395e-02 | false | not_converged | NaN | small\_step |
| 1200 | Ipopt | 8.556771e6 | 251 | 174544 | 5 | 5.4395e-02 | true | ok | NaN | first\_order |
| 1200 | MadNLP | 7.1918125e6 | 599 | 3587072 | 5 | 5.4395e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1200 | NonlinearSolve (LM) | 2.3723145875e10 | 869 | 236304288 | 132 | 5.4395e-02 | true | ok | NaN | StalledSuccess |
| 1200 | NonlinearSolve (TrustRegion) | 4.22511455e7 | 9561 | 39507008 | 39 | 5.4395e-02 | true | ok | NaN | StalledSuccess |
| 1200 | CaNNOLeS | 9.1570005e6 | 229 | 6921152 | 5 | 5.4395e-02 | true | ok | NaN | first\_order |
| 2000 | SecondOrderOptimization (Dogleg) | 4.6622085e6 | 35607 | 9505440 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | SecondOrderOptimization (LM) | 4.5826665e6 | 35601 | 9406992 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 2000 | LeastSquaresOptim (LM) | 2.30101375e8 | 237 | 797040 | 20 | 5.4397e-02 | true | ok | NaN | converged |
| 2000 | Optim (Newton) | 1.554725e7 | 666 | 61422112 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 2000 | JSOSolvers (trunk) | 5.954395e8 | 81 | 936576 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 2000 | JSOSolvers (tron) | 5.14821291e8 | 322 | 1368800 | 287 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 2000 | Ipopt | 1.36521875e7 | 251 | 256464 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 2000 | MadNLP | 1.1343625e7 | 599 | 5662528 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2000 | NonlinearSolve (LM) | 3.0138918708e10 | 11976 | 674925152 | 67 | 5.4397e-02 | false | timeout | NaN | MaxTime |
| 2000 | NonlinearSolve (TrustRegion) | 6.9739875e7 | 15102 | 67319760 | 38 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 2000 | CaNNOLeS | 1.517e7 | 229 | 11525056 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 3500 | SecondOrderOptimization (Dogleg) | 8.719208e6 | 62013 | 16540912 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | SecondOrderOptimization (LM) | 7.9665e6 | 62007 | 16344160 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 3500 | LeastSquaresOptim (LM) | 4.17885083e8 | 245 | 1351312 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 3500 | Optim (Newton) | 3.77365835e7 | 702 | 107924576 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 3500 | JSOSolvers (trunk) | 1.026215833e9 | 81 | 1673856 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 3500 | JSOSolvers (tron) | 8.52607125e8 | 322 | 2489056 | 266 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 3500 | Ipopt | 2.8278729e7 | 251 | 502224 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 3500 | MadNLP | 1.95985e7 | 599 | 10115680 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3500 | NonlinearSolve (LM) | 3.0436611042e10 | 4418 | 385674080 | 22 | 5.4397e-02 | false | timeout | NaN | MaxTime |
| 3500 | NonlinearSolve (TrustRegion) | 1.26428417e8 | 25419 | 115450096 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 3500 | CaNNOLeS | 2.7063333e7 | 229 | 20749248 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 5000 | SecondOrderOptimization (Dogleg) | 1.3165167e7 | 88429 | 23613184 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | SecondOrderOptimization (LM) | 1.2043104e7 | 88423 | 23350896 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 5000 | LeastSquaresOptim (LM) | 5.99707542e8 | 245 | 1807792 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 5000 | Optim (Newton) | 4.7911125e7 | 646 | 152758496 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 5000 | JSOSolvers (trunk) | 1.543886542e9 | 81 | 2329216 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 5000 | JSOSolvers (tron) | 1.459022416e9 | 322 | 3427040 | 327 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 5000 | Ipopt | 4.06783955e7 | 251 | 666064 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 5000 | MadNLP | 2.8102584e7 | 599 | 14086656 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 3.0737891042e10 | 2574 | 284992032 | 11 | 5.5067e-02 | false | timeout | NaN | MaxTime |
| 5000 | NonlinearSolve (TrustRegion) | 2.36332542e8 | 35775 | 176085392 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 5000 | CaNNOLeS | 3.9269916e7 | 229 | 28089280 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 7500 | SecondOrderOptimization (Dogleg) | 2.94950835e7 | 132429 | 35120368 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | SecondOrderOptimization (LM) | 2.30926245e7 | 132423 | 34759776 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 7500 | LeastSquaresOptim (LM) | 8.948946875e8 | 266 | 2469280 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 7500 | Optim (Newton) | 6.6909917e7 | 650 | 228550944 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 7500 | JSOSolvers (trunk) | 2.246834292e9 | 81 | 3263104 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 7500 | JSOSolvers (tron) | 2.144198958e9 | 334 | 4778912 | 322 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 7500 | Ipopt | 6.1044896e7 | 251 | 911824 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 7500 | MadNLP | 4.1575875e7 | 608 | 20748208 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 7500 | NonlinearSolve (LM) | 3.1468355083e10 | 1558 | 218207904 | 5 | 1.0465e+01 | false | timeout | NaN | MaxTime |
| 7500 | NonlinearSolve (TrustRegion) | 2.99866291e8 | 52962 | 262724560 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 7500 | CaNNOLeS | 6.1028667e7 | 229 | 45669312 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 10000 | SecondOrderOptimization (Dogleg) | 2.9294167e7 | 176445 | 46175216 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | SecondOrderOptimization (LM) | 2.5441e7 | 176439 | 45683552 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 10000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 10000 | Optim (Newton) | 9.4794541e7 | 662 | 304818656 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 10000 | JSOSolvers (trunk) | 3.063056208e9 | 81 | 4377216 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 10000 | JSOSolvers (tron) | 2.654124666e9 | 330 | 6425440 | 300 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 10000 | Ipopt | 8.21287295e7 | 251 | 1239504 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 10000 | MadNLP | 5.6298042e7 | 608 | 27524016 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 10000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 10000 | CaNNOLeS | 8.9936333e7 | 229 | 56089536 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
