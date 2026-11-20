# Benchmark Results: Dense Multi-dimensional Rosenbrock

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:59:11
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
| 2 | JuMP | 1083.3157894736842 | 5 | 80 | 2016.7 | 9 | 224 |
| 2 | NLLSModel | 61.54716981132076 | 1 | 16 | 218.29347826086956 | 1 | 32 |
| 2 | Standalone | 70.48051948051948 | 1 | 16 | 205.19354838709677 | 1 | 32 |
| 3 | JuMP | 1198.5294117647059 | 5 | 80 | 2250.0 | 9 | 224 |
| 3 | NLLSModel | 63.59442724458204 | 1 | 16 | 254.5731707317073 | 1 | 32 |
| 3 | Standalone | 75.11036789297658 | 1 | 16 | 301.92753623188406 | 1 | 32 |
| 4 | JuMP | 1430.5333333333333 | 5 | 80 | 2904.714285714286 | 9 | 224 |
| 4 | NLLSModel | 66.00294985250737 | 1 | 16 | 296.7846153846154 | 1 | 32 |
| 4 | Standalone | 79.5880149812734 | 1 | 16 | 330.8358208955224 | 1 | 32 |
| 5 | JuMP | 1760.4166666666667 | 5 | 80 | 3722.3333333333335 | 9 | 224 |
| 5 | NLLSModel | 69.94155844155844 | 1 | 16 | 354.9107142857143 | 1 | 32 |
| 5 | Standalone | 85.832 | 1 | 16 | 423.0769230769231 | 1 | 32 |
| 6 | JuMP | 2129.2 | 5 | 80 | 4791.6 | 9 | 224 |
| 6 | NLLSModel | 73.44147157190635 | 1 | 16 | 420.21276595744683 | 1 | 32 |
| 6 | Standalone | 115.9957627118644 | 1 | 16 | 461.1818181818182 | 1 | 32 |
| 8 | JuMP | 3166.5714285714284 | 5 | 80 | 8111.333333333333 | 9 | 224 |
| 8 | NLLSModel | 85.80508474576271 | 1 | 16 | 647.125 | 1 | 32 |
| 8 | Standalone | 130.9814814814815 | 1 | 16 | 628.90625 | 1 | 32 |
| 10 | JuMP | 4641.6 | 5 | 80 | 13667.0 | 9 | 224 |
| 10 | NLLSModel | 101.4074074074074 | 1 | 16 | 893.0869565217391 | 1 | 32 |
| 10 | Standalone | 145.36363636363637 | 1 | 16 | 989.55 | 1 | 32 |
| 14 | JuMP | 9139.0 | 5 | 80 | 42000.0 | 9 | 224 |
| 14 | NLLSModel | 159.2325581395349 | 1 | 16 | 1532.076923076923 | 1 | 32 |
| 14 | Standalone | 184.7704918032787 | 1 | 16 | 2222.222222222222 | 1 | 32 |
| 18 | JuMP | 14833.0 | 5 | 80 | 70041.0 | 9 | 224 |
| 18 | NLLSModel | 250.48275862068965 | 1 | 16 | 2337.8888888888887 | 1 | 32 |
| 18 | Standalone | 239.247311827957 | 1 | 16 | 4183.4 | 1 | 32 |
| 22 | JuMP | 22000.0 | 5 | 80 | 143750.0 | 9 | 224 |
| 22 | NLLSModel | 349.0327868852459 | 1 | 16 | 3395.8333333333335 | 1 | 32 |
| 22 | Standalone | 310.9855072463768 | 1 | 16 | 8389.0 | 1 | 32 |
| 26 | JuMP | 30333.0 | 5 | 80 | 201542.0 | 9 | 224 |
| 26 | NLLSModel | 464.8222222222222 | 1 | 16 | 4616.6 | 1 | 32 |
| 26 | Standalone | 398.9074074074074 | 1 | 16 | 13792.0 | 1 | 32 |
| 32 | JuMP | 45833.0 | 5 | 80 | 400083.0 | 9 | 224 |
| 32 | NLLSModel | 686.8387096774194 | 1 | 16 | 6889.0 | 1 | 32 |
| 32 | Standalone | 565.2972972972973 | 1 | 16 | 24917.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 2 | CaNNOLeS | 12354.5 | 178 | 9568 | 4 | 1.6189e-25 | true | ok | NaN | NaN | first\_order |
| 2 | Ipopt | 612750.0 | 472 | 21536 | 4 | 5.6283e-21 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (tron) | 18250.0 | 175 | 8880 | 4 | 1.9251e-20 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (trunk) | 10937.5 | 97 | 4672 | 5 | 5.4531e-18 | true | ok | NaN | NaN | first\_order |
| 2 | LeastSquaresOptim (Dogleg) | 21604.0 | 115 | 254544 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 24979.0 | 129 | 305040 | 6 | 6.5677e-24 | true | ok | NaN | NaN | converged |
| 2 | MadNLP | 383479.0 | 622 | 50560 | 5 | 2.3252e-19 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 29896.0 | 247 | 19376 | 9 | 9.5649e-30 | true | ok | NaN | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 29874.5 | 143 | 306224 | 6 | 4.9612e-30 | true | ok | NaN | NaN | Success |
| 2 | Optim (Newton) | 9458.0 | 90 | 4144 | 4 | 1.6182e-25 | true | ok | NaN | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 10541.5 | 146 | 9312 | 4 | 1.6182e-25 | true | ok | NaN | NaN | converged |
| 2 | SecondOrderOptimization | 6625.0 | 142 | 7200 | 4 | 1.6182e-25 | true | ok | NaN | NaN | grad\_tol |
| 3 | CaNNOLeS | 14500.0 | 179 | 11968 | 4 | 3.9658e-21 | true | ok | NaN | NaN | first\_order |
| 3 | Ipopt | 614167.0 | 474 | 22688 | 4 | 5.1672e-21 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (tron) | 122333.0 | 340 | 17024 | 5 | 3.1245e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 3 | JSOSolvers (trunk) | 16250.0 | 107 | 5344 | 5 | 3.7634e-27 | true | ok | NaN | NaN | first\_order |
| 3 | LeastSquaresOptim (Dogleg) | 21874.5 | 115 | 256176 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 29854.0 | 147 | 357920 | 7 | 1.4591e-28 | true | ok | NaN | NaN | converged |
| 3 | MadNLP | 414479.5 | 667 | 51792 | 5 | 0.0000e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 34875.5 | 247 | 21280 | 9 | 1.7690e-28 | true | ok | NaN | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 31812.5 | 163 | 360096 | 7 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 3 | Optim (Newton) | 10208.5 | 90 | 4208 | 4 | 3.9658e-21 | true | ok | NaN | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 15791.5 | 146 | 11072 | 4 | 3.9658e-21 | true | ok | NaN | NaN | converged |
| 3 | SecondOrderOptimization | 7062.5 | 142 | 7920 | 4 | 3.9658e-21 | true | ok | NaN | NaN | grad\_tol |
| 4 | CaNNOLeS | 17604.5 | 180 | 15600 | 4 | 3.9389e-19 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 636896.0 | 476 | 24976 | 4 | 2.1071e-19 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 36417.0 | 202 | 10912 | 5 | 1.6739e-22 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 22520.5 | 113 | 6000 | 6 | 4.6487e-19 | true | ok | NaN | NaN | first\_order |
| 4 | LeastSquaresOptim (Dogleg) | 24396.0 | 115 | 258368 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 33562.5 | 147 | 360896 | 7 | 4.7229e-27 | true | ok | NaN | NaN | converged |
| 4 | MadNLP | 428104.0 | 676 | 52848 | 5 | 1.4348e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 41312.5 | 247 | 25088 | 9 | 7.4205e-27 | true | ok | NaN | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 36041.5 | 163 | 364752 | 7 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 4 | Optim (Newton) | 10750.0 | 90 | 4464 | 4 | 3.9389e-19 | true | ok | NaN | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 20292.0 | 177 | 15824 | 4 | 1.0934e-19 | true | ok | NaN | NaN | converged |
| 4 | SecondOrderOptimization | 7791.5 | 142 | 9312 | 4 | 3.9389e-19 | true | ok | NaN | NaN | grad\_tol |
| 5 | CaNNOLeS | 21104.0 | 180 | 18976 | 4 | 5.9917e-18 | true | ok | NaN | NaN | first\_order |
| 5 | Ipopt | 663187.5 | 476 | 26480 | 4 | 5.8004e-19 | true | ok | NaN | NaN | first\_order |
| 5 | JSOSolvers (tron) | 112541.0 | 234 | 12672 | 5 | 7.0196e-18 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 5 | JSOSolvers (trunk) | 34750.0 | 126 | 6816 | 6 | 1.2827e-24 | true | ok | NaN | NaN | first\_order |
| 5 | LeastSquaresOptim (Dogleg) | 26229.0 | 115 | 260400 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 33625.0 | 147 | 363760 | 7 | 5.5611e-26 | true | ok | NaN | NaN | converged |
| 5 | MadNLP | 946500.0 | 1740 | 70928 | 9 | 3.9460e-16 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 5 | NonlinearSolve (LM) | 51395.5 | 256 | 29936 | 10 | 3.3383e-28 | true | ok | NaN | NaN | Success |
| 5 | NonlinearSolve (TrustRegion) | 38208.5 | 163 | 369472 | 7 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 5 | Optim (Newton) | 13500.0 | 103 | 5056 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 5 | Optim (NewtonTrustRegion) | 24145.5 | 187 | 19344 | 4 | 4.0699e-21 | true | ok | NaN | NaN | converged |
| 5 | SecondOrderOptimization | 9208.0 | 142 | 10528 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 6 | CaNNOLeS | 25625.0 | 180 | 23440 | 4 | 3.7251e-17 | true | ok | NaN | NaN | first\_order |
| 6 | Ipopt | 692125.0 | 476 | 28064 | 4 | 2.2659e-18 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (tron) | 73854.0 | 241 | 13632 | 5 | 1.6782e-18 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (trunk) | 41583.0 | 125 | 7232 | 6 | 5.4384e-20 | true | ok | NaN | NaN | first\_order |
| 6 | LeastSquaresOptim (Dogleg) | 28792.0 | 115 | 262432 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 39229.5 | 147 | 366304 | 7 | 3.5728e-25 | true | ok | NaN | NaN | converged |
| 6 | MadNLP | 442979.0 | 703 | 55360 | 5 | 9.8329e-24 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 59312.5 | 256 | 35936 | 10 | 4.4207e-28 | true | ok | NaN | NaN | Success |
| 6 | NonlinearSolve (TrustRegion) | 54521.0 | 203 | 482304 | 8 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 6 | Optim (Newton) | 14167.0 | 103 | 5408 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 27770.5 | 187 | 23664 | 4 | 3.7581e-19 | true | ok | NaN | NaN | converged |
| 6 | SecondOrderOptimization | 10125.0 | 142 | 12512 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 8 | CaNNOLeS | 42791.0 | 184 | 36752 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 848354.5 | 537 | 40160 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 163292.0 | 241 | 14928 | 5 | 7.4382e-18 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 8 | JSOSolvers (trunk) | 187750.0 | 413 | 28144 | 6 | 4.1070e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8 | LeastSquaresOptim (Dogleg) | 36104.5 | 121 | 267552 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 49145.5 | 155 | 372896 | 7 | 5.1141e-24 | true | ok | NaN | NaN | converged |
| 8 | MadNLP | 480833.5 | 676 | 57648 | 5 | 4.9304e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 79041.5 | 260 | 51808 | 10 | 6.2136e-28 | true | ok | NaN | NaN | Success |
| 8 | NonlinearSolve (TrustRegion) | 64938.0 | 200 | 449328 | 8 | 1.4794e-28 | true | ok | NaN | NaN | Success |
| 8 | Optim (Newton) | 16187.0 | 103 | 5952 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 47479.5 | 220 | 38880 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 8 | SecondOrderOptimization | 12500.0 | 142 | 16528 | 5 | 0.0000e+00 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 10 | CaNNOLeS | 61625.0 | 184 | 50144 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 10 | Ipopt | 957312.5 | 537 | 46768 | 5 | 0.0000e+00 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (tron) | 359916.0 | 420 | 24944 | 6 | 3.6246e-18 | true | ok | NaN | NaN | first\_order |
| 10 | JSOSolvers (trunk) | 227625.0 | 417 | 29472 | 6 | 3.1212e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 10 | LeastSquaresOptim (Dogleg) | 45000.0 | 121 | 273536 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 67291.0 | 155 | 380496 | 7 | 3.2293e-23 | true | ok | NaN | NaN | converged |
| 10 | MadNLP | 637416.5 | 712 | 61408 | 8 | 5.2546e-25 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 10 | NonlinearSolve (LM) | 115479.5 | 260 | 75296 | 10 | 9.9518e-28 | true | ok | NaN | NaN | Success |
| 10 | NonlinearSolve (TrustRegion) | 85188.0 | 222 | 537856 | 9 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 10 | Optim (Newton) | 19875.0 | 103 | 6864 | 5 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 63646.0 | 230 | 53952 | 5 | 1.5587e-28 | true | ok | NaN | NaN | converged |
| 10 | SecondOrderOptimization | 15520.5 | 142 | 22480 | 5 | 0.0000e+00 | true | ok | NaN | NaN | step\_size |
| 14 | CaNNOLeS | 114896.0 | 198 | 95968 | 5 | 1.3174e-30 | true | ok | NaN | NaN | first\_order |
| 14 | Ipopt | 1.3263125e6 | 557 | 76128 | 5 | 2.4918e-30 | true | ok | NaN | NaN | first\_order |
| 14 | JSOSolvers (tron) | 745542.0 | 427 | 28656 | 6 | 2.0865e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 14 | JSOSolvers (trunk) | 231208.5 | 151 | 13408 | 7 | 6.9868e-19 | true | ok | NaN | NaN | first\_order |
| 14 | LeastSquaresOptim (Dogleg) | 88937.5 | 140 | 342048 | 6 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 106062.5 | 155 | 398080 | 7 | 3.6854e-22 | true | ok | NaN | NaN | converged |
| 14 | MadNLP | 878562.5 | 712 | 69376 | 8 | 2.5028e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 14 | NonlinearSolve (LM) | 209666.5 | 260 | 135568 | 10 | 2.6611e-27 | true | ok | NaN | NaN | Success |
| 14 | NonlinearSolve (TrustRegion) | 286979.5 | 398 | 1165952 | 15 | 0.0000e+00 | true | ok | NaN | NaN | Success |
| 14 | Optim (Newton) | 30896.0 | 103 | 8592 | 5 | 1.3174e-30 | true | ok | NaN | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 112500.5 | 230 | 80912 | 5 | 6.0723e-24 | true | ok | NaN | NaN | converged |
| 14 | SecondOrderOptimization | 27875.0 | 142 | 35072 | 5 | 1.3174e-30 | true | ok | NaN | NaN | grad\_tol |
| 18 | CaNNOLeS | 193083.0 | 204 | 155056 | 5 | 6.8473e-30 | true | ok | NaN | NaN | first\_order |
| 18 | Ipopt | 1.8307495e6 | 559 | 105584 | 5 | 5.3613e-30 | true | ok | NaN | NaN | first\_order |
| 18 | JSOSolvers (tron) | 772416.5 | 307 | 27616 | 6 | 3.6409e-19 | true | ok | NaN | NaN | first\_order |
| 18 | JSOSolvers (trunk) | 579750.0 | 431 | 36800 | 7 | 3.0513e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 18 | LeastSquaresOptim (Dogleg) | 145854.5 | 140 | 373488 | 6 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 18 | LeastSquaresOptim (LM) | 215354.0 | 174 | 486080 | 8 | 3.1543e-28 | true | ok | NaN | NaN | converged |
| 18 | MadNLP | 1.243667e6 | 733 | 80336 | 9 | 0.0000e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 18 | NonlinearSolve (LM) | 403917.0 | 291 | 252784 | 11 | 6.1295e-27 | true | ok | NaN | NaN | Success |
| 18 | NonlinearSolve (TrustRegion) | 188541.5 | 146 | 88144 | 8 | 1.7118e-30 | true | ok | NaN | NaN | Success |
| 18 | Optim (Newton) | 49437.0 | 110 | 11936 | 5 | 2.8125e-22 | true | ok | NaN | NaN | converged |
| 18 | Optim (NewtonTrustRegion) | 171354.0 | 256 | 127328 | 5 | 2.7030e-21 | true | ok | NaN | NaN | converged |
| 18 | SecondOrderOptimization | 47125.0 | 160 | 71344 | 6 | 2.1916e-25 | true | ok | NaN | NaN | grad\_tol |
| 22 | CaNNOLeS | 284541.5 | 227 | 204304 | 5 | 2.0693e-29 | true | ok | NaN | NaN | first\_order |
| 22 | Ipopt | 2.510417e6 | 582 | 133728 | 5 | 3.5223e-29 | true | ok | NaN | NaN | first\_order |
| 22 | JSOSolvers (tron) | 1.974833e6 | 446 | 38672 | 6 | 2.9533e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 22 | JSOSolvers (trunk) | 790167.0 | 435 | 40608 | 7 | 1.1930e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 22 | LeastSquaresOptim (Dogleg) | 227520.5 | 147 | 402912 | 7 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 22 | LeastSquaresOptim (LM) | 366021.0 | 177 | 517984 | 8 | 1.0407e-27 | true | ok | NaN | NaN | converged |
| 22 | MadNLP | 1.894333e6 | 774 | 93776 | 8 | 1.5438e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 22 | NonlinearSolve (LM) | 751854.5 | 321 | 385392 | 11 | 8.8713e-27 | true | ok | NaN | NaN | Success |
| 22 | NonlinearSolve (TrustRegion) | 489771.0 | 155 | 136800 | 13 | 1.4772e-28 | true | ok | NaN | NaN | Success |
| 22 | Optim (Newton) | 78521.0 | 110 | 14240 | 5 | 2.1694e-20 | true | ok | NaN | NaN | converged |
| 22 | Optim (NewtonTrustRegion) | 248896.0 | 256 | 162016 | 5 | 1.3762e-19 | true | ok | NaN | NaN | converged |
| 22 | SecondOrderOptimization | 66896.0 | 162 | 92896 | 6 | 5.2314e-24 | true | ok | NaN | NaN | grad\_tol |
| 26 | CaNNOLeS | 406604.5 | 235 | 319888 | 5 | 7.2901e-29 | true | ok | NaN | NaN | first\_order |
| 26 | Ipopt | 3.392604e6 | 596 | 198592 | 5 | 2.3308e-28 | true | ok | NaN | NaN | first\_order |
| 26 | JSOSolvers (tron) | 1.46625e6 | 297 | 39280 | 6 | 5.7235e-19 | true | ok | NaN | NaN | first\_order |
| 26 | JSOSolvers (trunk) | 1.246208e6 | 455 | 48064 | 8 | 7.2530e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 26 | LeastSquaresOptim (Dogleg) | 363645.5 | 147 | 445696 | 7 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 26 | LeastSquaresOptim (LM) | 583500.0 | 177 | 562464 | 8 | 2.5016e-27 | true | ok | NaN | NaN | converged |
| 26 | MadNLP | 2.4440005e6 | 678 | 106720 | 9 | 1.9990e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 26 | NonlinearSolve (LM) | 1.114896e6 | 321 | 580640 | 11 | 9.9184e-27 | true | ok | NaN | NaN | Success |
| 26 | NonlinearSolve (TrustRegion) | 850083.5 | 155 | 213184 | 13 | 5.4963e-27 | true | ok | NaN | NaN | Success |
| 26 | Optim (Newton) | 116750.0 | 110 | 18672 | 5 | 5.8386e-19 | true | ok | NaN | NaN | converged |
| 26 | Optim (NewtonTrustRegion) | 339354.0 | 298 | 265392 | 5 | 1.1437e-20 | true | ok | NaN | NaN | converged |
| 26 | SecondOrderOptimization | 85562.5 | 162 | 133904 | 6 | 8.0256e-23 | true | ok | NaN | NaN | grad\_tol |
| 32 | CaNNOLeS | 596041.5 | 240 | 445280 | 5 | 2.2626e-28 | true | ok | NaN | NaN | first\_order |
| 32 | Ipopt | 4.964063e6 | 596 | 258944 | 5 | 8.2823e-28 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (tron) | 2.3711465e6 | 303 | 54768 | 7 | 4.3948e-19 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 1.669875e6 | 445 | 60336 | 7 | 7.7107e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 32 | LeastSquaresOptim (Dogleg) | 663187.5 | 147 | 531008 | 7 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 1.1763955e6 | 177 | 652160 | 8 | 6.1838e-27 | true | ok | NaN | NaN | converged |
| 32 | MadNLP | 1.1170541e7 | 1824 | 156880 | 14 | 9.1250e-17 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 32 | NonlinearSolve (LM) | 2.0585e6 | 347 | 1005968 | 13 | 1.7816e-26 | true | ok | NaN | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 1.7860415e6 | 155 | 365648 | 14 | 9.0379e-28 | true | ok | NaN | NaN | Success |
| 32 | Optim (Newton) | 226521.0 | 123 | 23648 | 6 | 0.0000e+00 | true | ok | NaN | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 537208.0 | 310 | 366240 | 5 | 6.7447e-21 | true | ok | NaN | NaN | converged |
| 32 | SecondOrderOptimization | 125187.5 | 162 | 178944 | 6 | 1.8370e-21 | true | ok | NaN | NaN | grad\_tol |
