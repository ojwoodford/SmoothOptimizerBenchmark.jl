# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:57:54
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
| 64 | JuMP | 9722.0 | 2 | 32 | 21042.0 | 5 | 128 |
| 64 | NLLSModel (Static) | 325.2741935483871 | 1 | 16 | 1400.0 | 1 | 32 |
| 64 | Standalone | 338.78688524590166 | 1 | 16 | 1430.5333333333333 | 1 | 32 |
| 128 | JuMP | 18458.0 | 2 | 32 | 40750.0 | 5 | 128 |
| 128 | NLLSModel (Static) | 588.0857142857143 | 1 | 16 | 2660.714285714286 | 1 | 32 |
| 128 | Standalone | 600.5 | 1 | 16 | 2697.875 | 1 | 32 |
| 256 | JuMP | 35875.0 | 2 | 32 | 80209.0 | 5 | 128 |
| 256 | NLLSModel (Static) | 1105.2631578947369 | 1 | 16 | 6187.5 | 1 | 32 |
| 256 | Standalone | 1134.2777777777778 | 1 | 16 | 5239.75 | 1 | 32 |
| 512 | JuMP | 70750.0 | 2 | 32 | 160042.0 | 5 | 128 |
| 512 | NLLSModel (Static) | 2150.0 | 1 | 16 | 10354.5 | 1 | 32 |
| 512 | Standalone | 2220.8 | 1 | 16 | 10542.0 | 1 | 32 |
| 1024 | JuMP | 140917.0 | 2 | 32 | 321375.0 | 5 | 128 |
| 1024 | NLLSModel (Static) | 4225.0 | 1 | 16 | 20458.0 | 1 | 32 |
| 1024 | Standalone | 4441.6 | 1 | 16 | 21042.0 | 1 | 32 |
| 2048 | JuMP | 292584.0 | 2 | 32 | 684625.0 | 5 | 128 |
| 2048 | NLLSModel (Static) | 8389.0 | 1 | 16 | 40834.0 | 1 | 32 |
| 2048 | Standalone | 8736.333333333334 | 1 | 16 | 71042.0 | 1 | 32 |
| 4096 | JuMP | 1.041916e6 | 2 | 32 | 2.361958e6 | 5 | 128 |
| 4096 | NLLSModel (Static) | 16791.0 | 1 | 16 | 80708.0 | 1 | 32 |
| 4096 | Standalone | 17917.0 | 1 | 16 | 84583.0 | 1 | 32 |
| 8192 | JuMP | 2.824166e6 | 2 | 32 | 7.391666e6 | 5 | 128 |
| 8192 | NLLSModel (Static) | 33833.0 | 1 | 16 | 162834.0 | 1 | 32 |
| 8192 | Standalone | 35125.0 | 1 | 16 | 169375.0 | 1 | 32 |
| 16384 | JuMP | 8.501167e6 | 2 | 32 | 2.2182291e7 | 5 | 128 |
| 16384 | NLLSModel (Static) | 66708.0 | 1 | 16 | 326584.0 | 1 | 32 |
| 16384 | Standalone | 70125.0 | 1 | 16 | 339875.0 | 1 | 32 |
| 32768 | JuMP | 1.9003584e7 | 2 | 32 | 5.4895542e7 | 5 | 128 |
| 32768 | NLLSModel (Static) | 133375.0 | 1 | 16 | 782375.0 | 1 | 32 |
| 32768 | Standalone | 140458.0 | 1 | 16 | 679917.0 | 1 | 32 |
| 65536 | JuMP | 4.34175e7 | 2 | 32 | 1.21291708e8 | 5 | 128 |
| 65536 | NLLSModel (Static) | 269167.0 | 1 | 16 | 1.545958e6 | 1 | 32 |
| 65536 | Standalone | 283917.0 | 1 | 16 | 1.373625e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 64 | CaNNOLeS | 126833.5 | 198 | 79408 | 6 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 1.2526035e6 | 513 | 57472 | 5 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 213375.5 | 214 | 14224 | 7 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 142187.5 | 115 | 8512 | 6 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | LeastSquaresOptim (Dogleg) | 22000.0 | 115 | 258976 | 5 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 23583.0 | 147 | 360688 | 7 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | MadNLP | 664771.0 | 655 | 51152 | 7 | 1.3405e-02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 401062.5 | 1246 | 210736 | 120 | 1.3405e-02 | true | ok | NaN | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 216583.0 | 1563 | 4094928 | 16 | 1.3405e-02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 64 | Optim (Newton) | 24229.0 | 116 | 4816 | 6 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 28604.5 | 220 | 15632 | 5 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | SecondOrderOptimization | 9500.0 | 32 | 2064 | 5 | 1.3405e-02 | true | ok | NaN | NaN | rel\_dcost |
| 128 | CaNNOLeS | 203104.5 | 205 | 137168 | 5 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 1.885833e6 | 515 | 77920 | 5 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 537208.0 | 232 | 18896 | 7 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 345249.5 | 122 | 12112 | 7 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | LeastSquaresOptim (Dogleg) | 27292.0 | 116 | 262080 | 5 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 36750.0 | 148 | 364272 | 7 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | MadNLP | 762750.0 | 653 | 51088 | 6 | 2.5926e-02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 584542.0 | 1223 | 337568 | 117 | 2.5926e-02 | true | ok | NaN | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 194459.0 | 885 | 2266704 | 9 | 2.5926e-02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 128 | Optim (Newton) | 30062.5 | 103 | 4400 | 5 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 30833.0 | 193 | 13456 | 4 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | SecondOrderOptimization | 16083.0 | 32 | 2064 | 5 | 2.5926e-02 | true | ok | NaN | NaN | rel\_dcost |
| 256 | CaNNOLeS | 396416.5 | 235 | 285072 | 5 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 3.1037705e6 | 553 | 152352 | 5 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | 941708.5 | 227 | 25264 | 6 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (trunk) | 681187.5 | 128 | 18064 | 7 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | LeastSquaresOptim (Dogleg) | 48042.0 | 119 | 268128 | 5 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 72604.0 | 169 | 422272 | 8 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | MadNLP | 1.9886045e6 | 791 | 53488 | 12 | 5.5410e-02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 977229.0 | 1465 | 712800 | 117 | 5.5410e-02 | true | ok | NaN | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 511583.0 | 1587 | 4213872 | 11 | 5.5410e-02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 256 | Optim (Newton) | 48750.0 | 103 | 4400 | 5 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 44333.5 | 193 | 13456 | 4 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | SecondOrderOptimization | 28854.5 | 32 | 2064 | 5 | 5.5410e-02 | true | ok | NaN | NaN | rel\_dcost |
| 512 | CaNNOLeS | 888604.5 | 244 | 589920 | 6 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | Ipopt | 5.726479e6 | 555 | 303360 | 5 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (tron) | 1.594979e6 | 212 | 38880 | 5 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (trunk) | 1.655208e6 | 144 | 31056 | 9 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | LeastSquaresOptim (Dogleg) | 86167.0 | 119 | 280416 | 5 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 117958.5 | 151 | 385168 | 7 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | MadNLP | 2.9667705e6 | 741 | 52656 | 11 | 1.0665e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 1.762333e6 | 1465 | 1357408 | 117 | 1.0665e-01 | true | ok | NaN | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 1.977125e6 | 3149 | 9589664 | 59 | 1.0665e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 512 | Optim (Newton) | 100229.5 | 116 | 4816 | 6 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 84250.5 | 220 | 15632 | 5 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | SecondOrderOptimization | 55291.5 | 32 | 2064 | 5 | 1.0665e-01 | true | ok | NaN | NaN | rel\_dcost |
| 1024 | CaNNOLeS | 1.5436665e6 | 242 | 1149952 | 5 | 2.0673e-01 | true | ok | NaN | NaN | first\_order |
| 1024 | Ipopt | 1.11693125e7 | 559 | 486368 | 5 | 2.0673e-01 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (tron) | 3.9007495e6 | 233 | 68560 | 6 | 2.0673e-01 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (trunk) | 6.9356334e7 | 3264 | 211440 | 325 | 2.0673e-01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 1024 | LeastSquaresOptim (Dogleg) | 166250.0 | 119 | 304992 | 5 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 228291.5 | 151 | 412816 | 7 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | MadNLP | 3.2870835e6 | 665 | 51280 | 6 | 2.0673e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 3.447854e6 | 1465 | 2646624 | 117 | 2.0673e-01 | true | ok | NaN | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 1.465959e6 | 1543 | 5815760 | 8 | 2.0673e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 1024 | Optim (Newton) | 160479.5 | 103 | 4400 | 5 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 128042.0 | 193 | 13456 | 4 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | SecondOrderOptimization | 107896.0 | 32 | 2064 | 5 | 2.0673e-01 | true | ok | NaN | NaN | rel\_dcost |
| 2048 | CaNNOLeS | 4.291354e6 | 246 | 2139264 | 6 | 4.1154e-01 | true | ok | NaN | NaN | first\_order |
| 2048 | Ipopt | 2.3944687e7 | 563 | 971296 | 5 | 4.1154e-01 | true | ok | NaN | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 3.8605833e7 | 769 | 156512 | 24 | 4.1154e-01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 2048 | JSOSolvers (trunk) | 4.5683335e6 | 115 | 103392 | 5 | 4.1154e-01 | true | ok | NaN | NaN | first\_order |
| 2048 | LeastSquaresOptim (Dogleg) | 471146.0 | 119 | 354144 | 5 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 651437.0 | 151 | 476304 | 7 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | MadNLP | 6.7039785e6 | 665 | 51280 | 6 | 4.1154e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 6.564646e6 | 1454 | 5208208 | 116 | 4.1154e-01 | true | ok | NaN | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 2.665917e6 | 1455 | 7643280 | 9 | 4.1154e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 2048 | Optim (Newton) | 566521.0 | 116 | 4816 | 6 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 453437.5 | 220 | 15632 | 5 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | SecondOrderOptimization | 255458.5 | 32 | 2064 | 5 | 4.1154e-01 | true | ok | NaN | NaN | rel\_dcost |
| 4096 | CaNNOLeS | 1.05103545e7 | 246 | 4224064 | 5 | 8.3061e-01 | true | ok | NaN | NaN | first\_order |
| 4096 | Ipopt | 5.2674916e7 | 567 | 2047584 | 5 | 8.3061e-01 | true | ok | NaN | NaN | first\_order |
| 4096 | JSOSolvers (tron) | 1.33426375e8 | 822 | 273744 | 28 | 8.3061e-01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 4096 | JSOSolvers (trunk) | 4.2632025e8 | 3301 | 360672 | 330 | 8.3061e-01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4096 | LeastSquaresOptim (Dogleg) | 937728.5 | 119 | 452448 | 5 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 1.288104e6 | 151 | 586896 | 7 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | MadNLP | 2.4016917e7 | 673 | 51440 | 7 | 8.3061e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 1.2439667e7 | 1465 | 12323424 | 117 | 8.3061e-01 | true | ok | NaN | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion) | 3.285208e6 | 905 | 7416256 | 7 | 8.3061e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 4096 | Optim (Newton) | 760583.5 | 103 | 4400 | 5 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 883333.0 | 220 | 15632 | 5 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | SecondOrderOptimization | 428062.5 | 32 | 2064 | 5 | 8.3061e-01 | true | ok | NaN | NaN | rel\_dcost |
| 8192 | CaNNOLeS | 3.3650125e7 | 250 | 7910592 | 6 | 1.6555e+00 | true | ok | NaN | NaN | first\_order |
| 8192 | Ipopt | 1.236283755e8 | 571 | 3872800 | 5 | 1.6555e+00 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (tron) | 1.1573075e8 | 252 | 470880 | 7 | 1.6555e+00 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (trunk) | 1.779914417e9 | 3303 | 557360 | 331 | 1.6555e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8192 | LeastSquaresOptim (Dogleg) | 1.371729e6 | 119 | 649056 | 5 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 1.8340005e6 | 151 | 783504 | 7 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | MadNLP | 7.14441665e7 | 673 | 51440 | 7 | 1.6555e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | 2.3793292e7 | 1465 | 20646496 | 117 | 1.6555e+00 | true | ok | NaN | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion) | 7.622084e6 | 949 | 13416544 | 8 | 1.6555e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 8192 | Optim (Newton) | 1.4179375e6 | 116 | 4816 | 6 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 876417.0 | 193 | 13456 | 4 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | SecondOrderOptimization | 847291.5 | 32 | 2064 | 5 | 1.6555e+00 | true | ok | NaN | NaN | rel\_dcost |
| 16384 | CaNNOLeS | 8.6328146e7 | 252 | 15316192 | 6 | 3.3011e+00 | true | ok | NaN | NaN | first\_order |
| 16384 | Ipopt | 2.557207915e8 | 587 | 7541472 | 5 | 3.3011e+00 | true | ok | NaN | NaN | first\_order |
| 16384 | JSOSolvers (tron) | 1.094071542e9 | 746 | 958224 | 20 | 3.3011e+00 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 16384 | JSOSolvers (trunk) | 4.443447958e9 | 3233 | 947232 | 321 | 3.3011e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 16384 | LeastSquaresOptim (Dogleg) | 2.916875e6 | 119 | 1042272 | 5 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 3.755125e6 | 151 | 1176720 | 7 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | MadNLP | 2.437380415e8 | 711 | 52080 | 8 | 3.3011e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | 4.8303458e7 | 1454 | 36997264 | 116 | 3.3011e+00 | true | ok | NaN | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion) | 1.561325e7 | 905 | 23538112 | 8 | 3.3011e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 16384 | Optim (Newton) | 3.114146e6 | 136 | 5328 | 6 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 1.7360415e6 | 193 | 13456 | 4 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | SecondOrderOptimization | 1.7051665e6 | 32 | 2064 | 5 | 3.3011e+00 | true | ok | NaN | NaN | rel\_dcost |
| 32768 | CaNNOLeS | 1.80675584e8 | 254 | 32175360 | 6 | 6.5496e+00 | true | ok | NaN | NaN | first\_order |
| 32768 | Ipopt | 5.21858167e8 | 591 | 14860064 | 5 | 6.5496e+00 | true | ok | NaN | NaN | first\_order |
| 32768 | JSOSolvers (tron) | 3.182370875e9 | 748 | 1875824 | 24 | 6.5496e+00 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 32768 | JSOSolvers (trunk) | 1.2835329708e10 | 3245 | 1734240 | 323 | 6.5496e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 32768 | LeastSquaresOptim (Dogleg) | 5.6890625e6 | 119 | 1828704 | 5 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 7.5087705e6 | 151 | 1963152 | 7 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | MadNLP | 5.16863667e8 | 673 | 51440 | 7 | 6.5496e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | 1.012213955e8 | 1465 | 70584928 | 117 | 6.5496e+00 | true | ok | NaN | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion) | 5.7144917e7 | 1543 | 76922320 | 9 | 6.5496e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 32768 | Optim (Newton) | 5.6361665e6 | 116 | 4816 | 6 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 3.459771e6 | 193 | 13456 | 4 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | SecondOrderOptimization | 3.3934585e6 | 32 | 2064 | 5 | 6.5496e+00 | true | ok | NaN | NaN | rel\_dcost |
| 65536 | CaNNOLeS | 5.506962285e8 | 258 | 68908352 | 6 | 1.3174e+01 | true | ok | NaN | NaN | first\_order |
| 65536 | Ipopt | 1.085441625e9 | 597 | 33445760 | 5 | 1.3174e+01 | true | ok | NaN | NaN | first\_order |
| 65536 | JSOSolvers (tron) | 5.875707125e9 | 703 | 3708672 | 20 | 1.3174e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 65536 | JSOSolvers (trunk) | 2.7227394333e10 | 3234 | 3306576 | 321 | 1.3174e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 65536 | LeastSquaresOptim (Dogleg) | 1.1503396e7 | 119 | 3401568 | 5 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | LeastSquaresOptim (LM) | 1.48885e7 | 151 | 3536016 | 7 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | MadNLP | 5.9642285e9 | 1441 | 63920 | 12 | 1.3174e+01 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 65536 | NonlinearSolve (LM) | 2.01475666e8 | 1465 | 137169504 | 117 | 1.3174e+01 | true | ok | NaN | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion) | 1.30438792e8 | 1719 | 167508048 | 15 | 1.3174e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 65536 | Optim (Newton) | 1.1264021e7 | 116 | 4816 | 6 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 6.8940625e6 | 193 | 13456 | 4 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | SecondOrderOptimization | 6.857313e6 | 32 | 2064 | 5 | 1.3174e+01 | true | ok | NaN | NaN | rel\_dcost |
