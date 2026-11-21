# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T04:34:05
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
| 32 | JuMP | 6698.0 | 2 | 32 | 15334.0 | 5 | 128 |
| 32 | NLLSModel (Sparse) | 227.0989010989011 | 1 | 16 | 1430.5333333333333 | 1 | 32 |
| 32 | Standalone (Sparse) | 246.35 | 1 | 16 | 2916.714285714286 | 20 | 7856 |
| 64 | JuMP | 13834.0 | 2 | 32 | 30667.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 383.66037735849056 | 1 | 16 | 3840.3333333333335 | 1 | 64 |
| 64 | Standalone (Sparse) | 425.84 | 1 | 16 | 5316.8 | 20 | 17200 |
| 128 | JuMP | 25917.0 | 2 | 32 | 63125.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 663.7931034482758 | 1 | 16 | 7625.0 | 1 | 64 |
| 128 | Standalone (Sparse) | 731.4814814814815 | 1 | 16 | 9791.0 | 22 | 33584 |
| 256 | JuMP | 51084.0 | 2 | 32 | 118042.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 1286.764705882353 | 1 | 16 | 15083.0 | 1 | 64 |
| 256 | Standalone (Sparse) | 1372.2 | 1 | 16 | 18125.0 | 24 | 67440 |
| 512 | JuMP | 100792.0 | 2 | 32 | 244125.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 2430.5555555555557 | 1 | 16 | 32083.0 | 1 | 64 |
| 512 | Standalone (Sparse) | 2791.714285714286 | 1 | 16 | 35208.0 | 24 | 134256 |
| 1024 | JuMP | 201125.0 | 2 | 32 | 495667.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 5050.0 | 1 | 16 | 60208.0 | 1 | 64 |
| 1024 | Standalone (Sparse) | 5333.5 | 1 | 16 | 65292.0 | 24 | 267920 |
| 2048 | JuMP | 470709.0 | 2 | 32 | 1.263167e6 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 9625.0 | 1 | 16 | 122791.0 | 1 | 64 |
| 2048 | Standalone (Sparse) | 11209.0 | 1 | 16 | 129041.0 | 25 | 502384 |
| 4096 | JuMP | 1.288125e6 | 2 | 32 | 3.410542e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 18917.0 | 1 | 16 | 233167.0 | 1 | 64 |
| 4096 | Standalone (Sparse) | 21167.0 | 1 | 16 | 249167.0 | 25 | 1020528 |
| 8192 | JuMP | 3.527375e6 | 2 | 32 | 1.0272833e7 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 37792.0 | 1 | 16 | 466167.0 | 1 | 64 |
| 8192 | Standalone (Sparse) | 43167.0 | 1 | 16 | 498667.0 | 25 | 2007664 |
| 16384 | JuMP | 1.0087208e7 | 2 | 32 | 2.9076542e7 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 75709.0 | 1 | 16 | 934834.0 | 1 | 64 |
| 16384 | Standalone (Sparse) | 86459.0 | 1 | 16 | 1.000333e6 | 25 | 3981936 |
| 32768 | JuMP | 2.3331625e7 | 2 | 32 | 6.7627583e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 151583.0 | 1 | 16 | 1.862459e6 | 1 | 64 |
| 32768 | Standalone (Sparse) | 170084.0 | 1 | 16 | 2.023625e6 | 25 | 9634416 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 32 | CaNNOLeS | 55979.5 | 180 | 48880 | 3 | 1.8561e-18 | true | ok | NaN | NaN | first\_order |
| 32 | Ipopt | 679375.5 | 400 | 33392 | 3 | 1.8561e-18 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (tron) | 684042.0 | 643 | 37376 | 5 | 1.8772e-17 | true | ok | NaN | NaN | small\_residual |
| 32 | JSOSolvers (trunk) | 291500.0 | 277 | 17392 | 4 | 6.2913e-23 | true | ok | NaN | NaN | first\_order |
| 32 | LeastSquaresOptim (Dogleg) | 169291.5 | 123 | 20224 | 11 | 5.5649e-16 | true | ok | NaN | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 383708.5 | 208 | 34320 | 22 | 2.7791e-15 | true | ok | NaN | NaN | converged |
| 32 | MadNLP | 461271.0 | 589 | 68240 | 4 | 6.1485e-27 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 2.8775e6 | 784 | 103376 | 135 | 1.0940e-24 | true | ok | NaN | NaN | StalledSuccess |
| 32 | NonlinearSolve (TrustRegion) | 140312.5 | 868 | 130736 | 10 | 3.1256e-28 | true | ok | NaN | NaN | Success |
| 32 | Optim (Newton) | 94771.5 | 351 | 103856 | 3 | 1.8561e-18 | true | ok | NaN | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 32 | SecondOrderOptimization | 29167.0 | 211 | 54272 | 4 | 1.1617e-26 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 64 | CaNNOLeS | 125500.0 | 196 | 97104 | 4 | 2.3437e-28 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 832854.0 | 403 | 57792 | 3 | 1.3511e-15 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 3.375854e6 | 1469 | 83456 | 5 | 8.8255e-18 | true | ok | NaN | NaN | small\_residual |
| 64 | JSOSolvers (trunk) | 1.902375e6 | 1039 | 64368 | 6 | 7.3635e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 64 | LeastSquaresOptim (Dogleg) | 1.022542e6 | 205 | 93376 | 17 | 3.7648e-16 | true | ok | NaN | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 1.7199795e6 | 295 | 128416 | 27 | 6.3401e-15 | true | ok | NaN | NaN | converged |
| 64 | MadNLP | 612021.0 | 591 | 88432 | 4 | 2.0323e-21 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 9.648917e6 | 791 | 225136 | 132 | 3.3865e-24 | true | ok | NaN | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 199396.0 | 899 | 268144 | 12 | 3.3840e-28 | true | ok | NaN | NaN | Success |
| 64 | Optim (Newton) | 180375.5 | 448 | 260528 | 4 | 4.4068e-28 | true | ok | NaN | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 64 | SecondOrderOptimization | 56208.5 | 222 | 100576 | 4 | 2.4905e-24 | true | ok | NaN | NaN | grad\_tol |
| 128 | CaNNOLeS | 247229.0 | 219 | 175040 | 4 | 9.8822e-28 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 1.133646e6 | 417 | 83008 | 3 | 1.0601e-14 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 1.37504585e7 | 2701 | 156256 | 5 | 2.0747e-17 | true | ok | NaN | NaN | small\_residual |
| 128 | JSOSolvers (trunk) | 1.0362459e7 | 2251 | 131792 | 7 | 1.3410e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 128 | LeastSquaresOptim (Dogleg) | 3.674e6 | 215 | 105744 | 18 | 4.8255e-17 | true | ok | NaN | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 4.952438e6 | 322 | 180496 | 29 | 1.1654e-14 | true | ok | NaN | NaN | converged |
| 128 | MadNLP | 766979.0 | 602 | 128080 | 4 | 6.8709e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 3.6428958e7 | 811 | 503728 | 135 | 5.7843e-24 | true | ok | NaN | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 319291.5 | 915 | 359744 | 11 | 2.0623e-26 | true | ok | NaN | NaN | Success |
| 128 | Optim (Newton) | 254791.5 | 472 | 506576 | 4 | 1.1209e-27 | true | ok | NaN | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 128 | SecondOrderOptimization | 109937.5 | 234 | 191840 | 4 | 1.9230e-23 | true | ok | NaN | NaN | grad\_tol |
| 256 | CaNNOLeS | 484062.5 | 242 | 352960 | 4 | 1.7645e-27 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 1.795667e6 | 441 | 162080 | 3 | 3.0200e-14 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | 3.60795625e7 | 3638 | 224960 | 5 | 5.2804e-17 | true | ok | NaN | NaN | small\_residual |
| 256 | JSOSolvers (trunk) | 3.0647458e7 | 3324 | 199344 | 7 | 4.1998e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 256 | LeastSquaresOptim (Dogleg) | 1.0017958e7 | 204 | 280512 | 13 | 2.4570e-18 | true | ok | NaN | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 1.0961375e7 | 346 | 212272 | 30 | 1.4391e-14 | true | ok | NaN | NaN | converged |
| 256 | MadNLP | 1.1629375e6 | 632 | 205024 | 4 | 2.4314e-19 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 1.394671245e8 | 862 | 1530288 | 135 | 1.4482e-23 | true | ok | NaN | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 594375.0 | 1006 | 705984 | 13 | 2.0210e-27 | true | ok | NaN | NaN | Success |
| 256 | Optim (Newton) | 392229.5 | 500 | 1005008 | 4 | 1.4044e-27 | true | ok | NaN | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 256 | SecondOrderOptimization | 214499.5 | 278 | 380240 | 4 | 5.5846e-23 | true | ok | NaN | NaN | grad\_tol |
| 512 | CaNNOLeS | 906375.0 | 250 | 725824 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 512 | Ipopt | 2.9651455e6 | 443 | 327616 | 3 | 6.9397e-14 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (tron) | 8.75546875e7 | 4400 | 312992 | 6 | 2.6432e-18 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (trunk) | 7.0078333e7 | 3779 | 255872 | 7 | 8.8495e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 512 | LeastSquaresOptim (Dogleg) | 2.6541125e7 | 192 | 288112 | 12 | 3.0784e-23 | true | ok | NaN | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 2.1217958e7 | 344 | 234192 | 30 | 2.1638e-14 | true | ok | NaN | NaN | converged |
| 512 | MadNLP | 1.959854e6 | 644 | 363280 | 4 | 5.9223e-19 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 4.73830334e8 | 25130 | 127781872 | 138 | 2.8773e-23 | true | ok | NaN | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 1.053604e6 | 1017 | 1380400 | 11 | 8.8263e-27 | true | ok | NaN | NaN | Success |
| 512 | Optim (Newton) | 700062.5 | 516 | 1995728 | 4 | 4.0048e-27 | true | ok | NaN | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 512 | SecondOrderOptimization | 392521.0 | 281 | 750992 | 4 | 1.2908e-22 | true | ok | NaN | NaN | grad\_tol |
| 1024 | CaNNOLeS | 1.9022915e6 | 250 | 1405760 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 1024 | Ipopt | 5.7813545e6 | 447 | 539680 | 3 | 1.4779e-13 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (tron) | 1.72479729e8 | 4364 | 414208 | 6 | 2.3931e-17 | true | ok | NaN | NaN | small\_residual |
| 1024 | JSOSolvers (trunk) | 1.52197042e8 | 3898 | 325168 | 8 | 3.7719e-18 | true | ok | NaN | NaN | first\_order |
| 1024 | LeastSquaresOptim (Dogleg) | 5.52487295e7 | 192 | 342128 | 12 | 4.3746e-22 | true | ok | NaN | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 4.26602705e7 | 344 | 285264 | 30 | 4.2366e-14 | true | ok | NaN | NaN | converged |
| 1024 | MadNLP | 3.5030625e6 | 644 | 677712 | 4 | 1.2904e-18 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 1.84135675e9 | 23736 | 245169488 | 138 | 4.4891e-23 | true | ok | NaN | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 4.0844585e6 | 3473 | 4059904 | 14 | 3.5630e-27 | true | ok | NaN | NaN | Success |
| 1024 | Optim (Newton) | 1.267292e6 | 516 | 4206192 | 4 | 4.5903e-27 | true | ok | NaN | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1024 | SecondOrderOptimization | 707041.5 | 285 | 1566064 | 4 | 2.7550e-22 | true | ok | NaN | NaN | grad\_tol |
| 2048 | CaNNOLeS | 4.873104e6 | 252 | 2700128 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 2048 | Ipopt | 1.2290979e7 | 451 | 1082720 | 3 | 3.0458e-13 | true | ok | NaN | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 3.228438125e8 | 4152 | 609776 | 6 | 6.0630e-18 | true | ok | NaN | NaN | small\_residual |
| 2048 | JSOSolvers (trunk) | 3.114082295e8 | 3930 | 465968 | 8 | 4.3022e-18 | true | ok | NaN | NaN | first\_order |
| 2048 | LeastSquaresOptim (Dogleg) | 1.235933335e8 | 204 | 469792 | 13 | 2.2806e-24 | true | ok | NaN | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 9.64555e7 | 343 | 387168 | 30 | 1.5557e-13 | true | ok | NaN | NaN | converged |
| 2048 | MadNLP | 8.1171665e6 | 644 | 1306576 | 4 | 2.6868e-18 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 6.946768667e9 | 23878 | 495769392 | 138 | 9.5030e-23 | true | ok | NaN | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 7.747771e6 | 5828 | 7693456 | 11 | 9.6804e-27 | true | ok | NaN | NaN | Success |
| 2048 | Optim (Newton) | 2.4342495e6 | 521 | 7774672 | 4 | 4.3074e-27 | true | ok | NaN | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 2048 | SecondOrderOptimization | 1.4129165e6 | 289 | 2942320 | 4 | 5.6835e-22 | true | ok | NaN | NaN | grad\_tol |
| 4096 | CaNNOLeS | 1.1963958e7 | 254 | 5288832 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 4096 | Ipopt | 2.7322917e7 | 455 | 2177120 | 3 | 6.1816e-13 | true | ok | NaN | NaN | first\_order |
| 4096 | JSOSolvers (tron) | 1.063919333e9 | 4596 | 1042736 | 6 | 4.4011e-18 | true | ok | NaN | NaN | small\_residual |
| 4096 | JSOSolvers (trunk) | 9.27490834e8 | 4246 | 765712 | 8 | 5.0157e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4096 | LeastSquaresOptim (Dogleg) | 2.335375e8 | 204 | 686112 | 13 | 2.4824e-22 | true | ok | NaN | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 1.89900042e8 | 343 | 591456 | 30 | 2.1620e-13 | true | ok | NaN | NaN | converged |
| 4096 | MadNLP | 1.9823125e7 | 644 | 2564304 | 4 | 5.4795e-18 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 3.0184539083e10 | 873 | 291021296 | 133 | 1.7955e-22 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 4096 | NonlinearSolve (TrustRegion) | 1.73783335e7 | 10538 | 16666016 | 15 | 4.0653e-27 | true | ok | NaN | NaN | Success |
| 4096 | Optim (Newton) | 4.871625e6 | 521 | 15960528 | 4 | 4.9230e-27 | true | ok | NaN | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 4096 | SecondOrderOptimization | 2.8361665e6 | 289 | 6014576 | 4 | 1.1540e-21 | true | ok | NaN | NaN | grad\_tol |
| 8192 | CaNNOLeS | 3.0665083e7 | 256 | 10449824 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 8192 | Ipopt | 6.1967542e7 | 465 | 4332704 | 3 | 1.2453e-12 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (tron) | 4.232126583e9 | 4533 | 1863008 | 6 | 4.9132e-17 | true | ok | NaN | NaN | small\_residual |
| 8192 | JSOSolvers (trunk) | 3.719406542e9 | 4268 | 1323824 | 8 | 5.0343e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8192 | LeastSquaresOptim (Dogleg) | 4.35819458e8 | 204 | 1119168 | 13 | 2.9846e-21 | true | ok | NaN | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 3.4936675e8 | 353 | 1007056 | 31 | 1.0752e-13 | true | ok | NaN | NaN | converged |
| 8192 | MadNLP | 5.4436875e7 | 644 | 5121008 | 4 | 1.1065e-17 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 4096 |
| 8192 | NonlinearSolve (TrustRegion) | 3.7358041e7 | 19901 | 32830592 | 15 | 3.4781e-27 | true | ok | NaN | NaN | Success |
| 8192 | Optim (Newton) | 9.702938e6 | 569 | 31055056 | 4 | 6.4111e-27 | true | ok | NaN | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 8192 | SecondOrderOptimization | 5.635916e6 | 289 | 11765904 | 4 | 2.3254e-21 | true | ok | NaN | NaN | grad\_tol |
| 16384 | CaNNOLeS | 7.1841292e7 | 258 | 20886464 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 16384 | Ipopt | 1.32261417e8 | 475 | 8660000 | 3 | 2.4996e-12 | true | ok | NaN | NaN | first\_order |
| 16384 | JSOSolvers (tron) | 1.0575363166e10 | 4205 | 3493856 | 6 | 2.2511e-17 | true | ok | NaN | NaN | small\_residual |
| 16384 | JSOSolvers (trunk) | 1.0254124875e10 | 4296 | 2439280 | 8 | 4.1993e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 16384 | LeastSquaresOptim (Dogleg) | 9.431687295e8 | 230 | 2005456 | 14 | 6.2742e-24 | true | ok | NaN | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 7.067833545e8 | 382 | 1809872 | 31 | 1.6302e-13 | true | ok | NaN | NaN | converged |
| 16384 | MadNLP | 1.41375625e8 | 653 | 10110672 | 4 | 2.2236e-17 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 4096 |
| 16384 | NonlinearSolve (TrustRegion) | 9.0499896e7 | 38634 | 69076512 | 16 | 3.3731e-27 | true | ok | NaN | NaN | Success |
| 16384 | Optim (Newton) | 2.5028625e7 | 549 | 61242256 | 4 | 8.5227e-27 | true | ok | NaN | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 16384 | SecondOrderOptimization | 1.1329396e7 | 290 | 23178352 | 4 | 4.6682e-21 | true | ok | NaN | NaN | grad\_tol |
| 32768 | CaNNOLeS | 1.52039542e8 | 260 | 43676640 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 32768 | Ipopt | 2.74735479e8 | 479 | 17298528 | 3 | 5.0083e-12 | true | ok | NaN | NaN | first\_order |
| 32768 | JSOSolvers (tron) | 3.0143289625e10 | 4109 | 6782432 | 7 | 1.8518e-16 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 32768 | JSOSolvers (trunk) | 2.942267525e10 | 4218 | 4663760 | 8 | 1.1804e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 32768 | LeastSquaresOptim (Dogleg) | 1.804165416e9 | 230 | 3738064 | 14 | 9.4597e-22 | true | ok | NaN | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 1.436249334e9 | 382 | 3446224 | 31 | 3.0354e-13 | true | ok | NaN | NaN | converged |
| 32768 | MadNLP | 3.22644042e8 | 653 | 20090576 | 4 | 4.4577e-17 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 4096 |
| 32768 | NonlinearSolve (TrustRegion) | 2.12269458e8 | 76000 | 136100928 | 16 | 4.7843e-27 | true | ok | NaN | NaN | Success |
| 32768 | Optim (Newton) | 4.4328792e7 | 533 | 121453200 | 4 | 1.2826e-26 | true | ok | NaN | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 32768 | SecondOrderOptimization | 2.59130835e7 | 290 | 46658672 | 4 | 9.3537e-21 | true | ok | NaN | NaN | grad\_tol |
