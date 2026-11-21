# Benchmark Results: Dense Affine Alignment

- **Category**: small_dense
- **Scaling Metric**: Dimension n
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:23:17
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
| 1 | JuMP | 1419.642857142857 | 2 | 32 | 2781.25 | 5 | 128 |
| 1 | NLLSModel | 101.0 | 1 | 16 | 617.8571428571429 | 1 | 32 |
| 1 | Standalone | 89.11483253588517 | 1 | 16 | 303.0967741935484 | 1 | 32 |
| 2 | JuMP | 3472.3333333333335 | 2 | 32 | 8097.0 | 5 | 128 |
| 2 | NLLSModel | 160.55434782608697 | 1 | 16 | 1208.3333333333333 | 1 | 32 |
| 2 | Standalone | 134.40243902439025 | 1 | 16 | 605.3823529411765 | 1 | 32 |
| 3 | JuMP | 9430.666666666666 | 2 | 32 | 41167.0 | 5 | 128 |
| 3 | NLLSModel | 236.57777777777778 | 1 | 16 | 2849.0 | 1 | 32 |
| 3 | Standalone | 225.69791666666666 | 1 | 16 | 1461.357142857143 | 1 | 32 |
| 4 | JuMP | 21000.0 | 2 | 32 | 83292.0 | 5 | 128 |
| 4 | NLLSModel | 360.671875 | 1 | 16 | 4000.0 | 1 | 32 |
| 4 | Standalone | 341.2413793103448 | 1 | 16 | 3476.285714285714 | 1 | 32 |
| 6 | JuMP | 59125.0 | 2 | 32 | 533958.0 | 5 | 128 |
| 6 | NLLSModel | 796.5 | 1 | 16 | 11000.0 | 1 | 32 |
| 6 | Standalone | 814.0769230769231 | 1 | 16 | 18375.0 | 1 | 32 |
| 8 | JuMP | 121125.0 | 2 | 32 | 1.721292e6 | 5 | 128 |
| 8 | NLLSModel | 748.5 | 1 | 16 | 38125.0 | 1 | 32 |
| 8 | Standalone | 1169.0 | 1 | 16 | 57208.0 | 1 | 32 |
| 12 | JuMP | 454125.0 | 2 | 32 | 1.2496208e7 | 5 | 128 |
| 12 | NLLSModel | 1664.0625 | 1 | 16 | 261250.0 | 1 | 32 |
| 12 | Standalone | 3775.0 | 1 | 16 | 300042.0 | 1 | 32 |
| 16 | JuMP | 1.607375e6 | 2 | 32 | 5.8507709e7 | 5 | 128 |
| 16 | NLLSModel | 5166.7 | 1 | 16 | 1.806083e6 | 1 | 32 |
| 16 | Standalone | 8180.333333333333 | 1 | 16 | 1.004583e6 | 1 | 32 |
| 20 | NLLSModel | 10167.0 | 1 | 16 | 4.847291e6 | 1 | 32 |
| 20 | Standalone | 17917.0 | 1 | 16 | 4.105458e6 | 1 | 32 |
| 24 | NLLSModel | 27542.0 | 1 | 16 | 1.7463708e7 | 1 | 32 |
| 24 | Standalone | 27417.0 | 1 | 16 | 7.424083e6 | 1 | 32 |
| 28 | NLLSModel | 327583.0 | 1 | 16 | 4.5280542e7 | 1 | 32 |
| 28 | Standalone | 45333.0 | 1 | 16 | 1.3545334e7 | 1 | 32 |
| 32 | NLLSModel | 39917.0 | 1 | 16 | 1.12476917e8 | 1 | 32 |
| 32 | Standalone | 70958.0 | 1 | 16 | 4.8528417e7 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 1 | CaNNOLeS | 32021.0 | 173 | 10576 | 1 | 2.9582e-31 | true | ok | NaN | NaN | first\_order |
| 1 | Ipopt | 552812.0 | 286 | 14080 | 1 | 2.4652e-32 | true | ok | NaN | NaN | first\_order |
| 1 | JSOSolvers (tron) | 38583.0 | 134 | 7024 | 1 | 2.4652e-32 | true | ok | NaN | NaN | first\_order |
| 1 | JSOSolvers (trunk) | 25791.5 | 68 | 3376 | 1 | 5.9165e-31 | true | ok | NaN | NaN | first\_order |
| 1 | LeastSquaresOptim (Dogleg) | 21833.0 | 61 | 102640 | 2 | 2.4652e-32 | true | ok | NaN | NaN | converged |
| 1 | LeastSquaresOptim (LM) | 43687.5 | 129 | 305072 | 6 | 6.0461e-27 | true | ok | NaN | NaN | converged |
| 1 | MadNLP | 395021.0 | 565 | 49120 | 1 | 2.4652e-32 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1 | NonlinearSolve (LM) | 43979.0 | 238 | 18512 | 8 | 1.4046e-27 | true | ok | NaN | NaN | Success |
| 1 | NonlinearSolve (TrustRegion) | 23375.0 | 83 | 153904 | 3 | 2.9582e-31 | true | ok | NaN | NaN | Success |
| 1 | Optim (Newton) | 8479.5 | 51 | 2672 | 1 | 2.4652e-32 | true | ok | NaN | NaN | converged |
| 1 | Optim (NewtonTrustRegion) | 8250.0 | 61 | 3792 | 1 | 2.4652e-32 | true | ok | NaN | NaN | converged |
| 1 | SecondOrderOptimization | 27541.5 | 222 | 10432 | 2 | 1.6466e-26 | true | ok | NaN | NaN | grad\_tol |
| 2 | CaNNOLeS | 56416.5 | 180 | 33664 | 3 | 1.5681e-21 | true | ok | NaN | NaN | first\_order |
| 2 | Ipopt | 771583.5 | 400 | 26064 | 3 | 1.7745e-21 | true | ok | NaN | NaN | first\_order |
| 2 | JSOSolvers (tron) | 102603.5 | 183 | 10624 | 4 | 3.9099e-17 | true | ok | NaN | NaN | small\_residual |
| 2 | JSOSolvers (trunk) | 87812.0 | 117 | 6656 | 5 | 1.8468e-26 | true | ok | NaN | NaN | first\_order |
| 2 | LeastSquaresOptim (Dogleg) | 41249.5 | 97 | 210112 | 4 | 8.8747e-31 | true | ok | NaN | NaN | converged |
| 2 | LeastSquaresOptim (LM) | 55624.5 | 129 | 314000 | 6 | 7.7484e-26 | true | ok | NaN | NaN | converged |
| 2 | MadNLP | 430625.0 | 581 | 52592 | 3 | 5.1040e-21 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2 | NonlinearSolve (LM) | 57896.0 | 238 | 30384 | 8 | 3.0007e-26 | true | ok | NaN | NaN | Success |
| 2 | NonlinearSolve (TrustRegion) | 46083.5 | 123 | 267440 | 5 | 1.6763e-30 | true | ok | NaN | NaN | Success |
| 2 | Optim (Newton) | 12667.0 | 77 | 4304 | 3 | 1.5681e-21 | true | ok | NaN | NaN | converged |
| 2 | Optim (NewtonTrustRegion) | 27125.0 | 115 | 14832 | 3 | 1.5681e-21 | true | ok | NaN | NaN | converged |
| 2 | SecondOrderOptimization | 37375.0 | 366 | 19888 | 3 | 1.5684e-21 | true | ok | NaN | NaN | grad\_tol |
| 3 | CaNNOLeS | 134021.0 | 199 | 111424 | 3 | 4.0027e-20 | true | ok | NaN | NaN | first\_order |
| 3 | Ipopt | 1.362833e6 | 403 | 44224 | 3 | 2.9303e-19 | true | ok | NaN | NaN | first\_order |
| 3 | JSOSolvers (tron) | 918208.5 | 374 | 21904 | 6 | 1.3728e-17 | true | ok | NaN | NaN | small\_residual |
| 3 | JSOSolvers (trunk) | 654500.0 | 390 | 27392 | 5 | 3.2338e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 3 | LeastSquaresOptim (Dogleg) | 49312.0 | 102 | 220736 | 4 | 4.8318e-30 | true | ok | NaN | NaN | converged |
| 3 | LeastSquaresOptim (LM) | 71520.5 | 136 | 329408 | 6 | 4.6088e-25 | true | ok | NaN | NaN | converged |
| 3 | MadNLP | 510854.0 | 581 | 61488 | 3 | 5.8727e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 3 | NonlinearSolve (LM) | 115291.5 | 251 | 70688 | 9 | 1.0401e-26 | true | ok | NaN | NaN | Success |
| 3 | NonlinearSolve (TrustRegion) | 68646.0 | 134 | 295664 | 5 | 5.4234e-30 | true | ok | NaN | NaN | Success |
| 3 | Optim (Newton) | 17270.5 | 77 | 6560 | 3 | 4.0026e-20 | true | ok | NaN | NaN | converged |
| 3 | Optim (NewtonTrustRegion) | 54708.0 | 118 | 32208 | 3 | 4.0027e-20 | true | ok | NaN | NaN | converged |
| 3 | SecondOrderOptimization | 55333.0 | 474 | 38272 | 3 | 4.0516e-20 | true | ok | NaN | NaN | grad\_tol |
| 4 | CaNNOLeS | 350562.0 | 209 | 296464 | 3 | 1.3283e-17 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 4.5042295e6 | 460 | 80880 | 4 | 2.0539e-27 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 3.4987495e6 | 406 | 26048 | 5 | 2.6585e-17 | true | ok | NaN | NaN | small\_residual |
| 4 | JSOSolvers (trunk) | 1.425625e6 | 421 | 30832 | 6 | 5.1931e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4 | LeastSquaresOptim (Dogleg) | 93083.5 | 102 | 239600 | 4 | 1.3016e-29 | true | ok | NaN | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 166000.0 | 155 | 412960 | 7 | 8.9150e-27 | true | ok | NaN | NaN | converged |
| 4 | MadNLP | 997125.0 | 589 | 81600 | 4 | 1.6727e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | NonlinearSolve (LM) | 751937.5 | 544 | 386848 | 34 | 4.4940e-26 | true | ok | NaN | NaN | Success |
| 4 | NonlinearSolve (TrustRegion) | 75812.5 | 146 | 42928 | 11 | 9.9594e-30 | true | ok | NaN | NaN | Success |
| 4 | Optim (Newton) | 39375.0 | 92 | 12240 | 4 | 1.2622e-29 | true | ok | NaN | NaN | converged |
| 4 | Optim (NewtonTrustRegion) | 169125.0 | 159 | 86736 | 4 | 1.0255e-29 | true | ok | NaN | NaN | converged |
| 4 | SecondOrderOptimization | 63229.0 | 716 | 79872 | 4 | 1.0650e-29 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 6 | CaNNOLeS | 1.6885205e6 | 213 | 1428240 | 3 | 2.8826e-17 | true | ok | NaN | NaN | first\_order |
| 6 | Ipopt | 3.8112542e7 | 468 | 293840 | 4 | 1.4594e-28 | true | ok | NaN | NaN | first\_order |
| 6 | JSOSolvers (tron) | 4.865146e6 | 231 | 25776 | 4 | 2.4899e-17 | true | ok | NaN | NaN | small\_residual |
| 6 | JSOSolvers (trunk) | 3.692896e6 | 149 | 17888 | 6 | 2.6670e-18 | true | ok | NaN | NaN | first\_order |
| 6 | LeastSquaresOptim (Dogleg) | 391396.5 | 102 | 308784 | 4 | 3.3132e-29 | true | ok | NaN | NaN | converged |
| 6 | LeastSquaresOptim (LM) | 687833.5 | 136 | 451488 | 6 | 8.1525e-24 | true | ok | NaN | NaN | converged |
| 6 | MadNLP | 2.698854e6 | 613 | 187776 | 4 | 2.2210e-23 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 6 | NonlinearSolve (LM) | 1.0249771e7 | 1437 | 3594288 | 115 | 1.7564e-25 | true | ok | NaN | NaN | StalledSuccess |
| 6 | NonlinearSolve (TrustRegion) | 444542.0 | 146 | 141568 | 11 | 3.3921e-29 | true | ok | NaN | NaN | Success |
| 6 | Optim (Newton) | 131021.0 | 92 | 35280 | 4 | 3.7076e-29 | true | ok | NaN | NaN | converged |
| 6 | Optim (NewtonTrustRegion) | 755250.0 | 163 | 263136 | 4 | 3.1160e-29 | true | ok | NaN | NaN | converged |
| 6 | SecondOrderOptimization | 190604.5 | 996 | 272656 | 4 | 3.4710e-29 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 8 | CaNNOLeS | 7.647979e6 | 241 | 4084144 | 4 | 9.1902e-29 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 1.944416455e8 | 504 | 1005360 | 4 | 1.2038e-27 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 3.3117292e7 | 424 | 45152 | 5 | 6.8101e-19 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 1.1347646e7 | 165 | 26176 | 7 | 3.6406e-18 | true | ok | NaN | NaN | first\_order |
| 8 | LeastSquaresOptim (Dogleg) | 1.6957915e6 | 105 | 447536 | 4 | 1.0452e-28 | true | ok | NaN | NaN | converged |
| 8 | LeastSquaresOptim (LM) | 3.671709e6 | 158 | 714208 | 7 | 1.1942e-26 | true | ok | NaN | NaN | converged |
| 8 | MadNLP | 9.9653545e6 | 621 | 456304 | 5 | 9.1019e-22 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | NonlinearSolve (LM) | 3.4670125e7 | 1701 | 7443808 | 117 | 2.9385e-25 | true | ok | NaN | NaN | StalledSuccess |
| 8 | NonlinearSolve (TrustRegion) | 1.9447915e6 | 155 | 386624 | 11 | 1.0610e-28 | true | ok | NaN | NaN | Success |
| 8 | Optim (Newton) | 424666.5 | 92 | 107024 | 4 | 1.0334e-28 | true | ok | NaN | NaN | converged |
| 8 | Optim (NewtonTrustRegion) | 2.1208125e6 | 163 | 764640 | 4 | 1.0334e-28 | true | ok | NaN | NaN | converged |
| 8 | SecondOrderOptimization | 1.369375e6 | 1261 | 752048 | 4 | 7.9675e-29 | true | ok | NaN | NaN | step\_size |
| 12 | CaNNOLeS | 5.5810083e7 | 250 | 18123072 | 4 | 3.5341e-28 | true | ok | NaN | NaN | first\_order |
| 12 | Ipopt | 2.892785167e9 | 510 | 3814256 | 4 | 9.7005e-23 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (tron) | 1.627133125e8 | 441 | 80816 | 5 | 4.0091e-17 | true | ok | NaN | NaN | small\_residual |
| 12 | JSOSolvers (trunk) | 6.43201875e7 | 191 | 53888 | 7 | 4.9518e-18 | true | ok | NaN | NaN | first\_order |
| 12 | LeastSquaresOptim (Dogleg) | 1.1640167e7 | 109 | 1159088 | 4 | 3.4552e-28 | true | ok | NaN | NaN | converged |
| 12 | LeastSquaresOptim (LM) | 2.95399585e7 | 165 | 1666208 | 7 | 9.4146e-26 | true | ok | NaN | NaN | converged |
| 12 | MadNLP | 6.01377705e7 | 613 | 1767488 | 4 | 2.0341e-21 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 12 | NonlinearSolve (LM) | 1.858505835e8 | 1701 | 16886416 | 117 | 1.0631e-24 | true | ok | NaN | NaN | StalledSuccess |
| 12 | NonlinearSolve (TrustRegion) | 1.71152915e7 | 155 | 1722592 | 11 | 3.4394e-28 | true | ok | NaN | NaN | Success |
| 12 | Optim (Newton) | 2.1090205e6 | 92 | 408208 | 4 | 3.3605e-28 | true | ok | NaN | NaN | converged |
| 12 | Optim (NewtonTrustRegion) | 1.17202915e7 | 167 | 2845440 | 4 | 3.2974e-28 | true | ok | NaN | NaN | converged |
| 12 | SecondOrderOptimization | 7.65556045e7 | 1781 | 3382864 | 4 | 3.3132e-28 | true | ok | NaN | NaN | step\_size |
| 16 | CaNNOLeS | 2.65243708e8 | 262 | 58078208 | 4 | 7.8728e-28 | true | ok | NaN | NaN | first\_order |
| 16 | Ipopt | 3.0503192583e10 | 518 | 14112784 | 4 | 8.6456e-24 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (tron) | 3.2426675e8 | 333 | 118560 | 5 | 8.4470e-18 | true | ok | NaN | NaN | small\_residual |
| 16 | JSOSolvers (trunk) | 2.555931245e8 | 224 | 86928 | 7 | 2.0273e-18 | true | ok | NaN | NaN | first\_order |
| 16 | LeastSquaresOptim (Dogleg) | 7.78229795e7 | 143 | 2973696 | 5 | 6.8946e-28 | true | ok | NaN | NaN | converged |
| 16 | LeastSquaresOptim (LM) | 1.07382e8 | 181 | 3862544 | 7 | 9.4413e-25 | true | ok | NaN | NaN | converged |
| 16 | MadNLP | 4.9571475e8 | 648 | 5220080 | 6 | 7.6993e-28 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16 | NonlinearSolve (LM) | 6.723419375e8 | 1905 | 33140544 | 114 | 2.9784e-23 | true | ok | NaN | NaN | StalledSuccess |
| 16 | NonlinearSolve (TrustRegion) | 8.3484625e7 | 174 | 5204048 | 8 | 2.3259e-26 | true | ok | NaN | NaN | Success |
| 16 | Optim (Newton) | 5.2608335e6 | 100 | 1237712 | 4 | 7.9990e-28 | true | ok | NaN | NaN | converged |
| 16 | Optim (NewtonTrustRegion) | 3.2449084e7 | 182 | 8370992 | 4 | 7.6677e-28 | true | ok | NaN | NaN | converged |
| 16 | SecondOrderOptimization | 7.91152705e7 | 2312 | 10278016 | 4 | 8.0622e-28 | true | ok | NaN | NaN | grad\_tol |
| 20 | CaNNOLeS | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | Ipopt | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | LeastSquaresOptim (Dogleg) | 1.56651771e8 | 143 | 6342736 | 5 | 1.3742e-27 | true | ok | NaN | NaN | converged |
| 20 | LeastSquaresOptim (LM) | 2.157095e8 | 181 | 8104064 | 7 | 6.3357e-24 | true | ok | NaN | NaN | converged |
| 20 | MadNLP | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 20: its build takes over 300 s from n = 20 (decision 18) |
| 20 | NonlinearSolve (LM) | 1.325662541e9 | 1905 | 60712384 | 114 | 9.1902e-23 | true | ok | NaN | NaN | StalledSuccess |
| 20 | NonlinearSolve (TrustRegion) | 3.46959833e8 | 174 | 12418128 | 9 | 1.4831e-27 | true | ok | NaN | NaN | Success |
| 20 | Optim (Newton) | 1.4478e7 | 100 | 2884880 | 4 | 1.5146e-27 | true | ok | NaN | NaN | converged |
| 20 | Optim (NewtonTrustRegion) | 8.35047085e7 | 182 | 19273520 | 4 | 1.4625e-27 | true | ok | NaN | NaN | converged |
| 20 | SecondOrderOptimization | 1.23189729e8 | 2832 | 24625040 | 4 | 1.5888e-27 | true | ok | NaN | NaN | grad\_tol |
| 24 | CaNNOLeS | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | Ipopt | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | LeastSquaresOptim (Dogleg) | 2.39591229e8 | 121 | 12078704 | 4 | 3.4284e-27 | true | ok | NaN | NaN | converged |
| 24 | LeastSquaresOptim (LM) | 4.87619375e8 | 181 | 15658336 | 7 | 2.5861e-25 | true | ok | NaN | NaN | converged |
| 24 | MadNLP | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 24: its build takes over 300 s from n = 20 (decision 18) |
| 24 | NonlinearSolve (LM) | 3.349874958e9 | 1951 | 102690400 | 117 | 1.0728e-23 | true | ok | NaN | NaN | StalledSuccess |
| 24 | NonlinearSolve (TrustRegion) | 9.118257705e8 | 174 | 25515600 | 8 | 6.8741e-27 | true | ok | NaN | NaN | Success |
| 24 | Optim (Newton) | 4.9301417e7 | 100 | 10827728 | 4 | 3.3811e-27 | true | ok | NaN | NaN | converged |
| 24 | Optim (NewtonTrustRegion) | 1.911994585e8 | 182 | 38461744 | 4 | 3.2943e-27 | true | ok | NaN | NaN | converged |
| 24 | SecondOrderOptimization | 1.52793625e8 | 3350 | 50281600 | 4 | 3.3558e-27 | true | ok | NaN | NaN | step\_size |
| 28 | CaNNOLeS | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | Ipopt | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | LeastSquaresOptim (Dogleg) | 5.372635415e8 | 143 | 22036800 | 5 | 5.8376e-27 | true | ok | NaN | NaN | converged |
| 28 | LeastSquaresOptim (LM) | 8.80611979e8 | 181 | 27917776 | 7 | 1.9822e-23 | true | ok | NaN | NaN | converged |
| 28 | MadNLP | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 28: its build takes over 300 s from n = 20 (decision 18) |
| 28 | NonlinearSolve (LM) | 5.94455325e9 | 1906 | 163401424 | 114 | 4.2498e-23 | true | ok | NaN | NaN | StalledSuccess |
| 28 | NonlinearSolve (TrustRegion) | 2.234626083e9 | 174 | 46452304 | 9 | 6.2399e-27 | true | ok | NaN | NaN | Success |
| 28 | Optim (Newton) | 7.89435005e7 | 100 | 10845200 | 4 | 6.5870e-27 | true | ok | NaN | NaN | converged |
| 28 | Optim (NewtonTrustRegion) | 3.96867375e8 | 182 | 71424304 | 4 | 6.5144e-27 | true | ok | NaN | NaN | converged |
| 28 | SecondOrderOptimization | 1.84030583e8 | 3872 | 119010064 | 4 | 6.6454e-27 | true | ok | NaN | NaN | grad\_tol |
| 32 | CaNNOLeS | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | Ipopt | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | LeastSquaresOptim (Dogleg) | 1.456577875e9 | 143 | 36671968 | 5 | 1.0325e-26 | true | ok | NaN | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 2.227634916e9 | 181 | 46368432 | 7 | 9.4120e-23 | true | ok | NaN | NaN | converged |
| 32 | MadNLP | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | the JuMP model is not built at n = 32: its build takes over 300 s from n = 20 (decision 18) |
| 32 | NonlinearSolve (LM) | 1.2116094209e10 | 1906 | 250906832 | 114 | 1.4558e-22 | true | ok | NaN | NaN | StalledSuccess |
| 32 | NonlinearSolve (TrustRegion) | 4.815921375e9 | 174 | 87597648 | 9 | 1.1317e-26 | true | ok | NaN | NaN | Success |
| 32 | Optim (Newton) | 2.768766875e8 | 100 | 17948432 | 4 | 1.1259e-26 | true | ok | NaN | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | 8.05928083e8 | 182 | 117894448 | 4 | 1.1492e-26 | true | ok | NaN | NaN | converged |
| 32 | SecondOrderOptimization | 2.871169165e8 | 4392 | 165625216 | 4 | 1.1435e-26 | true | ok | NaN | NaN | grad\_tol |
