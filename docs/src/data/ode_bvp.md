# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:39:52
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
| 32 | JuMP | 6764.0 | 2 | 32 | 15708.0 | 5 | 128 |
| 32 | NLLSModel (Sparse) | 221.62765957446808 | 1 | 16 | 1511.857142857143 | 1 | 32 |
| 32 | Standalone (Sparse) | 253.24675324675326 | 1 | 16 | 2976.1428571428573 | 20 | 7856 |
| 64 | JuMP | 13167.0 | 2 | 32 | 30500.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 371.96363636363634 | 1 | 16 | 3800.0 | 1 | 64 |
| 64 | Standalone (Sparse) | 418.34 | 1 | 16 | 4658.4 | 20 | 17200 |
| 128 | JuMP | 25709.0 | 2 | 32 | 61125.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 670.8333333333334 | 1 | 16 | 7514.0 | 1 | 64 |
| 128 | Standalone (Sparse) | 723.2142857142857 | 1 | 16 | 9319.333333333334 | 22 | 33584 |
| 256 | JuMP | 50417.0 | 2 | 32 | 121709.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 1210.0 | 1 | 16 | 15125.0 | 1 | 64 |
| 256 | Standalone (Sparse) | 1355.5333333333333 | 1 | 16 | 17625.0 | 24 | 67440 |
| 512 | JuMP | 106333.0 | 2 | 32 | 242292.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 1401.7857142857142 | 1 | 16 | 30125.0 | 1 | 64 |
| 512 | Standalone (Sparse) | 2677.125 | 1 | 16 | 33458.0 | 24 | 134256 |
| 1024 | JuMP | 212583.0 | 2 | 32 | 487167.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 1564.1538461538462 | 1 | 16 | 27792.0 | 1 | 64 |
| 1024 | Standalone (Sparse) | 5572.75 | 1 | 16 | 64541.0 | 24 | 267920 |
| 2048 | JuMP | 476208.0 | 2 | 32 | 1.144167e6 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 2200.0 | 1 | 16 | 43542.0 | 1 | 64 |
| 2048 | Standalone (Sparse) | 11458.0 | 1 | 16 | 127750.0 | 25 | 502384 |
| 4096 | JuMP | 1.564917e6 | 2 | 32 | 3.59e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 3437.5 | 1 | 16 | 97167.0 | 1 | 64 |
| 4096 | Standalone (Sparse) | 22833.0 | 1 | 16 | 252167.0 | 25 | 1020528 |
| 8192 | JuMP | 4.268417e6 | 2 | 32 | 1.3013375e7 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 23875.0 | 1 | 16 | 157000.0 | 1 | 64 |
| 8192 | Standalone (Sparse) | 42875.0 | 1 | 16 | 517875.0 | 25 | 2007664 |
| 16384 | JuMP | 1.1257375e7 | 2 | 32 | 3.3135583e7 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 48375.0 | 1 | 16 | 320500.0 | 1 | 64 |
| 16384 | Standalone (Sparse) | 85875.0 | 1 | 16 | 1.015208e6 | 25 | 3981936 |
| 32768 | JuMP | 2.5029583e7 | 2 | 32 | 7.3119209e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 91792.0 | 1 | 16 | 622583.0 | 1 | 64 |
| 32768 | Standalone (Sparse) | 175125.0 | 1 | 16 | 2.085375e6 | 25 | 9634416 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 32 | CaNNOLeS | 57166.5 | 180 | 48880 | 3 | 1.8561e-18 | true | ok | NaN | NaN | first\_order |
| 32 | Ipopt | 722250.0 | 400 | 33392 | 3 | 1.8561e-18 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (tron) | 737854.0 | 643 | 37376 | 5 | 1.8772e-17 | true | ok | NaN | NaN | small\_residual |
| 32 | JSOSolvers (trunk) | 311437.5 | 277 | 17392 | 4 | 6.2913e-23 | true | ok | NaN | NaN | first\_order |
| 32 | LeastSquaresOptim (Dogleg) | 173062.0 | 123 | 20224 | 11 | 5.5649e-16 | true | ok | NaN | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 392062.5 | 208 | 34320 | 22 | 2.7791e-15 | true | ok | NaN | NaN | converged |
| 32 | MadNLP | 480604.0 | 589 | 68240 | 4 | 6.1485e-27 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 3.069625e6 | 784 | 103376 | 135 | 1.0940e-24 | true | ok | NaN | NaN | StalledSuccess |
| 32 | NonlinearSolve (TrustRegion) | 140791.5 | 868 | 130736 | 10 | 3.1256e-28 | true | ok | NaN | NaN | Success |
| 32 | Optim (Newton) | 97833.0 | 351 | 103856 | 3 | 1.8561e-18 | true | ok | NaN | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 32 | SecondOrderOptimization | 30520.5 | 211 | 54272 | 4 | 1.1617e-26 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 64 | CaNNOLeS | 129979.0 | 196 | 97104 | 4 | 2.3437e-28 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 899500.0 | 403 | 57792 | 3 | 1.3511e-15 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 3.2524375e6 | 1469 | 83456 | 5 | 8.8255e-18 | true | ok | NaN | NaN | small\_residual |
| 64 | JSOSolvers (trunk) | 1.856583e6 | 1039 | 64368 | 6 | 7.3635e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 64 | LeastSquaresOptim (Dogleg) | 975833.0 | 205 | 93376 | 17 | 3.7648e-16 | true | ok | NaN | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 1.642646e6 | 295 | 128416 | 27 | 6.3401e-15 | true | ok | NaN | NaN | converged |
| 64 | MadNLP | 576916.5 | 591 | 88432 | 4 | 2.0323e-21 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 9.662e6 | 791 | 225136 | 132 | 3.3865e-24 | true | ok | NaN | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 205083.5 | 899 | 268144 | 12 | 3.3840e-28 | true | ok | NaN | NaN | Success |
| 64 | Optim (Newton) | 176042.0 | 448 | 260528 | 4 | 4.4068e-28 | true | ok | NaN | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 64 | SecondOrderOptimization | 53146.0 | 222 | 100576 | 4 | 2.4905e-24 | true | ok | NaN | NaN | grad\_tol |
| 128 | CaNNOLeS | 243250.0 | 219 | 175040 | 4 | 9.8822e-28 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 1.202209e6 | 417 | 83008 | 3 | 1.0601e-14 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 1.3681563e7 | 2701 | 156256 | 5 | 2.0747e-17 | true | ok | NaN | NaN | small\_residual |
| 128 | JSOSolvers (trunk) | 1.0206458e7 | 2251 | 131792 | 7 | 1.3410e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 128 | LeastSquaresOptim (Dogleg) | 3.7661665e6 | 215 | 105744 | 18 | 4.8255e-17 | true | ok | NaN | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 5.07275e6 | 322 | 180496 | 29 | 1.1654e-14 | true | ok | NaN | NaN | converged |
| 128 | MadNLP | 774833.5 | 602 | 128080 | 4 | 6.8709e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 3.6433813e7 | 811 | 503728 | 135 | 5.7843e-24 | true | ok | NaN | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 310688.0 | 915 | 359744 | 11 | 2.0623e-26 | true | ok | NaN | NaN | Success |
| 128 | Optim (Newton) | 261979.0 | 472 | 506576 | 4 | 1.1209e-27 | true | ok | NaN | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 128 | SecondOrderOptimization | 106417.0 | 234 | 191840 | 4 | 1.9230e-23 | true | ok | NaN | NaN | grad\_tol |
| 256 | CaNNOLeS | 472562.5 | 242 | 352960 | 4 | 1.7645e-27 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 1.844042e6 | 441 | 162080 | 3 | 3.0200e-14 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | 3.6897542e7 | 3638 | 224960 | 5 | 5.2804e-17 | true | ok | NaN | NaN | small\_residual |
| 256 | JSOSolvers (trunk) | 3.1042417e7 | 3324 | 199344 | 7 | 4.1998e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 256 | LeastSquaresOptim (Dogleg) | 1.0149896e7 | 204 | 280512 | 13 | 2.4570e-18 | true | ok | NaN | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 1.10199375e7 | 346 | 212272 | 30 | 1.4391e-14 | true | ok | NaN | NaN | converged |
| 256 | MadNLP | 1.1713955e6 | 632 | 205024 | 4 | 2.4314e-19 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 1.44265708e8 | 2680 | 1559376 | 135 | 1.4482e-23 | true | ok | NaN | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 563875.0 | 1006 | 705984 | 13 | 2.0210e-27 | true | ok | NaN | NaN | Success |
| 256 | Optim (Newton) | 398541.5 | 500 | 1005008 | 4 | 1.4044e-27 | true | ok | NaN | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 256 | SecondOrderOptimization | 220208.5 | 278 | 380240 | 4 | 5.5846e-23 | true | ok | NaN | NaN | grad\_tol |
| 512 | CaNNOLeS | 924062.5 | 250 | 725824 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 512 | Ipopt | 3.0418545e6 | 443 | 327616 | 3 | 6.9397e-14 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (tron) | 8.90866665e7 | 4400 | 312992 | 6 | 2.6432e-18 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (trunk) | 7.0962792e7 | 3779 | 255872 | 7 | 8.8495e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 512 | LeastSquaresOptim (Dogleg) | 2.7048e7 | 192 | 288112 | 12 | 3.0784e-23 | true | ok | NaN | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 2.1636583e7 | 344 | 234192 | 30 | 2.1638e-14 | true | ok | NaN | NaN | converged |
| 512 | MadNLP | 2.024521e6 | 644 | 363280 | 4 | 5.9223e-19 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 5.06904708e8 | 24228 | 127767440 | 138 | 2.8773e-23 | true | ok | NaN | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 1.091104e6 | 1017 | 1380400 | 11 | 8.8263e-27 | true | ok | NaN | NaN | Success |
| 512 | Optim (Newton) | 702750.5 | 516 | 1995728 | 4 | 4.0048e-27 | true | ok | NaN | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 512 | SecondOrderOptimization | 370062.5 | 281 | 750992 | 4 | 1.2908e-22 | true | ok | NaN | NaN | grad\_tol |
| 1024 | CaNNOLeS | 1.9544995e6 | 250 | 1405760 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 1024 | Ipopt | 6.381667e6 | 447 | 539680 | 3 | 1.4779e-13 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (tron) | 1.734279375e8 | 4364 | 414208 | 6 | 2.3931e-17 | true | ok | NaN | NaN | small\_residual |
| 1024 | JSOSolvers (trunk) | 1.56055083e8 | 3898 | 325168 | 8 | 3.7719e-18 | true | ok | NaN | NaN | first\_order |
| 1024 | LeastSquaresOptim (Dogleg) | 5.6862459e7 | 192 | 342128 | 12 | 4.3746e-22 | true | ok | NaN | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 4.47407915e7 | 344 | 285264 | 30 | 4.2366e-14 | true | ok | NaN | NaN | converged |
| 1024 | MadNLP | 3.591375e6 | 644 | 677712 | 4 | 1.2904e-18 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 1.856914083e9 | 23792 | 245170384 | 138 | 4.4891e-23 | true | ok | NaN | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 4.5564375e6 | 3473 | 4059904 | 14 | 3.5630e-27 | true | ok | NaN | NaN | Success |
| 1024 | Optim (Newton) | 1.323354e6 | 516 | 4206192 | 4 | 4.5903e-27 | true | ok | NaN | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1024 | SecondOrderOptimization | 581687.5 | 408 | 1639680 | 4 | 2.7550e-22 | true | ok | NaN | NaN | grad\_tol |
| 2048 | CaNNOLeS | 5.0247085e6 | 252 | 2700128 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 2048 | Ipopt | 1.3407229e7 | 451 | 1082720 | 3 | 3.0458e-13 | true | ok | NaN | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 3.333065e8 | 4152 | 609776 | 6 | 6.0630e-18 | true | ok | NaN | NaN | small\_residual |
| 2048 | JSOSolvers (trunk) | 3.2133575e8 | 3930 | 465968 | 8 | 4.3022e-18 | true | ok | NaN | NaN | first\_order |
| 2048 | LeastSquaresOptim (Dogleg) | 1.28583771e8 | 204 | 469792 | 13 | 2.2806e-24 | true | ok | NaN | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 9.8042e7 | 343 | 387168 | 30 | 1.5557e-13 | true | ok | NaN | NaN | converged |
| 2048 | MadNLP | 8.245875e6 | 644 | 1306576 | 4 | 2.6868e-18 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 7.08774075e9 | 23880 | 495769424 | 138 | 9.5030e-23 | true | ok | NaN | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 8.4984165e6 | 5828 | 7693456 | 11 | 9.6804e-27 | true | ok | NaN | NaN | Success |
| 2048 | Optim (Newton) | 2.495208e6 | 521 | 7774672 | 4 | 4.3074e-27 | true | ok | NaN | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 2048 | SecondOrderOptimization | 1.148542e6 | 418 | 3148208 | 4 | 5.6835e-22 | true | ok | NaN | NaN | grad\_tol |
| 4096 | CaNNOLeS | 1.3545854e7 | 254 | 5288832 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 4096 | Ipopt | 2.9925583e7 | 455 | 2177120 | 3 | 6.1816e-13 | true | ok | NaN | NaN | first\_order |
| 4096 | JSOSolvers (tron) | 1.222631875e9 | 4596 | 1042736 | 6 | 4.4011e-18 | true | ok | NaN | NaN | small\_residual |
| 4096 | JSOSolvers (trunk) | 1.025436791e9 | 4246 | 765712 | 8 | 5.0157e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4096 | LeastSquaresOptim (Dogleg) | 2.41687541e8 | 204 | 686112 | 13 | 2.4824e-22 | true | ok | NaN | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 1.903234585e8 | 343 | 591456 | 30 | 2.1620e-13 | true | ok | NaN | NaN | converged |
| 4096 | MadNLP | 2.1875625e7 | 644 | 2564304 | 4 | 5.4795e-18 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 3.0170064833e10 | 873 | 291021296 | 130 | 1.8098e-22 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 4096 | NonlinearSolve (TrustRegion) | 1.8990875e7 | 10610 | 16667168 | 15 | 4.0653e-27 | true | ok | NaN | NaN | Success |
| 4096 | Optim (Newton) | 5.1833955e6 | 521 | 15960528 | 4 | 4.9230e-27 | true | ok | NaN | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 4096 | SecondOrderOptimization | 2.2095205e6 | 418 | 6417072 | 4 | 1.1540e-21 | true | ok | NaN | NaN | grad\_tol |
| 8192 | CaNNOLeS | 3.4927417e7 | 256 | 10449824 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 8192 | Ipopt | 6.8422896e7 | 465 | 4332704 | 3 | 1.2453e-12 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (tron) | 4.660144583e9 | 4533 | 1863008 | 6 | 4.9132e-17 | true | ok | NaN | NaN | small\_residual |
| 8192 | JSOSolvers (trunk) | 4.12287675e9 | 4268 | 1323824 | 8 | 5.0343e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8192 | LeastSquaresOptim (Dogleg) | 4.49950666e8 | 204 | 1119168 | 13 | 2.9846e-21 | true | ok | NaN | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 3.61467375e8 | 353 | 1007056 | 31 | 1.0752e-13 | true | ok | NaN | NaN | converged |
| 8192 | MadNLP | 6.02142085e7 | 644 | 5121008 | 4 | 1.1065e-17 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 4096 |
| 8192 | NonlinearSolve (TrustRegion) | 4.1144229e7 | 19937 | 32831168 | 15 | 3.4781e-27 | true | ok | NaN | NaN | Success |
| 8192 | Optim (Newton) | 1.02179165e7 | 521 | 31054288 | 4 | 6.4111e-27 | true | ok | NaN | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 8192 | SecondOrderOptimization | 4.41625e6 | 418 | 12561616 | 4 | 2.3254e-21 | true | ok | NaN | NaN | grad\_tol |
| 16384 | CaNNOLeS | 8.357725e7 | 258 | 21754816 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 16384 | Ipopt | 1.339794625e9 | 475 | 8660000 | 3 | 2.4996e-12 | true | ok | NaN | NaN | first\_order |
| 16384 | JSOSolvers (tron) | 1.4262774125e10 | 4205 | 3493856 | 6 | 2.2511e-17 | true | ok | NaN | NaN | small\_residual |
| 16384 | JSOSolvers (trunk) | 1.34057155e10 | 4296 | 2439280 | 8 | 4.1993e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 16384 | LeastSquaresOptim (Dogleg) | 1.20613575e9 | 230 | 2005456 | 14 | 6.2742e-24 | true | ok | NaN | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 8.571795415e8 | 382 | 1809872 | 31 | 1.6302e-13 | true | ok | NaN | NaN | converged |
| 16384 | MadNLP | 1.649349375e8 | 653 | 10110672 | 4 | 2.2236e-17 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 4096 |
| 16384 | NonlinearSolve (TrustRegion) | 1.278900215e8 | 38646 | 69076704 | 16 | 3.3731e-27 | true | ok | NaN | NaN | Success |
| 16384 | Optim (Newton) | 2.527775e7 | 548 | 61242240 | 4 | 8.5227e-27 | true | ok | NaN | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 16384 | SecondOrderOptimization | 2.3949208e7 | 419 | 24760496 | 4 | 4.6682e-21 | true | ok | NaN | NaN | grad\_tol |
| 32768 | CaNNOLeS | 1.653724375e8 | 260 | 43676640 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 32768 | Ipopt | 1.647093167e9 | 479 | 17298528 | 3 | 5.0083e-12 | true | ok | NaN | NaN | first\_order |
| 32768 | JSOSolvers (tron) | 3.0069933917e10 | 3858 | 6770384 | 6 | 2.5072e-14 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 32768 | JSOSolvers (trunk) | 3.0038075583e10 | 3822 | 4638704 | 8 | 6.9716e-17 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 32768 | LeastSquaresOptim (Dogleg) | 2.010342334e9 | 230 | 3738064 | 14 | 9.4597e-22 | true | ok | NaN | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 1.54699175e9 | 382 | 3446224 | 31 | 3.0354e-13 | true | ok | NaN | NaN | converged |
| 32768 | MadNLP | 3.42892542e8 | 653 | 20090576 | 4 | 4.4577e-17 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 4096 |
| 32768 | NonlinearSolve (TrustRegion) | 2.34169417e8 | 76002 | 142687328 | 16 | 4.7571e-27 | true | ok | NaN | NaN | Success |
| 32768 | Optim (Newton) | 4.55519375e7 | 533 | 125614736 | 4 | 1.2826e-26 | true | ok | NaN | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 32768 | SecondOrderOptimization | 2.0996479e7 | 419 | 50043056 | 4 | 9.3537e-21 | true | ok | NaN | NaN | grad\_tol |
