# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: NLLSModel (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T21:12:01
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b448285

---

## Model Evaluation Scaling

This problem uses `NLLSModel (Sparse)` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 50 | SecondOrderOptimization (Dogleg) | 128062.5 | 192 | 159136 | 6 | 3.3090e-02 | true |
| 50 | SecondOrderOptimization (LM) | 121000.0 | 193 | 170288 | 5 | 3.3090e-02 | true |
| 50 | LeastSquaresOptim (Dogleg) | 3.264354e6 | 7146 | 1242976 | 5 | 3.3090e-02 | true |
| 50 | LeastSquaresOptim (LM) | 1.12733335e7 | 12839 | 2249904 | 9 | 3.3090e-02 | true |
| 50 | Optim (Newton) | 1.693396e6 | 8523 | 1001360 | 5 | 3.3090e-02 | true |
| 50 | JSOSolvers (trunk) | 4.646854e6 | 23960 | 1777760 | 16 | 3.3090e-02 | true |
| 50 | JSOSolvers (tron) | 6.31025e6 | 31055 | 2306896 | 21 | 3.3090e-02 | true |
| 50 | Ipopt | 914958.0 | 246 | 16784 | 5 | 3.3090e-02 | true |
| 50 | MadNLP | 555395.5 | 568 | 192016 | 5 | 3.3090e-02 | true |
| 50 | NonlinearSolve (LM) | 1.635472085e8 | 65756 | 31024704 | 122 | 3.3090e-02 | true |
| 50 | NonlinearSolve (TrustRegion) | 1.31397705e7 | 13094 | 5541808 | 39 | 3.3090e-02 | true |
| 50 | CaNNOLeS | 2.28919585e7 | 8643 | 4868864 | 5 | 3.3090e-02 | true |
| 100 | SecondOrderOptimization (Dogleg) | 310312.5 | 217 | 322656 | 7 | 4.2617e-02 | true |
| 100 | SecondOrderOptimization (LM) | 226000.0 | 217 | 344752 | 4 | 4.2617e-02 | true |
| 100 | LeastSquaresOptim (Dogleg) | 1.93705e7 | 11457 | 2210928 | 4 | 4.2617e-02 | true |
| 100 | LeastSquaresOptim (LM) | 8.9444708e7 | 28587 | 5032464 | 10 | 4.2617e-02 | true |
| 100 | Optim (Newton) | 7.6028125e6 | 17111 | 2727856 | 5 | 4.2617e-02 | true |
| 100 | JSOSolvers (trunk) | 4.2254625e7 | 190087 | 14036608 | 66 | 4.2617e-02 | true |
| 100 | JSOSolvers (tron) | 3.7373375e7 | 113588 | 8424336 | 39 | 4.2617e-02 | true |
| 100 | Ipopt | 1.2659165e6 | 251 | 23504 | 5 | 4.2617e-02 | true |
| 100 | MadNLP | 848458.0 | 587 | 342368 | 5 | 4.2617e-02 | true |
| 100 | NonlinearSolve (LM) | 8.747448955e8 | 133247 | 65758832 | 124 | 4.2617e-02 | true |
| 100 | NonlinearSolve (TrustRegion) | 6.29438125e7 | 23218 | 11834464 | 38 | 4.2617e-02 | true |
| 100 | CaNNOLeS | 1.11616125e8 | 17235 | 16924672 | 5 | 4.2617e-02 | true |
| 200 | SecondOrderOptimization (Dogleg) | 628937.5 | 226 | 635296 | 7 | 4.8756e-02 | true |
| 200 | SecondOrderOptimization (LM) | 501791.5 | 226 | 679408 | 5 | 4.8756e-02 | true |
| 200 | LeastSquaresOptim (Dogleg) | 3.66264146e8 | 35584 | 2703728 | 6 | 4.8756e-02 | true |
| 200 | LeastSquaresOptim (LM) | 2.836479375e8 | 77036 | 5714944 | 13 | 4.8756e-02 | true |
| 200 | Optim (Newton) | 4.8928545e6 | 42133 | 10594224 | 6 | 4.8756e-02 | true |
| 200 | JSOSolvers (trunk) | 1.21039646e8 | 1206739 | 87913728 | 203 | 4.8756e-02 | true |
| 200 | JSOSolvers (tron) | 7.7048167e7 | 650798 | 47494048 | 109 | 4.8756e-02 | true |
| 200 | Ipopt | 2.2613745e6 | 281 | 37552 | 6 | 4.8756e-02 | true |
| 200 | MadNLP | 1.6692085e6 | 599 | 642176 | 6 | 4.8756e-02 | true |
| 200 | NonlinearSolve (LM) | 5.749579917e9 | 1724838 | 362333824 | 132 | 4.8756e-02 | true |
| 200 | NonlinearSolve (TrustRegion) | 1.930421792e9 | 408927 | 27973616 | 39 | 4.8756e-02 | true |
| 200 | CaNNOLeS | 4.8129585e6 | 41632 | 4236912 | 6 | 4.8756e-02 | true |
| 400 | SecondOrderOptimization (Dogleg) | 1.3973965e6 | 248 | 1255344 | 8 | 5.3112e-02 | true |
| 400 | SecondOrderOptimization (LM) | 972666.5 | 248 | 1343488 | 5 | 5.3112e-02 | true |
| 400 | LeastSquaresOptim (Dogleg) | 2.5028583e7 | 118672 | 8849264 | 10 | 5.3112e-02 | true |
| 400 | LeastSquaresOptim (LM) | 4.5356083e7 | 201710 | 14918880 | 17 | 5.3112e-02 | true |
| 400 | Optim (Newton) | 9.9739375e6 | 83845 | 21078976 | 6 | 5.3112e-02 | true |
| 400 | JSOSolvers (trunk) | 5.160785835e8 | 5204424 | 379239152 | 438 | 5.3112e-02 | true |
| 400 | JSOSolvers (tron) | 2.39719375e8 | 2098643 | 153118112 | 170 | 5.3112e-02 | false |
| 400 | Ipopt | 3.7976245e6 | 281 | 63152 | 6 | 5.3112e-02 | true |
| 400 | MadNLP | 2.939521e6 | 599 | 1289408 | 6 | 5.3112e-02 | true |
| 400 | NonlinearSolve (LM) | 2.695583209e9 | 638888 | 596672096 | 135 | 5.3112e-02 | true |
| 400 | NonlinearSolve (TrustRegion) | 4.7478125e7 | 125677 | 83666880 | 40 | 5.3112e-02 | true |
| 400 | CaNNOLeS | 9.5303955e6 | 83212 | 8451376 | 6 | 5.3112e-02 | true |
| 800 | SecondOrderOptimization (Dogleg) | 2.4556465e6 | 251 | 2502880 | 7 | 5.4356e-02 | true |
| 800 | SecondOrderOptimization (LM) | 1.9145625e6 | 251 | 2679088 | 5 | 5.4356e-02 | true |
| 800 | LeastSquaresOptim (Dogleg) | 5.0159375e7 | 192934 | 14234384 | 8 | 5.4356e-02 | true |
| 800 | LeastSquaresOptim (LM) | 1.08160625e8 | 409928 | 29896480 | 17 | 5.4356e-02 | true |
| 800 | Optim (Newton) | 1.6153792e7 | 145246 | 35369344 | 5 | 5.4356e-02 | true |
| 800 | JSOSolvers (trunk) | 1.152535875e9 | 12099965 | 871472736 | 501 | 5.4356e-02 | false |
| 800 | JSOSolvers (tron) | 6.58792042e8 | 5833232 | 420489680 | 234 | 5.4356e-02 | false |
| 800 | Ipopt | 5.793271e6 | 251 | 113104 | 5 | 5.4356e-02 | true |
| 800 | MadNLP | 4.7294375e6 | 599 | 2526816 | 5 | 5.4356e-02 | true |
| 800 | NonlinearSolve (LM) | 1.1302364917e10 | 1181956 | 192112784 | 132 | 5.4356e-02 | true |
| 800 | NonlinearSolve (TrustRegion) | 8.6126729e7 | 199783 | 157446592 | 38 | 5.4356e-02 | true |
| 800 | CaNNOLeS | 1.661375e7 | 144845 | 15178080 | 5 | 5.4356e-02 | true |
| 1200 | SecondOrderOptimization (Dogleg) | 3.6575e6 | 254 | 3714848 | 7 | 5.4395e-02 | true |
| 1200 | SecondOrderOptimization (LM) | 3.01025e6 | 254 | 3960688 | 5 | 5.4395e-02 | true |
| 1200 | LeastSquaresOptim (Dogleg) | 8.9596584e7 | 327923 | 23976832 | 9 | 5.4395e-02 | true |
| 1200 | LeastSquaresOptim (LM) | 1.85959e8 | 655797 | 47484720 | 18 | 5.4395e-02 | true |
| 1200 | Optim (Newton) | 3.4900834e7 | 219198 | 52761472 | 5 | 5.4395e-02 | true |
| 1200 | JSOSolvers (trunk) | 1.817252209e9 | 18284441 | 1309880352 | 501 | 5.4395e-02 | false |
| 1200 | JSOSolvers (tron) | 1.010783833e9 | 9106056 | 652890352 | 242 | 5.4395e-02 | false |
| 1200 | Ipopt | 8.320354e6 | 251 | 174544 | 5 | 5.4395e-02 | true |
| 1200 | MadNLP | 7.27125e6 | 599 | 3587072 | 5 | 5.4395e-02 | true |
| 1200 | NonlinearSolve (LM) | 2.5316448625e10 | 1785646 | 364096976 | 132 | 5.4395e-02 | true |
| 1200 | NonlinearSolve (TrustRegion) | 1.2724725e8 | 334942 | 244278480 | 39 | 5.4395e-02 | true |
| 1200 | CaNNOLeS | 2.4759875e7 | 218765 | 22570336 | 5 | 5.4395e-02 | true |
| 2000 | SecondOrderOptimization (Dogleg) | 6.0914375e6 | 254 | 6202592 | 7 | 5.4397e-02 | true |
| 2000 | SecondOrderOptimization (LM) | 4.824229e6 | 254 | 6628656 | 5 | 5.4397e-02 | true |
| 2000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 2000 | LeastSquaresOptim (LM) | 3.17745875e8 | 1221457 | 87878960 | 20 | 5.4397e-02 | true |
| 2000 | Optim (Newton) | 5.15122085e7 | 367018 | 87677504 | 5 | 5.4397e-02 | true |
| 2000 | JSOSolvers (trunk) | 3.076150458e9 | 30653719 | 2186709024 | 501 | 5.4397e-02 | false |
| 2000 | JSOSolvers (tron) | 1.977143417e9 | 17952830 | 1281476656 | 287 | 5.4397e-02 | false |
| 2000 | Ipopt | 1.35035625e7 | 251 | 256464 | 5 | 5.4397e-02 | true |
| 2000 | MadNLP | 1.1492104e7 | 599 | 5662528 | 5 | 5.4397e-02 | true |
| 2000 | NonlinearSolve (LM) | 3.0275237416e10 | 1488720 | 1450749312 | 67 | 5.4397e-02 | false |
| 2000 | NonlinearSolve (TrustRegion) | 1.96249083e8 | 495465 | 386586560 | 38 | 5.4397e-02 | true |
| 2000 | CaNNOLeS | 4.06185e7 | 366605 | 37649760 | 5 | 5.4397e-02 | true |
| 3500 | SecondOrderOptimization (Dogleg) | 1.08170625e7 | 259 | 10781856 | 7 | 5.4397e-02 | true |
| 3500 | SecondOrderOptimization (LM) | 8.5963335e6 | 259 | 11502832 | 5 | 5.4397e-02 | true |
| 3500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 3500 | LeastSquaresOptim (LM) | 5.725039375e8 | 2252726 | 161532928 | 21 | 5.4397e-02 | true |
| 3500 | Optim (Newton) | 8.07425205e7 | 644218 | 153689920 | 5 | 5.4397e-02 | true |
| 3500 | JSOSolvers (trunk) | 5.364181167e9 | 53846113 | 3830793376 | 501 | 5.4397e-02 | false |
| 3500 | JSOSolvers (tron) | 3.211412708e9 | 29175846 | 2077219760 | 266 | 5.4397e-02 | false |
| 3500 | Ipopt | 2.8410084e7 | 251 | 502224 | 5 | 5.4397e-02 | true |
| 3500 | MadNLP | 2.00236875e7 | 599 | 10115680 | 5 | 5.4397e-02 | true |
| 3500 | NonlinearSolve (LM) | 3.0198488125e10 | 1938738 | 902354432 | 22 | 5.4397e-02 | false |
| 3500 | NonlinearSolve (TrustRegion) | 3.34877916e8 | 865231 | 742765600 | 39 | 5.4397e-02 | true |
| 3500 | CaNNOLeS | 8.0352417e7 | 643805 | 66515552 | 5 | 5.4397e-02 | true |
| 5000 | SecondOrderOptimization (Dogleg) | 1.5595271e7 | 259 | 15356752 | 7 | 5.4397e-02 | true |
| 5000 | SecondOrderOptimization (LM) | 1.2184021e7 | 259 | 16389024 | 5 | 5.4397e-02 | true |
| 5000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | LeastSquaresOptim (LM) | 8.354702915e8 | 3222926 | 230735008 | 21 | 5.4397e-02 | true |
| 5000 | Optim (Newton) | 1.49065375e8 | 921434 | 218166592 | 5 | 5.4397e-02 | true |
| 5000 | JSOSolvers (trunk) | 7.644314084e9 | 77038507 | 5474795872 | 501 | 5.4397e-02 | false |
| 5000 | JSOSolvers (tron) | 5.643134125e9 | 51256950 | 3644455792 | 327 | 5.4397e-02 | false |
| 5000 | Ipopt | 4.0739625e7 | 251 | 666064 | 5 | 5.4397e-02 | true |
| 5000 | MadNLP | 2.83558545e7 | 599 | 14086656 | 5 | 5.4397e-02 | true |
| 5000 | NonlinearSolve (LM) | 3.0578273042e10 | 1692397 | 679867696 | 11 | 5.5067e-02 | false |
| 5000 | NonlinearSolve (TrustRegion) | 5.249272285e8 | 1234673 | 948021312 | 38 | 5.4397e-02 | true |
| 5000 | CaNNOLeS | 1.129459375e8 | 921005 | 93431648 | 5 | 5.4397e-02 | true |
| 7500 | SecondOrderOptimization (Dogleg) | 2.42254165e7 | 259 | 22839456 | 7 | 5.4397e-02 | true |
| 7500 | SecondOrderOptimization (LM) | 1.8505042e7 | 259 | 24396016 | 5 | 5.4397e-02 | true |
| 7500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 7500 | LeastSquaresOptim (LM) | 1.246978791e9 | 4839947 | 345972496 | 21 | 5.4397e-02 | true |
| 7500 | Optim (Newton) | 2.58274875e8 | 1383426 | 326694848 | 5 | 5.4397e-02 | true |
| 7500 | JSOSolvers (trunk) | 1.1368031666e10 | 115692505 | 8214641696 | 501 | 5.4397e-02 | false |
| 7500 | JSOSolvers (tron) | 8.127352334e9 | 75822636 | 5386317712 | 322 | 5.4397e-02 | false |
| 7500 | Ipopt | 6.1462875e7 | 251 | 911824 | 5 | 5.4397e-02 | true |
| 7500 | MadNLP | 4.2116417e7 | 608 | 20748208 | 5 | 5.4397e-02 | true |
| 7500 | NonlinearSolve (LM) | 3.1098473209e10 | 1154603 | 519030032 | 5 | 1.0465e+01 | false |
| 7500 | NonlinearSolve (TrustRegion) | 7.525188335e8 | 1620216 | 1387042032 | 38 | 5.4397e-02 | true |
| 7500 | CaNNOLeS | 1.62023e8 | 1383005 | 142322272 | 5 | 5.4397e-02 | true |
| 10000 | SecondOrderOptimization (Dogleg) | 3.32756455e7 | 323 | 43039856 | 7 | 5.4397e-02 | true |
| 10000 | SecondOrderOptimization (LM) | 2.6664625e7 | 317 | 53600608 | 5 | 5.4397e-02 | true |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | Optim (Newton) | 2.666696455e8 | 1845415 | 440138256 | 5 | 5.4397e-02 | true |
| 10000 | JSOSolvers (trunk) | 1.5272941084e10 | 154346518 | 10954668048 | 501 | 5.4397e-02 | false |
| 10000 | JSOSolvers (tron) | 1.009272725e10 | 95313833 | 6768527712 | 300 | 5.4397e-02 | false |
| 10000 | Ipopt | 8.2562292e7 | 251 | 1239504 | 5 | 5.4397e-02 | true |
| 10000 | MadNLP | 5.61924375e7 | 608 | 27524016 | 5 | 5.4397e-02 | true |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | CaNNOLeS | 2.129506455e8 | 1845005 | 190377312 | 5 | 5.4397e-02 | true |
