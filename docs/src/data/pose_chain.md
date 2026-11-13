# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: NLLSModel (Sparse)
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-13T01:22:00
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: 520587c

---

## Model Evaluation Scaling

This problem uses `NLLSModel (Sparse)` universally across all optimizers; Phase 1 comparative model evaluation is omitted.


---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 50 | SecondOrderOptimization (Dogleg) | 117875.0 | 225 | 189536 | 5 | 3.3090e-02 | true |
| 50 | SecondOrderOptimization (LM) | 117062.0 | 221 | 186960 | 5 | 3.3090e-02 | true |
| 50 | LeastSquaresOptim (Dogleg) | 3.2678545e6 | 7136 | 1246816 | 5 | 3.3090e-02 | true |
| 50 | LeastSquaresOptim (LM) | 1.1147146e7 | 12821 | 2256816 | 9 | 3.3090e-02 | true |
| 50 | Optim (Newton) | 1.545958e6 | 8513 | 1006992 | 5 | 3.3090e-02 | true |
| 50 | JSOSolvers (trunk) | 4.253625e6 | 23928 | 1790880 | 16 | 3.3090e-02 | true |
| 50 | JSOSolvers (tron) | 5.7536665e6 | 31013 | 2323856 | 21 | 3.3090e-02 | true |
| 50 | Ipopt | 951520.5 | 246 | 16784 | 5 | 3.3090e-02 | true |
| 50 | MadNLP | 524020.5 | 568 | 192016 | 5 | 3.3090e-02 | true |
| 50 | NonlinearSolve (LM) | 1.6026175e8 | 65420 | 31054208 | 122 | 3.3090e-02 | true |
| 50 | NonlinearSolve (TrustRegion) | 1.3044604e7 | 13048 | 5550384 | 39 | 3.3090e-02 | true |
| 50 | CaNNOLeS | 2.2832334e7 | 8633 | 4873536 | 5 | 3.3090e-02 | true |
| 100 | SecondOrderOptimization (Dogleg) | 214603.5 | 254 | 382608 | 4 | 4.2617e-02 | true |
| 100 | SecondOrderOptimization (LM) | 202979.0 | 248 | 377344 | 4 | 4.2617e-02 | true |
| 100 | LeastSquaresOptim (Dogleg) | 1.9467479e7 | 11449 | 2217520 | 4 | 4.2617e-02 | true |
| 100 | LeastSquaresOptim (LM) | 9.0629459e7 | 28567 | 5048944 | 10 | 4.2617e-02 | true |
| 100 | Optim (Newton) | 7.5460625e6 | 17101 | 2738768 | 5 | 4.2617e-02 | true |
| 100 | JSOSolvers (trunk) | 3.9613916e7 | 189955 | 14147088 | 66 | 4.2617e-02 | true |
| 100 | JSOSolvers (tron) | 3.4461792e7 | 113510 | 8490320 | 39 | 4.2617e-02 | true |
| 100 | Ipopt | 1.364333e6 | 251 | 23504 | 5 | 4.2617e-02 | true |
| 100 | MadNLP | 854145.5 | 587 | 342368 | 5 | 4.2617e-02 | true |
| 100 | NonlinearSolve (LM) | 8.63702104e8 | 132905 | 65829456 | 124 | 4.2617e-02 | true |
| 100 | NonlinearSolve (TrustRegion) | 6.2492292e7 | 23174 | 11849312 | 38 | 4.2617e-02 | true |
| 100 | CaNNOLeS | 1.11414417e8 | 17225 | 16934624 | 5 | 4.2617e-02 | true |
| 200 | SecondOrderOptimization (Dogleg) | 512000.0 | 263 | 754000 | 5 | 4.8756e-02 | true |
| 200 | SecondOrderOptimization (LM) | 483687.5 | 257 | 743616 | 5 | 4.8756e-02 | true |
| 200 | LeastSquaresOptim (Dogleg) | 3.592698955e8 | 35572 | 2724176 | 6 | 4.8756e-02 | true |
| 200 | LeastSquaresOptim (LM) | 2.861526665e8 | 77010 | 5759248 | 13 | 4.8756e-02 | true |
| 200 | Optim (Newton) | 4.1229375e6 | 42121 | 10618144 | 6 | 4.8756e-02 | true |
| 200 | JSOSolvers (trunk) | 1.03577875e8 | 1206333 | 88609024 | 203 | 4.8756e-02 | true |
| 200 | JSOSolvers (tron) | 6.51096665e7 | 650580 | 47868992 | 109 | 4.8756e-02 | true |
| 200 | Ipopt | 2.280708e6 | 281 | 37552 | 6 | 4.8756e-02 | true |
| 200 | MadNLP | 1.6466455e6 | 599 | 642176 | 6 | 4.8756e-02 | true |
| 200 | NonlinearSolve (LM) | 5.869450167e9 | 1725050 | 362536272 | 132 | 4.8756e-02 | true |
| 200 | NonlinearSolve (TrustRegion) | 2.224287792e9 | 408847 | 28001552 | 39 | 4.8756e-02 | true |
| 200 | CaNNOLeS | 4.0313545e6 | 41620 | 4260832 | 6 | 4.8756e-02 | true |
| 400 | SecondOrderOptimization (Dogleg) | 951000.0 | 284 | 1491072 | 5 | 5.3112e-02 | true |
| 400 | SecondOrderOptimization (LM) | 928250.0 | 278 | 1470448 | 5 | 5.3112e-02 | true |
| 400 | LeastSquaresOptim (Dogleg) | 2.292875e7 | 118652 | 8918544 | 10 | 5.3112e-02 | true |
| 400 | LeastSquaresOptim (LM) | 4.1305042e7 | 201676 | 15036656 | 17 | 5.3112e-02 | true |
| 400 | Optim (Newton) | 8.146042e6 | 83773 | 21126576 | 6 | 5.3112e-02 | true |
| 400 | JSOSolvers (trunk) | 4.28597917e8 | 5203548 | 382280608 | 438 | 5.3112e-02 | true |
| 400 | JSOSolvers (tron) | 2.11617958e8 | 2098303 | 154344816 | 170 | 5.3112e-02 | false |
| 400 | Ipopt | 3.7270205e6 | 281 | 63152 | 6 | 5.3112e-02 | true |
| 400 | MadNLP | 2.928979e6 | 599 | 1289408 | 6 | 5.3112e-02 | true |
| 400 | NonlinearSolve (LM) | 2.653527833e9 | 638512 | 597012160 | 135 | 5.3112e-02 | true |
| 400 | NonlinearSolve (TrustRegion) | 4.41307295e7 | 125785 | 83740288 | 40 | 5.3112e-02 | true |
| 400 | CaNNOLeS | 8.059271e6 | 83200 | 8499936 | 6 | 5.3112e-02 | true |
| 800 | SecondOrderOptimization (Dogleg) | 1.96925e6 | 14465 | 3835760 | 5 | 5.4356e-02 | true |
| 800 | SecondOrderOptimization (LM) | 2.11125e6 | 14459 | 3794656 | 5 | 5.4356e-02 | true |
| 800 | LeastSquaresOptim (Dogleg) | 4.6342875e7 | 192918 | 14346128 | 8 | 5.4356e-02 | true |
| 800 | LeastSquaresOptim (LM) | 1.06118333e8 | 409894 | 30133936 | 17 | 5.4356e-02 | true |
| 800 | Optim (Newton) | 1.45423335e7 | 145236 | 35453216 | 5 | 5.4356e-02 | true |
| 800 | JSOSolvers (trunk) | 9.83810834e8 | 12098823 | 878482496 | 501 | 5.4356e-02 | false |
| 800 | JSOSolvers (tron) | 5.39523333e8 | 5832764 | 423870448 | 234 | 5.4356e-02 | false |
| 800 | Ipopt | 5.6995415e6 | 251 | 113104 | 5 | 5.4356e-02 | true |
| 800 | MadNLP | 4.9030625e6 | 599 | 2526816 | 5 | 5.4356e-02 | true |
| 800 | NonlinearSolve (LM) | 1.1481022208e10 | 1181602 | 192791296 | 132 | 5.4356e-02 | true |
| 800 | NonlinearSolve (TrustRegion) | 7.5662854e7 | 199735 | 157559808 | 38 | 5.4356e-02 | true |
| 800 | CaNNOLeS | 1.38914995e7 | 144835 | 15261952 | 5 | 5.4356e-02 | true |
| 1200 | SecondOrderOptimization (Dogleg) | 2.8073955e6 | 21525 | 5720768 | 5 | 5.4395e-02 | true |
| 1200 | SecondOrderOptimization (LM) | 2.968959e6 | 21519 | 5655088 | 5 | 5.4395e-02 | true |
| 1200 | LeastSquaresOptim (Dogleg) | 8.5946333e7 | 327905 | 24165904 | 9 | 5.4395e-02 | true |
| 1200 | LeastSquaresOptim (LM) | 1.73261479e8 | 655761 | 47862864 | 18 | 5.4395e-02 | true |
| 1200 | Optim (Newton) | 2.1232208e7 | 219156 | 52887072 | 5 | 5.4395e-02 | true |
| 1200 | JSOSolvers (trunk) | 1.453716416e9 | 18283483 | 1320427136 | 501 | 5.4395e-02 | false |
| 1200 | JSOSolvers (tron) | 8.33166125e8 | 9105572 | 658142864 | 242 | 5.4395e-02 | false |
| 1200 | Ipopt | 8.393625e6 | 251 | 174544 | 5 | 5.4395e-02 | true |
| 1200 | MadNLP | 7.4643965e6 | 599 | 3587072 | 5 | 5.4395e-02 | true |
| 1200 | NonlinearSolve (LM) | 2.5404599917e10 | 1785282 | 365120288 | 132 | 5.4395e-02 | true |
| 1200 | NonlinearSolve (TrustRegion) | 1.20321917e8 | 334898 | 244469216 | 39 | 5.4395e-02 | true |
| 1200 | CaNNOLeS | 2.0692208e7 | 218765 | 22696608 | 5 | 5.4395e-02 | true |
| 2000 | SecondOrderOptimization (Dogleg) | 4.9271255e6 | 35605 | 9504912 | 5 | 5.4397e-02 | true |
| 2000 | SecondOrderOptimization (LM) | 4.5848335e6 | 35599 | 9406464 | 5 | 5.4397e-02 | true |
| 2000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 2000 | LeastSquaresOptim (LM) | 3.01896396e8 | 1221417 | 88580720 | 20 | 5.4397e-02 | true |
| 2000 | Optim (Newton) | 4.4131917e7 | 366996 | 87756832 | 5 | 5.4397e-02 | true |
| 2000 | JSOSolvers (trunk) | 2.486306291e9 | 30652723 | 2204323328 | 501 | 5.4397e-02 | false |
| 2000 | JSOSolvers (tron) | 1.688616041e9 | 17952256 | 1291792976 | 287 | 5.4397e-02 | false |
| 2000 | Ipopt | 1.3748958e7 | 251 | 256464 | 5 | 5.4397e-02 | true |
| 2000 | MadNLP | 1.14048745e7 | 599 | 5662528 | 5 | 5.4397e-02 | true |
| 2000 | NonlinearSolve (LM) | 3.0180156292e10 | 1488514 | 1451589152 | 67 | 5.4397e-02 | false |
| 2000 | NonlinearSolve (TrustRegion) | 1.9478225e8 | 495439 | 386869120 | 38 | 5.4397e-02 | true |
| 2000 | CaNNOLeS | 3.4735208e7 | 366595 | 37860352 | 5 | 5.4397e-02 | true |
| 3500 | SecondOrderOptimization (Dogleg) | 8.0144375e6 | 62011 | 16540384 | 5 | 5.4397e-02 | true |
| 3500 | SecondOrderOptimization (LM) | 8.315208e6 | 62005 | 16343632 | 5 | 5.4397e-02 | true |
| 3500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 3500 | LeastSquaresOptim (LM) | 5.439498125e8 | 2252684 | 162824176 | 21 | 5.4397e-02 | true |
| 3500 | Optim (Newton) | 7.91598955e7 | 644213 | 154058992 | 5 | 5.4397e-02 | true |
| 3500 | JSOSolvers (trunk) | 4.358612917e9 | 53845106 | 3861660336 | 501 | 5.4397e-02 | false |
| 3500 | JSOSolvers (tron) | 2.71460625e9 | 29175314 | 2093944880 | 266 | 5.4397e-02 | false |
| 3500 | Ipopt | 2.74333535e7 | 251 | 502224 | 5 | 5.4397e-02 | true |
| 3500 | MadNLP | 1.9049583e7 | 599 | 10115680 | 5 | 5.4397e-02 | true |
| 3500 | NonlinearSolve (LM) | 3.129898125e10 | 1938970 | 937952480 | 23 | 5.4397e-02 | false |
| 3500 | NonlinearSolve (TrustRegion) | 3.14621875e8 | 865173 | 682556160 | 39 | 5.4397e-02 | true |
| 3500 | CaNNOLeS | 6.8768167e7 | 643795 | 65721280 | 5 | 5.4397e-02 | true |
| 5000 | SecondOrderOptimization (Dogleg) | 1.199375e7 | 88427 | 23612656 | 5 | 5.4397e-02 | true |
| 5000 | SecondOrderOptimization (LM) | 1.13547915e7 | 88421 | 23350368 | 5 | 5.4397e-02 | true |
| 5000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 5000 | LeastSquaresOptim (LM) | 7.65536854e8 | 3222884 | 232580656 | 21 | 5.4397e-02 | true |
| 5000 | Optim (Newton) | 9.8300375e7 | 921416 | 218693856 | 5 | 5.4397e-02 | true |
| 5000 | JSOSolvers (trunk) | 6.340665208e9 | 77037503 | 5518915648 | 501 | 5.4397e-02 | false |
| 5000 | JSOSolvers (tron) | 4.685062875e9 | 51256296 | 3673810832 | 327 | 5.4397e-02 | false |
| 5000 | Ipopt | 4.05696875e7 | 251 | 666064 | 5 | 5.4397e-02 | true |
| 5000 | MadNLP | 2.6857729e7 | 599 | 14086656 | 5 | 5.4397e-02 | true |
| 5000 | NonlinearSolve (LM) | 3.0720765084e10 | 1692337 | 681032544 | 11 | 5.5067e-02 | false |
| 5000 | NonlinearSolve (TrustRegion) | 4.54903542e8 | 1234627 | 948725952 | 38 | 5.4397e-02 | true |
| 5000 | CaNNOLeS | 9.2382333e7 | 920995 | 93959040 | 5 | 5.4397e-02 | true |
| 7500 | SecondOrderOptimization (Dogleg) | 1.93702915e7 | 132427 | 35054304 | 5 | 5.4397e-02 | true |
| 7500 | SecondOrderOptimization (LM) | 2.0071083e7 | 132421 | 34693712 | 5 | 5.4397e-02 | true |
| 7500 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 7500 | LeastSquaresOptim (LM) | 1.211308333e9 | 4839905 | 348742144 | 21 | 5.4397e-02 | true |
| 7500 | Optim (Newton) | 1.38467854e8 | 1383412 | 329042656 | 5 | 5.4397e-02 | true |
| 7500 | JSOSolvers (trunk) | 9.650686292e9 | 115691507 | 8280849600 | 501 | 5.4397e-02 | false |
| 7500 | JSOSolvers (tron) | 6.9651875e9 | 75821992 | 5429709312 | 322 | 5.4397e-02 | false |
| 7500 | Ipopt | 5.93648535e7 | 251 | 911824 | 5 | 5.4397e-02 | true |
| 7500 | MadNLP | 4.03010005e7 | 608 | 20748208 | 5 | 5.4397e-02 | true |
| 7500 | NonlinearSolve (LM) | 3.1549489458e10 | 1154579 | 484826368 | 5 | 1.0465e+01 | false |
| 7500 | NonlinearSolve (TrustRegion) | 7.147945625e8 | 1620166 | 1387966656 | 38 | 5.4397e-02 | true |
| 7500 | CaNNOLeS | 1.41096167e8 | 1382995 | 143113664 | 5 | 5.4397e-02 | true |
| 10000 | SecondOrderOptimization (Dogleg) | 2.43985e7 | 176443 | 46174688 | 5 | 5.4397e-02 | true |
| 10000 | SecondOrderOptimization (LM) | 2.34002085e7 | 176437 | 45683024 | 5 | 5.4397e-02 | true |
| 10000 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | Optim (Newton) | 2.239150835e8 | 1845424 | 435688928 | 5 | 5.4397e-02 | true |
| 10000 | JSOSolvers (trunk) | 1.30607115e10 | 154345503 | 11042963648 | 501 | 5.4397e-02 | false |
| 10000 | JSOSolvers (tron) | 8.694231667e9 | 95313233 | 6823053632 | 300 | 5.4397e-02 | false |
| 10000 | Ipopt | 8.2015167e7 | 251 | 1239504 | 5 | 5.4397e-02 | true |
| 10000 | MadNLP | 5.7730667e7 | 608 | 27524016 | 5 | 5.4397e-02 | true |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false |
| 10000 | CaNNOLeS | 1.92702041e8 | 1844995 | 190695424 | 5 | 5.4397e-02 | true |
