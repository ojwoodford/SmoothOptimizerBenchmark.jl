# Benchmark Results: Dense Conditioning Sweep

- **Category**: medium_dense
- **Scaling Metric**: Condition Number κ
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T04:05:11
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.2.0)
- **Julia Version**: 1.13.4
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 1dd4c9b
- **Dependency Commits**: BlockLinearSystems 78c771c, DampedLinearSolve e361765, NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 1.0 | JuMP | 1.02825e6 | 2 | 32 | 1.7931167e7 | 5 | 128 |
| 1.0 | NLLSModel | 83375.0 | 1 | 16 | 3.57075e6 | 1 | 32 |
| 1.0 | Standalone | 76583.0 | 1 | 16 | 338833.0 | 1 | 32 |
| 10.0 | JuMP | 978958.0 | 2 | 32 | 1.9366625e7 | 5 | 128 |
| 10.0 | NLLSModel | 77959.0 | 1 | 16 | 3.5855e6 | 1 | 32 |
| 10.0 | Standalone | 84292.0 | 1 | 16 | 308167.0 | 1 | 32 |
| 100.0 | JuMP | 1.120125e6 | 2 | 32 | 1.8075834e7 | 5 | 128 |
| 100.0 | NLLSModel | 80500.0 | 1 | 16 | 3.744584e6 | 1 | 32 |
| 100.0 | Standalone | 76542.0 | 1 | 16 | 326167.0 | 1 | 32 |
| 1000.0 | JuMP | 1.1185e6 | 2 | 32 | 1.7538875e7 | 5 | 128 |
| 1000.0 | NLLSModel | 82834.0 | 1 | 16 | 3.595083e6 | 1 | 32 |
| 1000.0 | Standalone | 80667.0 | 1 | 16 | 341584.0 | 1 | 32 |
| 10000.0 | JuMP | 987792.0 | 2 | 32 | 1.922725e7 | 5 | 128 |
| 10000.0 | NLLSModel | 78000.0 | 1 | 16 | 3.753708e6 | 1 | 32 |
| 10000.0 | Standalone | 81542.0 | 1 | 16 | 307916.0 | 1 | 32 |
| 100000.0 | JuMP | 1.15925e6 | 2 | 32 | 1.8190042e7 | 5 | 128 |
| 100000.0 | NLLSModel | 83416.0 | 1 | 16 | 3.850125e6 | 1 | 32 |
| 100000.0 | Standalone | 76667.0 | 1 | 16 | 332167.0 | 1 | 32 |
| 1.0e6 | JuMP | 990500.0 | 2 | 32 | 1.8416209e7 | 5 | 128 |
| 1.0e6 | NLLSModel | 80458.0 | 1 | 16 | 3.68875e6 | 1 | 32 |
| 1.0e6 | Standalone | 79084.0 | 1 | 16 | 307500.0 | 1 | 32 |
| 1.0e7 | JuMP | 995166.0 | 2 | 32 | 1.8183083e7 | 5 | 128 |
| 1.0e7 | NLLSModel | 81750.0 | 1 | 16 | 3.8475e6 | 1 | 32 |
| 1.0e7 | Standalone | 76500.0 | 1 | 16 | 310292.0 | 1 | 32 |
| 1.0e8 | JuMP | 991792.0 | 2 | 32 | 1.8295042e7 | 5 | 128 |
| 1.0e8 | NLLSModel | 77958.0 | 1 | 16 | 3.738125e6 | 1 | 32 |
| 1.0e8 | Standalone | 78958.0 | 1 | 16 | 307709.0 | 1 | 32 |
| 1.0e9 | JuMP | 1.099417e6 | 2 | 32 | 1.839125e7 | 5 | 128 |
| 1.0e9 | NLLSModel | 78166.0 | 1 | 16 | 3.700208e6 | 1 | 32 |
| 1.0e9 | Standalone | 76583.0 | 1 | 16 | 330334.0 | 1 | 32 |
| 1.0e10 | JuMP | 1.001917e6 | 2 | 32 | 1.8781167e7 | 5 | 128 |
| 1.0e10 | NLLSModel | 78500.0 | 1 | 16 | 3.704375e6 | 1 | 32 |
| 1.0e10 | Standalone | 80958.0 | 1 | 16 | 361125.0 | 1 | 32 |
| 1.0e11 | JuMP | 975791.0 | 2 | 32 | 1.8539583e7 | 5 | 128 |
| 1.0e11 | NLLSModel | 82917.0 | 1 | 16 | 3.647292e6 | 1 | 32 |
| 1.0e11 | Standalone | 76500.0 | 1 | 16 | 325167.0 | 1 | 32 |
| 1.0e12 | JuMP | 1.050458e6 | 2 | 32 | 1.8678667e7 | 5 | 128 |
| 1.0e12 | NLLSModel | 78000.0 | 1 | 16 | 3.806e6 | 1 | 32 |
| 1.0e12 | Standalone | 76583.0 | 1 | 16 | 314375.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 1.0 | CaNNOLeS | 1.90949375e7 | 241 | 8340464 | 3 | 6.2041e-23 | true | ok | NaN | 1.4886e-12 | first\_order |
| 1.0 | Ipopt | 4.8513583e7 | 449 | 1949984 | 3 | 6.2043e-23 | true | ok | NaN | 1.4886e-12 | first\_order |
| 1.0 | JSOSolvers (tron) | 1.56314e8 | 349 | 57232 | 6 | 9.6022e-18 | true | ok | NaN | 5.7068e-10 | first\_order |
| 1.0 | JSOSolvers (trunk) | 3.33481875e7 | 112 | 35840 | 7 | 2.5497e-17 | true | ok | NaN | 9.3280e-10 | first\_order |
| 1.0 | LeastSquaresOptim (Dogleg) | 8.6077915e6 | 143 | 833392 | 6 | 6.0453e-30 | true | ok | NaN | 2.8927e-16 | converged |
| 1.0 | LeastSquaresOptim (LM) | 1.0052229e7 | 139 | 913952 | 6 | 1.5468e-25 | true | ok | NaN | 7.3733e-14 | converged |
| 1.0 | MadNLP | 5.7421667e7 | 605 | 810320 | 3 | 4.4602e-20 | true | ok | NaN | 3.9913e-11 | SOLVE\_SUCCEEDED |
| 1.0 | NonlinearSolve (LM) | 9.8006875e6 | 297 | 2328352 | 9 | 1.8629e-26 | true | ok | NaN | 2.5643e-14 | Success |
| 1.0 | NonlinearSolve (TrustRegion) | 1.0378958e7 | 155 | 797808 | 11 | 5.4982e-27 | true | ok | NaN | 1.4027e-14 | Success |
| 1.0 | Optim (Newton) | 2.8129995e6 | 79 | 174352 | 3 | 6.2048e-23 | true | ok | NaN | 1.4887e-12 | converged |
| 1.0 | Optim (NewtonTrustRegion) | 7.363625e6 | 270 | 2524832 | 5 | 8.9458e-23 | true | ok | NaN | 1.7869e-12 | converged |
| 1.0 | SecondOrderOptimization | 6.7951045e6 | 20970 | 2649280 | 3 | 6.6986e-23 | true | ok | NaN | 1.5467e-12 | grad\_tol |
| 10.0 | CaNNOLeS | 1.8846479e7 | 241 | 8340464 | 3 | 9.6746e-24 | true | ok | NaN | 1.4887e-12 | first\_order |
| 10.0 | Ipopt | 4.7257375e7 | 449 | 1949984 | 3 | 9.6747e-24 | true | ok | NaN | 1.4887e-12 | first\_order |
| 10.0 | JSOSolvers (tron) | 1.793754165e8 | 387 | 59056 | 11 | 1.9556e-16 | true | ok | NaN | 2.1761e-08 | first\_order |
| 10.0 | JSOSolvers (trunk) | 1.17366354e8 | 243 | 42128 | 9 | 2.2300e-15 | true | ok | NaN | 7.6311e-08 | first\_order |
| 10.0 | LeastSquaresOptim (Dogleg) | 7.16175e6 | 124 | 751664 | 5 | 1.3465e-30 | true | ok | NaN | 5.7212e-16 | converged |
| 10.0 | LeastSquaresOptim (LM) | 1.0047479e7 | 139 | 913952 | 6 | 3.6693e-19 | true | ok | NaN | 9.5532e-10 | converged |
| 10.0 | MadNLP | 5.6323271e7 | 605 | 810320 | 3 | 6.6971e-19 | true | ok | NaN | 9.6983e-10 | SOLVE\_SUCCEEDED |
| 10.0 | NonlinearSolve (LM) | 1.06942295e7 | 310 | 2404112 | 10 | 2.4652e-26 | true | ok | NaN | 1.0029e-13 | Success |
| 10.0 | NonlinearSolve (TrustRegion) | 1.0714479e7 | 155 | 797808 | 11 | 1.7982e-27 | true | ok | NaN | 2.0565e-14 | Success |
| 10.0 | Optim (Newton) | 2.842625e6 | 79 | 174352 | 3 | 9.6736e-24 | true | ok | NaN | 1.4886e-12 | converged |
| 10.0 | Optim (NewtonTrustRegion) | 7.2407495e6 | 342 | 3525536 | 5 | 3.1727e-22 | true | ok | NaN | 7.8174e-12 | converged |
| 10.0 | SecondOrderOptimization | 6.678167e6 | 20970 | 2649280 | 3 | 1.1778e-23 | true | ok | NaN | 2.1666e-12 | grad\_tol |
| 100.0 | CaNNOLeS | 1.85587295e7 | 241 | 8340464 | 3 | 2.3298e-24 | true | ok | NaN | 1.4888e-12 | first\_order |
| 100.0 | Ipopt | 4.86418745e7 | 449 | 1949984 | 3 | 2.3299e-24 | true | ok | NaN | 1.4885e-12 | first\_order |
| 100.0 | JSOSolvers (tron) | 4.9266025e8 | 846 | 81088 | 12 | 1.8452e-13 | true | ok | NaN | 6.8250e-06 | first\_order |
| 100.0 | JSOSolvers (trunk) | 3.80639333e8 | 629 | 60656 | 9 | 2.1927e-13 | true | ok | NaN | 7.3102e-06 | first\_order |
| 100.0 | LeastSquaresOptim (Dogleg) | 7.232125e6 | 124 | 751664 | 5 | 3.7993e-31 | true | ok | NaN | 1.7414e-15 | converged |
| 100.0 | LeastSquaresOptim (LM) | 1.51655625e7 | 196 | 1159136 | 9 | 5.1609e-19 | true | ok | NaN | 1.1760e-08 | converged |
| 100.0 | MadNLP | 7.5000458e7 | 613 | 810480 | 4 | 2.0205e-28 | true | ok | NaN | 2.0573e-13 | SOLVE\_SUCCEEDED |
| 100.0 | NonlinearSolve (LM) | 1.4883708e7 | 349 | 2631392 | 13 | 3.6256e-27 | true | ok | NaN | 2.6062e-13 | Success |
| 100.0 | NonlinearSolve (TrustRegion) | 1.08906045e7 | 155 | 797808 | 11 | 1.4531e-27 | true | ok | NaN | 3.9016e-14 | Success |
| 100.0 | Optim (Newton) | 2.8055e6 | 79 | 174352 | 3 | 2.3301e-24 | true | ok | NaN | 1.4888e-12 | converged |
| 100.0 | Optim (NewtonTrustRegion) | 7.2564585e6 | 366 | 3859104 | 5 | 2.8740e-18 | true | ok | NaN | 7.6069e-10 | converged |
| 100.0 | SecondOrderOptimization | 6.666833e6 | 20970 | 2649280 | 3 | 1.4100e-23 | true | ok | NaN | 5.0177e-11 | grad\_tol |
| 1000.0 | CaNNOLeS | 1.87243335e7 | 241 | 8340464 | 3 | 6.7711e-25 | true | ok | NaN | 1.4900e-12 | first\_order |
| 1000.0 | Ipopt | 5.0906708e7 | 449 | 1949984 | 3 | 6.7716e-25 | true | ok | NaN | 1.4900e-12 | first\_order |
| 1000.0 | JSOSolvers (tron) | 1.289310834e9 | 2038 | 138304 | 13 | 1.8837e-12 | false | wrong_solution | NaN | 1.8993e-04 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.90e-04, above 1e-04 |
| 1000.0 | JSOSolvers (trunk) | 8.483546875e8 | 1348 | 95168 | 11 | 1.7283e-11 | false | wrong_solution | NaN | 5.6287e-04 | first\_order; claimed convergence and the cost test passes, but the solution error is 5.63e-04, above 1e-04 |
| 1000.0 | LeastSquaresOptim (Dogleg) | 7.1334165e6 | 124 | 751664 | 5 | 1.4328e-31 | true | ok | NaN | 9.4955e-15 | converged |
| 1000.0 | LeastSquaresOptim (LM) | 1.86607705e7 | 234 | 1322592 | 11 | 6.3326e-15 | true | ok | NaN | 1.2155e-05 | converged |
| 1000.0 | MadNLP | 7.54714585e7 | 613 | 810480 | 4 | 6.5948e-20 | true | ok | NaN | 1.8412e-08 | SOLVE\_SUCCEEDED |
| 1000.0 | NonlinearSolve (LM) | 1.98362295e7 | 401 | 2934432 | 17 | 4.9080e-28 | true | ok | NaN | 7.0426e-13 | Success |
| 1000.0 | NonlinearSolve (TrustRegion) | 1.12708125e7 | 155 | 797808 | 11 | 1.0967e-27 | true | ok | NaN | 7.3123e-14 | Success |
| 1000.0 | Optim (Newton) | 2.798833e6 | 79 | 174352 | 3 | 6.7722e-25 | true | ok | NaN | 1.4891e-12 | converged |
| 1000.0 | Optim (NewtonTrustRegion) | 7.2228335e6 | 378 | 4025888 | 5 | 2.8412e-16 | true | ok | NaN | 7.8399e-09 | converged |
| 1000.0 | SecondOrderOptimization | 6.8057915e6 | 20970 | 2649280 | 3 | 3.8440e-20 | true | ok | NaN | 2.8295e-08 | grad\_tol |
| 10000.0 | CaNNOLeS | 1.85880205e7 | 241 | 8340464 | 3 | 2.6071e-25 | true | ok | NaN | 1.4704e-12 | first\_order |
| 10000.0 | Ipopt | 5.1956375e7 | 449 | 1949984 | 3 | 2.6066e-25 | true | ok | NaN | 1.4713e-12 | first\_order |
| 10000.0 | JSOSolvers (tron) | 2.173682292e9 | 3354 | 201472 | 20 | 9.4396e-12 | false | wrong_solution | NaN | 2.8551e-03 | first\_order; claimed convergence and the cost test passes, but the solution error is 2.86e-03, above 1e-04 |
| 10000.0 | JSOSolvers (trunk) | 8.737594585e8 | 1406 | 97952 | 11 | 1.5092e-10 | false | wrong_solution | NaN | 6.2768e-03 | first\_order; claimed convergence and the cost test passes, but the solution error is 6.28e-03, above 1e-04 |
| 10000.0 | LeastSquaresOptim (Dogleg) | 7.153417e6 | 124 | 751664 | 5 | 9.6852e-32 | true | ok | NaN | 7.8164e-14 | converged |
| 10000.0 | LeastSquaresOptim (LM) | 2.539275e7 | 310 | 1649504 | 15 | 2.4871e-17 | true | ok | NaN | 7.8032e-06 | converged |
| 10000.0 | MadNLP | 7.42846045e7 | 613 | 810480 | 4 | 3.9184e-15 | true | ok | NaN | 1.2917e-05 | SOLVE\_SUCCEEDED |
| 10000.0 | NonlinearSolve (LM) | 2.40415625e7 | 440 | 3161712 | 20 | 1.8013e-26 | true | ok | NaN | 2.2894e-11 | Success |
| 10000.0 | NonlinearSolve (TrustRegion) | 1.34493125e7 | 155 | 797808 | 10 | 8.9795e-29 | true | ok | NaN | 7.1222e-14 | Success |
| 10000.0 | Optim (Newton) | 2.7865e6 | 79 | 174352 | 3 | 2.6070e-25 | true | ok | NaN | 1.4897e-12 | converged |
| 10000.0 | Optim (NewtonTrustRegion) | 9.1110415e6 | 484 | 5313488 | 6 | 1.2131e-26 | true | ok | NaN | 3.7817e-13 | converged |
| 10000.0 | SecondOrderOptimization | 6.5334375e6 | 20970 | 2649280 | 3 | 8.7891e-16 | true | ok | NaN | 3.0538e-05 | grad\_tol |
| 100000.0 | CaNNOLeS | 1.8764e7 | 241 | 8340464 | 3 | 1.4045e-25 | true | ok | NaN | 1.7398e-12 | first\_order |
| 100000.0 | Ipopt | 5.1595083e7 | 449 | 1949984 | 3 | 1.4050e-25 | true | ok | NaN | 1.5612e-12 | first\_order |
| 100000.0 | JSOSolvers (tron) | 1.991873625e9 | 3103 | 189424 | 23 | 1.3389e-11 | false | wrong_solution | NaN | 8.7674e-03 | first\_order; claimed convergence and the cost test passes, but the solution error is 8.77e-03, above 1e-04 |
| 100000.0 | JSOSolvers (trunk) | 8.966784375e8 | 1432 | 99200 | 13 | 2.8939e-10 | false | wrong_solution | NaN | 1.5010e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.50e-02, above 1e-04 |
| 100000.0 | LeastSquaresOptim (Dogleg) | 7.171875e6 | 124 | 751664 | 5 | 6.2971e-32 | true | ok | NaN | 2.7188e-13 | converged |
| 100000.0 | LeastSquaresOptim (LM) | 3.2238021e7 | 386 | 1976416 | 19 | 1.0210e-17 | true | ok | NaN | 4.7517e-05 | converged |
| 100000.0 | MadNLP | 7.49595e7 | 613 | 810480 | 4 | 5.9902e-13 | false | wrong_solution | NaN | 4.2809e-03 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 4.28e-03, above 1e-04 |
| 100000.0 | NonlinearSolve (LM) | 2.9380625e7 | 492 | 3464752 | 24 | 1.5899e-28 | true | ok | NaN | 3.8478e-11 | Success |
| 100000.0 | NonlinearSolve (TrustRegion) | 1.51503335e7 | 155 | 797808 | 7 | 4.3164e-30 | true | ok | NaN | 2.7135e-13 | Success |
| 100000.0 | Optim (Newton) | 2.766063e6 | 79 | 174352 | 3 | 1.4050e-25 | true | ok | NaN | 1.6657e-12 | converged |
| 100000.0 | Optim (NewtonTrustRegion) | 8.879417e6 | 436 | 4646352 | 6 | 3.4609e-19 | true | ok | NaN | 6.2301e-10 | converged |
| 100000.0 | SecondOrderOptimization | 1.05374585e7 | 31398 | 3033728 | 5 | 4.5748e-18 | true | ok | NaN | 1.3011e-05 | grad\_tol |
| 1.0e6 | CaNNOLeS | 1.8795291e7 | 241 | 8340464 | 3 | 9.7590e-26 | true | ok | NaN | 4.3622e-11 | first\_order |
| 1.0e6 | Ipopt | 5.1955416e7 | 449 | 1949984 | 3 | 9.7526e-26 | true | ok | NaN | 2.1798e-12 | first\_order |
| 1.0e6 | JSOSolvers (tron) | 1.6391435e9 | 2555 | 163120 | 24 | 1.6041e-10 | false | wrong_solution | NaN | 2.2608e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 2.26e-02, above 1e-04 |
| 1.0e6 | JSOSolvers (trunk) | 8.09434854e8 | 1298 | 92768 | 14 | 4.7819e-10 | false | wrong_solution | NaN | 2.6445e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 2.64e-02, above 1e-04 |
| 1.0e6 | LeastSquaresOptim (Dogleg) | 7.256271e6 | 124 | 751664 | 5 | 3.6952e-32 | true | ok | NaN | 1.8188e-12 | converged |
| 1.0e6 | LeastSquaresOptim (LM) | 4.2851458e7 | 500 | 2466784 | 25 | 1.6496e-15 | false | wrong_solution | NaN | 2.4100e-03 | converged; claimed convergence and the cost test passes, but the solution error is 2.41e-03, above 1e-04 |
| 1.0e6 | MadNLP | 7.52138545e7 | 613 | 810480 | 4 | 2.9523e-13 | false | wrong_solution | NaN | 5.5970e-03 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 5.60e-03, above 1e-04 |
| 1.0e6 | NonlinearSolve (LM) | 3.3112708e7 | 531 | 3692032 | 27 | 6.6420e-28 | true | ok | NaN | 4.0791e-09 | Success |
| 1.0e6 | NonlinearSolve (TrustRegion) | 1.5425521e7 | 155 | 797808 | 7 | 3.1810e-29 | true | ok | NaN | 2.1245e-12 | Success |
| 1.0e6 | Optim (Newton) | 2.7586665e6 | 79 | 174352 | 3 | 9.7583e-26 | true | ok | NaN | 4.4529e-11 | converged |
| 1.0e6 | Optim (NewtonTrustRegion) | 8.7622495e6 | 436 | 4646352 | 6 | 4.1904e-18 | true | ok | NaN | 2.9977e-09 | converged |
| 1.0e6 | SecondOrderOptimization | 1.6166334e7 | 47031 | 3610256 | 7 | 2.3899e-15 | false | wrong_solution | NaN | 1.9317e-03 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 1.93e-03, above 1e-04 |
| 1.0e7 | CaNNOLeS | 1.84924375e7 | 241 | 8340464 | 3 | 9.5758e-26 | true | ok | NaN | 1.8315e-08 | first\_order |
| 1.0e7 | Ipopt | 5.253375e7 | 449 | 1949984 | 3 | 7.7478e-26 | true | ok | NaN | 2.2521e-11 | first\_order |
| 1.0e7 | JSOSolvers (tron) | 1.456227209e9 | 2263 | 149104 | 25 | 9.0046e-11 | false | wrong_solution | NaN | 3.0778e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 3.08e-02, above 1e-04 |
| 1.0e7 | JSOSolvers (trunk) | 7.223701045e8 | 1161 | 86192 | 12 | 6.9231e-10 | false | wrong_solution | NaN | 3.9909e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 3.99e-02, above 1e-04 |
| 1.0e7 | LeastSquaresOptim (Dogleg) | 7.084792e6 | 124 | 751664 | 5 | 3.3001e-32 | true | ok | NaN | 2.0798e-11 | converged |
| 1.0e7 | LeastSquaresOptim (LM) | 4.7405792e7 | 557 | 2711968 | 28 | 4.2095e-15 | false | wrong_solution | NaN | 7.4274e-03 | converged; claimed convergence and the cost test passes, but the solution error is 7.43e-03, above 1e-04 |
| 1.0e7 | MadNLP | 7.4090625e7 | 613 | 810480 | 4 | 2.1921e-13 | false | wrong_solution | NaN | 7.5742e-03 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 7.57e-03, above 1e-04 |
| 1.0e7 | NonlinearSolve (LM) | 3.8084042e7 | 583 | 3995072 | 31 | 8.8409e-29 | true | ok | NaN | 4.8203e-09 | Success |
| 1.0e7 | NonlinearSolve (TrustRegion) | 1.5531021e7 | 155 | 797808 | 7 | 1.9150e-28 | true | ok | NaN | 2.4280e-11 | Success |
| 1.0e7 | Optim (Newton) | 2.7196045e6 | 79 | 174352 | 3 | 6.2803e-25 | true | ok | NaN | 2.1247e-08 | converged |
| 1.0e7 | Optim (NewtonTrustRegion) | 8.645688e6 | 436 | 4646352 | 6 | 2.2299e-17 | true | ok | NaN | 1.9521e-07 | converged |
| 1.0e7 | SecondOrderOptimization | 2.68955415e7 | 78302 | 4763392 | 12 | 2.7342e-15 | false | wrong_solution | NaN | 6.2786e-03 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 6.28e-03, above 1e-04 |
| 1.0e8 | CaNNOLeS | 1.8704562e7 | 241 | 8340464 | 3 | 2.3793e-15 | false | wrong_solution | NaN | 1.6926e-03 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.69e-03, above 1e-04 |
| 1.0e8 | Ipopt | 5.240725e7 | 449 | 1949984 | 3 | 6.5464e-26 | true | ok | NaN | 1.8816e-10 | first\_order |
| 1.0e8 | JSOSolvers (tron) | 1.423899541e9 | 2227 | 147376 | 27 | 2.4721e-10 | false | wrong_solution | NaN | 4.7579e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 4.76e-02, above 1e-04 |
| 1.0e8 | JSOSolvers (trunk) | 6.844596455e8 | 1076 | 82112 | 11 | 6.5361e-10 | false | above_reference | NaN | 5.3971e-02 | first\_order; claimed convergence at cost 6.536121e-10, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e8 | LeastSquaresOptim (Dogleg) | 5.718521e6 | 105 | 669936 | 4 | 9.0278e-31 | true | ok | NaN | 3.0007e-10 | converged |
| 1.0e8 | LeastSquaresOptim (LM) | 5.0376375e7 | 595 | 2875424 | 30 | 4.4428e-15 | false | wrong_solution | NaN | 1.3032e-02 | converged; claimed convergence and the cost test passes, but the solution error is 1.30e-02, above 1e-04 |
| 1.0e8 | MadNLP | 9.4696416e7 | 621 | 810640 | 5 | 2.0844e-14 | false | wrong_solution | NaN | 9.5870e-02 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 9.59e-02, above 1e-04 |
| 1.0e8 | NonlinearSolve (LM) | 4.3107e7 | 635 | 4298112 | 35 | 7.1213e-29 | true | ok | NaN | 1.6771e-08 | Success |
| 1.0e8 | NonlinearSolve (TrustRegion) | 5.40649771e8 | 155 | 797808 | 191 | 5.3624e-26 | true | ok | NaN | 1.9047e-10 | StalledSuccess |
| 1.0e8 | Optim (Newton) | 2.721354e6 | 79 | 174352 | 3 | 1.5733e-17 | false | wrong_solution | NaN | 2.8771e-04 | converged; claimed convergence and the cost test passes, but the solution error is 2.88e-04, above 1e-04 |
| 1.0e8 | Optim (NewtonTrustRegion) | 6.925021e6 | 268 | 2524816 | 5 | 1.9047e-14 | false | wrong_solution | NaN | 3.1365e-02 | converged; claimed convergence and the cost test passes, but the solution error is 3.14e-02, above 1e-04 |
| 1.0e8 | SecondOrderOptimization | 2.5166333e7 | 73090 | 4571200 | 11 | 4.8682e-15 | false | wrong_solution | NaN | 1.2579e-02 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 1.26e-02, above 1e-04 |
| 1.0e9 | CaNNOLeS | 1.610142505e8 | 271 | 8341904 | 18 | 7.8590e-12 | false | wrong_solution | NaN | 4.2400e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 4.24e-02, above 1e-04 |
| 1.0e9 | Ipopt | 5.1648375e7 | 449 | 1949984 | 3 | 5.6736e-26 | true | ok | NaN | 3.2724e-09 | first\_order |
| 1.0e9 | JSOSolvers (tron) | 1.754345542e9 | 2668 | 168544 | 32 | 2.8498e-10 | false | wrong_solution | NaN | 6.3841e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 6.38e-02, above 1e-04 |
| 1.0e9 | JSOSolvers (trunk) | 8.064627085e8 | 1255 | 90704 | 13 | 1.2636e-09 | false | above_reference | NaN | 7.6969e-02 | first\_order; claimed convergence at cost 1.263592e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e9 | LeastSquaresOptim (Dogleg) | 5.7306665e6 | 105 | 669936 | 4 | 1.4459e-31 | true | ok | NaN | 1.5274e-09 | converged |
| 1.0e9 | LeastSquaresOptim (LM) | 5.5788625e7 | 652 | 3120608 | 33 | 8.4390e-15 | false | wrong_solution | NaN | 2.1160e-02 | converged; claimed convergence and the cost test passes, but the solution error is 2.12e-02, above 1e-04 |
| 1.0e9 | MadNLP | 2.969063125e8 | 709 | 812400 | 16 | 1.4029e-09 | false | above_reference | NaN | 6.5810e-02 | SOLVE\_SUCCEEDED; claimed convergence at cost 1.402928e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e9 | NonlinearSolve (LM) | 4.5859917e7 | 661 | 4449632 | 37 | 8.2325e-27 | true | ok | NaN | 1.2068e-05 | Success |
| 1.0e9 | NonlinearSolve (TrustRegion) | 1.454053583e9 | 155 | 797808 | 500 | 1.9331e-21 | false | not_converged | NaN | 2.6629e-03 | MaxIters; cost test passes |
| 1.0e9 | Optim (Newton) | 4.6283729e7 | 506 | 366624 | 7 | 4.5192e-02 | false | above_reference | NaN | 1.8391e+07 | converged; claimed convergence at cost 4.519237e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e9 | Optim (NewtonTrustRegion) | 2.1589146e7 | 692 | 6750832 | 18 | 2.6832e-12 | false | wrong_solution | NaN | 5.3593e-01 | converged; claimed convergence and the cost test passes, but the solution error is 5.36e-01, above 1e-04 |
| 1.0e9 | SecondOrderOptimization | 2.1088625e7 | 62653 | 4186608 | 8 | 3.3812e-14 | false | wrong_solution | NaN | 2.3563e-02 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 2.36e-02, above 1e-04 |
| 1.0e10 | CaNNOLeS | 1.85047521e8 | 275 | 8342096 | 20 | 1.2785e-11 | false | wrong_solution | NaN | 5.7358e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 5.74e-02, above 1e-04 |
| 1.0e10 | Ipopt | 9.775175e7 | 620 | 1978640 | 6 | 3.6722e-12 | false | wrong_solution | NaN | 1.5989e-01 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.60e-01, above 1e-04 |
| 1.0e10 | JSOSolvers (tron) | 1.023820917e9 | 1647 | 119536 | 23 | 9.1196e-10 | false | above_reference | NaN | 9.5968e-02 | first\_order; claimed convergence at cost 9.119648e-10, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e10 | JSOSolvers (trunk) | 7.35041687e8 | 1186 | 87392 | 13 | 1.9710e-09 | false | above_reference | NaN | 1.0667e-01 | first\_order; claimed convergence at cost 1.970971e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e10 | LeastSquaresOptim (Dogleg) | 5.861209e6 | 105 | 669936 | 4 | 5.2555e-32 | true | ok | NaN | 4.2296e-08 | converged |
| 1.0e10 | LeastSquaresOptim (LM) | 6.19652915e7 | 728 | 3447520 | 37 | 1.4656e-14 | false | wrong_solution | NaN | 3.0598e-02 | converged; claimed convergence and the cost test passes, but the solution error is 3.06e-02, above 1e-04 |
| 1.0e10 | MadNLP | 4.58976167e8 | 847 | 814896 | 25 | 9.7933e-11 | false | wrong_solution | NaN | 2.2996e-01 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 2.30e-01, above 1e-04 |
| 1.0e10 | NonlinearSolve (LM) | 8.02402915e7 | 1155 | 7328512 | 75 | 1.0837e-28 | true | ok | NaN | 3.1416e-06 | Success |
| 1.0e10 | NonlinearSolve (TrustRegion) | 1.45652975e9 | 155 | 797808 | 500 | 1.0469e-20 | false | not_converged | NaN | 7.1436e-03 | MaxIters; cost test passes |
| 1.0e10 | Optim (Newton) | 4.0080271e7 | 446 | 375152 | 6 | 3.1441e-02 | false | above_reference | NaN | 1.2067e+07 | converged; claimed convergence at cost 3.144107e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e10 | Optim (NewtonTrustRegion) | 1.69044585e7 | 507 | 4558832 | 15 | 3.9900e-13 | false | wrong_solution | NaN | 1.9101e-01 | converged; claimed convergence and the cost test passes, but the solution error is 1.91e-01, above 1e-04 |
| 1.0e10 | SecondOrderOptimization | 2.80019585e7 | 78315 | 4763600 | 13 | 4.6654e-15 | false | wrong_solution | NaN | 2.5955e-02 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 2.60e-02, above 1e-04 |
| 1.0e11 | CaNNOLeS | 2.13962834e8 | 281 | 8342384 | 23 | 2.0540e-11 | false | wrong_solution | NaN | 7.6357e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 7.64e-02, above 1e-04 |
| 1.0e11 | Ipopt | 3.75718416e8 | 1673 | 2166464 | 23 | 2.0592e-14 | false | wrong_solution | NaN | 1.1832e+00 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.18e+00, above 1e-04 |
| 1.0e11 | JSOSolvers (tron) | 1.205333542e9 | 1853 | 129424 | 28 | 1.4820e-09 | false | above_reference | NaN | 1.3273e-01 | first\_order; claimed convergence at cost 1.482040e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e11 | JSOSolvers (trunk) | 9.153908335e8 | 1444 | 99776 | 16 | 2.4771e-09 | false | above_reference | NaN | 1.4437e-01 | first\_order; claimed convergence at cost 2.477134e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e11 | LeastSquaresOptim (Dogleg) | 5.747375e6 | 105 | 669936 | 4 | 4.7779e-32 | true | ok | NaN | 2.3370e-07 | converged |
| 1.0e11 | LeastSquaresOptim (LM) | 7.2363729e7 | 842 | 3937888 | 43 | 1.6318e-14 | false | wrong_solution | NaN | 4.0029e-02 | converged; claimed convergence and the cost test passes, but the solution error is 4.00e-02, above 1e-04 |
| 1.0e11 | MadNLP | 6.165460835e8 | 953 | 816848 | 33 | 7.4898e-10 | false | above_reference | NaN | 1.2184e-01 | SOLVE\_SUCCEEDED; claimed convergence at cost 7.489768e-10, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e11 | NonlinearSolve (LM) | 9.32626245e7 | 1363 | 8540672 | 91 | 1.3246e-28 | true | ok | NaN | 2.4847e-05 | Success |
| 1.0e11 | NonlinearSolve (TrustRegion) | 1.480739709e9 | 155 | 797808 | 500 | 1.1826e-20 | false | not_converged | NaN | 1.0570e-02 | MaxIters; cost test passes |
| 1.0e11 | Optim (Newton) | 3.2369375e7 | 532 | 409344 | 7 | 3.7758e-02 | false | above_reference | NaN | 1.1904e+06 | converged; claimed convergence at cost 3.775847e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e11 | Optim (NewtonTrustRegion) | 1.8834916e7 | 608 | 5714832 | 17 | 3.0682e-13 | false | wrong_solution | NaN | 1.8809e-01 | converged; claimed convergence and the cost test passes, but the solution error is 1.88e-01, above 1e-04 |
| 1.0e11 | SecondOrderOptimization | 4.6600583e7 | 130433 | 6685488 | 21 | 1.7112e-14 | false | wrong_solution | NaN | 3.8435e-02 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 3.84e-02, above 1e-04 |
| 1.0e12 | CaNNOLeS | 2.625982085e8 | 293 | 8342960 | 29 | 3.1017e-11 | false | wrong_solution | NaN | 1.0072e-01 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.01e-01, above 1e-04 |
| 1.0e12 | Ipopt | 3.88555333e8 | 1687 | 2170704 | 23 | 5.9893e-15 | false | wrong_solution | NaN | 1.3281e+00 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.33e+00, above 1e-04 |
| 1.0e12 | JSOSolvers (tron) | 1.780019708e9 | 2734 | 171712 | 36 | 1.1064e-09 | false | above_reference | NaN | 1.6742e-01 | first\_order; claimed convergence at cost 1.106401e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e12 | JSOSolvers (trunk) | 8.77944459e8 | 1390 | 97184 | 16 | 4.1829e-09 | false | above_reference | NaN | 2.0822e-01 | first\_order; claimed convergence at cost 4.182909e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e12 | LeastSquaresOptim (Dogleg) | 5.922354e6 | 105 | 669936 | 4 | 1.7374e-29 | true | ok | NaN | 1.0574e-06 | converged |
| 1.0e12 | LeastSquaresOptim (LM) | 7.7295166e7 | 899 | 4183072 | 46 | 2.4529e-14 | false | wrong_solution | NaN | 5.2243e-02 | converged; claimed convergence and the cost test passes, but the solution error is 5.22e-02, above 1e-04 |
| 1.0e12 | MadNLP | 7.39148979e8 | 931 | 816720 | 40 | 7.7450e-10 | false | above_reference | NaN | 1.4122e-01 | SOLVE\_SUCCEEDED; claimed convergence at cost 7.745027e-10, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e12 | NonlinearSolve (LM) | 9.4331791e7 | 1376 | 8616432 | 92 | 9.6655e-29 | false | wrong_solution | NaN | 2.2228e-04 | Success; claimed convergence and the cost test passes, but the solution error is 2.22e-04, above 1e-04 |
| 1.0e12 | NonlinearSolve (TrustRegion) | 1.488578084e9 | 155 | 797808 | 500 | 1.6288e-20 | false | not_converged | NaN | 1.5141e-02 | MaxIters; cost test passes |
| 1.0e12 | Optim (Newton) | 7.4685792e7 | 897 | 578640 | 12 | 2.2657e-02 | false | above_reference | NaN | 4.6663e+06 | converged; claimed convergence at cost 2.265683e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e12 | Optim (NewtonTrustRegion) | 1.8729209e7 | 632 | 5966448 | 17 | 2.0213e-11 | false | wrong_solution | NaN | 3.1788e+00 | converged; claimed convergence and the cost test passes, but the solution error is 3.18e+00, above 1e-04 |
| 1.0e12 | SecondOrderOptimization | 6.19863125e7 | 172156 | 8223456 | 30 | 2.3793e-14 | false | wrong_solution | NaN | 4.9070e-02 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 4.91e-02, above 1e-04 |
