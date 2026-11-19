# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: NLLSModel (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T01:31:27
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=1
- **Git Commit**: 2c10368
- **Dependency Commits**: OptimizationVariableInterface f130043, SecondOrderOptimization 377b96e, NLLSModel 78a4ef5

---

## Model Evaluation Scaling

This problem uses `NLLSModel (Sparse)` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 50 | SecondOrderOptimization (Dogleg) | 125459.0 | 224 | 189920 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | SecondOrderOptimization (LM) | 122999.5 | 220 | 187344 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | SecondOrderOptimization (Gauss-Newton) | 126437.5 | 212 | 172304 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | SecondOrderOptimization (LM, tall) | 3.602667e6 | 109 | 1062928 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | SecondOrderOptimization (LM, tall, LSMR) | 3.2002495e6 | 130 | 875984 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | LeastSquaresOptim (Dogleg) | 2.8443955e6 | 126 | 727472 | 5 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | LeastSquaresOptim (LM) | 1.07550625e7 | 203 | 1321856 | 9 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | Optim (Newton) | 1.110854e6 | 101 | 383568 | 5 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | JSOSolvers (trunk) | 2.9671035e6 | 60 | 23968 | 16 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | JSOSolvers (tron) | 4.1331045e6 | 124 | 37360 | 21 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | Ipopt | 932959.0 | 253 | 20816 | 5 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | MadNLP | 545354.5 | 568 | 192016 | 5 | 3.3090e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 50 | NonlinearSolve (LM) | 8.1500666e7 | 1761 | 14406528 | 122 | 3.3090e-02 | true | ok | NaN | StalledSuccess |
| 50 | NonlinearSolve (TrustRegion) | 2.5702208e7 | 148 | 668960 | 39 | 3.3090e-02 | true | ok | NaN | StalledSuccess |
| 50 | CaNNOLeS | 2.3164625e7 | 209 | 4249920 | 5 | 3.3090e-02 | true | ok | NaN | first\_order |
| 100 | SecondOrderOptimization (Dogleg) | 1.05981875e9 | 1224906 | 65570704 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | SecondOrderOptimization (LM) | 220270.5 | 368 | 423232 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | SecondOrderOptimization (Gauss-Newton) | 212541.5 | 358 | 393216 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | SecondOrderOptimization (LM, tall) | 1.82546665e7 | 122 | 4007456 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | SecondOrderOptimization (LM, tall, LSMR) | 1.74938545e7 | 150 | 3224512 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | LeastSquaresOptim (Dogleg) | 2.0245625e7 | 121 | 1376160 | 4 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 9.1962209e7 | 247 | 2945280 | 10 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | Optim (Newton) | 6.6701455e6 | 109 | 1476464 | 5 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | JSOSolvers (trunk) | 2.9602667e7 | 77 | 49216 | 66 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | JSOSolvers (tron) | 3.0379083e7 | 149 | 73920 | 39 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | Ipopt | 1.542792e6 | 261 | 31568 | 5 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | MadNLP | 2.907203875e9 | 5237272 | 312380208 | 5 | 4.2617e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 4.897854375e8 | 2055 | 31856672 | 124 | 4.2617e-02 | true | ok | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 1.824486045e8 | 174 | 2432144 | 38 | 4.2617e-02 | true | ok | NaN | StalledSuccess |
| 100 | CaNNOLeS | 1.13207375e8 | 221 | 15672128 | 5 | 4.2617e-02 | true | ok | NaN | first\_order |
| 200 | SecondOrderOptimization (Dogleg) | 531708.5 | 391 | 877888 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | SecondOrderOptimization (LM) | 526958.0 | 383 | 865424 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | SecondOrderOptimization (Gauss-Newton) | 525145.5 | 373 | 805712 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | SecondOrderOptimization (LM, tall) | 2.293521e6 | 359 | 2512528 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | SecondOrderOptimization (LM, tall, LSMR) | 7.8225835e6 | 145 | 280656 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | LeastSquaresOptim (Dogleg) | 3.344095e8 | 106 | 121040 | 6 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | LeastSquaresOptim (LM) | 2.660159785e8 | 167 | 119120 | 13 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | Optim (Newton) | 1.7416665e6 | 744 | 7581152 | 6 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | JSOSolvers (trunk) | 2.2263708e7 | 81 | 95872 | 203 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | JSOSolvers (tron) | 2.0329208e7 | 149 | 141792 | 109 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | Ipopt | 2.1458125e6 | 291 | 53296 | 6 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | MadNLP | 1.5458545e6 | 599 | 642176 | 6 | 4.8756e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 200 | NonlinearSolve (LM) | 5.997215625e9 | 1819274 | 233927888 | 132 | 4.8756e-02 | true | ok | NaN | StalledSuccess |
| 200 | NonlinearSolve (TrustRegion) | 2.214354334e9 | 552165 | 38806432 | 39 | 4.8756e-02 | true | ok | NaN | StalledSuccess |
| 200 | CaNNOLeS | 1.7297285e6 | 229 | 1223616 | 6 | 4.8756e-02 | true | ok | NaN | first\_order |
| 400 | SecondOrderOptimization (Dogleg) | 1.0489375e6 | 413 | 1725408 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | SecondOrderOptimization (LM) | 962125.0 | 407 | 1704784 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | SecondOrderOptimization (Gauss-Newton) | 934208.5 | 397 | 1585680 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | SecondOrderOptimization (LM, tall) | 4.5097915e6 | 370 | 4635888 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | SecondOrderOptimization (LM, tall, LSMR) | 2.4888833e7 | 156 | 557296 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | LeastSquaresOptim (Dogleg) | 1.7289146e7 | 142 | 215184 | 10 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | LeastSquaresOptim (LM) | 3.147275e7 | 209 | 240944 | 17 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | Optim (Newton) | 3.361729e6 | 744 | 15033072 | 6 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | JSOSolvers (trunk) | 8.6509916e7 | 81 | 189056 | 438 | 5.3112e-02 | true | ok | NaN | first\_order |
| 400 | JSOSolvers (tron) | 6.3952542e7 | 321 | 290720 | 170 | 5.3112e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 400 | Ipopt | 4.045333e6 | 291 | 94256 | 6 | 5.3112e-02 | true | ok | NaN | first\_order |
| 400 | MadNLP | 3.270479e6 | 599 | 1289408 | 6 | 5.3112e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 400 | NonlinearSolve (LM) | 2.666472917e9 | 23356 | 277152704 | 135 | 5.3112e-02 | true | ok | NaN | StalledSuccess |
| 400 | NonlinearSolve (TrustRegion) | 1.49979795e7 | 4077 | 15284160 | 40 | 5.3112e-02 | true | ok | NaN | StalledSuccess |
| 400 | CaNNOLeS | 3.413271e6 | 229 | 2407360 | 6 | 5.3112e-02 | true | ok | NaN | first\_order |
| 800 | SecondOrderOptimization (Dogleg) | 1.8184585e6 | 416 | 3431472 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | SecondOrderOptimization (LM) | 1.919146e6 | 410 | 3390368 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | SecondOrderOptimization (Gauss-Newton) | 1.8132915e6 | 400 | 3152480 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | SecondOrderOptimization (LM, tall) | 1.02201045e7 | 370 | 9019088 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | SecondOrderOptimization (LM, tall, LSMR) | 6.2911688e7 | 156 | 1107792 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | LeastSquaresOptim (Dogleg) | 3.813775e7 | 126 | 352656 | 8 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | LeastSquaresOptim (LM) | 8.4833729e7 | 211 | 397808 | 17 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | Optim (Newton) | 6.1519165e6 | 642 | 24958112 | 5 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | JSOSolvers (trunk) | 1.89024792e8 | 81 | 375424 | 501 | 5.4356e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 800 | JSOSolvers (tron) | 1.71627917e8 | 322 | 562400 | 234 | 5.4356e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 800 | Ipopt | 5.938229e6 | 261 | 174928 | 5 | 5.4356e-02 | true | ok | NaN | first\_order |
| 800 | MadNLP | 4.96525e6 | 599 | 2526816 | 5 | 5.4356e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 800 | NonlinearSolve (LM) | 1.077441175e10 | 869 | 106213632 | 132 | 5.4356e-02 | true | ok | NaN | StalledSuccess |
| 800 | NonlinearSolve (TrustRegion) | 2.8873e7 | 6860 | 28489984 | 39 | 5.4356e-02 | true | ok | NaN | StalledSuccess |
| 800 | CaNNOLeS | 5.8622495e6 | 229 | 4766656 | 5 | 5.4356e-02 | true | ok | NaN | first\_order |
| 1200 | SecondOrderOptimization (Dogleg) | 2.8954585e6 | 420 | 5081296 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | SecondOrderOptimization (LM) | 2.762875e6 | 414 | 5015616 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | SecondOrderOptimization (Gauss-Newton) | 2.6408335e6 | 404 | 4671232 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | SecondOrderOptimization (LM, tall) | 1.3965271e7 | 370 | 13505584 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | SecondOrderOptimization (LM, tall, LSMR) | 1.14571604e8 | 156 | 1659824 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | LeastSquaresOptim (Dogleg) | 7.02751875e7 | 134 | 503248 | 9 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | LeastSquaresOptim (LM) | 1.41389167e8 | 219 | 537552 | 18 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | Optim (Newton) | 1.0908458e7 | 642 | 37111968 | 5 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | JSOSolvers (trunk) | 3.24655167e8 | 81 | 559744 | 501 | 5.4395e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 1200 | JSOSolvers (tron) | 2.79294541e8 | 322 | 842464 | 242 | 5.4395e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 1200 | Ipopt | 8.389625e6 | 261 | 273232 | 5 | 5.4395e-02 | true | ok | NaN | first\_order |
| 1200 | MadNLP | 7.152125e6 | 599 | 3587072 | 5 | 5.4395e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1200 | NonlinearSolve (LM) | 2.3710221334e10 | 869 | 236307360 | 132 | 5.4395e-02 | true | ok | NaN | StalledSuccess |
| 1200 | NonlinearSolve (TrustRegion) | 5.34946045e7 | 9573 | 39509632 | 39 | 5.4395e-02 | true | ok | NaN | StalledSuccess |
| 1200 | CaNNOLeS | 9.758937e6 | 229 | 6921152 | 5 | 5.4395e-02 | true | ok | NaN | first\_order |
| 2000 | SecondOrderOptimization (Dogleg) | 4.462833e6 | 420 | 8411520 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | SecondOrderOptimization (LM) | 4.6309995e6 | 414 | 8313072 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | SecondOrderOptimization (Gauss-Newton) | 4.4821875e6 | 404 | 7739312 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | SecondOrderOptimization (LM, tall) | 2.3348875e7 | 370 | 22296848 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | SecondOrderOptimization (LM, tall, LSMR) | 2.27321625e8 | 156 | 2759824 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 2000 | LeastSquaresOptim (LM) | 2.40981292e8 | 237 | 797040 | 20 | 5.4397e-02 | true | ok | NaN | converged |
| 2000 | Optim (Newton) | 2.5708708e7 | 658 | 61421984 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 2000 | JSOSolvers (trunk) | 5.34258125e8 | 81 | 936576 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 2000 | JSOSolvers (tron) | 5.14389833e8 | 322 | 1368800 | 287 | 5.4397e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 2000 | Ipopt | 1.39047705e7 | 261 | 404304 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 2000 | MadNLP | 1.1209333e7 | 599 | 5662528 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2000 | NonlinearSolve (LM) | 3.0423083292e10 | 12144 | 684948192 | 68 | 5.4397e-02 | false | timeout | NaN | MaxTime; cost test passes |
| 2000 | NonlinearSolve (TrustRegion) | 8.08775e7 | 15110 | 68960720 | 38 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 2000 | CaNNOLeS | 1.4424937e7 | 229 | 11525056 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 3500 | SecondOrderOptimization (Dogleg) | 7.9483125e6 | 424 | 14675728 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | SecondOrderOptimization (LM) | 7.7164795e6 | 418 | 14478976 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | SecondOrderOptimization (Gauss-Newton) | 7.357667e6 | 408 | 13462848 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | SecondOrderOptimization (LM, tall) | 4.9740375e7 | 370 | 38301360 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | SecondOrderOptimization (LM, tall, LSMR) | 4.25820125e8 | 156 | 4795952 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 3500 | LeastSquaresOptim (LM) | 4.08645042e8 | 245 | 1351312 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 3500 | Optim (Newton) | 3.29674375e7 | 642 | 107923616 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 3500 | JSOSolvers (trunk) | 1.00409225e9 | 81 | 1673856 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 3500 | JSOSolvers (tron) | 8.72125541e8 | 322 | 2489056 | 266 | 5.4397e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 3500 | Ipopt | 2.8703667e7 | 261 | 797520 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 3500 | MadNLP | 1.99928125e7 | 599 | 10115680 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3500 | NonlinearSolve (LM) | 3.0439403084e10 | 4408 | 385676992 | 22 | 5.4397e-02 | false | timeout | NaN | MaxTime; cost test passes |
| 3500 | NonlinearSolve (TrustRegion) | 1.65314625e8 | 25417 | 115452496 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 3500 | CaNNOLeS | 2.7750229e7 | 229 | 19831744 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 5000 | SecondOrderOptimization (Dogleg) | 1.2881875e7 | 424 | 20845504 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | SecondOrderOptimization (LM) | 1.1342708e7 | 418 | 20583216 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | SecondOrderOptimization (Gauss-Newton) | 1.11078335e7 | 408 | 19157488 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | SecondOrderOptimization (LM, tall) | 6.7449292e7 | 370 | 54583312 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | SecondOrderOptimization (LM, tall, LSMR) | 6.26787875e8 | 156 | 6856592 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 5000 | LeastSquaresOptim (LM) | 5.86780625e8 | 245 | 1807792 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 5000 | Optim (Newton) | 5.035375e7 | 654 | 152758624 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 5000 | JSOSolvers (trunk) | 1.468913625e9 | 81 | 2329216 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 5000 | JSOSolvers (tron) | 1.40617225e9 | 322 | 3427040 | 327 | 5.4397e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 5000 | Ipopt | 4.3376417e7 | 261 | 1059664 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 5000 | MadNLP | 2.841475e7 | 599 | 14086656 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 3.0692623166e10 | 2576 | 279424576 | 11 | 5.5067e-02 | false | timeout | NaN | MaxTime |
| 5000 | NonlinearSolve (TrustRegion) | 2.23319396e8 | 35771 | 176087760 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 5000 | CaNNOLeS | 4.0909334e7 | 229 | 28384192 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 7500 | SecondOrderOptimization (Dogleg) | 2.4486312e7 | 424 | 31280400 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | SecondOrderOptimization (LM) | 2.7182292e7 | 418 | 30919808 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | SecondOrderOptimization (Gauss-Newton) | 1.7229292e7 | 408 | 28822336 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | SecondOrderOptimization (LM, tall) | 9.9358125e7 | 370 | 81011376 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | SecondOrderOptimization (LM, tall, LSMR) | 9.58237458e8 | 156 | 9937456 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 7500 | LeastSquaresOptim (LM) | 8.755669375e8 | 266 | 2469280 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 7500 | Optim (Newton) | 5.8388834e7 | 659 | 234695088 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 7500 | JSOSolvers (trunk) | 2.150894625e9 | 81 | 3263104 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 7500 | JSOSolvers (tron) | 2.030485083e9 | 322 | 4778720 | 322 | 5.4397e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 7500 | Ipopt | 6.02032085e7 | 261 | 1452880 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 7500 | MadNLP | 4.2384937e7 | 608 | 20748208 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 7500 | NonlinearSolve (LM) | 3.1254339167e10 | 1566 | 218653472 | 5 | 1.0465e+01 | false | timeout | NaN | MaxTime |
| 7500 | NonlinearSolve (TrustRegion) | 3.55445e8 | 52962 | 262726992 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 7500 | CaNNOLeS | 6.59084165e7 | 229 | 45358016 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 10000 | SecondOrderOptimization (Dogleg) | 3.4784208e7 | 424 | 45162096 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | SecondOrderOptimization (LM) | 3.3199e7 | 418 | 44670432 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | SecondOrderOptimization (Gauss-Newton) | 2.7630917e7 | 408 | 38329504 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | SecondOrderOptimization (LM, tall) | 1.20784e8 | 370 | 107554160 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | SecondOrderOptimization (LM, tall, LSMR) | 1.244982e9 | 156 | 13165808 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 10000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 10000 | Optim (Newton) | 8.1158834e7 | 646 | 305555680 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 10000 | JSOSolvers (trunk) | 2.780312083e9 | 81 | 4377216 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 10000 | JSOSolvers (tron) | 2.410717625e9 | 322 | 6425312 | 300 | 5.4397e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 10000 | Ipopt | 8.38666875e7 | 261 | 1977168 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 10000 | MadNLP | 5.6551042e7 | 608 | 27524016 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 10000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 10000 | CaNNOLeS | 7.9485312e7 | 229 | 60070848 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
