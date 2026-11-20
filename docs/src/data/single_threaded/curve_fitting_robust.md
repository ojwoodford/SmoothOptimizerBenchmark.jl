# Benchmark Results: Robust Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone (fudged)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:31:53
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
| 64 | JuMP (fudged) | 24834.0 | 2 | 32 | 55250.0 | 5 | 128 |
| 64 | NLLSModel (Static) | 400.51020408163265 | 1 | 16 | 2204.1 | 1 | 32 |
| 64 | Standalone (fudged) | 545.2285714285714 | 1 | 16 | 2125.0 | 1 | 32 |
| 128 | JuMP (fudged) | 51542.0 | 2 | 32 | 108500.0 | 5 | 128 |
| 128 | NLLSModel (Static) | 741.0714285714286 | 1 | 16 | 4125.0 | 1 | 32 |
| 128 | Standalone (fudged) | 977.1 | 1 | 16 | 3743.0 | 1 | 32 |
| 256 | JuMP (fudged) | 95709.0 | 2 | 32 | 227750.0 | 5 | 128 |
| 256 | NLLSModel (Static) | 1413.8666666666666 | 1 | 16 | 8027.666666666667 | 1 | 32 |
| 256 | Standalone (fudged) | 2033.4 | 1 | 16 | 7444.666666666667 | 1 | 32 |
| 512 | JuMP (fudged) | 192375.0 | 2 | 32 | 493000.0 | 5 | 128 |
| 512 | NLLSModel (Static) | 2942.75 | 1 | 16 | 16459.0 | 1 | 32 |
| 512 | Standalone (fudged) | 3916.6 | 1 | 16 | 16166.0 | 1 | 32 |
| 1024 | JuMP (fudged) | 435333.0 | 2 | 32 | 1.046416e6 | 5 | 128 |
| 1024 | NLLSModel (Static) | 5635.5 | 1 | 16 | 30625.0 | 1 | 32 |
| 1024 | Standalone (fudged) | 7875.0 | 1 | 16 | 30584.0 | 1 | 32 |
| 2048 | JuMP (fudged) | 2.010541e6 | 2 | 32 | 3.858042e6 | 5 | 128 |
| 2048 | NLLSModel (Static) | 11125.0 | 1 | 16 | 63000.0 | 1 | 32 |
| 2048 | Standalone (fudged) | 17375.0 | 1 | 16 | 88833.0 | 1 | 32 |
| 4096 | JuMP (fudged) | 4.143375e6 | 2 | 32 | 1.1501084e7 | 5 | 128 |
| 4096 | NLLSModel (Static) | 21708.0 | 1 | 16 | 132375.0 | 1 | 32 |
| 4096 | Standalone (fudged) | 33458.0 | 1 | 16 | 123708.0 | 1 | 32 |
| 8192 | JuMP (fudged) | 1.0951875e7 | 2 | 32 | 2.8573459e7 | 5 | 128 |
| 8192 | NLLSModel (Static) | 44542.0 | 1 | 16 | 254917.0 | 1 | 32 |
| 8192 | Standalone (fudged) | 65625.0 | 1 | 16 | 255209.0 | 1 | 32 |
| 16384 | JuMP (fudged) | 2.6511041e7 | 2 | 32 | 6.9250417e7 | 5 | 128 |
| 16384 | NLLSModel (Static) | 92416.0 | 1 | 16 | 504708.0 | 1 | 32 |
| 16384 | Standalone (fudged) | 138917.0 | 1 | 16 | 500083.0 | 1 | 32 |
| 32768 | JuMP (fudged) | 5.3150125e7 | 2 | 32 | 1.43948042e8 | 5 | 128 |
| 32768 | NLLSModel (Static) | 176667.0 | 1 | 16 | 1.082167e6 | 1 | 32 |
| 32768 | Standalone (fudged) | 266625.0 | 1 | 16 | 1.000916e6 | 1 | 32 |
| 65536 | JuMP (fudged) | 1.12647541e8 | 2 | 32 | 2.89751333e8 | 5 | 128 |
| 65536 | NLLSModel (Static) | 353792.0 | 1 | 16 | 2.074625e6 | 1 | 32 |
| 65536 | Standalone (fudged) | 546333.0 | 1 | 16 | 1.981833e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 64 | CaNNOLeS (fudged) | 492791.5 | 214 | 80176 | 14 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 2.380208e6 | 686 | 68096 | 8 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 1.6809995e6 | 453 | 25696 | 23 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 735770.5 | 184 | 11824 | 14 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | LeastSquaresOptim (Dogleg, fudged) | 42146.0 | 191 | 462816 | 10 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | LeastSquaresOptim (LM, fudged) | 31354.0 | 147 | 360688 | 7 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | MadNLP | 1.269312e6 | 719 | 52240 | 9 | 9.2008e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM, fudged) | 637583.5 | 1453 | 246432 | 143 | 9.2008e-01 | true | ok | NaN | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion, fudged) | 227584.0 | 1103 | 2872800 | 21 | 9.2008e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 64 | Optim (Newton) | 61646.0 | 191 | 7152 | 11 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 52895.5 | 309 | 22416 | 8 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | SecondOrderOptimization | 22041.5 | 32 | 2064 | 9 | 9.2008e-01 | true | ok | NaN | NaN | rel\_dcost |
| 128 | CaNNOLeS (fudged) | 8.9101455e6 | 869 | 165328 | 76 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 7.824e6 | 1219 | 146768 | 14 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 2.355e6 | 367 | 25376 | 15 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 1.8024375e6 | 217 | 16672 | 19 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | LeastSquaresOptim (Dogleg, fudged) | 81562.5 | 214 | 516976 | 12 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | LeastSquaresOptim (LM, fudged) | 71770.5 | 184 | 466128 | 9 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | MadNLP | 2.316521e6 | 841 | 54224 | 10 | 1.8517e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM, fudged) | 1.017146e6 | 1412 | 391664 | 138 | 1.8517e+00 | true | ok | NaN | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion, fudged) | 503208.0 | 1725 | 4472784 | 23 | 1.8517e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 128 | Optim (Newton) | 123542.0 | 227 | 8240 | 13 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 80666.0 | 309 | 22416 | 8 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | SecondOrderOptimization | 52395.5 | 32 | 2064 | 10 | 1.8517e+00 | true | ok | NaN | NaN | rel\_dcost |
| 256 | CaNNOLeS (fudged) | 3.97975e6 | 287 | 287568 | 31 | 3.7582e+00 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 1.21597085e7 | 1069 | 215184 | 13 | 3.7582e+00 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | 1.919725e7 | 1237 | 78624 | 57 | 3.7582e+00 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 256 | JSOSolvers (trunk) | 4.1763083e7 | 3613 | 191392 | 367 | 3.7582e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 256 | LeastSquaresOptim (Dogleg, fudged) | 176229.0 | 231 | 573824 | 12 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | LeastSquaresOptim (LM, fudged) | 189604.0 | 241 | 625984 | 12 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | MadNLP | 2.4937915e6 | 685 | 51632 | 7 | 3.7582e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM, fudged) | 2.75225e6 | 2290 | 1131600 | 192 | 3.7582e+00 | true | ok | NaN | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion, fudged) | 969000.0 | 1455 | 3858576 | 32 | 3.7582e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 256 | Optim (Newton) | 264104.0 | 225 | 8272 | 14 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 215916.5 | 449 | 33456 | 13 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | SecondOrderOptimization | 130292.0 | 32 | 2064 | 13 | 3.7582e+00 | true | ok | NaN | NaN | rel\_dcost |
| 512 | CaNNOLeS (fudged) | 4.2690205e6 | 264 | 590880 | 16 | 7.4865e+00 | true | ok | NaN | NaN | first\_order |
| 512 | Ipopt | 2.1436333e7 | 1057 | 423344 | 11 | 7.4865e+00 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (tron) | 1.3300625e7 | 481 | 51792 | 22 | 7.4865e+00 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (trunk) | 7.81245e7 | 3493 | 197856 | 355 | 7.4865e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 512 | LeastSquaresOptim (Dogleg, fudged) | 281770.5 | 199 | 484384 | 11 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | LeastSquaresOptim (LM, fudged) | 245708.5 | 169 | 436096 | 8 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | MadNLP | 6.219875e6 | 683 | 51760 | 12 | 7.4865e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM, fudged) | 3.758625e6 | 1696 | 1582192 | 138 | 7.4865e+00 | true | ok | NaN | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion, fudged) | 1.285375e6 | 1125 | 3388128 | 17 | 7.4865e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 512 | Optim (Newton) | 382188.0 | 196 | 7280 | 11 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 249416.5 | 309 | 22416 | 8 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | SecondOrderOptimization | 191417.0 | 32 | 2064 | 9 | 7.4865e+00 | true | ok | NaN | NaN | rel\_dcost |
| 1024 | CaNNOLeS (fudged) | 9.234083e6 | 258 | 1150720 | 13 | 1.4950e+01 | true | ok | NaN | NaN | first\_order |
| 1024 | Ipopt | 4.34553745e7 | 965 | 634768 | 11 | 1.4950e+01 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (tron) | 7.0714084e7 | 987 | 109632 | 42 | 1.4950e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 1024 | JSOSolvers (trunk) | 1.51214167e8 | 3334 | 214800 | 333 | 1.4950e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 1024 | LeastSquaresOptim (Dogleg, fudged) | 438250.0 | 159 | 406976 | 8 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | LeastSquaresOptim (LM, fudged) | 487313.0 | 169 | 463744 | 8 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | MadNLP | 1.29914585e7 | 697 | 51920 | 10 | 1.4950e+01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM, fudged) | 7.3200625e6 | 1663 | 3023616 | 135 | 1.4950e+01 | true | ok | NaN | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion, fudged) | 3.048458e6 | 1345 | 5061632 | 23 | 1.4950e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 1024 | Optim (Newton) | 498562.5 | 134 | 5360 | 7 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 426208.5 | 281 | 20208 | 7 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | SecondOrderOptimization | 286166.5 | 32 | 2064 | 8 | 1.4950e+01 | true | ok | NaN | NaN | rel\_dcost |
| 2048 | CaNNOLeS (fudged) | 2.9648521e7 | 262 | 2140032 | 14 | 2.9833e+01 | true | ok | NaN | NaN | first\_order |
| 2048 | Ipopt | 1.650503955e8 | 1376 | 1579664 | 16 | 2.9833e+01 | true | ok | NaN | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 2.74380042e8 | 938 | 164624 | 38 | 2.9833e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 2048 | JSOSolvers (trunk) | 4.512305e8 | 3410 | 267600 | 344 | 2.9833e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 2048 | LeastSquaresOptim (Dogleg, fudged) | 1.0634585e6 | 177 | 507056 | 9 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | LeastSquaresOptim (LM, fudged) | 1.0523545e6 | 169 | 527232 | 8 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | MadNLP | 2.12244709e8 | 1641 | 67344 | 19 | 2.9833e+01 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 2048 | NonlinearSolve (LM, fudged) | 1.40456455e7 | 1663 | 5995264 | 135 | 2.9833e+01 | true | ok | NaN | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion, fudged) | 5.3135e6 | 1433 | 7526720 | 14 | 2.9833e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 2048 | Optim (Newton) | 1.3914375e6 | 160 | 6192 | 9 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 923584.0 | 281 | 20208 | 7 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | SecondOrderOptimization | 671791.5 | 32 | 2064 | 8 | 2.9833e+01 | true | ok | NaN | NaN | rel\_dcost |
| 4096 | CaNNOLeS (fudged) | 8.4519771e7 | 262 | 4224832 | 13 | 5.9807e+01 | true | ok | NaN | NaN | first\_order |
| 4096 | Ipopt | 2.95340583e8 | 1110 | 2857440 | 12 | 5.9807e+01 | true | ok | NaN | NaN | first\_order |
| 4096 | JSOSolvers (tron) | 8.84657084e8 | 1062 | 285264 | 48 | 5.9807e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 4096 | JSOSolvers (trunk) | 2.043442625e9 | 3396 | 365232 | 342 | 5.9807e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4096 | LeastSquaresOptim (Dogleg, fudged) | 1.8461255e6 | 159 | 554432 | 8 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | LeastSquaresOptim (LM, fudged) | 2.1093335e6 | 169 | 637824 | 8 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | MadNLP | 6.41771708e8 | 1591 | 66416 | 15 | 5.9807e+01 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 4096 | NonlinearSolve (LM, fudged) | 2.7136291e7 | 1641 | 13903712 | 133 | 5.9807e+01 | true | ok | NaN | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion, fudged) | 7.81125e6 | 993 | 8144640 | 12 | 5.9807e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 4096 | Optim (Newton) | 2.3367085e6 | 147 | 5776 | 8 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 1.7942085e6 | 281 | 20208 | 7 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | SecondOrderOptimization | 1.3042295e6 | 32 | 2064 | 8 | 5.9807e+01 | true | ok | NaN | NaN | rel\_dcost |
| 8192 | CaNNOLeS (fudged) | 1.90668542e8 | 264 | 7911264 | 13 | 1.1959e+02 | true | ok | NaN | NaN | first\_order |
| 8192 | Ipopt | 5.890833125e8 | 1063 | 5401376 | 11 | 1.1959e+02 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (tron) | 2.287663292e9 | 1023 | 512768 | 44 | 1.1959e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 8192 | JSOSolvers (trunk) | 6.2488015e9 | 3456 | 564720 | 351 | 1.1959e+02 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8192 | LeastSquaresOptim (Dogleg, fudged) | 3.7874375e6 | 159 | 751040 | 8 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | LeastSquaresOptim (LM, fudged) | 4.269958e6 | 169 | 834432 | 8 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | MadNLP | 9.58060375e8 | 1169 | 59536 | 11 | 1.1959e+02 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 8192 | NonlinearSolve (LM, fudged) | 5.3681021e7 | 1641 | 23275360 | 133 | 1.1959e+02 | true | ok | NaN | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion, fudged) | 2.073675e7 | 1411 | 19993072 | 12 | 1.1959e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 8192 | Optim (Newton) | 4.2800415e6 | 134 | 5360 | 7 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 3.1513745e6 | 281 | 20208 | 7 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | SecondOrderOptimization | 2.2244375e6 | 32 | 2064 | 8 | 1.1959e+02 | true | ok | NaN | NaN | rel\_dcost |
| 16384 | CaNNOLeS (fudged) | 3.93589291e8 | 266 | 15316864 | 13 | 2.3926e+02 | true | ok | NaN | NaN | first\_order |
| 16384 | Ipopt | 1.174630208e9 | 1069 | 10445872 | 11 | 2.3926e+02 | true | ok | NaN | NaN | first\_order |
| 16384 | JSOSolvers (tron) | 4.640955125e9 | 934 | 967248 | 36 | 2.3926e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 16384 | JSOSolvers (trunk) | 1.4102037459e10 | 3339 | 952320 | 334 | 2.3926e+02 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 16384 | LeastSquaresOptim (Dogleg, fudged) | 6.9931455e6 | 159 | 1144256 | 8 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | LeastSquaresOptim (LM, fudged) | 8.2199165e6 | 169 | 1227648 | 8 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | MadNLP | 4.650261333e9 | 1771 | 69296 | 15 | 2.3926e+02 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 16384 | NonlinearSolve (LM, fudged) | 1.092976045e8 | 1641 | 42018656 | 133 | 2.3926e+02 | true | ok | NaN | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion, fudged) | 4.701025e7 | 1565 | 40797472 | 14 | 2.3926e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 16384 | Optim (Newton) | 8.834625e6 | 147 | 5776 | 8 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 6.7118125e6 | 281 | 20208 | 7 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | SecondOrderOptimization | 5.1282705e6 | 32 | 2064 | 8 | 2.3926e+02 | true | ok | NaN | NaN | rel\_dcost |
| 32768 | CaNNOLeS (fudged) | 8.74760104e8 | 276 | 31095008 | 13 | 4.7821e+02 | true | ok | NaN | NaN | first\_order |
| 32768 | Ipopt | 2.808388375e9 | 1173 | 21438592 | 13 | 4.7821e+02 | true | ok | NaN | NaN | first\_order |
| 32768 | JSOSolvers (tron) | 1.1609715417e10 | 1035 | 1889600 | 45 | 4.7821e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 32768 | JSOSolvers (trunk) | 3.0037967417e10 | 3039 | 1718304 | 331 | 4.7821e+02 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 32768 | LeastSquaresOptim (Dogleg, fudged) | 1.4007e7 | 159 | 1930688 | 8 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | LeastSquaresOptim (LM, fudged) | 1.5506729e7 | 169 | 2014080 | 8 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | MadNLP | 1.519425625e9 | 731 | 52432 | 9 | 4.7821e+02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM, fudged) | 2.19366541e8 | 1641 | 79505248 | 133 | 4.7821e+02 | true | ok | NaN | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion, fudged) | 8.9987458e7 | 1543 | 76922320 | 13 | 4.7821e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 32768 | Optim (Newton) | 1.50044585e7 | 134 | 5360 | 7 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 1.24711875e7 | 281 | 20208 | 7 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | SecondOrderOptimization | 8.9555005e6 | 32 | 2064 | 8 | 4.7821e+02 | true | ok | NaN | NaN | rel\_dcost |
| 65536 | CaNNOLeS (fudged) | 1.905961792e9 | 275 | 72005760 | 14 | 9.5686e+02 | true | ok | NaN | NaN | first\_order |
| 65536 | Ipopt | 8.109703791e9 | 1473 | 53488144 | 17 | 9.5686e+02 | true | ok | NaN | NaN | first\_order |
| 65536 | JSOSolvers (tron) | 2.32619315e10 | 997 | 3722784 | 40 | 9.5686e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 65536 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 32768 |
| 65536 | LeastSquaresOptim (Dogleg, fudged) | 2.7572708e7 | 159 | 3503552 | 8 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | LeastSquaresOptim (LM, fudged) | 3.05667085e7 | 169 | 3586944 | 8 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | MadNLP | 4.157201e9 | 761 | 53008 | 12 | 9.5686e+02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM, fudged) | 4.37899792e8 | 1641 | 154478432 | 133 | 9.5686e+02 | true | ok | NaN | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion, fudged) | 2.45786666e8 | 1807 | 176100752 | 21 | 9.5686e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 65536 | Optim (Newton) | 3.5131375e7 | 147 | 5776 | 8 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 2.4949125e7 | 281 | 20208 | 7 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | SecondOrderOptimization | 2.0622833e7 | 32 | 2064 | 8 | 9.5686e+02 | true | ok | NaN | NaN | rel\_dcost |
