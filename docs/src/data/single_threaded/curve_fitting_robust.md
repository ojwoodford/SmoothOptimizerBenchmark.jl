# Benchmark Results: Robust Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone (fudged)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T04:00:17
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
| 64 | JuMP (fudged) | 24708.0 | 2 | 32 | 55375.0 | 5 | 128 |
| 64 | NLLSModel (Static) | 402.7843137254902 | 1 | 16 | 1996.1818181818182 | 1 | 32 |
| 64 | Standalone (fudged) | 533.7837837837837 | 1 | 16 | 1958.3 | 1 | 32 |
| 128 | JuMP (fudged) | 48542.0 | 2 | 32 | 108708.0 | 5 | 128 |
| 128 | NLLSModel (Static) | 763.3928571428571 | 1 | 16 | 3902.8333333333335 | 1 | 32 |
| 128 | Standalone (fudged) | 1004.0 | 1 | 16 | 3736.1666666666665 | 1 | 32 |
| 256 | JuMP (fudged) | 96209.0 | 2 | 32 | 216625.0 | 5 | 128 |
| 256 | NLLSModel (Static) | 1413.8666666666666 | 1 | 16 | 7805.666666666667 | 1 | 32 |
| 256 | Standalone (fudged) | 1916.7272727272727 | 1 | 16 | 7458.333333333333 | 1 | 32 |
| 512 | JuMP (fudged) | 190042.0 | 2 | 32 | 432250.0 | 5 | 128 |
| 512 | NLLSModel (Static) | 2765.625 | 1 | 16 | 15416.0 | 1 | 32 |
| 512 | Standalone (fudged) | 3875.0 | 1 | 16 | 14917.0 | 1 | 32 |
| 1024 | JuMP (fudged) | 465083.0 | 2 | 32 | 1.079042e6 | 5 | 128 |
| 1024 | NLLSModel (Static) | 5458.25 | 1 | 16 | 30708.0 | 1 | 32 |
| 1024 | Standalone (fudged) | 7750.0 | 1 | 16 | 29417.0 | 1 | 32 |
| 2048 | JuMP (fudged) | 1.481541e6 | 2 | 32 | 3.086625e6 | 5 | 128 |
| 2048 | NLLSModel (Static) | 10834.0 | 1 | 16 | 61375.0 | 1 | 32 |
| 2048 | Standalone (fudged) | 16250.0 | 1 | 16 | 61417.0 | 1 | 32 |
| 4096 | JuMP (fudged) | 3.681e6 | 2 | 32 | 1.023925e7 | 5 | 128 |
| 4096 | NLLSModel (Static) | 21667.0 | 1 | 16 | 121833.0 | 1 | 32 |
| 4096 | Standalone (fudged) | 32791.0 | 1 | 16 | 121834.0 | 1 | 32 |
| 8192 | JuMP (fudged) | 1.0213583e7 | 2 | 32 | 2.5357708e7 | 5 | 128 |
| 8192 | NLLSModel (Static) | 43625.0 | 1 | 16 | 248208.0 | 1 | 32 |
| 8192 | Standalone (fudged) | 64208.0 | 1 | 16 | 242292.0 | 1 | 32 |
| 16384 | JuMP (fudged) | 2.3631417e7 | 2 | 32 | 6.0939708e7 | 5 | 128 |
| 16384 | NLLSModel (Static) | 86375.0 | 1 | 16 | 496167.0 | 1 | 32 |
| 16384 | Standalone (fudged) | 130750.0 | 1 | 16 | 488958.0 | 1 | 32 |
| 32768 | JuMP (fudged) | 5.0384083e7 | 2 | 32 | 1.30599875e8 | 5 | 128 |
| 32768 | NLLSModel (Static) | 191584.0 | 1 | 16 | 1.013958e6 | 1 | 32 |
| 32768 | Standalone (fudged) | 271792.0 | 1 | 16 | 975084.0 | 1 | 32 |
| 65536 | JuMP (fudged) | 1.08644208e8 | 2 | 32 | 2.757725e8 | 5 | 128 |
| 65536 | NLLSModel (Static) | 345166.0 | 1 | 16 | 2.006375e6 | 1 | 32 |
| 65536 | Standalone (fudged) | 522625.0 | 1 | 16 | 1.968417e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 64 | CaNNOLeS (fudged) | 496187.5 | 214 | 80176 | 14 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 2.268416e6 | 678 | 67696 | 8 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 1.6178955e6 | 453 | 25696 | 23 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 722604.0 | 184 | 11824 | 14 | 9.2008e-01 | true | ok | NaN | NaN | first\_order |
| 64 | LeastSquaresOptim (Dogleg, fudged) | 42395.5 | 191 | 462816 | 10 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | LeastSquaresOptim (LM, fudged) | 33375.0 | 147 | 360688 | 7 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | MadNLP | 1.2495835e6 | 719 | 52240 | 9 | 9.2008e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM, fudged) | 607270.5 | 1453 | 246432 | 143 | 9.2008e-01 | true | ok | NaN | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion, fudged) | 235542.0 | 1103 | 2872800 | 21 | 9.2008e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 64 | Optim (Newton) | 60271.0 | 191 | 7152 | 11 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 52416.5 | 301 | 22160 | 8 | 9.2008e-01 | true | ok | NaN | NaN | converged |
| 64 | SecondOrderOptimization | 21333.0 | 32 | 2064 | 9 | 9.2008e-01 | true | ok | NaN | NaN | rel\_dcost |
| 128 | CaNNOLeS (fudged) | 8.771813e6 | 869 | 165328 | 76 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 7.485396e6 | 1211 | 146368 | 14 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 2.369458e6 | 367 | 25376 | 15 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 1.8063955e6 | 217 | 16672 | 19 | 1.8517e+00 | true | ok | NaN | NaN | first\_order |
| 128 | LeastSquaresOptim (Dogleg, fudged) | 80395.5 | 214 | 516976 | 12 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | LeastSquaresOptim (LM, fudged) | 73125.0 | 184 | 466128 | 9 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | MadNLP | 2.277875e6 | 841 | 54224 | 10 | 1.8517e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM, fudged) | 967854.5 | 1412 | 391664 | 138 | 1.8517e+00 | true | ok | NaN | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion, fudged) | 510166.0 | 1725 | 4472784 | 23 | 1.8517e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 128 | Optim (Newton) | 120791.5 | 227 | 8240 | 13 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 78271.0 | 301 | 22160 | 8 | 1.8517e+00 | true | ok | NaN | NaN | converged |
| 128 | SecondOrderOptimization | 50229.0 | 32 | 2064 | 10 | 1.8517e+00 | true | ok | NaN | NaN | rel\_dcost |
| 256 | CaNNOLeS (fudged) | 3.9029375e6 | 287 | 287568 | 31 | 3.7582e+00 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 1.1377187e7 | 1061 | 214784 | 13 | 3.7582e+00 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | 1.8571542e7 | 1237 | 78624 | 57 | 3.7582e+00 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 256 | JSOSolvers (trunk) | 4.0365667e7 | 3613 | 191392 | 367 | 3.7582e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 256 | LeastSquaresOptim (Dogleg, fudged) | 177333.5 | 231 | 573824 | 12 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | LeastSquaresOptim (LM, fudged) | 193417.0 | 241 | 625984 | 12 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | MadNLP | 2.457e6 | 685 | 51632 | 7 | 3.7582e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM, fudged) | 2.658208e6 | 2290 | 1131600 | 192 | 3.7582e+00 | true | ok | NaN | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion, fudged) | 1.021e6 | 1455 | 3858576 | 32 | 3.7582e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 256 | Optim (Newton) | 260354.5 | 225 | 8272 | 14 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 213833.5 | 436 | 33040 | 13 | 3.7582e+00 | true | ok | NaN | NaN | converged |
| 256 | SecondOrderOptimization | 126895.5 | 32 | 2064 | 13 | 3.7582e+00 | true | ok | NaN | NaN | rel\_dcost |
| 512 | CaNNOLeS (fudged) | 4.2210625e6 | 264 | 590880 | 16 | 7.4865e+00 | true | ok | NaN | NaN | first\_order |
| 512 | Ipopt | 2.079575e7 | 1049 | 422944 | 11 | 7.4865e+00 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (tron) | 1.32915835e7 | 481 | 51792 | 22 | 7.4865e+00 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (trunk) | 7.563e7 | 3493 | 197856 | 355 | 7.4865e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 512 | LeastSquaresOptim (Dogleg, fudged) | 269562.5 | 199 | 484384 | 11 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | LeastSquaresOptim (LM, fudged) | 242125.0 | 169 | 436096 | 8 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | MadNLP | 6.1090625e6 | 683 | 51760 | 12 | 7.4865e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM, fudged) | 3.6615205e6 | 1696 | 1582192 | 138 | 7.4865e+00 | true | ok | NaN | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion, fudged) | 1.233917e6 | 1125 | 3388128 | 17 | 7.4865e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 512 | Optim (Newton) | 374917.0 | 196 | 7280 | 11 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 245958.5 | 301 | 22160 | 8 | 7.4865e+00 | true | ok | NaN | NaN | converged |
| 512 | SecondOrderOptimization | 186042.0 | 32 | 2064 | 9 | 7.4865e+00 | true | ok | NaN | NaN | rel\_dcost |
| 1024 | CaNNOLeS (fudged) | 8.594104e6 | 258 | 1150720 | 13 | 1.4950e+01 | true | ok | NaN | NaN | first\_order |
| 1024 | Ipopt | 4.1579521e7 | 957 | 634368 | 11 | 1.4950e+01 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (tron) | 6.2669459e7 | 987 | 109632 | 42 | 1.4950e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 1024 | JSOSolvers (trunk) | 1.41399041e8 | 3334 | 214800 | 333 | 1.4950e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 1024 | LeastSquaresOptim (Dogleg, fudged) | 412354.0 | 159 | 406976 | 8 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | LeastSquaresOptim (LM, fudged) | 469271.5 | 169 | 463744 | 8 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | MadNLP | 1.28253125e7 | 697 | 51920 | 10 | 1.4950e+01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM, fudged) | 7.1427915e6 | 1663 | 3023616 | 135 | 1.4950e+01 | true | ok | NaN | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion, fudged) | 2.872542e6 | 1345 | 5061632 | 23 | 1.4950e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 1024 | Optim (Newton) | 477896.0 | 134 | 5360 | 7 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 408875.0 | 274 | 19984 | 7 | 1.4950e+01 | true | ok | NaN | NaN | converged |
| 1024 | SecondOrderOptimization | 275979.0 | 32 | 2064 | 8 | 1.4950e+01 | true | ok | NaN | NaN | rel\_dcost |
| 2048 | CaNNOLeS (fudged) | 2.6568063e7 | 262 | 2140032 | 14 | 2.9833e+01 | true | ok | NaN | NaN | first\_order |
| 2048 | Ipopt | 1.46293292e8 | 1368 | 1579264 | 16 | 2.9833e+01 | true | ok | NaN | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 1.76535708e8 | 938 | 164624 | 38 | 2.9833e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 2048 | JSOSolvers (trunk) | 4.34905334e8 | 3410 | 267600 | 344 | 2.9833e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 2048 | LeastSquaresOptim (Dogleg, fudged) | 1.0543745e6 | 177 | 507056 | 9 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | LeastSquaresOptim (LM, fudged) | 1.036979e6 | 169 | 527232 | 8 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | MadNLP | 1.99543875e8 | 1641 | 67344 | 19 | 2.9833e+01 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 2048 | NonlinearSolve (LM, fudged) | 1.3756354e7 | 1663 | 5995264 | 135 | 2.9833e+01 | true | ok | NaN | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion, fudged) | 5.22875e6 | 1433 | 7526720 | 14 | 2.9833e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 2048 | Optim (Newton) | 1.3519375e6 | 160 | 6192 | 9 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 902937.5 | 274 | 19984 | 7 | 2.9833e+01 | true | ok | NaN | NaN | converged |
| 2048 | SecondOrderOptimization | 653687.5 | 32 | 2064 | 8 | 2.9833e+01 | true | ok | NaN | NaN | rel\_dcost |
| 4096 | CaNNOLeS (fudged) | 6.94284585e7 | 262 | 4224832 | 13 | 5.9807e+01 | true | ok | NaN | NaN | first\_order |
| 4096 | Ipopt | 2.686998125e8 | 1102 | 2857040 | 12 | 5.9807e+01 | true | ok | NaN | NaN | first\_order |
| 4096 | JSOSolvers (tron) | 7.87403791e8 | 1062 | 285264 | 48 | 5.9807e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 4096 | JSOSolvers (trunk) | 1.805055958e9 | 3396 | 365232 | 342 | 5.9807e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4096 | LeastSquaresOptim (Dogleg, fudged) | 1.8306875e6 | 159 | 554432 | 8 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | LeastSquaresOptim (LM, fudged) | 2.083083e6 | 169 | 637824 | 8 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | MadNLP | 5.78353958e8 | 1591 | 66416 | 15 | 5.9807e+01 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 4096 | NonlinearSolve (LM, fudged) | 2.6861583e7 | 1641 | 13903712 | 133 | 5.9807e+01 | true | ok | NaN | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion, fudged) | 7.444042e6 | 993 | 8144640 | 12 | 5.9807e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 4096 | Optim (Newton) | 2.2029585e6 | 147 | 5776 | 8 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 1.709583e6 | 274 | 19984 | 7 | 5.9807e+01 | true | ok | NaN | NaN | converged |
| 4096 | SecondOrderOptimization | 1.280208e6 | 32 | 2064 | 8 | 5.9807e+01 | true | ok | NaN | NaN | rel\_dcost |
| 8192 | CaNNOLeS (fudged) | 1.77025542e8 | 264 | 7911264 | 13 | 1.1959e+02 | true | ok | NaN | NaN | first\_order |
| 8192 | Ipopt | 5.8455325e8 | 1055 | 5400976 | 11 | 1.1959e+02 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (tron) | 2.045648417e9 | 1023 | 512768 | 44 | 1.1959e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 8192 | JSOSolvers (trunk) | 5.241687083e9 | 3456 | 564720 | 351 | 1.1959e+02 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8192 | LeastSquaresOptim (Dogleg, fudged) | 3.7685835e6 | 159 | 751040 | 8 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | LeastSquaresOptim (LM, fudged) | 4.3118545e6 | 169 | 834432 | 8 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | MadNLP | 9.90379083e8 | 1169 | 59536 | 11 | 1.1959e+02 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 8192 | NonlinearSolve (LM, fudged) | 5.2383667e7 | 1641 | 23275360 | 133 | 1.1959e+02 | true | ok | NaN | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion, fudged) | 2.0852459e7 | 1411 | 19993072 | 12 | 1.1959e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 8192 | Optim (Newton) | 3.842396e6 | 134 | 5360 | 7 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 3.1634795e6 | 274 | 19984 | 7 | 1.1959e+02 | true | ok | NaN | NaN | converged |
| 8192 | SecondOrderOptimization | 2.2325835e6 | 32 | 2064 | 8 | 1.1959e+02 | true | ok | NaN | NaN | rel\_dcost |
| 16384 | CaNNOLeS (fudged) | 3.95169209e8 | 266 | 15316864 | 13 | 2.3926e+02 | true | ok | NaN | NaN | first\_order |
| 16384 | Ipopt | 1.182233292e9 | 1061 | 10445472 | 11 | 2.3926e+02 | true | ok | NaN | NaN | first\_order |
| 16384 | JSOSolvers (tron) | 4.718122791e9 | 934 | 967248 | 36 | 2.3926e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 16384 | JSOSolvers (trunk) | 1.4203066834e10 | 3339 | 952320 | 334 | 2.3926e+02 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 16384 | LeastSquaresOptim (Dogleg, fudged) | 6.9274165e6 | 159 | 1144256 | 8 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | LeastSquaresOptim (LM, fudged) | 8.292187e6 | 169 | 1227648 | 8 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | MadNLP | 4.512236459e9 | 1771 | 69296 | 15 | 2.3926e+02 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 16384 | NonlinearSolve (LM, fudged) | 1.068017295e8 | 1641 | 42018656 | 133 | 2.3926e+02 | true | ok | NaN | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion, fudged) | 4.7997459e7 | 1565 | 40797472 | 14 | 2.3926e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 16384 | Optim (Newton) | 8.6867495e6 | 147 | 5776 | 8 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 6.779771e6 | 274 | 19984 | 7 | 2.3926e+02 | true | ok | NaN | NaN | converged |
| 16384 | SecondOrderOptimization | 5.234167e6 | 32 | 2064 | 8 | 2.3926e+02 | true | ok | NaN | NaN | rel\_dcost |
| 32768 | CaNNOLeS (fudged) | 8.66526292e8 | 276 | 31095008 | 13 | 4.7821e+02 | true | ok | NaN | NaN | first\_order |
| 32768 | Ipopt | 2.771024959e9 | 1165 | 21438192 | 13 | 4.7821e+02 | true | ok | NaN | NaN | first\_order |
| 32768 | JSOSolvers (tron) | 1.1421931959e10 | 1035 | 1889600 | 45 | 4.7821e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 32768 | JSOSolvers (trunk) | 3.00646375e10 | 3093 | 1720896 | 337 | 4.7821e+02 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 32768 | LeastSquaresOptim (Dogleg, fudged) | 1.38475835e7 | 159 | 1930688 | 8 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | LeastSquaresOptim (LM, fudged) | 1.53234165e7 | 169 | 2014080 | 8 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | MadNLP | 1.567110458e9 | 731 | 52432 | 9 | 4.7821e+02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM, fudged) | 2.19298042e8 | 1641 | 79505248 | 133 | 4.7821e+02 | true | ok | NaN | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion, fudged) | 9.3758875e7 | 1543 | 76922320 | 13 | 4.7821e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 32768 | Optim (Newton) | 1.5033438e7 | 134 | 5360 | 7 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 1.2674292e7 | 274 | 19984 | 7 | 4.7821e+02 | true | ok | NaN | NaN | converged |
| 32768 | SecondOrderOptimization | 8.7055625e6 | 32 | 2064 | 8 | 4.7821e+02 | true | ok | NaN | NaN | rel\_dcost |
| 65536 | CaNNOLeS (fudged) | 1.923379958e9 | 275 | 71809152 | 14 | 9.5686e+02 | true | ok | NaN | NaN | first\_order |
| 65536 | Ipopt | 7.9884105e9 | 1465 | 53487744 | 17 | 9.5686e+02 | true | ok | NaN | NaN | first\_order |
| 65536 | JSOSolvers (tron) | 2.3131953375e10 | 997 | 3722784 | 40 | 9.5686e+02 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 65536 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 32768 |
| 65536 | LeastSquaresOptim (Dogleg, fudged) | 2.75265e7 | 159 | 3503552 | 8 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | LeastSquaresOptim (LM, fudged) | 3.0545896e7 | 169 | 3586944 | 8 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | MadNLP | 4.175553625e9 | 761 | 53008 | 12 | 9.5686e+02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 65536 | NonlinearSolve (LM, fudged) | 4.34552584e8 | 1641 | 154478432 | 133 | 9.5686e+02 | true | ok | NaN | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion, fudged) | 2.43146584e8 | 1807 | 176100752 | 21 | 9.5686e+02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 65536 | Optim (Newton) | 3.5169979e7 | 147 | 5776 | 8 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 2.4887375e7 | 274 | 19984 | 7 | 9.5686e+02 | true | ok | NaN | NaN | converged |
| 65536 | SecondOrderOptimization | 2.05569585e7 | 32 | 2064 | 8 | 9.5686e+02 | true | ok | NaN | NaN | rel\_dcost |
