# Benchmark Results: Dense Conditioning Sweep

- **Category**: medium_dense
- **Scaling Metric**: Condition Number κ
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T16:42:13
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: fbb6630
- **Dependency Commits**: NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 1.0 | JuMP | 1.107666e6 | 2 | 32 | 1.7593541e7 | 5 | 128 |
| 1.0 | NLLSModel | 27750.0 | 1 | 16 | 980375.0 | 1 | 32 |
| 1.0 | Standalone | 76583.0 | 1 | 16 | 296209.0 | 1 | 32 |
| 10.0 | JuMP | 978625.0 | 2 | 32 | 1.71235e7 | 5 | 128 |
| 10.0 | NLLSModel | 28250.0 | 1 | 16 | 973542.0 | 1 | 32 |
| 10.0 | Standalone | 76541.0 | 1 | 16 | 296750.0 | 1 | 32 |
| 100.0 | JuMP | 986708.0 | 2 | 32 | 1.7645041e7 | 5 | 128 |
| 100.0 | NLLSModel | 28542.0 | 1 | 16 | 977291.0 | 1 | 32 |
| 100.0 | Standalone | 76542.0 | 1 | 16 | 314416.0 | 1 | 32 |
| 1000.0 | JuMP | 991625.0 | 2 | 32 | 1.7158083e7 | 5 | 128 |
| 1000.0 | NLLSModel | 27667.0 | 1 | 16 | 978291.0 | 1 | 32 |
| 1000.0 | Standalone | 76584.0 | 1 | 16 | 295125.0 | 1 | 32 |
| 10000.0 | JuMP | 971959.0 | 2 | 32 | 1.7365042e7 | 5 | 128 |
| 10000.0 | NLLSModel | 28250.0 | 1 | 16 | 963333.0 | 1 | 32 |
| 10000.0 | Standalone | 76583.0 | 1 | 16 | 297709.0 | 1 | 32 |
| 100000.0 | JuMP | 978667.0 | 2 | 32 | 1.72685e7 | 5 | 128 |
| 100000.0 | NLLSModel | 27750.0 | 1 | 16 | 966417.0 | 1 | 32 |
| 100000.0 | Standalone | 76500.0 | 1 | 16 | 294875.0 | 1 | 32 |
| 1.0e6 | JuMP | 1.013666e6 | 2 | 32 | 1.7495792e7 | 5 | 128 |
| 1.0e6 | NLLSModel | 28250.0 | 1 | 16 | 970250.0 | 1 | 32 |
| 1.0e6 | Standalone | 76500.0 | 1 | 16 | 305958.0 | 1 | 32 |
| 1.0e7 | JuMP | 990917.0 | 2 | 32 | 1.7618792e7 | 5 | 128 |
| 1.0e7 | NLLSModel | 31541.0 | 1 | 16 | 966083.0 | 1 | 32 |
| 1.0e7 | Standalone | 80833.0 | 1 | 16 | 298959.0 | 1 | 32 |
| 1.0e8 | JuMP | 1.076166e6 | 2 | 32 | 1.9231333e7 | 5 | 128 |
| 1.0e8 | NLLSModel | 28334.0 | 1 | 16 | 964959.0 | 1 | 32 |
| 1.0e8 | Standalone | 79750.0 | 1 | 16 | 294875.0 | 1 | 32 |
| 1.0e9 | JuMP | 1.140375e6 | 2 | 32 | 1.7489625e7 | 5 | 128 |
| 1.0e9 | NLLSModel | 28250.0 | 1 | 16 | 968042.0 | 1 | 32 |
| 1.0e9 | Standalone | 76708.0 | 1 | 16 | 295250.0 | 1 | 32 |
| 1.0e10 | JuMP | 985708.0 | 2 | 32 | 1.7386125e7 | 5 | 128 |
| 1.0e10 | NLLSModel | 28209.0 | 1 | 16 | 964459.0 | 1 | 32 |
| 1.0e10 | Standalone | 76500.0 | 1 | 16 | 295125.0 | 1 | 32 |
| 1.0e11 | JuMP | 989042.0 | 2 | 32 | 1.7388958e7 | 5 | 128 |
| 1.0e11 | NLLSModel | 28250.0 | 1 | 16 | 962959.0 | 1 | 32 |
| 1.0e11 | Standalone | 77959.0 | 1 | 16 | 295834.0 | 1 | 32 |
| 1.0e12 | JuMP | 984791.0 | 2 | 32 | 1.7360792e7 | 5 | 128 |
| 1.0e12 | NLLSModel | 28209.0 | 1 | 16 | 966083.0 | 1 | 32 |
| 1.0e12 | Standalone | 76542.0 | 1 | 16 | 294834.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 1.0 | CaNNOLeS | 1.89303335e7 | 241 | 8340464 | 3 | 6.2041e-23 | true | ok | NaN | 1.4886e-12 | first\_order |
| 1.0 | Ipopt | 2.43385e7 | 343 | 1931280 | 1 | 3.7140e-03 | false | above_reference | NaN | 1.1468e-02 | acceptable; claimed convergence at cost 3.713957e-03, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0 | JSOSolvers (tron) | 1.50318791e8 | 349 | 57232 | 6 | 9.6022e-18 | true | ok | NaN | 5.7068e-10 | first\_order |
| 1.0 | JSOSolvers (trunk) | 3.7468417e7 | 112 | 35840 | 7 | 2.5497e-17 | true | ok | NaN | 9.3280e-10 | first\_order |
| 1.0 | LeastSquaresOptim (Dogleg) | 9.132792e6 | 143 | 833392 | 6 | 6.0453e-30 | true | ok | NaN | 2.8927e-16 | converged |
| 1.0 | LeastSquaresOptim (LM) | 1.0541875e7 | 139 | 913952 | 6 | 1.5468e-25 | true | ok | NaN | 7.3733e-14 | converged |
| 1.0 | MadNLP | 5.32838755e7 | 605 | 810320 | 3 | 4.4602e-20 | true | ok | NaN | 3.9913e-11 | SOLVE\_SUCCEEDED |
| 1.0 | NonlinearSolve (LM) | 9.419167e6 | 297 | 2328352 | 9 | 1.8629e-26 | true | ok | NaN | 2.5643e-14 | Success |
| 1.0 | NonlinearSolve (TrustRegion) | 1.0370542e7 | 155 | 797808 | 11 | 5.4982e-27 | true | ok | NaN | 1.4027e-14 | Success |
| 1.0 | Optim (Newton) | 2.7449165e6 | 79 | 174352 | 3 | 6.2048e-23 | true | ok | NaN | 1.4887e-12 | converged |
| 1.0 | Optim (NewtonTrustRegion) | 7.729479e6 | 275 | 2524992 | 5 | 8.9458e-23 | true | ok | NaN | 1.7869e-12 | converged |
| 1.0 | SecondOrderOptimization | 7.09809165e7 | 21002 | 2650016 | 3 | 6.6986e-23 | true | ok | NaN | 1.5467e-12 | grad\_tol |
| 10.0 | CaNNOLeS | 1.83325e7 | 241 | 8340464 | 3 | 9.6746e-24 | true | ok | NaN | 1.4887e-12 | first\_order |
| 10.0 | Ipopt | 2.24693955e7 | 343 | 1931280 | 1 | 8.0118e-04 | false | above_reference | NaN | 1.1468e-02 | acceptable; claimed convergence at cost 8.011776e-04, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 10.0 | JSOSolvers (tron) | 1.698803955e8 | 387 | 59056 | 11 | 1.9556e-16 | true | ok | NaN | 2.1761e-08 | first\_order |
| 10.0 | JSOSolvers (trunk) | 1.47015834e8 | 243 | 42128 | 9 | 2.2300e-15 | true | ok | NaN | 7.6311e-08 | first\_order |
| 10.0 | LeastSquaresOptim (Dogleg) | 7.464625e6 | 124 | 751664 | 5 | 1.3465e-30 | true | ok | NaN | 5.7212e-16 | converged |
| 10.0 | LeastSquaresOptim (LM) | 1.04253335e7 | 139 | 913952 | 6 | 3.6693e-19 | true | ok | NaN | 9.5532e-10 | converged |
| 10.0 | MadNLP | 5.30844375e7 | 605 | 810320 | 3 | 6.6971e-19 | true | ok | NaN | 9.6983e-10 | SOLVE\_SUCCEEDED |
| 10.0 | NonlinearSolve (LM) | 1.0671625e7 | 310 | 2404112 | 10 | 2.4652e-26 | true | ok | NaN | 1.0029e-13 | Success |
| 10.0 | NonlinearSolve (TrustRegion) | 1.07660625e7 | 155 | 797808 | 11 | 1.7982e-27 | true | ok | NaN | 2.0565e-14 | Success |
| 10.0 | Optim (Newton) | 2.802313e6 | 79 | 174352 | 3 | 9.6736e-24 | true | ok | NaN | 1.4886e-12 | converged |
| 10.0 | Optim (NewtonTrustRegion) | 7.728833e6 | 347 | 3525696 | 5 | 3.1727e-22 | true | ok | NaN | 7.8174e-12 | converged |
| 10.0 | SecondOrderOptimization | 7.4015479e7 | 21002 | 2650016 | 3 | 1.1778e-23 | true | ok | NaN | 2.1666e-12 | grad\_tol |
| 100.0 | CaNNOLeS | 1.82559995e7 | 241 | 8340464 | 3 | 2.3298e-24 | true | ok | NaN | 1.4888e-12 | first\_order |
| 100.0 | Ipopt | 2.42802085e7 | 343 | 1931280 | 1 | 2.0119e-04 | false | above_reference | NaN | 1.1468e-02 | acceptable; claimed convergence at cost 2.011936e-04, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 100.0 | JSOSolvers (tron) | 4.58959334e8 | 846 | 81088 | 12 | 1.8452e-13 | true | ok | NaN | 6.8250e-06 | first\_order |
| 100.0 | JSOSolvers (trunk) | 4.725345e8 | 629 | 60656 | 9 | 2.1927e-13 | true | ok | NaN | 7.3102e-06 | first\_order |
| 100.0 | LeastSquaresOptim (Dogleg) | 7.4231455e6 | 124 | 751664 | 5 | 3.7993e-31 | true | ok | NaN | 1.7414e-15 | converged |
| 100.0 | LeastSquaresOptim (LM) | 1.57107915e7 | 196 | 1159136 | 9 | 5.1609e-19 | true | ok | NaN | 1.1760e-08 | converged |
| 100.0 | MadNLP | 7.0639104e7 | 613 | 810480 | 4 | 2.0205e-28 | true | ok | NaN | 2.0573e-13 | SOLVE\_SUCCEEDED |
| 100.0 | NonlinearSolve (LM) | 1.47854585e7 | 349 | 2631392 | 13 | 3.6256e-27 | true | ok | NaN | 2.6062e-13 | Success |
| 100.0 | NonlinearSolve (TrustRegion) | 1.0799625e7 | 155 | 797808 | 11 | 1.4531e-27 | true | ok | NaN | 3.9016e-14 | Success |
| 100.0 | Optim (Newton) | 2.7750205e6 | 79 | 174352 | 3 | 2.3301e-24 | true | ok | NaN | 1.4888e-12 | converged |
| 100.0 | Optim (NewtonTrustRegion) | 7.8115625e6 | 371 | 3859264 | 5 | 2.8740e-18 | true | ok | NaN | 7.6069e-10 | converged |
| 100.0 | SecondOrderOptimization | 8.4957416e7 | 21002 | 2650016 | 3 | 1.4100e-23 | true | ok | NaN | 5.0177e-11 | grad\_tol |
| 1000.0 | CaNNOLeS | 1.8314e7 | 241 | 8340464 | 3 | 6.7711e-25 | true | ok | NaN | 1.4900e-12 | first\_order |
| 1000.0 | Ipopt | 2.69855e7 | 343 | 1931280 | 1 | 5.8557e-05 | false | above_reference | NaN | 1.1468e-02 | acceptable; claimed convergence at cost 5.855653e-05, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1000.0 | JSOSolvers (tron) | 1.2379485e9 | 2038 | 138304 | 13 | 1.8837e-12 | true | ok | NaN | 1.8993e-04 | first\_order |
| 1000.0 | JSOSolvers (trunk) | 9.455830625e8 | 1348 | 95168 | 11 | 1.7283e-11 | true | ok | NaN | 5.6287e-04 | first\_order |
| 1000.0 | LeastSquaresOptim (Dogleg) | 7.479e6 | 124 | 751664 | 5 | 1.4328e-31 | true | ok | NaN | 9.4955e-15 | converged |
| 1000.0 | LeastSquaresOptim (LM) | 1.91348125e7 | 234 | 1322592 | 11 | 6.3326e-15 | true | ok | NaN | 1.2155e-05 | converged |
| 1000.0 | MadNLP | 7.0412563e7 | 613 | 810480 | 4 | 6.5948e-20 | true | ok | NaN | 1.8412e-08 | SOLVE\_SUCCEEDED |
| 1000.0 | NonlinearSolve (LM) | 2.00756665e7 | 401 | 2934432 | 17 | 4.9080e-28 | true | ok | NaN | 7.0426e-13 | Success |
| 1000.0 | NonlinearSolve (TrustRegion) | 1.1050458e7 | 155 | 797808 | 11 | 1.0967e-27 | true | ok | NaN | 7.3123e-14 | Success |
| 1000.0 | Optim (Newton) | 2.760792e6 | 79 | 174352 | 3 | 6.7722e-25 | true | ok | NaN | 1.4891e-12 | converged |
| 1000.0 | Optim (NewtonTrustRegion) | 7.814083e6 | 383 | 4026048 | 5 | 2.8412e-16 | true | ok | NaN | 7.8399e-09 | converged |
| 1000.0 | SecondOrderOptimization | 7.1435333e7 | 21002 | 2650016 | 3 | 3.8440e-20 | true | ok | NaN | 2.8295e-08 | grad\_tol |
| 10000.0 | CaNNOLeS | 1.8612021e7 | 241 | 8340464 | 3 | 2.6071e-25 | true | ok | NaN | 1.4704e-12 | first\_order |
| 10000.0 | Ipopt | 2.77493335e7 | 343 | 1931280 | 1 | 2.2465e-05 | false | above_reference | NaN | 1.1468e-02 | acceptable; claimed convergence at cost 2.246530e-05, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 10000.0 | JSOSolvers (tron) | 2.176502333e9 | 3354 | 201472 | 20 | 9.4396e-12 | true | ok | NaN | 2.8551e-03 | first\_order |
| 10000.0 | JSOSolvers (trunk) | 1.0001379585e9 | 1406 | 97952 | 11 | 1.5092e-10 | true | ok | NaN | 6.2768e-03 | first\_order |
| 10000.0 | LeastSquaresOptim (Dogleg) | 7.646687e6 | 124 | 751664 | 5 | 9.6852e-32 | true | ok | NaN | 7.8164e-14 | converged |
| 10000.0 | LeastSquaresOptim (LM) | 2.6271542e7 | 310 | 1649504 | 15 | 2.4871e-17 | true | ok | NaN | 7.8032e-06 | converged |
| 10000.0 | MadNLP | 7.09573335e7 | 613 | 810480 | 4 | 3.9184e-15 | true | ok | NaN | 1.2917e-05 | SOLVE\_SUCCEEDED |
| 10000.0 | NonlinearSolve (LM) | 2.35924375e7 | 440 | 3161712 | 20 | 1.8013e-26 | true | ok | NaN | 2.2894e-11 | Success |
| 10000.0 | NonlinearSolve (TrustRegion) | 1.3232812e7 | 155 | 797808 | 10 | 8.9795e-29 | true | ok | NaN | 7.1222e-14 | Success |
| 10000.0 | Optim (Newton) | 2.7942295e6 | 79 | 174352 | 3 | 2.6070e-25 | true | ok | NaN | 1.4897e-12 | converged |
| 10000.0 | Optim (NewtonTrustRegion) | 9.534917e6 | 490 | 5313680 | 6 | 1.2131e-26 | true | ok | NaN | 3.7817e-13 | converged |
| 10000.0 | SecondOrderOptimization | 7.8598708e7 | 21002 | 2650016 | 3 | 8.7891e-16 | true | ok | NaN | 3.0538e-05 | grad\_tol |
| 100000.0 | CaNNOLeS | 1.82856875e7 | 241 | 8340464 | 3 | 1.4045e-25 | true | ok | NaN | 1.7398e-12 | first\_order |
| 100000.0 | Ipopt | 2.70374795e7 | 343 | 1931280 | 1 | 1.2205e-05 | false | above_reference | NaN | 1.1468e-02 | acceptable; claimed convergence at cost 1.220495e-05, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 100000.0 | JSOSolvers (tron) | 1.90559325e9 | 3103 | 189424 | 23 | 1.3389e-11 | true | ok | NaN | 8.7674e-03 | first\_order |
| 100000.0 | JSOSolvers (trunk) | 1.008135417e9 | 1432 | 99200 | 13 | 2.8939e-10 | true | ok | NaN | 1.5010e-02 | first\_order |
| 100000.0 | LeastSquaresOptim (Dogleg) | 7.4617085e6 | 124 | 751664 | 5 | 6.2971e-32 | true | ok | NaN | 2.7188e-13 | converged |
| 100000.0 | LeastSquaresOptim (LM) | 3.31694585e7 | 386 | 1976416 | 19 | 1.0210e-17 | true | ok | NaN | 4.7517e-05 | converged |
| 100000.0 | MadNLP | 7.15645e7 | 613 | 810480 | 4 | 5.9902e-13 | true | ok | NaN | 4.2809e-03 | SOLVE\_SUCCEEDED |
| 100000.0 | NonlinearSolve (LM) | 2.96552085e7 | 492 | 3464752 | 24 | 1.5899e-28 | true | ok | NaN | 3.8478e-11 | Success |
| 100000.0 | NonlinearSolve (TrustRegion) | 1.51468125e7 | 155 | 797808 | 7 | 4.3164e-30 | true | ok | NaN | 2.7135e-13 | Success |
| 100000.0 | Optim (Newton) | 2.7831875e6 | 79 | 174352 | 3 | 1.4050e-25 | true | ok | NaN | 1.6657e-12 | converged |
| 100000.0 | Optim (NewtonTrustRegion) | 9.3484585e6 | 442 | 4646544 | 6 | 3.4609e-19 | true | ok | NaN | 6.2301e-10 | converged |
| 100000.0 | SecondOrderOptimization | 1.292263955e8 | 31446 | 3034720 | 5 | 4.5748e-18 | true | ok | NaN | 1.3011e-05 | grad\_tol |
| 1.0e6 | CaNNOLeS | 1.8518833e7 | 241 | 8340464 | 3 | 9.7590e-26 | true | ok | NaN | 4.3622e-11 | first\_order |
| 1.0e6 | Ipopt | 2.7287833e7 | 343 | 1931280 | 1 | 8.5850e-06 | false | above_reference | NaN | 1.1468e-02 | acceptable; claimed convergence at cost 8.585040e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e6 | JSOSolvers (tron) | 1.576039958e9 | 2555 | 163120 | 24 | 1.6041e-10 | true | ok | NaN | 2.2608e-02 | first\_order |
| 1.0e6 | JSOSolvers (trunk) | 9.109431875e8 | 1298 | 92768 | 14 | 4.7819e-10 | true | ok | NaN | 2.6445e-02 | first\_order |
| 1.0e6 | LeastSquaresOptim (Dogleg) | 7.5261045e6 | 124 | 751664 | 5 | 3.6952e-32 | true | ok | NaN | 1.8188e-12 | converged |
| 1.0e6 | LeastSquaresOptim (LM) | 4.3515042e7 | 500 | 2466784 | 25 | 1.6496e-15 | true | ok | NaN | 2.4100e-03 | converged |
| 1.0e6 | MadNLP | 7.22262705e7 | 613 | 810480 | 4 | 2.9523e-13 | true | ok | NaN | 5.5970e-03 | SOLVE\_SUCCEEDED |
| 1.0e6 | NonlinearSolve (LM) | 3.4233041e7 | 531 | 3692032 | 27 | 6.6420e-28 | true | ok | NaN | 4.0791e-09 | Success |
| 1.0e6 | NonlinearSolve (TrustRegion) | 1.5456312e7 | 155 | 797808 | 7 | 3.1810e-29 | true | ok | NaN | 2.1245e-12 | Success |
| 1.0e6 | Optim (Newton) | 2.7588335e6 | 79 | 174352 | 3 | 9.7583e-26 | true | ok | NaN | 4.4529e-11 | converged |
| 1.0e6 | Optim (NewtonTrustRegion) | 9.5605835e6 | 442 | 4646544 | 6 | 4.1904e-18 | true | ok | NaN | 2.9977e-09 | converged |
| 1.0e6 | SecondOrderOptimization | 2.04373125e8 | 47103 | 3611632 | 7 | 2.3899e-15 | true | ok | NaN | 1.9317e-03 | grad\_tol |
| 1.0e7 | CaNNOLeS | 1.8930875e7 | 241 | 8340464 | 3 | 9.5758e-26 | true | ok | NaN | 1.8315e-08 | first\_order |
| 1.0e7 | Ipopt | 2.7434542e7 | 343 | 1931280 | 1 | 6.8765e-06 | false | above_reference | NaN | 1.1468e-02 | acceptable; claimed convergence at cost 6.876523e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e7 | JSOSolvers (tron) | 1.388015458e9 | 2263 | 149104 | 25 | 9.0046e-11 | true | ok | NaN | 3.0778e-02 | first\_order |
| 1.0e7 | JSOSolvers (trunk) | 8.205007085e8 | 1161 | 86192 | 12 | 6.9231e-10 | true | ok | NaN | 3.9909e-02 | first\_order |
| 1.0e7 | LeastSquaresOptim (Dogleg) | 7.583271e6 | 124 | 751664 | 5 | 3.3001e-32 | true | ok | NaN | 2.0798e-11 | converged |
| 1.0e7 | LeastSquaresOptim (LM) | 5.0124437e7 | 557 | 2711968 | 28 | 4.2095e-15 | true | ok | NaN | 7.4274e-03 | converged |
| 1.0e7 | MadNLP | 7.12276455e7 | 613 | 810480 | 4 | 2.1921e-13 | true | ok | NaN | 7.5742e-03 | SOLVE\_SUCCEEDED |
| 1.0e7 | NonlinearSolve (LM) | 3.8486375e7 | 583 | 3995072 | 31 | 8.8409e-29 | true | ok | NaN | 4.8203e-09 | Success |
| 1.0e7 | NonlinearSolve (TrustRegion) | 1.52761665e7 | 155 | 797808 | 7 | 1.9150e-28 | true | ok | NaN | 2.4280e-11 | Success |
| 1.0e7 | Optim (Newton) | 2.765187e6 | 79 | 174352 | 3 | 6.2803e-25 | true | ok | NaN | 2.1247e-08 | converged |
| 1.0e7 | Optim (NewtonTrustRegion) | 9.2918125e6 | 442 | 4646544 | 6 | 2.2299e-17 | true | ok | NaN | 1.9521e-07 | converged |
| 1.0e7 | SecondOrderOptimization | 3.42871875e8 | 78422 | 4765536 | 12 | 2.7342e-15 | true | ok | NaN | 6.2786e-03 | grad\_tol |
| 1.0e8 | CaNNOLeS | 1.81956875e7 | 241 | 8340464 | 3 | 2.3793e-15 | true | ok | NaN | 1.6926e-03 | first\_order |
| 1.0e8 | Ipopt | 2.7454667e7 | 343 | 1931280 | 1 | 5.8363e-06 | false | above_reference | NaN | 1.1468e-02 | acceptable; claimed convergence at cost 5.836306e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e8 | JSOSolvers (tron) | 1.359455791e9 | 2227 | 147376 | 27 | 2.4721e-10 | true | ok | NaN | 4.7579e-02 | first\_order |
| 1.0e8 | JSOSolvers (trunk) | 7.69210687e8 | 1076 | 82112 | 11 | 6.5361e-10 | true | ok | NaN | 5.3971e-02 | first\_order |
| 1.0e8 | LeastSquaresOptim (Dogleg) | 6.308917e6 | 105 | 669936 | 4 | 9.0278e-31 | true | ok | NaN | 3.0007e-10 | converged |
| 1.0e8 | LeastSquaresOptim (LM) | 5.575775e7 | 595 | 2875424 | 30 | 4.4428e-15 | true | ok | NaN | 1.3032e-02 | converged |
| 1.0e8 | MadNLP | 9.2633042e7 | 621 | 810640 | 5 | 2.0844e-14 | true | ok | NaN | 9.5870e-02 | SOLVE\_SUCCEEDED |
| 1.0e8 | NonlinearSolve (LM) | 4.46742705e7 | 635 | 4298112 | 35 | 7.1213e-29 | true | ok | NaN | 1.6771e-08 | Success |
| 1.0e8 | NonlinearSolve (TrustRegion) | 5.59259896e8 | 155 | 797808 | 191 | 5.3624e-26 | true | ok | NaN | 1.9047e-10 | StalledSuccess |
| 1.0e8 | Optim (Newton) | 2.7221455e6 | 79 | 174352 | 3 | 1.5733e-17 | true | ok | NaN | 2.8771e-04 | converged |
| 1.0e8 | Optim (NewtonTrustRegion) | 7.501438e6 | 273 | 2524976 | 5 | 1.9047e-14 | true | ok | NaN | 3.1365e-02 | converged |
| 1.0e8 | SecondOrderOptimization | 3.016996875e8 | 73202 | 4573216 | 11 | 4.8682e-15 | true | ok | NaN | 1.2579e-02 | grad\_tol |
| 1.0e9 | CaNNOLeS | 1.616990005e8 | 271 | 8341904 | 18 | 7.8590e-12 | true | ok | NaN | 4.2400e-02 | first\_order |
| 1.0e9 | Ipopt | 2.7946583e7 | 343 | 1931280 | 1 | 5.0967e-06 | false | above_reference | NaN | 1.1463e-02 | acceptable; claimed convergence at cost 5.096704e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e9 | JSOSolvers (tron) | 1.6330405e9 | 2668 | 168544 | 32 | 2.8498e-10 | true | ok | NaN | 6.3841e-02 | first\_order |
| 1.0e9 | JSOSolvers (trunk) | 8.76490375e8 | 1255 | 90704 | 13 | 1.2636e-09 | true | ok | NaN | 7.6969e-02 | first\_order |
| 1.0e9 | LeastSquaresOptim (Dogleg) | 6.0300625e6 | 105 | 669936 | 4 | 1.4459e-31 | true | ok | NaN | 1.5274e-09 | converged |
| 1.0e9 | LeastSquaresOptim (LM) | 5.7420479e7 | 652 | 3120608 | 33 | 8.4390e-15 | true | ok | NaN | 2.1160e-02 | converged |
| 1.0e9 | MadNLP | 2.86331813e8 | 709 | 812400 | 16 | 1.4029e-09 | true | ok | NaN | 6.5810e-02 | SOLVE\_SUCCEEDED |
| 1.0e9 | NonlinearSolve (LM) | 4.5102625e7 | 661 | 4449632 | 37 | 8.2325e-27 | true | ok | NaN | 1.2068e-05 | Success |
| 1.0e9 | NonlinearSolve (TrustRegion) | 1.454251958e9 | 155 | 797808 | 500 | 1.9331e-21 | false | not_converged | NaN | 2.6629e-03 | MaxIters; cost test passes |
| 1.0e9 | Optim (Newton) | 4.88476665e7 | 506 | 366624 | 7 | 4.5192e-02 | false | above_reference | NaN | 1.8391e+07 | converged; claimed convergence at cost 4.519237e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e9 | Optim (NewtonTrustRegion) | 2.3266792e7 | 710 | 6751408 | 18 | 2.6832e-12 | true | ok | NaN | 5.3593e-01 | converged |
| 1.0e9 | SecondOrderOptimization | 2.675753125e8 | 62749 | 4188368 | 8 | 3.3812e-14 | true | ok | NaN | 2.3563e-02 | grad\_tol |
| 1.0e10 | CaNNOLeS | 1.76032667e8 | 275 | 8342096 | 20 | 1.2785e-11 | true | ok | NaN | 5.7358e-02 | first\_order |
| 1.0e10 | Ipopt | 2.77244375e7 | 343 | 1931280 | 1 | 4.2836e-06 | false | above_reference | NaN | 1.5244e-01 | acceptable; claimed convergence at cost 4.283573e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e10 | JSOSolvers (tron) | 1.007162333e9 | 1647 | 119536 | 23 | 9.1196e-10 | true | ok | NaN | 9.5968e-02 | first\_order |
| 1.0e10 | JSOSolvers (trunk) | 8.29091521e8 | 1186 | 87392 | 13 | 1.9710e-09 | true | ok | NaN | 1.0667e-01 | first\_order |
| 1.0e10 | LeastSquaresOptim (Dogleg) | 6.067458e6 | 105 | 669936 | 4 | 5.2555e-32 | true | ok | NaN | 4.2296e-08 | converged |
| 1.0e10 | LeastSquaresOptim (LM) | 6.4129688e7 | 728 | 3447520 | 37 | 1.4656e-14 | true | ok | NaN | 3.0598e-02 | converged |
| 1.0e10 | MadNLP | 4.43161959e8 | 847 | 814896 | 25 | 9.7933e-11 | true | ok | NaN | 2.2996e-01 | SOLVE\_SUCCEEDED |
| 1.0e10 | NonlinearSolve (LM) | 8.0606667e7 | 1155 | 7328512 | 75 | 1.0837e-28 | true | ok | NaN | 3.1416e-06 | Success |
| 1.0e10 | NonlinearSolve (TrustRegion) | 1.474117208e9 | 155 | 797808 | 500 | 1.0469e-20 | false | not_converged | NaN | 7.1436e-03 | MaxIters; cost test passes |
| 1.0e10 | Optim (Newton) | 4.22296875e7 | 446 | 375152 | 6 | 3.1441e-02 | false | above_reference | NaN | 1.2067e+07 | converged; claimed convergence at cost 3.144107e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e10 | Optim (NewtonTrustRegion) | 1.86046035e7 | 522 | 4559312 | 15 | 3.9900e-13 | true | ok | NaN | 1.9101e-01 | converged |
| 1.0e10 | SecondOrderOptimization | 3.16486625e8 | 78435 | 4765744 | 13 | 4.6654e-15 | true | ok | NaN | 2.5955e-02 | grad\_tol |
| 1.0e11 | CaNNOLeS | 2.11299458e8 | 281 | 8342384 | 23 | 2.0540e-11 | true | ok | NaN | 7.6357e-02 | first\_order |
| 1.0e11 | Ipopt | 1.01695125e8 | 628 | 1979040 | 6 | 5.2978e-09 | true | ok | NaN | 1.2750e+00 | acceptable |
| 1.0e11 | JSOSolvers (tron) | 1.172355042e9 | 1853 | 129424 | 28 | 1.4820e-09 | true | ok | NaN | 1.3273e-01 | first\_order |
| 1.0e11 | JSOSolvers (trunk) | 1.0424962915e9 | 1444 | 99776 | 16 | 2.4771e-09 | true | ok | NaN | 1.4437e-01 | first\_order |
| 1.0e11 | LeastSquaresOptim (Dogleg) | 6.3495835e6 | 105 | 669936 | 4 | 4.7779e-32 | true | ok | NaN | 2.3370e-07 | converged |
| 1.0e11 | LeastSquaresOptim (LM) | 7.6313583e7 | 842 | 3937888 | 43 | 1.6318e-14 | true | ok | NaN | 4.0029e-02 | converged |
| 1.0e11 | MadNLP | 6.25950875e8 | 953 | 816848 | 33 | 7.4898e-10 | true | ok | NaN | 1.2184e-01 | SOLVE\_SUCCEEDED |
| 1.0e11 | NonlinearSolve (LM) | 9.74509795e7 | 1363 | 8540672 | 91 | 1.3246e-28 | true | ok | NaN | 2.4847e-05 | Success |
| 1.0e11 | NonlinearSolve (TrustRegion) | 1.472476583e9 | 155 | 797808 | 500 | 1.1826e-20 | false | not_converged | NaN | 1.0570e-02 | MaxIters; cost test passes |
| 1.0e11 | Optim (Newton) | 3.4118708e7 | 532 | 409344 | 7 | 3.7758e-02 | false | above_reference | NaN | 1.1904e+06 | converged; claimed convergence at cost 3.775847e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e11 | Optim (NewtonTrustRegion) | 2.4418791e7 | 625 | 5715376 | 17 | 3.0682e-13 | true | ok | NaN | 1.8809e-01 | converged |
| 1.0e11 | SecondOrderOptimization | 6.24861229e8 | 130633 | 6688912 | 21 | 1.7112e-14 | true | ok | NaN | 3.8435e-02 | grad\_tol |
| 1.0e12 | CaNNOLeS | 2.76505792e8 | 293 | 8342960 | 29 | 3.1017e-11 | true | ok | NaN | 1.0072e-01 | first\_order |
| 1.0e12 | Ipopt | 1.74640917e8 | 856 | 2017248 | 10 | 2.5840e-07 | true | ok | NaN | 1.6065e+00 | acceptable |
| 1.0e12 | JSOSolvers (tron) | 1.7248935e9 | 2734 | 171712 | 36 | 1.1064e-09 | true | ok | NaN | 1.6742e-01 | first\_order |
| 1.0e12 | JSOSolvers (trunk) | 9.854375625e8 | 1390 | 97184 | 16 | 4.1829e-09 | true | ok | NaN | 2.0822e-01 | first\_order |
| 1.0e12 | LeastSquaresOptim (Dogleg) | 6.4084585e6 | 105 | 669936 | 4 | 1.7374e-29 | true | ok | NaN | 1.0574e-06 | converged |
| 1.0e12 | LeastSquaresOptim (LM) | 8.1809812e7 | 899 | 4183072 | 46 | 2.4529e-14 | true | ok | NaN | 5.2243e-02 | converged |
| 1.0e12 | MadNLP | 7.14788771e8 | 931 | 816720 | 40 | 7.7450e-10 | true | ok | NaN | 1.4122e-01 | SOLVE\_SUCCEEDED |
| 1.0e12 | NonlinearSolve (LM) | 9.6070416e7 | 1376 | 8616432 | 92 | 9.6655e-29 | true | ok | NaN | 2.2228e-04 | Success |
| 1.0e12 | NonlinearSolve (TrustRegion) | 1.480394541e9 | 155 | 797808 | 500 | 1.6288e-20 | false | not_converged | NaN | 1.5141e-02 | MaxIters; cost test passes |
| 1.0e12 | Optim (Newton) | 7.8290167e7 | 897 | 578640 | 12 | 2.2657e-02 | false | above_reference | NaN | 4.6663e+06 | converged; claimed convergence at cost 2.265683e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e12 | Optim (NewtonTrustRegion) | 2.0342708e7 | 649 | 5966992 | 17 | 2.0213e-11 | true | ok | NaN | 3.1788e+00 | converged |
| 1.0e12 | SecondOrderOptimization | 7.646882295e8 | 172420 | 8227904 | 30 | 2.3793e-14 | true | ok | NaN | 4.9070e-02 | grad\_tol |
