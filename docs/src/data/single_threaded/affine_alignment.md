# Benchmark Results: Dense Affine Alignment

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:48:18
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: fbb6630
- **Dependency Commits**: NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 1 | JuMP | 1386.1333333333334 | 2 | 32 | 2677.125 | 5 | 128 |
| 1 | NLLSModel | 81.14606741573034 | 1 | 16 | 421.66 | 1 | 32 |
| 1 | Standalone | 86.668 | 1 | 16 | 334.03333333333336 | 1 | 32 |
| 2 | JuMP | 3451.5 | 2 | 32 | 7916.666666666667 | 5 | 128 |
| 2 | NLLSModel | 116.62011173184358 | 1 | 16 | 989.6 | 1 | 32 |
| 2 | Standalone | 133.1772151898734 | 1 | 16 | 607.3030303030303 | 1 | 32 |
| 3 | JuMP | 9014.0 | 2 | 32 | 38792.0 | 5 | 128 |
| 3 | NLLSModel | 203.75 | 1 | 16 | 2287.0 | 1 | 32 |
| 3 | Standalone | 212.62886597938143 | 1 | 16 | 1494.0 | 1 | 32 |
| 4 | JuMP | 19125.0 | 2 | 32 | 80208.0 | 5 | 128 |
| 4 | NLLSModel | 316.03076923076924 | 1 | 16 | 5572.75 | 1 | 32 |
| 4 | Standalone | 321.2181818181818 | 1 | 16 | 3256.0 | 1 | 32 |
| 6 | JuMP | 55375.0 | 2 | 32 | 520625.0 | 5 | 128 |
| 6 | NLLSModel | 739.5714285714286 | 1 | 16 | 25209.0 | 1 | 32 |
| 6 | Standalone | 753.36 | 1 | 16 | 16500.0 | 1 | 32 |
| 8 | JuMP | 125000.0 | 2 | 32 | 1.780125e6 | 5 | 128 |
| 8 | NLLSModel | 1103.1052631578948 | 1 | 16 | 99292.0 | 1 | 32 |
| 8 | Standalone | 1087.7368421052631 | 1 | 16 | 56791.0 | 1 | 32 |
| 12 | JuMP | 405791.0 | 2 | 32 | 1.2644375e7 | 5 | 128 |
| 12 | NLLSModel | 3729.1666666666665 | 1 | 16 | 899375.0 | 1 | 32 |
| 12 | Standalone | 4020.8333333333335 | 1 | 16 | 423334.0 | 1 | 32 |
| 16 | JuMP | 1.611625e6 | 2 | 32 | 6.0689e7 | 5 | 128 |
| 16 | NLLSModel | 7805.666666666667 | 1 | 16 | 4.427e6 | 1 | 32 |
| 16 | Standalone | 8139.0 | 1 | 16 | 2.22975e6 | 1 | 32 |
| 20 | NLLSModel | 15667.0 | 1 | 16 | 1.6060917e7 | 1 | 32 |
| 20 | Standalone | 16459.0 | 1 | 16 | 6.791083e6 | 1 | 32 |
| 24 | NLLSModel | 26917.0 | 1 | 16 | 5.7909834e7 | 1 | 32 |
| 24 | Standalone | 26875.0 | 1 | 16 | 1.9454e7 | 1 | 32 |
| 28 | NLLSModel | 45667.0 | 1 | 16 | 1.46561334e8 | 1 | 32 |
| 28 | Standalone | 46125.0 | 1 | 16 | 4.7731292e7 | 1 | 32 |
| 32 | NLLSModel | 66209.0 | 1 | 16 | 3.90766292e8 | 1 | 32 |
| 32 | Standalone | 67000.0 | 1 | 16 | 1.34996458e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 1 | CaNNOLeS | 12354.0 | 173 | 10576 | 1 | 3.0815e-32 | true | ok | NaN | NaN | first\_order |
| 1 | Ipopt | 469917.0 | 294 | 14480 | 1 | 3.0815e-32 | true | ok | NaN | NaN | first\_order |
| 1 | JSOSolvers (tron) | 16167.0 | 147 | 7648 | 2 | 2.4652e-32 | true | ok | NaN | NaN | first\_order |
| 1 | JSOSolvers (trunk) | 14104.0 | 88 | 4336 | 4 | 1.2326e-32 | true | ok | NaN | NaN | first\_order |
| 1 | LeastSquaresOptim (Dogleg) | 25937.5 | 79 | 153280 | 3 | 1.2326e-32 | true | ok | NaN | NaN | converged |
| 1 | LeastSquaresOptim (LM) | 41145.5 | 129 | 305072 | 6 | 1.6897e-26 | true | ok | NaN | NaN | converged |
| 1 | MadNLP | 346500.0 | 565 | 49120 | 1 | 3.0815e-32 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1 | NonlinearSolve (LM) | 35833.5 | 238 | 18512 | 8 | 2.3918e-27 | true | ok | NaN | NaN | Success |
| 1 | NonlinearSolve (TrustRegion) | 23333.0 | 83 | 153904 | 3 | 1.2326e-32 | true | ok | NaN | NaN | Success |
| 1 | Optim (Newton) | 5646.0 | 51 | 2672 | 1 | 3.0815e-32 | true | ok | NaN | NaN | converged |
| 1 | Optim (NewtonTrustRegion) | 5979.5 | 62 | 3824 | 1 | 3.0815e-32 | true | ok | NaN | NaN | converged |
| 1 | SecondOrderOptimization | 19604.0 | 222 | 10432 | 2 | 1.1985e-26 | true | ok | NaN | NaN | grad\_tol |
| 2 | CaNNOLeS | 63333.0 | 184 | 33856 | 5 | 4.3979e-28 | true | ok | NaN | NaN | first\_order |
| 2 | Ipopt | 1.123667e6 | 628 | 37024 | 7 | 6.6782e-29 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (tron) | 345688.0 | 426 | 22288 | 6 | 2.4602e-17 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (trunk) | 135542.0 | 168 | 9104 | 9 | 3.5039e-21 | true | ok | NaN | NaN | first\_order |
| 2 | LeastSquaresOptim (Dogleg) | 53062.0 | 133 | 313920 | 6 | 1.5038e-30 | true | ok | NaN | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 72375.5 | 183 | 469712 | 9 | 2.0155e-26 | true | ok | NaN | NaN | converged |
| 2 | MadNLP | 534520.5 | 613 | 53232 | 7 | 3.8795e-18 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 90520.5 | 283 | 37184 | 13 | 1.5071e-27 | true | ok | NaN | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 52645.5 | 163 | 373328 | 7 | 2.1940e-30 | true | ok | NaN | NaN | Success |
| 2 | Optim (Newton) | 17354.0 | 103 | 5136 | 5 | 4.4889e-28 | true | ok | NaN | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 42479.5 | 225 | 28736 | 5 | 1.7269e-28 | true | ok | NaN | NaN | converged |
| 2 | SecondOrderOptimization | 56708.5 | 498 | 24304 | 5 | 4.7502e-28 | true | ok | NaN | NaN | grad\_tol |
| 3 | CaNNOLeS | 285312.5 | 209 | 111904 | 8 | 4.0949e-21 | true | ok | NaN | NaN | first\_order |
| 3 | Ipopt | 4.2149995e6 | 961 | 74544 | 13 | 1.1255e-21 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (tron) | 1.454375e6 | 529 | 29344 | 11 | 9.2596e-18 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (trunk) | 819125.0 | 279 | 16016 | 12 | 6.9391e-16 | true | ok | NaN | NaN | first\_order |
| 3 | LeastSquaresOptim (Dogleg) | 104104.5 | 197 | 489136 | 9 | 9.8608e-31 | true | ok | NaN | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 128271.0 | 212 | 544128 | 10 | 1.4712e-24 | true | ok | NaN | NaN | converged |
| 3 | MadNLP | 1.087729e6 | 653 | 62928 | 12 | 6.5053e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 246083.0 | 350 | 112048 | 20 | 4.5709e-27 | true | ok | NaN | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 148187.0 | 244 | 584384 | 10 | 1.2079e-30 | true | ok | NaN | NaN | Success |
| 3 | Optim (Newton) | 40458.5 | 142 | 8720 | 8 | 4.0949e-21 | true | ok | NaN | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 158542.0 | 317 | 95216 | 8 | 2.9832e-20 | true | ok | NaN | NaN | converged |
| 3 | SecondOrderOptimization | 135521.0 | 934 | 54272 | 8 | 4.0880e-21 | true | ok | NaN | NaN | grad\_tol |
| 4 | CaNNOLeS | 1.071417e6 | 229 | 297424 | 13 | 7.8147e-29 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 1.59246035e7 | 1196 | 126752 | 17 | 6.6166e-01 | false | local_minimum | NaN | NaN | first\_order; claimed convergence at cost 6.616581e-01, above the reference 0.000000e+00; predicted reduction / cost 9.76e-19 |
| 4 | JSOSolvers (tron) | 8.0614375e6 | 941 | 51728 | 23 | 5.5821e-17 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 2.847625e6 | 562 | 37600 | 11 | 8.8234e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4 | LeastSquaresOptim (Dogleg) | 344187.0 | 354 | 918512 | 22 | 5.4974e-30 | true | ok | NaN | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 527249.5 | 459 | 1317152 | 23 | 1.9064e-27 | true | ok | NaN | NaN | converged |
| 4 | MadNLP | 1.2939375e6 | 629 | 82400 | 9 | 7.2952e-21 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 1.2447084e7 | 5670 | 4674048 | 500 | 1.0115e+00 | false | not_converged | NaN | NaN | MaxIters |
| 4 | NonlinearSolve (TrustRegion) | 354146.0 | 146 | 42928 | 17 | 4.4272e-27 | true | ok | NaN | NaN | Success |
| 4 | Optim (Newton) | 151437.0 | 332 | 19872 | 19 | 3.9813e-23 | true | ok | NaN | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 485417.0 | 718 | 447392 | 10 | 7.5510e-20 | true | ok | NaN | NaN | converged |
| 4 | SecondOrderOptimization | 336688.0 | 2104 | 129632 | 14 | 2.6685e-19 | true | ok | NaN | NaN | grad\_tol |
| 6 | CaNNOLeS | 3.1503335e6 | 221 | 1428624 | 7 | 1.3780e-29 | true | ok | NaN | NaN | first\_order |
| 6 | Ipopt | 7.7104917e7 | 696 | 313504 | 8 | 9.0350e-22 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (tron) | 2.07464375e7 | 637 | 45264 | 9 | 7.5733e-19 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (trunk) | 1.6002875e7 | 453 | 32480 | 13 | 2.5969e-17 | true | ok | NaN | NaN | first\_order |
| 6 | LeastSquaresOptim (Dogleg) | 802104.0 | 178 | 562288 | 8 | 1.3460e-29 | true | ok | NaN | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 1.1715e6 | 212 | 704992 | 10 | 1.4850e-24 | true | ok | NaN | NaN | converged |
| 6 | MadNLP | 9.1162915e6 | 709 | 189696 | 16 | 2.3163e-17 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 1.1792917e7 | 1525 | 3824304 | 123 | 4.2228e-25 | true | ok | NaN | NaN | StalledSuccess |
| 6 | NonlinearSolve (TrustRegion) | 976020.5 | 146 | 141568 | 10 | 2.0021e-27 | true | ok | NaN | NaN | Success |
| 6 | Optim (Newton) | 235895.5 | 131 | 36672 | 7 | 2.3789e-29 | true | ok | NaN | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 1.6345415e6 | 515 | 1019680 | 9 | 2.3173e-29 | true | ok | NaN | NaN | converged |
| 6 | SecondOrderOptimization | 452271.0 | 1468 | 290352 | 7 | 1.6073e-29 | true | ok | NaN | NaN | grad\_tol |
| 8 | CaNNOLeS | 1.04539585e7 | 245 | 4084336 | 6 | 6.6035e-26 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 4.931633125e8 | 854 | 1044640 | 10 | 4.5295e-20 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 8.59710835e7 | 895 | 67760 | 10 | 3.0659e-17 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 5.13527085e7 | 523 | 43360 | 12 | 4.1907e-17 | true | ok | NaN | NaN | first\_order |
| 8 | LeastSquaresOptim (Dogleg) | 2.466354e6 | 162 | 665360 | 7 | 4.7233e-29 | true | ok | NaN | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 4.204709e6 | 196 | 859424 | 9 | 6.0110e-22 | true | ok | NaN | NaN | converged |
| 8 | MadNLP | 2.5288959e7 | 723 | 458224 | 14 | 4.2442e-19 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 3.5542125e7 | 1766 | 7727728 | 122 | 1.6391e-25 | true | ok | NaN | NaN | StalledSuccess |
| 8 | NonlinearSolve (TrustRegion) | 3.2709165e6 | 155 | 386624 | 12 | 1.9505e-28 | true | ok | NaN | NaN | Success |
| 8 | Optim (Newton) | 574792.0 | 118 | 107984 | 6 | 6.7141e-26 | true | ok | NaN | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 3.384104e6 | 327 | 1799136 | 7 | 4.1908e-29 | true | ok | NaN | NaN | converged |
| 8 | SecondOrderOptimization | 941292.0 | 1667 | 767536 | 6 | 6.9665e-26 | true | ok | NaN | NaN | grad\_tol |
| 12 | CaNNOLeS | 7.5069459e7 | 254 | 18123264 | 6 | 2.0382e-28 | true | ok | NaN | NaN | first\_order |
| 12 | Ipopt | 7.475638333e9 | 1157 | 3980256 | 13 | 3.4597e-18 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (tron) | 4.02323875e8 | 897 | 102704 | 9 | 2.5772e-17 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 3.34054041e8 | 981 | 97856 | 14 | 6.4735e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 12 | LeastSquaresOptim (Dogleg) | 2.12680415e7 | 169 | 1471376 | 7 | 1.9150e-28 | true | ok | NaN | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 3.7226667e7 | 225 | 1978496 | 10 | 5.6485e-24 | true | ok | NaN | NaN | converged |
| 12 | MadNLP | 2.03276875e8 | 709 | 1769408 | 16 | 1.9061e-28 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 2.13927625e8 | 1831 | 18021936 | 127 | 3.1165e-24 | true | ok | NaN | NaN | StalledSuccess |
| 12 | NonlinearSolve (TrustRegion) | 3.199725e7 | 155 | 1722592 | 9 | 2.4326e-28 | true | ok | NaN | NaN | Success |
| 12 | Optim (Newton) | 3.7796875e6 | 118 | 409360 | 6 | 1.4870e-28 | true | ok | NaN | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 2.32379795e7 | 582 | 14093888 | 9 | 6.1724e-24 | true | ok | NaN | NaN | converged |
| 12 | SecondOrderOptimization | 5.0545835e6 | 2395 | 3406288 | 6 | 1.9337e-28 | true | ok | NaN | NaN | grad\_tol |
| 16 | CaNNOLeS | 3.58443542e8 | 266 | 58078400 | 6 | 4.2658e-16 | true | ok | NaN | NaN | first\_order |
| 16 | Ipopt | 3.596668725e10 | 526 | 14113184 | 4 | 2.1429e+02 | false | timeout | NaN | NaN | max\_time |
| 16 | JSOSolvers (tron) | 2.771443625e9 | 1800 | 188976 | 12 | 2.3879e-17 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 2.268428e9 | 1424 | 144528 | 19 | 7.0362e-17 | true | ok | NaN | NaN | first\_order |
| 16 | LeastSquaresOptim (Dogleg) | 1.17090375e8 | 217 | 3399728 | 10 | 5.7745e-28 | true | ok | NaN | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 1.861051875e8 | 291 | 4572064 | 12 | 2.3286e-21 | true | ok | NaN | NaN | converged |
| 16 | MadNLP | 1.384172708e9 | 844 | 5223760 | 23 | 5.5006e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 8.5985875e8 | 2100 | 35660464 | 127 | 1.7845e-23 | true | ok | NaN | NaN | StalledSuccess |
| 16 | NonlinearSolve (TrustRegion) | 4.23113958e8 | 174 | 5204048 | 19 | 1.2535e-27 | true | ok | NaN | NaN | Success |
| 16 | Optim (Newton) | 1.891175e7 | 139 | 1239776 | 7 | 5.6759e-28 | true | ok | NaN | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 1.39650604e8 | 1300 | 88756464 | 14 | 6.0913e-20 | true | ok | NaN | NaN | converged |
| 16 | SecondOrderOptimization | 2.2267229e7 | 3560 | 10325408 | 7 | 6.0348e-28 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 20 | CaNNOLeS | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | Ipopt | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 16 |
| 20 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | LeastSquaresOptim (Dogleg) | 2.82888125e8 | 187 | 11517200 | 7 | 7.5967e-28 | true | ok | NaN | NaN | converged |
| 20 | LeastSquaresOptim (LM) | 6.05372521e8 | 269 | 8819200 | 11 | 3.6633e-26 | true | ok | NaN | NaN | converged |
| 20 | MadNLP | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | NonlinearSolve (LM) | 2.689597167e9 | 2070 | 64038608 | 125 | 3.5498e-24 | true | ok | NaN | NaN | StalledSuccess |
| 20 | NonlinearSolve (TrustRegion) | 6.021680415e8 | 174 | 12418128 | 8 | 2.5047e-26 | true | ok | NaN | NaN | Success |
| 20 | Optim (Newton) | 5.39975415e7 | 126 | 2886544 | 6 | 2.1895e-27 | true | ok | NaN | NaN | converged |
| 20 | Optim (NewtonTrustRegion) | 2.30153e8 | 667 | 98788688 | 9 | 3.6919e-22 | true | ok | NaN | NaN | converged |
| 20 | SecondOrderOptimization | 6.0144667e7 | 3860 | 24664304 | 6 | 2.6565e-27 | true | ok | NaN | NaN | grad\_tol |
| 24 | CaNNOLeS | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | Ipopt | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 16 |
| 24 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | LeastSquaresOptim (Dogleg) | 7.69877771e8 | 187 | 12781040 | 7 | 1.6637e-27 | true | ok | NaN | NaN | converged |
| 24 | LeastSquaresOptim (LM) | 1.517822959e9 | 269 | 16594784 | 11 | 8.7592e-26 | true | ok | NaN | NaN | converged |
| 24 | MadNLP | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | NonlinearSolve (LM) | 8.149985166e9 | 2101 | 106891840 | 127 | 8.1325e-24 | true | ok | NaN | NaN | StalledSuccess |
| 24 | NonlinearSolve (TrustRegion) | 2.188470834e9 | 174 | 25564752 | 14 | 1.7749e-27 | true | ok | NaN | NaN | Success |
| 24 | Optim (Newton) | 1.51958125e8 | 126 | 5816240 | 6 | 4.3497e-22 | true | ok | NaN | NaN | converged |
| 24 | Optim (NewtonTrustRegion) | 6.582287505e8 | 855 | 265259232 | 10 | 7.3913e-20 | true | ok | NaN | NaN | converged |
| 24 | SecondOrderOptimization | 1.63313083e8 | 4588 | 50328832 | 6 | 4.4028e-22 | true | ok | NaN | NaN | grad\_tol |
| 28 | CaNNOLeS | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | Ipopt | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 16 |
| 28 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | LeastSquaresOptim (Dogleg) | 1.872962833e9 | 187 | 22652512 | 7 | 2.6407e-27 | true | ok | NaN | NaN | converged |
| 28 | LeastSquaresOptim (LM) | 3.544648708e9 | 269 | 29149200 | 11 | 2.2506e-21 | true | ok | NaN | NaN | converged |
| 28 | MadNLP | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | NonlinearSolve (LM) | 1.7039318916e10 | 2071 | 169690080 | 125 | 1.9733e-23 | true | ok | NaN | NaN | StalledSuccess |
| 28 | NonlinearSolve (TrustRegion) | 5.387840375e9 | 174 | 46452304 | 14 | 2.3607e-27 | true | ok | NaN | NaN | Success |
| 28 | Optim (Newton) | 3.72346667e8 | 126 | 10618384 | 6 | 6.4248e-20 | true | ok | NaN | NaN | converged |
| 28 | Optim (NewtonTrustRegion) | 2.151965542e9 | 855 | 484036832 | 10 | 1.5928e-21 | true | ok | NaN | NaN | converged |
| 28 | SecondOrderOptimization | 3.72130708e8 | 5316 | 92490352 | 6 | 6.4925e-20 | true | ok | NaN | NaN | grad\_tol |
| 32 | CaNNOLeS | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | Ipopt | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 16 |
| 32 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | LeastSquaresOptim (Dogleg) | 4.422873416e9 | 187 | 37443392 | 7 | 3.3187e-27 | true | ok | NaN | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 8.037993208e9 | 269 | 47911280 | 11 | 4.0985e-22 | true | ok | NaN | NaN | converged |
| 32 | MadNLP | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | NonlinearSolve (LM) | 3.0102967833e10 | 1711 | 241264992 | 101 | 1.5941e-23 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 32 | NonlinearSolve (TrustRegion) | 9.642255542e9 | 174 | 78668368 | 9 | 6.8347e-27 | true | ok | NaN | NaN | Success |
| 32 | Optim (Newton) | 9.35365104e8 | 126 | 17951376 | 6 | 4.1167e-27 | true | ok | NaN | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 3.951164958e9 | 952 | 916702736 | 11 | 3.7936e-27 | true | ok | NaN | NaN | converged |
| 32 | SecondOrderOptimization | 1.024079417e9 | 6044 | 156759008 | 6 | 4.6164e-27 | true | ok | NaN | NaN | grad\_tol |
