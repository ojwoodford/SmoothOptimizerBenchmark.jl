# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: NLLSModel (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T02:22:05
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
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
| 50 | SecondOrderOptimization (Dogleg) | 121500.0 | 224 | 189920 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | SecondOrderOptimization (LM) | 119916.5 | 220 | 187344 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | SecondOrderOptimization (Gauss-Newton) | 121374.5 | 212 | 172304 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | SecondOrderOptimization (LM, tall) | 3.474208e6 | 109 | 1062832 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | SecondOrderOptimization (LM, tall, LSMR) | 3.080771e6 | 130 | 875888 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | LeastSquaresOptim (Dogleg) | 2.741396e6 | 126 | 727472 | 5 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | LeastSquaresOptim (LM) | 1.0324541e7 | 203 | 1321856 | 9 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | Optim (Newton) | 1.0853335e6 | 101 | 383568 | 5 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | JSOSolvers (trunk) | 2.90075e6 | 60 | 23968 | 16 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | JSOSolvers (tron) | 4.0300415e6 | 124 | 37360 | 21 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | Ipopt | 934062.5 | 253 | 20816 | 5 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | MadNLP | 543271.0 | 568 | 192016 | 5 | 3.3090e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 50 | NonlinearSolve (LM) | 7.8322791e7 | 1761 | 14406528 | 122 | 3.3090e-02 | true | ok | NaN | StalledSuccess |
| 50 | NonlinearSolve (TrustRegion) | 2.4200708e7 | 148 | 668960 | 39 | 3.3090e-02 | true | ok | NaN | StalledSuccess |
| 50 | CaNNOLeS | 2.1685021e7 | 209 | 4249920 | 5 | 3.3090e-02 | true | ok | NaN | first\_order |
| 100 | SecondOrderOptimization (Dogleg) | 211812.5 | 252 | 382544 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | SecondOrderOptimization (LM) | 211229.5 | 246 | 377280 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | SecondOrderOptimization (Gauss-Newton) | 213375.5 | 236 | 347264 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | SecondOrderOptimization (LM, tall) | 1.6892521e7 | 122 | 4007232 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | SecondOrderOptimization (LM, tall, LSMR) | 1.67180205e7 | 150 | 3224288 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | LeastSquaresOptim (Dogleg) | 1.82271455e7 | 121 | 1376160 | 4 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 8.6816896e7 | 247 | 2945280 | 10 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | Optim (Newton) | 6.271896e6 | 109 | 1476464 | 5 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | JSOSolvers (trunk) | 2.8004709e7 | 77 | 49216 | 66 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | JSOSolvers (tron) | 2.7637562e7 | 149 | 73920 | 39 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | Ipopt | 1.2680415e6 | 261 | 31568 | 5 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | MadNLP | 810937.5 | 587 | 342368 | 5 | 4.2617e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 4.2772875e8 | 2055 | 31856672 | 124 | 4.2617e-02 | true | ok | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 1.63972083e8 | 174 | 2432144 | 38 | 4.2617e-02 | true | ok | NaN | StalledSuccess |
| 100 | CaNNOLeS | 1.06615375e8 | 221 | 15672128 | 5 | 4.2617e-02 | true | ok | NaN | first\_order |
| 200 | SecondOrderOptimization (Dogleg) | 510708.5 | 261 | 752880 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | SecondOrderOptimization (LM) | 514625.0 | 255 | 742496 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | SecondOrderOptimization (Gauss-Newton) | 504729.5 | 245 | 682784 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | SecondOrderOptimization (LM, tall) | 2.214917e6 | 359 | 2512304 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | SecondOrderOptimization (LM, tall, LSMR) | 7.4223335e6 | 145 | 280432 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | LeastSquaresOptim (Dogleg) | 4.6971665e6 | 106 | 121040 | 6 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | LeastSquaresOptim (LM) | 9.2464165e6 | 167 | 119120 | 13 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | Optim (Newton) | 1.76525e6 | 744 | 7581152 | 6 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | JSOSolvers (trunk) | 2.335125e7 | 81 | 95872 | 203 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | JSOSolvers (tron) | 1.96625625e7 | 149 | 141792 | 109 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | Ipopt | 2.202396e6 | 291 | 53296 | 6 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | MadNLP | 1.534208e6 | 599 | 642176 | 6 | 4.8756e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 200 | NonlinearSolve (LM) | 6.46773625e8 | 22528 | 131848608 | 132 | 4.8756e-02 | true | ok | NaN | StalledSuccess |
| 200 | NonlinearSolve (TrustRegion) | 3.6262085e6 | 1237 | 6680352 | 39 | 4.8756e-02 | true | ok | NaN | StalledSuccess |
| 200 | CaNNOLeS | 1.7283545e6 | 229 | 1223616 | 6 | 4.8756e-02 | true | ok | NaN | first\_order |
| 400 | SecondOrderOptimization (Dogleg) | 965458.0 | 284 | 1488800 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | SecondOrderOptimization (LM) | 981312.5 | 278 | 1468176 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | SecondOrderOptimization (Gauss-Newton) | 959187.5 | 268 | 1349072 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | SecondOrderOptimization (LM, tall) | 4.429458e6 | 370 | 4635664 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | SecondOrderOptimization (LM, tall, LSMR) | 2.3369667e7 | 156 | 557072 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | LeastSquaresOptim (Dogleg) | 1.6203604e7 | 142 | 215184 | 10 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | LeastSquaresOptim (LM) | 2.9928375e7 | 209 | 240944 | 17 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | Optim (Newton) | 3.3745e6 | 744 | 15033072 | 6 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | JSOSolvers (trunk) | 9.246525e7 | 81 | 189056 | 438 | 5.3112e-02 | true | ok | NaN | first\_order |
| 400 | JSOSolvers (tron) | 6.5975291e7 | 321 | 290720 | 170 | 5.3112e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 400 | Ipopt | 3.710875e6 | 291 | 94256 | 6 | 5.3112e-02 | true | ok | NaN | first\_order |
| 400 | MadNLP | 2.7689585e6 | 599 | 1289408 | 6 | 5.3112e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 400 | NonlinearSolve (LM) | 2.459133542e9 | 22858 | 277144736 | 135 | 5.3112e-02 | true | ok | NaN | StalledSuccess |
| 400 | NonlinearSolve (TrustRegion) | 1.29542705e7 | 4077 | 15284160 | 40 | 5.3112e-02 | true | ok | NaN | StalledSuccess |
| 400 | CaNNOLeS | 3.4510625e6 | 229 | 2407360 | 6 | 5.3112e-02 | true | ok | NaN | first\_order |
| 800 | SecondOrderOptimization (Dogleg) | 1.9271455e6 | 287 | 2967536 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | SecondOrderOptimization (LM) | 1.9625625e6 | 281 | 2926432 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | SecondOrderOptimization (Gauss-Newton) | 1.9146455e6 | 271 | 2688544 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | SecondOrderOptimization (LM, tall) | 8.821396e6 | 370 | 9018864 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | SecondOrderOptimization (LM, tall, LSMR) | 6.013175e7 | 156 | 1107568 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | LeastSquaresOptim (Dogleg) | 3.5814604e7 | 126 | 352656 | 8 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | LeastSquaresOptim (LM) | 7.7598417e7 | 211 | 397808 | 17 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | Optim (Newton) | 5.6184795e6 | 642 | 24958112 | 5 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | JSOSolvers (trunk) | 2.12017459e8 | 81 | 375424 | 501 | 5.4356e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 800 | JSOSolvers (tron) | 1.78217209e8 | 322 | 562400 | 234 | 5.4356e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 800 | Ipopt | 5.7421465e6 | 261 | 174928 | 5 | 5.4356e-02 | true | ok | NaN | first\_order |
| 800 | MadNLP | 4.7062085e6 | 599 | 2526816 | 5 | 5.4356e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 800 | NonlinearSolve (LM) | 1.029241275e10 | 859 | 106213472 | 132 | 5.4356e-02 | true | ok | NaN | StalledSuccess |
| 800 | NonlinearSolve (TrustRegion) | 2.45345e7 | 6836 | 28489600 | 39 | 5.4356e-02 | true | ok | NaN | StalledSuccess |
| 800 | CaNNOLeS | 5.9027715e6 | 229 | 4766656 | 5 | 5.4356e-02 | true | ok | NaN | first\_order |
| 1200 | SecondOrderOptimization (Dogleg) | 2.894667e6 | 291 | 4383888 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | SecondOrderOptimization (LM) | 2.845042e6 | 285 | 4318208 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | SecondOrderOptimization (Gauss-Newton) | 2.8683745e6 | 275 | 3973824 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | SecondOrderOptimization (LM, tall) | 1.3233271e7 | 370 | 13505360 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | SecondOrderOptimization (LM, tall, LSMR) | 1.092818535e8 | 156 | 1659600 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | LeastSquaresOptim (Dogleg) | 6.5907646e7 | 134 | 503248 | 9 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | LeastSquaresOptim (LM) | 1.310816875e8 | 219 | 537552 | 18 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | Optim (Newton) | 8.6601245e6 | 642 | 37111968 | 5 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | JSOSolvers (trunk) | 3.39280042e8 | 81 | 559744 | 501 | 5.4395e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 1200 | JSOSolvers (tron) | 2.69119291e8 | 322 | 842464 | 242 | 5.4395e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 1200 | Ipopt | 8.2644375e6 | 261 | 273232 | 5 | 5.4395e-02 | true | ok | NaN | first\_order |
| 1200 | MadNLP | 6.763958e6 | 599 | 3587072 | 5 | 5.4395e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1200 | NonlinearSolve (LM) | 2.3085394292e10 | 869 | 236307360 | 132 | 5.4395e-02 | true | ok | NaN | StalledSuccess |
| 1200 | NonlinearSolve (TrustRegion) | 4.1707709e7 | 9561 | 39509440 | 39 | 5.4395e-02 | true | ok | NaN | StalledSuccess |
| 1200 | CaNNOLeS | 8.870229e6 | 229 | 6921152 | 5 | 5.4395e-02 | true | ok | NaN | first\_order |
| 2000 | SecondOrderOptimization (Dogleg) | 4.820833e6 | 291 | 7320896 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | SecondOrderOptimization (LM) | 4.762542e6 | 285 | 7222448 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | SecondOrderOptimization (Gauss-Newton) | 4.6762295e6 | 275 | 6648688 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | SecondOrderOptimization (LM, tall) | 2.2026875e7 | 370 | 22296624 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | SecondOrderOptimization (LM, tall, LSMR) | 2.20160625e8 | 156 | 2759600 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 2000 | LeastSquaresOptim (LM) | 2.25236958e8 | 237 | 797040 | 20 | 5.4397e-02 | true | ok | NaN | converged |
| 2000 | Optim (Newton) | 1.65856455e7 | 662 | 61422048 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 2000 | JSOSolvers (trunk) | 5.91613333e8 | 81 | 936576 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 2000 | JSOSolvers (tron) | 5.12968042e8 | 322 | 1368800 | 287 | 5.4397e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 2000 | Ipopt | 1.3290063e7 | 261 | 404304 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 2000 | MadNLP | 1.1033333e7 | 599 | 5662528 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2000 | NonlinearSolve (LM) | 3.0155427583e10 | 12296 | 694967904 | 69 | 5.4397e-02 | false | timeout | NaN | MaxTime; cost test passes |
| 2000 | NonlinearSolve (TrustRegion) | 6.8317375e7 | 15090 | 82067600 | 38 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 2000 | CaNNOLeS | 1.47445e7 | 229 | 11525056 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 3500 | SecondOrderOptimization (Dogleg) | 8.4333335e6 | 295 | 12749520 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | SecondOrderOptimization (LM) | 8.3013125e6 | 289 | 12552768 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | SecondOrderOptimization (Gauss-Newton) | 8.160625e6 | 279 | 11536640 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | SecondOrderOptimization (LM, tall) | 3.98409165e7 | 370 | 38301136 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | SecondOrderOptimization (LM, tall, LSMR) | 4.24216292e8 | 156 | 4795728 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 3500 | LeastSquaresOptim (LM) | 4.03068542e8 | 245 | 1351312 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 3500 | Optim (Newton) | 2.66529165e7 | 642 | 107923616 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 3500 | JSOSolvers (trunk) | 1.026352583e9 | 81 | 1673856 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 3500 | JSOSolvers (tron) | 8.82213708e8 | 322 | 2489056 | 266 | 5.4397e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 3500 | Ipopt | 2.71914375e7 | 261 | 797520 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 3500 | MadNLP | 1.9043375e7 | 599 | 10115680 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3500 | NonlinearSolve (LM) | 3.0705212709e10 | 4582 | 402922400 | 23 | 5.4397e-02 | false | timeout | NaN | MaxTime; cost test passes |
| 3500 | NonlinearSolve (TrustRegion) | 1.2548225e8 | 25425 | 115452624 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 3500 | CaNNOLeS | 2.5940375e7 | 229 | 20749248 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 5000 | SecondOrderOptimization (Dogleg) | 1.20510835e7 | 295 | 18132864 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | SecondOrderOptimization (LM) | 1.2288583e7 | 289 | 17870576 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | SecondOrderOptimization (Gauss-Newton) | 1.1706354e7 | 279 | 16444848 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | SecondOrderOptimization (LM, tall) | 5.5673791e7 | 370 | 54583088 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | SecondOrderOptimization (LM, tall, LSMR) | 6.161756665e8 | 156 | 6856368 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 5000 | LeastSquaresOptim (LM) | 5.78210646e8 | 245 | 1807792 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 5000 | Optim (Newton) | 3.8196875e7 | 678 | 152759008 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 5000 | JSOSolvers (trunk) | 1.554814042e9 | 81 | 2329216 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 5000 | JSOSolvers (tron) | 1.444241e9 | 322 | 3427040 | 327 | 5.4397e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 5000 | Ipopt | 4.0715834e7 | 261 | 1059664 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 5000 | MadNLP | 2.7103875e7 | 599 | 14086656 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 3.2609578625e10 | 2742 | 309072544 | 12 | 5.4399e-02 | false | timeout | NaN | MaxTime; cost test passes |
| 5000 | NonlinearSolve (TrustRegion) | 1.87892584e8 | 35781 | 176087920 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 5000 | CaNNOLeS | 3.75225e7 | 229 | 29694912 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 7500 | SecondOrderOptimization (Dogleg) | 1.8462125e7 | 295 | 28600528 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | SecondOrderOptimization (LM) | 1.794775e7 | 289 | 28239936 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | SecondOrderOptimization (Gauss-Newton) | 1.7664958e7 | 279 | 26142464 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | SecondOrderOptimization (LM, tall) | 8.892675e7 | 370 | 81011152 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | SecondOrderOptimization (LM, tall, LSMR) | 9.391156455e8 | 156 | 9937232 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 7500 | LeastSquaresOptim (LM) | 8.65794813e8 | 266 | 2469280 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 7500 | Optim (Newton) | 5.7977667e7 | 666 | 228551200 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 7500 | JSOSolvers (trunk) | 2.251622625e9 | 81 | 3263104 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 7500 | JSOSolvers (tron) | 2.12398825e9 | 322 | 4778720 | 322 | 5.4397e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 7500 | Ipopt | 5.9261542e7 | 261 | 1452880 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 7500 | MadNLP | 4.0341375e7 | 608 | 20748208 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 7500 | NonlinearSolve (LM) | 3.0591601208e10 | 1568 | 218456896 | 5 | 1.0465e+01 | false | timeout | NaN | MaxTime |
| 7500 | NonlinearSolve (TrustRegion) | 2.88423875e8 | 52962 | 262726992 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 7500 | CaNNOLeS | 5.6253041e7 | 235 | 44129312 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 10000 | SecondOrderOptimization (Dogleg) | 2.65735625e7 | 295 | 35158576 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | SecondOrderOptimization (LM) | 2.58224585e7 | 289 | 34666912 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | SecondOrderOptimization (Gauss-Newton) | 2.43543335e7 | 279 | 31864928 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | SecondOrderOptimization (LM, tall) | 1.164795415e8 | 370 | 107553936 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | SecondOrderOptimization (LM, tall, LSMR) | 1.249388666e9 | 156 | 13165584 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 10000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 10000 | Optim (Newton) | 8.24275835e7 | 646 | 305719520 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 10000 | JSOSolvers (trunk) | 3.107707e9 | 81 | 4377216 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter; cost test passes |
| 10000 | JSOSolvers (tron) | 2.633112416e9 | 322 | 6425312 | 300 | 5.4397e-02 | false | not_converged | NaN | small\_step; cost test passes |
| 10000 | Ipopt | 8.19478545e7 | 261 | 1977168 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 10000 | MadNLP | 5.4363604e7 | 608 | 27524016 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 10000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 10000 | CaNNOLeS | 7.615425e7 | 229 | 59710400 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
