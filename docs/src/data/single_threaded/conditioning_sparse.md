# Benchmark Results: Sparse Conditioning Sweep

- **Category**: large_sparse
- **Scaling Metric**: Condition Number κ
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T04:08:28
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
| 10.0 | JuMP | 2.5437417e7 | 2 | 32 | 7.1913542e7 | 5 | 128 |
| 10.0 | NLLSModel (Sparse) | 81875.0 | 1 | 16 | 1.406041e6 | 1 | 64 |
| 10.0 | Standalone (Sparse) | 100000.0 | 1 | 16 | 2.012833e6 | 25 | 9306736 |
| 30.0 | JuMP | 2.8577375e7 | 2 | 32 | 7.7865583e7 | 5 | 128 |
| 30.0 | NLLSModel (Sparse) | 85750.0 | 1 | 16 | 1.302667e6 | 1 | 64 |
| 30.0 | Standalone (Sparse) | 99167.0 | 1 | 16 | 1.8335e6 | 25 | 11174512 |
| 100.0 | JuMP | 2.7979833e7 | 2 | 32 | 7.9278209e7 | 5 | 128 |
| 100.0 | NLLSModel (Sparse) | 82000.0 | 1 | 16 | 1.3635e6 | 1 | 64 |
| 100.0 | Standalone (Sparse) | 99084.0 | 1 | 16 | 1.85825e6 | 25 | 9536112 |
| 300.0 | JuMP | 2.5101084e7 | 2 | 32 | 7.1088041e7 | 5 | 128 |
| 300.0 | NLLSModel (Sparse) | 82000.0 | 1 | 16 | 1.301041e6 | 1 | 64 |
| 300.0 | Standalone (Sparse) | 107417.0 | 1 | 16 | 1.883125e6 | 25 | 7897712 |
| 1000.0 | JuMP | 2.5859792e7 | 2 | 32 | 7.7583875e7 | 5 | 128 |
| 1000.0 | NLLSModel (Sparse) | 87125.0 | 1 | 16 | 1.304958e6 | 1 | 64 |
| 1000.0 | Standalone (Sparse) | 102083.0 | 1 | 16 | 1.985042e6 | 25 | 7897712 |
| 3000.0 | JuMP | 2.7312e7 | 2 | 32 | 7.2110834e7 | 5 | 128 |
| 3000.0 | NLLSModel (Sparse) | 84583.0 | 1 | 16 | 1.386625e6 | 1 | 64 |
| 3000.0 | Standalone (Sparse) | 106333.0 | 1 | 16 | 1.877833e6 | 25 | 7897712 |
| 10000.0 | JuMP | 2.9731542e7 | 2 | 32 | 8.3572542e7 | 5 | 128 |
| 10000.0 | NLLSModel (Sparse) | 87167.0 | 1 | 16 | 1.346542e6 | 1 | 64 |
| 10000.0 | Standalone (Sparse) | 101750.0 | 1 | 16 | 1.942792e6 | 25 | 7897712 |
| 30000.0 | JuMP | 2.8243416e7 | 2 | 32 | 7.9213792e7 | 5 | 128 |
| 30000.0 | NLLSModel (Sparse) | 82250.0 | 1 | 16 | 1.381167e6 | 1 | 64 |
| 30000.0 | Standalone (Sparse) | 102417.0 | 1 | 16 | 1.929875e6 | 25 | 7897712 |
| 100000.0 | JuMP | 2.5490875e7 | 2 | 32 | 7.0480541e7 | 5 | 128 |
| 100000.0 | NLLSModel (Sparse) | 81875.0 | 1 | 16 | 1.299208e6 | 1 | 64 |
| 100000.0 | Standalone (Sparse) | 100458.0 | 1 | 16 | 1.920916e6 | 25 | 7897712 |
| 300000.0 | JuMP | 2.5170125e7 | 2 | 32 | 7.5049209e7 | 5 | 128 |
| 300000.0 | NLLSModel (Sparse) | 81958.0 | 1 | 16 | 1.340708e6 | 1 | 64 |
| 300000.0 | Standalone (Sparse) | 108500.0 | 1 | 16 | 1.936833e6 | 25 | 7897712 |
| 1.0e6 | JuMP | 2.5562375e7 | 2 | 32 | 7.3166084e7 | 5 | 128 |
| 1.0e6 | NLLSModel (Sparse) | 81834.0 | 1 | 16 | 1.299792e6 | 1 | 64 |
| 1.0e6 | Standalone (Sparse) | 101542.0 | 1 | 16 | 1.854e6 | 25 | 7897712 |
| 3.0e6 | JuMP | 2.9755917e7 | 2 | 32 | 8.6095125e7 | 5 | 128 |
| 3.0e6 | NLLSModel (Sparse) | 84584.0 | 1 | 16 | 1.343916e6 | 1 | 64 |
| 3.0e6 | Standalone (Sparse) | 99667.0 | 1 | 16 | 1.9355e6 | 25 | 7897712 |
| 1.0e7 | JuMP | 2.9242459e7 | 2 | 32 | 8.3478e7 | 5 | 128 |
| 1.0e7 | NLLSModel (Sparse) | 81916.0 | 1 | 16 | 1.393666e6 | 1 | 64 |
| 1.0e7 | Standalone (Sparse) | 108416.0 | 1 | 16 | 1.943791e6 | 25 | 7897712 |
| 3.0e7 | JuMP | 3.1175208e7 | 2 | 32 | 7.8766792e7 | 5 | 128 |
| 3.0e7 | NLLSModel (Sparse) | 81917.0 | 1 | 16 | 1.364167e6 | 1 | 64 |
| 3.0e7 | Standalone (Sparse) | 110875.0 | 1 | 16 | 1.926666e6 | 25 | 7897712 |
| 1.0e8 | JuMP | 2.9127083e7 | 2 | 32 | 7.5938791e7 | 5 | 128 |
| 1.0e8 | NLLSModel (Sparse) | 82041.0 | 1 | 16 | 1.30125e6 | 1 | 64 |
| 1.0e8 | Standalone (Sparse) | 99709.0 | 1 | 16 | 2.094667e6 | 25 | 7897712 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 10.0 | CaNNOLeS | 1.37614792e8 | 258 | 41956224 | 3 | 1.4881e-20 | true | ok | NaN | 8.5278e-12 | first\_order |
| 10.0 | Ipopt | 2.99045187e8 | 485 | 17298624 | 3 | 1.4881e-20 | true | ok | NaN | 8.5278e-12 | first\_order |
| 10.0 | JSOSolvers (tron) | 2.525883791e9 | 435 | 6606080 | 12 | 3.4156e-16 | true | ok | NaN | 1.2673e-09 | first\_order |
| 10.0 | JSOSolvers (trunk) | 1.808916083e9 | 282 | 4468784 | 11 | 2.2400e-15 | true | ok | NaN | 3.4975e-09 | first\_order |
| 10.0 | LeastSquaresOptim (Dogleg) | 9.3240333e7 | 122 | 3456976 | 8 | 4.1853e-26 | true | ok | NaN | 1.4353e-14 | converged |
| 10.0 | LeastSquaresOptim (LM) | 9.05051455e7 | 203 | 3239264 | 20 | 4.8162e-15 | true | ok | NaN | 5.1809e-09 | converged |
| 10.0 | MadNLP | 2.654821045e8 | 645 | 20090416 | 3 | 2.2497e-17 | true | ok | NaN | 3.6137e-10 | SOLVE\_SUCCEEDED |
| 10.0 | NonlinearSolve (LM) | 3.8411656e10 | 1220 | 193283824 | 3 | 5.1275e+01 | false | timeout | NaN | 5.4203e-01 | MaxTime |
| 10.0 | NonlinearSolve (TrustRegion) | 2.01360416e8 | 76014 | 143998416 | 16 | 9.6934e-28 | true | ok | NaN | 1.9526e-15 | Success |
| 10.0 | Optim (Newton) | 2.98636875e7 | 442 | 95039584 | 3 | 1.4881e-20 | true | ok | NaN | 8.5278e-12 | converged |
| 10.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 10.0 | SecondOrderOptimization | 6.0771417e7 | 300 | 65919952 | 3 | 2.8545e-20 | true | ok | NaN | 1.2404e-11 | grad\_tol |
| 30.0 | CaNNOLeS | 1.332350415e8 | 258 | 41497472 | 3 | 1.0951e-21 | true | ok | NaN | 7.1313e-12 | first\_order |
| 30.0 | Ipopt | 2.83843542e8 | 479 | 17298528 | 3 | 1.0951e-21 | true | ok | NaN | 7.1313e-12 | first\_order |
| 30.0 | JSOSolvers (tron) | 4.207933417e9 | 673 | 6617504 | 13 | 1.2079e-14 | true | ok | NaN | 2.5108e-08 | first\_order |
| 30.0 | JSOSolvers (trunk) | 3.402814958e9 | 504 | 4479440 | 12 | 1.3528e-14 | true | ok | NaN | 2.2748e-08 | first\_order |
| 30.0 | LeastSquaresOptim (Dogleg) | 1.939135415e8 | 128 | 3467824 | 8 | 8.1400e-25 | true | ok | NaN | 1.7747e-13 | converged |
| 30.0 | LeastSquaresOptim (LM) | 2.065475e8 | 237 | 3264576 | 22 | 1.1700e-13 | true | ok | NaN | 7.7314e-08 | converged |
| 30.0 | MadNLP | 2.77963313e8 | 645 | 20090416 | 3 | 1.7400e-18 | true | ok | NaN | 3.0339e-10 | SOLVE\_SUCCEEDED |
| 30.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 30.0 | NonlinearSolve (TrustRegion) | 2.05319917e8 | 76014 | 143998416 | 17 | 6.6933e-29 | true | ok | NaN | 6.2378e-16 | Success |
| 30.0 | Optim (Newton) | 2.9684208e7 | 442 | 95039584 | 3 | 1.0951e-21 | true | ok | NaN | 7.1313e-12 | converged |
| 30.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 30.0 | SecondOrderOptimization | 5.9789834e7 | 300 | 65919952 | 3 | 2.9290e-20 | true | ok | NaN | 3.9558e-11 | grad\_tol |
| 100.0 | CaNNOLeS | 1.50800479e8 | 258 | 41956224 | 3 | 8.7077e-23 | true | ok | NaN | 6.7524e-12 | first\_order |
| 100.0 | Ipopt | 3.27181292e8 | 479 | 17298528 | 3 | 8.7079e-23 | true | ok | NaN | 6.7523e-12 | first\_order |
| 100.0 | JSOSolvers (tron) | 1.2580167875e10 | 1616 | 6662768 | 14 | 2.0915e-14 | true | ok | NaN | 1.0719e-07 | first\_order |
| 100.0 | JSOSolvers (trunk) | 8.411562083e9 | 1060 | 4506128 | 11 | 1.8185e-13 | true | ok | NaN | 2.9311e-07 | first\_order |
| 100.0 | LeastSquaresOptim (Dogleg) | 4.55537e8 | 142 | 3525392 | 8 | 2.2951e-22 | true | ok | NaN | 1.0786e-11 | converged |
| 100.0 | LeastSquaresOptim (LM) | 4.9690125e8 | 260 | 3316944 | 21 | 2.0198e-12 | true | ok | NaN | 1.0749e-06 | converged |
| 100.0 | MadNLP | 2.74810167e8 | 645 | 20090416 | 3 | 1.3861e-19 | true | ok | NaN | 2.8584e-10 | SOLVE\_SUCCEEDED |
| 100.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 100.0 | NonlinearSolve (TrustRegion) | 2.012085e8 | 75990 | 136231840 | 16 | 1.6352e-26 | true | ok | NaN | 7.4131e-14 | Success |
| 100.0 | Optim (Newton) | 3.04337085e7 | 414 | 95039136 | 3 | 8.7076e-23 | true | ok | NaN | 6.7523e-12 | converged |
| 100.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 100.0 | SecondOrderOptimization | 5.9291292e7 | 300 | 65919952 | 3 | 5.1131e-19 | true | ok | NaN | 5.5211e-10 | grad\_tol |
| 300.0 | CaNNOLeS | 1.522258745e8 | 258 | 41956224 | 3 | 9.3572e-24 | true | ok | NaN | 6.6523e-12 | first\_order |
| 300.0 | Ipopt | 3.29289584e8 | 479 | 17298528 | 3 | 9.3581e-24 | true | ok | NaN | 6.6524e-12 | first\_order |
| 300.0 | JSOSolvers (tron) | 2.7885274292e10 | 3425 | 6749600 | 17 | 9.7207e-13 | true | ok | NaN | 2.1148e-06 | first\_order |
| 300.0 | JSOSolvers (trunk) | 2.0304682334e10 | 2465 | 4573568 | 12 | 2.2449e-12 | true | ok | NaN | 3.3655e-06 | first\_order |
| 300.0 | LeastSquaresOptim (Dogleg) | 9.515893335e8 | 146 | 3623760 | 8 | 2.1497e-19 | true | ok | NaN | 1.0342e-09 | converged |
| 300.0 | LeastSquaresOptim (LM) | 1.127269833e9 | 288 | 3483360 | 21 | 3.0256e-11 | true | ok | NaN | 1.2512e-05 | converged |
| 300.0 | MadNLP | 2.67847812e8 | 645 | 20090416 | 3 | 1.4878e-20 | true | ok | NaN | 2.8103e-10 | SOLVE\_SUCCEEDED |
| 300.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 300.0 | NonlinearSolve (TrustRegion) | 2.08260375e8 | 75990 | 136100768 | 16 | 1.7336e-27 | true | ok | NaN | 7.0465e-14 | Success |
| 300.0 | Optim (Newton) | 3.0063125e7 | 414 | 95039136 | 3 | 9.3571e-24 | true | ok | NaN | 6.6524e-12 | converged |
| 300.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 300.0 | SecondOrderOptimization | 6.0002583e7 | 300 | 65919952 | 3 | 1.9218e-16 | true | ok | NaN | 3.2049e-08 | grad\_tol |
| 1000.0 | CaNNOLeS | 1.509706455e8 | 258 | 41956224 | 3 | 8.3255e-25 | true | ok | NaN | 6.6176e-12 | first\_order |
| 1000.0 | Ipopt | 3.34537875e8 | 479 | 17298528 | 3 | 8.3238e-25 | true | ok | NaN | 6.6173e-12 | first\_order |
| 1000.0 | JSOSolvers (tron) | 3.013683925e10 | 3598 | 6757904 | 8 | 1.0644e-07 | false | timeout | NaN | 2.5124e-03 | max\_time; cost test passes |
| 1000.0 | JSOSolvers (trunk) | 3.0045904125e10 | 3493 | 4622912 | 10 | 1.2800e-08 | false | timeout | NaN | 7.0476e-04 | max\_time; cost test passes |
| 1000.0 | LeastSquaresOptim (Dogleg) | 1.959360334e9 | 162 | 3908688 | 8 | 1.5122e-16 | true | ok | NaN | 6.8224e-08 | converged |
| 1000.0 | LeastSquaresOptim (LM) | 2.431231833e9 | 279 | 3477872 | 20 | 6.0209e-10 | false | wrong_solution | NaN | 1.8641e-04 | converged; claimed convergence and the cost test passes, but the solution error is 1.86e-04, above 1e-04 |
| 1000.0 | MadNLP | 1.90238875e8 | 637 | 20090256 | 2 | 3.1538e-11 | true | ok | NaN | 4.3114e-05 | SOLVE\_SUCCEEDED |
| 1000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1000.0 | NonlinearSolve (TrustRegion) | 2.08799084e8 | 76038 | 136150688 | 16 | 2.0699e-28 | true | ok | NaN | 6.9332e-14 | Success |
| 1000.0 | Optim (Newton) | 2.0843583e7 | 307 | 68625264 | 2 | 2.5858e-12 | true | ok | NaN | 1.1489e-05 | converged |
| 1000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000.0 | SecondOrderOptimization | 5.9617625e7 | 300 | 65919952 | 3 | 4.3721e-12 | true | ok | NaN | 1.6083e-05 | grad\_tol |
| 3000.0 | CaNNOLeS | 1.623159795e8 | 258 | 41956224 | 3 | 9.2141e-26 | true | ok | NaN | 6.6012e-12 | first\_order |
| 3000.0 | Ipopt | 3.40486833e8 | 479 | 17298528 | 3 | 9.2221e-26 | true | ok | NaN | 6.6019e-12 | first\_order |
| 3000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3000.0 | LeastSquaresOptim (Dogleg) | 3.690697791e9 | 166 | 4154512 | 8 | 4.0231e-13 | true | ok | NaN | 1.1970e-05 | converged |
| 3000.0 | LeastSquaresOptim (LM) | 4.731221041e9 | 284 | 3862240 | 19 | 7.6653e-09 | false | wrong_solution | NaN | 2.0043e-03 | converged; claimed convergence and the cost test passes, but the solution error is 2.00e-03, above 1e-04 |
| 3000.0 | MadNLP | 1.89027375e8 | 637 | 20090256 | 2 | 3.4976e-12 | true | ok | NaN | 4.3075e-05 | SOLVE\_SUCCEEDED |
| 3000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 3000.0 | NonlinearSolve (TrustRegion) | 1.990595e8 | 75990 | 136149920 | 15 | 9.1028e-27 | true | ok | NaN | 1.6561e-12 | Success |
| 3000.0 | Optim (Newton) | 2.07765625e7 | 331 | 68625648 | 2 | 2.8663e-13 | true | ok | NaN | 1.1479e-05 | converged |
| 3000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 3000.0 | SecondOrderOptimization | 7.8887709e7 | 336 | 75864000 | 4 | 1.1376e-13 | true | ok | NaN | 7.7833e-06 | grad\_tol |
| 10000.0 | CaNNOLeS | 1.20812625e8 | 256 | 41956128 | 2 | 2.5757e-14 | true | ok | NaN | 1.1468e-05 | first\_order |
| 10000.0 | Ipopt | 2.5815425e8 | 422 | 16771856 | 2 | 2.5757e-14 | true | ok | NaN | 1.1468e-05 | first\_order |
| 10000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 10000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 10000.0 | LeastSquaresOptim (Dogleg) | 7.183145083e9 | 178 | 4564304 | 8 | 1.5828e-09 | false | wrong_solution | NaN | 2.9657e-03 | converged; claimed convergence and the cost test passes, but the solution error is 2.97e-03, above 1e-04 |
| 10000.0 | LeastSquaresOptim (LM) | 7.543546167e9 | 276 | 4368320 | 18 | 3.7362e-07 | false | wrong_solution | NaN | 4.6664e-02 | converged; claimed convergence and the cost test passes, but the solution error is 4.67e-02, above 1e-04 |
| 10000.0 | MadNLP | 2.111655e8 | 637 | 20090256 | 2 | 3.1432e-13 | true | ok | NaN | 4.3033e-05 | SOLVE\_SUCCEEDED |
| 10000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 10000.0 | NonlinearSolve (TrustRegion) | 2.23852917e8 | 76014 | 136346912 | 15 | 9.0353e-28 | true | ok | NaN | 1.6467e-12 | Success |
| 10000.0 | Optim (Newton) | 2.0302208e7 | 331 | 68625648 | 2 | 2.5757e-14 | true | ok | NaN | 1.1468e-05 | converged |
| 10000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000.0 | SecondOrderOptimization | 1.01839042e8 | 372 | 85808048 | 5 | 1.7844e-14 | true | ok | NaN | 1.0273e-05 | grad\_tol |
| 30000.0 | CaNNOLeS | 1.17527958e8 | 256 | 41956128 | 2 | 2.8548e-15 | true | ok | NaN | 1.1445e-05 | first\_order |
| 30000.0 | Ipopt | 2.389175e8 | 422 | 16771856 | 2 | 2.8548e-15 | true | ok | NaN | 1.1445e-05 | first\_order |
| 30000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 30000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 30000.0 | LeastSquaresOptim (Dogleg) | 7.000001375e9 | 171 | 4819456 | 7 | 7.7972e-07 | false | wrong_solution | NaN | 2.0185e-01 | converged; claimed convergence and the cost test passes, but the solution error is 2.02e-01, above 1e-04 |
| 30000.0 | LeastSquaresOptim (LM) | 3.96660417e8 | 133 | 3263136 | 9 | 1.3042e-05 | false | wrong_solution | NaN | 8.1619e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 30000.0 | MadNLP | 2.01797e8 | 637 | 20090256 | 2 | 3.4829e-14 | true | ok | NaN | 4.2940e-05 | SOLVE\_SUCCEEDED |
| 30000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 30000.0 | NonlinearSolve (TrustRegion) | 2.02295333e8 | 76014 | 144047568 | 15 | 2.1352e-28 | true | ok | NaN | 2.3166e-12 | Success |
| 30000.0 | Optim (Newton) | 2.04924795e7 | 331 | 68625648 | 2 | 2.8546e-15 | true | ok | NaN | 1.1444e-05 | converged |
| 30000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 30000.0 | SecondOrderOptimization | 4.2678208e7 | 264 | 55975904 | 2 | 1.1887e-05 | false | wrong_solution | NaN | 7.7955e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 7.80e-01, above 1e-04 |
| 100000.0 | CaNNOLeS | 1.16031083e8 | 256 | 41956128 | 2 | 2.5488e-16 | true | ok | NaN | 1.1365e-05 | first\_order |
| 100000.0 | Ipopt | 2.442815e8 | 422 | 16771856 | 2 | 2.5488e-16 | true | ok | NaN | 1.1365e-05 | first\_order |
| 100000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 100000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 100000.0 | LeastSquaresOptim (Dogleg) | 9.4731275e8 | 126 | 3550288 | 6 | 1.1771e-06 | false | wrong_solution | NaN | 8.1649e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 100000.0 | LeastSquaresOptim (LM) | 3.54920708e8 | 127 | 3244016 | 9 | 1.1772e-06 | false | wrong_solution | NaN | 8.1649e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 100000.0 | MadNLP | 1.84310208e8 | 637 | 20090256 | 2 | 3.1067e-15 | true | ok | NaN | 4.2636e-05 | SOLVE\_SUCCEEDED |
| 100000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 100000.0 | NonlinearSolve (TrustRegion) | 2.00908041e8 | 76014 | 144047568 | 14 | 1.5983e-26 | true | ok | NaN | 8.0990e-11 | Success |
| 100000.0 | Optim (Newton) | 2.0738666e7 | 307 | 68625264 | 2 | 2.5494e-16 | true | ok | NaN | 1.1366e-05 | converged |
| 100000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 100000.0 | SecondOrderOptimization | 4.294025e7 | 264 | 55975904 | 2 | 1.1671e-06 | false | wrong_solution | NaN | 8.1304e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.13e-01, above 1e-04 |
| 300000.0 | CaNNOLeS | 1.18570625e8 | 256 | 41956128 | 2 | 2.7693e-17 | true | ok | NaN | 1.1147e-05 | first\_order |
| 300000.0 | Ipopt | 2.625032915e8 | 422 | 16771856 | 2 | 2.7693e-17 | true | ok | NaN | 1.1147e-05 | first\_order |
| 300000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 300000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 300000.0 | LeastSquaresOptim (Dogleg) | 3.54042291e8 | 118 | 3492816 | 6 | 1.3158e-07 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 300000.0 | LeastSquaresOptim (LM) | 4.04924292e8 | 135 | 3248608 | 10 | 1.3158e-07 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 300000.0 | MadNLP | 1.87731708e8 | 637 | 20090256 | 2 | 3.3688e-16 | true | ok | NaN | 4.1822e-05 | SOLVE\_SUCCEEDED |
| 300000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 300000.0 | NonlinearSolve (TrustRegion) | 2.00011667e8 | 76014 | 144047568 | 14 | 1.6553e-27 | true | ok | NaN | 7.4153e-11 | Success |
| 300000.0 | Optim (Newton) | 2.07480835e7 | 331 | 68625648 | 2 | 2.7801e-17 | true | ok | NaN | 1.1173e-05 | converged |
| 300000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 300000.0 | SecondOrderOptimization | 4.2409584e7 | 264 | 55975904 | 2 | 1.3146e-07 | false | wrong_solution | NaN | 8.1611e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 1.0e6 | CaNNOLeS | 1.21954916e8 | 256 | 41956128 | 2 | 2.3132e-18 | true | ok | NaN | 1.0477e-05 | first\_order |
| 1.0e6 | Ipopt | 2.58943896e8 | 422 | 16771856 | 2 | 2.3133e-18 | true | ok | NaN | 1.0478e-05 | first\_order |
| 1.0e6 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e6 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e6 | LeastSquaresOptim (Dogleg) | 4.13668875e8 | 123 | 3536640 | 7 | 1.2091e-08 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e6 | LeastSquaresOptim (LM) | 4.76793042e8 | 141 | 3284400 | 11 | 1.2091e-08 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e6 | MadNLP | 1.90081208e8 | 637 | 20090256 | 2 | 2.7794e-17 | true | ok | NaN | 3.9234e-05 | SOLVE\_SUCCEEDED |
| 1.0e6 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1.0e6 | NonlinearSolve (TrustRegion) | 2.05374458e8 | 76014 | 144047568 | 14 | 1.6785e-28 | true | ok | NaN | 5.8222e-11 | Success |
| 1.0e6 | Optim (Newton) | 2.02616875e7 | 307 | 68625264 | 2 | 2.3210e-18 | true | ok | NaN | 1.0499e-05 | converged |
| 1.0e6 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1.0e6 | SecondOrderOptimization | 4.4028291e7 | 264 | 55975904 | 2 | 1.2090e-08 | false | wrong_solution | NaN | 8.1647e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 3.0e6 | CaNNOLeS | 1.2206225e8 | 256 | 41956128 | 2 | 2.1261e-19 | true | ok | NaN | 9.0489e-06 | first\_order |
| 3.0e6 | Ipopt | 2.62076e8 | 422 | 16771856 | 2 | 2.1241e-19 | true | ok | NaN | 9.0447e-06 | first\_order |
| 3.0e6 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e6 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e6 | LeastSquaresOptim (Dogleg) | 5.468866665e8 | 123 | 3536640 | 7 | 1.4240e-09 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 3.0e6 | LeastSquaresOptim (LM) | 6.489980205e8 | 150 | 3289888 | 12 | 1.4240e-09 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 3.0e6 | MadNLP | 1.21343834e8 | 629 | 20090096 | 1 | 1.0469e-12 | false | wrong_solution | NaN | 1.6332e-02 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 1.63e-02, above 1e-04 |
| 3.0e6 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 3.0e6 | NonlinearSolve (TrustRegion) | 2.0004925e8 | 76014 | 144244176 | 13 | 8.0828e-27 | true | ok | NaN | 1.5355e-09 | Success |
| 3.0e6 | Optim (Newton) | 1.1250375e7 | 216 | 42211648 | 1 | 1.0214e-12 | false | wrong_solution | NaN | 1.5935e-02 | converged; claimed convergence and the cost test passes, but the solution error is 1.59e-02, above 1e-04 |
| 3.0e6 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 3.0e6 | SecondOrderOptimization | 4.2380708e7 | 264 | 55975904 | 2 | 1.4239e-09 | false | wrong_solution | NaN | 8.1650e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.16e-01, above 1e-04 |
| 1.0e7 | CaNNOLeS | 8.2098959e7 | 254 | 41956032 | 1 | 9.0793e-14 | false | wrong_solution | NaN | 1.4401e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.44e-02, above 1e-04 |
| 1.0e7 | Ipopt | 1.678815835e8 | 365 | 16245184 | 1 | 9.1042e-14 | false | wrong_solution | NaN | 1.4437e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.44e-02, above 1e-04 |
| 1.0e7 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e7 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e7 | LeastSquaresOptim (Dogleg) | 7.449461665e8 | 123 | 3536640 | 7 | 1.5519e-10 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e7 | LeastSquaresOptim (LM) | 8.76804375e8 | 170 | 3304480 | 14 | 1.5519e-10 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e7 | MadNLP | 1.21275375e8 | 629 | 20090096 | 1 | 8.9273e-14 | false | wrong_solution | NaN | 1.4149e-02 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 1.41e-02, above 1e-04 |
| 1.0e7 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1.0e7 | NonlinearSolve (TrustRegion) | 5.60493896e8 | 76396 | 262512640 | 27 | 5.0785e-27 | true | ok | NaN | 4.0136e-09 | Success |
| 1.0e7 | Optim (Newton) | 1.14334795e7 | 200 | 42211392 | 1 | 9.2898e-14 | false | wrong_solution | NaN | 1.4727e-02 | converged; claimed convergence and the cost test passes, but the solution error is 1.47e-02, above 1e-04 |
| 1.0e7 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1.0e7 | SecondOrderOptimization | 4.2503792e7 | 264 | 55975904 | 2 | 1.5516e-10 | false | wrong_solution | NaN | 8.1650e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 3.0e7 | CaNNOLeS | 8.1036334e7 | 254 | 41956032 | 1 | 1.0047e-14 | false | wrong_solution | NaN | 1.1714e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.17e-02, above 1e-04 |
| 3.0e7 | Ipopt | 1.71484834e8 | 365 | 16245184 | 1 | 9.3352e-15 | false | wrong_solution | NaN | 1.0944e-02 | first\_order; claimed convergence and the cost test passes, but the solution error is 1.09e-02, above 1e-04 |
| 3.0e7 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e7 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e7 | LeastSquaresOptim (Dogleg) | 9.643401045e8 | 125 | 3618592 | 7 | 2.7406e-11 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 3.0e7 | LeastSquaresOptim (LM) | 1.139602875e9 | 183 | 3395536 | 15 | 2.7405e-11 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 3.0e7 | MadNLP | 1.16676333e8 | 629 | 20090096 | 1 | 1.1873e-14 | false | wrong_solution | NaN | 1.4751e-02 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 1.48e-02, above 1e-04 |
| 3.0e7 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 3.0e7 | NonlinearSolve (TrustRegion) | 6.983646665e8 | 76398 | 270409936 | 27 | 4.6879e-28 | true | ok | NaN | 2.1643e-09 | Success |
| 3.0e7 | Optim (Newton) | 1.12190415e7 | 200 | 42211392 | 1 | 5.1495e-15 | false | wrong_solution | NaN | 3.4344e-03 | converged; claimed convergence and the cost test passes, but the solution error is 3.43e-03, above 1e-04 |
| 3.0e7 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 3.0e7 | SecondOrderOptimization | 4.3897875e7 | 264 | 55975904 | 2 | 2.7397e-11 | false | wrong_solution | NaN | 8.1650e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e8 | CaNNOLeS | 8.1669292e7 | 254 | 41956032 | 1 | 6.8207e-16 | false | wrong_solution | NaN | 6.5590e-03 | first\_order; claimed convergence and the cost test passes, but the solution error is 6.56e-03, above 1e-04 |
| 1.0e8 | Ipopt | 1.71754416e8 | 365 | 16245184 | 1 | 5.8955e-16 | false | wrong_solution | NaN | 5.2870e-03 | first\_order; claimed convergence and the cost test passes, but the solution error is 5.29e-03, above 1e-04 |
| 1.0e8 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e8 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e8 | LeastSquaresOptim (Dogleg) | 1.157516042e9 | 127 | 3667776 | 7 | 7.3287e-12 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e8 | LeastSquaresOptim (LM) | 1.07863625e9 | 181 | 3381168 | 15 | 7.3337e-12 | false | wrong_solution | NaN | 8.1650e-01 | converged; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
| 1.0e8 | MadNLP | 1.15908e8 | 629 | 20090096 | 1 | 6.3230e-16 | false | wrong_solution | NaN | 6.4770e-03 | SOLVE\_SUCCEEDED; claimed convergence and the cost test passes, but the solution error is 6.48e-03, above 1e-04 |
| 1.0e8 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1.0e8 | NonlinearSolve (TrustRegion) | 8.51044125e8 | 76398 | 270409936 | 28 | 5.0510e-27 | true | ok | NaN | 4.6371e-08 | Success |
| 1.0e8 | Optim (Newton) | 1.1450792e7 | 200 | 42211392 | 1 | 1.9118e-15 | false | wrong_solution | NaN | 1.4440e-02 | converged; claimed convergence and the cost test passes, but the solution error is 1.44e-02, above 1e-04 |
| 1.0e8 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1.0e8 | SecondOrderOptimization | 4.2468584e7 | 264 | 55975904 | 2 | 7.3252e-12 | false | wrong_solution | NaN | 8.1650e-01 | grad\_tol; claimed convergence and the cost test passes, but the solution error is 8.17e-01, above 1e-04 |
