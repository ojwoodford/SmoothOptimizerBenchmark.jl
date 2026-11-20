# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T18:00:31
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: fbb6630
- **Dependency Commits**: NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 50 | JuMP | 24875.0 | 5 | 80 | 57958.0 | 9 | 224 |
| 50 | NLLSModel (Sparse) | 991.2105263157895 | 1 | 16 | 5656.25 | 1 | 64 |
| 50 | Standalone (Sparse) | 911.0 | 1 | 16 | 19166.0 | 22 | 118000 |
| 100 | JuMP | 51209.0 | 5 | 80 | 119917.0 | 9 | 224 |
| 100 | NLLSModel (Sparse) | 2033.3 | 1 | 16 | 11542.0 | 1 | 64 |
| 100 | Standalone (Sparse) | 1814.3636363636363 | 1 | 16 | 34459.0 | 24 | 268704 |
| 200 | JuMP | 107833.0 | 5 | 80 | 248209.0 | 9 | 224 |
| 200 | NLLSModel (Sparse) | 4216.6 | 1 | 16 | 23459.0 | 1 | 64 |
| 200 | Standalone (Sparse) | 3763.8333333333335 | 1 | 16 | 67834.0 | 24 | 504000 |
| 400 | JuMP | 212666.0 | 5 | 80 | 506875.0 | 9 | 224 |
| 400 | NLLSModel (Sparse) | 8416.666666666666 | 1 | 16 | 47583.0 | 1 | 64 |
| 400 | Standalone (Sparse) | 7611.0 | 1 | 16 | 139291.0 | 24 | 1007408 |
| 800 | JuMP | 456208.0 | 5 | 80 | 1.293834e6 | 9 | 224 |
| 800 | NLLSModel (Sparse) | 16916.0 | 1 | 16 | 93416.0 | 1 | 64 |
| 800 | Standalone (Sparse) | 15709.0 | 1 | 16 | 268833.0 | 25 | 2014320 |
| 1200 | JuMP | 912584.0 | 5 | 80 | 2.472458e6 | 9 | 224 |
| 1200 | NLLSModel (Sparse) | 26000.0 | 1 | 16 | 140042.0 | 1 | 64 |
| 1200 | Standalone (Sparse) | 23292.0 | 1 | 16 | 433000.0 | 25 | 3019376 |
| 2000 | JuMP | 2.002084e6 | 5 | 80 | 5.672708e6 | 9 | 224 |
| 2000 | NLLSModel (Sparse) | 43500.0 | 1 | 16 | 232708.0 | 1 | 64 |
| 2000 | Standalone (Sparse) | 39083.0 | 1 | 16 | 686084.0 | 25 | 5331568 |
| 3500 | JuMP | 5.279791e6 | 5 | 80 | 1.3907292e7 | 9 | 224 |
| 3500 | NLLSModel (Sparse) | 76416.0 | 1 | 16 | 408417.0 | 1 | 64 |
| 3500 | Standalone (Sparse) | 70250.0 | 1 | 16 | 1.280459e6 | 25 | 8794736 |
| 5000 | JuMP | 9.504417e6 | 5 | 80 | 2.4330542e7 | 9 | 224 |
| 5000 | NLLSModel (Sparse) | 111209.0 | 1 | 16 | 587292.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 102750.0 | 1 | 16 | 1.650042e6 | 25 | 12583536 |
| 7500 | JuMP | 1.5052417e7 | 5 | 80 | 3.9503417e7 | 9 | 224 |
| 7500 | NLLSModel (Sparse) | 166333.0 | 1 | 16 | 880667.0 | 1 | 64 |
| 7500 | Standalone (Sparse) | 151958.0 | 1 | 16 | 2.464458e6 | 25 | 18866800 |
| 10000 | JuMP | 2.0937334e7 | 5 | 80 | 5.5307417e7 | 9 | 224 |
| 10000 | NLLSModel (Sparse) | 226750.0 | 1 | 16 | 1.291542e6 | 1 | 64 |
| 10000 | Standalone (Sparse) | 207750.0 | 1 | 16 | 3.273209e6 | 25 | 25133680 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 50 | CaNNOLeS | 321813.0 | 220 | 185760 | 5 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | Ipopt | 1.259271e6 | 439 | 100432 | 3 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | JSOSolvers (tron) | 3.029375e6 | 642 | 62224 | 19 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | JSOSolvers (trunk) | 2.6955415e6 | 518 | 45952 | 22 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | LeastSquaresOptim (Dogleg) | 409708.5 | 70 | 29696 | 4 | 1.0114e-01 | true | ok | NaN | NaN | converged |
| 50 | LeastSquaresOptim (LM) | 775854.5 | 102 | 37664 | 8 | 1.0114e-01 | true | ok | NaN | NaN | converged |
| 50 | MadNLP | 781604.0 | 618 | 126304 | 4 | 1.0114e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 50 | NonlinearSolve (LM) | 4.1108167e7 | 807 | 661328 | 124 | 1.0114e-01 | true | ok | NaN | NaN | StalledSuccess |
| 50 | NonlinearSolve (TrustRegion) | 887396.0 | 1058 | 1218800 | 37 | 1.0114e-01 | true | ok | NaN | NaN | StalledSuccess |
| 50 | Optim (Newton) | 462708.5 | 570 | 1528512 | 5 | 1.0114e-01 | true | ok | NaN | NaN | converged |
| 50 | SecondOrderOptimization | 101770.5 | 224 | 189920 | 4 | 1.0114e-01 | true | ok | NaN | NaN | rel\_dcost |
| 100 | CaNNOLeS | 631416.5 | 244 | 378656 | 5 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | Ipopt | 2.405125e6 | 521 | 203584 | 4 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | JSOSolvers (tron) | 7.919417e6 | 824 | 106320 | 25 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | JSOSolvers (trunk) | 7.5934165e6 | 712 | 79696 | 34 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | LeastSquaresOptim (Dogleg) | 952208.5 | 86 | 52944 | 4 | 1.0634e-01 | true | ok | NaN | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 1.6447295e6 | 117 | 59632 | 8 | 1.0634e-01 | true | ok | NaN | NaN | converged |
| 100 | MadNLP | 1.2010415e6 | 653 | 204944 | 4 | 1.0634e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 1.58793708e8 | 858 | 2053440 | 124 | 1.0634e-01 | true | ok | NaN | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 2.303812e6 | 1221 | 3492272 | 48 | 1.0634e-01 | true | ok | NaN | NaN | StalledSuccess |
| 100 | Optim (Newton) | 832375.0 | 602 | 3324128 | 5 | 1.0634e-01 | true | ok | NaN | NaN | converged |
| 100 | SecondOrderOptimization | 215083.5 | 252 | 382544 | 4 | 1.0634e-01 | true | ok | NaN | NaN | rel\_dcost |
| 200 | CaNNOLeS | 1.265562e6 | 250 | 752512 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | Ipopt | 4.2607085e6 | 523 | 353856 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | JSOSolvers (tron) | 1.69356875e7 | 868 | 176304 | 26 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | JSOSolvers (trunk) | 1.7251562e7 | 793 | 130048 | 40 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | LeastSquaresOptim (Dogleg) | 2.1352915e6 | 86 | 87952 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 200 | LeastSquaresOptim (LM) | 3.987125e6 | 124 | 92848 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 200 | MadNLP | 2.391083e6 | 677 | 362160 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 200 | NonlinearSolve (LM) | 6.247094795e8 | 21446 | 123826544 | 124 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 200 | NonlinearSolve (TrustRegion) | 3.451375e6 | 1455 | 5628336 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 200 | Optim (Newton) | 1.4305835e6 | 962 | 6439968 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 200 | SecondOrderOptimization | 435500.0 | 261 | 752880 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 400 | CaNNOLeS | 2.5937505e6 | 252 | 1541024 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | Ipopt | 8.3376255e6 | 527 | 695328 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | JSOSolvers (tron) | 3.66806045e7 | 931 | 315120 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | JSOSolvers (trunk) | 3.4268e7 | 791 | 223136 | 37 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | LeastSquaresOptim (Dogleg) | 4.8673125e6 | 86 | 157840 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 400 | LeastSquaresOptim (LM) | 9.2289995e6 | 126 | 161552 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 400 | MadNLP | 4.555271e6 | 677 | 674544 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 400 | NonlinearSolve (LM) | 6.031026791e9 | 54952 | 661946352 | 323 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 400 | NonlinearSolve (TrustRegion) | 1.28046875e7 | 4008 | 12213760 | 49 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 400 | Optim (Newton) | 2.756188e6 | 797 | 12772464 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 400 | SecondOrderOptimization | 828874.5 | 284 | 1488800 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 800 | CaNNOLeS | 6.1890835e6 | 254 | 3208128 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | Ipopt | 1.77156045e7 | 531 | 1488800 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | JSOSolvers (tron) | 8.0567125e7 | 957 | 588000 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | JSOSolvers (trunk) | 8.32498125e7 | 869 | 413248 | 44 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | LeastSquaresOptim (Dogleg) | 9.9724375e6 | 86 | 297744 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 800 | LeastSquaresOptim (LM) | 1.8948625e7 | 126 | 292016 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 800 | MadNLP | 1.0404042e7 | 677 | 1348752 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 800 | NonlinearSolve (LM) | 3.0036956166e10 | 859 | 106151376 | 380 | 1.0651e-01 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 800 | NonlinearSolve (TrustRegion) | 2.46937915e7 | 6812 | 26426976 | 42 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 800 | Optim (Newton) | 5.465812e6 | 628 | 24948992 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 800 | SecondOrderOptimization | 1.7226665e6 | 287 | 2967536 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 1200 | CaNNOLeS | 1.21478335e7 | 256 | 4584416 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | Ipopt | 3.1766375e7 | 535 | 2245600 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | JSOSolvers (tron) | 1.700209375e8 | 986 | 869456 | 28 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | JSOSolvers (trunk) | 1.669646455e8 | 843 | 596320 | 42 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | LeastSquaresOptim (Dogleg) | 1.53854995e7 | 86 | 445840 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 1200 | LeastSquaresOptim (LM) | 2.9926271e7 | 126 | 428624 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 1200 | MadNLP | 2.0865834e7 | 677 | 2019888 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1200 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 1200 | NonlinearSolve (TrustRegion) | 3.2932e7 | 9537 | 36441760 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 1200 | Optim (Newton) | 8.30725e6 | 628 | 37102848 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 1200 | SecondOrderOptimization | 2.510875e6 | 291 | 4383888 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 2000 | CaNNOLeS | 2.8562229e7 | 256 | 7369696 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | Ipopt | 6.0697292e7 | 537 | 3791584 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | JSOSolvers (tron) | 4.72438375e8 | 926 | 1392912 | 26 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | JSOSolvers (trunk) | 4.51222166e8 | 802 | 971184 | 38 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | LeastSquaresOptim (Dogleg) | 2.5380166e7 | 85 | 708368 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 2000 | LeastSquaresOptim (LM) | 4.70085835e7 | 126 | 677264 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 2000 | MadNLP | 4.3239375e7 | 677 | 3358064 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 2000 | NonlinearSolve (TrustRegion) | 5.5703875e7 | 15062 | 60565808 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 2000 | Optim (Newton) | 1.90740835e7 | 660 | 61413120 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 2000 | SecondOrderOptimization | 4.2233745e6 | 291 | 7320896 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 3500 | CaNNOLeS | 5.8847979e7 | 258 | 12628992 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | Ipopt | 1.10625542e8 | 545 | 6081376 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | JSOSolvers (tron) | 1.240190333e9 | 961 | 2514848 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | JSOSolvers (trunk) | 1.11186775e9 | 807 | 1708704 | 38 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | LeastSquaresOptim (Dogleg) | 4.55659165e7 | 85 | 1300368 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 3500 | LeastSquaresOptim (LM) | 6.9928458e7 | 124 | 1219216 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 3500 | MadNLP | 9.50664375e7 | 677 | 5714064 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3500 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 3500 | NonlinearSolve (TrustRegion) | 1.020086875e8 | 25383 | 106609296 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 3500 | Optim (Newton) | 2.9575e7 | 628 | 107914496 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 3500 | SecondOrderOptimization | 7.271333e6 | 295 | 12749520 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 5000 | CaNNOLeS | 8.8154125e7 | 260 | 19788832 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | Ipopt | 1.60955875e8 | 555 | 9256320 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | JSOSolvers (tron) | 2.282237084e9 | 964 | 3452976 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | JSOSolvers (trunk) | 2.204203083e9 | 859 | 2366560 | 44 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | LeastSquaresOptim (Dogleg) | 6.5160041e7 | 85 | 1778192 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 1.023736875e8 | 124 | 1667632 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 5000 | MadNLP | 1.52502709e8 | 677 | 7899184 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 5000 | NonlinearSolve (TrustRegion) | 1.44019125e8 | 35725 | 150872480 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 5000 | Optim (Newton) | 3.93030625e7 | 628 | 152749312 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 5000 | SecondOrderOptimization | 1.056775e7 | 295 | 18132864 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 7500 | CaNNOLeS | 1.37788542e8 | 260 | 28341280 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | Ipopt | 2.4581325e8 | 555 | 12846464 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | JSOSolvers (tron) | 3.995800375e9 | 959 | 4804416 | 28 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | JSOSolvers (trunk) | 4.12347325e9 | 896 | 3302224 | 48 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | LeastSquaresOptim (Dogleg) | 9.91384795e7 | 89 | 2470608 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 7500 | LeastSquaresOptim (LM) | 1.55838292e8 | 133 | 2316256 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 7500 | MadNLP | 2.46435937e8 | 686 | 11529696 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 7500 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 7500 | NonlinearSolve (TrustRegion) | 2.64431854e8 | 52914 | 224945152 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 7500 | Optim (Newton) | 6.2169958e7 | 652 | 227067520 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 7500 | SecondOrderOptimization | 1.5613917e7 | 295 | 28600528 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 10000 | CaNNOLeS | 1.729847495e8 | 262 | 36697152 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | Ipopt | 3.25773e8 | 559 | 17930688 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | JSOSolvers (tron) | 6.135544458e9 | 1065 | 6456096 | 32 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | JSOSolvers (trunk) | 5.295144416e9 | 854 | 4414320 | 44 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | LeastSquaresOptim (Dogleg) | 1.31110625e8 | 89 | 3326672 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 10000 | LeastSquaresOptim (LM) | 2.09297166e8 | 133 | 3111904 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 10000 | MadNLP | 3.47923834e8 | 686 | 15258080 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 10000 | NonlinearSolve (TrustRegion) | 3.057343755e8 | 70108 | 299401328 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 10000 | Optim (Newton) | 7.8915959e7 | 647 | 312837680 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 10000 | SecondOrderOptimization | 2.1617666e7 | 295 | 36305456 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
