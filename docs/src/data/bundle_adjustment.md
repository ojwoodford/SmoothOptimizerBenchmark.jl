# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Derivatives**: mixed
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:46:25
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
| 4 | BundleAdjustmentModels | 7847.333333333333 | 1 | 16 | 75083.0 | 22 | 199440 |
| 4 | NLLSModel | 1962.1818181818182 | 1 | 16 | 11375.0 | 561 | 65536 |
| 8 | BundleAdjustmentModels | 32125.0 | 1 | 16 | 290375.0 | 23 | 729456 |
| 8 | NLLSModel | 2601.1428571428573 | 1 | 16 | 48583.0 | 2241 | 261376 |
| 12 | BundleAdjustmentModels | 47250.0 | 1 | 16 | 451833.0 | 24 | 1420704 |
| 12 | NLLSModel | 3279.714285714286 | 1 | 16 | 75583.0 | 3361 | 391936 |
| 16 | BundleAdjustmentModels | 62834.0 | 1 | 16 | 619541.0 | 24 | 2146832 |
| 16 | NLLSModel | 3826.3333333333335 | 1 | 16 | 96042.0 | 4481 | 522496 |
| 24 | BundleAdjustmentModels | 137334.0 | 1 | 16 | 1.404875e6 | 24 | 4782272 |
| 24 | NLLSModel | 6979.25 | 1 | 16 | 190583.0 | 10081 | 1175296 |
| 32 | BundleAdjustmentModels | 243750.0 | 1 | 16 | 2.513625e6 | 24 | 11526528 |
| 32 | NLLSModel | 11459.0 | 1 | 16 | 341125.0 | 17921 | 2089216 |
| 48 | BundleAdjustmentModels | 580791.0 | 1 | 16 | 6.255375e6 | 24 | 19050288 |
| 48 | NLLSModel | 21667.0 | 1 | 16 | 775458.0 | 40321 | 4700416 |
| 64 | BundleAdjustmentModels | 1.025458e6 | 1 | 16 | 1.1014542e7 | 24 | 33783984 |
| 64 | NLLSModel | 93333.0 | 1 | 16 | 1.503291e6 | 71681 | 8356096 |
| 96 | BundleAdjustmentModels | 2.28925e6 | 1 | 16 | 2.6619375e7 | 25 | 75963504 |
| 96 | NLLSModel | 80041.0 | 1 | 16 | 3.366958e6 | 161281 | 18800896 |
| 128 | BundleAdjustmentModels | 4.0795e6 | 1 | 16 | 4.9735875e7 | 25 | 135020144 |
| 128 | NLLSModel | 141333.0 | 1 | 16 | 6.31975e6 | 286721 | 33423616 |
| 192 | BundleAdjustmentModels | 9.139375e6 | 1 | 16 | 1.13467708e8 | 25 | 303666800 |
| 192 | NLLSModel | 306166.0 | 1 | 16 | 1.5093e7 | 645121 | 75202816 |
| 256 | BundleAdjustmentModels | 1.629075e7 | 1 | 16 | 2.15743209e8 | 25 | 541563504 |
| 256 | NLLSModel | 539250.0 | 1 | 16 | 3.0950166e7 | 1146881 | 162529728 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 4 | CaNNOLeS | 737479.5 | 208 | 506240 | 3 | 5.7005e-13 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 1.474667e6 | 306 | 1036736 | 3 | 5.9332e-12 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 3.3314354e7 | 16944 | 73683040 | 10 | 1.6390e-13 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 2.0647875e7 | 10589 | 46126528 | 6 | 9.0046e-13 | true | ok | NaN | NaN | first\_order |
| 4 | MadNLP | 1.1499795e6 | 682 | 1412896 | 3 | 5.9332e-12 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | SecondOrderOptimization | 255396.0 | 2928 | 828224 | 3 | 7.1400e-17 | true | ok | NaN | NaN | grad\_tol |
| 8 | CaNNOLeS | 4.5428955e6 | 218 | 1852768 | 3 | 8.4558e-17 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 5.178792e6 | 377 | 4789648 | 4 | 8.1754e-16 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 1.88446958e8 | 24098 | 401308832 | 9 | 8.0596e-14 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 1.104719375e8 | 14627 | 243793648 | 6 | 2.4846e-13 | true | ok | NaN | NaN | first\_order |
| 8 | MadNLP | 4.0482295e6 | 723 | 6290960 | 4 | 8.1754e-16 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | SecondOrderOptimization | 880646.5 | 9832 | 2876512 | 3 | 7.4325e-20 | true | ok | NaN | NaN | grad\_tol |
| 12 | CaNNOLeS | 7.5480835e6 | 226 | 2687840 | 3 | 2.3296e-16 | true | ok | NaN | NaN | first\_order |
| 12 | Ipopt | 8.0693335e6 | 397 | 8487504 | 4 | 3.4959e-15 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (tron) | 2.55338625e8 | 24088 | 560369552 | 10 | 4.9516e-13 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 2.05759375e8 | 19578 | 456431920 | 6 | 5.4236e-13 | true | ok | NaN | NaN | first\_order |
| 12 | MadNLP | 6.1577295e6 | 754 | 10527696 | 4 | 3.4959e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 12 | SecondOrderOptimization | 1.3770835e6 | 14475 | 5275664 | 3 | 8.0532e-20 | true | ok | NaN | NaN | grad\_tol |
| 16 | CaNNOLeS | 1.0968333e7 | 226 | 3599200 | 3 | 5.9657e-16 | true | ok | NaN | NaN | first\_order |
| 16 | Ipopt | 1.0341333e7 | 397 | 12321808 | 4 | 8.7928e-15 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (tron) | 4.79372792e8 | 33958 | 1056231552 | 11 | 2.3327e-13 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 3.561975e8 | 24678 | 768510000 | 6 | 3.9876e-13 | true | ok | NaN | NaN | first\_order |
| 16 | MadNLP | 8.542917e6 | 754 | 15026592 | 4 | 8.7928e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16 | SecondOrderOptimization | 1.9895e6 | 19103 | 7597088 | 3 | 4.8304e-19 | true | ok | NaN | NaN | grad\_tol |
| 24 | CaNNOLeS | 2.9556042e7 | 228 | 7662464 | 3 | 1.5729e-15 | true | ok | NaN | NaN | first\_order |
| 24 | Ipopt | 2.35365e7 | 397 | 27086544 | 4 | 1.9937e-14 | true | ok | NaN | NaN | first\_order |
| 24 | JSOSolvers (tron) | 1.145176375e9 | 34648 | 2283195568 | 9 | 4.2689e-13 | true | ok | NaN | NaN | first\_order |
| 24 | JSOSolvers (trunk) | 1.025142917e9 | 32240 | 2128289360 | 6 | 4.4417e-13 | true | ok | NaN | NaN | first\_order |
| 24 | MadNLP | 2.07341255e7 | 766 | 32558816 | 4 | 1.9937e-14 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 24 | SecondOrderOptimization | 8.583542e6 | 41941 | 16369056 | 3 | 6.2124e-18 | true | ok | NaN | NaN | grad\_tol |
| 32 | CaNNOLeS | 6.17462715e7 | 228 | 13409152 | 3 | 1.5106e-17 | true | ok | NaN | NaN | first\_order |
| 32 | Ipopt | 3.5258709e7 | 326 | 56406576 | 3 | 5.6243e-13 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (tron) | 2.06905525e9 | 36088 | 4197946736 | 14 | 1.3042e-13 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 1.523754917e9 | 27020 | 3146727248 | 6 | 8.0646e-14 | true | ok | NaN | NaN | first\_order |
| 32 | MadNLP | 3.30073125e7 | 725 | 52805696 | 3 | 5.6243e-13 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32 | SecondOrderOptimization | 9.808083e6 | 73660 | 29166272 | 3 | 1.0214e-19 | true | ok | NaN | NaN | grad\_tol |
| 48 | CaNNOLeS | 1.73627542e8 | 228 | 35347328 | 3 | 2.2426e-18 | true | ok | NaN | NaN | first\_order |
| 48 | Ipopt | 8.5384417e7 | 326 | 80798528 | 3 | 1.2694e-13 | true | ok | NaN | NaN | first\_order |
| 48 | JSOSolvers (tron) | 4.423956542e9 | 32308 | 8489198624 | 9 | 4.0469e-14 | true | ok | NaN | NaN | first\_order |
| 48 | JSOSolvers (trunk) | 3.450681417e9 | 26030 | 6849955024 | 7 | 1.3641e-13 | true | ok | NaN | NaN | first\_order |
| 48 | MadNLP | 7.9172604e7 | 725 | 106307840 | 3 | 1.2694e-13 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 48 | SecondOrderOptimization | 1.3315975e8 | 163947 | 66465696 | 3 | 7.1656e-20 | true | ok | NaN | NaN | grad\_tol |
| 64 | CaNNOLeS | 3.6677925e8 | 228 | 60431232 | 3 | 1.2884e-18 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 1.60758542e8 | 326 | 147224512 | 3 | 7.1581e-14 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 9.063100625e9 | 39268 | 18218318240 | 8 | 1.0309e-14 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 6.431783208e9 | 28310 | 13146936016 | 7 | 1.0301e-13 | true | ok | NaN | NaN | first\_order |
| 64 | MadNLP | 1.61348958e8 | 725 | 187254576 | 3 | 7.1581e-14 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | SecondOrderOptimization | 1.70983208e8 | 290070 | 119071856 | 3 | 1.3842e-19 | true | ok | NaN | NaN | grad\_tol |
| 96 | CaNNOLeS | 1.197757792e9 | 234 | 133307360 | 3 | 3.4120e-19 | true | ok | NaN | NaN | first\_order |
| 96 | Ipopt | 4.700665215e8 | 329 | 351722240 | 3 | 3.6154e-14 | true | ok | NaN | NaN | first\_order |
| 96 | JSOSolvers (tron) | 2.0800220875e10 | 40499 | 43046274016 | 12 | 1.3421e-14 | true | ok | NaN | NaN | first\_order |
| 96 | JSOSolvers (trunk) | 1.5002537667e10 | 29750 | 31635604176 | 7 | 5.3868e-14 | true | ok | NaN | NaN | first\_order |
| 96 | MadNLP | 4.53696792e8 | 728 | 458967648 | 3 | 3.6154e-14 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 96 | SecondOrderOptimization | 3.08526e8 | 650289 | 340197072 | 3 | 9.6641e-20 | true | ok | NaN | NaN | grad\_tol |
| 128 | CaNNOLeS | 2.951663125e9 | 231 | 263052208 | 3 | 1.1919e-19 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 8.04964687e8 | 329 | 628293888 | 3 | 9.1655e-15 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 3.0174553208e10 | 33269 | 62651968352 | 8 | 6.6802e-14 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 128 | JSOSolvers (trunk) | 2.8313034417e10 | 31670 | 59729068752 | 7 | 3.6039e-14 | true | ok | NaN | NaN | first\_order |
| 128 | MadNLP | 7.836752915e8 | 728 | 836703312 | 3 | 9.1655e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | SecondOrderOptimization | 5.40093375e8 | 1153533 | 584138912 | 3 | 1.9886e-19 | true | ok | NaN | NaN | grad\_tol |
| 192 | CaNNOLeS | 1.0062996917e10 | 231 | 473045936 | 3 | 1.8793e-19 | true | ok | NaN | NaN | first\_order |
| 192 | Ipopt | 1.934409e9 | 329 | 1344334080 | 3 | 4.2683e-15 | true | ok | NaN | NaN | first\_order |
| 192 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 128 |
| 192 | JSOSolvers (trunk) | 3.0255952917e10 | 14600 | 60740256848 | 6 | 3.9424e-11 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 192 | MadNLP | 1.951956833e9 | 728 | 1782733440 | 3 | 4.2683e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 192 | SecondOrderOptimization | 8.369252295e8 | 2590096 | 1610869728 | 3 | 4.6601e-19 | true | ok | NaN | NaN | grad\_tol |
| 256 | CaNNOLeS | 2.4054814583e10 | 228 | 1026284416 | 3 | 7.7356e-20 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 4.501021e9 | 329 | 2811688192 | 3 | 8.2424e-16 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 128 |
| 256 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 192 |
| 256 | MadNLP | 4.387266e9 | 728 | 3477376320 | 3 | 8.2424e-16 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | SecondOrderOptimization | 1.384974708e9 | 4600116 | 2815118064 | 3 | 2.3940e-19 | true | ok | NaN | NaN | grad\_tol |
