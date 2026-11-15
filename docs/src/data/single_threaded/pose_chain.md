# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: NLLSModel (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T03:38:08
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
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
| 50 | SecondOrderOptimization (Dogleg) | 126333.0 | 230 | 190832 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | SecondOrderOptimization (LM) | 123874.5 | 226 | 188256 | 5 | 3.3090e-02 | true | ok | NaN | rel\_dcost |
| 50 | LeastSquaresOptim (Dogleg) | 2.8263125e6 | 126 | 727472 | 5 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | LeastSquaresOptim (LM) | 1.04520005e7 | 203 | 1321680 | 9 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | Optim (Newton) | 1.0810415e6 | 101 | 383568 | 5 | 3.3090e-02 | true | ok | NaN | converged |
| 50 | JSOSolvers (trunk) | 2.913604e6 | 60 | 23968 | 16 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | JSOSolvers (tron) | 4.0776045e6 | 124 | 37360 | 21 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | Ipopt | 992354.0 | 246 | 16784 | 5 | 3.3090e-02 | true | ok | NaN | first\_order |
| 50 | MadNLP | 598229.5 | 568 | 192016 | 5 | 3.3090e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 50 | NonlinearSolve (LM) | 7.9979792e7 | 1761 | 14406528 | 122 | 3.3090e-02 | true | ok | NaN | StalledSuccess |
| 50 | NonlinearSolve (TrustRegion) | 2.42502495e7 | 148 | 668960 | 39 | 3.3090e-02 | true | ok | NaN | StalledSuccess |
| 50 | CaNNOLeS | 2.2118458e7 | 209 | 4249920 | 5 | 3.3090e-02 | true | ok | NaN | first\_order |
| 100 | SecondOrderOptimization (Dogleg) | 232104.5 | 259 | 384352 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | SecondOrderOptimization (LM) | 227145.5 | 253 | 379088 | 4 | 4.2617e-02 | true | ok | NaN | rel\_dcost |
| 100 | LeastSquaresOptim (Dogleg) | 1.8506792e7 | 121 | 1376160 | 4 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 8.71369375e7 | 247 | 2945104 | 10 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | Optim (Newton) | 6.3858335e6 | 109 | 1476464 | 5 | 4.2617e-02 | true | ok | NaN | converged |
| 100 | JSOSolvers (trunk) | 2.8181166e7 | 77 | 49216 | 66 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | JSOSolvers (tron) | 2.7747125e7 | 149 | 73920 | 39 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | Ipopt | 1.32025e6 | 251 | 23504 | 5 | 4.2617e-02 | true | ok | NaN | first\_order |
| 100 | MadNLP | 860187.5 | 587 | 342368 | 5 | 4.2617e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 4.42279833e8 | 2055 | 31856672 | 124 | 4.2617e-02 | true | ok | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 1.67683271e8 | 174 | 2432144 | 38 | 4.2617e-02 | true | ok | NaN | StalledSuccess |
| 100 | CaNNOLeS | 1.08348208e8 | 221 | 15672128 | 5 | 4.2617e-02 | true | ok | NaN | first\_order |
| 200 | SecondOrderOptimization (Dogleg) | 518020.5 | 268 | 756480 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | SecondOrderOptimization (LM) | 503916.5 | 262 | 746096 | 5 | 4.8756e-02 | true | ok | NaN | rel\_dcost |
| 200 | LeastSquaresOptim (Dogleg) | 4.6584585e6 | 106 | 121040 | 6 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | LeastSquaresOptim (LM) | 9.34225e6 | 167 | 119120 | 13 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | Optim (Newton) | 1.8414795e6 | 744 | 7581152 | 6 | 4.8756e-02 | true | ok | NaN | converged |
| 200 | JSOSolvers (trunk) | 2.2720646e7 | 81 | 95872 | 203 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | JSOSolvers (tron) | 1.9758833e7 | 149 | 141792 | 109 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | Ipopt | 2.262854e6 | 281 | 37552 | 6 | 4.8756e-02 | true | ok | NaN | first\_order |
| 200 | MadNLP | 1.633896e6 | 599 | 642176 | 6 | 4.8756e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 200 | NonlinearSolve (LM) | 6.575966045e8 | 22728 | 131851808 | 132 | 4.8756e-02 | true | ok | NaN | StalledSuccess |
| 200 | NonlinearSolve (TrustRegion) | 3.6768125e6 | 1237 | 6680352 | 39 | 4.8756e-02 | true | ok | NaN | StalledSuccess |
| 200 | CaNNOLeS | 1.724188e6 | 229 | 1223616 | 6 | 4.8756e-02 | true | ok | NaN | first\_order |
| 400 | SecondOrderOptimization (Dogleg) | 982125.5 | 290 | 1495536 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | SecondOrderOptimization (LM) | 952000.0 | 284 | 1474912 | 5 | 5.3112e-02 | true | ok | NaN | rel\_dcost |
| 400 | LeastSquaresOptim (Dogleg) | 1.64727915e7 | 142 | 215184 | 10 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | LeastSquaresOptim (LM) | 3.0396833e7 | 209 | 240944 | 17 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | Optim (Newton) | 3.396146e6 | 744 | 15033072 | 6 | 5.3112e-02 | true | ok | NaN | converged |
| 400 | JSOSolvers (trunk) | 9.1314625e7 | 81 | 189056 | 438 | 5.3112e-02 | true | ok | NaN | first\_order |
| 400 | JSOSolvers (tron) | 6.4116625e7 | 321 | 290720 | 170 | 5.3112e-02 | false | not_converged | NaN | small\_step |
| 400 | Ipopt | 3.8181875e6 | 281 | 63152 | 6 | 5.3112e-02 | true | ok | NaN | first\_order |
| 400 | MadNLP | 3.017437e6 | 599 | 1289408 | 6 | 5.3112e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 400 | NonlinearSolve (LM) | 2.551419209e9 | 23392 | 277153280 | 135 | 5.3112e-02 | true | ok | NaN | StalledSuccess |
| 400 | NonlinearSolve (TrustRegion) | 1.3038917e7 | 4077 | 15284160 | 40 | 5.3112e-02 | true | ok | NaN | StalledSuccess |
| 400 | CaNNOLeS | 3.525687e6 | 229 | 2407360 | 6 | 5.3112e-02 | true | ok | NaN | first\_order |
| 800 | SecondOrderOptimization (Dogleg) | 2.044792e6 | 293 | 2981088 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | SecondOrderOptimization (LM) | 1.9686255e6 | 287 | 2939984 | 5 | 5.4356e-02 | true | ok | NaN | rel\_dcost |
| 800 | LeastSquaresOptim (Dogleg) | 3.5814208e7 | 126 | 352656 | 8 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | LeastSquaresOptim (LM) | 7.572875e7 | 211 | 397808 | 17 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | Optim (Newton) | 5.9299375e6 | 642 | 24958112 | 5 | 5.4356e-02 | true | ok | NaN | converged |
| 800 | JSOSolvers (trunk) | 2.09220375e8 | 213 | 377536 | 501 | 5.4356e-02 | false | not_converged | NaN | max\_iter |
| 800 | JSOSolvers (tron) | 1.81207625e8 | 322 | 562400 | 234 | 5.4356e-02 | false | not_converged | NaN | small\_step |
| 800 | Ipopt | 6.0034995e6 | 251 | 113104 | 5 | 5.4356e-02 | true | ok | NaN | first\_order |
| 800 | MadNLP | 4.75425e6 | 599 | 2526816 | 5 | 5.4356e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 800 | NonlinearSolve (LM) | 1.0519701542e10 | 869 | 106213632 | 132 | 5.4356e-02 | true | ok | NaN | StalledSuccess |
| 800 | NonlinearSolve (TrustRegion) | 2.631875e7 | 6956 | 28491520 | 39 | 5.4356e-02 | true | ok | NaN | StalledSuccess |
| 800 | CaNNOLeS | 5.846188e6 | 229 | 4766656 | 5 | 5.4356e-02 | true | ok | NaN | first\_order |
| 1200 | SecondOrderOptimization (Dogleg) | 2.910521e6 | 296 | 4406400 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | SecondOrderOptimization (LM) | 2.875646e6 | 290 | 4340720 | 5 | 5.4395e-02 | true | ok | NaN | rel\_dcost |
| 1200 | LeastSquaresOptim (Dogleg) | 6.6359917e7 | 134 | 503248 | 9 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | LeastSquaresOptim (LM) | 1.330343745e8 | 219 | 537552 | 18 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | Optim (Newton) | 9.2194795e6 | 642 | 37111968 | 5 | 5.4395e-02 | true | ok | NaN | converged |
| 1200 | JSOSolvers (trunk) | 3.37804917e8 | 81 | 559744 | 501 | 5.4395e-02 | false | not_converged | NaN | max\_iter |
| 1200 | JSOSolvers (tron) | 2.6431775e8 | 322 | 842464 | 242 | 5.4395e-02 | false | not_converged | NaN | small\_step |
| 1200 | Ipopt | 8.637312e6 | 251 | 174544 | 5 | 5.4395e-02 | true | ok | NaN | first\_order |
| 1200 | MadNLP | 7.1696045e6 | 599 | 3587072 | 5 | 5.4395e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 1200 | NonlinearSolve (LM) | 2.3576361708e10 | 869 | 236307360 | 132 | 5.4395e-02 | true | ok | NaN | StalledSuccess |
| 1200 | NonlinearSolve (TrustRegion) | 4.1177041e7 | 9585 | 39509824 | 39 | 5.4395e-02 | true | ok | NaN | StalledSuccess |
| 1200 | CaNNOLeS | 9.315771e6 | 229 | 6921152 | 5 | 5.4395e-02 | true | ok | NaN | first\_order |
| 2000 | SecondOrderOptimization (Dogleg) | 4.84125e6 | 296 | 7353680 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | SecondOrderOptimization (LM) | 4.7741665e6 | 290 | 7255232 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 2000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 2000 | LeastSquaresOptim (LM) | 2.17274875e8 | 237 | 797040 | 20 | 5.4397e-02 | true | ok | NaN | converged |
| 2000 | Optim (Newton) | 1.5963e7 | 662 | 61422048 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 2000 | JSOSolvers (trunk) | 5.78365667e8 | 81 | 936576 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 2000 | JSOSolvers (tron) | 5.12328459e8 | 322 | 1368800 | 287 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 2000 | Ipopt | 1.3724104e7 | 251 | 256464 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 2000 | MadNLP | 1.19676665e7 | 599 | 5662528 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 2000 | NonlinearSolve (LM) | 3.0022336125e10 | 11972 | 674928160 | 67 | 5.4397e-02 | false | timeout | NaN | MaxTime |
| 2000 | NonlinearSolve (TrustRegion) | 6.8274e7 | 15098 | 65683728 | 38 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 2000 | CaNNOLeS | 1.4887771e7 | 229 | 11525056 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 3500 | SecondOrderOptimization (Dogleg) | 8.8645835e6 | 302 | 12819264 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | SecondOrderOptimization (LM) | 8.7792915e6 | 296 | 12622512 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 3500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 3500 | LeastSquaresOptim (LM) | 4.07863583e8 | 245 | 1351312 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 3500 | Optim (Newton) | 2.70710205e7 | 670 | 107924064 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 3500 | JSOSolvers (trunk) | 1.026342625e9 | 81 | 1673856 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 3500 | JSOSolvers (tron) | 8.52044834e8 | 322 | 2489056 | 266 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 3500 | Ipopt | 2.72525e7 | 251 | 502224 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 3500 | MadNLP | 1.9317833e7 | 599 | 10115680 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 3500 | NonlinearSolve (LM) | 3.1305318375e10 | 4586 | 402922464 | 23 | 5.4397e-02 | false | timeout | NaN | MaxTime |
| 3500 | NonlinearSolve (TrustRegion) | 1.33023167e8 | 25417 | 115452496 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 3500 | CaNNOLeS | 2.65338335e7 | 229 | 20749248 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 5000 | SecondOrderOptimization (Dogleg) | 1.24583125e7 | 302 | 18214896 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | SecondOrderOptimization (LM) | 1.25112705e7 | 296 | 17952608 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 5000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 5000 | LeastSquaresOptim (LM) | 5.86552167e8 | 245 | 1807792 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 5000 | Optim (Newton) | 3.66649165e7 | 662 | 152758752 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 5000 | JSOSolvers (trunk) | 1.536051291e9 | 81 | 2329216 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 5000 | JSOSolvers (tron) | 1.449276875e9 | 322 | 3427040 | 327 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 5000 | Ipopt | 4.0371166e7 | 251 | 666064 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 5000 | MadNLP | 2.762525e7 | 599 | 14086656 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 3.0513104625e10 | 2566 | 281259424 | 11 | 5.5067e-02 | false | timeout | NaN | MaxTime |
| 5000 | NonlinearSolve (TrustRegion) | 1.94925042e8 | 35771 | 176087760 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 5000 | CaNNOLeS | 3.79759585e7 | 229 | 28089280 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 7500 | SecondOrderOptimization (Dogleg) | 1.96248545e7 | 302 | 27109696 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | SecondOrderOptimization (LM) | 1.91447085e7 | 296 | 26749104 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 7500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 7500 | LeastSquaresOptim (LM) | 8.78599479e8 | 266 | 2469280 | 21 | 5.4397e-02 | true | ok | NaN | converged |
| 7500 | Optim (Newton) | 5.5968875e7 | 658 | 228551072 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 7500 | JSOSolvers (trunk) | 2.225866458e9 | 81 | 3263104 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 7500 | JSOSolvers (tron) | 2.111637958e9 | 322 | 4778720 | 322 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 7500 | Ipopt | 6.0098667e7 | 251 | 911824 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 7500 | MadNLP | 4.1854708e7 | 608 | 20748208 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 7500 | NonlinearSolve (LM) | 3.1064840916e10 | 1540 | 241328512 | 5 | 1.0465e+01 | false | timeout | NaN | MaxTime |
| 7500 | NonlinearSolve (TrustRegion) | 3.04885833e8 | 52966 | 287696272 | 41 | 5.4397e-02 | true | ok | NaN | StalledSuccess |
| 7500 | CaNNOLeS | 5.7060042e7 | 229 | 47520704 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 10000 | SecondOrderOptimization (Dogleg) | 2.6459104e7 | 302 | 36469408 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | SecondOrderOptimization (LM) | 2.6409333e7 | 296 | 34830864 | 5 | 5.4397e-02 | true | ok | NaN | rel\_dcost |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 10000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 10000 | Optim (Newton) | 8.25073545e7 | 658 | 307112352 | 5 | 5.4397e-02 | true | ok | NaN | converged |
| 10000 | JSOSolvers (trunk) | 3.006297583e9 | 81 | 4377216 | 501 | 5.4397e-02 | false | not_converged | NaN | max\_iter |
| 10000 | JSOSolvers (tron) | 2.501736417e9 | 322 | 6425312 | 300 | 5.4397e-02 | false | not_converged | NaN | small\_step |
| 10000 | Ipopt | 8.1210375e7 | 251 | 1239504 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
| 10000 | MadNLP | 5.51379375e7 | 608 | 27524016 | 5 | 5.4397e-02 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 10000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 10000 | CaNNOLeS | 7.7630729e7 | 229 | 58760128 | 5 | 5.4397e-02 | true | ok | NaN | first\_order |
