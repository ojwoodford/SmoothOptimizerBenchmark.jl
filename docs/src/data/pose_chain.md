# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: NLLSModel (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T11:25:03
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 8d8728c

---

## Model Evaluation Scaling

This problem uses `NLLSModel (Sparse)` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on standard target model: `NLLSModel (Sparse)` (`NLLSModel + SecondOrderOptimization` entries run natively on `NLLSModel` from a cold start).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 50 | NLLSModel + SecondOrderOptimization (Dogleg) | 127146.0 | 192 | 159136 | 6 | 3.3090e-02 | true |
| 50 | NLLSModel + SecondOrderOptimization (LM) | 117271.0 | 193 | 170288 | 5 | 3.3090e-02 | true |
| 50 | LeastSquaresOptim (Dogleg) | 3.396833e6 | 7144 | 1242800 | 5 | 3.3090e-02 | true |
| 50 | LeastSquaresOptim (LM) | 1.1249646e7 | 12837 | 2249584 | 9 | 3.3090e-02 | true |
| 50 | Optim (Newton) | 1.557083e6 | 8523 | 1001360 | 5 | 3.3090e-02 | true |
| 50 | JSOSolvers (trunk) | 4.207937e6 | 23960 | 1777760 | 16 | 3.3090e-02 | true |
| 50 | JSOSolvers (tron) | 5.7153335e6 | 31055 | 2306896 | 21 | 3.3090e-02 | true |
| 50 | Ipopt | 953520.5 | 246 | 16784 | 5 | 3.3090e-02 | true |
| 50 | MadNLP | 534500.0 | 568 | 192016 | 5 | 3.3090e-02 | true |
| 50 | NonlinearSolve (LM) | 1.602555625e8 | 65756 | 31024704 | 122 | 3.3090e-02 | true |
| 50 | NonlinearSolve (TrustRegion) | 1.3076291e7 | 13094 | 5541808 | 39 | 3.3090e-02 | true |
| 50 | CaNNOLeS | 2.282575e7 | 8643 | 4868864 | 5 | 3.3090e-02 | true |
| 100 | NLLSModel + SecondOrderOptimization (Dogleg) | 313583.0 | 217 | 322656 | 7 | 4.2617e-02 | true |
| 100 | NLLSModel + SecondOrderOptimization (LM) | 221854.0 | 217 | 344752 | 4 | 4.2617e-02 | true |
| 100 | LeastSquaresOptim (Dogleg) | 1.945725e7 | 11455 | 2210752 | 4 | 4.2617e-02 | true |
| 100 | LeastSquaresOptim (LM) | 9.0784e7 | 28585 | 5032144 | 10 | 4.2617e-02 | true |
| 100 | Optim (Newton) | 7.512812e6 | 17111 | 2727856 | 5 | 4.2617e-02 | true |
| 100 | JSOSolvers (trunk) | 3.8788792e7 | 190087 | 14036608 | 66 | 4.2617e-02 | true |
| 100 | JSOSolvers (tron) | 3.7909708e7 | 113588 | 8424336 | 39 | 4.2617e-02 | true |
| 100 | Ipopt | 1.2959585e6 | 251 | 23504 | 5 | 4.2617e-02 | true |
| 100 | MadNLP | 842166.5 | 587 | 342368 | 5 | 4.2617e-02 | true |
| 100 | NonlinearSolve (LM) | 9.249319585e8 | 133247 | 65758832 | 124 | 4.2617e-02 | true |
| 100 | NonlinearSolve (TrustRegion) | 6.29081875e7 | 23218 | 11834464 | 38 | 4.2617e-02 | true |
| 100 | CaNNOLeS | 1.12450125e8 | 17235 | 16924672 | 5 | 4.2617e-02 | true |
| 200 | NLLSModel + SecondOrderOptimization (Dogleg) | 622354.0 | 226 | 635296 | 7 | 4.8756e-02 | true |
| 200 | NLLSModel + SecondOrderOptimization (LM) | 511729.5 | 226 | 679408 | 5 | 4.8756e-02 | true |
| 200 | LeastSquaresOptim (Dogleg) | 6.882125e6 | 35582 | 2703520 | 6 | 4.8756e-02 | true |
| 200 | LeastSquaresOptim (LM) | 1.3772479e7 | 77034 | 5714560 | 13 | 4.8756e-02 | true |
| 200 | Optim (Newton) | 4.154708e6 | 42133 | 10594224 | 6 | 4.8756e-02 | true |
| 200 | JSOSolvers (trunk) | 9.7003666e7 | 1206739 | 87913728 | 203 | 4.8756e-02 | true |
| 200 | JSOSolvers (tron) | 5.9607292e7 | 650798 | 47494048 | 109 | 4.8756e-02 | true |
| 200 | Ipopt | 2.4203545e6 | 281 | 37552 | 6 | 4.8756e-02 | true |
| 200 | MadNLP | 1.730937e6 | 599 | 642176 | 6 | 4.8756e-02 | true |
| 200 | NonlinearSolve (LM) | 7.7971435e9 | 6056079 | 610114816 | 132 | 4.8756e-02 | true |
| 200 | NonlinearSolve (TrustRegion) | 2.136491458e9 | 616837 | 39769216 | 39 | 4.8756e-02 | true |
| 200 | CaNNOLeS | 3.9665415e6 | 41632 | 4236912 | 6 | 4.8756e-02 | true |
| 400 | NLLSModel + SecondOrderOptimization (Dogleg) | 1.4196665e6 | 248 | 1255344 | 8 | 5.3112e-02 | true |
| 400 | NLLSModel + SecondOrderOptimization (LM) | 976896.0 | 248 | 1343488 | 5 | 5.3112e-02 | true |
| 400 | LeastSquaresOptim (Dogleg) | 2.2987834e7 | 118670 | 8849056 | 10 | 5.3112e-02 | true |
| 400 | LeastSquaresOptim (LM) | 4.2949917e7 | 201708 | 14918496 | 17 | 5.3112e-02 | true |
| 400 | Optim (Newton) | 8.3847915e6 | 83713 | 21076864 | 6 | 5.3112e-02 | true |
| 400 | JSOSolvers (trunk) | 4.05512125e8 | 5204424 | 379239152 | 438 | 5.3112e-02 | true |
| 400 | JSOSolvers (tron) | 2.41980917e8 | 2176839 | 157477664 | 170 | 5.3112e-02 | false |
| 400 | Ipopt | 4.0207915e6 | 281 | 63152 | 6 | 5.3112e-02 | true |
| 400 | MadNLP | 3.058208e6 | 599 | 1289408 | 6 | 5.3112e-02 | true |
| 400 | NonlinearSolve (LM) | 2.778264792e9 | 638884 | 596672032 | 135 | 5.3112e-02 | true |
| 400 | NonlinearSolve (TrustRegion) | 3.9231292e7 | 125805 | 83668928 | 40 | 5.3112e-02 | true |
| 400 | CaNNOLeS | 8.055354e6 | 83212 | 8451376 | 6 | 5.3112e-02 | true |
| 800 | NLLSModel + SecondOrderOptimization (Dogleg) | 2.586396e6 | 251 | 2502880 | 7 | 5.4356e-02 | true |
| 800 | NLLSModel + SecondOrderOptimization (LM) | 2.061625e6 | 251 | 2679088 | 5 | 5.4356e-02 | true |
| 800 | LeastSquaresOptim (Dogleg) | 4.81474785e7 | 192932 | 14234176 | 8 | 5.4356e-02 | true |
| 800 | LeastSquaresOptim (LM) | 1.040781245e8 | 409926 | 29896096 | 17 | 5.4356e-02 | true |
| 800 | Optim (Newton) | 1.70426045e7 | 145274 | 35369792 | 5 | 5.4356e-02 | true |
| 800 | JSOSolvers (trunk) | 1.006537e9 | 12099785 | 871469856 | 501 | 5.4356e-02 | false |
| 800 | JSOSolvers (tron) | 5.18577458e8 | 5833232 | 420489680 | 234 | 5.4356e-02 | false |
| 800 | Ipopt | 6.2370625e6 | 251 | 113104 | 5 | 5.4356e-02 | true |
| 800 | MadNLP | 4.957854e6 | 599 | 2526816 | 5 | 5.4356e-02 | true |
| 800 | NonlinearSolve (LM) | 1.1476214e10 | 1181966 | 191228208 | 132 | 5.4356e-02 | true |
| 800 | NonlinearSolve (TrustRegion) | 7.1325125e7 | 199797 | 157446816 | 38 | 5.4356e-02 | true |
| 800 | CaNNOLeS | 1.38664585e7 | 144845 | 15178080 | 5 | 5.4356e-02 | true |
| 1200 | NLLSModel + SecondOrderOptimization (Dogleg) | 3.7713125e6 | 254 | 3714848 | 7 | 5.4395e-02 | true |
| 1200 | NLLSModel + SecondOrderOptimization (LM) | 3.0148125e6 | 254 | 3960688 | 5 | 5.4395e-02 | true |
| 1200 | LeastSquaresOptim (Dogleg) | 8.9133583e7 | 327921 | 23976624 | 9 | 5.4395e-02 | true |
| 1200 | LeastSquaresOptim (LM) | 1.73896688e8 | 655795 | 47484336 | 18 | 5.4395e-02 | true |
| 1200 | Optim (Newton) | 2.3336416e7 | 219166 | 52760960 | 5 | 5.4395e-02 | true |
| 1200 | JSOSolvers (trunk) | 1.3868675e9 | 18284445 | 1309880416 | 501 | 5.4395e-02 | false |
| 1200 | JSOSolvers (tron) | 8.02997916e8 | 9106056 | 652890352 | 242 | 5.4395e-02 | false |
| 1200 | Ipopt | 8.302521e6 | 251 | 174544 | 5 | 5.4395e-02 | true |
| 1200 | MadNLP | 6.9816665e6 | 599 | 3587072 | 5 | 5.4395e-02 | true |
| 1200 | NonlinearSolve (LM) | 2.56649385e10 | 1785646 | 364096976 | 132 | 5.4395e-02 | true |
| 1200 | NonlinearSolve (TrustRegion) | 1.111735415e8 | 334930 | 244278288 | 39 | 5.4395e-02 | true |
| 1200 | CaNNOLeS | 2.1019709e7 | 218765 | 22570336 | 5 | 5.4395e-02 | true |
| 2000 | NLLSModel + SecondOrderOptimization (Dogleg) | 6.4777295e6 | 254 | 6202592 | 7 | 5.4397e-02 | true |
| 2000 | NLLSModel + SecondOrderOptimization (LM) | 5.0823125e6 | 254 | 6628656 | 5 | 5.4397e-02 | true |
| 2000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 2000 | LeastSquaresOptim (LM) | 2.97940667e8 | 1221455 | 87878576 | 20 | 5.4397e-02 | true |
| 2000 | Optim (Newton) | 3.8614771e7 | 367018 | 87546432 | 5 | 5.4397e-02 | true |
| 2000 | JSOSolvers (trunk) | 2.510578666e9 | 30653715 | 2186708960 | 501 | 5.4397e-02 | false |
| 2000 | JSOSolvers (tron) | 1.621385667e9 | 17952830 | 1281476656 | 287 | 5.4397e-02 | false |
| 2000 | Ipopt | 1.4204687e7 | 251 | 256464 | 5 | 5.4397e-02 | true |
| 2000 | MadNLP | 1.1688542e7 | 599 | 5662528 | 5 | 5.4397e-02 | true |
| 2000 | NonlinearSolve (LM) | 3.018197e10 | 1488374 | 1430709152 | 66 | 5.4397e-02 | false |
| 2000 | NonlinearSolve (TrustRegion) | 2.10607104e8 | 495431 | 386586016 | 38 | 5.4397e-02 | true |
| 2000 | CaNNOLeS | 3.54543125e7 | 366605 | 37649760 | 5 | 5.4397e-02 | true |
| 3500 | NLLSModel + SecondOrderOptimization (Dogleg) | 1.11465625e7 | 259 | 10781856 | 7 | 5.4397e-02 | true |
| 3500 | NLLSModel + SecondOrderOptimization (LM) | 8.814e6 | 259 | 11502832 | 5 | 5.4397e-02 | true |
| 3500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 3500 | LeastSquaresOptim (LM) | 5.42321854e8 | 2252724 | 161532544 | 21 | 5.4397e-02 | true |
| 3500 | Optim (Newton) | 6.26868335e7 | 644214 | 153689856 | 5 | 5.4397e-02 | true |
| 3500 | JSOSolvers (trunk) | 4.138842084e9 | 53846117 | 3830793440 | 501 | 5.4397e-02 | false |
| 3500 | JSOSolvers (tron) | 2.540102625e9 | 29175846 | 2077219760 | 266 | 5.4397e-02 | false |
| 3500 | Ipopt | 2.78938125e7 | 251 | 502224 | 5 | 5.4397e-02 | true |
| 3500 | MadNLP | 1.95545e7 | 599 | 10115680 | 5 | 5.4397e-02 | true |
| 3500 | NonlinearSolve (LM) | 3.0665325792e10 | 1938738 | 902354432 | 22 | 5.4397e-02 | false |
| 3500 | NonlinearSolve (TrustRegion) | 3.77219625e8 | 865231 | 682062880 | 39 | 5.4397e-02 | true |
| 3500 | CaNNOLeS | 6.4142896e7 | 643805 | 65352288 | 5 | 5.4397e-02 | true |
| 5000 | NLLSModel + SecondOrderOptimization (Dogleg) | 1.6162729e7 | 259 | 15356752 | 7 | 5.4397e-02 | true |
| 5000 | NLLSModel + SecondOrderOptimization (LM) | 1.2708646e7 | 259 | 16389024 | 5 | 5.4397e-02 | true |
| 5000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | LeastSquaresOptim (LM) | 7.884076875e8 | 3222924 | 230734624 | 21 | 5.4397e-02 | true |
| 5000 | Optim (Newton) | 9.3013083e7 | 921427 | 218854608 | 5 | 5.4397e-02 | true |
| 5000 | JSOSolvers (trunk) | 6.26842775e9 | 77038514 | 5474795984 | 501 | 5.4397e-02 | false |
| 5000 | JSOSolvers (tron) | 4.575649375e9 | 51256950 | 3644455792 | 327 | 5.4397e-02 | false |
| 5000 | Ipopt | 4.151425e7 | 251 | 666064 | 5 | 5.4397e-02 | true |
| 5000 | MadNLP | 2.7988416e7 | 599 | 14086656 | 5 | 5.4397e-02 | true |
| 5000 | NonlinearSolve (LM) | 3.1197168209e10 | 1692389 | 679867568 | 11 | 5.5067e-02 | false |
| 5000 | NonlinearSolve (TrustRegion) | 5.00158875e8 | 1234676 | 948021360 | 38 | 5.4397e-02 | true |
| 5000 | CaNNOLeS | 9.4193375e7 | 921005 | 93431648 | 5 | 5.4397e-02 | true |
| 7500 | NLLSModel + SecondOrderOptimization (Dogleg) | 2.4775875e7 | 259 | 22839456 | 7 | 5.4397e-02 | true |
| 7500 | NLLSModel + SecondOrderOptimization (LM) | 1.9386375e7 | 259 | 24396016 | 5 | 5.4397e-02 | true |
| 7500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 7500 | LeastSquaresOptim (LM) | 1.186528542e9 | 4839945 | 345972112 | 21 | 5.4397e-02 | true |
| 7500 | Optim (Newton) | 2.096725e8 | 1383423 | 326694800 | 5 | 5.4397e-02 | true |
| 7500 | JSOSolvers (trunk) | 9.139187542e9 | 115692512 | 8214641808 | 501 | 5.4397e-02 | false |
| 7500 | JSOSolvers (tron) | 6.86260975e9 | 75822636 | 5386317712 | 322 | 5.4397e-02 | false |
| 7500 | Ipopt | 6.3551521e7 | 251 | 911824 | 5 | 5.4397e-02 | true |
| 7500 | MadNLP | 4.3594834e7 | 608 | 20748208 | 5 | 5.4397e-02 | true |
| 7500 | NonlinearSolve (LM) | 3.1978339708e10 | 1154606 | 514917680 | 5 | 1.0465e+01 | false |
| 7500 | NonlinearSolve (TrustRegion) | 7.657639375e8 | 1620206 | 1387041872 | 38 | 5.4397e-02 | true |
| 7500 | CaNNOLeS | 1.366172295e8 | 1383007 | 140667520 | 5 | 5.4397e-02 | true |
| 10000 | NLLSModel + SecondOrderOptimization (Dogleg) | 4.32242915e7 | 323 | 42122352 | 7 | 5.4397e-02 | true |
| 10000 | NLLSModel + SecondOrderOptimization (LM) | 3.3076292e7 | 317 | 44867936 | 5 | 5.4397e-02 | true |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | Optim (Newton) | 2.581319995e8 | 1845418 | 444660288 | 5 | 5.4397e-02 | true |
| 10000 | JSOSolvers (trunk) | 1.2291005542e10 | 154346515 | 10954668000 | 501 | 5.4397e-02 | false |
| 10000 | JSOSolvers (tron) | 8.2639605e9 | 95313833 | 6768527712 | 300 | 5.4397e-02 | false |
| 10000 | Ipopt | 8.7445396e7 | 251 | 1239504 | 5 | 5.4397e-02 | true |
| 10000 | MadNLP | 5.78105e7 | 608 | 27524016 | 5 | 5.4397e-02 | true |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | CaNNOLeS | 1.88184458e8 | 1845005 | 189918560 | 5 | 5.4397e-02 | true |
