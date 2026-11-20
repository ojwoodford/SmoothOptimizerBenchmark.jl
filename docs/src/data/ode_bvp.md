# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:13:18
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
| 32 | JuMP | 6750.0 | 2 | 32 | 15584.0 | 5 | 128 |
| 32 | NLLSModel (Sparse) | 273.5507246376812 | 1 | 16 | 1625.0 | 1 | 32 |
| 32 | Standalone (Sparse) | 252.5679012345679 | 1 | 16 | 3071.4285714285716 | 20 | 7856 |
| 64 | JuMP | 13125.0 | 2 | 32 | 30416.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 413.1875 | 1 | 16 | 3847.3333333333335 | 1 | 64 |
| 64 | Standalone (Sparse) | 415.84 | 1 | 16 | 4625.0 | 20 | 17200 |
| 128 | JuMP | 26458.0 | 2 | 32 | 60417.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 752.8620689655172 | 1 | 16 | 7514.0 | 1 | 64 |
| 128 | Standalone (Sparse) | 723.2142857142857 | 1 | 16 | 9125.0 | 22 | 33584 |
| 256 | JuMP | 50208.0 | 2 | 32 | 120250.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 852.9411764705883 | 1 | 16 | 15166.0 | 1 | 64 |
| 256 | Standalone (Sparse) | 1355.6 | 1 | 16 | 18167.0 | 24 | 67440 |
| 512 | JuMP | 101792.0 | 2 | 32 | 241417.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 880.4347826086956 | 1 | 16 | 29959.0 | 1 | 64 |
| 512 | Standalone (Sparse) | 2651.0 | 1 | 16 | 33917.0 | 24 | 134256 |
| 1024 | JuMP | 202917.0 | 2 | 32 | 480916.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 1506.3846153846155 | 1 | 16 | 27041.0 | 1 | 64 |
| 1024 | Standalone (Sparse) | 5270.75 | 1 | 16 | 65125.0 | 24 | 267920 |
| 2048 | JuMP | 452000.0 | 2 | 32 | 1.191292e6 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 2191.7 | 1 | 16 | 43417.0 | 1 | 64 |
| 2048 | Standalone (Sparse) | 11292.0 | 1 | 16 | 128250.0 | 25 | 502384 |
| 4096 | JuMP | 1.458e6 | 2 | 32 | 4.476375e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 3468.75 | 1 | 16 | 86833.0 | 1 | 64 |
| 4096 | Standalone (Sparse) | 22375.0 | 1 | 16 | 262083.0 | 25 | 1020528 |
| 8192 | JuMP | 4.561833e6 | 2 | 32 | 1.3330958e7 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 5989.5 | 1 | 16 | 177375.0 | 1 | 64 |
| 8192 | Standalone (Sparse) | 42708.0 | 1 | 16 | 563917.0 | 25 | 2007664 |
| 16384 | JuMP | 1.1064792e7 | 2 | 32 | 3.3868042e7 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 11209.0 | 1 | 16 | 333708.0 | 1 | 64 |
| 16384 | Standalone (Sparse) | 85958.0 | 1 | 16 | 1.047958e6 | 25 | 3981936 |
| 32768 | JuMP | 2.6734292e7 | 2 | 32 | 7.7768084e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 21042.0 | 1 | 16 | 1.002333e6 | 1 | 64 |
| 32768 | Standalone (Sparse) | 173334.0 | 1 | 16 | 2.241417e6 | 25 | 8782448 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 32 | CaNNOLeS | 56396.0 | 180 | 48880 | 3 | 1.8561e-18 | true | ok | NaN | NaN | first\_order |
| 32 | Ipopt | 586459.0 | 353 | 30896 | 2 | 8.5216e-08 | true | ok | NaN | NaN | acceptable |
| 32 | JSOSolvers (tron) | 749958.0 | 643 | 37376 | 5 | 1.8772e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 32 | JSOSolvers (trunk) | 292000.0 | 277 | 17392 | 4 | 6.2913e-23 | true | ok | NaN | NaN | first\_order |
| 32 | LeastSquaresOptim (Dogleg) | 178166.5 | 123 | 20224 | 11 | 5.5649e-16 | true | ok | NaN | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 392687.5 | 208 | 34320 | 22 | 2.7791e-15 | true | ok | NaN | NaN | converged |
| 32 | MadNLP | 484229.5 | 589 | 68240 | 4 | 6.1485e-27 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 3.103459e6 | 784 | 103376 | 135 | 1.0940e-24 | true | ok | NaN | NaN | StalledSuccess |
| 32 | NonlinearSolve (TrustRegion) | 133604.0 | 868 | 130736 | 10 | 3.1256e-28 | true | ok | NaN | NaN | Success |
| 32 | Optim (Newton) | 96417.0 | 351 | 103856 | 3 | 1.8561e-18 | true | ok | NaN | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 32 | SecondOrderOptimization | 30125.0 | 211 | 54272 | 4 | 1.1617e-26 | true | ok | NaN | NaN | abs\_dcost, step\_size |
| 64 | CaNNOLeS | 126020.5 | 196 | 97104 | 4 | 2.3437e-28 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 716541.0 | 356 | 54784 | 2 | 1.8595e-06 | false | above_reference | NaN | NaN | acceptable; claimed convergence at cost 1.859497e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 64 | JSOSolvers (tron) | 3.435041e6 | 1469 | 83456 | 5 | 8.8255e-18 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 64 | JSOSolvers (trunk) | 1.931708e6 | 1039 | 64368 | 6 | 7.3635e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 64 | LeastSquaresOptim (Dogleg) | 995000.5 | 205 | 93376 | 17 | 3.7648e-16 | true | ok | NaN | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 1.6853545e6 | 295 | 128416 | 27 | 6.3401e-15 | true | ok | NaN | NaN | converged |
| 64 | MadNLP | 601667.0 | 591 | 88432 | 4 | 2.0323e-21 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 9.611521e6 | 791 | 225136 | 132 | 3.3865e-24 | true | ok | NaN | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 181583.0 | 899 | 268144 | 12 | 3.3840e-28 | true | ok | NaN | NaN | Success |
| 64 | Optim (Newton) | 166000.0 | 448 | 260528 | 4 | 4.4068e-28 | true | ok | NaN | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 64 | SecondOrderOptimization | 52583.0 | 222 | 100576 | 4 | 2.4905e-24 | true | ok | NaN | NaN | grad\_tol |
| 128 | CaNNOLeS | 240312.5 | 219 | 175040 | 4 | 9.8822e-28 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 959124.5 | 370 | 78912 | 2 | 7.0036e-06 | false | above_reference | NaN | NaN | acceptable; claimed convergence at cost 7.003603e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 128 | JSOSolvers (tron) | 1.3604208e7 | 2701 | 156256 | 5 | 2.0747e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 128 | JSOSolvers (trunk) | 1.0260583e7 | 2251 | 131792 | 7 | 1.3410e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 128 | LeastSquaresOptim (Dogleg) | 3.82375e6 | 215 | 105744 | 18 | 4.8255e-17 | true | ok | NaN | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 5.113375e6 | 322 | 180496 | 29 | 1.1654e-14 | true | ok | NaN | NaN | converged |
| 128 | MadNLP | 836312.5 | 602 | 128080 | 4 | 6.8709e-20 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 3.6495709e7 | 811 | 503728 | 135 | 5.7843e-24 | true | ok | NaN | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 323375.0 | 915 | 359744 | 11 | 2.0623e-26 | true | ok | NaN | NaN | Success |
| 128 | Optim (Newton) | 264187.5 | 472 | 506576 | 4 | 1.1209e-27 | true | ok | NaN | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 128 | SecondOrderOptimization | 117687.5 | 234 | 191840 | 4 | 1.9230e-23 | true | ok | NaN | NaN | grad\_tol |
| 256 | CaNNOLeS | 481666.5 | 242 | 352960 | 4 | 1.7645e-27 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 1.4646455e6 | 392 | 156000 | 2 | 1.7358e-05 | false | above_reference | NaN | NaN | acceptable; claimed convergence at cost 1.735820e-05, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 256 | JSOSolvers (tron) | 3.6298583e7 | 3638 | 224960 | 5 | 5.2804e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 256 | JSOSolvers (trunk) | 3.0869416e7 | 3324 | 199344 | 7 | 4.1998e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 256 | LeastSquaresOptim (Dogleg) | 1.0001021e7 | 204 | 280512 | 13 | 2.4570e-18 | true | ok | NaN | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 1.1166771e7 | 346 | 212272 | 30 | 1.4391e-14 | true | ok | NaN | NaN | converged |
| 256 | MadNLP | 1.1800205e6 | 632 | 205024 | 4 | 2.4314e-19 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 1.410389165e8 | 862 | 1530288 | 135 | 1.4482e-23 | true | ok | NaN | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 580791.0 | 1006 | 705984 | 13 | 2.0210e-27 | true | ok | NaN | NaN | Success |
| 256 | Optim (Newton) | 418104.5 | 500 | 1005008 | 4 | 1.4044e-27 | true | ok | NaN | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 256 | SecondOrderOptimization | 215166.5 | 278 | 380240 | 4 | 5.5846e-23 | true | ok | NaN | NaN | grad\_tol |
| 512 | CaNNOLeS | 924208.5 | 250 | 725824 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 512 | Ipopt | 2.3988545e6 | 394 | 317440 | 2 | 3.8067e-05 | false | above_reference | NaN | NaN | acceptable; claimed convergence at cost 3.806742e-05, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 512 | JSOSolvers (tron) | 8.8539604e7 | 4400 | 312992 | 6 | 2.6432e-18 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (trunk) | 7.0446875e7 | 3779 | 255872 | 7 | 8.8495e-17 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 512 | LeastSquaresOptim (Dogleg) | 2.7189583e7 | 192 | 288112 | 12 | 3.0784e-23 | true | ok | NaN | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 2.17374585e7 | 344 | 234192 | 30 | 2.1638e-14 | true | ok | NaN | NaN | converged |
| 512 | MadNLP | 1.972625e6 | 644 | 363280 | 4 | 5.9223e-19 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 5.02983375e8 | 23712 | 127759184 | 138 | 2.8773e-23 | true | ok | NaN | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 1.063771e6 | 1017 | 1380400 | 11 | 8.8263e-27 | true | ok | NaN | NaN | Success |
| 512 | Optim (Newton) | 710896.0 | 516 | 1995728 | 4 | 4.0048e-27 | true | ok | NaN | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 512 | SecondOrderOptimization | 361229.5 | 281 | 750992 | 4 | 1.2908e-22 | true | ok | NaN | NaN | grad\_tol |
| 1024 | CaNNOLeS | 1.9344795e6 | 250 | 1405760 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 1024 | Ipopt | 4.929271e6 | 398 | 521312 | 2 | 7.9486e-05 | false | above_reference | NaN | NaN | acceptable; claimed convergence at cost 7.948585e-05, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1024 | JSOSolvers (tron) | 1.77307583e8 | 4364 | 414208 | 6 | 2.3931e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 1024 | JSOSolvers (trunk) | 1.58678208e8 | 3898 | 325168 | 8 | 3.7719e-18 | true | ok | NaN | NaN | first\_order |
| 1024 | LeastSquaresOptim (Dogleg) | 5.6155979e7 | 192 | 342128 | 12 | 4.3746e-22 | true | ok | NaN | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 4.3952e7 | 344 | 285264 | 30 | 4.2366e-14 | true | ok | NaN | NaN | converged |
| 1024 | MadNLP | 4.148729e6 | 644 | 677712 | 4 | 1.2904e-18 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 2.132020542e9 | 23896 | 245172048 | 138 | 4.4891e-23 | true | ok | NaN | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 4.6489785e6 | 3473 | 4059904 | 14 | 3.5630e-27 | true | ok | NaN | NaN | Success |
| 1024 | Optim (Newton) | 1.3043955e6 | 516 | 4206192 | 4 | 4.5903e-27 | true | ok | NaN | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1024 | SecondOrderOptimization | 600792.0 | 408 | 1639680 | 4 | 2.7550e-22 | true | ok | NaN | NaN | grad\_tol |
| 2048 | CaNNOLeS | 5.0604375e6 | 252 | 2700128 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 2048 | Ipopt | 1.0422125e7 | 402 | 1047968 | 2 | 1.6232e-04 | false | above_reference | NaN | NaN | acceptable; claimed convergence at cost 1.623227e-04, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 2048 | JSOSolvers (tron) | 3.25542958e8 | 4152 | 609776 | 6 | 6.0630e-18 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 2048 | JSOSolvers (trunk) | 3.24208125e8 | 3930 | 465968 | 8 | 4.3022e-18 | true | ok | NaN | NaN | first\_order |
| 2048 | LeastSquaresOptim (Dogleg) | 1.26077687e8 | 204 | 469792 | 13 | 2.2806e-24 | true | ok | NaN | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 9.9033e7 | 343 | 387168 | 30 | 1.5557e-13 | true | ok | NaN | NaN | converged |
| 2048 | MadNLP | 9.2593125e6 | 644 | 1306576 | 4 | 2.6868e-18 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 7.137609708e9 | 23888 | 495769552 | 138 | 9.5030e-23 | true | ok | NaN | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 8.8238125e6 | 5828 | 7693456 | 11 | 9.6804e-27 | true | ok | NaN | NaN | Success |
| 2048 | Optim (Newton) | 2.528166e6 | 694 | 7777440 | 4 | 4.3074e-27 | true | ok | NaN | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 2048 | SecondOrderOptimization | 1.098771e6 | 418 | 3148208 | 4 | 5.6835e-22 | true | ok | NaN | NaN | grad\_tol |
| 4096 | CaNNOLeS | 1.3154917e7 | 254 | 5288832 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 4096 | Ipopt | 2.3658625e7 | 406 | 2109600 | 2 | 3.2800e-04 | false | above_reference | NaN | NaN | acceptable; claimed convergence at cost 3.279964e-04, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 4096 | JSOSolvers (tron) | 1.132148833e9 | 4596 | 1042736 | 6 | 4.4011e-18 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 4096 | JSOSolvers (trunk) | 9.85004583e8 | 4246 | 765712 | 8 | 5.0157e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4096 | LeastSquaresOptim (Dogleg) | 2.37775375e8 | 204 | 686112 | 13 | 2.4824e-22 | true | ok | NaN | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 1.915254585e8 | 343 | 591456 | 30 | 2.1620e-13 | true | ok | NaN | NaN | converged |
| 4096 | MadNLP | 2.2970687e7 | 644 | 2564304 | 4 | 5.4795e-18 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 3.0111475458e10 | 873 | 291021296 | 129 | 1.8098e-22 | false | timeout | NaN | NaN | MaxTime; cost test passes |
| 4096 | NonlinearSolve (TrustRegion) | 1.9440646e7 | 10620 | 16667328 | 15 | 4.0653e-27 | true | ok | NaN | NaN | Success |
| 4096 | Optim (Newton) | 5.0816875e6 | 521 | 15960528 | 4 | 4.9230e-27 | true | ok | NaN | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 4096 | SecondOrderOptimization | 2.2035e6 | 418 | 6417072 | 4 | 1.1540e-21 | true | ok | NaN | NaN | grad\_tol |
| 8192 | CaNNOLeS | 3.452675e7 | 256 | 10449824 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 8192 | Ipopt | 5.21905e7 | 416 | 4199648 | 2 | 6.5934e-04 | false | above_reference | NaN | NaN | acceptable; claimed convergence at cost 6.593439e-04, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 8192 | JSOSolvers (tron) | 4.592273041e9 | 4533 | 1863008 | 6 | 4.9132e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 8192 | JSOSolvers (trunk) | 4.12315625e9 | 4268 | 1323824 | 8 | 5.0343e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8192 | LeastSquaresOptim (Dogleg) | 4.46797333e8 | 204 | 1119168 | 13 | 2.9846e-21 | true | ok | NaN | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 3.61071541e8 | 353 | 1007056 | 31 | 1.0752e-13 | true | ok | NaN | NaN | converged |
| 8192 | MadNLP | 6.4122625e7 | 644 | 5121008 | 4 | 1.1065e-17 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 4096 |
| 8192 | NonlinearSolve (TrustRegion) | 4.1828583e7 | 19935 | 32831136 | 15 | 3.4781e-27 | true | ok | NaN | NaN | Success |
| 8192 | Optim (Newton) | 1.00208335e7 | 521 | 31054288 | 4 | 6.4111e-27 | true | ok | NaN | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 8192 | SecondOrderOptimization | 4.340208e6 | 418 | 12561616 | 4 | 2.3254e-21 | true | ok | NaN | NaN | grad\_tol |
| 16384 | CaNNOLeS | 7.62926455e7 | 258 | 21754816 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 16384 | Ipopt | 1.021177584e9 | 426 | 8395872 | 2 | 1.3220e-03 | false | above_reference | NaN | NaN | acceptable; claimed convergence at cost 1.322039e-03, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 16384 | JSOSolvers (tron) | 1.3715998458e10 | 4205 | 3493856 | 6 | 2.2511e-17 | false | not_converged | NaN | NaN | small\_residual; cost test passes |
| 16384 | JSOSolvers (trunk) | 1.3148910792e10 | 4296 | 2439280 | 8 | 4.1993e-18 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 16384 | LeastSquaresOptim (Dogleg) | 1.434635583e9 | 230 | 2005456 | 14 | 6.2742e-24 | true | ok | NaN | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 9.27760042e8 | 382 | 1809872 | 31 | 1.6302e-13 | true | ok | NaN | NaN | converged |
| 16384 | MadNLP | 1.6263825e8 | 653 | 10110672 | 4 | 2.2236e-17 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 4096 |
| 16384 | NonlinearSolve (TrustRegion) | 1.35799187e8 | 38622 | 69076320 | 16 | 3.3731e-27 | true | ok | NaN | NaN | Success |
| 16384 | Optim (Newton) | 2.53575835e7 | 521 | 61241808 | 4 | 8.5227e-27 | true | ok | NaN | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 16384 | SecondOrderOptimization | 2.04743335e7 | 419 | 24760496 | 4 | 4.6682e-21 | true | ok | NaN | NaN | grad\_tol |
| 32768 | CaNNOLeS | 1.681774795e8 | 260 | 43676640 | 4 | 4.2615e-27 | true | ok | NaN | NaN | first\_order |
| 32768 | Ipopt | 1.230029458e9 | 430 | 16772256 | 2 | 2.6474e-03 | false | above_reference | NaN | NaN | acceptable; claimed convergence at cost 2.647428e-03, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 32768 | JSOSolvers (tron) | 3.0066176958e10 | 3904 | 6772592 | 6 | 1.0918e-14 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 32768 | JSOSolvers (trunk) | 3.0042204958e10 | 3848 | 4639952 | 8 | 4.9006e-17 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 32768 | LeastSquaresOptim (Dogleg) | 2.128335e9 | 230 | 3738064 | 14 | 9.4597e-22 | true | ok | NaN | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 1.771094292e9 | 382 | 3446224 | 31 | 3.0354e-13 | true | ok | NaN | NaN | converged |
| 32768 | MadNLP | 3.69811834e8 | 653 | 20090576 | 4 | 4.4577e-17 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 4096 |
| 32768 | NonlinearSolve (TrustRegion) | 3.2110675e8 | 76002 | 137018464 | 16 | 4.7571e-27 | true | ok | NaN | NaN | Success |
| 32768 | Optim (Newton) | 4.55636875e7 | 549 | 121453456 | 4 | 1.2826e-26 | true | ok | NaN | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 32768 | SecondOrderOptimization | 1.72182715e7 | 419 | 49813680 | 4 | 9.3537e-21 | true | ok | NaN | NaN | grad\_tol |
