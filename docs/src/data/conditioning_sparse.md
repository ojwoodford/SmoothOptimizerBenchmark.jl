# Benchmark Results: Sparse Conditioning Sweep

- **Category**: large_sparse
- **Scaling Metric**: Condition Number κ
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T16:45:28
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
| 10.0 | JuMP | 2.3165958e7 | 2 | 32 | 6.5426833e7 | 5 | 128 |
| 10.0 | NLLSModel (Sparse) | 12250.0 | 1 | 16 | 498042.0 | 1 | 64 |
| 10.0 | Standalone (Sparse) | 101250.0 | 1 | 16 | 1.880958e6 | 25 | 7897712 |
| 30.0 | JuMP | 2.3824458e7 | 2 | 32 | 6.7888583e7 | 5 | 128 |
| 30.0 | NLLSModel (Sparse) | 11916.0 | 1 | 16 | 468292.0 | 1 | 64 |
| 30.0 | Standalone (Sparse) | 99666.0 | 1 | 16 | 1.902e6 | 25 | 7897712 |
| 100.0 | JuMP | 2.3184209e7 | 2 | 32 | 6.5639875e7 | 5 | 128 |
| 100.0 | NLLSModel (Sparse) | 11750.0 | 1 | 16 | 499625.0 | 1 | 64 |
| 100.0 | Standalone (Sparse) | 101375.0 | 1 | 16 | 1.895417e6 | 25 | 7897712 |
| 300.0 | JuMP | 2.6846334e7 | 2 | 32 | 7.6548834e7 | 5 | 128 |
| 300.0 | NLLSModel (Sparse) | 11833.0 | 1 | 16 | 477542.0 | 1 | 64 |
| 300.0 | Standalone (Sparse) | 107084.0 | 1 | 16 | 1.914625e6 | 25 | 7897712 |
| 1000.0 | JuMP | 2.5387959e7 | 2 | 32 | 7.008425e7 | 5 | 128 |
| 1000.0 | NLLSModel (Sparse) | 11792.0 | 1 | 16 | 463458.0 | 1 | 64 |
| 1000.0 | Standalone (Sparse) | 103583.0 | 1 | 16 | 1.9615e6 | 25 | 7897712 |
| 3000.0 | JuMP | 2.3444084e7 | 2 | 32 | 6.8098541e7 | 5 | 128 |
| 3000.0 | NLLSModel (Sparse) | 11750.0 | 1 | 16 | 466667.0 | 1 | 64 |
| 3000.0 | Standalone (Sparse) | 100250.0 | 1 | 16 | 1.891e6 | 25 | 7897712 |
| 10000.0 | JuMP | 2.4554875e7 | 2 | 32 | 7.3853875e7 | 5 | 128 |
| 10000.0 | NLLSModel (Sparse) | 11875.0 | 1 | 16 | 493583.0 | 1 | 64 |
| 10000.0 | Standalone (Sparse) | 99750.0 | 1 | 16 | 1.874958e6 | 25 | 7897712 |
| 30000.0 | JuMP | 3.0656e7 | 2 | 32 | 7.8536708e7 | 5 | 128 |
| 30000.0 | NLLSModel (Sparse) | 11875.0 | 1 | 16 | 468875.0 | 1 | 64 |
| 30000.0 | Standalone (Sparse) | 102708.0 | 1 | 16 | 2.02125e6 | 25 | 7897712 |
| 100000.0 | JuMP | 2.8580625e7 | 2 | 32 | 7.235575e7 | 5 | 128 |
| 100000.0 | NLLSModel (Sparse) | 11792.0 | 1 | 16 | 486208.0 | 1 | 64 |
| 100000.0 | Standalone (Sparse) | 101458.0 | 1 | 16 | 1.989959e6 | 25 | 7897712 |
| 300000.0 | JuMP | 2.8348583e7 | 2 | 32 | 7.0208625e7 | 5 | 128 |
| 300000.0 | NLLSModel (Sparse) | 41583.0 | 1 | 16 | 477791.0 | 1 | 64 |
| 300000.0 | Standalone (Sparse) | 102833.0 | 1 | 16 | 1.95e6 | 25 | 7897712 |
| 1.0e6 | JuMP | 2.59825e7 | 2 | 32 | 6.9417708e7 | 5 | 128 |
| 1.0e6 | NLLSModel (Sparse) | 11833.0 | 1 | 16 | 461833.0 | 1 | 64 |
| 1.0e6 | Standalone (Sparse) | 98917.0 | 1 | 16 | 1.922042e6 | 25 | 7897712 |
| 3.0e6 | JuMP | 2.7335708e7 | 2 | 32 | 7.3307333e7 | 5 | 128 |
| 3.0e6 | NLLSModel (Sparse) | 41666.0 | 1 | 16 | 501625.0 | 1 | 64 |
| 3.0e6 | Standalone (Sparse) | 100250.0 | 1 | 16 | 1.93075e6 | 25 | 7897712 |
| 1.0e7 | JuMP | 2.5511666e7 | 2 | 32 | 7.2903875e7 | 5 | 128 |
| 1.0e7 | NLLSModel (Sparse) | 12042.0 | 1 | 16 | 607958.0 | 1 | 64 |
| 1.0e7 | Standalone (Sparse) | 105250.0 | 1 | 16 | 1.931166e6 | 25 | 7897712 |
| 3.0e7 | JuMP | 2.5319709e7 | 2 | 32 | 7.2503583e7 | 5 | 128 |
| 3.0e7 | NLLSModel (Sparse) | 11709.0 | 1 | 16 | 484042.0 | 1 | 64 |
| 3.0e7 | Standalone (Sparse) | 101000.0 | 1 | 16 | 1.89025e6 | 25 | 7897712 |
| 1.0e8 | JuMP | 2.6131125e7 | 2 | 32 | 7.340475e7 | 5 | 128 |
| 1.0e8 | NLLSModel (Sparse) | 11875.0 | 1 | 16 | 482709.0 | 1 | 64 |
| 1.0e8 | Standalone (Sparse) | 105541.0 | 1 | 16 | 1.932584e6 | 25 | 7897712 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 10.0 | CaNNOLeS | 1.27408666e8 | 258 | 41497472 | 3 | 1.4881e-20 | true | ok | NaN | 8.5278e-12 | first\_order |
| 10.0 | Ipopt | 7.06165854e8 | 373 | 16245584 | 1 | 9.3292e-02 | false | above_reference | NaN | 1.7202e-02 | acceptable; claimed convergence at cost 9.329156e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 10.0 | JSOSolvers (tron) | 2.455261791e9 | 435 | 6606080 | 12 | 3.4156e-16 | true | ok | NaN | 1.2673e-09 | first\_order |
| 10.0 | JSOSolvers (trunk) | 1.623530208e9 | 282 | 4468784 | 11 | 2.2400e-15 | true | ok | NaN | 3.4975e-09 | first\_order |
| 10.0 | LeastSquaresOptim (Dogleg) | 9.7076416e7 | 122 | 3456976 | 8 | 4.1853e-26 | true | ok | NaN | 1.4353e-14 | converged |
| 10.0 | LeastSquaresOptim (LM) | 9.74194165e7 | 203 | 3239264 | 20 | 4.8162e-15 | true | ok | NaN | 5.1809e-09 | converged |
| 10.0 | MadNLP | 2.65649625e8 | 645 | 20090416 | 3 | 2.2497e-17 | true | ok | NaN | 3.6137e-10 | SOLVE\_SUCCEEDED |
| 10.0 | NonlinearSolve (LM) | 3.8567008583e10 | 1220 | 208733936 | 3 | 5.1275e+01 | false | timeout | NaN | 5.4203e-01 | MaxTime |
| 10.0 | NonlinearSolve (TrustRegion) | 2.387829795e8 | 76074 | 144048528 | 16 | 9.6297e-28 | true | ok | NaN | 1.9491e-15 | Success |
| 10.0 | Optim (Newton) | 3.21774375e7 | 442 | 95039584 | 3 | 1.4881e-20 | true | ok | NaN | 8.5278e-12 | converged |
| 10.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 10.0 | SecondOrderOptimization | 1.30544083e8 | 300 | 65920176 | 3 | 2.8545e-20 | true | ok | NaN | 1.2404e-11 | grad\_tol |
| 30.0 | CaNNOLeS | 1.41031167e8 | 258 | 41497472 | 3 | 1.0951e-21 | true | ok | NaN | 7.1313e-12 | first\_order |
| 30.0 | Ipopt | 7.369449795e8 | 373 | 16245584 | 1 | 1.0428e-02 | false | above_reference | NaN | 1.7101e-02 | acceptable; claimed convergence at cost 1.042800e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 30.0 | JSOSolvers (tron) | 4.494174916e9 | 673 | 6617504 | 13 | 1.2079e-14 | true | ok | NaN | 2.5108e-08 | first\_order |
| 30.0 | JSOSolvers (trunk) | 3.524929666e9 | 504 | 4479440 | 12 | 1.3528e-14 | true | ok | NaN | 2.2748e-08 | first\_order |
| 30.0 | LeastSquaresOptim (Dogleg) | 2.088775e8 | 128 | 3467824 | 8 | 8.1400e-25 | true | ok | NaN | 1.7747e-13 | converged |
| 30.0 | LeastSquaresOptim (LM) | 2.22222208e8 | 237 | 3264576 | 22 | 1.1700e-13 | true | ok | NaN | 7.7314e-08 | converged |
| 30.0 | MadNLP | 2.626228335e8 | 645 | 20090416 | 3 | 1.7400e-18 | true | ok | NaN | 3.0339e-10 | SOLVE\_SUCCEEDED |
| 30.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 30.0 | NonlinearSolve (TrustRegion) | 2.527192705e8 | 76014 | 150076880 | 17 | 6.6929e-29 | true | ok | NaN | 6.2324e-16 | Success |
| 30.0 | Optim (Newton) | 3.5664604e7 | 414 | 95039136 | 3 | 1.0951e-21 | true | ok | NaN | 7.1313e-12 | converged |
| 30.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 30.0 | SecondOrderOptimization | 6.8257334e7 | 300 | 65920176 | 3 | 2.9290e-20 | true | ok | NaN | 3.9558e-11 | grad\_tol |
| 100.0 | CaNNOLeS | 1.35743417e8 | 258 | 41956224 | 3 | 8.7077e-23 | true | ok | NaN | 6.7524e-12 | first\_order |
| 100.0 | Ipopt | 7.209881255e8 | 373 | 16245584 | 1 | 9.4049e-04 | false | above_reference | NaN | 1.7089e-02 | acceptable; claimed convergence at cost 9.404879e-04, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 100.0 | JSOSolvers (tron) | 1.2147523208e10 | 1616 | 6662768 | 14 | 2.0915e-14 | true | ok | NaN | 1.0719e-07 | first\_order |
| 100.0 | JSOSolvers (trunk) | 8.05233375e9 | 1060 | 4506128 | 11 | 1.8185e-13 | true | ok | NaN | 2.9311e-07 | first\_order |
| 100.0 | LeastSquaresOptim (Dogleg) | 4.9703825e8 | 142 | 3525392 | 8 | 2.2951e-22 | true | ok | NaN | 1.0786e-11 | converged |
| 100.0 | LeastSquaresOptim (LM) | 5.39924292e8 | 260 | 3316944 | 21 | 2.0198e-12 | true | ok | NaN | 1.0749e-06 | converged |
| 100.0 | MadNLP | 2.63467229e8 | 645 | 20090416 | 3 | 1.3861e-19 | true | ok | NaN | 2.8584e-10 | SOLVE\_SUCCEEDED |
| 100.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 100.0 | NonlinearSolve (TrustRegion) | 2.93207167e8 | 75990 | 136100768 | 16 | 1.6345e-26 | true | ok | NaN | 7.4088e-14 | Success |
| 100.0 | Optim (Newton) | 3.51999375e7 | 414 | 95039136 | 3 | 8.7076e-23 | true | ok | NaN | 6.7523e-12 | converged |
| 100.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 100.0 | SecondOrderOptimization | 7.3440375e7 | 300 | 65920176 | 3 | 5.1131e-19 | true | ok | NaN | 5.5211e-10 | grad\_tol |
| 300.0 | CaNNOLeS | 1.432040415e8 | 258 | 41956224 | 3 | 9.3572e-24 | true | ok | NaN | 6.6523e-12 | first\_order |
| 300.0 | Ipopt | 7.542145835e8 | 373 | 16245584 | 1 | 1.0456e-04 | false | above_reference | NaN | 1.7088e-02 | acceptable; claimed convergence at cost 1.045612e-04, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 300.0 | JSOSolvers (tron) | 2.8174532459e10 | 3425 | 6749600 | 17 | 9.7207e-13 | true | ok | NaN | 2.1148e-06 | first\_order |
| 300.0 | JSOSolvers (trunk) | 2.0082878542e10 | 2465 | 4573568 | 12 | 2.2449e-12 | true | ok | NaN | 3.3655e-06 | first\_order |
| 300.0 | LeastSquaresOptim (Dogleg) | 1.027737583e9 | 146 | 3623760 | 8 | 2.1497e-19 | true | ok | NaN | 1.0342e-09 | converged |
| 300.0 | LeastSquaresOptim (LM) | 1.2052375e9 | 288 | 3483360 | 21 | 3.0256e-11 | true | ok | NaN | 1.2512e-05 | converged |
| 300.0 | MadNLP | 2.80346167e8 | 645 | 20090416 | 3 | 1.4878e-20 | true | ok | NaN | 2.8103e-10 | SOLVE\_SUCCEEDED |
| 300.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 300.0 | NonlinearSolve (TrustRegion) | 2.621208545e8 | 76014 | 136101152 | 16 | 1.7266e-27 | true | ok | NaN | 7.0352e-14 | Success |
| 300.0 | Optim (Newton) | 3.0789875e7 | 414 | 95039136 | 3 | 9.3571e-24 | true | ok | NaN | 6.6524e-12 | converged |
| 300.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 300.0 | SecondOrderOptimization | 2.87598646e8 | 300 | 65920176 | 3 | 1.9218e-16 | true | ok | NaN | 3.2049e-08 | grad\_tol |
| 1000.0 | CaNNOLeS | 1.38563209e8 | 258 | 41956224 | 3 | 8.3255e-25 | true | ok | NaN | 6.6176e-12 | first\_order |
| 1000.0 | Ipopt | 8.012947705e8 | 373 | 16245584 | 1 | 9.4125e-06 | false | above_reference | NaN | 1.7088e-02 | acceptable; claimed convergence at cost 9.412456e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1000.0 | JSOSolvers (tron) | 3.0120968292e10 | 3808 | 6767984 | 8 | 6.8548e-08 | false | timeout | NaN | 2.0070e-03 | max\_time; cost test passes |
| 1000.0 | JSOSolvers (trunk) | 3.0038182792e10 | 3731 | 4634336 | 10 | 7.8160e-09 | false | timeout | NaN | 6.3401e-04 | max\_time; cost test passes |
| 1000.0 | LeastSquaresOptim (Dogleg) | 2.10163275e9 | 162 | 3908688 | 8 | 1.5122e-16 | true | ok | NaN | 6.8224e-08 | converged |
| 1000.0 | LeastSquaresOptim (LM) | 2.630246167e9 | 279 | 3477872 | 20 | 6.0209e-10 | true | ok | NaN | 1.8641e-04 | converged |
| 1000.0 | MadNLP | 1.86204083e8 | 637 | 20090256 | 2 | 3.1538e-11 | true | ok | NaN | 4.3114e-05 | SOLVE\_SUCCEEDED |
| 1000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1000.0 | NonlinearSolve (TrustRegion) | 3.021602085e8 | 76014 | 136150304 | 16 | 2.0983e-28 | true | ok | NaN | 7.0077e-14 | Success |
| 1000.0 | Optim (Newton) | 2.1550834e7 | 307 | 68625264 | 2 | 2.5858e-12 | true | ok | NaN | 1.1489e-05 | converged |
| 1000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000.0 | SecondOrderOptimization | 6.1195917e7 | 300 | 65920176 | 3 | 4.3721e-12 | true | ok | NaN | 1.6083e-05 | grad\_tol |
| 3000.0 | CaNNOLeS | 1.46284104e8 | 262 | 41956288 | 3 | 9.2141e-26 | true | ok | NaN | 6.6012e-12 | first\_order |
| 3000.0 | Ipopt | 7.68813271e8 | 373 | 16245584 | 1 | 1.0459e-06 | false | above_reference | NaN | 1.7087e-02 | acceptable; claimed convergence at cost 1.045885e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 3000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3000.0 | LeastSquaresOptim (Dogleg) | 4.215053792e9 | 166 | 4154512 | 8 | 4.0231e-13 | true | ok | NaN | 1.1970e-05 | converged |
| 3000.0 | LeastSquaresOptim (LM) | 5.1070975e9 | 284 | 3862240 | 19 | 7.6653e-09 | true | ok | NaN | 2.0043e-03 | converged |
| 3000.0 | MadNLP | 1.83641875e8 | 637 | 20090256 | 2 | 3.4976e-12 | true | ok | NaN | 4.3075e-05 | SOLVE\_SUCCEEDED |
| 3000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 3000.0 | NonlinearSolve (TrustRegion) | 2.99412292e8 | 76012 | 136150272 | 15 | 9.1081e-27 | true | ok | NaN | 1.6563e-12 | Success |
| 3000.0 | Optim (Newton) | 2.14436875e7 | 307 | 68625264 | 2 | 2.8663e-13 | true | ok | NaN | 1.1479e-05 | converged |
| 3000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 3000.0 | SecondOrderOptimization | 8.9422791e7 | 336 | 75864224 | 4 | 1.1376e-13 | true | ok | NaN | 7.7833e-06 | grad\_tol |
| 10000.0 | CaNNOLeS | 1.134390625e8 | 256 | 41956128 | 2 | 2.5757e-14 | true | ok | NaN | 1.1468e-05 | first\_order |
| 10000.0 | Ipopt | 7.94290937e8 | 373 | 16245584 | 1 | 9.4130e-08 | true | ok | NaN | 1.7085e-02 | acceptable |
| 10000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 10000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 10000.0 | LeastSquaresOptim (Dogleg) | 8.0052125e9 | 178 | 4564304 | 8 | 1.5828e-09 | true | ok | NaN | 2.9657e-03 | converged |
| 10000.0 | LeastSquaresOptim (LM) | 8.2151085e9 | 276 | 4368320 | 18 | 3.7362e-07 | true | ok | NaN | 4.6664e-02 | converged |
| 10000.0 | MadNLP | 1.91369625e8 | 637 | 20090256 | 2 | 3.1432e-13 | true | ok | NaN | 4.3033e-05 | SOLVE\_SUCCEEDED |
| 10000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 10000.0 | NonlinearSolve (TrustRegion) | 3.02309083e8 | 76012 | 136150272 | 15 | 9.0180e-28 | true | ok | NaN | 1.6501e-12 | Success |
| 10000.0 | Optim (Newton) | 2.1623834e7 | 307 | 74081136 | 2 | 2.5757e-14 | true | ok | NaN | 1.1468e-05 | converged |
| 10000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000.0 | SecondOrderOptimization | 9.9754416e7 | 372 | 85808272 | 5 | 1.7844e-14 | true | ok | NaN | 1.0273e-05 | grad\_tol |
| 30000.0 | CaNNOLeS | 1.14959292e8 | 256 | 41956128 | 2 | 2.8548e-15 | true | ok | NaN | 1.1445e-05 | first\_order |
| 30000.0 | Ipopt | 7.01416458e8 | 373 | 16245584 | 1 | 1.0458e-08 | true | ok | NaN | 1.7078e-02 | acceptable |
| 30000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 30000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 30000.0 | LeastSquaresOptim (Dogleg) | 7.805016375e9 | 171 | 4819456 | 7 | 7.7972e-07 | true | ok | NaN | 2.0185e-01 | converged |
| 30000.0 | LeastSquaresOptim (LM) | 4.34026292e8 | 133 | 3263136 | 9 | 1.3042e-05 | false | above_reference | NaN | 8.1619e-01 | converged; claimed convergence at cost 1.304240e-05, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 30000.0 | MadNLP | 1.96514667e8 | 637 | 20090256 | 2 | 3.4829e-14 | true | ok | NaN | 4.2940e-05 | SOLVE\_SUCCEEDED |
| 30000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 30000.0 | NonlinearSolve (TrustRegion) | 3.12464271e8 | 76038 | 144047952 | 15 | 2.1528e-28 | true | ok | NaN | 2.3173e-12 | Success |
| 30000.0 | Optim (Newton) | 2.16517915e7 | 323 | 68625520 | 2 | 2.8546e-15 | true | ok | NaN | 1.1444e-05 | converged |
| 30000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 30000.0 | SecondOrderOptimization | 4.3146625e7 | 264 | 55976128 | 2 | 1.1887e-05 | false | above_reference | NaN | 7.7955e-01 | grad\_tol; claimed convergence at cost 1.188672e-05, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 100000.0 | CaNNOLeS | 1.18998208e8 | 256 | 41956128 | 2 | 2.5488e-16 | true | ok | NaN | 1.1365e-05 | first\_order |
| 100000.0 | Ipopt | 7.498249375e8 | 373 | 16245584 | 1 | 9.4107e-10 | true | ok | NaN | 1.7054e-02 | acceptable |
| 100000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 100000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 100000.0 | LeastSquaresOptim (Dogleg) | 1.285044458e9 | 126 | 3550288 | 6 | 1.1771e-06 | false | above_reference | NaN | 8.1649e-01 | converged; claimed convergence at cost 1.177141e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 100000.0 | LeastSquaresOptim (LM) | 3.8202425e8 | 127 | 3244016 | 9 | 1.1772e-06 | false | above_reference | NaN | 8.1649e-01 | converged; claimed convergence at cost 1.177159e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 100000.0 | MadNLP | 1.91965417e8 | 637 | 20090256 | 2 | 3.1067e-15 | true | ok | NaN | 4.2636e-05 | SOLVE\_SUCCEEDED |
| 100000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 100000.0 | NonlinearSolve (TrustRegion) | 2.387434585e8 | 76036 | 144047920 | 14 | 1.5956e-26 | true | ok | NaN | 8.0928e-11 | Success |
| 100000.0 | Optim (Newton) | 2.15439165e7 | 307 | 68625264 | 2 | 2.5494e-16 | true | ok | NaN | 1.1366e-05 | converged |
| 100000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 100000.0 | SecondOrderOptimization | 4.3029166e7 | 264 | 55976128 | 2 | 1.1671e-06 | false | above_reference | NaN | 8.1304e-01 | grad\_tol; claimed convergence at cost 1.167118e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 300000.0 | CaNNOLeS | 1.17312417e8 | 256 | 41956128 | 2 | 2.7693e-17 | true | ok | NaN | 1.1147e-05 | first\_order |
| 300000.0 | Ipopt | 7.496712085e8 | 373 | 16245584 | 1 | 1.0450e-10 | true | ok | NaN | 1.6987e-02 | acceptable |
| 300000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 300000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 300000.0 | LeastSquaresOptim (Dogleg) | 5.01755271e8 | 118 | 3492816 | 6 | 1.3158e-07 | true | ok | NaN | 8.1650e-01 | converged |
| 300000.0 | LeastSquaresOptim (LM) | 4.41420167e8 | 135 | 3248608 | 10 | 1.3158e-07 | true | ok | NaN | 8.1650e-01 | converged |
| 300000.0 | MadNLP | 1.87293333e8 | 637 | 20090256 | 2 | 3.3688e-16 | true | ok | NaN | 4.1822e-05 | SOLVE\_SUCCEEDED |
| 300000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 300000.0 | NonlinearSolve (TrustRegion) | 2.726945625e8 | 76014 | 144047568 | 14 | 1.6589e-27 | true | ok | NaN | 7.4350e-11 | Success |
| 300000.0 | Optim (Newton) | 2.1485709e7 | 307 | 68625264 | 2 | 2.7801e-17 | true | ok | NaN | 1.1173e-05 | converged |
| 300000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 300000.0 | SecondOrderOptimization | 4.2550875e7 | 264 | 55976128 | 2 | 1.3146e-07 | true | ok | NaN | 8.1611e-01 | grad\_tol |
| 1.0e6 | CaNNOLeS | 1.15563e8 | 256 | 41956128 | 2 | 2.3132e-18 | true | ok | NaN | 1.0477e-05 | first\_order |
| 1.0e6 | Ipopt | 6.905705415e8 | 373 | 16245584 | 1 | 9.3860e-12 | true | ok | NaN | 1.6762e-02 | acceptable |
| 1.0e6 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e6 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e6 | LeastSquaresOptim (Dogleg) | 5.80013521e8 | 123 | 3536640 | 7 | 1.2091e-08 | true | ok | NaN | 8.1650e-01 | converged |
| 1.0e6 | LeastSquaresOptim (LM) | 5.17240958e8 | 141 | 3284400 | 11 | 1.2091e-08 | true | ok | NaN | 8.1650e-01 | converged |
| 1.0e6 | MadNLP | 2.11932875e8 | 637 | 20090256 | 2 | 2.7794e-17 | true | ok | NaN | 3.9234e-05 | SOLVE\_SUCCEEDED |
| 1.0e6 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1.0e6 | NonlinearSolve (TrustRegion) | 3.008480205e8 | 76028 | 144047792 | 14 | 1.6976e-28 | true | ok | NaN | 5.8534e-11 | Success |
| 1.0e6 | Optim (Newton) | 2.2989292e7 | 327 | 68625584 | 2 | 2.3210e-18 | true | ok | NaN | 1.0499e-05 | converged |
| 1.0e6 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1.0e6 | SecondOrderOptimization | 5.5892083e7 | 264 | 55976128 | 2 | 1.2090e-08 | true | ok | NaN | 8.1647e-01 | grad\_tol |
| 3.0e6 | CaNNOLeS | 1.21718792e8 | 256 | 41956128 | 2 | 2.1261e-19 | true | ok | NaN | 9.0489e-06 | first\_order |
| 3.0e6 | Ipopt | 6.185093335e8 | 373 | 16245584 | 1 | 1.0364e-12 | true | ok | NaN | 1.6170e-02 | acceptable |
| 3.0e6 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e6 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e6 | LeastSquaresOptim (Dogleg) | 7.96728563e8 | 123 | 3536640 | 7 | 1.4240e-09 | true | ok | NaN | 8.1650e-01 | converged |
| 3.0e6 | LeastSquaresOptim (LM) | 7.379235625e8 | 150 | 3289888 | 12 | 1.4240e-09 | true | ok | NaN | 8.1650e-01 | converged |
| 3.0e6 | MadNLP | 1.23371083e8 | 629 | 20090096 | 1 | 1.0469e-12 | true | ok | NaN | 1.6332e-02 | SOLVE\_SUCCEEDED |
| 3.0e6 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 3.0e6 | NonlinearSolve (TrustRegion) | 2.71169416e8 | 76060 | 143999152 | 13 | 8.0790e-27 | true | ok | NaN | 1.5361e-09 | Success |
| 3.0e6 | Optim (Newton) | 1.23310625e7 | 200 | 42211392 | 1 | 1.0214e-12 | true | ok | NaN | 1.5935e-02 | converged |
| 3.0e6 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 3.0e6 | SecondOrderOptimization | 4.983125e7 | 264 | 55976128 | 2 | 1.4239e-09 | true | ok | NaN | 8.1650e-01 | grad\_tol |
| 1.0e7 | CaNNOLeS | 8.4227625e7 | 254 | 41956032 | 1 | 9.0793e-14 | true | ok | NaN | 1.4401e-02 | first\_order |
| 1.0e7 | Ipopt | 6.150920625e8 | 373 | 16245584 | 1 | 9.1042e-14 | true | ok | NaN | 1.4437e-02 | first\_order |
| 1.0e7 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e7 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e7 | LeastSquaresOptim (Dogleg) | 1.068249875e9 | 123 | 3536640 | 7 | 1.5519e-10 | true | ok | NaN | 8.1650e-01 | converged |
| 1.0e7 | LeastSquaresOptim (LM) | 9.636745e8 | 170 | 3304480 | 14 | 1.5519e-10 | true | ok | NaN | 8.1650e-01 | converged |
| 1.0e7 | MadNLP | 1.11890375e8 | 629 | 20090096 | 1 | 8.9273e-14 | true | ok | NaN | 1.4149e-02 | SOLVE\_SUCCEEDED |
| 1.0e7 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1.0e7 | NonlinearSolve (TrustRegion) | 6.90911021e8 | 76384 | 262463296 | 27 | 4.9224e-27 | true | ok | NaN | 3.9571e-09 | Success |
| 1.0e7 | Optim (Newton) | 1.19485e7 | 200 | 42211392 | 1 | 9.2898e-14 | true | ok | NaN | 1.4727e-02 | converged |
| 1.0e7 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1.0e7 | SecondOrderOptimization | 4.489e7 | 264 | 55976128 | 2 | 1.5516e-10 | true | ok | NaN | 8.1650e-01 | grad\_tol |
| 3.0e7 | CaNNOLeS | 8.05272705e7 | 254 | 41956032 | 1 | 1.0047e-14 | true | ok | NaN | 1.1714e-02 | first\_order |
| 3.0e7 | Ipopt | 6.5928775e8 | 373 | 16245584 | 1 | 9.3352e-15 | true | ok | NaN | 1.0944e-02 | first\_order |
| 3.0e7 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e7 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e7 | LeastSquaresOptim (Dogleg) | 1.323169834e9 | 125 | 3618592 | 7 | 2.7406e-11 | true | ok | NaN | 8.1650e-01 | converged |
| 3.0e7 | LeastSquaresOptim (LM) | 1.23363875e9 | 183 | 3395536 | 15 | 2.7405e-11 | true | ok | NaN | 8.1650e-01 | converged |
| 3.0e7 | MadNLP | 1.16320584e8 | 629 | 20090096 | 1 | 1.1873e-14 | true | ok | NaN | 1.4751e-02 | SOLVE\_SUCCEEDED |
| 3.0e7 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 3.0e7 | NonlinearSolve (TrustRegion) | 1.169408334e9 | 76408 | 270360944 | 27 | 6.1945e-28 | true | ok | NaN | 2.9864e-09 | Success |
| 3.0e7 | Optim (Newton) | 1.21623335e7 | 216 | 42211648 | 1 | 5.1495e-15 | true | ok | NaN | 3.4344e-03 | converged |
| 3.0e7 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 3.0e7 | SecondOrderOptimization | 4.3790417e7 | 264 | 55976128 | 2 | 2.7397e-11 | true | ok | NaN | 8.1650e-01 | grad\_tol |
| 1.0e8 | CaNNOLeS | 8.2826333e7 | 254 | 41956032 | 1 | 6.8207e-16 | true | ok | NaN | 6.5590e-03 | first\_order |
| 1.0e8 | Ipopt | 6.89387396e8 | 373 | 16245584 | 1 | 5.8955e-16 | true | ok | NaN | 5.2870e-03 | first\_order |
| 1.0e8 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e8 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e8 | LeastSquaresOptim (Dogleg) | 1.587215291e9 | 127 | 3667776 | 7 | 7.3287e-12 | true | ok | NaN | 8.1650e-01 | converged |
| 1.0e8 | LeastSquaresOptim (LM) | 1.173969e9 | 181 | 3381168 | 15 | 7.3337e-12 | true | ok | NaN | 8.1650e-01 | converged |
| 1.0e8 | MadNLP | 1.1800725e8 | 629 | 20090096 | 1 | 6.3230e-16 | true | ok | NaN | 6.4770e-03 | SOLVE\_SUCCEEDED |
| 1.0e8 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1.0e8 | NonlinearSolve (TrustRegion) | 1.140682792e9 | 76408 | 270360944 | 28 | 2.3827e-27 | true | ok | NaN | 2.2249e-08 | Success |
| 1.0e8 | Optim (Newton) | 1.286525e7 | 200 | 42211392 | 1 | 1.9118e-15 | true | ok | NaN | 1.4440e-02 | converged |
| 1.0e8 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1.0e8 | SecondOrderOptimization | 4.7751e7 | 264 | 55976128 | 2 | 7.3252e-12 | true | ok | NaN | 8.1650e-01 | grad\_tol |
