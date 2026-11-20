# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Derivatives**: mixed
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:19:48
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
| 4 | BundleAdjustmentModels | 7708.333333333333 | 1 | 16 | 74292.0 | 22 | 199440 |
| 4 | NLLSModel | 1965.909090909091 | 1 | 16 | 16209.0 | 561 | 65536 |
| 8 | BundleAdjustmentModels | 31625.0 | 1 | 16 | 296167.0 | 23 | 729456 |
| 8 | NLLSModel | 2703.125 | 1 | 16 | 46709.0 | 2241 | 261376 |
| 12 | BundleAdjustmentModels | 46542.0 | 1 | 16 | 457041.0 | 24 | 1420704 |
| 12 | NLLSModel | 3137.0 | 1 | 16 | 72416.0 | 3361 | 391936 |
| 16 | BundleAdjustmentModels | 60834.0 | 1 | 16 | 669250.0 | 24 | 2146832 |
| 16 | NLLSModel | 3958.0 | 1 | 16 | 98500.0 | 4481 | 522496 |
| 24 | BundleAdjustmentModels | 135583.0 | 1 | 16 | 1.425e6 | 24 | 4782272 |
| 24 | NLLSModel | 7139.0 | 1 | 16 | 192125.0 | 10081 | 1175296 |
| 32 | BundleAdjustmentModels | 240208.0 | 1 | 16 | 2.564625e6 | 24 | 8479104 |
| 32 | NLLSModel | 10833.0 | 1 | 16 | 335833.0 | 17921 | 2089216 |
| 48 | BundleAdjustmentModels | 574417.0 | 1 | 16 | 6.46425e6 | 24 | 19050288 |
| 48 | NLLSModel | 21875.0 | 1 | 16 | 755042.0 | 40321 | 4700416 |
| 64 | BundleAdjustmentModels | 1.014333e6 | 1 | 16 | 1.3333834e7 | 24 | 33783984 |
| 64 | NLLSModel | 37208.0 | 1 | 16 | 1.311375e6 | 71681 | 8356096 |
| 96 | BundleAdjustmentModels | 2.426583e6 | 1 | 16 | 3.020575e7 | 25 | 75963504 |
| 96 | NLLSModel | 83292.0 | 1 | 16 | 3.717334e6 | 161281 | 18800896 |
| 128 | BundleAdjustmentModels | 4.033792e6 | 1 | 16 | 5.2176416e7 | 25 | 135020144 |
| 128 | NLLSModel | 138542.0 | 1 | 16 | 6.665959e6 | 286721 | 33423616 |
| 192 | BundleAdjustmentModels | 9.026083e6 | 1 | 16 | 1.13641709e8 | 25 | 303666800 |
| 192 | NLLSModel | 330250.0 | 1 | 16 | 1.4488041e7 | 645121 | 75202816 |
| 256 | BundleAdjustmentModels | 1.6083625e7 | 1 | 16 | 2.26589e8 | 25 | 541366896 |
| 256 | NLLSModel | 542667.0 | 1 | 16 | 3.056375e7 | 1146881 | 162529728 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 4 | CaNNOLeS | 788458.0 | 208 | 506240 | 3 | 5.7005e-13 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 1.545125e6 | 314 | 1037152 | 3 | 5.9332e-12 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 3.8931354e7 | 16944 | 73683040 | 10 | 1.6390e-13 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 2.0696396e7 | 10589 | 46126528 | 6 | 9.0046e-13 | true | ok | NaN | NaN | first\_order |
| 4 | MadNLP | 1.101625e6 | 682 | 1412896 | 3 | 5.9332e-12 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | SecondOrderOptimization | 346041.0 | 2928 | 828224 | 3 | 7.1400e-17 | true | ok | NaN | NaN | grad\_tol |
| 8 | CaNNOLeS | 4.528104e6 | 218 | 1852768 | 3 | 8.4558e-17 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 3.8067295e6 | 317 | 3597088 | 3 | 1.1285e-12 | true | ok | NaN | NaN | acceptable |
| 8 | JSOSolvers (tron) | 1.86970958e8 | 24098 | 401308832 | 9 | 8.0596e-14 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 1.12975666e8 | 14627 | 243793648 | 6 | 2.4846e-13 | true | ok | NaN | NaN | first\_order |
| 8 | MadNLP | 4.0133535e6 | 723 | 6290960 | 4 | 8.1754e-16 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | SecondOrderOptimization | 862833.0 | 9832 | 2876512 | 3 | 7.4325e-20 | true | ok | NaN | NaN | grad\_tol |
| 12 | CaNNOLeS | 7.5980625e6 | 226 | 2687840 | 3 | 2.3296e-16 | true | ok | NaN | NaN | first\_order |
| 12 | Ipopt | 6.186021e6 | 334 | 6372400 | 3 | 1.3693e-12 | true | ok | NaN | NaN | acceptable |
| 12 | JSOSolvers (tron) | 2.596525e8 | 24088 | 560369552 | 10 | 4.9516e-13 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 2.12805209e8 | 19578 | 456431920 | 6 | 5.4236e-13 | true | ok | NaN | NaN | first\_order |
| 12 | MadNLP | 6.1679375e6 | 754 | 10527696 | 4 | 3.4959e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 12 | SecondOrderOptimization | 1.3659795e6 | 14475 | 5275664 | 3 | 8.0532e-20 | true | ok | NaN | NaN | grad\_tol |
| 16 | CaNNOLeS | 1.0758896e7 | 226 | 3599200 | 3 | 5.9657e-16 | true | ok | NaN | NaN | first\_order |
| 16 | Ipopt | 8.1085625e6 | 334 | 9249152 | 3 | 5.5050e-12 | true | ok | NaN | NaN | acceptable |
| 16 | JSOSolvers (tron) | 4.99106729e8 | 33958 | 1056231552 | 11 | 2.3327e-13 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 3.62257667e8 | 24678 | 768510000 | 6 | 3.9876e-13 | true | ok | NaN | NaN | first\_order |
| 16 | MadNLP | 8.30625e6 | 754 | 15026592 | 4 | 8.7928e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16 | SecondOrderOptimization | 1.9378335e6 | 19103 | 7597088 | 3 | 4.8304e-19 | true | ok | NaN | NaN | grad\_tol |
| 24 | CaNNOLeS | 2.9423167e7 | 228 | 7662464 | 3 | 1.5729e-15 | true | ok | NaN | NaN | first\_order |
| 24 | Ipopt | 1.857875e7 | 334 | 20326800 | 3 | 4.2527e-12 | true | ok | NaN | NaN | acceptable |
| 24 | JSOSolvers (tron) | 1.134912791e9 | 34648 | 2283195568 | 9 | 4.2689e-13 | true | ok | NaN | NaN | first\_order |
| 24 | JSOSolvers (trunk) | 1.042656666e9 | 32240 | 2128289360 | 6 | 4.4417e-13 | true | ok | NaN | NaN | first\_order |
| 24 | MadNLP | 2.1768459e7 | 766 | 32558816 | 4 | 1.9937e-14 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 24 | SecondOrderOptimization | 5.1090205e6 | 41941 | 16369056 | 3 | 6.2124e-18 | true | ok | NaN | NaN | grad\_tol |
| 32 | CaNNOLeS | 6.03175415e7 | 228 | 13409152 | 3 | 1.5106e-17 | true | ok | NaN | NaN | first\_order |
| 32 | Ipopt | 3.74141045e7 | 334 | 43332560 | 3 | 5.6243e-13 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (tron) | 2.29284725e9 | 36091 | 4197946784 | 14 | 1.3042e-13 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 1.571609292e9 | 27020 | 3146727248 | 6 | 8.0646e-14 | true | ok | NaN | NaN | first\_order |
| 32 | MadNLP | 3.8113958e7 | 725 | 50987072 | 3 | 5.6243e-13 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32 | SecondOrderOptimization | 4.42032915e7 | 73675 | 29166512 | 3 | 1.0214e-19 | true | ok | NaN | NaN | grad\_tol |
| 48 | CaNNOLeS | 1.816575835e8 | 228 | 35347328 | 3 | 2.2426e-18 | true | ok | NaN | NaN | first\_order |
| 48 | Ipopt | 9.1974042e7 | 334 | 93676768 | 3 | 1.2694e-13 | true | ok | NaN | NaN | first\_order |
| 48 | JSOSolvers (tron) | 4.699233833e9 | 32308 | 8489198624 | 9 | 4.0469e-14 | true | ok | NaN | NaN | first\_order |
| 48 | JSOSolvers (trunk) | 3.495963084e9 | 26030 | 6849955024 | 7 | 1.3641e-13 | true | ok | NaN | NaN | first\_order |
| 48 | MadNLP | 9.3633063e7 | 725 | 114237696 | 3 | 1.2694e-13 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 48 | SecondOrderOptimization | 1.37268333e8 | 163947 | 66039712 | 3 | 7.1656e-20 | true | ok | NaN | NaN | grad\_tol |
| 64 | CaNNOLeS | 5.127374585e8 | 228 | 59726720 | 3 | 1.2884e-18 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 1.79980083e8 | 334 | 165247328 | 3 | 7.1581e-14 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 9.705340417e9 | 39268 | 18218318240 | 8 | 1.0309e-14 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 6.881224625e9 | 28310 | 13146936016 | 7 | 1.0301e-13 | true | ok | NaN | NaN | first\_order |
| 64 | MadNLP | 1.845475e8 | 725 | 178571056 | 3 | 7.1581e-14 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | SecondOrderOptimization | 1.81932583e8 | 290070 | 119514224 | 3 | 1.3842e-19 | true | ok | NaN | NaN | grad\_tol |
| 96 | CaNNOLeS | 1.202402583e9 | 228 | 118889344 | 3 | 3.4120e-19 | true | ok | NaN | NaN | first\_order |
| 96 | Ipopt | 5.06994792e8 | 337 | 347430048 | 3 | 3.6154e-14 | true | ok | NaN | NaN | first\_order |
| 96 | JSOSolvers (tron) | 2.3269666e10 | 40499 | 42361570272 | 12 | 1.3421e-14 | true | ok | NaN | NaN | first\_order |
| 96 | JSOSolvers (trunk) | 1.672077375e10 | 29750 | 31042257616 | 7 | 5.3868e-14 | true | ok | NaN | NaN | first\_order |
| 96 | MadNLP | 4.97167208e8 | 728 | 430361184 | 3 | 3.6154e-14 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 96 | SecondOrderOptimization | 3.09556916e8 | 650292 | 306855680 | 3 | 9.6641e-20 | true | ok | NaN | NaN | grad\_tol |
| 128 | CaNNOLeS | 3.024330292e9 | 231 | 232741808 | 3 | 1.1919e-19 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 1.112341875e9 | 337 | 581993120 | 3 | 9.1655e-15 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 3.0212398208e10 | 29369 | 54431467104 | 8 | 7.4411e-13 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 128 | JSOSolvers (trunk) | 3.0120172791e10 | 29510 | 54728593104 | 7 | 1.6077e-13 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 128 | MadNLP | 1.111832916e9 | 728 | 781505616 | 3 | 9.1655e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | SecondOrderOptimization | 3.70892167e8 | 1153533 | 603914400 | 3 | 1.9886e-19 | true | ok | NaN | NaN | grad\_tol |
| 192 | CaNNOLeS | 1.0899424042e10 | 228 | 473045888 | 3 | 1.8793e-19 | true | ok | NaN | NaN | first\_order |
| 192 | Ipopt | 2.78769325e9 | 337 | 1379412640 | 3 | 4.2683e-15 | true | ok | NaN | NaN | first\_order |
| 192 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 128 |
| 192 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 128 |
| 192 | MadNLP | 2.639641875e9 | 728 | 1781832320 | 3 | 4.2683e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 192 | SecondOrderOptimization | 8.53703646e8 | 2590099 | 1584475152 | 3 | 4.6601e-19 | true | ok | NaN | NaN | grad\_tol |
| 256 | CaNNOLeS | 2.6024952625e10 | 231 | 900914096 | 3 | 7.7356e-20 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 5.299784125e9 | 337 | 2382558880 | 3 | 8.2424e-16 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 128 |
| 256 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 128 |
| 256 | MadNLP | 4.863264291e9 | 728 | 3102477632 | 3 | 8.2424e-16 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | SecondOrderOptimization | 1.636696833e9 | 4600116 | 2873297648 | 3 | 2.3940e-19 | true | ok | NaN | NaN | grad\_tol |
