# Benchmark Results: Sparse Multi-dimensional Rosenbrock

- **Category**: large_sparse
- **Scaling Metric**: Variables n
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T16:29:20
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
| 100 | JuMP | 10209.0 | 5 | 80 | 24292.0 | 9 | 224 |
| 100 | NLLSModel | 275.390625 | 1 | 16 | 3298.6666666666665 | 1 | 64 |
| 100 | Standalone (Sparse) | 251.58227848101265 | 1 | 16 | 4792.0 | 22 | 18544 |
| 250 | JuMP | 24458.0 | 5 | 80 | 61125.0 | 9 | 224 |
| 250 | NLLSModel | 390.82 | 1 | 16 | 8069.333333333333 | 1 | 64 |
| 250 | Standalone (Sparse) | 487.1190476190476 | 1 | 16 | 10458.0 | 23 | 43840 |
| 500 | JuMP | 50333.0 | 5 | 80 | 129792.0 | 9 | 224 |
| 500 | NLLSModel | 1099.3846153846155 | 1 | 16 | 15666.0 | 1 | 64 |
| 500 | Standalone (Sparse) | 958.3636363636364 | 1 | 16 | 19250.0 | 24 | 87152 |
| 1000 | JuMP | 95541.0 | 5 | 80 | 242709.0 | 9 | 224 |
| 1000 | NLLSModel | 1175.0 | 1 | 16 | 30625.0 | 1 | 64 |
| 1000 | Standalone (Sparse) | 1833.3333333333333 | 1 | 16 | 44417.0 | 24 | 173712 |
| 2500 | JuMP | 259041.0 | 5 | 80 | 720167.0 | 9 | 224 |
| 2500 | NLLSModel | 1697.9166666666667 | 1 | 16 | 36542.0 | 1 | 64 |
| 2500 | Standalone (Sparse) | 5385.5 | 1 | 16 | 93250.0 | 25 | 466032 |
| 5000 | JuMP | 1.158041e6 | 5 | 80 | 2.62825e6 | 9 | 224 |
| 5000 | NLLSModel | 2505.125 | 1 | 16 | 58750.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 11291.0 | 1 | 16 | 206625.0 | 25 | 890480 |
| 10000 | JuMP | 2.95475e6 | 5 | 80 | 7.834e6 | 9 | 224 |
| 10000 | NLLSModel | 4150.0 | 1 | 16 | 127916.0 | 1 | 64 |
| 10000 | Standalone (Sparse) | 22250.0 | 1 | 16 | 392667.0 | 25 | 1731184 |
| 20000 | JuMP | 9.999417e6 | 5 | 80 | 2.2183209e7 | 9 | 224 |
| 20000 | NLLSModel | 7292.0 | 1 | 16 | 235167.0 | 1 | 64 |
| 20000 | Standalone (Sparse) | 41250.0 | 1 | 16 | 806042.0 | 25 | 3428976 |
| 35000 | JuMP | 1.8071208e7 | 5 | 80 | 4.1101709e7 | 9 | 224 |
| 35000 | NLLSModel | 12000.0 | 1 | 16 | 458750.0 | 1 | 64 |
| 35000 | Standalone (Sparse) | 71958.0 | 1 | 16 | 1.346417e6 | 25 | 5964400 |
| 50000 | JuMP | 3.0239084e7 | 5 | 80 | 7.5317541e7 | 9 | 224 |
| 50000 | NLLSModel | 16917.0 | 1 | 16 | 555750.0 | 1 | 64 |
| 50000 | Standalone (Sparse) | 102292.0 | 1 | 16 | 2.058042e6 | 25 | 8487536 |
| 75000 | JuMP | 4.1249833e7 | 5 | 80 | 9.9199e7 | 9 | 224 |
| 75000 | NLLSModel | 24667.0 | 1 | 16 | 1.099333e6 | 1 | 64 |
| 75000 | Standalone (Sparse) | 152000.0 | 1 | 16 | 2.896709e6 | 25 | 12649072 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 100 | CaNNOLeS | 137875.5 | 218 | 177312 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 100 | Ipopt | 1.566667e6 | 555 | 121952 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 100 | JSOSolvers (tron) | 998041.0 | 421 | 47136 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 100 | JSOSolvers (trunk) | 461834.0 | 426 | 45344 | 7 | 9.2500e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 100 | LeastSquaresOptim (Dogleg) | 131333.0 | 75 | 22064 | 5 | 5.0660e-28 | true | ok | NaN | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 125541.5 | 137 | 19856 | 17 | 1.6425e-15 | true | ok | NaN | NaN | converged |
| 100 | MadNLP | 690208.0 | 673 | 110480 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 2.98343745e7 | 809 | 460784 | 120 | 2.5247e-25 | true | ok | NaN | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 187291.5 | 905 | 223792 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 100 | Optim (Newton) | 215771.0 | 553 | 372912 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 100 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 100 | SecondOrderOptimization | 67625.0 | 224 | 120304 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 250 | CaNNOLeS | 345229.0 | 232 | 403744 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 250 | Ipopt | 2.8543335e6 | 566 | 231552 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 250 | JSOSolvers (tron) | 2.306083e6 | 428 | 85216 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 250 | JSOSolvers (trunk) | 912291.0 | 432 | 72816 | 7 | 1.0154e-16 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 250 | LeastSquaresOptim (Dogleg) | 293979.5 | 78 | 40992 | 5 | 5.7069e-28 | true | ok | NaN | NaN | converged |
| 250 | LeastSquaresOptim (LM) | 293770.5 | 146 | 38128 | 18 | 8.3212e-16 | true | ok | NaN | NaN | converged |
| 250 | MadNLP | 3.3648791e7 | 11811 | 375984 | 51 | 2.0488e-12 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 250 | NonlinearSolve (LM) | 1.74689021e8 | 816 | 2028880 | 120 | 4.4480e-25 | true | ok | NaN | NaN | StalledSuccess |
| 250 | NonlinearSolve (TrustRegion) | 363104.0 | 930 | 501376 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 250 | Optim (Newton) | 388666.5 | 576 | 853216 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 250 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 250 | SecondOrderOptimization | 192771.0 | 233 | 275312 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 500 | CaNNOLeS | 666833.0 | 246 | 795392 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 500 | Ipopt | 4.9165415e6 | 597 | 458992 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 500 | JSOSolvers (tron) | 4.342667e6 | 445 | 151824 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 500 | JSOSolvers (trunk) | 1.676959e6 | 445 | 120480 | 7 | 9.5090e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 500 | LeastSquaresOptim (Dogleg) | 569604.0 | 88 | 74400 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 500 | LeastSquaresOptim (LM) | 580000.5 | 155 | 69856 | 18 | 7.3225e-16 | true | ok | NaN | NaN | converged |
| 500 | MadNLP | 1.880792e6 | 710 | 341264 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 500 | NonlinearSolve (LM) | 6.090512915e8 | 21258 | 133290224 | 120 | 6.9305e-25 | true | ok | NaN | NaN | StalledSuccess |
| 500 | NonlinearSolve (TrustRegion) | 578041.5 | 989 | 976896 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 500 | Optim (Newton) | 651583.5 | 602 | 1691584 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 500 | SecondOrderOptimization | 284479.5 | 278 | 554032 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 1000 | CaNNOLeS | 1.353854e6 | 250 | 1610560 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 1000 | Ipopt | 9.8009375e6 | 601 | 931920 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 1000 | JSOSolvers (tron) | 8.889208e6 | 446 | 283488 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 1000 | JSOSolvers (trunk) | 3.427125e6 | 447 | 214720 | 7 | 8.5552e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 1000 | LeastSquaresOptim (Dogleg) | 1.176146e6 | 88 | 140256 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 1000 | LeastSquaresOptim (LM) | 1.1610205e6 | 149 | 132064 | 17 | 5.7105e-15 | true | ok | NaN | NaN | converged |
| 1000 | MadNLP | 3.399875e6 | 722 | 633136 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1000 | NonlinearSolve (LM) | 2.225702917e9 | 20485 | 253317504 | 119 | 1.0950e-24 | true | ok | NaN | NaN | StalledSuccess |
| 1000 | NonlinearSolve (TrustRegion) | 1.042875e6 | 1000 | 1795808 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 1000 | Optim (Newton) | 1.1301035e6 | 622 | 3366336 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 1000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000 | SecondOrderOptimization | 517937.5 | 283 | 1081616 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 2500 | CaNNOLeS | 4.038854e6 | 252 | 4207456 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 2500 | Ipopt | 2.3927583e7 | 605 | 2351056 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 2500 | JSOSolvers (tron) | 2.1407167e7 | 448 | 735600 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 2500 | JSOSolvers (trunk) | 9.393583e6 | 447 | 546496 | 7 | 7.4927e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 2500 | LeastSquaresOptim (Dogleg) | 3.1257705e6 | 88 | 362480 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 2500 | LeastSquaresOptim (LM) | 3.0777915e6 | 149 | 344496 | 17 | 5.1568e-15 | true | ok | NaN | NaN | converged |
| 2500 | MadNLP | 1.47356916e8 | 5281 | 1665584 | 25 | 1.0882e-12 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 2500 | NonlinearSolve (LM) | 1.4419615334e10 | 873 | 163359056 | 119 | 2.5764e-24 | true | ok | NaN | NaN | StalledSuccess |
| 2500 | NonlinearSolve (TrustRegion) | 4.526833e6 | 7141 | 6604256 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 2500 | Optim (Newton) | 2.602958e6 | 628 | 8909056 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 2500 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 2500 | SecondOrderOptimization | 1.0789165e6 | 418 | 3037696 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 5000 | CaNNOLeS | 1.0112e7 | 254 | 8205184 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 5000 | Ipopt | 5.516225e7 | 609 | 4716592 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 5000 | JSOSolvers (tron) | 6.5150875e7 | 448 | 1483632 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 5000 | JSOSolvers (trunk) | 2.58995e7 | 447 | 1058496 | 7 | 6.9280e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 5000 | LeastSquaresOptim (Dogleg) | 5.91175e6 | 88 | 749024 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 5.957854e6 | 148 | 705120 | 17 | 3.7472e-15 | true | ok | NaN | NaN | converged |
| 5000 | MadNLP | 2.27490625e7 | 722 | 3222320 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | 3.0373545209e10 | 12128 | 718703216 | 68 | 7.1108e-24 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 5000 | NonlinearSolve (TrustRegion) | 8.780771e6 | 13272 | 13565760 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 5000 | Optim (Newton) | 5.247833e6 | 628 | 18005248 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 5000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 5000 | SecondOrderOptimization | 2.2001455e6 | 418 | 6220592 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 10000 | CaNNOLeS | 2.89005205e7 | 256 | 15856544 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 10000 | Ipopt | 1.91774225e9 | 625 | 8799856 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 10000 | JSOSolvers (tron) | 4.71719792e8 | 450 | 2652112 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 10000 | JSOSolvers (trunk) | 9.7584042e7 | 447 | 1910464 | 7 | 6.5636e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 10000 | LeastSquaresOptim (Dogleg) | 1.1927625e7 | 88 | 1325904 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 10000 | LeastSquaresOptim (LM) | 1.2618938e7 | 148 | 1257488 | 17 | 1.2073e-15 | true | ok | NaN | NaN | converged |
| 10000 | MadNLP | 6.2410125e7 | 722 | 5993312 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 10000 | NonlinearSolve (TrustRegion) | 1.87353335e7 | 25274 | 25365904 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 10000 | Optim (Newton) | 1.07066255e7 | 628 | 33502464 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 10000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000 | SecondOrderOptimization | 4.413708e6 | 418 | 11423200 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 20000 | CaNNOLeS | 7.1708729e7 | 258 | 31552448 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 20000 | Ipopt | 1.793889291e9 | 629 | 17588912 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 20000 | JSOSolvers (tron) | 1.034560166e9 | 450 | 5283792 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 20000 | JSOSolvers (trunk) | 2.74664917e8 | 447 | 3794624 | 7 | 6.3519e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 20000 | LeastSquaresOptim (Dogleg) | 2.612825e7 | 93 | 2642784 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 20000 | LeastSquaresOptim (LM) | 2.47245415e7 | 158 | 2504416 | 16 | 3.3775e-15 | true | ok | NaN | NaN | converged |
| 20000 | MadNLP | 1.5980775e8 | 731 | 11706032 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 20000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 20000 | NonlinearSolve (TrustRegion) | 3.84159585e7 | 49537 | 50485904 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 20000 | Optim (Newton) | 2.40791465e7 | 628 | 66790656 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 20000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 20000 | SecondOrderOptimization | 1.2300833e7 | 419 | 22811312 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 35000 | CaNNOLeS | 1.35915771e8 | 260 | 55456736 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 35000 | Ipopt | 2.19648475e9 | 633 | 31828720 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 35000 | JSOSolvers (tron) | 2.155007375e9 | 450 | 9392080 | 6 | 5.1615e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 35000 | JSOSolvers (trunk) | 6.68044625e8 | 447 | 6710976 | 7 | 6.2538e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 35000 | LeastSquaresOptim (Dogleg) | 5.08824375e7 | 93 | 4703584 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 35000 | LeastSquaresOptim (LM) | 4.5136458e7 | 158 | 4462304 | 16 | 1.1779e-15 | true | ok | NaN | NaN | converged |
| 35000 | MadNLP | 1.6536519583e10 | 9472 | 20751744 | 48 | 1.6663e-12 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 35000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 35000 | NonlinearSolve (TrustRegion) | 8.0238083e7 | 85589 | 85090624 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 35000 | Optim (Newton) | 3.904525e7 | 692 | 117115136 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 35000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 35000 | SecondOrderOptimization | 1.5225042e7 | 419 | 41245872 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 50000 | CaNNOLeS | 2.10144375e8 | 260 | 79492064 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 50000 | Ipopt | 2.186295833e9 | 633 | 43965168 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 50000 | JSOSolvers (tron) | 1.482093583e9 | 285 | 13070560 | 5 | 5.3154e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 50000 | JSOSolvers (trunk) | 1.123655208e9 | 458 | 9349328 | 8 | 5.2000e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 50000 | LeastSquaresOptim (Dogleg) | 6.99571875e7 | 93 | 6548832 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 50000 | LeastSquaresOptim (LM) | 6.6874542e7 | 158 | 6215392 | 16 | 9.2695e-16 | true | ok | NaN | NaN | converged |
| 50000 | MadNLP | 4.64393792e8 | 731 | 28983472 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 50000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 50000 | NonlinearSolve (TrustRegion) | 1.15842917e8 | 121800 | 120606960 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 50000 | Optim (Newton) | 5.90789375e7 | 652 | 165234304 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 50000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 50000 | SecondOrderOptimization | 3.0518334e7 | 419 | 57304240 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 75000 | CaNNOLeS | 3.6673125e8 | 262 | 124662784 | 4 | 3.3466e-17 | true | ok | NaN | NaN | first\_order |
| 75000 | Ipopt | 2.550334041e9 | 637 | 65563440 | 5 | 1.8489e-29 | true | ok | NaN | NaN | first\_order |
| 75000 | JSOSolvers (tron) | 2.315677292e9 | 291 | 19493376 | 6 | 2.4189e-18 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 75000 | JSOSolvers (trunk) | 1.854515833e9 | 196 | 13950992 | 9 | 6.8484e-20 | true | ok | NaN | NaN | first\_order |
| 75000 | LeastSquaresOptim (Dogleg) | 1.12534271e8 | 92 | 9758176 | 5 | 5.7562e-28 | true | ok | NaN | NaN | converged |
| 75000 | LeastSquaresOptim (LM) | 1.10536375e8 | 165 | 9273312 | 17 | 1.1132e-15 | true | ok | NaN | NaN | converged |
| 75000 | MadNLP | 6.920755e8 | 731 | 43117744 | 5 | 3.4126e-26 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 75000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 5000 |
| 75000 | NonlinearSolve (TrustRegion) | 1.75729333e8 | 182082 | 185038720 | 13 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 75000 | Optim (Newton) | 8.4650958e7 | 648 | 246416960 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 75000 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 75000 | SecondOrderOptimization | 6.76825e7 | 431 | 85848432 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
