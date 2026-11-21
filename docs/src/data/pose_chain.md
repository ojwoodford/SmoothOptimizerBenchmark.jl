# Benchmark Results: Nonlinear 3D Pose Chain

- **Category**: large_sparse
- **Scaling Metric**: Poses N
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:36:35
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
| 50 | JuMP | 25084.0 | 5 | 80 | 58083.0 | 9 | 224 |
| 50 | NLLSModel (Sparse) | 1062.5 | 1 | 16 | 5541.75 | 1 | 64 |
| 50 | Standalone (Sparse) | 905.8260869565217 | 1 | 16 | 17291.0 | 22 | 118000 |
| 100 | JuMP | 52000.0 | 5 | 80 | 117250.0 | 9 | 224 |
| 100 | NLLSModel (Sparse) | 1464.6923076923076 | 1 | 16 | 9875.0 | 1 | 64 |
| 100 | Standalone (Sparse) | 1806.8181818181818 | 1 | 16 | 35125.0 | 24 | 268704 |
| 200 | JuMP | 113000.0 | 5 | 80 | 247542.0 | 9 | 224 |
| 200 | NLLSModel (Sparse) | 1493.6153846153845 | 1 | 16 | 20459.0 | 1 | 64 |
| 200 | Standalone (Sparse) | 4075.0 | 1 | 16 | 64500.0 | 24 | 504000 |
| 400 | JuMP | 221500.0 | 5 | 80 | 486625.0 | 9 | 224 |
| 400 | NLLSModel (Sparse) | 1987.5 | 1 | 16 | 38375.0 | 1 | 64 |
| 400 | Standalone (Sparse) | 7847.333333333333 | 1 | 16 | 133417.0 | 24 | 1007408 |
| 800 | JuMP | 485667.0 | 5 | 80 | 1.988334e6 | 9 | 224 |
| 800 | NLLSModel (Sparse) | 3136.8571428571427 | 1 | 16 | 69041.0 | 1 | 64 |
| 800 | Standalone (Sparse) | 15167.0 | 1 | 16 | 251583.0 | 25 | 2014320 |
| 1200 | JuMP | 1.036792e6 | 5 | 80 | 2.964583e6 | 9 | 224 |
| 1200 | NLLSModel (Sparse) | 4158.4 | 1 | 16 | 99416.0 | 1 | 64 |
| 1200 | Standalone (Sparse) | 23250.0 | 1 | 16 | 408041.0 | 25 | 3019376 |
| 2000 | JuMP | 2.789375e6 | 5 | 80 | 6.286541e6 | 9 | 224 |
| 2000 | NLLSModel (Sparse) | 6597.0 | 1 | 16 | 107917.0 | 1 | 64 |
| 2000 | Standalone (Sparse) | 48834.0 | 1 | 16 | 681416.0 | 25 | 5331568 |
| 3500 | JuMP | 6.397208e6 | 5 | 80 | 1.5829417e7 | 9 | 224 |
| 3500 | NLLSModel (Sparse) | 92542.0 | 1 | 16 | 233333.0 | 1 | 64 |
| 3500 | Standalone (Sparse) | 69417.0 | 1 | 16 | 1.186416e6 | 25 | 8794736 |
| 5000 | JuMP | 1.0237292e7 | 5 | 80 | 2.6434792e7 | 9 | 224 |
| 5000 | NLLSModel (Sparse) | 15792.0 | 1 | 16 | 429125.0 | 1 | 64 |
| 5000 | Standalone (Sparse) | 104709.0 | 1 | 16 | 1.647542e6 | 25 | 12583536 |
| 7500 | JuMP | 1.6531e7 | 5 | 80 | 4.2782167e7 | 9 | 224 |
| 7500 | NLLSModel (Sparse) | 24250.0 | 1 | 16 | 459500.0 | 1 | 64 |
| 7500 | Standalone (Sparse) | 149000.0 | 1 | 16 | 2.567667e6 | 25 | 18866800 |
| 10000 | JuMP | 2.1853167e7 | 5 | 80 | 5.7280208e7 | 9 | 224 |
| 10000 | NLLSModel (Sparse) | 33458.0 | 1 | 16 | 942875.0 | 1 | 64 |
| 10000 | Standalone (Sparse) | 204458.0 | 1 | 16 | 3.249458e6 | 25 | 25133680 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 50 | CaNNOLeS | 310083.5 | 220 | 185760 | 5 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | Ipopt | 1.2352295e6 | 431 | 100032 | 3 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | JSOSolvers (tron) | 3.0602705e6 | 642 | 62224 | 19 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | JSOSolvers (trunk) | 2.7591875e6 | 518 | 45952 | 22 | 1.0114e-01 | true | ok | NaN | NaN | first\_order |
| 50 | LeastSquaresOptim (Dogleg) | 402834.0 | 70 | 29696 | 4 | 1.0114e-01 | true | ok | NaN | NaN | converged |
| 50 | LeastSquaresOptim (LM) | 789667.0 | 102 | 37664 | 8 | 1.0114e-01 | true | ok | NaN | NaN | converged |
| 50 | MadNLP | 785083.0 | 618 | 126304 | 4 | 1.0114e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 50 | NonlinearSolve (LM) | 4.0839521e7 | 807 | 661328 | 124 | 1.0114e-01 | true | ok | NaN | NaN | StalledSuccess |
| 50 | NonlinearSolve (TrustRegion) | 884812.5 | 1058 | 1218800 | 37 | 1.0114e-01 | true | ok | NaN | NaN | StalledSuccess |
| 50 | Optim (Newton) | 468708.5 | 570 | 1528512 | 5 | 1.0114e-01 | true | ok | NaN | NaN | converged |
| 50 | SecondOrderOptimization | 105458.0 | 224 | 189920 | 4 | 1.0114e-01 | true | ok | NaN | NaN | rel\_dcost |
| 100 | CaNNOLeS | 621500.0 | 244 | 378656 | 5 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | Ipopt | 2.4925205e6 | 513 | 203184 | 4 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | JSOSolvers (tron) | 7.693708e6 | 824 | 106320 | 25 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | JSOSolvers (trunk) | 7.401583e6 | 712 | 79696 | 34 | 1.0634e-01 | true | ok | NaN | NaN | first\_order |
| 100 | LeastSquaresOptim (Dogleg) | 970396.0 | 86 | 52944 | 4 | 1.0634e-01 | true | ok | NaN | NaN | converged |
| 100 | LeastSquaresOptim (LM) | 1.675125e6 | 117 | 59632 | 8 | 1.0634e-01 | true | ok | NaN | NaN | converged |
| 100 | MadNLP | 1.270604e6 | 653 | 204944 | 4 | 1.0634e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 100 | NonlinearSolve (LM) | 1.60407e8 | 858 | 2053440 | 124 | 1.0634e-01 | true | ok | NaN | NaN | StalledSuccess |
| 100 | NonlinearSolve (TrustRegion) | 2.2540835e6 | 1221 | 3492272 | 48 | 1.0634e-01 | true | ok | NaN | NaN | StalledSuccess |
| 100 | Optim (Newton) | 811562.5 | 602 | 3324128 | 5 | 1.0634e-01 | true | ok | NaN | NaN | converged |
| 100 | SecondOrderOptimization | 261000.5 | 374 | 428496 | 4 | 1.0634e-01 | true | ok | NaN | NaN | rel\_dcost |
| 200 | CaNNOLeS | 1.334208e6 | 250 | 752512 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | Ipopt | 4.7561875e6 | 515 | 353456 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | JSOSolvers (tron) | 1.69022085e7 | 868 | 176304 | 26 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | JSOSolvers (trunk) | 1.74392085e7 | 793 | 130048 | 40 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 200 | LeastSquaresOptim (Dogleg) | 2.172646e6 | 86 | 87952 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 200 | LeastSquaresOptim (LM) | 3.9032085e6 | 124 | 92848 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 200 | MadNLP | 2.349625e6 | 677 | 362160 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 200 | NonlinearSolve (LM) | 6.26639229e8 | 21424 | 123826192 | 124 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 200 | NonlinearSolve (TrustRegion) | 3.4175205e6 | 1191 | 5624112 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 200 | Optim (Newton) | 1.433937e6 | 622 | 6434528 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 200 | SecondOrderOptimization | 458062.5 | 389 | 875808 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 400 | CaNNOLeS | 2.7380205e6 | 252 | 1541024 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | Ipopt | 8.4644795e6 | 519 | 694928 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | JSOSolvers (tron) | 3.57772915e7 | 931 | 315120 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | JSOSolvers (trunk) | 3.39256665e7 | 791 | 223136 | 37 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 400 | LeastSquaresOptim (Dogleg) | 4.819875e6 | 86 | 157840 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 400 | LeastSquaresOptim (LM) | 9.1569375e6 | 126 | 161552 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 400 | MadNLP | 4.936729e6 | 677 | 674544 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 400 | NonlinearSolve (LM) | 6.124787917e9 | 54876 | 661945136 | 323 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 400 | NonlinearSolve (TrustRegion) | 1.37029375e7 | 4008 | 12213760 | 49 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 400 | Optim (Newton) | 2.8368125e6 | 622 | 12769664 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 400 | SecondOrderOptimization | 865500.0 | 413 | 1725408 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 800 | CaNNOLeS | 6.6076045e6 | 254 | 3208128 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | Ipopt | 1.932925e7 | 523 | 1488400 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | JSOSolvers (tron) | 8.0419209e7 | 957 | 588000 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | JSOSolvers (trunk) | 8.5751521e7 | 869 | 413248 | 44 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 800 | LeastSquaresOptim (Dogleg) | 9.908146e6 | 86 | 297744 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 800 | LeastSquaresOptim (LM) | 1.9137646e7 | 126 | 292016 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 800 | MadNLP | 1.20916875e7 | 677 | 1348752 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 800 | NonlinearSolve (LM) | 3.0050698333e10 | 869 | 106151536 | 380 | 1.0651e-01 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 800 | NonlinearSolve (TrustRegion) | 2.5680688e7 | 6860 | 26427744 | 42 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 800 | Optim (Newton) | 5.500375e6 | 712 | 24950336 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 800 | SecondOrderOptimization | 1.602104e6 | 416 | 3431472 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 1200 | CaNNOLeS | 1.24222085e7 | 256 | 4584416 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | Ipopt | 3.1914083e7 | 527 | 2245200 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | JSOSolvers (tron) | 1.695923755e8 | 986 | 869456 | 28 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | JSOSolvers (trunk) | 1.59003146e8 | 843 | 596320 | 42 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 1200 | LeastSquaresOptim (Dogleg) | 1.53613755e7 | 86 | 445840 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 1200 | LeastSquaresOptim (LM) | 2.8393104e7 | 126 | 428624 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 1200 | MadNLP | 1.9787208e7 | 677 | 2019888 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1200 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 1200 | NonlinearSolve (TrustRegion) | 3.5366042e7 | 9537 | 36441760 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 1200 | Optim (Newton) | 8.212521e6 | 628 | 37102848 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 1200 | SecondOrderOptimization | 2.288375e6 | 420 | 5081296 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 2000 | CaNNOLeS | 2.72836035e7 | 256 | 7369696 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | Ipopt | 6.1953417e7 | 529 | 3791184 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | JSOSolvers (tron) | 4.69253917e8 | 926 | 1392912 | 26 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | JSOSolvers (trunk) | 4.25980583e8 | 802 | 971184 | 38 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 2000 | LeastSquaresOptim (Dogleg) | 2.5028125e7 | 85 | 708368 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 2000 | LeastSquaresOptim (LM) | 4.5823125e7 | 126 | 677264 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 2000 | MadNLP | 4.2194542e7 | 677 | 3358064 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 2000 | NonlinearSolve (TrustRegion) | 6.20297295e7 | 15062 | 60565808 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 2000 | Optim (Newton) | 1.82465835e7 | 628 | 61412608 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 2000 | SecondOrderOptimization | 4.1117495e6 | 420 | 8411520 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 3500 | CaNNOLeS | 5.9497292e7 | 258 | 12628992 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | Ipopt | 1.765156875e9 | 537 | 6080976 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | JSOSolvers (tron) | 1.449926292e9 | 961 | 2514848 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | JSOSolvers (trunk) | 1.128120833e9 | 807 | 1708704 | 38 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 3500 | LeastSquaresOptim (Dogleg) | 5.606975e7 | 85 | 1300368 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 3500 | LeastSquaresOptim (LM) | 8.47161665e7 | 124 | 1219216 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 3500 | MadNLP | 9.9842688e7 | 677 | 5714064 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3500 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 3500 | NonlinearSolve (TrustRegion) | 1.56885667e8 | 25395 | 107526992 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 3500 | Optim (Newton) | 3.096225e7 | 644 | 108176896 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 3500 | SecondOrderOptimization | 1.3652375e7 | 424 | 14675728 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 5000 | CaNNOLeS | 9.1010625e7 | 260 | 19788832 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | Ipopt | 1.7529135e9 | 547 | 9255920 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | JSOSolvers (tron) | 2.345736083e9 | 964 | 3452976 | 27 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | JSOSolvers (trunk) | 2.1141065e9 | 859 | 2366560 | 44 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 5000 | LeastSquaresOptim (Dogleg) | 7.32813125e7 | 85 | 1778192 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 5000 | LeastSquaresOptim (LM) | 1.17189417e8 | 124 | 1667632 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 5000 | MadNLP | 1.543791455e8 | 677 | 7899184 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 5000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 5000 | NonlinearSolve (TrustRegion) | 2.2929425e8 | 35725 | 150872480 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 5000 | Optim (Newton) | 4.06809165e7 | 640 | 152749504 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 5000 | SecondOrderOptimization | 1.9910646e7 | 424 | 20845504 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 7500 | CaNNOLeS | 1.37536959e8 | 260 | 26735648 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | Ipopt | 1.768994708e9 | 547 | 12846064 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | JSOSolvers (tron) | 4.151448666e9 | 959 | 4804416 | 28 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | JSOSolvers (trunk) | 4.083320542e9 | 896 | 3302224 | 48 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 7500 | LeastSquaresOptim (Dogleg) | 1.13402208e8 | 89 | 2470608 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 7500 | LeastSquaresOptim (LM) | 1.700879375e8 | 133 | 2316256 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 7500 | MadNLP | 2.63050667e8 | 686 | 11529696 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 7500 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 7500 | NonlinearSolve (TrustRegion) | 5.06425729e8 | 52920 | 224945248 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 7500 | Optim (Newton) | 6.6906625e7 | 648 | 227640896 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 7500 | SecondOrderOptimization | 3.1626791e7 | 424 | 30985488 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
| 10000 | CaNNOLeS | 1.83115834e8 | 262 | 36697152 | 5 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | Ipopt | 1.92544025e9 | 551 | 17930288 | 4 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | JSOSolvers (tron) | 6.4089375e9 | 1065 | 6456096 | 32 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | JSOSolvers (trunk) | 5.285993958e9 | 854 | 4414320 | 44 | 1.0651e-01 | true | ok | NaN | NaN | first\_order |
| 10000 | LeastSquaresOptim (Dogleg) | 1.48622958e8 | 89 | 3326672 | 4 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 10000 | LeastSquaresOptim (LM) | 2.57123354e8 | 133 | 3111904 | 9 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 10000 | MadNLP | 3.54095917e8 | 686 | 15258080 | 5 | 1.0651e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10000 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 800 |
| 10000 | NonlinearSolve (TrustRegion) | 4.22881791e8 | 70110 | 305528976 | 39 | 1.0651e-01 | true | ok | NaN | NaN | StalledSuccess |
| 10000 | Optim (Newton) | 8.7691625e7 | 652 | 312837760 | 5 | 1.0651e-01 | true | ok | NaN | NaN | converged |
| 10000 | SecondOrderOptimization | 3.6600084e7 | 424 | 41623152 | 4 | 1.0651e-01 | true | ok | NaN | NaN | rel\_dcost |
