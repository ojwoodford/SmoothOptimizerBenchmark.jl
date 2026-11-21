# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:04:03
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
| 64 | JuMP | 9750.0 | 2 | 32 | 20917.0 | 5 | 128 |
| 64 | NLLSModel (Static) | 322.74603174603175 | 1 | 16 | 1369.4666666666667 | 1 | 32 |
| 64 | Standalone | 339.7931034482759 | 1 | 16 | 1422.2 | 1 | 32 |
| 128 | JuMP | 18625.0 | 2 | 32 | 40834.0 | 5 | 128 |
| 128 | NLLSModel (Static) | 584.5142857142857 | 1 | 16 | 2640.625 | 1 | 32 |
| 128 | Standalone | 604.1764705882352 | 1 | 16 | 2703.125 | 1 | 32 |
| 256 | JuMP | 36083.0 | 2 | 32 | 80708.0 | 5 | 128 |
| 256 | NLLSModel (Static) | 1051.7241379310344 | 1 | 16 | 5114.75 | 1 | 32 |
| 256 | Standalone | 1131.9444444444443 | 1 | 16 | 5323.0 | 1 | 32 |
| 512 | JuMP | 70500.0 | 2 | 32 | 160625.0 | 5 | 128 |
| 512 | NLLSModel (Static) | 1317.1666666666667 | 1 | 16 | 10875.0 | 1 | 32 |
| 512 | Standalone | 2216.6 | 1 | 16 | 10542.0 | 1 | 32 |
| 1024 | JuMP | 141083.0 | 2 | 32 | 320459.0 | 5 | 128 |
| 1024 | NLLSModel (Static) | 1434.5714285714287 | 1 | 16 | 10375.0 | 1 | 32 |
| 1024 | Standalone | 4408.4 | 1 | 16 | 21041.0 | 1 | 32 |
| 2048 | JuMP | 294667.0 | 2 | 32 | 691958.0 | 5 | 128 |
| 2048 | NLLSModel (Static) | 2025.0 | 1 | 16 | 17708.0 | 1 | 32 |
| 2048 | Standalone | 8847.0 | 1 | 16 | 71084.0 | 1 | 32 |
| 4096 | JuMP | 953250.0 | 2 | 32 | 2.292959e6 | 5 | 128 |
| 4096 | NLLSModel (Static) | 3142.8571428571427 | 1 | 16 | 42791.0 | 1 | 32 |
| 4096 | Standalone | 18875.0 | 1 | 16 | 84583.0 | 1 | 32 |
| 8192 | JuMP | 2.637791e6 | 2 | 32 | 6.718041e6 | 5 | 128 |
| 8192 | NLLSModel (Static) | 5375.0 | 1 | 16 | 87375.0 | 1 | 32 |
| 8192 | Standalone | 36167.0 | 1 | 16 | 174500.0 | 1 | 32 |
| 16384 | JuMP | 9.041416e6 | 2 | 32 | 2.2373709e7 | 5 | 128 |
| 16384 | NLLSModel (Static) | 9833.0 | 1 | 16 | 167958.0 | 1 | 32 |
| 16384 | Standalone | 74791.0 | 1 | 16 | 341625.0 | 1 | 32 |
| 32768 | JuMP | 1.938925e7 | 2 | 32 | 5.413075e7 | 5 | 128 |
| 32768 | NLLSModel (Static) | 18708.0 | 1 | 16 | 357583.0 | 1 | 32 |
| 32768 | Standalone | 143667.0 | 1 | 16 | 701541.0 | 1 | 32 |
| 65536 | JuMP | 4.4733667e7 | 2 | 32 | 1.08993708e8 | 5 | 128 |
| 65536 | NLLSModel (Static) | 36791.0 | 1 | 16 | 644833.0 | 1 | 32 |
| 65536 | Standalone | 290500.0 | 1 | 16 | 1.358291e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 64 | CaNNOLeS | 126729.0 | 198 | 79408 | 6 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 1.260625e6 | 513 | 57472 | 5 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 212500.0 | 214 | 14224 | 7 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 140916.5 | 115 | 8512 | 6 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | LeastSquaresOptim (Dogleg) | 17729.5 | 115 | 258976 | 5 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 23145.5 | 147 | 360688 | 7 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | MadNLP | 633542.0 | 655 | 51152 | 7 | 1.3405e-02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 400875.0 | 1246 | 210736 | 120 | 1.3405e-02 | true | ok | NaN | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 215917.0 | 1563 | 4094928 | 16 | 1.3405e-02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 64 | Optim (Newton) | 23917.0 | 116 | 4816 | 6 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 28125.0 | 220 | 15632 | 5 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | SecondOrderOptimization | 9583.0 | 32 | 2064 | 5 | 1.3405e-02 | true | ok | NaN | NaN | rel\_dcost |
| 128 | CaNNOLeS | 200833.0 | 205 | 137168 | 5 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 1.8971665e6 | 515 | 77920 | 5 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 520479.5 | 232 | 18896 | 7 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 335458.0 | 122 | 12112 | 7 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | LeastSquaresOptim (Dogleg) | 26958.0 | 116 | 262080 | 5 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 36020.5 | 148 | 364272 | 7 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | MadNLP | 760145.5 | 653 | 51088 | 6 | 2.5926e-02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 562249.5 | 1223 | 337568 | 117 | 2.5926e-02 | true | ok | NaN | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 177667.0 | 885 | 2266704 | 9 | 2.5926e-02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 128 | Optim (Newton) | 29833.0 | 103 | 4400 | 5 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 30500.0 | 193 | 13456 | 4 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | SecondOrderOptimization | 16333.0 | 32 | 2064 | 5 | 2.5926e-02 | true | ok | NaN | NaN | rel\_dcost |
| 256 | CaNNOLeS | 387917.0 | 235 | 285072 | 5 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 3.115104e6 | 553 | 152352 | 5 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | 932417.0 | 227 | 25264 | 6 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (trunk) | 675124.5 | 128 | 18064 | 7 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | LeastSquaresOptim (Dogleg) | 47729.0 | 119 | 268128 | 5 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 76333.0 | 169 | 422272 | 8 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | MadNLP | 2.0085625e6 | 791 | 53488 | 12 | 5.5410e-02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 986417.0 | 1465 | 712800 | 117 | 5.5410e-02 | true | ok | NaN | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 514750.0 | 1587 | 4213872 | 11 | 5.5410e-02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 256 | Optim (Newton) | 48729.0 | 103 | 4400 | 5 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 44521.0 | 193 | 13456 | 4 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | SecondOrderOptimization | 29999.5 | 32 | 2064 | 5 | 5.5410e-02 | true | ok | NaN | NaN | rel\_dcost |
| 512 | CaNNOLeS | 888271.0 | 244 | 589920 | 6 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | Ipopt | 5.677396e6 | 555 | 303360 | 5 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (tron) | 1.6046875e6 | 212 | 38880 | 5 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (trunk) | 1.636146e6 | 144 | 31056 | 9 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | LeastSquaresOptim (Dogleg) | 87041.5 | 119 | 280416 | 5 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 118562.5 | 151 | 385168 | 7 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | MadNLP | 2.9274995e6 | 741 | 52656 | 11 | 1.0665e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 1.7463125e6 | 1465 | 1357408 | 117 | 1.0665e-01 | true | ok | NaN | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 2.202625e6 | 3149 | 9589664 | 59 | 1.0665e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 512 | Optim (Newton) | 99479.0 | 116 | 4816 | 6 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 84083.0 | 220 | 15632 | 5 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | SecondOrderOptimization | 58187.5 | 32 | 2064 | 5 | 1.0665e-01 | true | ok | NaN | NaN | rel\_dcost |
| 1024 | CaNNOLeS | 1.546625e6 | 242 | 1149952 | 5 | 2.0673e-01 | true | ok | NaN | NaN | first\_order |
| 1024 | Ipopt | 1.1155667e7 | 559 | 486368 | 5 | 2.0673e-01 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (tron) | 3.867e6 | 233 | 68560 | 6 | 2.0673e-01 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (trunk) | 6.8485292e7 | 3264 | 211440 | 325 | 2.0673e-01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 1024 | LeastSquaresOptim (Dogleg) | 170354.5 | 119 | 304992 | 5 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 229666.5 | 151 | 412816 | 7 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | MadNLP | 3.266854e6 | 665 | 51280 | 6 | 2.0673e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 3.4231665e6 | 1465 | 2646624 | 117 | 2.0673e-01 | true | ok | NaN | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 1.455333e6 | 1543 | 5815760 | 8 | 2.0673e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 1024 | Optim (Newton) | 160833.0 | 103 | 4400 | 5 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 124270.5 | 193 | 13456 | 4 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | SecondOrderOptimization | 56875.0 | 54 | 3344 | 5 | 2.0673e-01 | true | ok | NaN | NaN | rel\_dcost |
| 2048 | CaNNOLeS | 4.156146e6 | 246 | 2139264 | 6 | 4.1154e-01 | true | ok | NaN | NaN | first\_order |
| 2048 | Ipopt | 2.33421045e7 | 563 | 971296 | 5 | 4.1154e-01 | true | ok | NaN | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 3.9611666e7 | 782 | 157296 | 24 | 4.1154e-01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 2048 | JSOSolvers (trunk) | 4.4853335e6 | 115 | 103392 | 5 | 4.1154e-01 | true | ok | NaN | NaN | first\_order |
| 2048 | LeastSquaresOptim (Dogleg) | 476083.5 | 119 | 354144 | 5 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 651937.5 | 151 | 476304 | 7 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | MadNLP | 6.7161875e6 | 665 | 51280 | 6 | 4.1154e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 6.4623335e6 | 1454 | 5208208 | 116 | 4.1154e-01 | true | ok | NaN | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 2.667625e6 | 1455 | 7643280 | 9 | 4.1154e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 2048 | Optim (Newton) | 565437.5 | 116 | 4816 | 6 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 450125.0 | 220 | 15632 | 5 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | SecondOrderOptimization | 98500.0 | 56 | 3552 | 5 | 4.1154e-01 | true | ok | NaN | NaN | rel\_dcost |
| 4096 | CaNNOLeS | 9.972375e6 | 246 | 4224064 | 5 | 8.3061e-01 | true | ok | NaN | NaN | first\_order |
| 4096 | Ipopt | 5.3687542e7 | 567 | 2047584 | 5 | 8.3061e-01 | true | ok | NaN | NaN | first\_order |
| 4096 | JSOSolvers (tron) | 1.40373958e8 | 822 | 273744 | 28 | 8.3061e-01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 4096 | JSOSolvers (trunk) | 4.47811959e8 | 3301 | 360672 | 330 | 8.3061e-01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4096 | LeastSquaresOptim (Dogleg) | 938583.5 | 119 | 452448 | 5 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 1.286521e6 | 151 | 586896 | 7 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | MadNLP | 2.32503125e7 | 673 | 51440 | 7 | 8.3061e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 1.2688333e7 | 1465 | 12323424 | 117 | 8.3061e-01 | true | ok | NaN | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion) | 3.263042e6 | 905 | 7416256 | 7 | 8.3061e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 4096 | Optim (Newton) | 724812.5 | 103 | 4400 | 5 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 877146.0 | 220 | 15632 | 5 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | SecondOrderOptimization | 183042.0 | 56 | 3552 | 5 | 8.3061e-01 | true | ok | NaN | NaN | rel\_dcost |
| 8192 | CaNNOLeS | 3.1229625e7 | 250 | 7910592 | 6 | 1.6555e+00 | true | ok | NaN | NaN | first\_order |
| 8192 | Ipopt | 1.248347705e8 | 571 | 3872800 | 5 | 1.6555e+00 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (tron) | 1.07092875e8 | 252 | 470880 | 7 | 1.6555e+00 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (trunk) | 1.631937792e9 | 3303 | 557360 | 331 | 1.6555e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8192 | LeastSquaresOptim (Dogleg) | 1.3789375e6 | 119 | 649056 | 5 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 1.8345415e6 | 151 | 783504 | 7 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | MadNLP | 6.67871875e7 | 673 | 51440 | 7 | 1.6555e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | 2.3799291e7 | 1465 | 20646496 | 117 | 1.6555e+00 | true | ok | NaN | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion) | 9.914208e6 | 949 | 13416544 | 8 | 1.6555e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 8192 | Optim (Newton) | 1.4128965e6 | 116 | 4816 | 6 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 875062.5 | 193 | 13456 | 4 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | SecondOrderOptimization | 446875.0 | 56 | 3552 | 5 | 1.6555e+00 | true | ok | NaN | NaN | rel\_dcost |
| 16384 | CaNNOLeS | 8.2016375e7 | 252 | 15316192 | 6 | 3.3011e+00 | true | ok | NaN | NaN | first\_order |
| 16384 | Ipopt | 2.084104625e9 | 587 | 7541472 | 5 | 3.3011e+00 | true | ok | NaN | NaN | first\_order |
| 16384 | JSOSolvers (tron) | 1.384022042e9 | 796 | 960624 | 25 | 3.3011e+00 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 16384 | JSOSolvers (trunk) | 4.121151333e9 | 3226 | 946896 | 320 | 3.3011e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 16384 | LeastSquaresOptim (Dogleg) | 3.0611045e6 | 119 | 1042272 | 5 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 3.9454585e6 | 151 | 1176720 | 7 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | MadNLP | 2.28790916e8 | 711 | 52080 | 8 | 3.3011e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | 4.8799625e7 | 1454 | 36997264 | 116 | 3.3011e+00 | true | ok | NaN | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion) | 1.7751375e7 | 905 | 23538112 | 8 | 3.3011e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 16384 | Optim (Newton) | 3.1532085e6 | 136 | 5328 | 6 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 1.9607085e6 | 193 | 13456 | 4 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | SecondOrderOptimization | 885562.5 | 56 | 3552 | 5 | 3.3011e+00 | true | ok | NaN | NaN | rel\_dcost |
| 32768 | CaNNOLeS | 1.609000415e8 | 254 | 32175360 | 6 | 6.5496e+00 | true | ok | NaN | NaN | first\_order |
| 32768 | Ipopt | 2.361502708e9 | 591 | 14860064 | 5 | 6.5496e+00 | true | ok | NaN | NaN | first\_order |
| 32768 | JSOSolvers (tron) | 3.197939583e9 | 748 | 1875824 | 24 | 6.5496e+00 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 32768 | JSOSolvers (trunk) | 1.2499672917e10 | 3238 | 1733904 | 321 | 6.5496e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 32768 | LeastSquaresOptim (Dogleg) | 6.0030625e6 | 119 | 1828704 | 5 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 7.9763955e6 | 151 | 1963152 | 7 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | MadNLP | 4.983182295e8 | 673 | 51440 | 7 | 6.5496e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | 9.9301791e7 | 1465 | 70584928 | 117 | 6.5496e+00 | true | ok | NaN | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion) | 5.2798875e7 | 1543 | 76922320 | 9 | 6.5496e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 32768 | Optim (Newton) | 5.7282085e6 | 116 | 4816 | 6 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 3.52675e6 | 193 | 13456 | 4 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | SecondOrderOptimization | 1.4358955e6 | 56 | 3552 | 5 | 6.5496e+00 | true | ok | NaN | NaN | rel\_dcost |
| 65536 | CaNNOLeS | 3.74587e8 | 258 | 69137728 | 6 | 1.3174e+01 | true | ok | NaN | NaN | first\_order |
| 65536 | Ipopt | 2.88252625e9 | 597 | 33429376 | 5 | 1.3174e+01 | true | ok | NaN | NaN | first\_order |
| 65536 | JSOSolvers (tron) | 5.995985333e9 | 703 | 3708672 | 20 | 1.3174e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 65536 | JSOSolvers (trunk) | 2.7743516333e10 | 3222 | 3306000 | 317 | 1.3174e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 65536 | LeastSquaresOptim (Dogleg) | 1.3011875e7 | 119 | 3401568 | 5 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | LeastSquaresOptim (LM) | 1.64036875e7 | 151 | 3536016 | 7 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | MadNLP | 5.838680166e9 | 1441 | 63920 | 12 | 1.3174e+01 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 65536 | NonlinearSolve (LM) | 2.04218833e8 | 1465 | 137169504 | 117 | 1.3174e+01 | true | ok | NaN | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion) | 1.30040916e8 | 1719 | 167508048 | 15 | 1.3174e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 65536 | Optim (Newton) | 1.1749604e7 | 116 | 4816 | 6 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 7.197813e6 | 193 | 13456 | 4 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | SecondOrderOptimization | 3.4243545e6 | 56 | 3552 | 5 | 1.3174e+01 | true | ok | NaN | NaN | rel\_dcost |
