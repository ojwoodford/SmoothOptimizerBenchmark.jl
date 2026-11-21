# Benchmark Results: Dense Affine Alignment

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T04:16:49
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
| 1 | JuMP | 1741.6666666666667 | 2 | 32 | 2803.5714285714284 | 5 | 128 |
| 1 | NLLSModel | 79.44357976653697 | 1 | 16 | 610.7142857142857 | 1 | 32 |
| 1 | Standalone | 87.76851851851852 | 1 | 16 | 304.95652173913044 | 1 | 32 |
| 2 | JuMP | 3506.8333333333335 | 2 | 32 | 8263.666666666666 | 5 | 128 |
| 2 | NLLSModel | 117.52717391304348 | 1 | 16 | 1195.3125 | 1 | 32 |
| 2 | Standalone | 136.7828947368421 | 1 | 16 | 602.3714285714286 | 1 | 32 |
| 3 | JuMP | 9500.0 | 2 | 32 | 39875.0 | 5 | 128 |
| 3 | NLLSModel | 202.75257731958763 | 1 | 16 | 2755.25 | 1 | 32 |
| 3 | Standalone | 214.16129032258064 | 1 | 16 | 1440.5 | 1 | 32 |
| 4 | JuMP | 19750.0 | 2 | 32 | 86500.0 | 5 | 128 |
| 4 | NLLSModel | 317.62295081967216 | 1 | 16 | 5697.75 | 1 | 32 |
| 4 | Standalone | 331.3492063492063 | 1 | 16 | 3232.1428571428573 | 1 | 32 |
| 6 | JuMP | 54292.0 | 2 | 32 | 553167.0 | 5 | 128 |
| 6 | NLLSModel | 833.3181818181819 | 1 | 16 | 84125.0 | 1 | 32 |
| 6 | Standalone | 833.2857142857143 | 1 | 16 | 17875.0 | 1 | 32 |
| 8 | JuMP | 127875.0 | 2 | 32 | 1.813917e6 | 5 | 128 |
| 8 | NLLSModel | 1232.8235294117646 | 1 | 16 | 109625.0 | 1 | 32 |
| 8 | Standalone | 1220.5882352941176 | 1 | 16 | 56833.0 | 1 | 32 |
| 12 | JuMP | 395667.0 | 2 | 32 | 1.4302416e7 | 5 | 128 |
| 12 | NLLSModel | 3722.1666666666665 | 1 | 16 | 924083.0 | 1 | 32 |
| 12 | Standalone | 4016.6 | 1 | 16 | 417375.0 | 1 | 32 |
| 16 | JuMP | 1.285333e6 | 2 | 32 | 7.0084416e7 | 5 | 128 |
| 16 | NLLSModel | 8250.0 | 1 | 16 | 4.665875e6 | 1 | 32 |
| 16 | Standalone | 7889.0 | 1 | 16 | 2.1695e6 | 1 | 32 |
| 20 | NLLSModel | 16208.0 | 1 | 16 | 1.7405041e7 | 1 | 32 |
| 20 | Standalone | 17084.0 | 1 | 16 | 7.680375e6 | 1 | 32 |
| 24 | NLLSModel | 27459.0 | 1 | 16 | 6.0955416e7 | 1 | 32 |
| 24 | Standalone | 28792.0 | 1 | 16 | 2.1777625e7 | 1 | 32 |
| 28 | NLLSModel | 48375.0 | 1 | 16 | 1.53235375e8 | 1 | 32 |
| 28 | Standalone | 50708.0 | 1 | 16 | 4.8436e7 | 1 | 32 |
| 32 | NLLSModel | 73042.0 | 1 | 16 | 3.97826542e8 | 1 | 32 |
| 32 | Standalone | 68167.0 | 1 | 16 | 1.27506375e8 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 1 | CaNNOLeS | 17375.0 | 173 | 10576 | 1 | 2.9582e-31 | true | ok | NaN | NaN | first\_order |
| 1 | Ipopt | 491562.0 | 286 | 14080 | 1 | 2.4652e-32 | true | ok | NaN | NaN | first\_order |
| 1 | JSOSolvers (tron) | 14312.5 | 134 | 7024 | 1 | 2.4652e-32 | true | ok | NaN | NaN | first\_order |
| 1 | JSOSolvers (trunk) | 6375.0 | 68 | 3376 | 1 | 5.9165e-31 | true | ok | NaN | NaN | first\_order |
| 1 | LeastSquaresOptim (Dogleg) | 17083.5 | 61 | 102640 | 2 | 2.4652e-32 | true | ok | NaN | NaN | converged |
| 1 | LeastSquaresOptim (LM) | 47874.5 | 129 | 305072 | 6 | 6.0461e-27 | true | ok | NaN | NaN | converged |
| 1 | MadNLP | 358958.0 | 565 | 49120 | 1 | 2.4652e-32 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1 | NonlinearSolve (LM) | 40666.5 | 238 | 18512 | 8 | 1.4046e-27 | true | ok | NaN | NaN | Success |
| 1 | NonlinearSolve (TrustRegion) | 26562.5 | 83 | 153904 | 3 | 2.9582e-31 | true | ok | NaN | NaN | Success |
| 1 | Optim (Newton) | 5937.5 | 51 | 2672 | 1 | 2.4652e-32 | true | ok | NaN | NaN | converged |
| 1 | Optim (NewtonTrustRegion) | 6770.5 | 61 | 3792 | 1 | 2.4652e-32 | true | ok | NaN | NaN | converged |
| 1 | SecondOrderOptimization | 17834.0 | 222 | 10432 | 2 | 1.6466e-26 | true | ok | NaN | NaN | grad\_tol |
| 2 | CaNNOLeS | 53812.5 | 180 | 33664 | 3 | 1.5681e-21 | true | ok | NaN | NaN | first\_order |
| 2 | Ipopt | 814875.0 | 400 | 26064 | 3 | 1.7745e-21 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (tron) | 84812.5 | 183 | 10624 | 4 | 3.9099e-17 | true | ok | NaN | NaN | small\_residual |
| 2 | JSOSolvers (trunk) | 77437.5 | 117 | 6656 | 5 | 1.8468e-26 | true | ok | NaN | NaN | first\_order |
| 2 | LeastSquaresOptim (Dogleg) | 44667.0 | 97 | 210112 | 4 | 8.8747e-31 | true | ok | NaN | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 55458.5 | 129 | 314000 | 6 | 7.7484e-26 | true | ok | NaN | NaN | converged |
| 2 | MadNLP | 437833.0 | 581 | 52592 | 3 | 5.1040e-21 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 70875.0 | 238 | 30384 | 8 | 3.0007e-26 | true | ok | NaN | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 56104.5 | 123 | 267440 | 5 | 1.6763e-30 | true | ok | NaN | NaN | Success |
| 2 | Optim (Newton) | 13166.5 | 77 | 4304 | 3 | 1.5681e-21 | true | ok | NaN | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 32187.5 | 115 | 14832 | 3 | 1.5681e-21 | true | ok | NaN | NaN | converged |
| 2 | SecondOrderOptimization | 41833.0 | 366 | 19888 | 3 | 1.5684e-21 | true | ok | NaN | NaN | grad\_tol |
| 3 | CaNNOLeS | 156770.5 | 199 | 111424 | 3 | 4.0027e-20 | true | ok | NaN | NaN | first\_order |
| 3 | Ipopt | 1.4001255e6 | 403 | 44224 | 3 | 2.9303e-19 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (tron) | 904479.0 | 374 | 21904 | 6 | 1.3728e-17 | true | ok | NaN | NaN | small\_residual |
| 3 | JSOSolvers (trunk) | 873459.0 | 390 | 27392 | 5 | 3.2338e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 3 | LeastSquaresOptim (Dogleg) | 47917.0 | 102 | 220736 | 4 | 4.8318e-30 | true | ok | NaN | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 79250.0 | 136 | 329408 | 6 | 4.6088e-25 | true | ok | NaN | NaN | converged |
| 3 | MadNLP | 523375.0 | 581 | 61488 | 3 | 5.8727e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 128499.5 | 251 | 70688 | 9 | 1.0401e-26 | true | ok | NaN | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 62709.0 | 134 | 295664 | 5 | 5.4234e-30 | true | ok | NaN | NaN | Success |
| 3 | Optim (Newton) | 17041.5 | 77 | 6560 | 3 | 4.0026e-20 | true | ok | NaN | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 60770.5 | 118 | 32208 | 3 | 4.0027e-20 | true | ok | NaN | NaN | converged |
| 3 | SecondOrderOptimization | 60041.5 | 474 | 38272 | 3 | 4.0516e-20 | true | ok | NaN | NaN | grad\_tol |
| 4 | CaNNOLeS | 356271.0 | 209 | 296464 | 3 | 1.3283e-17 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 4.7594585e6 | 460 | 80880 | 4 | 2.0539e-27 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 2.766875e6 | 406 | 26048 | 5 | 2.6585e-17 | true | ok | NaN | NaN | small\_residual |
| 4 | JSOSolvers (trunk) | 1.236666e6 | 421 | 30832 | 6 | 5.1931e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4 | LeastSquaresOptim (Dogleg) | 84521.0 | 102 | 239600 | 4 | 1.3016e-29 | true | ok | NaN | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 162874.5 | 155 | 412960 | 7 | 8.9150e-27 | true | ok | NaN | NaN | converged |
| 4 | MadNLP | 790750.0 | 589 | 81600 | 4 | 1.6727e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 793729.0 | 544 | 386848 | 34 | 4.4940e-26 | true | ok | NaN | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 81458.5 | 146 | 42928 | 11 | 9.9594e-30 | true | ok | NaN | NaN | Success |
| 4 | Optim (Newton) | 35812.5 | 92 | 12240 | 4 | 1.2622e-29 | true | ok | NaN | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 180770.5 | 159 | 86736 | 4 | 1.0255e-29 | true | ok | NaN | NaN | converged |
| 4 | SecondOrderOptimization | 116583.0 | 696 | 79456 | 4 | 1.0650e-29 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 6 | CaNNOLeS | 1.734437e6 | 213 | 1428240 | 3 | 2.8826e-17 | true | ok | NaN | NaN | first\_order |
| 6 | Ipopt | 3.9907917e7 | 468 | 293840 | 4 | 1.4594e-28 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (tron) | 4.587e6 | 231 | 25776 | 4 | 2.4899e-17 | true | ok | NaN | NaN | small\_residual |
| 6 | JSOSolvers (trunk) | 3.7079585e6 | 149 | 17888 | 6 | 2.6670e-18 | true | ok | NaN | NaN | first\_order |
| 6 | LeastSquaresOptim (Dogleg) | 391979.0 | 102 | 308784 | 4 | 3.3132e-29 | true | ok | NaN | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 675250.0 | 136 | 451488 | 6 | 8.1525e-24 | true | ok | NaN | NaN | converged |
| 6 | MadNLP | 2.8014375e6 | 613 | 187776 | 4 | 2.2210e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 1.0607667e7 | 1437 | 3594288 | 115 | 1.7564e-25 | true | ok | NaN | NaN | StalledSuccess |
| 6 | NonlinearSolve (TrustRegion) | 456896.0 | 146 | 141568 | 11 | 3.3921e-29 | true | ok | NaN | NaN | Success |
| 6 | Optim (Newton) | 132104.0 | 92 | 35280 | 4 | 3.7076e-29 | true | ok | NaN | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 757041.5 | 163 | 263136 | 4 | 3.1160e-29 | true | ok | NaN | NaN | converged |
| 6 | SecondOrderOptimization | 297062.0 | 956 | 271792 | 4 | 3.4710e-29 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 8 | CaNNOLeS | 7.651313e6 | 241 | 4084144 | 4 | 9.1902e-29 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 1.89633146e8 | 504 | 1005360 | 4 | 1.2038e-27 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 3.3188771e7 | 424 | 45152 | 5 | 6.8101e-19 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 1.1104771e7 | 165 | 26176 | 7 | 3.6406e-18 | true | ok | NaN | NaN | first\_order |
| 8 | LeastSquaresOptim (Dogleg) | 1.3285e6 | 105 | 447536 | 4 | 1.0452e-28 | true | ok | NaN | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 2.9690835e6 | 158 | 714208 | 7 | 1.1942e-26 | true | ok | NaN | NaN | converged |
| 8 | MadNLP | 9.7288125e6 | 621 | 456304 | 5 | 9.1019e-22 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 3.2659667e7 | 1701 | 7443808 | 117 | 2.9385e-25 | true | ok | NaN | NaN | StalledSuccess |
| 8 | NonlinearSolve (TrustRegion) | 1.843521e6 | 155 | 386624 | 11 | 1.0610e-28 | true | ok | NaN | NaN | Success |
| 8 | Optim (Newton) | 400250.0 | 92 | 107024 | 4 | 1.0334e-28 | true | ok | NaN | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 2.046979e6 | 163 | 764640 | 4 | 1.0334e-28 | true | ok | NaN | NaN | converged |
| 8 | SecondOrderOptimization | 715584.0 | 1221 | 751184 | 4 | 7.9675e-29 | true | ok | NaN | NaN | step\_size |
| 12 | CaNNOLeS | 5.4557021e7 | 250 | 18123072 | 4 | 3.5341e-28 | true | ok | NaN | NaN | first\_order |
| 12 | Ipopt | 2.820632416e9 | 510 | 3814256 | 4 | 9.7005e-23 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (tron) | 1.656934165e8 | 441 | 80816 | 5 | 4.0091e-17 | true | ok | NaN | NaN | small\_residual |
| 12 | JSOSolvers (trunk) | 6.40104375e7 | 191 | 53888 | 7 | 4.9518e-18 | true | ok | NaN | NaN | first\_order |
| 12 | LeastSquaresOptim (Dogleg) | 1.19432495e7 | 109 | 1159088 | 4 | 3.4552e-28 | true | ok | NaN | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 2.59920625e7 | 165 | 1666208 | 7 | 9.4146e-26 | true | ok | NaN | NaN | converged |
| 12 | MadNLP | 5.4977083e7 | 613 | 1767488 | 4 | 2.0341e-21 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 1.932025e8 | 1701 | 16886416 | 117 | 1.0631e-24 | true | ok | NaN | NaN | StalledSuccess |
| 12 | NonlinearSolve (TrustRegion) | 1.64526045e7 | 155 | 1722592 | 11 | 3.4394e-28 | true | ok | NaN | NaN | Success |
| 12 | Optim (Newton) | 2.608333e6 | 92 | 408208 | 4 | 3.3605e-28 | true | ok | NaN | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 1.18709795e7 | 167 | 2845440 | 4 | 3.2974e-28 | true | ok | NaN | NaN | converged |
| 12 | SecondOrderOptimization | 3.6603125e6 | 1741 | 3382000 | 4 | 3.5341e-28 | true | ok | NaN | NaN | step\_size |
| 16 | CaNNOLeS | 2.646471255e8 | 262 | 58078208 | 4 | 7.8728e-28 | true | ok | NaN | NaN | first\_order |
| 16 | Ipopt | 2.9507992417e10 | 518 | 14112784 | 4 | 8.6456e-24 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (tron) | 3.36761375e8 | 333 | 118560 | 5 | 8.4470e-18 | true | ok | NaN | NaN | small\_residual |
| 16 | JSOSolvers (trunk) | 2.42008708e8 | 224 | 86928 | 7 | 2.0273e-18 | true | ok | NaN | NaN | first\_order |
| 16 | LeastSquaresOptim (Dogleg) | 7.30518545e7 | 143 | 2973696 | 5 | 6.8946e-28 | true | ok | NaN | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 1.10506125e8 | 181 | 3862544 | 7 | 9.4413e-25 | true | ok | NaN | NaN | converged |
| 16 | MadNLP | 4.09973208e8 | 648 | 5220080 | 6 | 7.6993e-28 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 7.60020708e8 | 1905 | 33140544 | 114 | 2.9784e-23 | true | ok | NaN | NaN | StalledSuccess |
| 16 | NonlinearSolve (TrustRegion) | 8.11160835e7 | 174 | 5204048 | 8 | 2.3259e-26 | true | ok | NaN | NaN | Success |
| 16 | Optim (Newton) | 1.20986045e7 | 100 | 1237712 | 4 | 7.9990e-28 | true | ok | NaN | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 3.8542833e7 | 182 | 8370992 | 4 | 7.9833e-28 | true | ok | NaN | NaN | converged |
| 16 | SecondOrderOptimization | 1.5157167e7 | 2272 | 10309920 | 4 | 8.6617e-28 | true | ok | NaN | NaN | grad\_tol |
| 20 | CaNNOLeS | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | Ipopt | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | LeastSquaresOptim (Dogleg) | 2.06441459e8 | 143 | 6342736 | 5 | 1.3742e-27 | true | ok | NaN | NaN | converged |
| 20 | LeastSquaresOptim (LM) | 3.57372667e8 | 181 | 12413056 | 7 | 6.3357e-24 | true | ok | NaN | NaN | converged |
| 20 | MadNLP | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | NonlinearSolve (LM) | 2.645880667e9 | 1905 | 65021376 | 114 | 9.3268e-23 | true | ok | NaN | NaN | StalledSuccess |
| 20 | NonlinearSolve (TrustRegion) | 3.135078125e8 | 174 | 12418128 | 9 | 1.4831e-27 | true | ok | NaN | NaN | Success |
| 20 | Optim (Newton) | 3.8889062e7 | 100 | 2884880 | 4 | 1.5146e-27 | true | ok | NaN | NaN | converged |
| 20 | Optim (NewtonTrustRegion) | 1.10667542e8 | 182 | 19273520 | 4 | 1.5367e-27 | true | ok | NaN | NaN | converged |
| 20 | SecondOrderOptimization | 4.64815e7 | 2792 | 24624176 | 4 | 1.5272e-27 | true | ok | NaN | NaN | grad\_tol |
| 24 | CaNNOLeS | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | Ipopt | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | LeastSquaresOptim (Dogleg) | 4.55961458e8 | 121 | 12078704 | 4 | 3.4284e-27 | true | ok | NaN | NaN | converged |
| 24 | LeastSquaresOptim (LM) | 9.939962915e8 | 181 | 15658336 | 7 | 2.5861e-25 | true | ok | NaN | NaN | converged |
| 24 | MadNLP | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | NonlinearSolve (LM) | 6.752838042e9 | 1951 | 102690400 | 117 | 1.0728e-23 | true | ok | NaN | NaN | StalledSuccess |
| 24 | NonlinearSolve (TrustRegion) | 8.709318745e8 | 174 | 25302608 | 8 | 6.8741e-27 | true | ok | NaN | NaN | Success |
| 24 | Optim (Newton) | 1.15704209e8 | 100 | 10827728 | 4 | 3.3811e-27 | true | ok | NaN | NaN | converged |
| 24 | Optim (NewtonTrustRegion) | 3.02809062e8 | 182 | 46473520 | 4 | 3.4536e-27 | true | ok | NaN | NaN | converged |
| 24 | SecondOrderOptimization | 1.241762295e8 | 3310 | 50280736 | 4 | 3.2895e-27 | true | ok | NaN | NaN | step\_size |
| 28 | CaNNOLeS | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | Ipopt | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | LeastSquaresOptim (Dogleg) | 1.340809666e9 | 143 | 22036800 | 5 | 5.8376e-27 | true | ok | NaN | NaN | converged |
| 28 | LeastSquaresOptim (LM) | 2.340664791e9 | 181 | 27917776 | 7 | 1.9822e-23 | true | ok | NaN | NaN | converged |
| 28 | MadNLP | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | NonlinearSolve (LM) | 1.5685969667e10 | 1906 | 163401424 | 114 | 3.9787e-23 | true | ok | NaN | NaN | StalledSuccess |
| 28 | NonlinearSolve (TrustRegion) | 2.158589e9 | 174 | 47976016 | 9 | 6.2399e-27 | true | ok | NaN | NaN | Success |
| 28 | Optim (Newton) | 2.71097354e8 | 100 | 10615824 | 4 | 6.5870e-27 | true | ok | NaN | NaN | converged |
| 28 | Optim (NewtonTrustRegion) | 6.50689e8 | 182 | 69933360 | 4 | 6.3914e-27 | true | ok | NaN | NaN | converged |
| 28 | SecondOrderOptimization | 2.73773042e8 | 3832 | 92663728 | 4 | 6.5854e-27 | true | ok | NaN | NaN | grad\_tol |
| 32 | CaNNOLeS | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | Ipopt | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | LeastSquaresOptim (Dogleg) | 3.258089417e9 | 143 | 36671968 | 5 | 1.0325e-26 | true | ok | NaN | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 5.310763625e9 | 181 | 46368432 | 7 | 9.4120e-23 | true | ok | NaN | NaN | converged |
| 32 | MadNLP | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | NonlinearSolve (LM) | 3.0067837584e10 | 1681 | 239781632 | 99 | 1.4841e-22 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 32 | NonlinearSolve (TrustRegion) | 4.732621e9 | 174 | 80798288 | 9 | 1.1317e-26 | true | ok | NaN | NaN | Success |
| 32 | Optim (Newton) | 6.85479834e8 | 100 | 22208272 | 4 | 1.1259e-26 | true | ok | NaN | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 1.464544083e9 | 182 | 117894448 | 4 | 1.1249e-26 | true | ok | NaN | NaN | converged |
| 32 | SecondOrderOptimization | 6.293304165e8 | 4352 | 174553632 | 4 | 1.1393e-26 | true | ok | NaN | NaN | grad\_tol |
