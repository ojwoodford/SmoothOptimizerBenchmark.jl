# Benchmark Results: Ill-Conditioned Polynomial Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-15T03:32:44
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: ebfe8ef
- **Dependency Commits**: BlockLinearSystems d38552c, OptimizationVariableInterface f130043, SecondOrderOptimization a24c8fc, NLLSModel fe5c3b1

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 60 | NLLSModel (Static) | 191.58928571428572 | 1 | 16 | 15000.0 | 1 | 32 |
| 60 | Standalone | 242.1875 | 1 | 16 | 1422.642857142857 | 1 | 32 |
| 100 | NLLSModel (Static) | 265.68831168831167 | 1 | 16 | 25041.0 | 1 | 32 |
| 100 | Standalone | 329.2295081967213 | 1 | 16 | 2158.3 | 1 | 32 |
| 160 | NLLSModel (Static) | 394.2307692307692 | 1 | 16 | 39708.0 | 1 | 32 |
| 160 | Standalone | 499.0 | 1 | 16 | 3333.3333333333335 | 1 | 32 |
| 250 | NLLSModel (Static) | 586.8857142857142 | 1 | 16 | 62000.0 | 1 | 32 |
| 250 | Standalone | 727.6785714285714 | 1 | 16 | 5177.0 | 1 | 32 |
| 400 | NLLSModel (Static) | 907.6086956521739 | 1 | 16 | 99042.0 | 1 | 32 |
| 400 | Standalone | 1118.0555555555557 | 1 | 16 | 8319.333333333334 | 1 | 32 |
| 640 | NLLSModel (Static) | 1419.4 | 1 | 16 | 158834.0 | 1 | 32 |
| 640 | Standalone | 1822.9166666666667 | 1 | 16 | 15125.0 | 1 | 32 |
| 1000 | NLLSModel (Static) | 2254.5555555555557 | 1 | 16 | 248667.0 | 1 | 32 |
| 1000 | Standalone | 3012.0 | 1 | 16 | 21458.0 | 1 | 32 |
| 1600 | NLLSModel (Static) | 3819.5 | 1 | 16 | 397333.0 | 1 | 32 |
| 1600 | Standalone | 4908.4 | 1 | 16 | 34625.0 | 1 | 32 |
| 2500 | NLLSModel (Static) | 5562.5 | 1 | 16 | 625291.0 | 1 | 32 |
| 2500 | Standalone | 7666.666666666667 | 1 | 16 | 52791.0 | 1 | 32 |
| 4000 | NLLSModel (Static) | 8722.333333333334 | 1 | 16 | 1.006708e6 | 1 | 32 |
| 4000 | Standalone | 12208.0 | 1 | 16 | 84250.0 | 1 | 32 |
| 6400 | NLLSModel (Static) | 13875.0 | 1 | 16 | 1.595667e6 | 1 | 32 |
| 6400 | Standalone | 19500.0 | 1 | 16 | 135041.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 60 | SecondOrderOptimization (LM) | 2.927146e6 | 32 | 8128 | 184 | 1.0545e+00 | true | ok | 1.2285e-06 | step\_size |
| 60 | SecondOrderOptimization (LM, tall) | 291687.5 | 114 | 57312 | 19 | 1.0545e+00 | true | ok | 3.2350e-15 | rel\_dcost |
| 60 | LeastSquaresOptim (LM) | 4.9410205e6 | 7850 | 22366432 | 412 | 1.0545e+00 | true | ok | 1.0311e-06 | converged |
| 60 | LeastSquaresOptim (Dogleg) | 233583.5 | 444 | 1203808 | 22 | 1.0545e+00 | true | ok | 4.2511e-15 | converged |
| 100 | SecondOrderOptimization (LM) | 1.2699417e7 | 32 | 8128 | 500 | 1.7527e+00 | false | not_converged | 1.7567e-04 | max\_iters |
| 100 | SecondOrderOptimization (LM, tall) | 417854.5 | 114 | 85408 | 18 | 1.7526e+00 | true | ok | 2.8196e-13 | rel\_dcost |
| 100 | LeastSquaresOptim (LM) | 6.047458e6 | 7698 | 21937568 | 404 | 1.7526e+00 | true | ok | 1.5834e-06 | converged |
| 100 | LeastSquaresOptim (Dogleg) | 354208.5 | 583 | 1268080 | 53 | 1.7526e+00 | true | ok | 8.8155e-15 | converged |
| 160 | SecondOrderOptimization (LM) | 2.1075459e7 | 32 | 8128 | 500 | 2.7056e+00 | false | not_converged | 4.1596e-04 | max\_iters |
| 160 | SecondOrderOptimization (LM, tall) | 639667.0 | 114 | 131008 | 18 | 2.7052e+00 | true | ok | 6.6297e-13 | step\_size |
| 160 | LeastSquaresOptim (LM) | 9.1597295e6 | 7964 | 22704704 | 418 | 2.7052e+00 | true | ok | 1.8097e-06 | converged |
| 160 | LeastSquaresOptim (Dogleg) | 471813.0 | 444 | 1219568 | 22 | 2.7052e+00 | true | ok | 3.1598e-15 | converged |
| 250 | SecondOrderOptimization (LM) | 2.4020354e7 | 32 | 8128 | 382 | 4.0894e+00 | true | ok | 6.9489e-06 | rel\_dcost |
| 250 | SecondOrderOptimization (LM, tall) | 943104.0 | 114 | 182784 | 18 | 4.0894e+00 | true | ok | 1.4291e-12 | step\_size |
| 250 | LeastSquaresOptim (LM) | 1.3381375e7 | 8003 | 22827952 | 420 | 4.0894e+00 | true | ok | 2.5900e-06 | converged |
| 250 | LeastSquaresOptim (Dogleg) | 772271.0 | 643 | 1289792 | 68 | 4.0894e+00 | true | ok | 6.0239e-14 | converged |
| 400 | SecondOrderOptimization (LM) | 7.4755958e7 | 32 | 8128 | 500 | 6.7699e+00 | false | not_converged | 3.9986e-01 | max\_iters |
| 400 | SecondOrderOptimization (LM, tall) | 1.4502705e6 | 124 | 296928 | 18 | 6.3701e+00 | true | ok | 2.6477e-12 | step\_size |
| 400 | LeastSquaresOptim (LM) | 2.01119375e7 | 8005 | 22848528 | 420 | 6.3701e+00 | true | ok | 5.4556e-06 | converged |
| 400 | LeastSquaresOptim (Dogleg) | 1.1885415e6 | 642 | 1314896 | 67 | 6.3701e+00 | true | ok | 2.6130e-14 | converged |
| 640 | SecondOrderOptimization (LM) | 8.0146666e7 | 32 | 8128 | 500 | 1.0004e+01 | false | not_converged | 1.4004e-04 | max\_iters |
| 640 | SecondOrderOptimization (LM, tall) | 2.257771e6 | 124 | 478176 | 18 | 1.0004e+01 | true | ok | 5.3132e-15 | rel\_dcost |
| 640 | LeastSquaresOptim (LM) | 3.27834165e7 | 8328 | 23809280 | 437 | 1.0004e+01 | true | ok | 5.5200e-06 | converged |
| 640 | LeastSquaresOptim (Dogleg) | 1.679083e6 | 466 | 1346640 | 23 | 1.0004e+01 | true | ok | 4.3331e-14 | converged |
| 1000 | SecondOrderOptimization (LM) | 1.27505125e8 | 32 | 8128 | 500 | 1.7238e+01 | false | not_converged | 1.7922e+00 | max\_iters |
| 1000 | SecondOrderOptimization (LM, tall) | 3.5297295e6 | 124 | 687072 | 18 | 1.5446e+01 | true | ok | 8.2215e-12 | step\_size |
| 1000 | LeastSquaresOptim (LM) | 5.1230083e7 | 8537 | 24447056 | 448 | 1.5446e+01 | true | ok | 6.4693e-06 | converged |
| 1000 | LeastSquaresOptim (Dogleg) | 2.5825205e6 | 466 | 1388624 | 23 | 1.5446e+01 | true | ok | 7.5799e-14 | converged |
| 1600 | SecondOrderOptimization (LM) | 1.115110625e8 | 32 | 8128 | 273 | 2.4510e+01 | true | ok | 1.4460e-05 | rel\_dcost |
| 1600 | SecondOrderOptimization (LM, tall) | 5.719187e6 | 124 | 1076192 | 18 | 2.4510e+01 | true | ok | 2.1187e-13 | rel\_dcost |
| 1600 | LeastSquaresOptim (LM) | 8.5255625e7 | 8670 | 24927200 | 455 | 2.4510e+01 | true | ok | 8.7234e-06 | converged |
| 1600 | LeastSquaresOptim (Dogleg) | 4.3482705e6 | 466 | 1472592 | 23 | 2.4510e+01 | true | ok | 2.4976e-13 | converged |
| 2500 | SecondOrderOptimization (LM) | 3.41577541e8 | 32 | 8128 | 500 | 3.8105e+01 | false | not_converged | 1.2276e-04 | max\_iters |
| 2500 | SecondOrderOptimization (LM, tall) | 9.0103335e6 | 124 | 1711072 | 18 | 3.8104e+01 | true | ok | 3.3962e-13 | rel\_dcost |
| 2500 | LeastSquaresOptim (LM) | 1.38920333e8 | 8784 | 25369472 | 461 | 3.8104e+01 | true | ok | 1.1528e-05 | converged |
| 2500 | LeastSquaresOptim (Dogleg) | 7.4135e6 | 582 | 1609424 | 52 | 3.8104e+01 | true | ok | 7.0929e-13 | converged |
| 4000 | SecondOrderOptimization (LM) | 5.61334e8 | 32 | 8128 | 500 | 1.8781e+02 | false | not_converged | 1.2705e+02 | max\_iters |
| 4000 | SecondOrderOptimization (LM, tall) | 1.4590042e7 | 124 | 2669536 | 18 | 6.0759e+01 | true | ok | 4.2541e-13 | rel\_dcost |
| 4000 | LeastSquaresOptim (LM) | 2.342341665e8 | 8708 | 25353152 | 457 | 6.0759e+01 | true | ok | 2.2332e-05 | converged |
| 4000 | LeastSquaresOptim (Dogleg) | 1.20655e7 | 485 | 1860672 | 24 | 6.0759e+01 | true | ok | 3.6547e-13 | converged |
| 6400 | SecondOrderOptimization (LM) | 1.115016708e9 | 32 | 8128 | 500 | 1.2581e+02 | false | not_converged | 2.8805e+01 | max\_iters |
| 6400 | SecondOrderOptimization (LM, tall) | 2.3291771e7 | 124 | 4324320 | 18 | 9.7005e+01 | true | ok | 6.3387e-11 | rel\_dcost, step\_size |
| 6400 | LeastSquaresOptim (LM) | 3.7101475e8 | 8803 | 25984880 | 462 | 9.7005e+01 | true | ok | 3.0364e-05 | converged |
| 6400 | LeastSquaresOptim (Dogleg) | 1.98529785e7 | 485 | 2221120 | 24 | 9.7005e+01 | true | ok | 4.2739e-13 | converged |
