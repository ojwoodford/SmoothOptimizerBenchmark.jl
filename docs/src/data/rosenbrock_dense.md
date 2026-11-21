# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:34:29
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
| 2 | JuMP | 1127.2105263157894 | 5 | 80 | 2245.3333333333335 | 9 | 224 |
| 2 | NLLSModel | 55.36657681940701 | 1 | 16 | 233.93975903614458 | 1 | 32 |
| 2 | Standalone | 75.80936454849498 | 1 | 16 | 215.4431818181818 | 1 | 32 |
| 3 | JuMP | 1218.1176470588234 | 5 | 80 | 2319.4444444444443 | 9 | 224 |
| 3 | NLLSModel | 58.85175202156334 | 1 | 16 | 250.59154929577466 | 1 | 32 |
| 3 | Standalone | 77.65384615384616 | 1 | 16 | 294.14925373134326 | 1 | 32 |
| 4 | JuMP | 1479.142857142857 | 5 | 80 | 3011.8571428571427 | 9 | 224 |
| 4 | NLLSModel | 59.52291105121294 | 1 | 16 | 305.55 | 1 | 32 |
| 4 | Standalone | 82.71161048689139 | 1 | 16 | 313.4920634920635 | 1 | 32 |
| 5 | JuMP | 1785.7142857142858 | 5 | 80 | 4152.666666666667 | 9 | 224 |
| 5 | NLLSModel | 62.55840455840456 | 1 | 16 | 398.2307692307692 | 1 | 32 |
| 5 | Standalone | 87.57203389830508 | 1 | 16 | 395.4313725490196 | 1 | 32 |
| 6 | JuMP | 2179.1 | 5 | 80 | 5187.5 | 9 | 224 |
| 6 | NLLSModel | 67.10914454277287 | 1 | 16 | 463.16279069767444 | 1 | 32 |
| 6 | Standalone | 118.37272727272727 | 1 | 16 | 440.34090909090907 | 1 | 32 |
| 8 | JuMP | 3244.0 | 5 | 80 | 8222.0 | 9 | 224 |
| 8 | NLLSModel | 104.76618705035972 | 1 | 16 | 661.1 | 1 | 32 |
| 8 | Standalone | 126.29533678756476 | 1 | 16 | 627.8620689655172 | 1 | 32 |
| 10 | JuMP | 4700.0 | 5 | 80 | 14875.0 | 9 | 224 |
| 10 | NLLSModel | 117.6829268292683 | 1 | 16 | 918.4782608695652 | 1 | 32 |
| 10 | Standalone | 138.64327485380116 | 1 | 16 | 1033.3 | 1 | 32 |
| 14 | JuMP | 9375.0 | 5 | 80 | 43166.0 | 9 | 224 |
| 14 | NLLSModel | 171.12857142857143 | 1 | 16 | 1557.6923076923076 | 1 | 32 |
| 14 | Standalone | 182.74015748031496 | 1 | 16 | 2314.777777777778 | 1 | 32 |
| 18 | JuMP | 15292.0 | 5 | 80 | 70416.0 | 9 | 224 |
| 18 | NLLSModel | 320.825 | 1 | 16 | 2578.125 | 1 | 32 |
| 18 | Standalone | 238.23529411764707 | 1 | 16 | 4291.6 | 1 | 32 |
| 22 | JuMP | 23417.0 | 5 | 80 | 148834.0 | 9 | 224 |
| 22 | NLLSModel | 336.3636363636364 | 1 | 16 | 3500.0 | 1 | 32 |
| 22 | Standalone | 336.75409836065575 | 1 | 16 | 8541.666666666666 | 1 | 32 |
| 26 | JuMP | 31000.0 | 5 | 80 | 204333.0 | 9 | 224 |
| 26 | NLLSModel | 784.18 | 1 | 16 | 4791.8 | 1 | 32 |
| 26 | Standalone | 406.25 | 1 | 16 | 14541.0 | 1 | 32 |
| 32 | JuMP | 47542.0 | 5 | 80 | 397000.0 | 9 | 224 |
| 32 | NLLSModel | 416.66 | 1 | 16 | 7194.666666666667 | 1 | 32 |
| 32 | Standalone | 578.3030303030303 | 1 | 16 | 25333.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 2 | CaNNOLeS | 13062.5 | 178 | 9568 | 4 | 1.6189e-25 | true | ok | NaN | NaN | first\_order |
| 2 | Ipopt | 615354.5 | 464 | 21136 | 4 | 5.6283e-21 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (tron) | 20104.0 | 175 | 8880 | 4 | 1.9251e-20 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (trunk) | 11708.0 | 97 | 4672 | 5 | 5.4531e-18 | true | ok | NaN | NaN | first\_order |
| 2 | LeastSquaresOptim (Dogleg) | 17812.5 | 115 | 254544 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 19021.0 | 129 | 305040 | 6 | 6.5677e-24 | true | ok | NaN | NaN | converged |
| 2 | MadNLP | 425708.5 | 622 | 50560 | 5 | 2.3252e-19 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 33000.0 | 247 | 19376 | 9 | 9.5649e-30 | true | ok | NaN | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 25020.5 | 143 | 306224 | 6 | 4.9612e-30 | true | ok | NaN | NaN | Success |
| 2 | Optim (Newton) | 10000.0 | 90 | 4144 | 4 | 1.6182e-25 | true | ok | NaN | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 11062.5 | 142 | 9184 | 4 | 1.6182e-25 | true | ok | NaN | NaN | converged |
| 2 | SecondOrderOptimization | 7062.5 | 142 | 7200 | 4 | 1.6182e-25 | true | ok | NaN | NaN | grad\_tol |
| 3 | CaNNOLeS | 16062.5 | 179 | 11968 | 4 | 3.9658e-21 | true | ok | NaN | NaN | first\_order |
| 3 | Ipopt | 675667.0 | 466 | 22288 | 4 | 5.1672e-21 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (tron) | 76937.5 | 340 | 17024 | 5 | 3.1245e-17 | true | ok | NaN | NaN | small\_residual |
| 3 | JSOSolvers (trunk) | 17167.0 | 107 | 5344 | 5 | 3.7634e-27 | true | ok | NaN | NaN | first\_order |
| 3 | LeastSquaresOptim (Dogleg) | 18667.0 | 115 | 256176 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 27458.0 | 147 | 357920 | 7 | 1.4591e-28 | true | ok | NaN | NaN | converged |
| 3 | MadNLP | 493333.5 | 667 | 51792 | 5 | 0.0000e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 34583.5 | 247 | 21280 | 9 | 1.7690e-28 | true | ok | NaN | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 27062.5 | 163 | 360096 | 7 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 3 | Optim (Newton) | 10250.0 | 90 | 4208 | 4 | 3.9658e-21 | true | ok | NaN | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 16229.5 | 142 | 10944 | 4 | 3.9658e-21 | true | ok | NaN | NaN | converged |
| 3 | SecondOrderOptimization | 7333.0 | 142 | 7920 | 4 | 3.9658e-21 | true | ok | NaN | NaN | grad\_tol |
| 4 | CaNNOLeS | 18229.0 | 180 | 15600 | 4 | 3.9389e-19 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 656375.0 | 468 | 24576 | 4 | 2.1071e-19 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 39791.5 | 202 | 10912 | 5 | 1.6739e-22 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 24229.5 | 113 | 6000 | 6 | 4.6487e-19 | true | ok | NaN | NaN | first\_order |
| 4 | LeastSquaresOptim (Dogleg) | 17770.5 | 115 | 258368 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 27521.0 | 147 | 360896 | 7 | 4.7229e-27 | true | ok | NaN | NaN | converged |
| 4 | MadNLP | 498312.5 | 676 | 52848 | 5 | 1.4348e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 42416.5 | 247 | 25088 | 9 | 7.4205e-27 | true | ok | NaN | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 31250.0 | 163 | 364752 | 7 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 4 | Optim (Newton) | 10354.5 | 90 | 4464 | 4 | 3.9389e-19 | true | ok | NaN | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 20292.0 | 173 | 15696 | 4 | 1.0934e-19 | true | ok | NaN | NaN | converged |
| 4 | SecondOrderOptimization | 7667.0 | 142 | 9312 | 4 | 3.9389e-19 | true | ok | NaN | NaN | grad\_tol |
| 5 | CaNNOLeS | 22479.5 | 180 | 18976 | 4 | 5.9917e-18 | true | ok | NaN | NaN | first\_order |
| 5 | Ipopt | 740333.5 | 468 | 26080 | 4 | 5.8004e-19 | true | ok | NaN | NaN | first\_order |
| 5 | JSOSolvers (tron) | 61666.5 | 234 | 12672 | 5 | 7.0196e-18 | true | ok | NaN | NaN | small\_residual |
| 5 | JSOSolvers (trunk) | 36292.0 | 126 | 6816 | 6 | 1.2827e-24 | true | ok | NaN | NaN | first\_order |
| 5 | LeastSquaresOptim (Dogleg) | 19166.5 | 115 | 260400 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 31833.0 | 147 | 363760 | 7 | 5.5611e-26 | true | ok | NaN | NaN | converged |
| 5 | MadNLP | 1.012291e6 | 1740 | 70928 | 9 | 3.9460e-16 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 5 | NonlinearSolve (LM) | 49604.0 | 256 | 29936 | 10 | 3.3383e-28 | true | ok | NaN | NaN | Success |
| 5 | NonlinearSolve (TrustRegion) | 34750.0 | 163 | 369472 | 7 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 5 | Optim (Newton) | 13270.5 | 103 | 5056 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 25000.0 | 183 | 19216 | 4 | 4.0699e-21 | true | ok | NaN | NaN | converged |
| 5 | SecondOrderOptimization | 9542.0 | 142 | 10528 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 6 | CaNNOLeS | 26354.0 | 180 | 23440 | 4 | 3.7251e-17 | true | ok | NaN | NaN | first\_order |
| 6 | Ipopt | 695854.0 | 468 | 27664 | 4 | 2.2659e-18 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (tron) | 78979.5 | 241 | 13632 | 5 | 1.6782e-18 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (trunk) | 43125.0 | 125 | 7232 | 6 | 5.4384e-20 | true | ok | NaN | NaN | first\_order |
| 6 | LeastSquaresOptim (Dogleg) | 25229.5 | 115 | 262432 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 35417.0 | 147 | 366304 | 7 | 3.5728e-25 | true | ok | NaN | NaN | converged |
| 6 | MadNLP | 459771.0 | 703 | 55360 | 5 | 9.8329e-24 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 56250.0 | 256 | 35936 | 10 | 4.4207e-28 | true | ok | NaN | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 44062.5 | 203 | 482304 | 8 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 6 | Optim (Newton) | 14375.0 | 103 | 5408 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 28603.5 | 183 | 23536 | 4 | 3.7581e-19 | true | ok | NaN | NaN | converged |
| 6 | SecondOrderOptimization | 10250.0 | 142 | 12512 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 8 | CaNNOLeS | 44291.0 | 184 | 36752 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 859792.0 | 529 | 39760 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 112563.0 | 241 | 14928 | 5 | 7.4382e-18 | true | ok | NaN | NaN | small\_residual |
| 8 | JSOSolvers (trunk) | 186000.0 | 413 | 28144 | 6 | 4.1070e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8 | LeastSquaresOptim (Dogleg) | 26729.0 | 121 | 267552 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 37979.0 | 155 | 372896 | 7 | 5.1141e-24 | true | ok | NaN | NaN | converged |
| 8 | MadNLP | 515541.5 | 676 | 57648 | 5 | 4.9304e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 79250.0 | 260 | 51808 | 10 | 6.2136e-28 | true | ok | NaN | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 57729.5 | 200 | 449328 | 8 | 1.4794e-28 | true | ok | NaN | NaN | Success |
| 8 | Optim (Newton) | 17083.0 | 103 | 5952 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 50208.0 | 215 | 38720 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 8 | SecondOrderOptimization | 13000.5 | 142 | 16528 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 10 | CaNNOLeS | 67583.5 | 184 | 50144 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 10 | Ipopt | 967083.5 | 529 | 46368 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (tron) | 369271.5 | 420 | 24944 | 6 | 3.6246e-18 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (trunk) | 227500.0 | 417 | 29472 | 6 | 3.1212e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 10 | LeastSquaresOptim (Dogleg) | 37541.5 | 121 | 273536 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 57542.0 | 155 | 380496 | 7 | 3.2293e-23 | true | ok | NaN | NaN | converged |
| 10 | MadNLP | 666042.0 | 712 | 61408 | 8 | 5.2546e-25 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 107042.0 | 260 | 75296 | 10 | 9.9518e-28 | true | ok | NaN | NaN | Success |
| 10 | NonlinearSolve (TrustRegion) | 78375.0 | 222 | 537856 | 9 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 10 | Optim (Newton) | 19625.0 | 103 | 6864 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 66083.0 | 225 | 53792 | 5 | 1.5587e-28 | true | ok | NaN | NaN | converged |
| 10 | SecondOrderOptimization | 16625.5 | 142 | 22480 | 5 | 0.0000e+00 | true | ok | NaN | NaN | step\_size |
| 14 | CaNNOLeS | 121937.0 | 198 | 95968 | 5 | 1.3174e-30 | true | ok | NaN | NaN | first\_order |
| 14 | Ipopt | 1.3325e6 | 549 | 75728 | 5 | 2.4918e-30 | true | ok | NaN | NaN | first\_order |
| 14 | JSOSolvers (tron) | 699854.0 | 427 | 28656 | 6 | 2.0865e-17 | true | ok | NaN | NaN | small\_residual |
| 14 | JSOSolvers (trunk) | 234770.5 | 151 | 13408 | 7 | 6.9868e-19 | true | ok | NaN | NaN | first\_order |
| 14 | LeastSquaresOptim (Dogleg) | 79104.0 | 140 | 342048 | 6 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 106187.5 | 155 | 398080 | 7 | 3.6854e-22 | true | ok | NaN | NaN | converged |
| 14 | MadNLP | 930020.5 | 712 | 69376 | 8 | 2.5028e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 201458.0 | 260 | 135568 | 10 | 2.6611e-27 | true | ok | NaN | NaN | Success |
| 14 | NonlinearSolve (TrustRegion) | 267041.5 | 398 | 1165952 | 15 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 14 | Optim (Newton) | 30770.5 | 103 | 8592 | 5 | 1.3174e-30 | true | ok | NaN | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 108979.0 | 225 | 80752 | 5 | 6.0723e-24 | true | ok | NaN | NaN | converged |
| 14 | SecondOrderOptimization | 25625.0 | 142 | 35072 | 5 | 1.3174e-30 | true | ok | NaN | NaN | grad\_tol |
| 18 | CaNNOLeS | 194937.5 | 204 | 155056 | 5 | 6.8473e-30 | true | ok | NaN | NaN | first\_order |
| 18 | Ipopt | 1.8177505e6 | 551 | 105184 | 5 | 5.3613e-30 | true | ok | NaN | NaN | first\_order |
| 18 | JSOSolvers (tron) | 759083.5 | 307 | 27616 | 6 | 3.6409e-19 | true | ok | NaN | NaN | first\_order |
| 18 | JSOSolvers (trunk) | 558417.0 | 431 | 36800 | 7 | 3.0513e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 18 | LeastSquaresOptim (Dogleg) | 134083.5 | 140 | 373488 | 6 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 18 | LeastSquaresOptim (LM) | 205312.5 | 174 | 486080 | 8 | 3.1543e-28 | true | ok | NaN | NaN | converged |
| 18 | MadNLP | 1.252146e6 | 733 | 80336 | 9 | 0.0000e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 18 | NonlinearSolve (LM) | 380250.0 | 291 | 252784 | 11 | 6.1295e-27 | true | ok | NaN | NaN | Success |
| 18 | NonlinearSolve (TrustRegion) | 187646.0 | 146 | 88144 | 8 | 1.7118e-30 | true | ok | NaN | NaN | Success |
| 18 | Optim (Newton) | 50958.0 | 110 | 11936 | 5 | 2.8125e-22 | true | ok | NaN | NaN | converged |
| 18 | Optim (NewtonTrustRegion) | 162062.5 | 251 | 127168 | 5 | 2.7030e-21 | true | ok | NaN | NaN | converged |
| 18 | SecondOrderOptimization | 43333.5 | 160 | 71344 | 6 | 2.1916e-25 | true | ok | NaN | NaN | grad\_tol |
| 22 | CaNNOLeS | 278917.0 | 227 | 204304 | 5 | 2.0693e-29 | true | ok | NaN | NaN | first\_order |
| 22 | Ipopt | 2.5097085e6 | 574 | 133328 | 5 | 3.5223e-29 | true | ok | NaN | NaN | first\_order |
| 22 | JSOSolvers (tron) | 2.02875e6 | 446 | 38672 | 6 | 2.9533e-17 | true | ok | NaN | NaN | small\_residual |
| 22 | JSOSolvers (trunk) | 879583.0 | 435 | 40608 | 7 | 1.1930e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 22 | LeastSquaresOptim (Dogleg) | 213562.5 | 147 | 402912 | 7 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 22 | LeastSquaresOptim (LM) | 338728.5 | 177 | 517984 | 8 | 1.0407e-27 | true | ok | NaN | NaN | converged |
| 22 | MadNLP | 1.9415e6 | 774 | 93776 | 8 | 1.5438e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 22 | NonlinearSolve (LM) | 721854.0 | 321 | 385392 | 11 | 8.8713e-27 | true | ok | NaN | NaN | Success |
| 22 | NonlinearSolve (TrustRegion) | 495458.0 | 155 | 136800 | 13 | 1.4772e-28 | true | ok | NaN | NaN | Success |
| 22 | Optim (Newton) | 79750.0 | 110 | 14240 | 5 | 2.1694e-20 | true | ok | NaN | NaN | converged |
| 22 | Optim (NewtonTrustRegion) | 238521.0 | 251 | 161856 | 5 | 1.3762e-19 | true | ok | NaN | NaN | converged |
| 22 | SecondOrderOptimization | 66625.0 | 162 | 92896 | 6 | 5.2314e-24 | true | ok | NaN | NaN | grad\_tol |
| 26 | CaNNOLeS | 414187.5 | 235 | 319888 | 5 | 7.2901e-29 | true | ok | NaN | NaN | first\_order |
| 26 | Ipopt | 3.337e6 | 588 | 198192 | 5 | 2.3308e-28 | true | ok | NaN | NaN | first\_order |
| 26 | JSOSolvers (tron) | 1.490084e6 | 297 | 39280 | 6 | 5.7235e-19 | true | ok | NaN | NaN | first\_order |
| 26 | JSOSolvers (trunk) | 1.296625e6 | 455 | 48064 | 8 | 7.2530e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 26 | LeastSquaresOptim (Dogleg) | 350333.0 | 147 | 445696 | 7 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 26 | LeastSquaresOptim (LM) | 660666.5 | 177 | 562464 | 8 | 2.5016e-27 | true | ok | NaN | NaN | converged |
| 26 | MadNLP | 2.8809165e6 | 678 | 106720 | 9 | 1.9990e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 26 | NonlinearSolve (LM) | 1.177792e6 | 321 | 580640 | 11 | 9.9184e-27 | true | ok | NaN | NaN | Success |
| 26 | NonlinearSolve (TrustRegion) | 907145.5 | 155 | 213184 | 13 | 5.4963e-27 | true | ok | NaN | NaN | Success |
| 26 | Optim (Newton) | 130979.0 | 110 | 18672 | 5 | 5.8386e-19 | true | ok | NaN | NaN | converged |
| 26 | Optim (NewtonTrustRegion) | 357812.0 | 293 | 265232 | 5 | 1.1437e-20 | true | ok | NaN | NaN | converged |
| 26 | SecondOrderOptimization | 82000.0 | 162 | 133904 | 6 | 8.0256e-23 | true | ok | NaN | NaN | grad\_tol |
| 32 | CaNNOLeS | 594917.0 | 240 | 445280 | 5 | 2.2626e-28 | true | ok | NaN | NaN | first\_order |
| 32 | Ipopt | 4.950792e6 | 588 | 258544 | 5 | 8.2823e-28 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (tron) | 2.335542e6 | 303 | 54768 | 7 | 4.3948e-19 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 1.647334e6 | 445 | 60336 | 7 | 7.7107e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 32 | LeastSquaresOptim (Dogleg) | 651646.0 | 147 | 531008 | 7 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 1.4799375e6 | 177 | 652160 | 8 | 6.1838e-27 | true | ok | NaN | NaN | converged |
| 32 | MadNLP | 1.2188708e7 | 1824 | 156880 | 14 | 9.1250e-17 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 32 | NonlinearSolve (LM) | 2.115146e6 | 347 | 1005968 | 13 | 1.7816e-26 | true | ok | NaN | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 1.928667e6 | 155 | 365648 | 14 | 9.0379e-28 | true | ok | NaN | NaN | Success |
| 32 | Optim (Newton) | 248416.5 | 123 | 23648 | 6 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 562959.0 | 305 | 366080 | 5 | 6.7447e-21 | true | ok | NaN | NaN | converged |
| 32 | SecondOrderOptimization | 131687.5 | 162 | 178944 | 6 | 1.8370e-21 | true | ok | NaN | NaN | grad\_tol |
