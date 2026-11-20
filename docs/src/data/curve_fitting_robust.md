# Benchmark Results: Robust Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone (fudged)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T16:36:43
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
| 64 | JuMP (fudged) | 25166.0 | 2 | 32 | 56125.0 | 5 | 128 |
| 64 | NLLSModel (Static) | 410.82 | 1 | 16 | 2079.2 | 1 | 32 |
| 64 | Standalone (fudged) | 530.0833333333334 | 1 | 16 | 2012.5 | 1 | 32 |
| 128 | JuMP (fudged) | 49250.0 | 2 | 32 | 113708.0 | 5 | 128 |
| 128 | NLLSModel (Static) | 750.0 | 1 | 16 | 4041.6 | 1 | 32 |
| 128 | Standalone (fudged) | 994.047619047619 | 1 | 16 | 3833.3333333333335 | 1 | 32 |
| 256 | JuMP (fudged) | 97583.0 | 2 | 32 | 220583.0 | 5 | 128 |
| 256 | NLLSModel (Static) | 876.7826086956521 | 1 | 16 | 8069.333333333333 | 1 | 32 |
| 256 | Standalone (fudged) | 1954.5454545454545 | 1 | 16 | 7597.333333333333 | 1 | 32 |
| 512 | JuMP (fudged) | 195042.0 | 2 | 32 | 446917.0 | 5 | 128 |
| 512 | NLLSModel (Static) | 952.3809523809524 | 1 | 16 | 16666.0 | 1 | 32 |
| 512 | Standalone (fudged) | 3951.3333333333335 | 1 | 16 | 15291.0 | 1 | 32 |
| 1024 | JuMP (fudged) | 421917.0 | 2 | 32 | 1.033416e6 | 5 | 128 |
| 1024 | NLLSModel (Static) | 1573.6923076923076 | 1 | 16 | 13833.0 | 1 | 32 |
| 1024 | Standalone (fudged) | 7972.0 | 1 | 16 | 32167.0 | 1 | 32 |
| 2048 | JuMP (fudged) | 1.301875e6 | 2 | 32 | 3.356e6 | 5 | 128 |
| 2048 | NLLSModel (Static) | 2291.6666666666665 | 1 | 16 | 22166.0 | 1 | 32 |
| 2048 | Standalone (fudged) | 16625.0 | 1 | 16 | 85167.0 | 1 | 32 |
| 4096 | JuMP (fudged) | 3.614125e6 | 2 | 32 | 8.920667e6 | 5 | 128 |
| 4096 | NLLSModel (Static) | 3716.8 | 1 | 16 | 44709.0 | 1 | 32 |
| 4096 | Standalone (fudged) | 33375.0 | 1 | 16 | 124834.0 | 1 | 32 |
| 8192 | JuMP (fudged) | 1.010975e7 | 2 | 32 | 2.4477541e7 | 5 | 128 |
| 8192 | NLLSModel (Static) | 6750.0 | 1 | 16 | 113500.0 | 1 | 32 |
| 8192 | Standalone (fudged) | 65583.0 | 1 | 16 | 247958.0 | 1 | 32 |
| 16384 | JuMP (fudged) | 2.3988333e7 | 2 | 32 | 5.8184791e7 | 5 | 128 |
| 16384 | NLLSModel (Static) | 12375.0 | 1 | 16 | 219375.0 | 1 | 32 |
| 16384 | Standalone (fudged) | 133458.0 | 1 | 16 | 500333.0 | 1 | 32 |
| 32768 | JuMP (fudged) | 5.0416083e7 | 2 | 32 | 1.24712625e8 | 5 | 128 |
| 32768 | NLLSModel (Static) | 120625.0 | 1 | 16 | 423750.0 | 1 | 32 |
| 32768 | Standalone (fudged) | 264125.0 | 1 | 16 | 994250.0 | 1 | 32 |
| 65536 | JuMP (fudged) | 1.09267666e8 | 2 | 32 | 2.77436833e8 | 5 | 128 |
| 65536 | NLLSModel (Static) | 228000.0 | 1 | 16 | 979500.0 | 1 | 32 |
| 65536 | Standalone (fudged) | 544250.0 | 1 | 16 | 2.003125e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 64 | CaNNOLeS (fudged) | 486208.5 | 214 | 80176 | 14 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 2.334688e6 | 686 | 68096 | 8 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 1.629083e6 | 453 | 25696 | 23 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 721312.5 | 184 | 11824 | 14 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | LeastSquaresOptim (Dogleg, fudged) | 41750.0 | 191 | 462816 | 10 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | LeastSquaresOptim (LM, fudged) | 30354.0 | 147 | 360688 | 7 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | MadNLP | 1.2727715e6 | 719 | 52240 | 9 | 9.2008e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM, fudged) | 649791.0 | 1453 | 246432 | 143 | 9.2008e-01 | true | ok | NaN | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion, fudged) | 230959.0 | 1103 | 2872800 | 21 | 9.2008e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 64 | Optim (Newton) | 61042.0 | 191 | 7152 | 11 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 51333.0 | 309 | 22416 | 8 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | SecondOrderOptimization | 23145.5 | 32 | 2064 | 9 | 9.2008e-01 | true | ok | NaN | NaN | rel\_dcost |
| 128 | CaNNOLeS (fudged) | 8.979667e6 | 869 | 165328 | 76 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 7.556333e6 | 1219 | 146768 | 14 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 2.3462505e6 | 367 | 25376 | 15 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 1.7993125e6 | 217 | 16672 | 19 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | LeastSquaresOptim (Dogleg, fudged) | 83166.5 | 214 | 516976 | 12 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | LeastSquaresOptim (LM, fudged) | 73354.0 | 184 | 466128 | 9 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | MadNLP | 2.2969375e6 | 841 | 54224 | 10 | 1.8517e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM, fudged) | 1.0075625e6 | 1412 | 391664 | 138 | 1.8517e+00 | true | ok | NaN | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion, fudged) | 519750.0 | 1725 | 4472784 | 23 | 1.8517e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 128 | Optim (Newton) | 122875.5 | 227 | 8240 | 13 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 78688.0 | 309 | 22416 | 8 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | SecondOrderOptimization | 51541.5 | 32 | 2064 | 10 | 1.8517e+00 | true | ok | NaN | NaN | rel\_dcost |
| 256 | CaNNOLeS (fudged) | 3.9613545e6 | 287 | 287568 | 31 | 3.7582e+00 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 1.2228313e7 | 1069 | 215184 | 13 | 3.7582e+00 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | 1.8943667e7 | 1237 | 78624 | 57 | 3.7582e+00 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 256 | JSOSolvers (trunk) | 4.0181667e7 | 3613 | 191392 | 367 | 3.7582e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 256 | LeastSquaresOptim (Dogleg, fudged) | 186562.5 | 231 | 573824 | 12 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | LeastSquaresOptim (LM, fudged) | 205604.5 | 241 | 625984 | 12 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | MadNLP | 2.5371665e6 | 685 | 51632 | 7 | 3.7582e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM, fudged) | 2.788042e6 | 2290 | 1131600 | 192 | 3.7582e+00 | true | ok | NaN | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion, fudged) | 1.065333e6 | 1455 | 3858576 | 32 | 3.7582e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 256 | Optim (Newton) | 264937.5 | 225 | 8272 | 14 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 214708.5 | 449 | 33456 | 13 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | SecondOrderOptimization | 128270.5 | 32 | 2064 | 13 | 3.7582e+00 | true | ok | NaN | NaN | rel\_dcost |
| 512 | CaNNOLeS (fudged) | 4.269229e6 | 264 | 590880 | 16 | 7.4865e+00 | true | ok | NaN | NaN | first\_order |
| 512 | Ipopt | 2.13076455e7 | 1057 | 423344 | 11 | 7.4865e+00 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (tron) | 1.306475e7 | 481 | 51792 | 22 | 7.4865e+00 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (trunk) | 7.4382166e7 | 3493 | 197856 | 355 | 7.4865e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 512 | LeastSquaresOptim (Dogleg, fudged) | 287937.5 | 199 | 484384 | 11 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | LeastSquaresOptim (LM, fudged) | 256562.0 | 169 | 436096 | 8 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | MadNLP | 6.2464375e6 | 683 | 51760 | 12 | 7.4865e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM, fudged) | 3.7566245e6 | 1696 | 1582192 | 138 | 7.4865e+00 | true | ok | NaN | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion, fudged) | 1.242167e6 | 1125 | 3388128 | 17 | 7.4865e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 512 | Optim (Newton) | 381729.0 | 196 | 7280 | 11 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 249791.5 | 309 | 22416 | 8 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | SecondOrderOptimization | 186521.0 | 32 | 2064 | 9 | 7.4865e+00 | true | ok | NaN | NaN | rel\_dcost |
| 1024 | CaNNOLeS (fudged) | 8.262437e6 | 258 | 1150720 | 13 | 1.4950e+01 | true | ok | NaN | NaN | first\_order |
| 1024 | Ipopt | 4.29034165e7 | 965 | 634768 | 11 | 1.4950e+01 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (tron) | 6.0679542e7 | 987 | 109632 | 42 | 1.4950e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 1024 | JSOSolvers (trunk) | 1.40777541e8 | 3334 | 214800 | 333 | 1.4950e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 1024 | LeastSquaresOptim (Dogleg, fudged) | 416083.0 | 159 | 406976 | 8 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | LeastSquaresOptim (LM, fudged) | 482562.5 | 169 | 463744 | 8 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | MadNLP | 1.26321875e7 | 697 | 51920 | 10 | 1.4950e+01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM, fudged) | 7.391729e6 | 1663 | 3023616 | 135 | 1.4950e+01 | true | ok | NaN | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion, fudged) | 3.116208e6 | 1345 | 5061632 | 23 | 1.4950e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 1024 | Optim (Newton) | 490104.0 | 134 | 5360 | 7 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 417417.0 | 281 | 20208 | 7 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | SecondOrderOptimization | 335542.0 | 54 | 3344 | 8 | 1.4950e+01 | true | ok | NaN | NaN | rel\_dcost |
| 2048 | CaNNOLeS (fudged) | 2.7875042e7 | 262 | 2140032 | 14 | 2.9833e+01 | true | ok | NaN | NaN | first\_order |
| 2048 | Ipopt | 1.596258745e8 | 1376 | 1579664 | 16 | 2.9833e+01 | true | ok | NaN | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 1.83788208e8 | 938 | 164624 | 38 | 2.9833e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 2048 | JSOSolvers (trunk) | 4.60076542e8 | 3410 | 267600 | 344 | 2.9833e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 2048 | LeastSquaresOptim (Dogleg, fudged) | 1.065396e6 | 177 | 507056 | 9 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | LeastSquaresOptim (LM, fudged) | 1.042938e6 | 169 | 527232 | 8 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | MadNLP | 2.24288e8 | 1641 | 67344 | 19 | 2.9833e+01 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 2048 | NonlinearSolve (LM, fudged) | 1.45216245e7 | 1663 | 5995264 | 135 | 2.9833e+01 | true | ok | NaN | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion, fudged) | 5.147708e6 | 1433 | 7526720 | 14 | 2.9833e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 2048 | Optim (Newton) | 1.3742705e6 | 160 | 6192 | 9 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 925000.0 | 281 | 20208 | 7 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | SecondOrderOptimization | 290875.0 | 56 | 3552 | 8 | 2.9833e+01 | true | ok | NaN | NaN | rel\_dcost |
| 4096 | CaNNOLeS (fudged) | 7.34087085e7 | 262 | 4224832 | 13 | 5.9807e+01 | true | ok | NaN | NaN | first\_order |
| 4096 | Ipopt | 2.917533545e8 | 1110 | 2857440 | 12 | 5.9807e+01 | true | ok | NaN | NaN | first\_order |
| 4096 | JSOSolvers (tron) | 8.36625e8 | 1062 | 285264 | 48 | 5.9807e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 4096 | JSOSolvers (trunk) | 1.934059208e9 | 3396 | 365232 | 342 | 5.9807e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4096 | LeastSquaresOptim (Dogleg, fudged) | 1.8675415e6 | 159 | 554432 | 8 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | LeastSquaresOptim (LM, fudged) | 2.113708e6 | 169 | 637824 | 8 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | MadNLP | 6.44325458e8 | 1591 | 66416 | 15 | 5.9807e+01 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 4096 | NonlinearSolve (LM, fudged) | 2.70770625e7 | 1641 | 13903712 | 133 | 5.9807e+01 | true | ok | NaN | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion, fudged) | 7.553167e6 | 993 | 8144640 | 12 | 5.9807e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 4096 | Optim (Newton) | 2.2453545e6 | 147 | 5776 | 8 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 1.79375e6 | 281 | 20208 | 7 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | SecondOrderOptimization | 435395.5 | 56 | 3552 | 8 | 5.9807e+01 | true | ok | NaN | NaN | rel\_dcost |
| 8192 | CaNNOLeS (fudged) | 1.87801021e8 | 264 | 7911264 | 13 | 1.1959e+02 | true | ok | NaN | NaN | first\_order |
| 8192 | Ipopt | 6.33985896e8 | 1063 | 5401376 | 11 | 1.1959e+02 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (tron) | 2.142657875e9 | 1023 | 512768 | 44 | 1.1959e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 8192 | JSOSolvers (trunk) | 5.557588292e9 | 3456 | 564720 | 351 | 1.1959e+02 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8192 | LeastSquaresOptim (Dogleg, fudged) | 3.8158545e6 | 159 | 751040 | 8 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | LeastSquaresOptim (LM, fudged) | 4.300729e6 | 169 | 834432 | 8 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | MadNLP | 1.015046375e9 | 1169 | 59536 | 11 | 1.1959e+02 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 8192 | NonlinearSolve (LM, fudged) | 5.3749042e7 | 1641 | 23275360 | 133 | 1.1959e+02 | true | ok | NaN | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion, fudged) | 2.1294708e7 | 1411 | 19993072 | 12 | 1.1959e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 8192 | Optim (Newton) | 4.272e6 | 134 | 5360 | 7 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 3.552854e6 | 281 | 20208 | 7 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | SecondOrderOptimization | 1.186771e6 | 56 | 3552 | 8 | 1.1959e+02 | true | ok | NaN | NaN | rel\_dcost |
| 16384 | CaNNOLeS (fudged) | 4.02219375e8 | 266 | 15316864 | 13 | 2.3926e+02 | true | ok | NaN | NaN | first\_order |
| 16384 | Ipopt | 5.512934834e9 | 1069 | 10445872 | 11 | 2.3926e+02 | true | ok | NaN | NaN | first\_order |
| 16384 | JSOSolvers (tron) | 4.590301333e9 | 904 | 965808 | 33 | 2.3926e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 16384 | JSOSolvers (trunk) | 1.409646e10 | 3330 | 951888 | 329 | 2.3926e+02 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 16384 | LeastSquaresOptim (Dogleg, fudged) | 7.374042e6 | 159 | 1144256 | 8 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | LeastSquaresOptim (LM, fudged) | 8.369854e6 | 169 | 1227648 | 8 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | MadNLP | 4.274197542e9 | 1771 | 69296 | 15 | 2.3926e+02 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 16384 | NonlinearSolve (LM, fudged) | 1.084444375e8 | 1641 | 42018656 | 133 | 2.3926e+02 | true | ok | NaN | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion, fudged) | 5.3560958e7 | 1565 | 40797472 | 14 | 2.3926e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 16384 | Optim (Newton) | 8.8881665e6 | 147 | 5776 | 8 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 6.642958e6 | 281 | 20208 | 7 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | SecondOrderOptimization | 2.759625e6 | 56 | 3552 | 8 | 2.3926e+02 | true | ok | NaN | NaN | rel\_dcost |
| 32768 | CaNNOLeS (fudged) | 8.503358125e8 | 276 | 30570720 | 13 | 4.7821e+02 | true | ok | NaN | NaN | first\_order |
| 32768 | Ipopt | 7.676254083e9 | 1173 | 21438592 | 13 | 4.7821e+02 | true | ok | NaN | NaN | first\_order |
| 32768 | JSOSolvers (tron) | 1.1421916917e10 | 1045 | 1890080 | 46 | 4.7821e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 32768 | JSOSolvers (trunk) | 2.9033799709e10 | 3371 | 1740288 | 336 | 4.7821e+02 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 32768 | LeastSquaresOptim (Dogleg, fudged) | 1.4637021e7 | 159 | 1930688 | 8 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | LeastSquaresOptim (LM, fudged) | 1.62134375e7 | 169 | 2014080 | 8 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | MadNLP | 1.502436375e9 | 731 | 52432 | 9 | 4.7821e+02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM, fudged) | 2.16824125e8 | 1641 | 79505248 | 133 | 4.7821e+02 | true | ok | NaN | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion, fudged) | 9.6773458e7 | 1543 | 76922320 | 13 | 4.7821e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 32768 | Optim (Newton) | 1.53292915e7 | 134 | 5360 | 7 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 1.26568335e7 | 281 | 20208 | 7 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | SecondOrderOptimization | 2.900292e6 | 56 | 3552 | 8 | 4.7821e+02 | true | ok | NaN | NaN | rel\_dcost |
| 65536 | CaNNOLeS (fudged) | 1.920849291e9 | 275 | 64256128 | 14 | 9.5686e+02 | true | ok | NaN | NaN | first\_order |
| 65536 | Ipopt | 1.3591159459e10 | 1473 | 56125968 | 17 | 9.5686e+02 | true | ok | NaN | NaN | first\_order |
| 65536 | JSOSolvers (tron) | 2.3791845083e10 | 1037 | 3724704 | 44 | 9.5686e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 65536 | JSOSolvers (trunk) | 3.0161183334e10 | 1340 | 3209616 | 143 | 9.5686e+02 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 65536 | LeastSquaresOptim (Dogleg, fudged) | 2.8869625e7 | 159 | 3503552 | 8 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | LeastSquaresOptim (LM, fudged) | 3.23395e7 | 169 | 3586944 | 8 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | MadNLP | 4.101990042e9 | 761 | 53008 | 12 | 9.5686e+02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM, fudged) | 4.42783125e8 | 1641 | 154478432 | 133 | 9.5686e+02 | true | ok | NaN | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion, fudged) | 2.44898792e8 | 1807 | 176100752 | 21 | 9.5686e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 65536 | Optim (Newton) | 3.5691625e7 | 147 | 5776 | 8 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 2.5144792e7 | 281 | 20208 | 7 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | SecondOrderOptimization | 9.653146e6 | 56 | 3552 | 8 | 9.5686e+02 | true | ok | NaN | NaN | rel\_dcost |
