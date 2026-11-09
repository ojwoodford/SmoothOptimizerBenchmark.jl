# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: NLLSModel (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-09T19:55:37
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 5a66143

---

## Model Evaluation Scaling

This problem uses `NLLSModel (Sparse)` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 50 | SecondOrderOptimization (Dogleg) | 118937.5 | 221 | 174640 | 5 | 3.3090e-02 | true |
| 50 | SecondOrderOptimization (LM) | 120583.5 | 221 | 187040 | 5 | 3.3090e-02 | true |
| 50 | LeastSquaresOptim (Dogleg) | 3.0545e6 | 7126 | 1242336 | 5 | 3.3090e-02 | true |
| 50 | LeastSquaresOptim (LM) | 1.1127604e7 | 12803 | 2248752 | 9 | 3.3090e-02 | true |
| 50 | Optim (Newton) | 1.453625e6 | 8501 | 1000656 | 5 | 3.3090e-02 | true |
| 50 | JSOSolvers (trunk) | 3.956729e6 | 23894 | 1775648 | 16 | 3.3090e-02 | true |
| 50 | JSOSolvers (tron) | 5.404333e6 | 30969 | 2304144 | 21 | 3.3090e-02 | true |
| 50 | Ipopt | 939250.5 | 246 | 16784 | 5 | 3.3090e-02 | true |
| 50 | MadNLP | 538104.0 | 568 | 192016 | 5 | 3.3090e-02 | true |
| 50 | NonlinearSolve (LM) | 1.60688666e8 | 65330 | 31011072 | 122 | 3.3090e-02 | true |
| 50 | NonlinearSolve (TrustRegion) | 1.27455205e7 | 13030 | 5539760 | 39 | 3.3090e-02 | true |
| 50 | CaNNOLeS | 2.24416255e7 | 8621 | 4868160 | 5 | 3.3090e-02 | true |
| 100 | SecondOrderOptimization (Dogleg) | 220020.5 | 247 | 352672 | 4 | 4.2617e-02 | true |
| 100 | SecondOrderOptimization (LM) | 202375.0 | 248 | 377376 | 4 | 4.2617e-02 | true |
| 100 | LeastSquaresOptim (Dogleg) | 1.91281255e7 | 11441 | 2210416 | 4 | 4.2617e-02 | true |
| 100 | LeastSquaresOptim (LM) | 9.0371e7 | 28547 | 5031184 | 10 | 4.2617e-02 | true |
| 100 | Optim (Newton) | 7.1659995e6 | 17089 | 2727152 | 5 | 4.2617e-02 | true |
| 100 | JSOSolvers (trunk) | 3.6868167e7 | 189821 | 14028096 | 66 | 4.2617e-02 | true |
| 100 | JSOSolvers (tron) | 3.27523745e7 | 113430 | 8419280 | 39 | 4.2617e-02 | true |
| 100 | Ipopt | 1.340229e6 | 251 | 23504 | 5 | 4.2617e-02 | true |
| 100 | MadNLP | 838062.5 | 587 | 342368 | 5 | 4.2617e-02 | true |
| 100 | NonlinearSolve (LM) | 8.65765583e8 | 132813 | 65744944 | 124 | 4.2617e-02 | true |
| 100 | NonlinearSolve (TrustRegion) | 6.1289167e7 | 23158 | 11832544 | 38 | 4.2617e-02 | true |
| 100 | CaNNOLeS | 1.09117667e8 | 17213 | 16923968 | 5 | 4.2617e-02 | true |
| 200 | SecondOrderOptimization (Dogleg) | 513333.5 | 257 | 694288 | 5 | 4.8756e-02 | true |
| 200 | SecondOrderOptimization (LM) | 483604.5 | 257 | 743552 | 5 | 4.8756e-02 | true |
| 200 | LeastSquaresOptim (Dogleg) | 3.436283335e8 | 35560 | 2702960 | 6 | 4.8756e-02 | true |
| 200 | LeastSquaresOptim (LM) | 2.729697705e8 | 76984 | 5713280 | 13 | 4.8756e-02 | true |
| 200 | Optim (Newton) | 3.6398545e6 | 42107 | 10593392 | 6 | 4.8756e-02 | true |
| 200 | JSOSolvers (trunk) | 8.32820835e7 | 1205925 | 87887680 | 203 | 4.8756e-02 | true |
| 200 | JSOSolvers (tron) | 5.69000835e7 | 650360 | 47480032 | 109 | 4.8756e-02 | true |
| 200 | Ipopt | 2.2013745e6 | 281 | 37552 | 6 | 4.8756e-02 | true |
| 200 | MadNLP | 1.55925e6 | 599 | 642176 | 6 | 4.8756e-02 | true |
| 200 | NonlinearSolve (LM) | 5.344619083e9 | 1724361 | 362314208 | 132 | 4.8756e-02 | true |
| 200 | NonlinearSolve (TrustRegion) | 1.946550125e9 | 408868 | 27972240 | 39 | 4.8756e-02 | true |
| 200 | CaNNOLeS | 3.569771e6 | 41606 | 4236080 | 6 | 4.8756e-02 | true |
| 400 | SecondOrderOptimization (Dogleg) | 1.019062e6 | 278 | 1371744 | 5 | 5.3112e-02 | true |
| 400 | SecondOrderOptimization (LM) | 949583.5 | 278 | 1470160 | 5 | 5.3112e-02 | true |
| 400 | LeastSquaresOptim (Dogleg) | 2.1478813e7 | 118632 | 8847984 | 10 | 5.3112e-02 | true |
| 400 | LeastSquaresOptim (LM) | 3.9212125e7 | 201642 | 14916704 | 17 | 5.3112e-02 | true |
| 400 | Optim (Newton) | 7.2303335e6 | 83687 | 21076032 | 6 | 5.3112e-02 | true |
| 400 | JSOSolvers (trunk) | 3.75071875e8 | 5202670 | 379183024 | 438 | 5.3112e-02 | true |
| 400 | JSOSolvers (tron) | 1.74614584e8 | 2097949 | 153095904 | 170 | 5.3112e-02 | false |
| 400 | Ipopt | 3.80625e6 | 281 | 63152 | 6 | 5.3112e-02 | true |
| 400 | MadNLP | 2.896792e6 | 599 | 1289408 | 6 | 5.3112e-02 | true |
| 400 | NonlinearSolve (LM) | 2.763708291e9 | 638380 | 596656416 | 135 | 5.3112e-02 | true |
| 400 | NonlinearSolve (TrustRegion) | 4.3116917e7 | 125795 | 83667776 | 40 | 5.3112e-02 | true |
| 400 | CaNNOLeS | 6.788146e6 | 83186 | 8450544 | 6 | 5.3112e-02 | true |
| 800 | SecondOrderOptimization (Dogleg) | 1.963167e6 | 281 | 2734480 | 5 | 5.4356e-02 | true |
| 800 | SecondOrderOptimization (LM) | 1.860604e6 | 281 | 2931200 | 5 | 5.4356e-02 | true |
| 800 | LeastSquaresOptim (Dogleg) | 4.3574e7 | 192902 | 14233360 | 8 | 5.4356e-02 | true |
| 800 | LeastSquaresOptim (LM) | 9.2624958e7 | 409860 | 29894304 | 17 | 5.4356e-02 | true |
| 800 | Optim (Newton) | 1.2899e7 | 145244 | 35368960 | 5 | 5.4356e-02 | true |
| 800 | JSOSolvers (trunk) | 8.89723291e8 | 12097799 | 871405984 | 501 | 5.4356e-02 | false |
| 800 | JSOSolvers (tron) | 4.86551583e8 | 5832280 | 420459216 | 234 | 5.4356e-02 | false |
| 800 | Ipopt | 5.818854e6 | 251 | 113104 | 5 | 5.4356e-02 | true |
| 800 | MadNLP | 4.862125e6 | 599 | 2526816 | 5 | 5.4356e-02 | true |
| 800 | NonlinearSolve (LM) | 1.1145967917e10 | 1181504 | 192098160 | 132 | 5.4356e-02 | true |
| 800 | NonlinearSolve (TrustRegion) | 7.94715415e7 | 199719 | 157444608 | 38 | 5.4356e-02 | true |
| 800 | CaNNOLeS | 1.2257333e7 | 144823 | 15177376 | 5 | 5.4356e-02 | true |
| 1200 | SecondOrderOptimization (Dogleg) | 3.082042e6 | 284 | 4049872 | 5 | 5.4395e-02 | true |
| 1200 | SecondOrderOptimization (LM) | 2.913625e6 | 284 | 4328512 | 5 | 5.4395e-02 | true |
| 1200 | LeastSquaresOptim (Dogleg) | 8.1153e7 | 327887 | 23975680 | 9 | 5.4395e-02 | true |
| 1200 | LeastSquaresOptim (LM) | 1.594827705e8 | 655725 | 47482416 | 18 | 5.4395e-02 | true |
| 1200 | Optim (Newton) | 2.6336167e7 | 219144 | 52760256 | 5 | 5.4395e-02 | true |
| 1200 | JSOSolvers (trunk) | 1.267090459e9 | 18282459 | 1309816544 | 501 | 5.4395e-02 | false |
| 1200 | JSOSolvers (tron) | 7.45147542e8 | 9105072 | 652858864 | 242 | 5.4395e-02 | false |
| 1200 | Ipopt | 8.681042e6 | 251 | 174544 | 5 | 5.4395e-02 | true |
| 1200 | MadNLP | 7.3474795e6 | 599 | 3587072 | 5 | 5.4395e-02 | true |
| 1200 | NonlinearSolve (LM) | 2.5242966833e10 | 1785184 | 364082192 | 132 | 5.4395e-02 | true |
| 1200 | NonlinearSolve (TrustRegion) | 1.15311291e8 | 334880 | 244276560 | 39 | 5.4395e-02 | true |
| 1200 | CaNNOLeS | 1.82776045e7 | 218743 | 22569632 | 5 | 5.4395e-02 | true |
| 2000 | SecondOrderOptimization (Dogleg) | 5.00775e6 | 284 | 6760848 | 5 | 5.4397e-02 | true |
| 2000 | SecondOrderOptimization (LM) | 4.8020005e6 | 284 | 7236096 | 5 | 5.4397e-02 | true |
| 2000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 2000 | LeastSquaresOptim (LM) | 2.869948335e8 | 1221377 | 87876400 | 20 | 5.4397e-02 | true |
| 2000 | Optim (Newton) | 3.8465125e7 | 366984 | 90642112 | 5 | 5.4397e-02 | true |
| 2000 | JSOSolvers (trunk) | 2.116614625e9 | 30651759 | 2186645536 | 501 | 5.4397e-02 | false |
| 2000 | JSOSolvers (tron) | 1.461277e9 | 17951668 | 1281439472 | 287 | 5.4397e-02 | false |
| 2000 | Ipopt | 1.40154585e7 | 251 | 256464 | 5 | 5.4397e-02 | true |
| 2000 | MadNLP | 1.1218104e7 | 599 | 5662528 | 5 | 5.4397e-02 | true |
| 2000 | NonlinearSolve (LM) | 3.0209627625e10 | 1488482 | 1450741792 | 67 | 5.4397e-02 | false |
| 2000 | NonlinearSolve (TrustRegion) | 1.92027292e8 | 495415 | 386584832 | 38 | 5.4397e-02 | true |
| 2000 | CaNNOLeS | 3.120775e7 | 366583 | 37649056 | 5 | 5.4397e-02 | true |
| 3500 | SecondOrderOptimization (Dogleg) | 8.976375e6 | 289 | 11770192 | 5 | 5.4397e-02 | true |
| 3500 | SecondOrderOptimization (LM) | 8.359291e6 | 289 | 12589504 | 5 | 5.4397e-02 | true |
| 3500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 3500 | LeastSquaresOptim (LM) | 5.36083396e8 | 2252642 | 161530240 | 21 | 5.4397e-02 | true |
| 3500 | Optim (Newton) | 6.75131455e7 | 644207 | 153689392 | 5 | 5.4397e-02 | true |
| 3500 | JSOSolvers (trunk) | 3.818771875e9 | 53844103 | 3830729120 | 501 | 5.4397e-02 | false |
| 3500 | JSOSolvers (tron) | 2.398813458e9 | 29174770 | 2077185328 | 266 | 5.4397e-02 | false |
| 3500 | Ipopt | 2.90858335e7 | 251 | 502224 | 5 | 5.4397e-02 | true |
| 3500 | MadNLP | 1.9772083e7 | 599 | 10115680 | 5 | 5.4397e-02 | true |
| 3500 | NonlinearSolve (LM) | 3.0409569042e10 | 1938622 | 902350720 | 22 | 5.4397e-02 | false |
| 3500 | NonlinearSolve (TrustRegion) | 3.14168667e8 | 865175 | 742763808 | 39 | 5.4397e-02 | true |
| 3500 | CaNNOLeS | 5.6213125e7 | 643783 | 66514848 | 5 | 5.4397e-02 | true |
| 5000 | SecondOrderOptimization (Dogleg) | 1.28005e7 | 289 | 16734208 | 5 | 5.4397e-02 | true |
| 5000 | SecondOrderOptimization (LM) | 1.2102646e7 | 289 | 17897584 | 5 | 5.4397e-02 | true |
| 5000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | LeastSquaresOptim (LM) | 7.61114e8 | 3222842 | 230732320 | 21 | 5.4397e-02 | true |
| 5000 | Optim (Newton) | 9.2722708e7 | 921396 | 223785344 | 5 | 5.4397e-02 | true |
| 5000 | JSOSolvers (trunk) | 5.6130685e9 | 77036507 | 5474731744 | 501 | 5.4397e-02 | false |
| 5000 | JSOSolvers (tron) | 4.184599334e9 | 51255628 | 3644413488 | 327 | 5.4397e-02 | false |
| 5000 | Ipopt | 4.1683958e7 | 251 | 666064 | 5 | 5.4397e-02 | true |
| 5000 | MadNLP | 2.7769916e7 | 599 | 14086656 | 5 | 5.4397e-02 | true |
| 5000 | NonlinearSolve (LM) | 3.0812599708e10 | 1692331 | 673639664 | 11 | 5.5067e-02 | false |
| 5000 | NonlinearSolve (TrustRegion) | 5.203005e8 | 1234609 | 948019360 | 38 | 5.4397e-02 | true |
| 5000 | CaNNOLeS | 8.1191833e7 | 920983 | 93430944 | 5 | 5.4397e-02 | true |
| 7500 | SecondOrderOptimization (Dogleg) | 1.98620625e7 | 289 | 24872272 | 5 | 5.4397e-02 | true |
| 7500 | SecondOrderOptimization (LM) | 1.83692295e7 | 289 | 26609088 | 5 | 5.4397e-02 | true |
| 7500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 7500 | LeastSquaresOptim (LM) | 1.08263475e9 | 4839863 | 345969808 | 21 | 5.4397e-02 | true |
| 7500 | Optim (Newton) | 1.806475205e8 | 1383400 | 328250560 | 5 | 5.4397e-02 | true |
| 7500 | JSOSolvers (trunk) | 7.824154334e9 | 115690503 | 8214577568 | 501 | 5.4397e-02 | false |
| 7500 | JSOSolvers (tron) | 5.792461667e9 | 75821334 | 5386276048 | 322 | 5.4397e-02 | false |
| 7500 | Ipopt | 6.2819459e7 | 251 | 911824 | 5 | 5.4397e-02 | true |
| 7500 | MadNLP | 4.252725e7 | 608 | 20748208 | 5 | 5.4397e-02 | true |
| 7500 | NonlinearSolve (LM) | 3.138132175e10 | 1154573 | 499679568 | 5 | 1.0465e+01 | false |
| 7500 | NonlinearSolve (TrustRegion) | 7.282502705e8 | 1620144 | 1514671344 | 38 | 5.4397e-02 | true |
| 7500 | CaNNOLeS | 1.238206665e8 | 1382983 | 144992160 | 5 | 5.4397e-02 | true |
| 10000 | SecondOrderOptimization (Dogleg) | 3.0937083e7 | 357 | 45999952 | 5 | 5.4397e-02 | true |
| 10000 | SecondOrderOptimization (LM) | 2.93922705e7 | 357 | 47163328 | 5 | 5.4397e-02 | true |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | Optim (Newton) | 2.040899795e8 | 1845400 | 443578304 | 5 | 5.4397e-02 | true |
| 10000 | JSOSolvers (trunk) | 1.09739525e10 | 154344503 | 10954603680 | 501 | 5.4397e-02 | false |
| 10000 | JSOSolvers (tron) | 7.443272709e9 | 95312613 | 6768488672 | 300 | 5.4397e-02 | false |
| 10000 | Ipopt | 8.5226229e7 | 251 | 1239504 | 5 | 5.4397e-02 | true |
| 10000 | MadNLP | 5.6969208e7 | 608 | 27524016 | 5 | 5.4397e-02 | true |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | CaNNOLeS | 2.07286792e8 | 1844983 | 188443296 | 5 | 5.4397e-02 | true |
