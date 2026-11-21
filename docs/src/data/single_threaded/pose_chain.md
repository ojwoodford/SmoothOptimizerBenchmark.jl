# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T04:30:58
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
| 50 | JuMP | 25500.0 | 5 | 80 | 59083.0 | 9 | 224 |
| 50 | NLLSModel (Sparse) | 1003.952380952381 | 1 | 16 | 6062.5 | 1 | 64 |
| 50 | Standalone (Sparse) | 884.0869565217391 | 1 | 16 | 17417.0 | 22 | 118000 |
| 100 | JuMP | 51833.0 | 5 | 80 | 120125.0 | 9 | 224 |
| 100 | NLLSModel (Sparse) | 1995.9 | 1 | 16 | 11834.0 | 1 | 64 |
| 100 | Standalone (Sparse) | 1825.7272727272727 | 1 | 16 | 33458.0 | 24 | 268704 |
| 200 | JuMP | 102417.0 | 5 | 80 | 253250.0 | 9 | 224 |
| 200 | NLLSModel (Sparse) | 4233.2 | 1 | 16 | 23375.0 | 1 | 64 |
| 200 | Standalone (Sparse) | 3791.6666666666665 | 1 | 16 | 74875.0 | 24 | 504000 |
| 400 | JuMP | 221084.0 | 5 | 80 | 488334.0 | 9 | 224 |
| 400 | NLLSModel (Sparse) | 8680.333333333334 | 1 | 16 | 49125.0 | 1 | 64 |
| 400 | Standalone (Sparse) | 7708.333333333333 | 1 | 16 | 145000.0 | 24 | 1007408 |
| 800 | JuMP | 468916.0 | 5 | 80 | 1.84425e6 | 9 | 224 |
| 800 | NLLSModel (Sparse) | 17125.0 | 1 | 16 | 93542.0 | 1 | 64 |
| 800 | Standalone (Sparse) | 16167.0 | 1 | 16 | 277000.0 | 25 | 2014320 |
| 1200 | JuMP | 1.090125e6 | 5 | 80 | 2.871666e6 | 9 | 224 |
| 1200 | NLLSModel (Sparse) | 25625.0 | 1 | 16 | 139708.0 | 1 | 64 |
| 1200 | Standalone (Sparse) | 23292.0 | 1 | 16 | 438125.0 | 25 | 3019376 |
| 2000 | JuMP | 2.340167e6 | 5 | 80 | 6.3395e6 | 9 | 224 |
| 2000 | NLLSModel (Sparse) | 45750.0 | 1 | 16 | 232500.0 | 1 | 64 |
| 2000 | Standalone (Sparse) | 43333.0 | 1 | 16 | 687125.0 | 25 | 5331568 |
| 3500 | JuMP | 6.462292e6 | 5 | 80 | 1.6737791e7 | 9 | 224 |
| 3500 | NLLSModel (Sparse) | 78625.0 | 1 | 16 | 417292.0 | 1 | 64 |
| 3500 | Standalone (Sparse) | 70042.0 | 1 | 16 | 1.222667e6 | 25 | 8794736 |
| 5000 | JuMP | 9.782375e6 | 5 | 80 | 2.72755e7 | 9 | 224 |
| 5000 | NLLSModel (Sparse) | 111917.0 | 1 | 16 | 593708.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 101541.0 | 1 | 16 | 1.691125e6 | 25 | 12583536 |
| 7500 | JuMP | 1.703025e7 | 5 | 80 | 4.2480917e7 | 9 | 224 |
| 7500 | NLLSModel (Sparse) | 166042.0 | 1 | 16 | 894750.0 | 1 | 64 |
| 7500 | Standalone (Sparse) | 157792.0 | 1 | 16 | 2.549917e6 | 25 | 18866800 |
| 10000 | JuMP | 2.2750666e7 | 5 | 80 | 5.9833459e7 | 9 | 224 |
| 10000 | NLLSModel (Sparse) | 232209.0 | 1 | 16 | 1.213834e6 | 1 | 64 |
| 10000 | Standalone (Sparse) | 214459.0 | 1 | 16 | 3.377334e6 | 25 | 25133680 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 50 | CaNNOLeS | 316500.0 | 220 | 185760 | 5 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | Ipopt | 1.2571045e6 | 431 | 100032 | 3 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | JSOSolvers (tron) | 3.0629165e6 | 642 | 62224 | 19 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | JSOSolvers (trunk) | 2.7136045e6 | 518 | 45952 | 22 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | LeastSquaresOptim (Dogleg) | 409729.5 | 70 | 29696 | 4 | 1.0114e-01 | true | ok | NaN | NaN | converged |
| 50 | LeastSquaresOptim (LM) | 775187.5 | 102 | 37664 | 8 | 1.0114e-01 | true | ok | NaN | NaN | converged |
| 50 | MadNLP | 778708.5 | 618 | 126304 | 4 | 1.0114e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 50 | NonlinearSolve (LM) | 4.0853917e7 | 807 | 661328 | 124 | 1.0114e-01 | true | ok | NaN | NaN | StalledSuccess |
| 50 | NonlinearSolve (TrustRegion) | 883979.0 | 1058 | 1218800 | 37 | 1.0114e-01 | true | ok | NaN | NaN | StalledSuccess |
| 50 | Optim (Newton) | 460146.0 | 570 | 1528512 | 5 | 1.0114e-01 | true | ok | NaN | NaN | converged |
| 50 | SecondOrderOptimization | 104083.0 | 224 | 189920 | 4 | 1.0114e-01 | true | ok | NaN | NaN | rel\_dcost |
| 100 | CaNNOLeS | 633667.0 | 244 | 378656 | 5 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | Ipopt | 2.4351255e6 | 513 | 203184 | 4 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | JSOSolvers (tron) | 7.9968545e6 | 824 | 106320 | 25 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | JSOSolvers (trunk) | 7.642729e6 | 712 | 79696 | 34 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | LeastSquaresOptim (Dogleg) | 950229.5 | 86 | 52944 | 4 | 1.0634e-01 | true | ok | NaN | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 1.649771e6 | 117 | 59632 | 8 | 1.0634e-01 | true | ok | NaN | NaN | converged |
| 100 | MadNLP | 1.199417e6 | 653 | 204944 | 4 | 1.0634e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 1.58150333e8 | 858 | 2053440 | 124 | 1.0634e-01 | true | ok | NaN | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 2.294458e6 | 1221 | 3492272 | 48 | 1.0634e-01 | true | ok | NaN | NaN | StalledSuccess |
| 100 | Optim (Newton) | 822916.5 | 602 | 3324128 | 5 | 1.0634e-01 | true | ok | NaN | NaN | converged |
| 100 | SecondOrderOptimization | 214396.0 | 252 | 382544 | 4 | 1.0634e-01 | true | ok | NaN | NaN | rel\_dcost |
| 200 | CaNNOLeS | 1.2678335e6 | 250 | 752512 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | Ipopt | 4.313542e6 | 515 | 353456 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | JSOSolvers (tron) | 1.68227085e7 | 868 | 176304 | 26 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | JSOSolvers (trunk) | 1.7087125e7 | 793 | 130048 | 40 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | LeastSquaresOptim (Dogleg) | 2.1386255e6 | 86 | 87952 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 200 | LeastSquaresOptim (LM) | 3.9716665e6 | 124 | 92848 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 200 | MadNLP | 2.387854e6 | 677 | 362160 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 200 | NonlinearSolve (LM) | 6.23052042e8 | 21458 | 123826736 | 124 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 200 | NonlinearSolve (TrustRegion) | 3.4564585e6 | 1191 | 5624112 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 200 | Optim (Newton) | 1.4326875e6 | 622 | 6434528 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 200 | SecondOrderOptimization | 438708.0 | 261 | 752880 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 400 | CaNNOLeS | 2.591396e6 | 252 | 1541024 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | Ipopt | 8.281646e6 | 519 | 694928 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | JSOSolvers (tron) | 3.649125e7 | 931 | 315120 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | JSOSolvers (trunk) | 3.4001354e7 | 791 | 223136 | 37 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | LeastSquaresOptim (Dogleg) | 4.8682495e6 | 86 | 157840 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 400 | LeastSquaresOptim (LM) | 9.235854e6 | 126 | 161552 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 400 | MadNLP | 4.5399375e6 | 677 | 674544 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 400 | NonlinearSolve (LM) | 5.982862791e9 | 54812 | 661944112 | 323 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 400 | NonlinearSolve (TrustRegion) | 1.2679083e7 | 4008 | 12213760 | 49 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 400 | Optim (Newton) | 2.7668745e6 | 622 | 12769664 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 400 | SecondOrderOptimization | 830271.0 | 284 | 1488800 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 800 | CaNNOLeS | 6.2236455e6 | 254 | 3208128 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | Ipopt | 1.7833958e7 | 523 | 1488400 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | JSOSolvers (tron) | 7.9001875e7 | 957 | 588000 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | JSOSolvers (trunk) | 8.1609916e7 | 869 | 413248 | 44 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | LeastSquaresOptim (Dogleg) | 9.9685e6 | 86 | 297744 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 800 | LeastSquaresOptim (LM) | 1.9531604e7 | 126 | 292016 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 800 | MadNLP | 1.06745835e7 | 677 | 1348752 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 800 | NonlinearSolve (LM) | 3.0055121291e10 | 859 | 106151376 | 383 | 1.0651e-01 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 800 | NonlinearSolve (TrustRegion) | 2.4087166e7 | 6812 | 26426976 | 42 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 800 | Optim (Newton) | 5.327667e6 | 628 | 24948992 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 800 | SecondOrderOptimization | 1.630083e6 | 287 | 2967536 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 1200 | CaNNOLeS | 1.1503063e7 | 256 | 4584416 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | Ipopt | 2.9037166e7 | 527 | 2245200 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | JSOSolvers (tron) | 1.48029917e8 | 986 | 869456 | 28 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | JSOSolvers (trunk) | 1.46459208e8 | 843 | 596320 | 42 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | LeastSquaresOptim (Dogleg) | 1.53281245e7 | 86 | 445840 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 1200 | LeastSquaresOptim (LM) | 2.885325e7 | 126 | 428624 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 1200 | MadNLP | 1.8790584e7 | 677 | 2019888 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1200 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 1200 | NonlinearSolve (TrustRegion) | 3.20341665e7 | 9537 | 36441760 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 1200 | Optim (Newton) | 8.5176045e6 | 628 | 37102848 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 1200 | SecondOrderOptimization | 2.622771e6 | 291 | 4383888 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 2000 | CaNNOLeS | 2.5200333e7 | 256 | 7369696 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | Ipopt | 5.5221792e7 | 529 | 3791184 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | JSOSolvers (tron) | 4.0249225e8 | 926 | 1392912 | 26 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | JSOSolvers (trunk) | 3.86068625e8 | 802 | 971184 | 38 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | LeastSquaresOptim (Dogleg) | 2.47521875e7 | 85 | 708368 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 2000 | LeastSquaresOptim (LM) | 4.61885835e7 | 126 | 677264 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 2000 | MadNLP | 3.665875e7 | 677 | 3358064 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 2000 | NonlinearSolve (TrustRegion) | 5.3075791e7 | 15062 | 60565808 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 2000 | Optim (Newton) | 1.3636708e7 | 664 | 61413184 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 2000 | SecondOrderOptimization | 4.0755625e6 | 291 | 7320896 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 3500 | CaNNOLeS | 5.27270415e7 | 258 | 12628992 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | Ipopt | 1.040759995e8 | 537 | 6080976 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | JSOSolvers (tron) | 1.0655125e9 | 961 | 2514848 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | JSOSolvers (trunk) | 9.971902295e8 | 807 | 1708704 | 38 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | LeastSquaresOptim (Dogleg) | 4.4164625e7 | 85 | 1300368 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 3500 | LeastSquaresOptim (LM) | 6.7975667e7 | 124 | 1219216 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 3500 | MadNLP | 8.45363955e7 | 677 | 5714064 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3500 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 3500 | NonlinearSolve (TrustRegion) | 9.9527792e7 | 25397 | 106609520 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 3500 | Optim (Newton) | 2.9342104e7 | 648 | 107914816 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 3500 | SecondOrderOptimization | 7.1464375e6 | 295 | 12749520 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 5000 | CaNNOLeS | 8.1809167e7 | 260 | 18592800 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | Ipopt | 1.51957708e8 | 547 | 9255920 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | JSOSolvers (tron) | 1.643663458e9 | 964 | 3452976 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | JSOSolvers (trunk) | 1.664249875e9 | 859 | 2366560 | 44 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | LeastSquaresOptim (Dogleg) | 6.35978125e7 | 85 | 1778192 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 9.8728709e7 | 124 | 1667632 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 5000 | MadNLP | 1.39172292e8 | 677 | 7899184 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 5000 | NonlinearSolve (TrustRegion) | 1.709001465e8 | 35725 | 150872480 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 5000 | Optim (Newton) | 3.9596979e7 | 644 | 152749568 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 5000 | SecondOrderOptimization | 1.0204375e7 | 295 | 18132864 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 7500 | CaNNOLeS | 1.317545e8 | 260 | 26735648 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | Ipopt | 2.39877187e8 | 547 | 12846064 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | JSOSolvers (tron) | 3.541439333e9 | 959 | 4804416 | 28 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | JSOSolvers (trunk) | 3.6803905e9 | 896 | 3302224 | 48 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | LeastSquaresOptim (Dogleg) | 9.6101667e7 | 89 | 2470608 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 7500 | LeastSquaresOptim (LM) | 1.50927916e8 | 133 | 2316256 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 7500 | MadNLP | 2.40452083e8 | 686 | 11529696 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 7500 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 7500 | NonlinearSolve (TrustRegion) | 2.486224795e8 | 52916 | 224945184 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 7500 | Optim (Newton) | 6.12794585e7 | 648 | 227231296 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 7500 | SecondOrderOptimization | 1.53977085e7 | 295 | 26994896 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 10000 | CaNNOLeS | 1.70652188e8 | 262 | 36697152 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | Ipopt | 3.19787625e8 | 551 | 17930288 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | JSOSolvers (tron) | 5.912129e9 | 1065 | 6456096 | 32 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | JSOSolvers (trunk) | 5.087544625e9 | 854 | 4414320 | 44 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | LeastSquaresOptim (Dogleg) | 1.28105563e8 | 89 | 3326672 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 10000 | LeastSquaresOptim (LM) | 2.02975125e8 | 133 | 3111904 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 10000 | MadNLP | 3.20773625e8 | 686 | 15258080 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 10000 | NonlinearSolve (TrustRegion) | 3.21881542e8 | 70106 | 305463376 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 10000 | Optim (Newton) | 8.0401417e7 | 640 | 304809408 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 10000 | SecondOrderOptimization | 2.15535415e7 | 295 | 36305456 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
