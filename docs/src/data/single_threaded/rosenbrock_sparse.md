# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:51:35
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
| 100 | JuMP | 10333.0 | 5 | 80 | 24625.0 | 9 | 224 |
| 100 | NLLSModel | 244.275 | 1 | 16 | 3071.4285714285716 | 1 | 64 |
| 100 | Standalone (Sparse) | 256.2183908045977 | 1 | 16 | 4866.8 | 22 | 18544 |
| 250 | JuMP | 24583.0 | 5 | 80 | 60791.0 | 9 | 224 |
| 250 | NLLSModel | 625.0 | 1 | 16 | 7375.0 | 1 | 64 |
| 250 | Standalone (Sparse) | 495.825 | 1 | 16 | 10458.0 | 23 | 43840 |
| 500 | JuMP | 48875.0 | 5 | 80 | 121791.0 | 9 | 224 |
| 500 | NLLSModel | 1242.6470588235295 | 1 | 16 | 14875.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 952.3809523809524 | 1 | 16 | 23583.0 | 24 | 87152 |
| 1000 | JuMP | 96500.0 | 5 | 80 | 242792.0 | 9 | 224 |
| 1000 | NLLSModel | 2489.625 | 1 | 16 | 29875.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 1840.909090909091 | 1 | 16 | 43084.0 | 24 | 173712 |
| 2500 | JuMP | 284125.0 | 5 | 80 | 695292.0 | 9 | 224 |
| 2500 | NLLSModel | 6052.0 | 1 | 16 | 74334.0 | 1 | 64 |
| 2500 | Standalone (Sparse) | 5364.5 | 1 | 16 | 96375.0 | 25 | 466032 |
| 5000 | JuMP | 1.013e6 | 5 | 80 | 2.42275e6 | 9 | 224 |
| 5000 | NLLSModel | 12042.0 | 1 | 16 | 149250.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 10708.0 | 1 | 16 | 203459.0 | 25 | 890480 |
| 10000 | JuMP | 2.943666e6 | 5 | 80 | 7.618208e6 | 9 | 224 |
| 10000 | NLLSModel | 23875.0 | 1 | 16 | 296834.0 | 1 | 64 |
| 10000 | Standalone (Sparse) | 20875.0 | 1 | 16 | 378000.0 | 25 | 1731184 |
| 20000 | JuMP | 9.09375e6 | 5 | 80 | 2.1788667e7 | 9 | 224 |
| 20000 | NLLSModel | 47666.0 | 1 | 16 | 612041.0 | 1 | 64 |
| 20000 | Standalone (Sparse) | 41500.0 | 1 | 16 | 781500.0 | 25 | 3428976 |
| 35000 | JuMP | 1.8773041e7 | 5 | 80 | 4.5896084e7 | 9 | 224 |
| 35000 | NLLSModel | 82750.0 | 1 | 16 | 1.056958e6 | 1 | 64 |
| 35000 | Standalone (Sparse) | 71333.0 | 1 | 16 | 1.358125e6 | 25 | 5964400 |
| 50000 | JuMP | 2.7662208e7 | 5 | 80 | 6.7967875e7 | 9 | 224 |
| 50000 | NLLSModel | 119958.0 | 1 | 16 | 1.5275e6 | 1 | 64 |
| 50000 | Standalone (Sparse) | 102250.0 | 1 | 16 | 1.99225e6 | 25 | 8487536 |
| 75000 | JuMP | 4.6023125e7 | 5 | 80 | 1.09855292e8 | 9 | 224 |
| 75000 | NLLSModel | 177792.0 | 1 | 16 | 2.308541e6 | 1 | 64 |
| 75000 | Standalone (Sparse) | 155708.0 | 1 | 16 | 3.0405e6 | 25 | 12649072 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 100 | CaNNOLeS | 148521.0 | 218 | 177312 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 100 | Ipopt | 1.523958e6 | 547 | 121552 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 100 | JSOSolvers (tron) | 873666.5 | 421 | 47136 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 100 | JSOSolvers (trunk) | 423584.0 | 426 | 45344 | 7 | 9.2500e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 100 | LeastSquaresOptim (Dogleg) | 134271.0 | 75 | 22064 | 5 | 5.0660e-28 | true | ok | NaN | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 126333.0 | 137 | 19856 | 17 | 1.6425e-15 | true | ok | NaN | NaN | converged |
| 100 | MadNLP | 719604.0 | 673 | 110480 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 2.95076665e7 | 809 | 460784 | 120 | 2.5247e-25 | true | ok | NaN | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 216125.0 | 1933 | 240240 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 100 | Optim (Newton) | 222250.5 | 553 | 372912 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 100 | SecondOrderOptimization | 70542.0 | 224 | 120304 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 250 | CaNNOLeS | 345062.5 | 232 | 403744 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 250 | Ipopt | 2.7946875e6 | 558 | 231152 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 250 | JSOSolvers (tron) | 2.188521e6 | 428 | 85216 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 250 | JSOSolvers (trunk) | 916708.0 | 432 | 72816 | 7 | 1.0154e-16 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 250 | LeastSquaresOptim (Dogleg) | 293271.0 | 78 | 40992 | 5 | 5.7069e-28 | true | ok | NaN | NaN | converged |
| 250 | LeastSquaresOptim (LM) | 294833.0 | 146 | 38128 | 18 | 8.3212e-16 | true | ok | NaN | NaN | converged |
| 250 | MadNLP | 3.3491459e7 | 11811 | 375984 | 51 | 2.0488e-12 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 250 | NonlinearSolve (LM) | 1.730630625e8 | 816 | 2028880 | 120 | 4.4480e-25 | true | ok | NaN | NaN | StalledSuccess |
| 250 | NonlinearSolve (TrustRegion) | 369958.5 | 930 | 501376 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 250 | Optim (Newton) | 393312.5 | 576 | 853216 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 250 | SecondOrderOptimization | 205354.0 | 233 | 275312 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 500 | CaNNOLeS | 664124.5 | 246 | 795392 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 500 | Ipopt | 4.953229e6 | 589 | 458592 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 500 | JSOSolvers (tron) | 4.2973545e6 | 445 | 151824 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 500 | JSOSolvers (trunk) | 1.693167e6 | 445 | 120480 | 7 | 9.5090e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 500 | LeastSquaresOptim (Dogleg) | 569354.5 | 88 | 74400 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 500 | LeastSquaresOptim (LM) | 579854.0 | 155 | 69856 | 18 | 7.3225e-16 | true | ok | NaN | NaN | converged |
| 500 | MadNLP | 1.8195835e6 | 710 | 341264 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 500 | NonlinearSolve (LM) | 6.04158417e8 | 23464 | 133325520 | 120 | 6.9305e-25 | true | ok | NaN | NaN | StalledSuccess |
| 500 | NonlinearSolve (TrustRegion) | 628396.5 | 989 | 976896 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 500 | Optim (Newton) | 618145.5 | 602 | 1691584 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 500 | SecondOrderOptimization | 268625.5 | 278 | 554032 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 1000 | CaNNOLeS | 1.3052295e6 | 250 | 1610560 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 1000 | Ipopt | 9.723437e6 | 593 | 931520 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 1000 | JSOSolvers (tron) | 8.533729e6 | 446 | 283488 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 1000 | JSOSolvers (trunk) | 3.250083e6 | 447 | 214720 | 7 | 8.5552e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 1000 | LeastSquaresOptim (Dogleg) | 1.1748745e6 | 88 | 140256 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 1000 | LeastSquaresOptim (LM) | 1.1480205e6 | 149 | 132064 | 17 | 5.7105e-15 | true | ok | NaN | NaN | converged |
| 1000 | MadNLP | 3.1613955e6 | 722 | 633136 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1000 | NonlinearSolve (LM) | 2.211051792e9 | 20493 | 253317632 | 119 | 1.0950e-24 | true | ok | NaN | NaN | StalledSuccess |
| 1000 | NonlinearSolve (TrustRegion) | 1.0379795e6 | 1000 | 1795808 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 1000 | Optim (Newton) | 1.1092915e6 | 622 | 3366336 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000 | SecondOrderOptimization | 530791.5 | 283 | 1081616 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 2500 | CaNNOLeS | 3.958083e6 | 252 | 4207456 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 2500 | Ipopt | 2.40410205e7 | 597 | 2350656 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 2500 | JSOSolvers (tron) | 2.1505125e7 | 448 | 735600 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 2500 | JSOSolvers (trunk) | 8.56925e6 | 447 | 546496 | 7 | 7.4927e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 2500 | LeastSquaresOptim (Dogleg) | 3.0785625e6 | 88 | 362480 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 2500 | LeastSquaresOptim (LM) | 3.071938e6 | 149 | 344496 | 17 | 5.1568e-15 | true | ok | NaN | NaN | converged |
| 2500 | MadNLP | 1.53233667e8 | 5281 | 1665584 | 25 | 1.0882e-12 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 2500 | NonlinearSolve (LM) | 1.420328425e10 | 873 | 163359056 | 119 | 2.5764e-24 | true | ok | NaN | NaN | StalledSuccess |
| 2500 | NonlinearSolve (TrustRegion) | 4.4645835e6 | 7141 | 6604256 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 2500 | Optim (Newton) | 2.5806875e6 | 628 | 8909056 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 2500 | SecondOrderOptimization | 1.2963125e6 | 289 | 2819520 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 5000 | CaNNOLeS | 1.01405e7 | 254 | 8205184 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 5000 | Ipopt | 5.1500416e7 | 601 | 4716192 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 5000 | JSOSolvers (tron) | 6.03970625e7 | 448 | 1483632 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 5000 | JSOSolvers (trunk) | 2.4148e7 | 447 | 1058496 | 7 | 6.9280e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 5000 | LeastSquaresOptim (Dogleg) | 5.6108335e6 | 88 | 749024 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 5.9012915e6 | 148 | 705120 | 17 | 3.7472e-15 | true | ok | NaN | NaN | converged |
| 5000 | MadNLP | 2.1831667e7 | 722 | 3222320 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 3.0427974708e10 | 12286 | 729222736 | 69 | 7.1108e-24 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 5000 | NonlinearSolve (TrustRegion) | 8.6175625e6 | 13200 | 13564608 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 5000 | Optim (Newton) | 5.1378335e6 | 628 | 18005248 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 5000 | SecondOrderOptimization | 2.6394375e6 | 289 | 5818096 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 10000 | CaNNOLeS | 2.8096042e7 | 256 | 15856544 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 10000 | Ipopt | 1.13831625e8 | 617 | 8799456 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 10000 | JSOSolvers (tron) | 2.70894521e8 | 450 | 2652112 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 10000 | JSOSolvers (trunk) | 9.8624167e7 | 447 | 1910464 | 7 | 6.5636e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 10000 | LeastSquaresOptim (Dogleg) | 1.118225e7 | 88 | 1325904 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 10000 | LeastSquaresOptim (LM) | 1.1476771e7 | 148 | 1257488 | 17 | 1.2073e-15 | true | ok | NaN | NaN | converged |
| 10000 | MadNLP | 5.94921665e7 | 722 | 5993312 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 10000 | NonlinearSolve (TrustRegion) | 1.6923625e7 | 25274 | 25365904 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 10000 | Optim (Newton) | 1.02349165e7 | 692 | 33503488 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000 | SecondOrderOptimization | 5.279166e6 | 289 | 10676640 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 20000 | CaNNOLeS | 7.1818833e7 | 258 | 33158080 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 20000 | Ipopt | 2.60765625e8 | 621 | 17588512 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 20000 | JSOSolvers (tron) | 7.603181455e8 | 450 | 5283792 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 20000 | JSOSolvers (trunk) | 2.81257875e8 | 447 | 3794624 | 7 | 6.3519e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 20000 | LeastSquaresOptim (Dogleg) | 2.2790584e7 | 93 | 2642784 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 20000 | LeastSquaresOptim (LM) | 2.1936084e7 | 158 | 2504416 | 16 | 3.3775e-15 | true | ok | NaN | NaN | converged |
| 20000 | MadNLP | 1.52003833e8 | 731 | 11706032 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 20000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 20000 | NonlinearSolve (TrustRegion) | 3.5452625e7 | 49441 | 50484368 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 20000 | Optim (Newton) | 2.6256583e7 | 664 | 66791232 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 20000 | SecondOrderOptimization | 1.0694625e7 | 290 | 21327472 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 35000 | CaNNOLeS | 1.31835958e8 | 260 | 62616544 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 35000 | Ipopt | 4.60434959e8 | 625 | 31828320 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 35000 | JSOSolvers (tron) | 1.925084166e9 | 450 | 9392080 | 6 | 5.1615e-17 | true | ok | NaN | NaN | small\_residual |
| 35000 | JSOSolvers (trunk) | 6.76736583e8 | 447 | 6710976 | 7 | 6.2538e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 35000 | LeastSquaresOptim (Dogleg) | 3.9943666e7 | 93 | 4703584 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 35000 | LeastSquaresOptim (LM) | 3.82271455e7 | 158 | 4462304 | 16 | 1.1779e-15 | true | ok | NaN | NaN | converged |
| 35000 | MadNLP | 1.6598735917e10 | 9472 | 20751744 | 48 | 1.6663e-12 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 35000 | NonlinearSolve (TrustRegion) | 1.008188335e8 | 85603 | 85090848 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 35000 | Optim (Newton) | 4.1275854e7 | 645 | 117114384 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 35000 | SecondOrderOptimization | 1.91120205e7 | 290 | 37746800 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 50000 | CaNNOLeS | 2.04704875e8 | 260 | 81130464 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 50000 | Ipopt | 6.87275375e8 | 625 | 43964768 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 50000 | JSOSolvers (tron) | 1.373492209e9 | 285 | 13070560 | 5 | 5.3154e-17 | true | ok | NaN | NaN | small\_residual |
| 50000 | JSOSolvers (trunk) | 1.14614325e9 | 458 | 9349328 | 8 | 5.2000e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 50000 | LeastSquaresOptim (Dogleg) | 5.72895205e7 | 93 | 6548832 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 50000 | LeastSquaresOptim (LM) | 5.5061292e7 | 158 | 6215392 | 16 | 9.2695e-16 | true | ok | NaN | NaN | converged |
| 50000 | MadNLP | 4.57871583e8 | 731 | 28983472 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 50000 | NonlinearSolve (TrustRegion) | 1.331051875e8 | 121788 | 120672304 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 50000 | Optim (Newton) | 5.6312709e7 | 640 | 165430720 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 50000 | SecondOrderOptimization | 2.97147915e7 | 290 | 55296112 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 75000 | CaNNOLeS | 2.99650875e8 | 262 | 140014592 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 75000 | Ipopt | 1.008472084e9 | 629 | 64760224 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 75000 | JSOSolvers (tron) | 2.079003333e9 | 291 | 19493376 | 6 | 2.4189e-18 | true | ok | NaN | NaN | small\_residual |
| 75000 | JSOSolvers (trunk) | 1.768797833e9 | 196 | 13950992 | 9 | 6.8484e-20 | true | ok | NaN | NaN | first\_order |
| 75000 | LeastSquaresOptim (Dogleg) | 8.5375333e7 | 92 | 9758176 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 75000 | LeastSquaresOptim (LM) | 8.72111875e7 | 165 | 9273312 | 17 | 1.1132e-15 | true | ok | NaN | NaN | converged |
| 75000 | MadNLP | 7.16140125e8 | 731 | 43117744 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 75000 | NonlinearSolve (TrustRegion) | 1.87072125e8 | 182094 | 184186944 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 75000 | Optim (Newton) | 9.63983335e7 | 628 | 246580480 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 75000 | SecondOrderOptimization | 4.7120167e7 | 318 | 79138352 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
