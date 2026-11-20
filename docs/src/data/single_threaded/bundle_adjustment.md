# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Derivatives**: mixed
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T18:09:03
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
| 4 | BundleAdjustmentModels | 7708.333333333333 | 1 | 16 | 75333.0 | 22 | 199440 |
| 4 | NLLSModel | 1962.090909090909 | 1 | 16 | 28125.0 | 561 | 65536 |
| 8 | BundleAdjustmentModels | 30625.0 | 1 | 16 | 293750.0 | 23 | 729456 |
| 8 | NLLSModel | 7291.666666666667 | 1 | 16 | 112708.0 | 2241 | 261376 |
| 12 | BundleAdjustmentModels | 46209.0 | 1 | 16 | 454042.0 | 24 | 1420704 |
| 12 | NLLSModel | 12167.0 | 1 | 16 | 166750.0 | 3361 | 391936 |
| 16 | BundleAdjustmentModels | 60875.0 | 1 | 16 | 624334.0 | 24 | 2146832 |
| 16 | NLLSModel | 16333.0 | 1 | 16 | 236125.0 | 4481 | 522496 |
| 24 | BundleAdjustmentModels | 135584.0 | 1 | 16 | 1.401125e6 | 24 | 4782272 |
| 24 | NLLSModel | 35209.0 | 1 | 16 | 527375.0 | 10081 | 1175296 |
| 32 | BundleAdjustmentModels | 240250.0 | 1 | 16 | 2.550875e6 | 24 | 12673408 |
| 32 | NLLSModel | 64250.0 | 1 | 16 | 920833.0 | 17921 | 2089216 |
| 48 | BundleAdjustmentModels | 537459.0 | 1 | 16 | 6.038209e6 | 24 | 19050288 |
| 48 | NLLSModel | 140125.0 | 1 | 16 | 2.126833e6 | 40321 | 4700416 |
| 64 | BundleAdjustmentModels | 965750.0 | 1 | 16 | 1.0617625e7 | 24 | 42696880 |
| 64 | NLLSModel | 246125.0 | 1 | 16 | 3.752584e6 | 71681 | 8356096 |
| 96 | BundleAdjustmentModels | 2.168041e6 | 1 | 16 | 2.6230416e7 | 25 | 79895664 |
| 96 | NLLSModel | 545417.0 | 1 | 16 | 8.575416e6 | 161281 | 18800896 |
| 128 | BundleAdjustmentModels | 3.856167e6 | 1 | 16 | 4.7813333e7 | 25 | 135020144 |
| 128 | NLLSModel | 964250.0 | 1 | 16 | 1.6410583e7 | 286721 | 33423616 |
| 192 | BundleAdjustmentModels | 8.667083e6 | 1 | 16 | 1.09927875e8 | 25 | 303666800 |
| 192 | NLLSModel | 2.153958e6 | 1 | 16 | 3.7895333e7 | 645121 | 75202816 |
| 256 | BundleAdjustmentModels | 1.5889166e7 | 1 | 16 | 2.07490833e8 | 25 | 539777648 |
| 256 | NLLSModel | 3.856209e6 | 1 | 16 | 9.1715584e7 | 1146881 | 162529728 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 4 | CaNNOLeS | 732604.0 | 208 | 506240 | 3 | 5.7005e-13 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 1.3955625e6 | 314 | 1037152 | 3 | 5.9332e-12 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 3.61839585e7 | 16944 | 73683040 | 10 | 1.6390e-13 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 2.0693396e7 | 10589 | 46126528 | 6 | 9.0046e-13 | true | ok | NaN | NaN | first\_order |
| 4 | MadNLP | 1.0920205e6 | 682 | 1412896 | 3 | 5.9332e-12 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | SecondOrderOptimization | 332083.0 | 2874 | 785888 | 3 | 7.1400e-17 | true | ok | NaN | NaN | grad\_tol |
| 8 | CaNNOLeS | 4.503063e6 | 218 | 1852768 | 3 | 8.4558e-17 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 3.8834375e6 | 317 | 3597088 | 3 | 1.1285e-12 | true | ok | NaN | NaN | acceptable |
| 8 | JSOSolvers (tron) | 1.90630375e8 | 24098 | 401308832 | 9 | 8.0596e-14 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 1.18705583e8 | 14627 | 243793648 | 6 | 2.4846e-13 | true | ok | NaN | NaN | first\_order |
| 8 | MadNLP | 4.0509375e6 | 723 | 6290960 | 4 | 8.1754e-16 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | SecondOrderOptimization | 1.2716875e6 | 9774 | 2763616 | 3 | 7.4325e-20 | true | ok | NaN | NaN | grad\_tol |
| 12 | CaNNOLeS | 7.5436875e6 | 226 | 2687840 | 3 | 2.3296e-16 | true | ok | NaN | NaN | first\_order |
| 12 | Ipopt | 5.7433125e6 | 334 | 6372400 | 3 | 1.3693e-12 | true | ok | NaN | NaN | acceptable |
| 12 | JSOSolvers (tron) | 2.664472915e8 | 24088 | 560369552 | 10 | 4.9516e-13 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 2.21858083e8 | 19578 | 456431920 | 6 | 5.4236e-13 | true | ok | NaN | NaN | first\_order |
| 12 | MadNLP | 6.1389585e6 | 754 | 10527696 | 4 | 3.4959e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 12 | SecondOrderOptimization | 1.99725e6 | 14414 | 5024192 | 3 | 8.0532e-20 | true | ok | NaN | NaN | grad\_tol |
| 16 | CaNNOLeS | 1.09392295e7 | 226 | 3599200 | 3 | 5.9657e-16 | true | ok | NaN | NaN | first\_order |
| 16 | Ipopt | 7.6008955e6 | 334 | 9249152 | 3 | 5.5050e-12 | true | ok | NaN | NaN | acceptable |
| 16 | JSOSolvers (tron) | 5.053628745e8 | 33958 | 1056231552 | 11 | 2.3327e-13 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 3.6653675e8 | 24678 | 768510000 | 6 | 3.9876e-13 | true | ok | NaN | NaN | first\_order |
| 16 | MadNLP | 8.304834e6 | 754 | 15026592 | 4 | 8.7928e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16 | SecondOrderOptimization | 2.671667e6 | 19042 | 7237200 | 3 | 4.8304e-19 | true | ok | NaN | NaN | grad\_tol |
| 24 | CaNNOLeS | 2.8947042e7 | 228 | 7662464 | 3 | 1.5729e-15 | true | ok | NaN | NaN | first\_order |
| 24 | Ipopt | 1.7550104e7 | 334 | 20326800 | 3 | 4.2527e-12 | true | ok | NaN | NaN | acceptable |
| 24 | JSOSolvers (tron) | 1.130333834e9 | 34648 | 2283195568 | 9 | 4.2689e-13 | true | ok | NaN | NaN | first\_order |
| 24 | JSOSolvers (trunk) | 1.071568417e9 | 32240 | 2128289360 | 6 | 4.4417e-13 | true | ok | NaN | NaN | first\_order |
| 24 | MadNLP | 2.00035005e7 | 766 | 32558816 | 4 | 1.9937e-14 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 24 | SecondOrderOptimization | 6.593104e6 | 41880 | 15649760 | 3 | 6.2124e-18 | true | ok | NaN | NaN | grad\_tol |
| 32 | CaNNOLeS | 5.92665e7 | 228 | 13409152 | 3 | 1.5106e-17 | true | ok | NaN | NaN | first\_order |
| 32 | Ipopt | 3.894875e7 | 334 | 47690704 | 3 | 5.6243e-13 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (tron) | 2.090063917e9 | 36088 | 4197946736 | 14 | 1.3042e-13 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 1.597604792e9 | 27020 | 3146727248 | 6 | 8.0646e-14 | true | ok | NaN | NaN | first\_order |
| 32 | MadNLP | 3.7995271e7 | 725 | 45334592 | 3 | 5.6243e-13 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32 | SecondOrderOptimization | 1.3260729e7 | 73599 | 27934944 | 3 | 1.0214e-19 | true | ok | NaN | NaN | grad\_tol |
| 48 | CaNNOLeS | 1.70102e8 | 228 | 31611776 | 3 | 2.2426e-18 | true | ok | NaN | NaN | first\_order |
| 48 | Ipopt | 1.03671125e8 | 334 | 87287008 | 3 | 1.2694e-13 | true | ok | NaN | NaN | first\_order |
| 48 | JSOSolvers (tron) | 4.316790417e9 | 32308 | 8489198624 | 9 | 4.0469e-14 | true | ok | NaN | NaN | first\_order |
| 48 | JSOSolvers (trunk) | 3.467940792e9 | 26030 | 6849955024 | 7 | 1.3641e-13 | true | ok | NaN | NaN | first\_order |
| 48 | MadNLP | 9.96211875e7 | 725 | 113090816 | 3 | 1.2694e-13 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 48 | SecondOrderOptimization | 3.4962625e7 | 163895 | 64859760 | 3 | 7.1656e-20 | true | ok | NaN | NaN | grad\_tol |
| 64 | CaNNOLeS | 3.51965041e8 | 228 | 76438400 | 3 | 1.2884e-18 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 2.07112958e8 | 334 | 153647456 | 3 | 7.1581e-14 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 9.352649e9 | 39268 | 18218318240 | 8 | 1.0309e-14 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 6.944116959e9 | 28310 | 13146936016 | 7 | 1.0301e-13 | true | ok | NaN | NaN | first\_order |
| 64 | MadNLP | 2.09206958e8 | 725 | 184813360 | 3 | 7.1581e-14 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | SecondOrderOptimization | 1.0540425e8 | 290009 | 115130960 | 3 | 1.3842e-19 | true | ok | NaN | NaN | grad\_tol |
| 96 | CaNNOLeS | 1.209803584e9 | 231 | 144399280 | 3 | 3.4120e-19 | true | ok | NaN | NaN | first\_order |
| 96 | Ipopt | 6.35967646e8 | 337 | 318823584 | 3 | 3.6154e-14 | true | ok | NaN | NaN | first\_order |
| 96 | JSOSolvers (tron) | 2.2487781875e10 | 40499 | 42497967072 | 12 | 1.3421e-14 | true | ok | NaN | NaN | first\_order |
| 96 | JSOSolvers (trunk) | 1.6807219542e10 | 29750 | 31042241232 | 7 | 5.3868e-14 | true | ok | NaN | NaN | first\_order |
| 96 | MadNLP | 6.01875062e8 | 728 | 440355424 | 3 | 3.6154e-14 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 96 | SecondOrderOptimization | 2.552644995e8 | 650225 | 329018496 | 3 | 9.6640e-20 | true | ok | NaN | NaN | grad\_tol |
| 128 | CaNNOLeS | 2.770511833e9 | 231 | 251763632 | 3 | 1.1919e-19 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 1.190654333e9 | 337 | 640795296 | 3 | 9.1655e-15 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 3.0200805375e10 | 29789 | 55330851168 | 8 | 5.0558e-13 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 128 | JSOSolvers (trunk) | 3.0091676042e10 | 28850 | 53493266384 | 7 | 1.8621e-13 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 128 | MadNLP | 1.101075625e9 | 728 | 781505616 | 3 | 9.1655e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | SecondOrderOptimization | 5.44936271e8 | 1153469 | 624733776 | 3 | 1.9886e-19 | true | ok | NaN | NaN | grad\_tol |
| 192 | CaNNOLeS | 9.870356292e9 | 231 | 495655856 | 3 | 1.8793e-19 | true | ok | NaN | NaN | first\_order |
| 192 | Ipopt | 3.240577792e9 | 337 | 1466985120 | 3 | 4.2683e-15 | true | ok | NaN | NaN | first\_order |
| 192 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 128 |
| 192 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 128 |
| 192 | MadNLP | 3.469918375e9 | 728 | 1818122880 | 3 | 4.2683e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 192 | SecondOrderOptimization | 1.655845584e9 | 2590032 | 1574164880 | 3 | 4.6601e-19 | true | ok | NaN | NaN | grad\_tol |
| 256 | CaNNOLeS | 2.5898822958e10 | 230 | 1027365792 | 3 | 7.7356e-20 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 7.763188916e9 | 337 | 2633709216 | 3 | 8.2424e-16 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 128 |
| 256 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 128 |
| 256 | MadNLP | 7.776951292e9 | 728 | 3278179648 | 3 | 8.2424e-16 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | SecondOrderOptimization | 3.368647833e9 | 4600052 | 2802473120 | 3 | 2.3940e-19 | true | ok | NaN | NaN | grad\_tol |
