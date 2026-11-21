# Benchmark Results: Sparse Conditioning Sweep

- **Category**: large_sparse
- **Scaling Metric**: Condition Number κ
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:15:03
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
| 10.0 | JuMP | 2.5192917e7 | 2 | 32 | 7.3981834e7 | 5 | 128 |
| 10.0 | NLLSModel (Sparse) | 11917.0 | 1 | 16 | 464166.0 | 1 | 64 |
| 10.0 | Standalone (Sparse) | 111417.0 | 1 | 16 | 1.890042e6 | 25 | 7897712 |
| 30.0 | JuMP | 2.3876834e7 | 2 | 32 | 6.9158625e7 | 5 | 128 |
| 30.0 | NLLSModel (Sparse) | 11959.0 | 1 | 16 | 502667.0 | 1 | 64 |
| 30.0 | Standalone (Sparse) | 106167.0 | 1 | 16 | 1.873208e6 | 25 | 7897712 |
| 100.0 | JuMP | 2.4311416e7 | 2 | 32 | 6.9146917e7 | 5 | 128 |
| 100.0 | NLLSModel (Sparse) | 11875.0 | 1 | 16 | 465250.0 | 1 | 64 |
| 100.0 | Standalone (Sparse) | 103084.0 | 1 | 16 | 1.984792e6 | 25 | 7897712 |
| 300.0 | JuMP | 2.5388542e7 | 2 | 32 | 7.0757709e7 | 5 | 128 |
| 300.0 | NLLSModel (Sparse) | 41708.0 | 1 | 16 | 515250.0 | 1 | 64 |
| 300.0 | Standalone (Sparse) | 103833.0 | 1 | 16 | 1.875417e6 | 25 | 7897712 |
| 1000.0 | JuMP | 2.6927417e7 | 2 | 32 | 7.553175e7 | 5 | 128 |
| 1000.0 | NLLSModel (Sparse) | 12208.0 | 1 | 16 | 488042.0 | 1 | 64 |
| 1000.0 | Standalone (Sparse) | 107666.0 | 1 | 16 | 2.095833e6 | 25 | 7897712 |
| 3000.0 | JuMP | 2.5066459e7 | 2 | 32 | 7.1381458e7 | 5 | 128 |
| 3000.0 | NLLSModel (Sparse) | 11917.0 | 1 | 16 | 471917.0 | 1 | 64 |
| 3000.0 | Standalone (Sparse) | 109083.0 | 1 | 16 | 1.875667e6 | 25 | 7897712 |
| 10000.0 | JuMP | 2.6141791e7 | 2 | 32 | 7.2855459e7 | 5 | 128 |
| 10000.0 | NLLSModel (Sparse) | 14583.0 | 1 | 16 | 472333.0 | 1 | 64 |
| 10000.0 | Standalone (Sparse) | 105958.0 | 1 | 16 | 1.901458e6 | 25 | 7897712 |
| 30000.0 | JuMP | 2.6975667e7 | 2 | 32 | 7.3601334e7 | 5 | 128 |
| 30000.0 | NLLSModel (Sparse) | 11917.0 | 1 | 16 | 644208.0 | 1 | 64 |
| 30000.0 | Standalone (Sparse) | 102833.0 | 1 | 16 | 1.93725e6 | 25 | 7897712 |
| 100000.0 | JuMP | 2.8368792e7 | 2 | 32 | 7.4333667e7 | 5 | 128 |
| 100000.0 | NLLSModel (Sparse) | 11917.0 | 1 | 16 | 468833.0 | 1 | 64 |
| 100000.0 | Standalone (Sparse) | 103417.0 | 1 | 16 | 1.87975e6 | 25 | 7897712 |
| 300000.0 | JuMP | 2.5781333e7 | 2 | 32 | 7.1646083e7 | 5 | 128 |
| 300000.0 | NLLSModel (Sparse) | 11917.0 | 1 | 16 | 493792.0 | 1 | 64 |
| 300000.0 | Standalone (Sparse) | 101250.0 | 1 | 16 | 1.861709e6 | 25 | 7897712 |
| 1.0e6 | JuMP | 2.6227125e7 | 2 | 32 | 7.4589666e7 | 5 | 128 |
| 1.0e6 | NLLSModel (Sparse) | 12083.0 | 1 | 16 | 488250.0 | 1 | 64 |
| 1.0e6 | Standalone (Sparse) | 100709.0 | 1 | 16 | 1.934375e6 | 25 | 7897712 |
| 3.0e6 | JuMP | 2.6912875e7 | 2 | 32 | 7.6042084e7 | 5 | 128 |
| 3.0e6 | NLLSModel (Sparse) | 62666.0 | 1 | 16 | 465041.0 | 1 | 64 |
| 3.0e6 | Standalone (Sparse) | 103875.0 | 1 | 16 | 1.954541e6 | 25 | 7897712 |
| 1.0e7 | JuMP | 2.8249625e7 | 2 | 32 | 7.5288042e7 | 5 | 128 |
| 1.0e7 | NLLSModel (Sparse) | 41417.0 | 1 | 16 | 556917.0 | 1 | 64 |
| 1.0e7 | Standalone (Sparse) | 103458.0 | 1 | 16 | 2.013959e6 | 25 | 7897712 |
| 3.0e7 | JuMP | 2.6823041e7 | 2 | 32 | 7.1299291e7 | 5 | 128 |
| 3.0e7 | NLLSModel (Sparse) | 11917.0 | 1 | 16 | 789584.0 | 1 | 64 |
| 3.0e7 | Standalone (Sparse) | 100709.0 | 1 | 16 | 1.897458e6 | 25 | 7897712 |
| 1.0e8 | JuMP | 2.660375e7 | 2 | 32 | 7.026675e7 | 5 | 128 |
| 1.0e8 | NLLSModel (Sparse) | 11916.0 | 1 | 16 | 471875.0 | 1 | 64 |
| 1.0e8 | Standalone (Sparse) | 104959.0 | 1 | 16 | 1.897834e6 | 25 | 7897712 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 10.0 | CaNNOLeS | 1.26398333e8 | 258 | 41956224 | 3 | 1.4881e-20 | true | ok | NaN | 8.5278e-12 | first\_order |
| 10.0 | Ipopt | 1.578663125e9 | 495 | 17298784 | 3 | 1.4881e-20 | true | ok | NaN | 8.5278e-12 | first\_order |
| 10.0 | JSOSolvers (tron) | 2.5259925e9 | 435 | 6606080 | 12 | 3.4156e-16 | true | ok | NaN | 1.2673e-09 | first\_order |
| 10.0 | JSOSolvers (trunk) | 1.665511833e9 | 282 | 4468784 | 11 | 2.2400e-15 | true | ok | NaN | 3.4975e-09 | first\_order |
| 10.0 | LeastSquaresOptim (Dogleg) | 1.026942705e8 | 122 | 3456976 | 8 | 4.1853e-26 | true | ok | NaN | 1.4353e-14 | converged |
| 10.0 | LeastSquaresOptim (LM) | 1.01751375e8 | 203 | 3239264 | 20 | 4.8162e-15 | true | ok | NaN | 5.1809e-09 | converged |
| 10.0 | MadNLP | 2.72584667e8 | 645 | 20090416 | 3 | 2.2497e-17 | true | ok | NaN | 3.6137e-10 | SOLVE\_SUCCEEDED |
| 10.0 | NonlinearSolve (LM) | 3.8737821542e10 | 1220 | 199739120 | 3 | 5.1275e+01 | false | timeout | NaN | 5.4203e-01 | MaxTime |
| 10.0 | NonlinearSolve (TrustRegion) | 2.963434795e8 | 76014 | 149683664 | 16 | 9.6297e-28 | true | ok | NaN | 1.9491e-15 | Success |
| 10.0 | Optim (Newton) | 4.4592042e7 | 414 | 95039136 | 3 | 1.4881e-20 | true | ok | NaN | 8.5278e-12 | converged |
| 10.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 10.0 | SecondOrderOptimization | 8.97949165e7 | 300 | 65920176 | 3 | 2.8545e-20 | true | ok | NaN | 1.2404e-11 | grad\_tol |
| 30.0 | CaNNOLeS | 1.42167438e8 | 258 | 41497472 | 3 | 1.0951e-21 | true | ok | NaN | 7.1313e-12 | first\_order |
| 30.0 | Ipopt | 1.464908875e9 | 479 | 17298528 | 3 | 1.0951e-21 | true | ok | NaN | 7.1313e-12 | first\_order |
| 30.0 | JSOSolvers (tron) | 4.642350875e9 | 673 | 6617504 | 13 | 1.2079e-14 | true | ok | NaN | 2.5108e-08 | first\_order |
| 30.0 | JSOSolvers (trunk) | 3.684004208e9 | 504 | 4479440 | 12 | 1.3528e-14 | true | ok | NaN | 2.2748e-08 | first\_order |
| 30.0 | LeastSquaresOptim (Dogleg) | 2.20327375e8 | 128 | 3467824 | 8 | 8.1400e-25 | true | ok | NaN | 1.7747e-13 | converged |
| 30.0 | LeastSquaresOptim (LM) | 2.33205833e8 | 237 | 3264576 | 22 | 1.1700e-13 | true | ok | NaN | 7.7314e-08 | converged |
| 30.0 | MadNLP | 2.71438771e8 | 645 | 20090416 | 3 | 1.7400e-18 | true | ok | NaN | 3.0339e-10 | SOLVE\_SUCCEEDED |
| 30.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 30.0 | NonlinearSolve (TrustRegion) | 2.93660041e8 | 76036 | 144047920 | 17 | 6.6929e-29 | true | ok | NaN | 6.2324e-16 | Success |
| 30.0 | Optim (Newton) | 3.2193667e7 | 443 | 95039600 | 3 | 1.0951e-21 | true | ok | NaN | 7.1313e-12 | converged |
| 30.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 30.0 | SecondOrderOptimization | 5.66895e7 | 300 | 65920176 | 3 | 2.9290e-20 | true | ok | NaN | 3.9558e-11 | grad\_tol |
| 100.0 | CaNNOLeS | 1.42445271e8 | 258 | 41497472 | 3 | 8.7077e-23 | true | ok | NaN | 6.7524e-12 | first\_order |
| 100.0 | Ipopt | 1.575483542e9 | 479 | 17298528 | 3 | 8.7079e-23 | true | ok | NaN | 6.7523e-12 | first\_order |
| 100.0 | JSOSolvers (tron) | 1.2732997417e10 | 1616 | 6662768 | 14 | 2.0915e-14 | true | ok | NaN | 1.0719e-07 | first\_order |
| 100.0 | JSOSolvers (trunk) | 8.710343167e9 | 1060 | 4506128 | 11 | 1.8185e-13 | true | ok | NaN | 2.9311e-07 | first\_order |
| 100.0 | LeastSquaresOptim (Dogleg) | 5.203825415e8 | 142 | 3525392 | 8 | 2.2951e-22 | true | ok | NaN | 1.0786e-11 | converged |
| 100.0 | LeastSquaresOptim (LM) | 5.748317915e8 | 260 | 3316944 | 21 | 2.0198e-12 | true | ok | NaN | 1.0749e-06 | converged |
| 100.0 | MadNLP | 2.792003335e8 | 645 | 20090416 | 3 | 1.3861e-19 | true | ok | NaN | 2.8584e-10 | SOLVE\_SUCCEEDED |
| 100.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 100.0 | NonlinearSolve (TrustRegion) | 2.97686333e8 | 76014 | 138460448 | 16 | 1.6345e-26 | true | ok | NaN | 7.4088e-14 | Success |
| 100.0 | Optim (Newton) | 3.291325e7 | 442 | 95039584 | 3 | 8.7076e-23 | true | ok | NaN | 6.7523e-12 | converged |
| 100.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 100.0 | SecondOrderOptimization | 5.6845334e7 | 300 | 65920176 | 3 | 5.1131e-19 | true | ok | NaN | 5.5211e-10 | grad\_tol |
| 300.0 | CaNNOLeS | 1.511960415e8 | 258 | 41497472 | 3 | 9.3572e-24 | true | ok | NaN | 6.6523e-12 | first\_order |
| 300.0 | Ipopt | 1.596887875e9 | 479 | 17298528 | 3 | 9.3581e-24 | true | ok | NaN | 6.6524e-12 | first\_order |
| 300.0 | JSOSolvers (tron) | 2.9263994959e10 | 3425 | 6749600 | 17 | 9.7207e-13 | true | ok | NaN | 2.1148e-06 | first\_order |
| 300.0 | JSOSolvers (trunk) | 2.1268975833e10 | 2465 | 4573568 | 12 | 2.2449e-12 | true | ok | NaN | 3.3655e-06 | first\_order |
| 300.0 | LeastSquaresOptim (Dogleg) | 1.099533584e9 | 146 | 3623760 | 8 | 2.1497e-19 | true | ok | NaN | 1.0342e-09 | converged |
| 300.0 | LeastSquaresOptim (LM) | 1.242204292e9 | 288 | 3483360 | 21 | 3.0256e-11 | true | ok | NaN | 1.2512e-05 | converged |
| 300.0 | MadNLP | 2.73751396e8 | 645 | 20090416 | 3 | 1.4878e-20 | true | ok | NaN | 2.8103e-10 | SOLVE\_SUCCEEDED |
| 300.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 300.0 | NonlinearSolve (TrustRegion) | 3.358755625e8 | 76014 | 138460448 | 16 | 1.7266e-27 | true | ok | NaN | 7.0352e-14 | Success |
| 300.0 | Optim (Newton) | 3.3191312e7 | 414 | 95039136 | 3 | 9.3571e-24 | true | ok | NaN | 6.6524e-12 | converged |
| 300.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 300.0 | SecondOrderOptimization | 6.683675e7 | 300 | 65920176 | 3 | 1.9218e-16 | true | ok | NaN | 3.2049e-08 | grad\_tol |
| 1000.0 | CaNNOLeS | 1.51409521e8 | 258 | 41497472 | 3 | 8.3255e-25 | true | ok | NaN | 6.6176e-12 | first\_order |
| 1000.0 | Ipopt | 1.58464975e9 | 479 | 17298528 | 3 | 8.3238e-25 | true | ok | NaN | 6.6173e-12 | first\_order |
| 1000.0 | JSOSolvers (tron) | 3.014396575e10 | 3588 | 6757424 | 8 | 1.0756e-07 | false | timeout | NaN | 2.5257e-03 | max\_time; cost test passes |
| 1000.0 | JSOSolvers (trunk) | 3.0048237958e10 | 3513 | 4623872 | 10 | 1.1950e-08 | false | timeout | NaN | 6.9380e-04 | max\_time; cost test passes |
| 1000.0 | LeastSquaresOptim (Dogleg) | 2.288570875e9 | 162 | 3908688 | 8 | 1.5122e-16 | true | ok | NaN | 6.8224e-08 | converged |
| 1000.0 | LeastSquaresOptim (LM) | 2.786676e9 | 279 | 3477872 | 20 | 6.0209e-10 | false | wrong_solution | NaN | 1.8641e-04 | converged; claimed convergence and the cost test passes, but the solution error is 1.86e-04, above 1e-04 |
| 1000.0 | MadNLP | 1.96838542e8 | 637 | 20090256 | 2 | 3.1538e-11 | true | ok | NaN | 4.3114e-05 | SOLVE\_SUCCEEDED |
| 1000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1000.0 | NonlinearSolve (TrustRegion) | 3.12420292e8 | 75990 | 136100768 | 16 | 2.0983e-28 | true | ok | NaN | 7.0077e-14 | Success |
| 1000.0 | Optim (Newton) | 2.12701665e7 | 307 | 68625264 | 2 | 2.5858e-12 | true | ok | NaN | 1.1489e-05 | converged |
| 1000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000.0 | SecondOrderOptimization | 5.6918417e7 | 300 | 65920176 | 3 | 4.3721e-12 | true | ok | NaN | 1.6083e-05 | grad\_tol |
| 3000.0 | CaNNOLeS | 1.50182417e8 | 258 | 41497472 | 3 | 9.2141e-26 | true | ok | NaN | 6.6012e-12 | first\_order |
| 3000.0 | Ipopt | 1.603536583e9 | 479 | 17298528 | 3 | 9.2221e-26 | true | ok | NaN | 6.6019e-12 | first\_order |
| 3000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3000.0 | LeastSquaresOptim (Dogleg) | 4.468529125e9 | 166 | 4154512 | 8 | 4.0231e-13 | true | ok | NaN | 1.1970e-05 | converged |
| 3000.0 | LeastSquaresOptim (LM) | 5.288302167e9 | 284 | 3862240 | 19 | 7.6653e-09 | false | wrong_solution | NaN | 2.0043e-03 | converged; claimed convergence and the cost test passes, but the solution error is 2.00e-03, above 1e-04 |
| 3000.0 | MadNLP | 1.94738709e8 | 637 | 20090256 | 2 | 3.4976e-12 | true | ok | NaN | 4.3075e-05 | SOLVE\_SUCCEEDED |
| 3000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 3000.0 | NonlinearSolve (TrustRegion) | 3.47791417e8 | 76014 | 138460448 | 15 | 9.1081e-27 | true | ok | NaN | 1.6563e-12 | Success |
| 3000.0 | Optim (Newton) | 2.129925e7 | 307 | 68625264 | 2 | 2.8663e-13 | true | ok | NaN | 1.1479e-05 | converged |
| 3000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 3000.0 | SecondOrderOptimization | 8.3781333e7 | 336 | 75864224 | 4 | 1.1376e-13 | true | ok | NaN | 7.7833e-06 | grad\_tol |
| 10000.0 | CaNNOLeS | 1.17519e8 | 256 | 41497376 | 2 | 2.5757e-14 | true | ok | NaN | 1.1468e-05 | first\_order |
| 10000.0 | Ipopt | 1.188025084e9 | 422 | 16771856 | 2 | 2.5757e-14 | true | ok | NaN | 1.1468e-05 | first\_order |
| 10000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 10000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 10000.0 | LeastSquaresOptim (Dogleg) | 9.452664542e9 | 178 | 4564304 | 8 | 1.5828e-09 | false | wrong_solution | NaN | 2.9657e-03 | converged; claimed convergence and the cost test passes, but the solution error is 2.97e-03, above 1e-04 |
| 10000.0 | LeastSquaresOptim (LM) | 8.615363083e9 | 276 | 4368320 | 18 | 3.7362e-07 | false | wrong_solution | NaN | 4.6664e-02 | converged; claimed convergence and the cost test passes, but the solution error is 4.67e-02, above 1e-04 |
| 10000.0 | MadNLP | 1.95964333e8 | 637 | 20090256 | 2 | 3.1432e-13 | true | ok | NaN | 4.3033e-05 | SOLVE\_SUCCEEDED |
| 10000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 10000.0 | NonlinearSolve (TrustRegion) | 3.01471021e8 | 75990 | 136346528 | 15 | 9.0180e-28 | true | ok | NaN | 1.6501e-12 | Success |
| 10000.0 | Optim (Newton) | 2.12115005e7 | 331 | 68625648 | 2 | 2.5757e-14 | true | ok | NaN | 1.1468e-05 | converged |
| 10000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000.0 | SecondOrderOptimization | 1.50175604e8 | 372 | 85808272 | 5 | 1.7844e-14 | true | ok | NaN | 1.0273e-05 | grad\_tol |
| 30000.0 | CaNNOLeS | 1.20238459e8 | 256 | 41497376 | 2 | 2.8548e-15 | true | ok | NaN | 1.1445e-05 | first\_order |
| 30000.0 | Ipopt | 1.267803791e9 | 422 | 16771856 | 2 | 2.8548e-15 | true | ok | NaN | 1.1445e-05 | first\_order |
| 30000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 30000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 30000.0 | LeastSquaresOptim (Dogleg) | 8.441068959e9 | 171 | 4819456 | 7 | 7.7972e-07 | false | wrong_solution | NaN | 2.0185e-01 | converged; claimed convergence and the cost test passes, but the solution error is 2.02e-01, above 1e-04 |
| 30000.0 | LeastSquaresOptim (LM) | 4.53145959e8 | 133 | 3263136 | 9 | 1.3042e-05 | false | wrong_solution | NaN | 8.1619e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 30000.0 | MadNLP | 1.94020833e8 | 637 | 20090256 | 2 | 3.4829e-14 | true | ok | NaN | 4.2940e-05 | SOLVE\_SUCCEEDED |
| 30000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 30000.0 | NonlinearSolve (TrustRegion) | 3.30495375e8 | 76038 | 149061456 | 15 | 2.1528e-28 | true | ok | NaN | 2.3173e-12 | Success |
| 30000.0 | Optim (Newton) | 2.1446437e7 | 307 | 68625264 | 2 | 2.8546e-15 | true | ok | NaN | 1.1444e-05 | converged |
| 30000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 30000.0 | SecondOrderOptimization | 4.2121583e7 | 264 | 55976128 | 2 | 1.1887e-05 | false | wrong_solution | NaN | 7.7955e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 7.80e-01, above 1e-04 |
| 100000.0 | CaNNOLeS | 1.2006225e8 | 256 | 41497376 | 2 | 2.5488e-16 | true | ok | NaN | 1.1365e-05 | first\_order |
| 100000.0 | Ipopt | 1.268343292e9 | 422 | 16771856 | 2 | 2.5488e-16 | true | ok | NaN | 1.1365e-05 | first\_order |
| 100000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 100000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 100000.0 | LeastSquaresOptim (Dogleg) | 1.316098875e9 | 126 | 3550288 | 6 | 1.1771e-06 | false | wrong_solution | NaN | 8.1649e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 100000.0 | LeastSquaresOptim (LM) | 3.85770375e8 | 127 | 3244016 | 9 | 1.1772e-06 | false | wrong_solution | NaN | 8.1649e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 100000.0 | MadNLP | 2.08473667e8 | 637 | 20090256 | 2 | 3.1067e-15 | true | ok | NaN | 4.2636e-05 | SOLVE\_SUCCEEDED |
| 100000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 100000.0 | NonlinearSolve (TrustRegion) | 2.786820625e8 | 76038 | 146702160 | 14 | 1.5956e-26 | true | ok | NaN | 8.0928e-11 | Success |
| 100000.0 | Optim (Newton) | 2.16751875e7 | 307 | 68625264 | 2 | 2.5494e-16 | true | ok | NaN | 1.1366e-05 | converged |
| 100000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 100000.0 | SecondOrderOptimization | 6.1235e7 | 264 | 55976128 | 2 | 1.1671e-06 | false | wrong_solution | NaN | 8.1304e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.13e-01, above 1e-04 |
| 300000.0 | CaNNOLeS | 1.14861583e8 | 256 | 41497376 | 2 | 2.7693e-17 | true | ok | NaN | 1.1147e-05 | first\_order |
| 300000.0 | Ipopt | 1.2502915e9 | 422 | 16771856 | 2 | 2.7693e-17 | true | ok | NaN | 1.1147e-05 | first\_order |
| 300000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 300000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 300000.0 | LeastSquaresOptim (Dogleg) | 5.761364585e8 | 118 | 3492816 | 6 | 1.3158e-07 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 300000.0 | LeastSquaresOptim (LM) | 4.50650708e8 | 135 | 3248608 | 10 | 1.3158e-07 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 300000.0 | MadNLP | 1.93756541e8 | 637 | 20090256 | 2 | 3.3688e-16 | true | ok | NaN | 4.1822e-05 | SOLVE\_SUCCEEDED |
| 300000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 300000.0 | NonlinearSolve (TrustRegion) | 3.17473833e8 | 76038 | 147406672 | 14 | 1.6589e-27 | true | ok | NaN | 7.4350e-11 | Success |
| 300000.0 | Optim (Newton) | 2.138825e7 | 330 | 68625632 | 2 | 2.7801e-17 | true | ok | NaN | 1.1173e-05 | converged |
| 300000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 300000.0 | SecondOrderOptimization | 5.3445125e7 | 264 | 55976128 | 2 | 1.3146e-07 | false | wrong_solution | NaN | 8.1611e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 1.0e6 | CaNNOLeS | 1.1824825e8 | 256 | 41497376 | 2 | 2.3132e-18 | true | ok | NaN | 1.0477e-05 | first\_order |
| 1.0e6 | Ipopt | 1.238792834e9 | 422 | 16771856 | 2 | 2.3133e-18 | true | ok | NaN | 1.0478e-05 | first\_order |
| 1.0e6 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e6 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e6 | LeastSquaresOptim (Dogleg) | 6.08532896e8 | 123 | 3536640 | 7 | 1.2091e-08 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e6 | LeastSquaresOptim (LM) | 5.273050835e8 | 141 | 3284400 | 11 | 1.2091e-08 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e6 | MadNLP | 1.93065583e8 | 637 | 20090256 | 2 | 2.7794e-17 | true | ok | NaN | 3.9234e-05 | SOLVE\_SUCCEEDED |
| 1.0e6 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1.0e6 | NonlinearSolve (TrustRegion) | 3.31558667e8 | 76038 | 144949072 | 14 | 1.6976e-28 | true | ok | NaN | 5.8534e-11 | Success |
| 1.0e6 | Optim (Newton) | 2.1366084e7 | 307 | 68625264 | 2 | 2.3210e-18 | true | ok | NaN | 1.0499e-05 | converged |
| 1.0e6 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1.0e6 | SecondOrderOptimization | 4.0491875e7 | 264 | 55976128 | 2 | 1.2090e-08 | false | wrong_solution | NaN | 8.1647e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 3.0e6 | CaNNOLeS | 1.21532042e8 | 256 | 41497376 | 2 | 2.1261e-19 | true | ok | NaN | 9.0489e-06 | first\_order |
| 3.0e6 | Ipopt | 1.1777095e9 | 422 | 16771856 | 2 | 2.1241e-19 | true | ok | NaN | 9.0447e-06 | first\_order |
| 3.0e6 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e6 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e6 | LeastSquaresOptim (Dogleg) | 7.518161455e8 | 123 | 3536640 | 7 | 1.4240e-09 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 3.0e6 | LeastSquaresOptim (LM) | 7.41737458e8 | 150 | 3289888 | 12 | 1.4240e-09 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 3.0e6 | MadNLP | 1.12767958e8 | 629 | 20090096 | 1 | 1.0469e-12 | false | wrong_solution | NaN | 1.6332e-02 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 1.63e-02, above 1e-04 |
| 3.0e6 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 3.0e6 | NonlinearSolve (TrustRegion) | 3.49139292e8 | 76038 | 145653584 | 13 | 8.0790e-27 | true | ok | NaN | 1.5361e-09 | Success |
| 3.0e6 | Optim (Newton) | 1.1766854e7 | 200 | 42211392 | 1 | 1.0214e-12 | false | wrong_solution | NaN | 1.5935e-02 | converged; claimed convergence and the cost test passes, but the solution error is 1.59e-02, above 1e-04 |
| 3.0e6 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 3.0e6 | SecondOrderOptimization | 4.0413125e7 | 264 | 55976128 | 2 | 1.4239e-09 | false | wrong_solution | NaN | 8.1650e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 1.0e7 | CaNNOLeS | 8.0581125e7 | 254 | 41497280 | 1 | 9.0793e-14 | false | wrong_solution | NaN | 1.4401e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.44e-02, above 1e-04 |
| 1.0e7 | Ipopt | 7.61086625e8 | 365 | 16245184 | 1 | 9.1042e-14 | false | wrong_solution | NaN | 1.4437e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.44e-02, above 1e-04 |
| 1.0e7 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e7 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e7 | LeastSquaresOptim (Dogleg) | 1.1322625e9 | 123 | 3536640 | 7 | 1.5519e-10 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e7 | LeastSquaresOptim (LM) | 1.073954084e9 | 170 | 3304480 | 14 | 1.5519e-10 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e7 | MadNLP | 1.13422646e8 | 629 | 20090096 | 1 | 8.9273e-14 | false | wrong_solution | NaN | 1.4149e-02 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 1.41e-02, above 1e-04 |
| 1.0e7 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1.0e7 | NonlinearSolve (TrustRegion) | 6.95569896e8 | 76374 | 264576672 | 27 | 4.9224e-27 | true | ok | NaN | 3.9571e-09 | Success |
| 1.0e7 | Optim (Newton) | 1.2339e7 | 200 | 42211392 | 1 | 9.2898e-14 | false | wrong_solution | NaN | 1.4727e-02 | converged; claimed convergence and the cost test passes, but the solution error is 1.47e-02, above 1e-04 |
| 1.0e7 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1.0e7 | SecondOrderOptimization | 4.2039541e7 | 264 | 55976128 | 2 | 1.5516e-10 | false | wrong_solution | NaN | 8.1650e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 3.0e7 | CaNNOLeS | 8.6666708e7 | 254 | 41497280 | 1 | 1.0047e-14 | false | wrong_solution | NaN | 1.1714e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.17e-02, above 1e-04 |
| 3.0e7 | Ipopt | 8.16498458e8 | 365 | 16245184 | 1 | 9.3352e-15 | false | wrong_solution | NaN | 1.0944e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.09e-02, above 1e-04 |
| 3.0e7 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e7 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e7 | LeastSquaresOptim (Dogleg) | 1.342836666e9 | 125 | 3618592 | 7 | 2.7406e-11 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 3.0e7 | LeastSquaresOptim (LM) | 1.269180208e9 | 183 | 3395536 | 15 | 2.7405e-11 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 3.0e7 | MadNLP | 1.15659791e8 | 629 | 20090096 | 1 | 1.1873e-14 | false | wrong_solution | NaN | 1.4751e-02 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 1.48e-02, above 1e-04 |
| 3.0e7 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 3.0e7 | NonlinearSolve (TrustRegion) | 1.009128125e9 | 76408 | 275177840 | 27 | 6.1945e-28 | true | ok | NaN | 2.9864e-09 | Success |
| 3.0e7 | Optim (Newton) | 1.258875e7 | 200 | 42211392 | 1 | 5.1495e-15 | false | wrong_solution | NaN | 3.4344e-03 | converged; claimed convergence and the cost test passes, but the solution error is 3.43e-03, above 1e-04 |
| 3.0e7 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 3.0e7 | SecondOrderOptimization | 4.2632125e7 | 264 | 55976128 | 2 | 2.7397e-11 | false | wrong_solution | NaN | 8.1650e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e8 | CaNNOLeS | 8.37305e7 | 254 | 41497280 | 1 | 6.8207e-16 | false | wrong_solution | NaN | 6.5590e-03 | first\_order; claimed convergence and the cost test passes, but the solution error is 6.56e-03, above 1e-04 |
| 1.0e8 | Ipopt | 7.89499333e8 | 365 | 16245184 | 1 | 5.8955e-16 | false | wrong_solution | NaN | 5.2870e-03 | first\_order; claimed convergence and the cost test passes, but the solution error is 5.29e-03, above 1e-04 |
| 1.0e8 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e8 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e8 | LeastSquaresOptim (Dogleg) | 1.610368459e9 | 127 | 3667776 | 7 | 7.3287e-12 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e8 | LeastSquaresOptim (LM) | 1.244438291e9 | 181 | 3381168 | 15 | 7.3337e-12 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e8 | MadNLP | 1.09516209e8 | 629 | 20090096 | 1 | 6.3230e-16 | false | wrong_solution | NaN | 6.4770e-03 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 6.48e-03, above 1e-04 |
| 1.0e8 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1.0e8 | NonlinearSolve (TrustRegion) | 1.099138625e9 | 76408 | 271311216 | 28 | 2.3827e-27 | true | ok | NaN | 2.2249e-08 | Success |
| 1.0e8 | Optim (Newton) | 1.1735542e7 | 200 | 42211392 | 1 | 1.9118e-15 | false | wrong_solution | NaN | 1.4440e-02 | converged; claimed convergence and the cost test passes, but the solution error is 1.44e-02, above 1e-04 |
| 1.0e8 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1.0e8 | SecondOrderOptimization | 5.7303458e7 | 264 | 55976128 | 2 | 7.3252e-12 | false | wrong_solution | NaN | 8.1650e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
