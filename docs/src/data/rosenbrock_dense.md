# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:07:56
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
| 2 | JuMP | 1085.5263157894738 | 5 | 80 | 2112.5 | 9 | 224 |
| 2 | NLLSModel | 55.41038961038961 | 1 | 16 | 233.93975903614458 | 1 | 32 |
| 2 | Standalone | 72.55244755244755 | 1 | 16 | 208.33333333333334 | 1 | 32 |
| 3 | JuMP | 1291.6470588235295 | 5 | 80 | 2351.8888888888887 | 9 | 224 |
| 3 | NLLSModel | 56.94070080862534 | 1 | 16 | 242.890243902439 | 1 | 32 |
| 3 | Standalone | 80.41958041958041 | 1 | 16 | 314.88524590163934 | 1 | 32 |
| 4 | JuMP | 1497.0 | 5 | 80 | 2922.5714285714284 | 9 | 224 |
| 4 | NLLSModel | 61.20754716981132 | 1 | 16 | 278.84615384615387 | 1 | 32 |
| 4 | Standalone | 84.26966292134831 | 1 | 16 | 337.44262295081967 | 1 | 32 |
| 5 | JuMP | 1805.5833333333333 | 5 | 80 | 3979.1666666666665 | 9 | 224 |
| 5 | NLLSModel | 63.34231805929919 | 1 | 16 | 377.23214285714283 | 1 | 32 |
| 5 | Standalone | 87.13692946058092 | 1 | 16 | 422.5 | 1 | 32 |
| 6 | JuMP | 2134.3333333333335 | 5 | 80 | 5033.2 | 9 | 224 |
| 6 | NLLSModel | 64.45868945868946 | 1 | 16 | 457.3720930232558 | 1 | 32 |
| 6 | Standalone | 104.92272727272727 | 1 | 16 | 455.35714285714283 | 1 | 32 |
| 8 | JuMP | 3392.8571428571427 | 5 | 80 | 8555.333333333334 | 9 | 224 |
| 8 | NLLSModel | 98.668 | 1 | 16 | 671.875 | 1 | 32 |
| 8 | Standalone | 113.41463414634147 | 1 | 16 | 642.483870967742 | 1 | 32 |
| 10 | JuMP | 4812.5 | 5 | 80 | 14875.0 | 9 | 224 |
| 10 | NLLSModel | 121.41148325358851 | 1 | 16 | 942.0434782608696 | 1 | 32 |
| 10 | Standalone | 135.42045454545453 | 1 | 16 | 1035.4 | 1 | 32 |
| 14 | JuMP | 9847.333333333334 | 5 | 80 | 45917.0 | 9 | 224 |
| 14 | NLLSModel | 173.1359223300971 | 1 | 16 | 1564.076923076923 | 1 | 32 |
| 14 | Standalone | 191.25409836065575 | 1 | 16 | 2291.6666666666665 | 1 | 32 |
| 18 | JuMP | 14833.0 | 5 | 80 | 71833.0 | 9 | 224 |
| 18 | NLLSModel | 286.3142857142857 | 1 | 16 | 2333.3333333333335 | 1 | 32 |
| 18 | Standalone | 230.93617021276594 | 1 | 16 | 4191.8 | 1 | 32 |
| 22 | JuMP | 21750.0 | 5 | 80 | 143041.0 | 9 | 224 |
| 22 | NLLSModel | 327.0833333333333 | 1 | 16 | 3479.1666666666665 | 1 | 32 |
| 22 | Standalone | 307.14285714285717 | 1 | 16 | 8416.666666666666 | 1 | 32 |
| 26 | JuMP | 30417.0 | 5 | 80 | 202041.0 | 9 | 224 |
| 26 | NLLSModel | 401.96078431372547 | 1 | 16 | 4741.8 | 1 | 32 |
| 26 | Standalone | 391.03846153846155 | 1 | 16 | 13750.0 | 1 | 32 |
| 32 | JuMP | 45834.0 | 5 | 80 | 388917.0 | 9 | 224 |
| 32 | NLLSModel | 397.88235294117646 | 1 | 16 | 7361.0 | 1 | 32 |
| 32 | Standalone | 558.5675675675676 | 1 | 16 | 24667.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 2 | CaNNOLeS | 12479.5 | 178 | 9568 | 4 | 1.6189e-25 | true | ok | NaN | NaN | first\_order |
| 2 | Ipopt | 602750.0 | 472 | 21536 | 4 | 5.6283e-21 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (tron) | 18271.0 | 175 | 8880 | 4 | 1.9251e-20 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (trunk) | 10917.0 | 97 | 4672 | 5 | 5.4531e-18 | true | ok | NaN | NaN | first\_order |
| 2 | LeastSquaresOptim (Dogleg) | 25187.5 | 115 | 254544 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 23624.5 | 129 | 305040 | 6 | 6.5677e-24 | true | ok | NaN | NaN | converged |
| 2 | MadNLP | 390125.0 | 622 | 50560 | 5 | 2.3252e-19 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 30479.0 | 247 | 19376 | 9 | 9.5649e-30 | true | ok | NaN | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 26020.5 | 143 | 306224 | 6 | 4.9612e-30 | true | ok | NaN | NaN | Success |
| 2 | Optim (Newton) | 10042.0 | 90 | 4144 | 4 | 1.6182e-25 | true | ok | NaN | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 10771.0 | 146 | 9312 | 4 | 1.6182e-25 | true | ok | NaN | NaN | converged |
| 2 | SecondOrderOptimization | 6708.0 | 142 | 7200 | 4 | 1.6182e-25 | true | ok | NaN | NaN | grad\_tol |
| 3 | CaNNOLeS | 14500.0 | 179 | 11968 | 4 | 3.9658e-21 | true | ok | NaN | NaN | first\_order |
| 3 | Ipopt | 615229.5 | 474 | 22688 | 4 | 5.1672e-21 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (tron) | 125042.0 | 340 | 17024 | 5 | 3.1245e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 3 | JSOSolvers (trunk) | 16292.0 | 107 | 5344 | 5 | 3.7634e-27 | true | ok | NaN | NaN | first\_order |
| 3 | LeastSquaresOptim (Dogleg) | 21854.0 | 115 | 256176 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 31874.5 | 147 | 357920 | 7 | 1.4591e-28 | true | ok | NaN | NaN | converged |
| 3 | MadNLP | 429854.5 | 667 | 51792 | 5 | 0.0000e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 35708.5 | 247 | 21280 | 9 | 1.7690e-28 | true | ok | NaN | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 31125.5 | 163 | 360096 | 7 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 3 | Optim (Newton) | 10270.5 | 90 | 4208 | 4 | 3.9658e-21 | true | ok | NaN | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 15708.0 | 146 | 11072 | 4 | 3.9658e-21 | true | ok | NaN | NaN | converged |
| 3 | SecondOrderOptimization | 7020.5 | 142 | 7920 | 4 | 3.9658e-21 | true | ok | NaN | NaN | grad\_tol |
| 4 | CaNNOLeS | 17229.5 | 180 | 15600 | 4 | 3.9389e-19 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 635229.5 | 476 | 24976 | 4 | 2.1071e-19 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 36375.0 | 202 | 10912 | 5 | 1.6739e-22 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 22667.0 | 113 | 6000 | 6 | 4.6487e-19 | true | ok | NaN | NaN | first\_order |
| 4 | LeastSquaresOptim (Dogleg) | 25125.0 | 115 | 258368 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 34792.0 | 147 | 360896 | 7 | 4.7229e-27 | true | ok | NaN | NaN | converged |
| 4 | MadNLP | 425812.0 | 676 | 52848 | 5 | 1.4348e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 41208.0 | 247 | 25088 | 9 | 7.4205e-27 | true | ok | NaN | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 37541.5 | 163 | 364752 | 7 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 4 | Optim (Newton) | 10500.0 | 90 | 4464 | 4 | 3.9389e-19 | true | ok | NaN | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 20229.0 | 177 | 15824 | 4 | 1.0934e-19 | true | ok | NaN | NaN | converged |
| 4 | SecondOrderOptimization | 7479.5 | 142 | 9312 | 4 | 3.9389e-19 | true | ok | NaN | NaN | grad\_tol |
| 5 | CaNNOLeS | 21000.0 | 180 | 18976 | 4 | 5.9917e-18 | true | ok | NaN | NaN | first\_order |
| 5 | Ipopt | 670292.0 | 476 | 26480 | 4 | 5.8004e-19 | true | ok | NaN | NaN | first\_order |
| 5 | JSOSolvers (tron) | 108542.0 | 234 | 12672 | 5 | 7.0196e-18 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 5 | JSOSolvers (trunk) | 34479.0 | 126 | 6816 | 6 | 1.2827e-24 | true | ok | NaN | NaN | first\_order |
| 5 | LeastSquaresOptim (Dogleg) | 31271.0 | 115 | 260400 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 32833.5 | 147 | 363760 | 7 | 5.5611e-26 | true | ok | NaN | NaN | converged |
| 5 | MadNLP | 960917.0 | 1740 | 70928 | 9 | 3.9460e-16 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 5 | NonlinearSolve (LM) | 52271.0 | 256 | 29936 | 10 | 3.3383e-28 | true | ok | NaN | NaN | Success |
| 5 | NonlinearSolve (TrustRegion) | 39562.5 | 163 | 369472 | 7 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 5 | Optim (Newton) | 13395.5 | 103 | 5056 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 24708.5 | 187 | 19344 | 4 | 4.0699e-21 | true | ok | NaN | NaN | converged |
| 5 | SecondOrderOptimization | 9083.5 | 142 | 10528 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 6 | CaNNOLeS | 25583.5 | 180 | 23440 | 4 | 3.7251e-17 | true | ok | NaN | NaN | first\_order |
| 6 | Ipopt | 695708.0 | 476 | 28064 | 4 | 2.2659e-18 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (tron) | 73979.5 | 241 | 13632 | 5 | 1.6782e-18 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (trunk) | 41666.5 | 125 | 7232 | 6 | 5.4384e-20 | true | ok | NaN | NaN | first\_order |
| 6 | LeastSquaresOptim (Dogleg) | 33000.0 | 115 | 262432 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 38083.5 | 147 | 366304 | 7 | 3.5728e-25 | true | ok | NaN | NaN | converged |
| 6 | MadNLP | 449812.5 | 703 | 55360 | 5 | 9.8329e-24 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 60604.5 | 256 | 35936 | 10 | 4.4207e-28 | true | ok | NaN | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 45271.0 | 203 | 482304 | 8 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 6 | Optim (Newton) | 14270.5 | 103 | 5408 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 28125.0 | 187 | 23664 | 4 | 3.7581e-19 | true | ok | NaN | NaN | converged |
| 6 | SecondOrderOptimization | 10125.0 | 142 | 12512 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 8 | CaNNOLeS | 43687.5 | 184 | 36752 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 841417.0 | 537 | 40160 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 167083.0 | 241 | 14928 | 5 | 7.4382e-18 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 8 | JSOSolvers (trunk) | 193667.0 | 413 | 28144 | 6 | 4.1070e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8 | LeastSquaresOptim (Dogleg) | 38375.0 | 121 | 267552 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 48020.5 | 155 | 372896 | 7 | 5.1141e-24 | true | ok | NaN | NaN | converged |
| 8 | MadNLP | 499958.5 | 676 | 57648 | 5 | 4.9304e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 80771.0 | 260 | 51808 | 10 | 6.2136e-28 | true | ok | NaN | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 62417.0 | 200 | 449328 | 8 | 1.4794e-28 | true | ok | NaN | NaN | Success |
| 8 | Optim (Newton) | 16500.0 | 103 | 5952 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 48312.5 | 220 | 38880 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 8 | SecondOrderOptimization | 13312.0 | 142 | 16528 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 10 | CaNNOLeS | 62875.0 | 184 | 50144 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 10 | Ipopt | 945917.0 | 537 | 46768 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (tron) | 356667.0 | 420 | 24944 | 6 | 3.6246e-18 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (trunk) | 230250.0 | 417 | 29472 | 6 | 3.1212e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 10 | LeastSquaresOptim (Dogleg) | 36458.5 | 121 | 273536 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 56813.0 | 155 | 380496 | 7 | 3.2293e-23 | true | ok | NaN | NaN | converged |
| 10 | MadNLP | 647000.5 | 712 | 61408 | 8 | 5.2546e-25 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 113291.5 | 260 | 75296 | 10 | 9.9518e-28 | true | ok | NaN | NaN | Success |
| 10 | NonlinearSolve (TrustRegion) | 87625.0 | 222 | 537856 | 9 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 10 | Optim (Newton) | 19667.0 | 103 | 6864 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 65583.5 | 230 | 53952 | 5 | 1.5587e-28 | true | ok | NaN | NaN | converged |
| 10 | SecondOrderOptimization | 16458.0 | 142 | 22480 | 5 | 0.0000e+00 | true | ok | NaN | NaN | step\_size |
| 14 | CaNNOLeS | 115604.0 | 198 | 95968 | 5 | 1.3174e-30 | true | ok | NaN | NaN | first\_order |
| 14 | Ipopt | 1.315521e6 | 557 | 76128 | 5 | 2.4918e-30 | true | ok | NaN | NaN | first\_order |
| 14 | JSOSolvers (tron) | 729167.0 | 427 | 28656 | 6 | 2.0865e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 14 | JSOSolvers (trunk) | 229166.5 | 151 | 13408 | 7 | 6.9868e-19 | true | ok | NaN | NaN | first\_order |
| 14 | LeastSquaresOptim (Dogleg) | 84188.0 | 140 | 342048 | 6 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 99312.5 | 155 | 398080 | 7 | 3.6854e-22 | true | ok | NaN | NaN | converged |
| 14 | MadNLP | 884771.0 | 712 | 69376 | 8 | 2.5028e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 208770.5 | 260 | 135568 | 10 | 2.6611e-27 | true | ok | NaN | NaN | Success |
| 14 | NonlinearSolve (TrustRegion) | 293021.5 | 398 | 1165952 | 15 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 14 | Optim (Newton) | 30271.0 | 103 | 8592 | 5 | 1.3174e-30 | true | ok | NaN | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 107500.0 | 230 | 80912 | 5 | 6.0723e-24 | true | ok | NaN | NaN | converged |
| 14 | SecondOrderOptimization | 25562.0 | 142 | 35072 | 5 | 1.3174e-30 | true | ok | NaN | NaN | grad\_tol |
| 18 | CaNNOLeS | 186416.5 | 204 | 155056 | 5 | 6.8473e-30 | true | ok | NaN | NaN | first\_order |
| 18 | Ipopt | 1.807604e6 | 559 | 105584 | 5 | 5.3613e-30 | true | ok | NaN | NaN | first\_order |
| 18 | JSOSolvers (tron) | 738771.0 | 307 | 27616 | 6 | 3.6409e-19 | true | ok | NaN | NaN | first\_order |
| 18 | JSOSolvers (trunk) | 551000.0 | 431 | 36800 | 7 | 3.0513e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 18 | LeastSquaresOptim (Dogleg) | 146208.5 | 140 | 373488 | 6 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 18 | LeastSquaresOptim (LM) | 212687.5 | 174 | 486080 | 8 | 3.1543e-28 | true | ok | NaN | NaN | converged |
| 18 | MadNLP | 1.240125e6 | 733 | 80336 | 9 | 0.0000e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 18 | NonlinearSolve (LM) | 390458.0 | 291 | 252784 | 11 | 6.1295e-27 | true | ok | NaN | NaN | Success |
| 18 | NonlinearSolve (TrustRegion) | 181833.5 | 146 | 88144 | 8 | 1.7118e-30 | true | ok | NaN | NaN | Success |
| 18 | Optim (Newton) | 47916.5 | 110 | 11936 | 5 | 2.8125e-22 | true | ok | NaN | NaN | converged |
| 18 | Optim (NewtonTrustRegion) | 159062.0 | 256 | 127328 | 5 | 2.7030e-21 | true | ok | NaN | NaN | converged |
| 18 | SecondOrderOptimization | 42062.5 | 160 | 71344 | 6 | 2.1916e-25 | true | ok | NaN | NaN | grad\_tol |
| 22 | CaNNOLeS | 271041.5 | 227 | 204304 | 5 | 2.0693e-29 | true | ok | NaN | NaN | first\_order |
| 22 | Ipopt | 2.424187e6 | 582 | 133728 | 5 | 3.5223e-29 | true | ok | NaN | NaN | first\_order |
| 22 | JSOSolvers (tron) | 1.910625e6 | 446 | 38672 | 6 | 2.9533e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 22 | JSOSolvers (trunk) | 779334.0 | 435 | 40608 | 7 | 1.1930e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 22 | LeastSquaresOptim (Dogleg) | 202979.5 | 147 | 402912 | 7 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 22 | LeastSquaresOptim (LM) | 331312.5 | 177 | 517984 | 8 | 1.0407e-27 | true | ok | NaN | NaN | converged |
| 22 | MadNLP | 1.8668335e6 | 774 | 93776 | 8 | 1.5438e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 22 | NonlinearSolve (LM) | 710937.5 | 321 | 385392 | 11 | 8.8713e-27 | true | ok | NaN | NaN | Success |
| 22 | NonlinearSolve (TrustRegion) | 484417.0 | 155 | 136800 | 13 | 1.4772e-28 | true | ok | NaN | NaN | Success |
| 22 | Optim (Newton) | 78812.0 | 110 | 14240 | 5 | 2.1694e-20 | true | ok | NaN | NaN | converged |
| 22 | Optim (NewtonTrustRegion) | 238416.5 | 256 | 162016 | 5 | 1.3762e-19 | true | ok | NaN | NaN | converged |
| 22 | SecondOrderOptimization | 66354.0 | 162 | 92896 | 6 | 5.2314e-24 | true | ok | NaN | NaN | grad\_tol |
| 26 | CaNNOLeS | 394229.0 | 235 | 319888 | 5 | 7.2901e-29 | true | ok | NaN | NaN | first\_order |
| 26 | Ipopt | 3.2880835e6 | 596 | 198592 | 5 | 2.3308e-28 | true | ok | NaN | NaN | first\_order |
| 26 | JSOSolvers (tron) | 1.4476665e6 | 297 | 39280 | 6 | 5.7235e-19 | true | ok | NaN | NaN | first\_order |
| 26 | JSOSolvers (trunk) | 1.244916e6 | 455 | 48064 | 8 | 7.2530e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 26 | LeastSquaresOptim (Dogleg) | 353645.5 | 147 | 445696 | 7 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 26 | LeastSquaresOptim (LM) | 693791.5 | 177 | 562464 | 8 | 2.5016e-27 | true | ok | NaN | NaN | converged |
| 26 | MadNLP | 2.577188e6 | 678 | 106720 | 9 | 1.9990e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 26 | NonlinearSolve (LM) | 1.1414375e6 | 321 | 580640 | 11 | 9.9184e-27 | true | ok | NaN | NaN | Success |
| 26 | NonlinearSolve (TrustRegion) | 900166.5 | 155 | 213184 | 13 | 5.4963e-27 | true | ok | NaN | NaN | Success |
| 26 | Optim (Newton) | 118333.5 | 110 | 18672 | 5 | 5.8386e-19 | true | ok | NaN | NaN | converged |
| 26 | Optim (NewtonTrustRegion) | 359729.0 | 298 | 265392 | 5 | 1.1437e-20 | true | ok | NaN | NaN | converged |
| 26 | SecondOrderOptimization | 88395.5 | 162 | 133904 | 6 | 8.0256e-23 | true | ok | NaN | NaN | grad\_tol |
| 32 | CaNNOLeS | 597333.5 | 240 | 445280 | 5 | 2.2626e-28 | true | ok | NaN | NaN | first\_order |
| 32 | Ipopt | 4.935396e6 | 596 | 258944 | 5 | 8.2823e-28 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (tron) | 2.331604e6 | 303 | 54768 | 7 | 4.3948e-19 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 1.773375e6 | 445 | 60336 | 7 | 7.7107e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 32 | LeastSquaresOptim (Dogleg) | 677916.5 | 147 | 531008 | 7 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 1.990792e6 | 177 | 652160 | 8 | 6.1838e-27 | true | ok | NaN | NaN | converged |
| 32 | MadNLP | 1.7169167e7 | 1824 | 156880 | 14 | 9.1250e-17 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 32 | NonlinearSolve (LM) | 2.232208e6 | 347 | 1005968 | 13 | 1.7816e-26 | true | ok | NaN | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 1.889312e6 | 155 | 365648 | 14 | 9.0379e-28 | true | ok | NaN | NaN | Success |
| 32 | Optim (Newton) | 235104.0 | 123 | 23648 | 6 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 563541.5 | 310 | 366240 | 5 | 6.7447e-21 | true | ok | NaN | NaN | converged |
| 32 | SecondOrderOptimization | 138479.0 | 162 | 178944 | 6 | 1.8370e-21 | true | ok | NaN | NaN | grad\_tol |
