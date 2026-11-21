# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T04:29:33
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
| 2 | JuMP | 1100.8947368421052 | 5 | 80 | 2262.5 | 9 | 224 |
| 2 | NLLSModel | 61.37321937321937 | 1 | 16 | 213.17441860465115 | 1 | 32 |
| 2 | Standalone | 72.4648829431438 | 1 | 16 | 215.62886597938143 | 1 | 32 |
| 3 | JuMP | 1191.1764705882354 | 5 | 80 | 2236.1111111111113 | 9 | 224 |
| 3 | NLLSModel | 72.36842105263158 | 1 | 16 | 259.44 | 1 | 32 |
| 3 | Standalone | 76.33916083916084 | 1 | 16 | 281.25 | 1 | 32 |
| 4 | JuMP | 1419.4666666666667 | 5 | 80 | 2880.8571428571427 | 9 | 224 |
| 4 | NLLSModel | 66.17647058823529 | 1 | 16 | 307.04615384615386 | 1 | 32 |
| 4 | Standalone | 80.21348314606742 | 1 | 16 | 340.7258064516129 | 1 | 32 |
| 5 | JuMP | 1741.6 | 5 | 80 | 3854.1666666666665 | 9 | 224 |
| 5 | NLLSModel | 70.51505016722408 | 1 | 16 | 386.0188679245283 | 1 | 32 |
| 5 | Standalone | 87.57870370370371 | 1 | 16 | 362.1923076923077 | 1 | 32 |
| 6 | JuMP | 2191.6 | 5 | 80 | 4906.25 | 9 | 224 |
| 6 | NLLSModel | 77.75919732441471 | 1 | 16 | 448.1707317073171 | 1 | 32 |
| 6 | Standalone | 117.61363636363636 | 1 | 16 | 498.17391304347825 | 1 | 32 |
| 8 | JuMP | 3166.5714285714284 | 5 | 80 | 8097.0 | 9 | 224 |
| 8 | NLLSModel | 94.27966101694915 | 1 | 16 | 653.2258064516129 | 1 | 32 |
| 8 | Standalone | 128.38755980861245 | 1 | 16 | 612.9032258064516 | 1 | 32 |
| 10 | JuMP | 4591.6 | 5 | 80 | 14083.0 | 9 | 224 |
| 10 | NLLSModel | 104.26829268292683 | 1 | 16 | 899.6363636363636 | 1 | 32 |
| 10 | Standalone | 136.6890243902439 | 1 | 16 | 966.2380952380952 | 1 | 32 |
| 14 | JuMP | 9222.333333333334 | 5 | 80 | 42750.0 | 9 | 224 |
| 14 | NLLSModel | 154.7669172932331 | 1 | 16 | 1615.3846153846155 | 1 | 32 |
| 14 | Standalone | 179.92727272727274 | 1 | 16 | 2296.3333333333335 | 1 | 32 |
| 18 | JuMP | 15167.0 | 5 | 80 | 70459.0 | 9 | 224 |
| 18 | NLLSModel | 251.0 | 1 | 16 | 2500.0 | 1 | 32 |
| 18 | Standalone | 241.10666666666665 | 1 | 16 | 4316.8 | 1 | 32 |
| 22 | JuMP | 22875.0 | 5 | 80 | 148375.0 | 9 | 224 |
| 22 | NLLSModel | 372.21666666666664 | 1 | 16 | 3527.8333333333335 | 1 | 32 |
| 22 | Standalone | 321.72131147540983 | 1 | 16 | 8750.0 | 1 | 32 |
| 26 | JuMP | 31333.0 | 5 | 80 | 209625.0 | 9 | 224 |
| 26 | NLLSModel | 480.1136363636364 | 1 | 16 | 4741.8 | 1 | 32 |
| 26 | Standalone | 422.5 | 1 | 16 | 14875.0 | 1 | 32 |
| 32 | JuMP | 47000.0 | 5 | 80 | 398417.0 | 9 | 224 |
| 32 | NLLSModel | 729.1666666666666 | 1 | 16 | 7097.0 | 1 | 32 |
| 32 | Standalone | 574.7647058823529 | 1 | 16 | 26458.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 2 | CaNNOLeS | 13979.5 | 178 | 9568 | 4 | 1.6189e-25 | true | ok | NaN | NaN | first\_order |
| 2 | Ipopt | 643687.5 | 464 | 21136 | 4 | 5.6283e-21 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (tron) | 21416.0 | 175 | 8880 | 4 | 1.9251e-20 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (trunk) | 12020.5 | 97 | 4672 | 5 | 5.4531e-18 | true | ok | NaN | NaN | first\_order |
| 2 | LeastSquaresOptim (Dogleg) | 19125.0 | 115 | 254544 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 20854.0 | 129 | 305040 | 6 | 6.5677e-24 | true | ok | NaN | NaN | converged |
| 2 | MadNLP | 419354.5 | 622 | 50560 | 5 | 2.3252e-19 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 28834.0 | 247 | 19376 | 9 | 9.5649e-30 | true | ok | NaN | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 22271.0 | 143 | 306224 | 6 | 4.9612e-30 | true | ok | NaN | NaN | Success |
| 2 | Optim (Newton) | 9542.0 | 90 | 4144 | 4 | 1.6182e-25 | true | ok | NaN | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 10562.5 | 142 | 9184 | 4 | 1.6182e-25 | true | ok | NaN | NaN | converged |
| 2 | SecondOrderOptimization | 6916.5 | 142 | 7200 | 4 | 1.6182e-25 | true | ok | NaN | NaN | grad\_tol |
| 3 | CaNNOLeS | 15291.0 | 179 | 11968 | 4 | 3.9658e-21 | true | ok | NaN | NaN | first\_order |
| 3 | Ipopt | 638916.5 | 466 | 22288 | 4 | 5.1672e-21 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (tron) | 76583.5 | 340 | 17024 | 5 | 3.1245e-17 | true | ok | NaN | NaN | small\_residual |
| 3 | JSOSolvers (trunk) | 17395.5 | 107 | 5344 | 5 | 3.7634e-27 | true | ok | NaN | NaN | first\_order |
| 3 | LeastSquaresOptim (Dogleg) | 19563.0 | 115 | 256176 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 25042.0 | 147 | 357920 | 7 | 1.4591e-28 | true | ok | NaN | NaN | converged |
| 3 | MadNLP | 430020.5 | 667 | 51792 | 5 | 0.0000e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 33479.0 | 247 | 21280 | 9 | 1.7690e-28 | true | ok | NaN | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 23104.5 | 163 | 360096 | 7 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 3 | Optim (Newton) | 10125.0 | 90 | 4208 | 4 | 3.9658e-21 | true | ok | NaN | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 16041.0 | 142 | 10944 | 4 | 3.9658e-21 | true | ok | NaN | NaN | converged |
| 3 | SecondOrderOptimization | 7229.0 | 142 | 7920 | 4 | 3.9658e-21 | true | ok | NaN | NaN | grad\_tol |
| 4 | CaNNOLeS | 18146.0 | 180 | 15600 | 4 | 3.9389e-19 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 657437.5 | 468 | 24576 | 4 | 2.1071e-19 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 39041.5 | 202 | 10912 | 5 | 1.6739e-22 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 24000.0 | 113 | 6000 | 6 | 4.6487e-19 | true | ok | NaN | NaN | first\_order |
| 4 | LeastSquaresOptim (Dogleg) | 21854.5 | 115 | 258368 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 26667.0 | 147 | 360896 | 7 | 4.7229e-27 | true | ok | NaN | NaN | converged |
| 4 | MadNLP | 435500.0 | 676 | 52848 | 5 | 1.4348e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 38396.0 | 247 | 25088 | 9 | 7.4205e-27 | true | ok | NaN | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 27354.5 | 163 | 364752 | 7 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 4 | Optim (Newton) | 10583.0 | 90 | 4464 | 4 | 3.9389e-19 | true | ok | NaN | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 20083.0 | 173 | 15696 | 4 | 1.0934e-19 | true | ok | NaN | NaN | converged |
| 4 | SecondOrderOptimization | 7770.5 | 142 | 9312 | 4 | 3.9389e-19 | true | ok | NaN | NaN | grad\_tol |
| 5 | CaNNOLeS | 21833.5 | 180 | 18976 | 4 | 5.9917e-18 | true | ok | NaN | NaN | first\_order |
| 5 | Ipopt | 681333.5 | 468 | 26080 | 4 | 5.8004e-19 | true | ok | NaN | NaN | first\_order |
| 5 | JSOSolvers (tron) | 62000.0 | 234 | 12672 | 5 | 7.0196e-18 | true | ok | NaN | NaN | small\_residual |
| 5 | JSOSolvers (trunk) | 36250.0 | 126 | 6816 | 6 | 1.2827e-24 | true | ok | NaN | NaN | first\_order |
| 5 | LeastSquaresOptim (Dogleg) | 23896.0 | 115 | 260400 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 28458.0 | 147 | 363760 | 7 | 5.5611e-26 | true | ok | NaN | NaN | converged |
| 5 | MadNLP | 986333.0 | 1740 | 70928 | 9 | 3.9460e-16 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 5 | NonlinearSolve (LM) | 48583.5 | 256 | 29936 | 10 | 3.3383e-28 | true | ok | NaN | NaN | Success |
| 5 | NonlinearSolve (TrustRegion) | 29479.5 | 163 | 369472 | 7 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 5 | Optim (Newton) | 13292.0 | 103 | 5056 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 23875.0 | 183 | 19216 | 4 | 4.0699e-21 | true | ok | NaN | NaN | converged |
| 5 | SecondOrderOptimization | 9375.0 | 142 | 10528 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 6 | CaNNOLeS | 26375.0 | 180 | 23440 | 4 | 3.7251e-17 | true | ok | NaN | NaN | first\_order |
| 6 | Ipopt | 705187.5 | 468 | 27664 | 4 | 2.2659e-18 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (tron) | 78417.0 | 241 | 13632 | 5 | 1.6782e-18 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (trunk) | 43708.0 | 125 | 7232 | 6 | 5.4384e-20 | true | ok | NaN | NaN | first\_order |
| 6 | LeastSquaresOptim (Dogleg) | 22500.0 | 115 | 262432 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 34666.5 | 147 | 366304 | 7 | 3.5728e-25 | true | ok | NaN | NaN | converged |
| 6 | MadNLP | 454500.5 | 703 | 55360 | 5 | 9.8329e-24 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 55583.0 | 256 | 35936 | 10 | 4.4207e-28 | true | ok | NaN | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 39125.5 | 203 | 482304 | 8 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 6 | Optim (Newton) | 14291.5 | 103 | 5408 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 27645.5 | 183 | 23536 | 4 | 3.7581e-19 | true | ok | NaN | NaN | converged |
| 6 | SecondOrderOptimization | 10208.0 | 142 | 12512 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 8 | CaNNOLeS | 45000.0 | 184 | 36752 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 862750.0 | 529 | 39760 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 112208.5 | 241 | 14928 | 5 | 7.4382e-18 | true | ok | NaN | NaN | small\_residual |
| 8 | JSOSolvers (trunk) | 188458.0 | 413 | 28144 | 6 | 4.1070e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8 | LeastSquaresOptim (Dogleg) | 33562.5 | 121 | 267552 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 43292.0 | 155 | 372896 | 7 | 5.1141e-24 | true | ok | NaN | NaN | converged |
| 8 | MadNLP | 503187.0 | 676 | 57648 | 5 | 4.9304e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 75687.5 | 260 | 51808 | 10 | 6.2136e-28 | true | ok | NaN | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 58666.5 | 200 | 449328 | 8 | 1.4794e-28 | true | ok | NaN | NaN | Success |
| 8 | Optim (Newton) | 16000.0 | 103 | 5952 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 47771.5 | 215 | 38720 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 8 | SecondOrderOptimization | 12604.5 | 142 | 16528 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 10 | CaNNOLeS | 63000.0 | 184 | 50144 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 10 | Ipopt | 956166.5 | 529 | 46368 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (tron) | 369145.5 | 420 | 24944 | 6 | 3.6246e-18 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (trunk) | 228000.0 | 417 | 29472 | 6 | 3.1212e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 10 | LeastSquaresOptim (Dogleg) | 36312.0 | 121 | 273536 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 59104.0 | 155 | 380496 | 7 | 3.2293e-23 | true | ok | NaN | NaN | converged |
| 10 | MadNLP | 655604.0 | 712 | 61408 | 8 | 5.2546e-25 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 109229.5 | 260 | 75296 | 10 | 9.9518e-28 | true | ok | NaN | NaN | Success |
| 10 | NonlinearSolve (TrustRegion) | 78875.0 | 222 | 537856 | 9 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 10 | Optim (Newton) | 20041.5 | 103 | 6864 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 64250.5 | 225 | 53792 | 5 | 1.5587e-28 | true | ok | NaN | NaN | converged |
| 10 | SecondOrderOptimization | 15625.0 | 142 | 22480 | 5 | 0.0000e+00 | true | ok | NaN | NaN | step\_size |
| 14 | CaNNOLeS | 116646.0 | 198 | 95968 | 5 | 1.3174e-30 | true | ok | NaN | NaN | first\_order |
| 14 | Ipopt | 1.44225e6 | 549 | 75728 | 5 | 2.4918e-30 | true | ok | NaN | NaN | first\_order |
| 14 | JSOSolvers (tron) | 709146.0 | 427 | 28656 | 6 | 2.0865e-17 | true | ok | NaN | NaN | small\_residual |
| 14 | JSOSolvers (trunk) | 236000.0 | 151 | 13408 | 7 | 6.9868e-19 | true | ok | NaN | NaN | first\_order |
| 14 | LeastSquaresOptim (Dogleg) | 81417.0 | 140 | 342048 | 6 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 100771.0 | 155 | 398080 | 7 | 3.6854e-22 | true | ok | NaN | NaN | converged |
| 14 | MadNLP | 925188.0 | 712 | 69376 | 8 | 2.5028e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 201520.5 | 260 | 135568 | 10 | 2.6611e-27 | true | ok | NaN | NaN | Success |
| 14 | NonlinearSolve (TrustRegion) | 271375.0 | 398 | 1165952 | 15 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 14 | Optim (Newton) | 31062.5 | 103 | 8592 | 5 | 1.3174e-30 | true | ok | NaN | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 115354.5 | 225 | 80752 | 5 | 6.0723e-24 | true | ok | NaN | NaN | converged |
| 14 | SecondOrderOptimization | 30708.0 | 142 | 35072 | 5 | 1.3174e-30 | true | ok | NaN | NaN | grad\_tol |
| 18 | CaNNOLeS | 197396.0 | 204 | 155056 | 5 | 6.8473e-30 | true | ok | NaN | NaN | first\_order |
| 18 | Ipopt | 1.932375e6 | 551 | 105184 | 5 | 5.3613e-30 | true | ok | NaN | NaN | first\_order |
| 18 | JSOSolvers (tron) | 808687.5 | 307 | 27616 | 6 | 3.6409e-19 | true | ok | NaN | NaN | first\_order |
| 18 | JSOSolvers (trunk) | 598083.0 | 431 | 36800 | 7 | 3.0513e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 18 | LeastSquaresOptim (Dogleg) | 134542.0 | 140 | 373488 | 6 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 18 | LeastSquaresOptim (LM) | 203271.0 | 174 | 486080 | 8 | 3.1543e-28 | true | ok | NaN | NaN | converged |
| 18 | MadNLP | 1.339979e6 | 733 | 80336 | 9 | 0.0000e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 18 | NonlinearSolve (LM) | 395917.0 | 291 | 252784 | 11 | 6.1295e-27 | true | ok | NaN | NaN | Success |
| 18 | NonlinearSolve (TrustRegion) | 190875.0 | 146 | 88144 | 8 | 1.7118e-30 | true | ok | NaN | NaN | Success |
| 18 | Optim (Newton) | 53458.5 | 110 | 11936 | 5 | 2.8125e-22 | true | ok | NaN | NaN | converged |
| 18 | Optim (NewtonTrustRegion) | 181416.5 | 251 | 127168 | 5 | 2.7030e-21 | true | ok | NaN | NaN | converged |
| 18 | SecondOrderOptimization | 49083.5 | 160 | 71344 | 6 | 2.1916e-25 | true | ok | NaN | NaN | grad\_tol |
| 22 | CaNNOLeS | 296979.0 | 227 | 204304 | 5 | 2.0693e-29 | true | ok | NaN | NaN | first\_order |
| 22 | Ipopt | 2.6160835e6 | 574 | 133328 | 5 | 3.5223e-29 | true | ok | NaN | NaN | first\_order |
| 22 | JSOSolvers (tron) | 1.977125e6 | 446 | 38672 | 6 | 2.9533e-17 | true | ok | NaN | NaN | small\_residual |
| 22 | JSOSolvers (trunk) | 866625.0 | 435 | 40608 | 7 | 1.1930e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 22 | LeastSquaresOptim (Dogleg) | 235750.0 | 147 | 402912 | 7 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 22 | LeastSquaresOptim (LM) | 364187.5 | 177 | 517984 | 8 | 1.0407e-27 | true | ok | NaN | NaN | converged |
| 22 | MadNLP | 1.9230625e6 | 774 | 93776 | 8 | 1.5438e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 22 | NonlinearSolve (LM) | 728083.5 | 321 | 385392 | 11 | 8.8713e-27 | true | ok | NaN | NaN | Success |
| 22 | NonlinearSolve (TrustRegion) | 494375.5 | 155 | 136800 | 13 | 1.4772e-28 | true | ok | NaN | NaN | Success |
| 22 | Optim (Newton) | 79666.5 | 110 | 14240 | 5 | 2.1694e-20 | true | ok | NaN | NaN | converged |
| 22 | Optim (NewtonTrustRegion) | 253770.5 | 251 | 161856 | 5 | 1.3762e-19 | true | ok | NaN | NaN | converged |
| 22 | SecondOrderOptimization | 68562.5 | 162 | 92896 | 6 | 5.2314e-24 | true | ok | NaN | NaN | grad\_tol |
| 26 | CaNNOLeS | 407375.0 | 235 | 319888 | 5 | 7.2901e-29 | true | ok | NaN | NaN | first\_order |
| 26 | Ipopt | 3.6935415e6 | 588 | 198192 | 5 | 2.3308e-28 | true | ok | NaN | NaN | first\_order |
| 26 | JSOSolvers (tron) | 1.4908335e6 | 297 | 39280 | 6 | 5.7235e-19 | true | ok | NaN | NaN | first\_order |
| 26 | JSOSolvers (trunk) | 1.276e6 | 455 | 48064 | 8 | 7.2530e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 26 | LeastSquaresOptim (Dogleg) | 366166.5 | 147 | 445696 | 7 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 26 | LeastSquaresOptim (LM) | 570459.0 | 177 | 562464 | 8 | 2.5016e-27 | true | ok | NaN | NaN | converged |
| 26 | MadNLP | 2.447021e6 | 678 | 106720 | 9 | 1.9990e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 26 | NonlinearSolve (LM) | 1.0969375e6 | 321 | 580640 | 11 | 9.9184e-27 | true | ok | NaN | NaN | Success |
| 26 | NonlinearSolve (TrustRegion) | 889583.0 | 155 | 213184 | 13 | 5.4963e-27 | true | ok | NaN | NaN | Success |
| 26 | Optim (Newton) | 121396.0 | 110 | 18672 | 5 | 5.8386e-19 | true | ok | NaN | NaN | converged |
| 26 | Optim (NewtonTrustRegion) | 368042.0 | 293 | 265232 | 5 | 1.1437e-20 | true | ok | NaN | NaN | converged |
| 26 | SecondOrderOptimization | 88250.0 | 162 | 133904 | 6 | 8.0256e-23 | true | ok | NaN | NaN | grad\_tol |
| 32 | CaNNOLeS | 616896.0 | 240 | 445280 | 5 | 2.2626e-28 | true | ok | NaN | NaN | first\_order |
| 32 | Ipopt | 5.311146e6 | 588 | 258544 | 5 | 8.2823e-28 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (tron) | 2.384875e6 | 303 | 54768 | 7 | 4.3948e-19 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 1.682791e6 | 445 | 60336 | 7 | 7.7107e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 32 | LeastSquaresOptim (Dogleg) | 653729.0 | 147 | 531008 | 7 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 1.1589585e6 | 177 | 652160 | 8 | 6.1838e-27 | true | ok | NaN | NaN | converged |
| 32 | MadNLP | 1.1573292e7 | 1824 | 156880 | 14 | 9.1250e-17 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 32 | NonlinearSolve (LM) | 2.060542e6 | 347 | 1005968 | 13 | 1.7816e-26 | true | ok | NaN | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 1.816396e6 | 155 | 365648 | 14 | 9.0379e-28 | true | ok | NaN | NaN | Success |
| 32 | Optim (Newton) | 233479.0 | 123 | 23648 | 6 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 542750.0 | 305 | 366080 | 5 | 6.7447e-21 | true | ok | NaN | NaN | converged |
| 32 | SecondOrderOptimization | 121541.5 | 162 | 178944 | 6 | 1.8370e-21 | true | ok | NaN | NaN | grad\_tol |
