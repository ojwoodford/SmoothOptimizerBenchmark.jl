# Benchmark Results: Ill-Conditioned Polynomial Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-18T02:26:06
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 3b3f450
- **Dependency Commits**: OptimizationVariableInterface cd7c159, SecondOrderOptimization 741d209, NLLSModel ebf8f1d

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 60 | NLLSModel (Static) | 179.20353982300884 | 1 | 16 | 15417.0 | 1 | 32 |
| 60 | Standalone | 236.4625 | 1 | 16 | 1419.642857142857 | 1 | 32 |
| 100 | NLLSModel (Static) | 300.87012987012986 | 1 | 16 | 24917.0 | 1 | 32 |
| 100 | Standalone | 340.1639344262295 | 1 | 16 | 2145.8 | 1 | 32 |
| 160 | NLLSModel (Static) | 406.25 | 1 | 16 | 41209.0 | 1 | 32 |
| 160 | Standalone | 482.8974358974359 | 1 | 16 | 3577.4285714285716 | 1 | 32 |
| 250 | NLLSModel (Static) | 584.625 | 1 | 16 | 62209.0 | 1 | 32 |
| 250 | Standalone | 730.6785714285714 | 1 | 16 | 5166.5 | 1 | 32 |
| 400 | NLLSModel (Static) | 907.6086956521739 | 1 | 16 | 99333.0 | 1 | 32 |
| 400 | Standalone | 1118.0555555555557 | 1 | 16 | 8458.333333333334 | 1 | 32 |
| 640 | NLLSModel (Static) | 1427.7333333333333 | 1 | 16 | 159084.0 | 1 | 32 |
| 640 | Standalone | 1812.5 | 1 | 16 | 13958.0 | 1 | 32 |
| 1000 | NLLSModel (Static) | 2244.75 | 1 | 16 | 249625.0 | 1 | 32 |
| 1000 | Standalone | 3244.0 | 1 | 16 | 21542.0 | 1 | 32 |
| 1600 | NLLSModel (Static) | 3583.3333333333335 | 1 | 16 | 428334.0 | 1 | 32 |
| 1600 | Standalone | 5448.0 | 1 | 16 | 34583.0 | 1 | 32 |
| 2500 | NLLSModel (Static) | 5597.333333333333 | 1 | 16 | 663042.0 | 1 | 32 |
| 2500 | Standalone | 7986.0 | 1 | 16 | 54750.0 | 1 | 32 |
| 4000 | NLLSModel (Static) | 9291.666666666666 | 1 | 16 | 1.010833e6 | 1 | 32 |
| 4000 | Standalone | 12750.0 | 1 | 16 | 87375.0 | 1 | 32 |
| 6400 | NLLSModel (Static) | 13917.0 | 1 | 16 | 1.703458e6 | 1 | 32 |
| 6400 | Standalone | 19500.0 | 1 | 16 | 136542.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 60 | SecondOrderOptimization (LM) | 2.9848955e6 | 32 | 8128 | 184 | 1.0545e+00 | true | ok | 1.2285e-06 | step\_size |
| 60 | SecondOrderOptimization (LM, tall) | 296770.5 | 108 | 57216 | 19 | 1.0545e+00 | true | ok | 3.2350e-15 | rel\_dcost |
| 60 | LeastSquaresOptim (LM) | 4.671354e6 | 7850 | 22366432 | 412 | 1.0545e+00 | true | ok | 1.0311e-06 | converged |
| 60 | LeastSquaresOptim (Dogleg) | 219979.0 | 444 | 1203808 | 22 | 1.0545e+00 | true | ok | 4.2511e-15 | converged |
| 100 | SecondOrderOptimization (LM) | 1.2992166e7 | 32 | 8128 | 500 | 1.7527e+00 | false | not_converged | 1.7567e-04 | max\_iters |
| 100 | SecondOrderOptimization (LM, tall) | 437812.5 | 108 | 85312 | 18 | 1.7526e+00 | true | ok | 2.8196e-13 | rel\_dcost |
| 100 | LeastSquaresOptim (LM) | 5.8468335e6 | 7698 | 21937568 | 404 | 1.7526e+00 | true | ok | 1.5834e-06 | converged |
| 100 | LeastSquaresOptim (Dogleg) | 344646.0 | 583 | 1268080 | 53 | 1.7526e+00 | true | ok | 8.8155e-15 | converged |
| 160 | SecondOrderOptimization (LM) | 2.0630625e7 | 32 | 8128 | 500 | 2.7056e+00 | false | not_converged | 4.1596e-04 | max\_iters |
| 160 | SecondOrderOptimization (LM, tall) | 650146.0 | 108 | 130912 | 18 | 2.7052e+00 | true | ok | 6.6297e-13 | step\_size |
| 160 | LeastSquaresOptim (LM) | 8.4885625e6 | 7964 | 22704704 | 418 | 2.7052e+00 | true | ok | 1.8097e-06 | converged |
| 160 | LeastSquaresOptim (Dogleg) | 451167.0 | 444 | 1219568 | 22 | 2.7052e+00 | true | ok | 3.1598e-15 | converged |
| 250 | SecondOrderOptimization (LM) | 2.5453584e7 | 32 | 8128 | 395 | 4.0894e+00 | true | ok | 4.9551e-06 | step\_size |
| 250 | SecondOrderOptimization (LM, tall) | 962416.5 | 108 | 182688 | 18 | 4.0894e+00 | true | ok | 1.4291e-12 | step\_size |
| 250 | LeastSquaresOptim (LM) | 1.3043417e7 | 8003 | 22827952 | 420 | 4.0894e+00 | true | ok | 2.5900e-06 | converged |
| 250 | LeastSquaresOptim (Dogleg) | 772541.0 | 643 | 1289792 | 68 | 4.0894e+00 | true | ok | 6.0239e-14 | converged |
| 400 | SecondOrderOptimization (LM) | 6.1762292e7 | 32 | 8128 | 500 | 6.7699e+00 | false | not_converged | 3.9986e-01 | max\_iters |
| 400 | SecondOrderOptimization (LM, tall) | 1.533354e6 | 118 | 296832 | 18 | 6.3701e+00 | true | ok | 2.6477e-12 | step\_size |
| 400 | LeastSquaresOptim (LM) | 1.9553833e7 | 8005 | 22848528 | 420 | 6.3701e+00 | true | ok | 5.4556e-06 | converged |
| 400 | LeastSquaresOptim (Dogleg) | 1.2208125e6 | 642 | 1314896 | 67 | 6.3701e+00 | true | ok | 2.6130e-14 | converged |
| 640 | SecondOrderOptimization (LM) | 8.2259042e7 | 32 | 8128 | 500 | 1.0004e+01 | false | not_converged | 1.4004e-04 | max\_iters |
| 640 | SecondOrderOptimization (LM, tall) | 2.331208e6 | 118 | 478080 | 18 | 1.0004e+01 | true | ok | 5.3132e-15 | rel\_dcost |
| 640 | LeastSquaresOptim (LM) | 3.2818563e7 | 8328 | 23809280 | 437 | 1.0004e+01 | true | ok | 5.5200e-06 | converged |
| 640 | LeastSquaresOptim (Dogleg) | 1.7114165e6 | 466 | 1346640 | 23 | 1.0004e+01 | true | ok | 4.3331e-14 | converged |
| 1000 | SecondOrderOptimization (LM) | 1.29763083e8 | 32 | 8128 | 500 | 1.7238e+01 | false | not_converged | 1.7922e+00 | max\_iters |
| 1000 | SecondOrderOptimization (LM, tall) | 3.619979e6 | 118 | 686976 | 18 | 1.5446e+01 | true | ok | 8.2215e-12 | step\_size |
| 1000 | LeastSquaresOptim (LM) | 5.1294042e7 | 8537 | 24447056 | 448 | 1.5446e+01 | true | ok | 6.4693e-06 | converged |
| 1000 | LeastSquaresOptim (Dogleg) | 2.5967915e6 | 466 | 1388624 | 23 | 1.5446e+01 | true | ok | 7.5799e-14 | converged |
| 1600 | SecondOrderOptimization (LM) | 1.12924667e8 | 32 | 8128 | 273 | 2.4510e+01 | true | ok | 1.4460e-05 | rel\_dcost |
| 1600 | SecondOrderOptimization (LM, tall) | 5.862375e6 | 118 | 1076096 | 18 | 2.4510e+01 | true | ok | 2.1187e-13 | rel\_dcost |
| 1600 | LeastSquaresOptim (LM) | 8.6536417e7 | 8670 | 24927200 | 455 | 2.4510e+01 | true | ok | 8.7234e-06 | converged |
| 1600 | LeastSquaresOptim (Dogleg) | 4.383604e6 | 466 | 1472592 | 23 | 2.4510e+01 | true | ok | 2.4976e-13 | converged |
| 2500 | SecondOrderOptimization (LM) | 3.45094667e8 | 32 | 8128 | 500 | 3.8105e+01 | false | not_converged | 1.2276e-04 | max\_iters |
| 2500 | SecondOrderOptimization (LM, tall) | 9.263958e6 | 118 | 1710976 | 18 | 3.8104e+01 | true | ok | 3.3962e-13 | rel\_dcost |
| 2500 | LeastSquaresOptim (LM) | 1.40915459e8 | 8784 | 25369472 | 461 | 3.8104e+01 | true | ok | 1.1528e-05 | converged |
| 2500 | LeastSquaresOptim (Dogleg) | 7.4573125e6 | 582 | 1609424 | 52 | 3.8104e+01 | true | ok | 7.0929e-13 | converged |
| 4000 | SecondOrderOptimization (LM) | 5.64640375e8 | 32 | 8128 | 500 | 1.8781e+02 | false | not_converged | 1.2705e+02 | max\_iters |
| 4000 | SecondOrderOptimization (LM, tall) | 1.4902917e7 | 118 | 2669440 | 18 | 6.0759e+01 | true | ok | 4.2541e-13 | rel\_dcost |
| 4000 | LeastSquaresOptim (LM) | 2.37673708e8 | 8708 | 25353152 | 457 | 6.0759e+01 | true | ok | 2.2332e-05 | converged |
| 4000 | LeastSquaresOptim (Dogleg) | 1.2224333e7 | 485 | 1860672 | 24 | 6.0759e+01 | true | ok | 3.6547e-13 | converged |
| 6400 | SecondOrderOptimization (LM) | 1.1672195e9 | 32 | 8128 | 500 | 1.2581e+02 | false | not_converged | 2.8805e+01 | max\_iters |
| 6400 | SecondOrderOptimization (LM, tall) | 2.5353917e7 | 118 | 4324224 | 18 | 9.7005e+01 | true | ok | 6.3387e-11 | rel\_dcost, step\_size |
| 6400 | LeastSquaresOptim (LM) | 3.90695417e8 | 8803 | 25984880 | 462 | 9.7005e+01 | true | ok | 3.0364e-05 | converged |
| 6400 | LeastSquaresOptim (Dogleg) | 1.95698545e7 | 485 | 2221120 | 24 | 9.7005e+01 | true | ok | 4.2739e-13 | converged |
