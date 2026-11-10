# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: NLLSModel (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-10T11:16:59
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 4aac5c9

---

## Model Evaluation Scaling

This problem uses `NLLSModel (Sparse)` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 50 | SecondOrderOptimization (Dogleg) | 130166.5 | 221 | 174640 | 5 | 3.3090e-02 | true |
| 50 | SecondOrderOptimization (LM) | 130083.5 | 221 | 187040 | 5 | 3.3090e-02 | true |
| 50 | LeastSquaresOptim (Dogleg) | 3.409875e6 | 7126 | 1242336 | 5 | 3.3090e-02 | true |
| 50 | LeastSquaresOptim (LM) | 1.1500625e7 | 12803 | 2248752 | 9 | 3.3090e-02 | true |
| 50 | Optim (Newton) | 1.8244165e6 | 8501 | 1000656 | 5 | 3.3090e-02 | true |
| 50 | JSOSolvers (trunk) | 5.100271e6 | 23894 | 1775648 | 16 | 3.3090e-02 | true |
| 50 | JSOSolvers (tron) | 6.834146e6 | 30969 | 2304144 | 21 | 3.3090e-02 | true |
| 50 | Ipopt | 890854.0 | 246 | 16784 | 5 | 3.3090e-02 | true |
| 50 | MadNLP | 541958.0 | 568 | 192016 | 5 | 3.3090e-02 | true |
| 50 | NonlinearSolve (LM) | 1.733528335e8 | 65330 | 31011072 | 122 | 3.3090e-02 | true |
| 50 | NonlinearSolve (TrustRegion) | 1.34232915e7 | 13030 | 5539760 | 39 | 3.3090e-02 | true |
| 50 | CaNNOLeS | 2.32742085e7 | 8621 | 4868160 | 5 | 3.3090e-02 | true |
| 100 | SecondOrderOptimization (Dogleg) | 227458.0 | 247 | 352672 | 4 | 4.2617e-02 | true |
| 100 | SecondOrderOptimization (LM) | 210292.0 | 248 | 377376 | 4 | 4.2617e-02 | true |
| 100 | LeastSquaresOptim (Dogleg) | 1.9993896e7 | 11441 | 2210416 | 4 | 4.2617e-02 | true |
| 100 | LeastSquaresOptim (LM) | 9.1220375e7 | 28547 | 5031184 | 10 | 4.2617e-02 | true |
| 100 | Optim (Newton) | 7.922292e6 | 17089 | 2727152 | 5 | 4.2617e-02 | true |
| 100 | JSOSolvers (trunk) | 4.5539333e7 | 189821 | 14028096 | 66 | 4.2617e-02 | true |
| 100 | JSOSolvers (tron) | 3.7864854e7 | 113430 | 8419280 | 39 | 4.2617e-02 | true |
| 100 | Ipopt | 1.2172085e6 | 251 | 23504 | 5 | 4.2617e-02 | true |
| 100 | MadNLP | 825958.5 | 587 | 342368 | 5 | 4.2617e-02 | true |
| 100 | NonlinearSolve (LM) | 8.67281542e8 | 132813 | 65744944 | 124 | 4.2617e-02 | true |
| 100 | NonlinearSolve (TrustRegion) | 6.3778938e7 | 23158 | 11832544 | 38 | 4.2617e-02 | true |
| 100 | CaNNOLeS | 1.11243417e8 | 17213 | 16923968 | 5 | 4.2617e-02 | true |
| 200 | SecondOrderOptimization (Dogleg) | 529604.5 | 257 | 694288 | 5 | 4.8756e-02 | true |
| 200 | SecondOrderOptimization (LM) | 493229.0 | 257 | 743552 | 5 | 4.8756e-02 | true |
| 200 | LeastSquaresOptim (Dogleg) | 3.704338955e8 | 35560 | 2702960 | 6 | 4.8756e-02 | true |
| 200 | LeastSquaresOptim (LM) | 2.726014585e8 | 76984 | 5713280 | 13 | 4.8756e-02 | true |
| 200 | Optim (Newton) | 5.415479e6 | 42190 | 10594720 | 6 | 4.8756e-02 | true |
| 200 | JSOSolvers (trunk) | 1.34351792e8 | 1205925 | 87887680 | 203 | 4.8756e-02 | true |
| 200 | JSOSolvers (tron) | 7.697625e7 | 650360 | 47480032 | 109 | 4.8756e-02 | true |
| 200 | Ipopt | 2.3232295e6 | 281 | 37552 | 6 | 4.8756e-02 | true |
| 200 | MadNLP | 1.538375e6 | 599 | 642176 | 6 | 4.8756e-02 | true |
| 200 | NonlinearSolve (LM) | 5.638038417e9 | 1724305 | 362306064 | 132 | 4.8756e-02 | true |
| 200 | NonlinearSolve (TrustRegion) | 1.981854333e9 | 408874 | 27973008 | 39 | 4.8756e-02 | true |
| 200 | CaNNOLeS | 5.304542e6 | 41606 | 4236080 | 6 | 4.8756e-02 | true |
| 400 | SecondOrderOptimization (Dogleg) | 981979.0 | 278 | 1371744 | 5 | 5.3112e-02 | true |
| 400 | SecondOrderOptimization (LM) | 954770.5 | 278 | 1470160 | 5 | 5.3112e-02 | true |
| 400 | LeastSquaresOptim (Dogleg) | 2.7037875e7 | 118632 | 8847984 | 10 | 5.3112e-02 | true |
| 400 | LeastSquaresOptim (LM) | 4.7383583e7 | 201642 | 14916704 | 17 | 5.3112e-02 | true |
| 400 | Optim (Newton) | 1.11714165e7 | 83819 | 21078144 | 6 | 5.3112e-02 | true |
| 400 | JSOSolvers (trunk) | 5.850585415e8 | 5202670 | 379183024 | 438 | 5.3112e-02 | true |
| 400 | JSOSolvers (tron) | 2.62276458e8 | 2097949 | 153095904 | 170 | 5.3112e-02 | false |
| 400 | Ipopt | 3.8076245e6 | 281 | 63152 | 6 | 5.3112e-02 | true |
| 400 | MadNLP | 2.977e6 | 599 | 1289408 | 6 | 5.3112e-02 | true |
| 400 | NonlinearSolve (LM) | 2.710239375e9 | 638360 | 596656096 | 135 | 5.3112e-02 | true |
| 400 | NonlinearSolve (TrustRegion) | 4.8716958e7 | 125891 | 83669312 | 40 | 5.3112e-02 | true |
| 400 | CaNNOLeS | 1.07305835e7 | 83186 | 8450544 | 6 | 5.3112e-02 | true |
| 800 | SecondOrderOptimization (Dogleg) | 2.0911045e6 | 281 | 2734480 | 5 | 5.4356e-02 | true |
| 800 | SecondOrderOptimization (LM) | 1.9841045e6 | 281 | 2931200 | 5 | 5.4356e-02 | true |
| 800 | LeastSquaresOptim (Dogleg) | 5.29199585e7 | 192902 | 14233360 | 8 | 5.4356e-02 | true |
| 800 | LeastSquaresOptim (LM) | 1.18540166e8 | 409860 | 29894304 | 17 | 5.4356e-02 | true |
| 800 | Optim (Newton) | 2.39201455e7 | 145224 | 35368640 | 5 | 5.4356e-02 | true |
| 800 | JSOSolvers (trunk) | 1.378094708e9 | 12097803 | 871406048 | 501 | 5.4356e-02 | false |
| 800 | JSOSolvers (tron) | 7.39371709e8 | 5832280 | 420459216 | 234 | 5.4356e-02 | false |
| 800 | Ipopt | 5.86575e6 | 251 | 113104 | 5 | 5.4356e-02 | true |
| 800 | MadNLP | 4.799562e6 | 599 | 2526816 | 5 | 5.4356e-02 | true |
| 800 | NonlinearSolve (LM) | 1.1394195959e10 | 1181504 | 191213424 | 132 | 5.4356e-02 | true |
| 800 | NonlinearSolve (TrustRegion) | 8.1415958e7 | 199719 | 157444608 | 38 | 5.4356e-02 | true |
| 800 | CaNNOLeS | 1.8700166e7 | 144823 | 15177376 | 5 | 5.4356e-02 | true |
| 1200 | SecondOrderOptimization (Dogleg) | 3.0242715e6 | 284 | 4049872 | 5 | 5.4395e-02 | true |
| 1200 | SecondOrderOptimization (LM) | 2.89625e6 | 284 | 4328512 | 5 | 5.4395e-02 | true |
| 1200 | LeastSquaresOptim (Dogleg) | 9.7098604e7 | 327887 | 23975680 | 9 | 5.4395e-02 | true |
| 1200 | LeastSquaresOptim (LM) | 2.08139e8 | 655725 | 47482416 | 18 | 5.4395e-02 | true |
| 1200 | Optim (Newton) | 3.3132333e7 | 219144 | 52760256 | 5 | 5.4395e-02 | true |
| 1200 | JSOSolvers (trunk) | 2.04916525e9 | 18282443 | 1309816288 | 501 | 5.4395e-02 | false |
| 1200 | JSOSolvers (tron) | 1.161702208e9 | 9105072 | 652858864 | 242 | 5.4395e-02 | false |
| 1200 | Ipopt | 8.305979e6 | 251 | 174544 | 5 | 5.4395e-02 | true |
| 1200 | MadNLP | 7.3539165e6 | 599 | 3587072 | 5 | 5.4395e-02 | true |
| 1200 | NonlinearSolve (LM) | 2.5554161042e10 | 1785184 | 364082192 | 132 | 5.4395e-02 | true |
| 1200 | NonlinearSolve (TrustRegion) | 1.31511292e8 | 334883 | 244276608 | 39 | 5.4395e-02 | true |
| 1200 | CaNNOLeS | 2.79942915e7 | 218743 | 22569632 | 5 | 5.4395e-02 | true |
| 2000 | SecondOrderOptimization (Dogleg) | 5.179396e6 | 284 | 6760848 | 5 | 5.4397e-02 | true |
| 2000 | SecondOrderOptimization (LM) | 5.106896e6 | 284 | 7236096 | 5 | 5.4397e-02 | true |
| 2000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 2000 | LeastSquaresOptim (LM) | 3.39527625e8 | 1221377 | 87876400 | 20 | 5.4397e-02 | true |
| 2000 | Optim (Newton) | 5.5817042e7 | 367004 | 87545856 | 5 | 5.4397e-02 | true |
| 2000 | JSOSolvers (trunk) | 3.488480833e9 | 30651699 | 2186644576 | 501 | 5.4397e-02 | false |
| 2000 | JSOSolvers (tron) | 2.235682416e9 | 17951668 | 1281439472 | 287 | 5.4397e-02 | false |
| 2000 | Ipopt | 1.3702604e7 | 251 | 256464 | 5 | 5.4397e-02 | true |
| 2000 | MadNLP | 1.1136604e7 | 599 | 5662528 | 5 | 5.4397e-02 | true |
| 2000 | NonlinearSolve (LM) | 3.0141837958e10 | 1488150 | 1430701920 | 66 | 5.4397e-02 | false |
| 2000 | NonlinearSolve (TrustRegion) | 2.18208291e8 | 495357 | 386583904 | 38 | 5.4397e-02 | true |
| 2000 | CaNNOLeS | 4.5747375e7 | 366583 | 37649056 | 5 | 5.4397e-02 | true |
| 3500 | SecondOrderOptimization (Dogleg) | 9.139479e6 | 289 | 11770192 | 5 | 5.4397e-02 | true |
| 3500 | SecondOrderOptimization (LM) | 8.7108965e6 | 289 | 12589504 | 5 | 5.4397e-02 | true |
| 3500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 3500 | LeastSquaresOptim (LM) | 6.20779312e8 | 2252642 | 161530240 | 21 | 5.4397e-02 | true |
| 3500 | Optim (Newton) | 9.2675792e7 | 644196 | 153689216 | 5 | 5.4397e-02 | true |
| 3500 | JSOSolvers (trunk) | 6.006987542e9 | 53844111 | 3830729248 | 501 | 5.4397e-02 | false |
| 3500 | JSOSolvers (tron) | 3.517228459e9 | 29174770 | 2077185328 | 266 | 5.4397e-02 | false |
| 3500 | Ipopt | 2.7632375e7 | 251 | 502224 | 5 | 5.4397e-02 | true |
| 3500 | MadNLP | 1.9334416e7 | 599 | 10115680 | 5 | 5.4397e-02 | true |
| 3500 | NonlinearSolve (LM) | 3.0540193625e10 | 1938622 | 902350720 | 22 | 5.4397e-02 | false |
| 3500 | NonlinearSolve (TrustRegion) | 3.61436125e8 | 865183 | 682061216 | 39 | 5.4397e-02 | true |
| 3500 | CaNNOLeS | 8.69583125e7 | 643783 | 65351584 | 5 | 5.4397e-02 | true |
| 5000 | SecondOrderOptimization (Dogleg) | 1.2921875e7 | 289 | 16734208 | 5 | 5.4397e-02 | true |
| 5000 | SecondOrderOptimization (LM) | 1.2421917e7 | 289 | 17897584 | 5 | 5.4397e-02 | true |
| 5000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | LeastSquaresOptim (LM) | 8.97892521e8 | 3222842 | 230732320 | 21 | 5.4397e-02 | true |
| 5000 | Optim (Newton) | 1.34780708e8 | 921400 | 218165696 | 5 | 5.4397e-02 | true |
| 5000 | JSOSolvers (trunk) | 8.795989875e9 | 77036507 | 5474731744 | 501 | 5.4397e-02 | false |
| 5000 | JSOSolvers (tron) | 6.304665292e9 | 51255628 | 3644413488 | 327 | 5.4397e-02 | false |
| 5000 | Ipopt | 4.26803335e7 | 251 | 666064 | 5 | 5.4397e-02 | true |
| 5000 | MadNLP | 2.83369995e7 | 599 | 14086656 | 5 | 5.4397e-02 | true |
| 5000 | NonlinearSolve (LM) | 3.0923826166e10 | 1692333 | 679079184 | 11 | 5.5067e-02 | false |
| 5000 | NonlinearSolve (TrustRegion) | 5.449990835e8 | 1234615 | 948019456 | 38 | 5.4397e-02 | true |
| 5000 | CaNNOLeS | 1.27384709e8 | 920983 | 93430944 | 5 | 5.4397e-02 | true |
| 7500 | SecondOrderOptimization (Dogleg) | 1.96639165e7 | 289 | 24872272 | 5 | 5.4397e-02 | true |
| 7500 | SecondOrderOptimization (LM) | 1.8481291e7 | 289 | 26609088 | 5 | 5.4397e-02 | true |
| 7500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 7500 | LeastSquaresOptim (LM) | 1.335677709e9 | 4839863 | 345969808 | 21 | 5.4397e-02 | true |
| 7500 | Optim (Newton) | 2.74987208e8 | 1383400 | 326694080 | 5 | 5.4397e-02 | true |
| 7500 | JSOSolvers (trunk) | 1.3100031416e10 | 115690503 | 8214577568 | 501 | 5.4397e-02 | false |
| 7500 | JSOSolvers (tron) | 9.236488042e9 | 75821334 | 5386276048 | 322 | 5.4397e-02 | false |
| 7500 | Ipopt | 6.119325e7 | 251 | 911824 | 5 | 5.4397e-02 | true |
| 7500 | MadNLP | 4.1911625e7 | 608 | 20748208 | 5 | 5.4397e-02 | true |
| 7500 | NonlinearSolve (LM) | 3.1422278417e10 | 1154573 | 476922192 | 5 | 1.0465e+01 | false |
| 7500 | NonlinearSolve (TrustRegion) | 6.889855625e8 | 1620158 | 1387040208 | 38 | 5.4397e-02 | true |
| 7500 | CaNNOLeS | 1.8907675e8 | 1382983 | 142469024 | 5 | 5.4397e-02 | true |
| 10000 | SecondOrderOptimization (Dogleg) | 2.9208375e7 | 344 | 49296384 | 2 | 9.2775e-02 | false |
| 10000 | SecondOrderOptimization (LM) | 3.41963745e7 | 357 | 47851456 | 5 | 5.4397e-02 | true |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | Optim (Newton) | 2.85647021e8 | 1845404 | 444135424 | 5 | 5.4397e-02 | true |
| 10000 | JSOSolvers (trunk) | 1.7136824458e10 | 154344499 | 10954603616 | 501 | 5.4397e-02 | false |
| 10000 | JSOSolvers (tron) | 1.1175483875e10 | 95312613 | 6768488672 | 300 | 5.4397e-02 | false |
| 10000 | Ipopt | 8.3837417e7 | 251 | 1239504 | 5 | 5.4397e-02 | true |
| 10000 | MadNLP | 5.5424188e7 | 608 | 27524016 | 5 | 5.4397e-02 | true |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | CaNNOLeS | 2.372063335e8 | 1844983 | 188443296 | 5 | 5.4397e-02 | true |
