# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:09:55
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
| 50 | JuMP | 25084.0 | 5 | 80 | 57500.0 | 9 | 224 |
| 50 | NLLSModel (Sparse) | 1011.9047619047619 | 1 | 16 | 5541.75 | 1 | 64 |
| 50 | Standalone (Sparse) | 899.6363636363636 | 1 | 16 | 17500.0 | 22 | 118000 |
| 100 | JuMP | 50125.0 | 5 | 80 | 116666.0 | 9 | 224 |
| 100 | NLLSModel (Sparse) | 1173.611111111111 | 1 | 16 | 8083.0 | 1 | 64 |
| 100 | Standalone (Sparse) | 1757.6363636363637 | 1 | 16 | 34083.0 | 24 | 268704 |
| 200 | JuMP | 100667.0 | 5 | 80 | 237834.0 | 9 | 224 |
| 200 | NLLSModel (Sparse) | 1366.0714285714287 | 1 | 16 | 13791.0 | 1 | 64 |
| 200 | Standalone (Sparse) | 4058.4 | 1 | 16 | 67041.0 | 24 | 504000 |
| 400 | JuMP | 204000.0 | 5 | 80 | 508292.0 | 9 | 224 |
| 400 | NLLSModel (Sparse) | 2045.9 | 1 | 16 | 37458.0 | 1 | 64 |
| 400 | Standalone (Sparse) | 8027.666666666667 | 1 | 16 | 129916.0 | 24 | 1007408 |
| 800 | JuMP | 559167.0 | 5 | 80 | 1.4645e6 | 9 | 224 |
| 800 | NLLSModel (Sparse) | 3136.8571428571427 | 1 | 16 | 50875.0 | 1 | 64 |
| 800 | Standalone (Sparse) | 17583.0 | 1 | 16 | 260625.0 | 25 | 2014320 |
| 1200 | JuMP | 921750.0 | 5 | 80 | 2.480541e6 | 9 | 224 |
| 1200 | NLLSModel (Sparse) | 4608.2 | 1 | 16 | 75709.0 | 1 | 64 |
| 1200 | Standalone (Sparse) | 22958.0 | 1 | 16 | 414750.0 | 25 | 3019376 |
| 2000 | JuMP | 2.487125e6 | 5 | 80 | 6.397333e6 | 9 | 224 |
| 2000 | NLLSModel (Sparse) | 6875.0 | 1 | 16 | 146375.0 | 1 | 64 |
| 2000 | Standalone (Sparse) | 40917.0 | 1 | 16 | 734209.0 | 25 | 5331568 |
| 3500 | JuMP | 5.712958e6 | 5 | 80 | 1.6266e7 | 9 | 224 |
| 3500 | NLLSModel (Sparse) | 11292.0 | 1 | 16 | 228667.0 | 1 | 64 |
| 3500 | Standalone (Sparse) | 68583.0 | 1 | 16 | 1.175125e6 | 25 | 8794736 |
| 5000 | JuMP | 9.987667e6 | 5 | 80 | 2.5235917e7 | 9 | 224 |
| 5000 | NLLSModel (Sparse) | 15916.0 | 1 | 16 | 302416.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 101584.0 | 1 | 16 | 1.616709e6 | 25 | 12583536 |
| 7500 | JuMP | 1.7685125e7 | 5 | 80 | 4.2828958e7 | 9 | 224 |
| 7500 | NLLSModel (Sparse) | 23292.0 | 1 | 16 | 434875.0 | 1 | 64 |
| 7500 | Standalone (Sparse) | 159292.0 | 1 | 16 | 2.601e6 | 25 | 18866800 |
| 10000 | JuMP | 2.2537625e7 | 5 | 80 | 5.8662917e7 | 9 | 224 |
| 10000 | NLLSModel (Sparse) | 31666.0 | 1 | 16 | 919584.0 | 1 | 64 |
| 10000 | Standalone (Sparse) | 201958.0 | 1 | 16 | 3.682875e6 | 25 | 25133680 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 50 | CaNNOLeS | 318875.0 | 220 | 185760 | 5 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | Ipopt | 1.3387085e6 | 439 | 100432 | 3 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | JSOSolvers (tron) | 3.107021e6 | 642 | 62224 | 19 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | JSOSolvers (trunk) | 2.786396e6 | 518 | 45952 | 22 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | LeastSquaresOptim (Dogleg) | 428167.0 | 70 | 29696 | 4 | 1.0114e-01 | true | ok | NaN | NaN | converged |
| 50 | LeastSquaresOptim (LM) | 784562.5 | 102 | 37664 | 8 | 1.0114e-01 | true | ok | NaN | NaN | converged |
| 50 | MadNLP | 838146.0 | 618 | 126304 | 4 | 1.0114e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 50 | NonlinearSolve (LM) | 4.1131e7 | 807 | 661328 | 124 | 1.0114e-01 | true | ok | NaN | NaN | StalledSuccess |
| 50 | NonlinearSolve (TrustRegion) | 861333.0 | 1058 | 1218800 | 37 | 1.0114e-01 | true | ok | NaN | NaN | StalledSuccess |
| 50 | Optim (Newton) | 465375.0 | 570 | 1528512 | 5 | 1.0114e-01 | true | ok | NaN | NaN | converged |
| 50 | SecondOrderOptimization | 100083.0 | 224 | 189920 | 4 | 1.0114e-01 | true | ok | NaN | NaN | rel\_dcost |
| 100 | CaNNOLeS | 620459.0 | 244 | 378656 | 5 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | Ipopt | 2.513521e6 | 521 | 203584 | 4 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | JSOSolvers (tron) | 8.0675415e6 | 824 | 106320 | 25 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | JSOSolvers (trunk) | 7.5694165e6 | 712 | 79696 | 34 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | LeastSquaresOptim (Dogleg) | 933645.5 | 86 | 52944 | 4 | 1.0634e-01 | true | ok | NaN | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 1.6155205e6 | 117 | 59632 | 8 | 1.0634e-01 | true | ok | NaN | NaN | converged |
| 100 | MadNLP | 1.1695e6 | 653 | 204944 | 4 | 1.0634e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 1.59894375e8 | 858 | 2053440 | 124 | 1.0634e-01 | true | ok | NaN | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 2.2844995e6 | 1221 | 3492272 | 48 | 1.0634e-01 | true | ok | NaN | NaN | StalledSuccess |
| 100 | Optim (Newton) | 809166.5 | 602 | 3324128 | 5 | 1.0634e-01 | true | ok | NaN | NaN | converged |
| 100 | SecondOrderOptimization | 286958.0 | 374 | 428496 | 4 | 1.0634e-01 | true | ok | NaN | NaN | rel\_dcost |
| 200 | CaNNOLeS | 1.304167e6 | 250 | 752512 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | Ipopt | 4.5619165e6 | 523 | 353856 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | JSOSolvers (tron) | 1.69044585e7 | 868 | 176304 | 26 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | JSOSolvers (trunk) | 1.7238563e7 | 793 | 130048 | 40 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | LeastSquaresOptim (Dogleg) | 2.1409795e6 | 86 | 87952 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 200 | LeastSquaresOptim (LM) | 3.9198335e6 | 124 | 92848 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 200 | MadNLP | 2.545979e6 | 677 | 362160 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 200 | NonlinearSolve (LM) | 6.279308125e8 | 21370 | 123825328 | 124 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 200 | NonlinearSolve (TrustRegion) | 3.5241455e6 | 1191 | 5624112 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 200 | Optim (Newton) | 1.4638125e6 | 902 | 6439008 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 200 | SecondOrderOptimization | 453999.5 | 389 | 875808 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 400 | CaNNOLeS | 2.7092705e6 | 252 | 1541024 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | Ipopt | 8.716083e6 | 527 | 695328 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | JSOSolvers (tron) | 3.6713958e7 | 931 | 315120 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | JSOSolvers (trunk) | 3.3998125e7 | 791 | 223136 | 37 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | LeastSquaresOptim (Dogleg) | 4.948125e6 | 86 | 157840 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 400 | LeastSquaresOptim (LM) | 9.1056045e6 | 126 | 161552 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 400 | MadNLP | 4.427229e6 | 677 | 674544 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 400 | NonlinearSolve (LM) | 6.037553084e9 | 54886 | 661945296 | 323 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 400 | NonlinearSolve (TrustRegion) | 1.4592875e7 | 4008 | 12213760 | 49 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 400 | Optim (Newton) | 2.796312e6 | 622 | 12769664 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 400 | SecondOrderOptimization | 825979.0 | 413 | 1725408 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 800 | CaNNOLeS | 6.365625e6 | 254 | 3208128 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | Ipopt | 1.8436354e7 | 531 | 1488800 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | JSOSolvers (tron) | 8.80633545e7 | 957 | 588000 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | JSOSolvers (trunk) | 9.0079708e7 | 869 | 413248 | 44 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | LeastSquaresOptim (Dogleg) | 9.79725e6 | 86 | 297744 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 800 | LeastSquaresOptim (LM) | 1.9437896e7 | 126 | 292016 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 800 | MadNLP | 1.26806455e7 | 677 | 1348752 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 800 | NonlinearSolve (LM) | 3.0048352833e10 | 869 | 106151536 | 376 | 1.0651e-01 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 800 | NonlinearSolve (TrustRegion) | 2.6188292e7 | 6812 | 26426976 | 42 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 800 | Optim (Newton) | 5.526146e6 | 628 | 24948992 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 800 | SecondOrderOptimization | 1.595208e6 | 416 | 3431472 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 1200 | CaNNOLeS | 1.28890625e7 | 256 | 4584416 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | Ipopt | 3.20856875e7 | 535 | 2245600 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | JSOSolvers (tron) | 1.62667083e8 | 986 | 869456 | 28 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | JSOSolvers (trunk) | 1.49986709e8 | 843 | 596320 | 42 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | LeastSquaresOptim (Dogleg) | 1.5405479e7 | 86 | 445840 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 1200 | LeastSquaresOptim (LM) | 2.9398083e7 | 126 | 428624 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 1200 | MadNLP | 2.052575e7 | 677 | 2019888 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1200 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 1200 | NonlinearSolve (TrustRegion) | 3.5828125e7 | 9537 | 36441760 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 1200 | Optim (Newton) | 8.500125e6 | 628 | 37102848 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 1200 | SecondOrderOptimization | 2.3818125e6 | 420 | 5081296 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 2000 | CaNNOLeS | 2.7030042e7 | 256 | 7369696 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | Ipopt | 6.395825e7 | 537 | 3791584 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | JSOSolvers (tron) | 4.60061084e8 | 926 | 1392912 | 26 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | JSOSolvers (trunk) | 4.50052125e8 | 802 | 971184 | 38 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | LeastSquaresOptim (Dogleg) | 2.51739165e7 | 85 | 708368 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 2000 | LeastSquaresOptim (LM) | 4.6114541e7 | 126 | 677264 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 2000 | MadNLP | 4.4815917e7 | 677 | 3358064 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 2000 | NonlinearSolve (TrustRegion) | 6.2665834e7 | 15062 | 60565808 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 2000 | Optim (Newton) | 1.432425e7 | 656 | 61413056 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 2000 | SecondOrderOptimization | 3.9893955e6 | 420 | 8411520 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 3500 | CaNNOLeS | 5.94819585e7 | 258 | 12628992 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | Ipopt | 1.679379666e9 | 545 | 6081376 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | JSOSolvers (tron) | 1.454242e9 | 961 | 2514848 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | JSOSolvers (trunk) | 1.121138458e9 | 807 | 1708704 | 38 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | LeastSquaresOptim (Dogleg) | 5.0851875e7 | 85 | 1300368 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 3500 | LeastSquaresOptim (LM) | 7.7413041e7 | 124 | 1219216 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 3500 | MadNLP | 9.6165291e7 | 677 | 5714064 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3500 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 3500 | NonlinearSolve (TrustRegion) | 1.477867705e8 | 25395 | 106609488 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 3500 | Optim (Newton) | 3.0932625e7 | 644 | 107914752 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 3500 | SecondOrderOptimization | 1.48425e7 | 424 | 14675728 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 5000 | CaNNOLeS | 9.06801455e7 | 260 | 19788832 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | Ipopt | 1.75045775e9 | 555 | 9256320 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | JSOSolvers (tron) | 2.297256125e9 | 964 | 3452976 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | JSOSolvers (trunk) | 2.021902e9 | 859 | 2366560 | 44 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | LeastSquaresOptim (Dogleg) | 7.5440167e7 | 85 | 1778192 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 1.13855125e8 | 124 | 1667632 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 5000 | MadNLP | 1.59033e8 | 677 | 7899184 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 5000 | NonlinearSolve (TrustRegion) | 2.15106042e8 | 35725 | 150872480 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 5000 | Optim (Newton) | 4.0867688e7 | 656 | 152749760 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 5000 | SecondOrderOptimization | 2.2333146e7 | 424 | 20845504 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 7500 | CaNNOLeS | 1.37778958e8 | 260 | 26735648 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | Ipopt | 1.625067791e9 | 555 | 12846464 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | JSOSolvers (tron) | 4.184319208e9 | 959 | 4804416 | 28 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | JSOSolvers (trunk) | 4.077587125e9 | 896 | 3302224 | 48 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | LeastSquaresOptim (Dogleg) | 1.11213416e8 | 89 | 2470608 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 7500 | LeastSquaresOptim (LM) | 1.705516045e8 | 133 | 2316256 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 7500 | MadNLP | 2.6137275e8 | 686 | 11529696 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 7500 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 7500 | NonlinearSolve (TrustRegion) | 3.1869175e8 | 52916 | 224945184 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 7500 | Optim (Newton) | 6.4613854e7 | 664 | 233211712 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 7500 | SecondOrderOptimization | 2.78993125e7 | 424 | 30985488 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 10000 | CaNNOLeS | 1.83947542e8 | 262 | 36697152 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | Ipopt | 1.704318792e9 | 559 | 17930688 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | JSOSolvers (tron) | 6.608917792e9 | 1065 | 6456096 | 32 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | JSOSolvers (trunk) | 5.483409583e9 | 854 | 4414320 | 44 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | LeastSquaresOptim (Dogleg) | 1.611043335e8 | 89 | 3326672 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 10000 | LeastSquaresOptim (LM) | 2.497560835e8 | 133 | 3111904 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 10000 | MadNLP | 3.59259209e8 | 686 | 15258080 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 10000 | NonlinearSolve (TrustRegion) | 4.3769875e8 | 70106 | 299401296 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 10000 | Optim (Newton) | 8.48190625e7 | 648 | 314263104 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 10000 | SecondOrderOptimization | 2.9773271e7 | 424 | 41623152 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
