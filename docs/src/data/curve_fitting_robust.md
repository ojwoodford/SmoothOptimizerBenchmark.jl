# Benchmark Results: Robust Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone (fudged)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:06:24
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
| 64 | JuMP (fudged) | 24709.0 | 2 | 32 | 55000.0 | 5 | 128 |
| 64 | NLLSModel (Static) | 424.16 | 1 | 16 | 2009.2222222222222 | 1 | 32 |
| 64 | Standalone (fudged) | 522.0 | 1 | 16 | 1947.0 | 1 | 32 |
| 128 | JuMP (fudged) | 48250.0 | 2 | 32 | 110167.0 | 5 | 128 |
| 128 | NLLSModel (Static) | 739.6071428571429 | 1 | 16 | 3958.3333333333335 | 1 | 32 |
| 128 | Standalone (fudged) | 980.1428571428571 | 1 | 16 | 3750.0 | 1 | 32 |
| 256 | JuMP (fudged) | 100250.0 | 2 | 32 | 220916.0 | 5 | 128 |
| 256 | NLLSModel (Static) | 882.5454545454545 | 1 | 16 | 8347.0 | 1 | 32 |
| 256 | Standalone (fudged) | 1916.7 | 1 | 16 | 10236.0 | 1 | 32 |
| 512 | JuMP (fudged) | 192125.0 | 2 | 32 | 452417.0 | 5 | 128 |
| 512 | NLLSModel (Static) | 955.75 | 1 | 16 | 16458.0 | 1 | 32 |
| 512 | Standalone (fudged) | 3986.1666666666665 | 1 | 16 | 15042.0 | 1 | 32 |
| 1024 | JuMP (fudged) | 414709.0 | 2 | 32 | 973334.0 | 5 | 128 |
| 1024 | NLLSModel (Static) | 1569.4166666666667 | 1 | 16 | 12250.0 | 1 | 32 |
| 1024 | Standalone (fudged) | 8236.0 | 1 | 16 | 29541.0 | 1 | 32 |
| 2048 | JuMP (fudged) | 1.287709e6 | 2 | 32 | 3.368625e6 | 5 | 128 |
| 2048 | NLLSModel (Static) | 2375.0 | 1 | 16 | 26500.0 | 1 | 32 |
| 2048 | Standalone (fudged) | 16250.0 | 1 | 16 | 83459.0 | 1 | 32 |
| 4096 | JuMP (fudged) | 3.751625e6 | 2 | 32 | 8.852125e6 | 5 | 128 |
| 4096 | NLLSModel (Static) | 3750.0 | 1 | 16 | 53208.0 | 1 | 32 |
| 4096 | Standalone (fudged) | 33250.0 | 1 | 16 | 123875.0 | 1 | 32 |
| 8192 | JuMP (fudged) | 9.932292e6 | 2 | 32 | 2.5316e7 | 5 | 128 |
| 8192 | NLLSModel (Static) | 6667.0 | 1 | 16 | 82958.0 | 1 | 32 |
| 8192 | Standalone (fudged) | 64083.0 | 1 | 16 | 243584.0 | 1 | 32 |
| 16384 | JuMP (fudged) | 2.3524667e7 | 2 | 32 | 5.7705084e7 | 5 | 128 |
| 16384 | NLLSModel (Static) | 12375.0 | 1 | 16 | 200750.0 | 1 | 32 |
| 16384 | Standalone (fudged) | 130458.0 | 1 | 16 | 498459.0 | 1 | 32 |
| 32768 | JuMP (fudged) | 5.0633833e7 | 2 | 32 | 1.25601833e8 | 5 | 128 |
| 32768 | NLLSModel (Static) | 23916.0 | 1 | 16 | 284791.0 | 1 | 32 |
| 32768 | Standalone (fudged) | 259000.0 | 1 | 16 | 990875.0 | 1 | 32 |
| 65536 | JuMP (fudged) | 1.10666042e8 | 2 | 32 | 2.65957708e8 | 5 | 128 |
| 65536 | NLLSModel (Static) | 47500.0 | 1 | 16 | 836750.0 | 1 | 32 |
| 65536 | Standalone (fudged) | 518792.0 | 1 | 16 | 1.971083e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 64 | CaNNOLeS (fudged) | 478958.5 | 214 | 80176 | 14 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 2.255e6 | 678 | 67696 | 8 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 1.624354e6 | 453 | 25696 | 23 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 719896.0 | 184 | 11824 | 14 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | LeastSquaresOptim (Dogleg, fudged) | 41083.5 | 191 | 462816 | 10 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | LeastSquaresOptim (LM, fudged) | 30125.0 | 147 | 360688 | 7 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | MadNLP | 1.2388125e6 | 719 | 52240 | 9 | 9.2008e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM, fudged) | 604959.0 | 1453 | 246432 | 143 | 9.2008e-01 | true | ok | NaN | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion, fudged) | 225000.0 | 1103 | 2872800 | 21 | 9.2008e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 64 | Optim (Newton) | 60521.0 | 191 | 7152 | 11 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 51854.0 | 301 | 22160 | 8 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | SecondOrderOptimization | 21167.0 | 32 | 2064 | 9 | 9.2008e-01 | true | ok | NaN | NaN | rel\_dcost |
| 128 | CaNNOLeS (fudged) | 8.887917e6 | 869 | 165328 | 76 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 7.437146e6 | 1211 | 146368 | 14 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 2.315042e6 | 367 | 25376 | 15 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 1.793125e6 | 217 | 16672 | 19 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | LeastSquaresOptim (Dogleg, fudged) | 81166.5 | 214 | 516976 | 12 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | LeastSquaresOptim (LM, fudged) | 72604.0 | 184 | 466128 | 9 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | MadNLP | 2.279646e6 | 841 | 54224 | 10 | 1.8517e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM, fudged) | 964792.0 | 1412 | 391664 | 138 | 1.8517e+00 | true | ok | NaN | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion, fudged) | 533416.0 | 1725 | 4472784 | 23 | 1.8517e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 128 | Optim (Newton) | 121083.5 | 227 | 8240 | 13 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 78604.0 | 301 | 22160 | 8 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | SecondOrderOptimization | 49978.5 | 32 | 2064 | 10 | 1.8517e+00 | true | ok | NaN | NaN | rel\_dcost |
| 256 | CaNNOLeS (fudged) | 3.9491875e6 | 287 | 287568 | 31 | 3.7582e+00 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 1.14029375e7 | 1061 | 214784 | 13 | 3.7582e+00 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | 1.8126625e7 | 1237 | 78624 | 57 | 3.7582e+00 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 256 | JSOSolvers (trunk) | 3.9367833e7 | 3613 | 191392 | 367 | 3.7582e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 256 | LeastSquaresOptim (Dogleg, fudged) | 171625.0 | 231 | 573824 | 12 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | LeastSquaresOptim (LM, fudged) | 186729.5 | 241 | 625984 | 12 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | MadNLP | 2.452917e6 | 685 | 51632 | 7 | 3.7582e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM, fudged) | 2.6601875e6 | 2290 | 1131600 | 192 | 3.7582e+00 | true | ok | NaN | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion, fudged) | 972875.0 | 1455 | 3858576 | 32 | 3.7582e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 256 | Optim (Newton) | 257750.0 | 225 | 8272 | 14 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 210020.5 | 436 | 33040 | 13 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | SecondOrderOptimization | 127562.5 | 32 | 2064 | 13 | 3.7582e+00 | true | ok | NaN | NaN | rel\_dcost |
| 512 | CaNNOLeS (fudged) | 4.1842915e6 | 264 | 590880 | 16 | 7.4865e+00 | true | ok | NaN | NaN | first\_order |
| 512 | Ipopt | 2.0378583e7 | 1049 | 422944 | 11 | 7.4865e+00 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (tron) | 1.3141646e7 | 481 | 51792 | 22 | 7.4865e+00 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (trunk) | 7.4206583e7 | 3493 | 197856 | 355 | 7.4865e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 512 | LeastSquaresOptim (Dogleg, fudged) | 273229.0 | 199 | 484384 | 11 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | LeastSquaresOptim (LM, fudged) | 238271.0 | 169 | 436096 | 8 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | MadNLP | 6.1809375e6 | 683 | 51760 | 12 | 7.4865e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM, fudged) | 3.7251255e6 | 1696 | 1582192 | 138 | 7.4865e+00 | true | ok | NaN | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion, fudged) | 1.264667e6 | 1125 | 3388128 | 17 | 7.4865e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 512 | Optim (Newton) | 381208.0 | 196 | 7280 | 11 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 243084.0 | 301 | 22160 | 8 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | SecondOrderOptimization | 185146.0 | 32 | 2064 | 9 | 7.4865e+00 | true | ok | NaN | NaN | rel\_dcost |
| 1024 | CaNNOLeS (fudged) | 8.208979e6 | 258 | 1150720 | 13 | 1.4950e+01 | true | ok | NaN | NaN | first\_order |
| 1024 | Ipopt | 4.0276917e7 | 957 | 634368 | 11 | 1.4950e+01 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (tron) | 6.1104667e7 | 987 | 109632 | 42 | 1.4950e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 1024 | JSOSolvers (trunk) | 1.40781792e8 | 3334 | 214800 | 333 | 1.4950e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 1024 | LeastSquaresOptim (Dogleg, fudged) | 418125.0 | 159 | 406976 | 8 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | LeastSquaresOptim (LM, fudged) | 475062.0 | 169 | 463744 | 8 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | MadNLP | 1.19506875e7 | 697 | 51920 | 10 | 1.4950e+01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM, fudged) | 7.125479e6 | 1663 | 3023616 | 135 | 1.4950e+01 | true | ok | NaN | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion, fudged) | 2.952542e6 | 1345 | 5061632 | 23 | 1.4950e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 1024 | Optim (Newton) | 477187.5 | 134 | 5360 | 7 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 408542.0 | 274 | 19984 | 7 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | SecondOrderOptimization | 110145.5 | 54 | 3344 | 8 | 1.4950e+01 | true | ok | NaN | NaN | rel\_dcost |
| 2048 | CaNNOLeS (fudged) | 2.5780917e7 | 262 | 2140032 | 14 | 2.9833e+01 | true | ok | NaN | NaN | first\_order |
| 2048 | Ipopt | 1.46492834e8 | 1368 | 1579264 | 16 | 2.9833e+01 | true | ok | NaN | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 1.80067792e8 | 938 | 164624 | 38 | 2.9833e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 2048 | JSOSolvers (trunk) | 4.36678791e8 | 3410 | 267600 | 344 | 2.9833e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 2048 | LeastSquaresOptim (Dogleg, fudged) | 1.0655835e6 | 177 | 507056 | 9 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | LeastSquaresOptim (LM, fudged) | 1.057021e6 | 169 | 527232 | 8 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | MadNLP | 2.09817958e8 | 1641 | 67344 | 19 | 2.9833e+01 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 2048 | NonlinearSolve (LM, fudged) | 1.41796465e7 | 1663 | 5995264 | 135 | 2.9833e+01 | true | ok | NaN | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion, fudged) | 5.190417e6 | 1433 | 7526720 | 14 | 2.9833e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 2048 | Optim (Newton) | 1.350271e6 | 160 | 6192 | 9 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 909666.5 | 274 | 19984 | 7 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | SecondOrderOptimization | 216667.0 | 56 | 3552 | 8 | 2.9833e+01 | true | ok | NaN | NaN | rel\_dcost |
| 4096 | CaNNOLeS (fudged) | 6.52555e7 | 262 | 4224832 | 13 | 5.9807e+01 | true | ok | NaN | NaN | first\_order |
| 4096 | Ipopt | 2.673505625e8 | 1102 | 2857040 | 12 | 5.9807e+01 | true | ok | NaN | NaN | first\_order |
| 4096 | JSOSolvers (tron) | 7.55907875e8 | 1062 | 285264 | 48 | 5.9807e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 4096 | JSOSolvers (trunk) | 1.738841167e9 | 3396 | 365232 | 342 | 5.9807e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4096 | LeastSquaresOptim (Dogleg, fudged) | 1.826479e6 | 159 | 554432 | 8 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | LeastSquaresOptim (LM, fudged) | 2.066312e6 | 169 | 637824 | 8 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | MadNLP | 5.49467792e8 | 1591 | 66416 | 15 | 5.9807e+01 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 4096 | NonlinearSolve (LM, fudged) | 2.6131625e7 | 1641 | 13903712 | 133 | 5.9807e+01 | true | ok | NaN | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion, fudged) | 1.1412459e7 | 993 | 8144640 | 12 | 5.9807e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 4096 | Optim (Newton) | 2.2215625e6 | 147 | 5776 | 8 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 1.755833e6 | 274 | 19984 | 7 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | SecondOrderOptimization | 575354.5 | 56 | 3552 | 8 | 5.9807e+01 | true | ok | NaN | NaN | rel\_dcost |
| 8192 | CaNNOLeS (fudged) | 1.67545771e8 | 264 | 7911264 | 13 | 1.1959e+02 | true | ok | NaN | NaN | first\_order |
| 8192 | Ipopt | 5.642159165e8 | 1055 | 5400976 | 11 | 1.1959e+02 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (tron) | 1.805959916e9 | 1023 | 512768 | 44 | 1.1959e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 8192 | JSOSolvers (trunk) | 4.836243291e9 | 3456 | 564720 | 351 | 1.1959e+02 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8192 | LeastSquaresOptim (Dogleg, fudged) | 3.7532505e6 | 159 | 751040 | 8 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | LeastSquaresOptim (LM, fudged) | 4.2248125e6 | 169 | 834432 | 8 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | MadNLP | 9.56257083e8 | 1169 | 59536 | 11 | 1.1959e+02 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 8192 | NonlinearSolve (LM, fudged) | 5.2344583e7 | 1641 | 23275360 | 133 | 1.1959e+02 | true | ok | NaN | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion, fudged) | 2.4937292e7 | 1411 | 19993072 | 12 | 1.1959e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 8192 | Optim (Newton) | 4.210604e6 | 134 | 5360 | 7 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 3.442583e6 | 274 | 19984 | 7 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | SecondOrderOptimization | 723021.0 | 56 | 3552 | 8 | 1.1959e+02 | true | ok | NaN | NaN | rel\_dcost |
| 16384 | CaNNOLeS (fudged) | 3.82180375e8 | 266 | 15316864 | 13 | 2.3926e+02 | true | ok | NaN | NaN | first\_order |
| 16384 | Ipopt | 5.8487715e9 | 1061 | 10445472 | 11 | 2.3926e+02 | true | ok | NaN | NaN | first\_order |
| 16384 | JSOSolvers (tron) | 4.46405725e9 | 904 | 965808 | 33 | 2.3926e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 16384 | JSOSolvers (trunk) | 1.4020869375e10 | 3330 | 951888 | 329 | 2.3926e+02 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 16384 | LeastSquaresOptim (Dogleg, fudged) | 7.3980625e6 | 159 | 1144256 | 8 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | LeastSquaresOptim (LM, fudged) | 8.940667e6 | 169 | 1227648 | 8 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | MadNLP | 4.130466375e9 | 1771 | 69296 | 15 | 2.3926e+02 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 16384 | NonlinearSolve (LM, fudged) | 1.053341245e8 | 1641 | 42018656 | 133 | 2.3926e+02 | true | ok | NaN | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion, fudged) | 4.5970084e7 | 1565 | 40797472 | 14 | 2.3926e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 16384 | Optim (Newton) | 8.693583e6 | 147 | 5776 | 8 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 6.668938e6 | 274 | 19984 | 7 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | SecondOrderOptimization | 1.649729e6 | 56 | 3552 | 8 | 2.3926e+02 | true | ok | NaN | NaN | rel\_dcost |
| 32768 | CaNNOLeS (fudged) | 7.70697187e8 | 276 | 30570720 | 13 | 4.7821e+02 | true | ok | NaN | NaN | first\_order |
| 32768 | Ipopt | 7.567587541e9 | 1165 | 21438192 | 13 | 4.7821e+02 | true | ok | NaN | NaN | first\_order |
| 32768 | JSOSolvers (tron) | 1.0915369416e10 | 1045 | 1890080 | 46 | 4.7821e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 32768 | JSOSolvers (trunk) | 2.8415013e10 | 3371 | 1740288 | 336 | 4.7821e+02 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 32768 | LeastSquaresOptim (Dogleg, fudged) | 1.46249585e7 | 159 | 1930688 | 8 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | LeastSquaresOptim (LM, fudged) | 1.60657505e7 | 169 | 2014080 | 8 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | MadNLP | 1.41915175e9 | 731 | 52432 | 9 | 4.7821e+02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM, fudged) | 2.15077375e8 | 1641 | 79505248 | 133 | 4.7821e+02 | true | ok | NaN | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion, fudged) | 9.4620834e7 | 1543 | 76922320 | 13 | 4.7821e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 32768 | Optim (Newton) | 1.5230709e7 | 134 | 5360 | 7 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 1.2638354e7 | 274 | 19984 | 7 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | SecondOrderOptimization | 3.619896e6 | 56 | 3552 | 8 | 4.7821e+02 | true | ok | NaN | NaN | rel\_dcost |
| 65536 | CaNNOLeS (fudged) | 1.770538458e9 | 275 | 71350400 | 14 | 9.5686e+02 | true | ok | NaN | NaN | first\_order |
| 65536 | Ipopt | 1.3978497333e10 | 1465 | 54487168 | 17 | 9.5686e+02 | true | ok | NaN | NaN | first\_order |
| 65536 | JSOSolvers (tron) | 2.2610887375e10 | 1037 | 3724704 | 44 | 9.5686e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 65536 | JSOSolvers (trunk) | 3.0067328792e10 | 1484 | 3216528 | 159 | 9.5686e+02 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 65536 | LeastSquaresOptim (Dogleg, fudged) | 2.86479375e7 | 159 | 3503552 | 8 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | LeastSquaresOptim (LM, fudged) | 3.1641167e7 | 169 | 3586944 | 8 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | MadNLP | 3.860578709e9 | 761 | 53008 | 12 | 9.5686e+02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM, fudged) | 4.39605292e8 | 1641 | 154478432 | 133 | 9.5686e+02 | true | ok | NaN | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion, fudged) | 2.43824208e8 | 1807 | 176100752 | 21 | 9.5686e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 65536 | Optim (Newton) | 3.5648292e7 | 147 | 5776 | 8 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 2.5236083e7 | 274 | 19984 | 7 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | SecondOrderOptimization | 6.706354e6 | 56 | 3552 | 8 | 9.5686e+02 | true | ok | NaN | NaN | rel\_dcost |
