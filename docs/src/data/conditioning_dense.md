# Benchmark Results: Dense Conditioning Sweep

- **Category**: medium_dense
- **Scaling Metric**: Condition Number κ
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:11:48
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.2.0)
- **Julia Version**: 1.13.4
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 1dd4c9b
- **Dependency Commits**: BlockLinearSystems 78c771c, DampedLinearSolve e361765, NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 1.0 | JuMP | 986917.0 | 2 | 32 | 1.6985459e7 | 5 | 128 |
| 1.0 | NLLSModel | 28208.0 | 1 | 16 | 967458.0 | 1 | 32 |
| 1.0 | Standalone | 76500.0 | 1 | 16 | 308917.0 | 1 | 32 |
| 10.0 | JuMP | 983583.0 | 2 | 32 | 1.7105167e7 | 5 | 128 |
| 10.0 | NLLSModel | 28209.0 | 1 | 16 | 970584.0 | 1 | 32 |
| 10.0 | Standalone | 76500.0 | 1 | 16 | 310458.0 | 1 | 32 |
| 100.0 | JuMP | 971584.0 | 2 | 32 | 1.71645e7 | 5 | 128 |
| 100.0 | NLLSModel | 28291.0 | 1 | 16 | 968791.0 | 1 | 32 |
| 100.0 | Standalone | 76542.0 | 1 | 16 | 307584.0 | 1 | 32 |
| 1000.0 | JuMP | 982958.0 | 2 | 32 | 1.7224958e7 | 5 | 128 |
| 1000.0 | NLLSModel | 28208.0 | 1 | 16 | 968583.0 | 1 | 32 |
| 1000.0 | Standalone | 81416.0 | 1 | 16 | 323541.0 | 1 | 32 |
| 10000.0 | JuMP | 992667.0 | 2 | 32 | 1.7892041e7 | 5 | 128 |
| 10000.0 | NLLSModel | 28250.0 | 1 | 16 | 967250.0 | 1 | 32 |
| 10000.0 | Standalone | 76625.0 | 1 | 16 | 323791.0 | 1 | 32 |
| 100000.0 | JuMP | 1.050709e6 | 2 | 32 | 1.7259208e7 | 5 | 128 |
| 100000.0 | NLLSModel | 28291.0 | 1 | 16 | 969042.0 | 1 | 32 |
| 100000.0 | Standalone | 76500.0 | 1 | 16 | 308667.0 | 1 | 32 |
| 1.0e6 | JuMP | 987750.0 | 2 | 32 | 1.7284209e7 | 5 | 128 |
| 1.0e6 | NLLSModel | 28333.0 | 1 | 16 | 965125.0 | 1 | 32 |
| 1.0e6 | Standalone | 76500.0 | 1 | 16 | 307833.0 | 1 | 32 |
| 1.0e7 | JuMP | 986167.0 | 2 | 32 | 1.7379042e7 | 5 | 128 |
| 1.0e7 | NLLSModel | 28208.0 | 1 | 16 | 965792.0 | 1 | 32 |
| 1.0e7 | Standalone | 76542.0 | 1 | 16 | 308625.0 | 1 | 32 |
| 1.0e8 | JuMP | 991958.0 | 2 | 32 | 1.7292e7 | 5 | 128 |
| 1.0e8 | NLLSModel | 27667.0 | 1 | 16 | 978750.0 | 1 | 32 |
| 1.0e8 | Standalone | 76500.0 | 1 | 16 | 307708.0 | 1 | 32 |
| 1.0e9 | JuMP | 979958.0 | 2 | 32 | 1.715275e7 | 5 | 128 |
| 1.0e9 | NLLSModel | 27708.0 | 1 | 16 | 988125.0 | 1 | 32 |
| 1.0e9 | Standalone | 76500.0 | 1 | 16 | 312625.0 | 1 | 32 |
| 1.0e10 | JuMP | 1.024333e6 | 2 | 32 | 1.7278625e7 | 5 | 128 |
| 1.0e10 | NLLSModel | 28250.0 | 1 | 16 | 966083.0 | 1 | 32 |
| 1.0e10 | Standalone | 76500.0 | 1 | 16 | 310209.0 | 1 | 32 |
| 1.0e11 | JuMP | 976542.0 | 2 | 32 | 1.7160042e7 | 5 | 128 |
| 1.0e11 | NLLSModel | 28250.0 | 1 | 16 | 968291.0 | 1 | 32 |
| 1.0e11 | Standalone | 76666.0 | 1 | 16 | 313084.0 | 1 | 32 |
| 1.0e12 | JuMP | 1.037834e6 | 2 | 32 | 1.7839667e7 | 5 | 128 |
| 1.0e12 | NLLSModel | 28208.0 | 1 | 16 | 968625.0 | 1 | 32 |
| 1.0e12 | Standalone | 76667.0 | 1 | 16 | 313334.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 1.0 | CaNNOLeS | 1.90804375e7 | 241 | 8340464 | 3 | 6.2041e-23 | true | ok | NaN | 1.4886e-12 | first\_order |
| 1.0 | Ipopt | 4.7953417e7 | 449 | 1949984 | 3 | 6.2043e-23 | true | ok | NaN | 1.4886e-12 | first\_order |
| 1.0 | JSOSolvers (tron) | 1.55617083e8 | 349 | 57232 | 6 | 9.6022e-18 | true | ok | NaN | 5.7068e-10 | first\_order |
| 1.0 | JSOSolvers (trunk) | 3.6714208e7 | 112 | 35840 | 7 | 2.5497e-17 | true | ok | NaN | 9.3280e-10 | first\_order |
| 1.0 | LeastSquaresOptim (Dogleg) | 8.840166e6 | 143 | 833392 | 6 | 6.0453e-30 | true | ok | NaN | 2.8927e-16 | converged |
| 1.0 | LeastSquaresOptim (LM) | 1.02968545e7 | 139 | 913952 | 6 | 1.5468e-25 | true | ok | NaN | 7.3733e-14 | converged |
| 1.0 | MadNLP | 5.53205625e7 | 605 | 810320 | 3 | 4.4602e-20 | true | ok | NaN | 3.9913e-11 | SOLVE\_SUCCEEDED |
| 1.0 | NonlinearSolve (LM) | 9.640291e6 | 297 | 2328352 | 9 | 1.8629e-26 | true | ok | NaN | 2.5643e-14 | Success |
| 1.0 | NonlinearSolve (TrustRegion) | 1.0796229e7 | 155 | 797808 | 11 | 5.4982e-27 | true | ok | NaN | 1.4027e-14 | Success |
| 1.0 | Optim (Newton) | 2.769291e6 | 79 | 174352 | 3 | 6.2048e-23 | true | ok | NaN | 1.4887e-12 | converged |
| 1.0 | Optim (NewtonTrustRegion) | 7.7146665e6 | 270 | 2524832 | 5 | 8.9458e-23 | true | ok | NaN | 1.7869e-12 | converged |
| 1.0 | SecondOrderOptimization | 7.3273417e7 | 21002 | 2650016 | 3 | 6.6986e-23 | true | ok | NaN | 1.5467e-12 | grad\_tol |
| 10.0 | CaNNOLeS | 1.9328125e7 | 241 | 8340464 | 3 | 9.6746e-24 | true | ok | NaN | 1.4887e-12 | first\_order |
| 10.0 | Ipopt | 5.1165917e7 | 449 | 1949984 | 3 | 9.6747e-24 | true | ok | NaN | 1.4887e-12 | first\_order |
| 10.0 | JSOSolvers (tron) | 1.809788955e8 | 387 | 59056 | 11 | 1.9556e-16 | true | ok | NaN | 2.1761e-08 | first\_order |
| 10.0 | JSOSolvers (trunk) | 1.37480125e8 | 243 | 42128 | 9 | 2.2300e-15 | true | ok | NaN | 7.6311e-08 | first\_order |
| 10.0 | LeastSquaresOptim (Dogleg) | 1.1494229e7 | 124 | 751664 | 5 | 1.3465e-30 | true | ok | NaN | 5.7212e-16 | converged |
| 10.0 | LeastSquaresOptim (LM) | 1.2731416e7 | 139 | 913952 | 6 | 3.6693e-19 | true | ok | NaN | 9.5532e-10 | converged |
| 10.0 | MadNLP | 5.7942709e7 | 605 | 810320 | 3 | 6.6971e-19 | true | ok | NaN | 9.6983e-10 | SOLVE\_SUCCEEDED |
| 10.0 | NonlinearSolve (LM) | 1.0967875e7 | 310 | 2404112 | 10 | 2.4652e-26 | true | ok | NaN | 1.0029e-13 | Success |
| 10.0 | NonlinearSolve (TrustRegion) | 1.0804063e7 | 155 | 797808 | 11 | 1.7982e-27 | true | ok | NaN | 2.0565e-14 | Success |
| 10.0 | Optim (Newton) | 2.7714375e6 | 79 | 174352 | 3 | 9.6736e-24 | true | ok | NaN | 1.4886e-12 | converged |
| 10.0 | Optim (NewtonTrustRegion) | 8.1217495e6 | 342 | 3525536 | 5 | 3.1727e-22 | true | ok | NaN | 7.8174e-12 | converged |
| 10.0 | SecondOrderOptimization | 8.15244585e7 | 21002 | 2650016 | 3 | 1.1778e-23 | true | ok | NaN | 2.1666e-12 | grad\_tol |
| 100.0 | CaNNOLeS | 1.92748125e7 | 241 | 8340464 | 3 | 2.3298e-24 | true | ok | NaN | 1.4888e-12 | first\_order |
| 100.0 | Ipopt | 5.1428167e7 | 449 | 1949984 | 3 | 2.3299e-24 | true | ok | NaN | 1.4885e-12 | first\_order |
| 100.0 | JSOSolvers (tron) | 4.907967085e8 | 846 | 81088 | 12 | 1.8452e-13 | true | ok | NaN | 6.8250e-06 | first\_order |
| 100.0 | JSOSolvers (trunk) | 4.38788333e8 | 629 | 60656 | 9 | 2.1927e-13 | true | ok | NaN | 7.3102e-06 | first\_order |
| 100.0 | LeastSquaresOptim (Dogleg) | 7.394938e6 | 124 | 751664 | 5 | 3.7993e-31 | true | ok | NaN | 1.7414e-15 | converged |
| 100.0 | LeastSquaresOptim (LM) | 1.7596896e7 | 196 | 1159136 | 9 | 5.1609e-19 | true | ok | NaN | 1.1760e-08 | converged |
| 100.0 | MadNLP | 7.49025e7 | 613 | 810480 | 4 | 2.0205e-28 | true | ok | NaN | 2.0573e-13 | SOLVE\_SUCCEEDED |
| 100.0 | NonlinearSolve (LM) | 1.5422667e7 | 349 | 2631392 | 13 | 3.6256e-27 | true | ok | NaN | 2.6062e-13 | Success |
| 100.0 | NonlinearSolve (TrustRegion) | 1.12546665e7 | 155 | 797808 | 11 | 1.4531e-27 | true | ok | NaN | 3.9016e-14 | Success |
| 100.0 | Optim (Newton) | 2.791042e6 | 79 | 174352 | 3 | 2.3301e-24 | true | ok | NaN | 1.4888e-12 | converged |
| 100.0 | Optim (NewtonTrustRegion) | 7.7619165e6 | 366 | 3859104 | 5 | 2.8740e-18 | true | ok | NaN | 7.6069e-10 | converged |
| 100.0 | SecondOrderOptimization | 7.3681583e7 | 21002 | 2650016 | 3 | 1.4100e-23 | true | ok | NaN | 5.0177e-11 | grad\_tol |
| 1000.0 | CaNNOLeS | 1.9519208e7 | 241 | 8340464 | 3 | 6.7711e-25 | true | ok | NaN | 1.4900e-12 | first\_order |
| 1000.0 | Ipopt | 5.1558584e7 | 449 | 1949984 | 3 | 6.7716e-25 | true | ok | NaN | 1.4900e-12 | first\_order |
| 1000.0 | JSOSolvers (tron) | 1.327570417e9 | 2038 | 138304 | 13 | 1.8837e-12 | false | wrong_solution | NaN | 1.8993e-04 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.90e-04, above 1e-04 |
| 1000.0 | JSOSolvers (trunk) | 9.310664585e8 | 1348 | 95168 | 11 | 1.7283e-11 | false | wrong_solution | NaN | 5.6287e-04 | first\_order; claimed convergence and the cost test passes, but the solution error is 5.63e-04, above 1e-04 |
| 1000.0 | LeastSquaresOptim (Dogleg) | 7.6448335e6 | 124 | 751664 | 5 | 1.4328e-31 | true | ok | NaN | 9.4955e-15 | converged |
| 1000.0 | LeastSquaresOptim (LM) | 1.96101875e7 | 234 | 1322592 | 11 | 6.3326e-15 | true | ok | NaN | 1.2155e-05 | converged |
| 1000.0 | MadNLP | 7.5157792e7 | 613 | 810480 | 4 | 6.5948e-20 | true | ok | NaN | 1.8412e-08 | SOLVE\_SUCCEEDED |
| 1000.0 | NonlinearSolve (LM) | 1.9525417e7 | 401 | 2934432 | 17 | 4.9080e-28 | true | ok | NaN | 7.0426e-13 | Success |
| 1000.0 | NonlinearSolve (TrustRegion) | 1.15742915e7 | 155 | 797808 | 11 | 1.0967e-27 | true | ok | NaN | 7.3123e-14 | Success |
| 1000.0 | Optim (Newton) | 2.814396e6 | 79 | 174352 | 3 | 6.7722e-25 | true | ok | NaN | 1.4891e-12 | converged |
| 1000.0 | Optim (NewtonTrustRegion) | 7.831417e6 | 378 | 4025888 | 5 | 2.8412e-16 | true | ok | NaN | 7.8399e-09 | converged |
| 1000.0 | SecondOrderOptimization | 8.3919854e7 | 21002 | 2650016 | 3 | 3.8440e-20 | true | ok | NaN | 2.8295e-08 | grad\_tol |
| 10000.0 | CaNNOLeS | 1.9646792e7 | 241 | 8340464 | 3 | 2.6071e-25 | true | ok | NaN | 1.4704e-12 | first\_order |
| 10000.0 | Ipopt | 5.1879916e7 | 449 | 1949984 | 3 | 2.6066e-25 | true | ok | NaN | 1.4713e-12 | first\_order |
| 10000.0 | JSOSolvers (tron) | 2.212327e9 | 3354 | 201472 | 20 | 9.4396e-12 | false | wrong_solution | NaN | 2.8551e-03 | first\_order; claimed convergence and the cost test passes, but the solution error is 2.86e-03, above 1e-04 |
| 10000.0 | JSOSolvers (trunk) | 9.79594083e8 | 1406 | 97952 | 11 | 1.5092e-10 | false | wrong_solution | NaN | 6.2768e-03 | first\_order; claimed convergence and the cost test passes, but the solution error is 6.28e-03, above 1e-04 |
| 10000.0 | LeastSquaresOptim (Dogleg) | 7.59825e6 | 124 | 751664 | 5 | 9.6852e-32 | true | ok | NaN | 7.8164e-14 | converged |
| 10000.0 | LeastSquaresOptim (LM) | 2.9823875e7 | 310 | 1649504 | 15 | 2.4871e-17 | true | ok | NaN | 7.8032e-06 | converged |
| 10000.0 | MadNLP | 7.6849646e7 | 613 | 810480 | 4 | 3.9184e-15 | true | ok | NaN | 1.2917e-05 | SOLVE\_SUCCEEDED |
| 10000.0 | NonlinearSolve (LM) | 2.5651916e7 | 440 | 3161712 | 20 | 1.8013e-26 | true | ok | NaN | 2.2894e-11 | Success |
| 10000.0 | NonlinearSolve (TrustRegion) | 1.37957915e7 | 155 | 797808 | 10 | 8.9795e-29 | true | ok | NaN | 7.1222e-14 | Success |
| 10000.0 | Optim (Newton) | 2.808792e6 | 79 | 174352 | 3 | 2.6070e-25 | true | ok | NaN | 1.4897e-12 | converged |
| 10000.0 | Optim (NewtonTrustRegion) | 1.0065125e7 | 484 | 5313488 | 6 | 1.2131e-26 | true | ok | NaN | 3.7817e-13 | converged |
| 10000.0 | SecondOrderOptimization | 7.6914e7 | 21002 | 2650016 | 3 | 8.7891e-16 | true | ok | NaN | 3.0538e-05 | grad\_tol |
| 100000.0 | CaNNOLeS | 1.9018625e7 | 241 | 8340464 | 3 | 1.4045e-25 | true | ok | NaN | 1.7398e-12 | first\_order |
| 100000.0 | Ipopt | 5.3685167e7 | 449 | 1949984 | 3 | 1.4050e-25 | true | ok | NaN | 1.5612e-12 | first\_order |
| 100000.0 | JSOSolvers (tron) | 2.017441625e9 | 3103 | 189424 | 23 | 1.3389e-11 | false | wrong_solution | NaN | 8.7674e-03 | first\_order; claimed convergence and the cost test passes, but the solution error is 8.77e-03, above 1e-04 |
| 100000.0 | JSOSolvers (trunk) | 9.865997085e8 | 1432 | 99200 | 13 | 2.8939e-10 | false | wrong_solution | NaN | 1.5010e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.50e-02, above 1e-04 |
| 100000.0 | LeastSquaresOptim (Dogleg) | 8.414042e6 | 124 | 751664 | 5 | 6.2971e-32 | true | ok | NaN | 2.7188e-13 | converged |
| 100000.0 | LeastSquaresOptim (LM) | 3.7647604e7 | 386 | 1976416 | 19 | 1.0210e-17 | true | ok | NaN | 4.7517e-05 | converged |
| 100000.0 | MadNLP | 7.6267625e7 | 613 | 810480 | 4 | 5.9902e-13 | false | wrong_solution | NaN | 4.2809e-03 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 4.28e-03, above 1e-04 |
| 100000.0 | NonlinearSolve (LM) | 3.0325584e7 | 492 | 3464752 | 24 | 1.5899e-28 | true | ok | NaN | 3.8478e-11 | Success |
| 100000.0 | NonlinearSolve (TrustRegion) | 1.59659795e7 | 155 | 797808 | 7 | 4.3164e-30 | true | ok | NaN | 2.7135e-13 | Success |
| 100000.0 | Optim (Newton) | 2.818e6 | 79 | 174352 | 3 | 1.4050e-25 | true | ok | NaN | 1.6657e-12 | converged |
| 100000.0 | Optim (NewtonTrustRegion) | 9.375104e6 | 436 | 4646352 | 6 | 3.4609e-19 | true | ok | NaN | 6.2301e-10 | converged |
| 100000.0 | SecondOrderOptimization | 1.34068084e8 | 31446 | 3034720 | 5 | 4.5748e-18 | true | ok | NaN | 1.3011e-05 | grad\_tol |
| 1.0e6 | CaNNOLeS | 1.9564208e7 | 241 | 8340464 | 3 | 9.7590e-26 | true | ok | NaN | 4.3622e-11 | first\_order |
| 1.0e6 | Ipopt | 5.26926455e7 | 449 | 1949984 | 3 | 9.7526e-26 | true | ok | NaN | 2.1798e-12 | first\_order |
| 1.0e6 | JSOSolvers (tron) | 1.65437975e9 | 2555 | 163120 | 24 | 1.6041e-10 | false | wrong_solution | NaN | 2.2608e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 2.26e-02, above 1e-04 |
| 1.0e6 | JSOSolvers (trunk) | 9.0680075e8 | 1298 | 92768 | 14 | 4.7819e-10 | false | wrong_solution | NaN | 2.6445e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 2.64e-02, above 1e-04 |
| 1.0e6 | LeastSquaresOptim (Dogleg) | 7.7445625e6 | 124 | 751664 | 5 | 3.6952e-32 | true | ok | NaN | 1.8188e-12 | converged |
| 1.0e6 | LeastSquaresOptim (LM) | 4.8817646e7 | 500 | 2466784 | 25 | 1.6496e-15 | false | wrong_solution | NaN | 2.4100e-03 | converged; claimed convergence and the cost test passes, but the solution error is 2.41e-03, above 1e-04 |
| 1.0e6 | MadNLP | 7.49447295e7 | 613 | 810480 | 4 | 2.9523e-13 | false | wrong_solution | NaN | 5.5970e-03 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 5.60e-03, above 1e-04 |
| 1.0e6 | NonlinearSolve (LM) | 3.6870771e7 | 531 | 3692032 | 27 | 6.6420e-28 | true | ok | NaN | 4.0791e-09 | Success |
| 1.0e6 | NonlinearSolve (TrustRegion) | 1.5914167e7 | 155 | 797808 | 7 | 3.1810e-29 | true | ok | NaN | 2.1245e-12 | Success |
| 1.0e6 | Optim (Newton) | 2.8558335e6 | 79 | 174352 | 3 | 9.7583e-26 | true | ok | NaN | 4.4529e-11 | converged |
| 1.0e6 | Optim (NewtonTrustRegion) | 9.415271e6 | 436 | 4646352 | 6 | 4.1904e-18 | true | ok | NaN | 2.9977e-09 | converged |
| 1.0e6 | SecondOrderOptimization | 1.88293166e8 | 47103 | 3611632 | 7 | 2.3899e-15 | false | wrong_solution | NaN | 1.9317e-03 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 1.93e-03, above 1e-04 |
| 1.0e7 | CaNNOLeS | 1.9492291e7 | 241 | 8340464 | 3 | 9.5758e-26 | true | ok | NaN | 1.8315e-08 | first\_order |
| 1.0e7 | Ipopt | 5.3685417e7 | 449 | 1949984 | 3 | 7.7478e-26 | true | ok | NaN | 2.2521e-11 | first\_order |
| 1.0e7 | JSOSolvers (tron) | 1.434577e9 | 2263 | 149104 | 25 | 9.0046e-11 | false | wrong_solution | NaN | 3.0778e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 3.08e-02, above 1e-04 |
| 1.0e7 | JSOSolvers (trunk) | 7.851394375e8 | 1161 | 86192 | 12 | 6.9231e-10 | false | wrong_solution | NaN | 3.9909e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 3.99e-02, above 1e-04 |
| 1.0e7 | LeastSquaresOptim (Dogleg) | 7.5218335e6 | 124 | 751664 | 5 | 3.3001e-32 | true | ok | NaN | 2.0798e-11 | converged |
| 1.0e7 | LeastSquaresOptim (LM) | 5.81358125e7 | 557 | 2711968 | 28 | 4.2095e-15 | false | wrong_solution | NaN | 7.4274e-03 | converged; claimed convergence and the cost test passes, but the solution error is 7.43e-03, above 1e-04 |
| 1.0e7 | MadNLP | 7.6370291e7 | 613 | 810480 | 4 | 2.1921e-13 | false | wrong_solution | NaN | 7.5742e-03 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 7.57e-03, above 1e-04 |
| 1.0e7 | NonlinearSolve (LM) | 4.2213729e7 | 583 | 3995072 | 31 | 8.8409e-29 | true | ok | NaN | 4.8203e-09 | Success |
| 1.0e7 | NonlinearSolve (TrustRegion) | 1.5902563e7 | 155 | 797808 | 7 | 1.9150e-28 | true | ok | NaN | 2.4280e-11 | Success |
| 1.0e7 | Optim (Newton) | 2.8700005e6 | 79 | 174352 | 3 | 6.2803e-25 | true | ok | NaN | 2.1247e-08 | converged |
| 1.0e7 | Optim (NewtonTrustRegion) | 9.596875e6 | 436 | 4646352 | 6 | 2.2299e-17 | true | ok | NaN | 1.9521e-07 | converged |
| 1.0e7 | SecondOrderOptimization | 3.31487833e8 | 78422 | 4765536 | 12 | 2.7342e-15 | false | wrong_solution | NaN | 6.2786e-03 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 6.28e-03, above 1e-04 |
| 1.0e8 | CaNNOLeS | 1.9091416e7 | 241 | 8340464 | 3 | 2.3793e-15 | false | wrong_solution | NaN | 1.6926e-03 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.69e-03, above 1e-04 |
| 1.0e8 | Ipopt | 5.2254875e7 | 449 | 1949984 | 3 | 6.5464e-26 | true | ok | NaN | 1.8816e-10 | first\_order |
| 1.0e8 | JSOSolvers (tron) | 1.441951917e9 | 2227 | 147376 | 27 | 2.4721e-10 | false | wrong_solution | NaN | 4.7579e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 4.76e-02, above 1e-04 |
| 1.0e8 | JSOSolvers (trunk) | 7.43658021e8 | 1076 | 82112 | 11 | 6.5361e-10 | false | above_reference | NaN | 5.3971e-02 | first\_order; claimed convergence at cost 6.536121e-10, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e8 | LeastSquaresOptim (Dogleg) | 6.3206665e6 | 105 | 669936 | 4 | 9.0278e-31 | true | ok | NaN | 3.0007e-10 | converged |
| 1.0e8 | LeastSquaresOptim (LM) | 6.4224896e7 | 595 | 2875424 | 30 | 4.4428e-15 | false | wrong_solution | NaN | 1.3032e-02 | converged; claimed convergence and the cost test passes, but the solution error is 1.30e-02, above 1e-04 |
| 1.0e8 | MadNLP | 9.7319791e7 | 621 | 810640 | 5 | 2.0844e-14 | false | wrong_solution | NaN | 9.5870e-02 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 9.59e-02, above 1e-04 |
| 1.0e8 | NonlinearSolve (LM) | 4.68036875e7 | 635 | 4298112 | 35 | 7.1213e-29 | true | ok | NaN | 1.6771e-08 | Success |
| 1.0e8 | NonlinearSolve (TrustRegion) | 5.594219585e8 | 155 | 797808 | 191 | 5.3624e-26 | true | ok | NaN | 1.9047e-10 | StalledSuccess |
| 1.0e8 | Optim (Newton) | 2.8518335e6 | 79 | 174352 | 3 | 1.5733e-17 | false | wrong_solution | NaN | 2.8771e-04 | converged; claimed convergence and the cost test passes, but the solution error is 2.88e-04, above 1e-04 |
| 1.0e8 | Optim (NewtonTrustRegion) | 7.4863955e6 | 268 | 2524816 | 5 | 1.9047e-14 | false | wrong_solution | NaN | 3.1365e-02 | converged; claimed convergence and the cost test passes, but the solution error is 3.14e-02, above 1e-04 |
| 1.0e8 | SecondOrderOptimization | 2.99961208e8 | 73202 | 4573216 | 11 | 4.8682e-15 | false | wrong_solution | NaN | 1.2579e-02 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 1.26e-02, above 1e-04 |
| 1.0e9 | CaNNOLeS | 1.69731334e8 | 271 | 8341904 | 18 | 7.8590e-12 | false | wrong_solution | NaN | 4.2400e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 4.24e-02, above 1e-04 |
| 1.0e9 | Ipopt | 5.5040417e7 | 449 | 1949984 | 3 | 5.6736e-26 | true | ok | NaN | 3.2724e-09 | first\_order |
| 1.0e9 | JSOSolvers (tron) | 1.735160584e9 | 2668 | 168544 | 32 | 2.8498e-10 | false | wrong_solution | NaN | 6.3841e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 6.38e-02, above 1e-04 |
| 1.0e9 | JSOSolvers (trunk) | 8.731161455e8 | 1255 | 90704 | 13 | 1.2636e-09 | false | above_reference | NaN | 7.6969e-02 | first\_order; claimed convergence at cost 1.263592e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e9 | LeastSquaresOptim (Dogleg) | 6.1312085e6 | 105 | 669936 | 4 | 1.4459e-31 | true | ok | NaN | 1.5274e-09 | converged |
| 1.0e9 | LeastSquaresOptim (LM) | 6.09027505e7 | 652 | 3120608 | 33 | 8.4390e-15 | false | wrong_solution | NaN | 2.1160e-02 | converged; claimed convergence and the cost test passes, but the solution error is 2.12e-02, above 1e-04 |
| 1.0e9 | MadNLP | 2.98190083e8 | 709 | 812400 | 16 | 1.4029e-09 | false | above_reference | NaN | 6.5810e-02 | SOLVE\_SUCCEEDED; claimed convergence at cost 1.402928e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e9 | NonlinearSolve (LM) | 4.48321875e7 | 661 | 4449632 | 37 | 8.2325e-27 | true | ok | NaN | 1.2068e-05 | Success |
| 1.0e9 | NonlinearSolve (TrustRegion) | 1.499652833e9 | 155 | 797808 | 500 | 1.9331e-21 | false | not_converged | NaN | 2.6629e-03 | MaxIters; cost test passes |
| 1.0e9 | Optim (Newton) | 4.8889792e7 | 506 | 366624 | 7 | 4.5192e-02 | false | above_reference | NaN | 1.8391e+07 | converged; claimed convergence at cost 4.519237e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e9 | Optim (NewtonTrustRegion) | 2.3320042e7 | 692 | 6750832 | 18 | 2.6832e-12 | false | wrong_solution | NaN | 5.3593e-01 | converged; claimed convergence and the cost test passes, but the solution error is 5.36e-01, above 1e-04 |
| 1.0e9 | SecondOrderOptimization | 2.839772085e8 | 62749 | 4188368 | 8 | 3.3812e-14 | false | wrong_solution | NaN | 2.3563e-02 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 2.36e-02, above 1e-04 |
| 1.0e10 | CaNNOLeS | 1.83538292e8 | 275 | 8342096 | 20 | 1.2785e-11 | false | wrong_solution | NaN | 5.7358e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 5.74e-02, above 1e-04 |
| 1.0e10 | Ipopt | 9.6804521e7 | 620 | 1978640 | 6 | 3.6722e-12 | false | wrong_solution | NaN | 1.5989e-01 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.60e-01, above 1e-04 |
| 1.0e10 | JSOSolvers (tron) | 1.020533125e9 | 1647 | 119536 | 23 | 9.1196e-10 | false | above_reference | NaN | 9.5968e-02 | first\_order; claimed convergence at cost 9.119648e-10, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e10 | JSOSolvers (trunk) | 8.082981045e8 | 1186 | 87392 | 13 | 1.9710e-09 | false | above_reference | NaN | 1.0667e-01 | first\_order; claimed convergence at cost 1.970971e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e10 | LeastSquaresOptim (Dogleg) | 6.2361875e6 | 105 | 669936 | 4 | 5.2555e-32 | true | ok | NaN | 4.2296e-08 | converged |
| 1.0e10 | LeastSquaresOptim (LM) | 6.8827667e7 | 728 | 3447520 | 37 | 1.4656e-14 | false | wrong_solution | NaN | 3.0598e-02 | converged; claimed convergence and the cost test passes, but the solution error is 3.06e-02, above 1e-04 |
| 1.0e10 | MadNLP | 4.68201791e8 | 847 | 814896 | 25 | 9.7933e-11 | false | wrong_solution | NaN | 2.2996e-01 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 2.30e-01, above 1e-04 |
| 1.0e10 | NonlinearSolve (LM) | 7.8279791e7 | 1155 | 7328512 | 75 | 1.0837e-28 | true | ok | NaN | 3.1416e-06 | Success |
| 1.0e10 | NonlinearSolve (TrustRegion) | 1.496655042e9 | 155 | 797808 | 500 | 1.0469e-20 | false | not_converged | NaN | 7.1436e-03 | MaxIters; cost test passes |
| 1.0e10 | Optim (Newton) | 4.2354625e7 | 446 | 375152 | 6 | 3.1441e-02 | false | above_reference | NaN | 1.2067e+07 | converged; claimed convergence at cost 3.144107e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e10 | Optim (NewtonTrustRegion) | 1.8667771e7 | 507 | 4558832 | 15 | 3.9900e-13 | false | wrong_solution | NaN | 1.9101e-01 | converged; claimed convergence and the cost test passes, but the solution error is 1.91e-01, above 1e-04 |
| 1.0e10 | SecondOrderOptimization | 3.38811459e8 | 78435 | 4765744 | 13 | 4.6654e-15 | false | wrong_solution | NaN | 2.5955e-02 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 2.60e-02, above 1e-04 |
| 1.0e11 | CaNNOLeS | 2.14650667e8 | 281 | 8342384 | 23 | 2.0540e-11 | false | wrong_solution | NaN | 7.6357e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 7.64e-02, above 1e-04 |
| 1.0e11 | Ipopt | 3.91218542e8 | 1673 | 2166464 | 23 | 2.0592e-14 | false | wrong_solution | NaN | 1.1832e+00 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.18e+00, above 1e-04 |
| 1.0e11 | JSOSolvers (tron) | 1.168975708e9 | 1853 | 129424 | 28 | 1.4820e-09 | false | above_reference | NaN | 1.3273e-01 | first\_order; claimed convergence at cost 1.482040e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e11 | JSOSolvers (trunk) | 1.001486729e9 | 1444 | 99776 | 16 | 2.4771e-09 | false | above_reference | NaN | 1.4437e-01 | first\_order; claimed convergence at cost 2.477134e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e11 | LeastSquaresOptim (Dogleg) | 6.1378335e6 | 105 | 669936 | 4 | 4.7779e-32 | true | ok | NaN | 2.3370e-07 | converged |
| 1.0e11 | LeastSquaresOptim (LM) | 9.1747209e7 | 842 | 3937888 | 43 | 1.6318e-14 | false | wrong_solution | NaN | 4.0029e-02 | converged; claimed convergence and the cost test passes, but the solution error is 4.00e-02, above 1e-04 |
| 1.0e11 | MadNLP | 6.198417705e8 | 953 | 816848 | 33 | 7.4898e-10 | false | above_reference | NaN | 1.2184e-01 | SOLVE\_SUCCEEDED; claimed convergence at cost 7.489768e-10, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e11 | NonlinearSolve (LM) | 1.02067125e8 | 1363 | 8540672 | 91 | 1.3246e-28 | true | ok | NaN | 2.4847e-05 | Success |
| 1.0e11 | NonlinearSolve (TrustRegion) | 1.514598125e9 | 155 | 797808 | 500 | 1.1826e-20 | false | not_converged | NaN | 1.0570e-02 | MaxIters; cost test passes |
| 1.0e11 | Optim (Newton) | 3.42355e7 | 532 | 409344 | 7 | 3.7758e-02 | false | above_reference | NaN | 1.1904e+06 | converged; claimed convergence at cost 3.775847e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e11 | Optim (NewtonTrustRegion) | 2.2999208e7 | 608 | 5714832 | 17 | 3.0682e-13 | false | wrong_solution | NaN | 1.8809e-01 | converged; claimed convergence and the cost test passes, but the solution error is 1.88e-01, above 1e-04 |
| 1.0e11 | SecondOrderOptimization | 6.12385979e8 | 130633 | 6688912 | 21 | 1.7112e-14 | false | wrong_solution | NaN | 3.8435e-02 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 3.84e-02, above 1e-04 |
| 1.0e12 | CaNNOLeS | 2.80654104e8 | 293 | 8342960 | 29 | 3.1017e-11 | false | wrong_solution | NaN | 1.0072e-01 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.01e-01, above 1e-04 |
| 1.0e12 | Ipopt | 4.15225958e8 | 1687 | 2170704 | 23 | 5.9893e-15 | false | wrong_solution | NaN | 1.3281e+00 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.33e+00, above 1e-04 |
| 1.0e12 | JSOSolvers (tron) | 1.77284925e9 | 2734 | 171712 | 36 | 1.1064e-09 | false | above_reference | NaN | 1.6742e-01 | first\_order; claimed convergence at cost 1.106401e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e12 | JSOSolvers (trunk) | 9.604428125e8 | 1390 | 97184 | 16 | 4.1829e-09 | false | above_reference | NaN | 2.0822e-01 | first\_order; claimed convergence at cost 4.182909e-09, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e12 | LeastSquaresOptim (Dogleg) | 6.2270005e6 | 105 | 669936 | 4 | 1.7374e-29 | true | ok | NaN | 1.0574e-06 | converged |
| 1.0e12 | LeastSquaresOptim (LM) | 8.3049792e7 | 899 | 4183072 | 46 | 2.4529e-14 | false | wrong_solution | NaN | 5.2243e-02 | converged; claimed convergence and the cost test passes, but the solution error is 5.22e-02, above 1e-04 |
| 1.0e12 | MadNLP | 7.469267915e8 | 931 | 816720 | 40 | 7.7450e-10 | false | above_reference | NaN | 1.4122e-01 | SOLVE\_SUCCEEDED; claimed convergence at cost 7.745027e-10, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e12 | NonlinearSolve (LM) | 9.8604583e7 | 1376 | 8616432 | 92 | 9.6655e-29 | false | wrong_solution | NaN | 2.2228e-04 | Success; claimed convergence and the cost test passes, but the solution error is 2.22e-04, above 1e-04 |
| 1.0e12 | NonlinearSolve (TrustRegion) | 1.513974583e9 | 155 | 797808 | 500 | 1.6288e-20 | false | not_converged | NaN | 1.5141e-02 | MaxIters; cost test passes |
| 1.0e12 | Optim (Newton) | 7.7827458e7 | 897 | 578640 | 12 | 2.2657e-02 | false | above_reference | NaN | 4.6663e+06 | converged; claimed convergence at cost 2.265683e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1.0e12 | Optim (NewtonTrustRegion) | 2.0514979e7 | 632 | 5966448 | 17 | 2.0213e-11 | false | wrong_solution | NaN | 3.1788e+00 | converged; claimed convergence and the cost test passes, but the solution error is 3.18e+00, above 1e-04 |
| 1.0e12 | SecondOrderOptimization | 7.285195835e8 | 172420 | 8227904 | 30 | 2.3793e-14 | false | wrong_solution | NaN | 4.9070e-02 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 4.91e-02, above 1e-04 |
