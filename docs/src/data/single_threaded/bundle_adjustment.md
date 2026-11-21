# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Derivatives**: mixed
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T04:39:22
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
| 4 | BundleAdjustmentModels | 7750.0 | 1 | 16 | 76708.0 | 22 | 199440 |
| 4 | NLLSModel | 1958.4 | 1 | 16 | 27625.0 | 561 | 65536 |
| 8 | BundleAdjustmentModels | 30625.0 | 1 | 16 | 285084.0 | 23 | 729456 |
| 8 | NLLSModel | 7277.666666666667 | 1 | 16 | 110000.0 | 2241 | 261376 |
| 12 | BundleAdjustmentModels | 46292.0 | 1 | 16 | 447458.0 | 24 | 1420704 |
| 12 | NLLSModel | 12292.0 | 1 | 16 | 164334.0 | 3361 | 391936 |
| 16 | BundleAdjustmentModels | 60875.0 | 1 | 16 | 611500.0 | 24 | 2146832 |
| 16 | NLLSModel | 16542.0 | 1 | 16 | 225208.0 | 4481 | 522496 |
| 24 | BundleAdjustmentModels | 135542.0 | 1 | 16 | 1.350917e6 | 24 | 4782272 |
| 24 | NLLSModel | 35625.0 | 1 | 16 | 515458.0 | 10081 | 1175296 |
| 32 | BundleAdjustmentModels | 240250.0 | 1 | 16 | 2.445375e6 | 24 | 12673408 |
| 32 | NLLSModel | 64458.0 | 1 | 16 | 893291.0 | 17921 | 2089216 |
| 48 | BundleAdjustmentModels | 540500.0 | 1 | 16 | 5.686833e6 | 24 | 19050288 |
| 48 | NLLSModel | 140083.0 | 1 | 16 | 2.162416e6 | 40321 | 4700416 |
| 64 | BundleAdjustmentModels | 955708.0 | 1 | 16 | 1.0214792e7 | 24 | 42696880 |
| 64 | NLLSModel | 246000.0 | 1 | 16 | 3.790417e6 | 71681 | 8356096 |
| 96 | BundleAdjustmentModels | 2.13075e6 | 1 | 16 | 2.4129584e7 | 25 | 79895664 |
| 96 | NLLSModel | 541000.0 | 1 | 16 | 8.446125e6 | 161281 | 18800896 |
| 128 | BundleAdjustmentModels | 3.798583e6 | 1 | 16 | 4.6516834e7 | 25 | 135020144 |
| 128 | NLLSModel | 959083.0 | 1 | 16 | 1.6270583e7 | 286721 | 33423616 |
| 192 | BundleAdjustmentModels | 8.525834e6 | 1 | 16 | 1.06383666e8 | 25 | 303666800 |
| 192 | NLLSModel | 2.141792e6 | 1 | 16 | 3.8229083e7 | 645121 | 75202816 |
| 256 | BundleAdjustmentModels | 1.512975e7 | 1 | 16 | 2.02078667e8 | 25 | 543578736 |
| 256 | NLLSModel | 3.850167e6 | 1 | 16 | 9.2063833e7 | 1146881 | 162529728 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 4 | CaNNOLeS | 727999.5 | 208 | 506240 | 3 | 5.7005e-13 | true | ok | NaN | NaN | first\_order |
| 4 | Ipopt | 1.399729e6 | 306 | 1036736 | 3 | 5.9332e-12 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (tron) | 3.3839313e7 | 16944 | 73683040 | 10 | 1.6390e-13 | true | ok | NaN | NaN | first\_order |
| 4 | JSOSolvers (trunk) | 2.0069521e7 | 10589 | 46126528 | 6 | 9.0046e-13 | true | ok | NaN | NaN | first\_order |
| 4 | MadNLP | 1.0959165e6 | 682 | 1412896 | 3 | 5.9332e-12 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4 | SecondOrderOptimization | 337583.0 | 2874 | 785888 | 3 | 7.1400e-17 | true | ok | NaN | NaN | grad\_tol |
| 8 | CaNNOLeS | 4.426e6 | 218 | 1852768 | 3 | 8.4558e-17 | true | ok | NaN | NaN | first\_order |
| 8 | Ipopt | 4.8743955e6 | 377 | 4789648 | 4 | 8.1754e-16 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (tron) | 1.82578396e8 | 24098 | 401308832 | 9 | 8.0596e-14 | true | ok | NaN | NaN | first\_order |
| 8 | JSOSolvers (trunk) | 1.09933334e8 | 14627 | 243793648 | 6 | 2.4846e-13 | true | ok | NaN | NaN | first\_order |
| 8 | MadNLP | 3.95875e6 | 723 | 6290960 | 4 | 8.1754e-16 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8 | SecondOrderOptimization | 1.2870835e6 | 9774 | 2763616 | 3 | 7.4325e-20 | true | ok | NaN | NaN | grad\_tol |
| 12 | CaNNOLeS | 7.412854e6 | 226 | 2687840 | 3 | 2.3296e-16 | true | ok | NaN | NaN | first\_order |
| 12 | Ipopt | 7.225125e6 | 397 | 8487504 | 4 | 3.4959e-15 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (tron) | 2.48969834e8 | 24088 | 560369552 | 10 | 4.9516e-13 | true | ok | NaN | NaN | first\_order |
| 12 | JSOSolvers (trunk) | 2.08993709e8 | 19578 | 456431920 | 6 | 5.4236e-13 | true | ok | NaN | NaN | first\_order |
| 12 | MadNLP | 6.0179585e6 | 754 | 10527696 | 4 | 3.4959e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 12 | SecondOrderOptimization | 1.9630415e6 | 14414 | 5024192 | 3 | 8.0532e-20 | true | ok | NaN | NaN | grad\_tol |
| 16 | CaNNOLeS | 1.0715354e7 | 226 | 3599200 | 3 | 5.9657e-16 | true | ok | NaN | NaN | first\_order |
| 16 | Ipopt | 9.6707705e6 | 397 | 12321808 | 4 | 8.7928e-15 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (tron) | 4.71270042e8 | 33958 | 1056231552 | 11 | 2.3327e-13 | true | ok | NaN | NaN | first\_order |
| 16 | JSOSolvers (trunk) | 3.47146084e8 | 24678 | 768510000 | 6 | 3.9876e-13 | true | ok | NaN | NaN | first\_order |
| 16 | MadNLP | 8.164146e6 | 754 | 15026592 | 4 | 8.7928e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16 | SecondOrderOptimization | 2.670271e6 | 19042 | 7237200 | 3 | 4.8304e-19 | true | ok | NaN | NaN | grad\_tol |
| 24 | CaNNOLeS | 2.8369521e7 | 228 | 7662464 | 3 | 1.5729e-15 | true | ok | NaN | NaN | first\_order |
| 24 | Ipopt | 2.2314208e7 | 397 | 27086544 | 4 | 1.9937e-14 | true | ok | NaN | NaN | first\_order |
| 24 | JSOSolvers (tron) | 1.074704542e9 | 34648 | 2283195568 | 9 | 4.2689e-13 | true | ok | NaN | NaN | first\_order |
| 24 | JSOSolvers (trunk) | 1.008181e9 | 32240 | 2128289360 | 6 | 4.4417e-13 | true | ok | NaN | NaN | first\_order |
| 24 | MadNLP | 1.9655542e7 | 766 | 32558816 | 4 | 1.9937e-14 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 24 | SecondOrderOptimization | 6.606021e6 | 41880 | 15649760 | 3 | 6.2124e-18 | true | ok | NaN | NaN | grad\_tol |
| 32 | CaNNOLeS | 5.9073958e7 | 228 | 13409152 | 3 | 1.5106e-17 | true | ok | NaN | NaN | first\_order |
| 32 | Ipopt | 3.8110625e7 | 326 | 41120304 | 3 | 5.6243e-13 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (tron) | 1.9926415e9 | 36088 | 4197946736 | 14 | 1.3042e-13 | true | ok | NaN | NaN | first\_order |
| 32 | JSOSolvers (trunk) | 1.498258667e9 | 27020 | 3146727248 | 6 | 8.0646e-14 | true | ok | NaN | NaN | first\_order |
| 32 | MadNLP | 3.674375e7 | 725 | 50593856 | 3 | 5.6243e-13 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32 | SecondOrderOptimization | 1.2995021e7 | 73623 | 27935328 | 3 | 1.0214e-19 | true | ok | NaN | NaN | grad\_tol |
| 48 | CaNNOLeS | 1.635885835e8 | 228 | 33872768 | 3 | 2.2426e-18 | true | ok | NaN | NaN | first\_order |
| 48 | Ipopt | 9.69204795e7 | 326 | 80700224 | 3 | 1.2694e-13 | true | ok | NaN | NaN | first\_order |
| 48 | JSOSolvers (tron) | 4.00278625e9 | 32308 | 8489198624 | 9 | 4.0469e-14 | true | ok | NaN | NaN | first\_order |
| 48 | JSOSolvers (trunk) | 3.234600166e9 | 26030 | 6849955024 | 7 | 1.3641e-13 | true | ok | NaN | NaN | first\_order |
| 48 | MadNLP | 1.01484104e8 | 725 | 101540096 | 3 | 1.2694e-13 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 48 | SecondOrderOptimization | 3.5663917e7 | 163895 | 63762032 | 3 | 7.1656e-20 | true | ok | NaN | NaN | grad\_tol |
| 64 | CaNNOLeS | 3.47749333e8 | 231 | 57072560 | 3 | 1.2884e-18 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 2.0644875e8 | 326 | 146388928 | 3 | 7.1581e-14 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 8.711633417e9 | 39268 | 18218318240 | 8 | 1.0309e-14 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 6.2738865e9 | 28310 | 13146936016 | 7 | 1.0301e-13 | true | ok | NaN | NaN | first\_order |
| 64 | MadNLP | 2.07215084e8 | 725 | 188860208 | 3 | 7.1581e-14 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | SecondOrderOptimization | 9.10771245e7 | 290012 | 113853056 | 3 | 1.3842e-19 | true | ok | NaN | NaN | grad\_tol |
| 96 | CaNNOLeS | 1.122612166e9 | 231 | 137862064 | 3 | 3.4120e-19 | true | ok | NaN | NaN | first\_order |
| 96 | Ipopt | 5.58493e8 | 329 | 345840384 | 3 | 3.6154e-14 | true | ok | NaN | NaN | first\_order |
| 96 | JSOSolvers (tron) | 2.0114016e10 | 40499 | 43415192544 | 12 | 1.3421e-14 | true | ok | NaN | NaN | first\_order |
| 96 | JSOSolvers (trunk) | 1.4829524917e10 | 29750 | 31920980688 | 7 | 5.3868e-14 | true | ok | NaN | NaN | first\_order |
| 96 | MadNLP | 5.79383542e8 | 728 | 451398240 | 3 | 3.6154e-14 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 96 | SecondOrderOptimization | 2.44120208e8 | 650225 | 295595136 | 3 | 9.6640e-20 | true | ok | NaN | NaN | grad\_tol |
| 128 | CaNNOLeS | 2.782847458e9 | 231 | 263052208 | 3 | 1.1919e-19 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 1.030694959e9 | 329 | 694550784 | 3 | 9.1655e-15 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 3.0171198875e10 | 34109 | 66457874784 | 8 | 4.2201e-14 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 128 | JSOSolvers (trunk) | 2.8160491667e10 | 31670 | 61829497552 | 7 | 3.6039e-14 | true | ok | NaN | NaN | first\_order |
| 128 | MadNLP | 1.075880584e9 | 728 | 853496912 | 3 | 9.1655e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | SecondOrderOptimization | 5.28656416e8 | 1153471 | 548630128 | 3 | 1.9886e-19 | true | ok | NaN | NaN | grad\_tol |
| 192 | CaNNOLeS | 9.860987458e9 | 231 | 535796656 | 3 | 1.8793e-19 | true | ok | NaN | NaN | first\_order |
| 192 | Ipopt | 2.994023209e9 | 329 | 1425090816 | 3 | 4.2683e-15 | true | ok | NaN | NaN | first\_order |
| 192 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 128 |
| 192 | JSOSolvers (trunk) | 3.0198268959e10 | 14660 | 61541861712 | 6 | 3.8885e-11 | false | timeout | NaN | NaN | max\_time; cost test passes |
| 192 | MadNLP | 3.353574e9 | 728 | 1784568448 | 3 | 4.2683e-15 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 192 | SecondOrderOptimization | 1.475131709e9 | 2590032 | 1533630864 | 3 | 4.6601e-19 | true | ok | NaN | NaN | grad\_tol |
| 256 | CaNNOLeS | 2.3799417542e10 | 228 | 1001266048 | 3 | 7.7356e-20 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 7.237316833e9 | 329 | 2349102336 | 3 | 8.2424e-16 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 128 |
| 256 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 192 |
| 256 | MadNLP | 7.406025625e9 | 728 | 2969292096 | 3 | 8.2424e-16 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | SecondOrderOptimization | 3.431529166e9 | 4600052 | 2611615904 | 3 | 2.3940e-19 | true | ok | NaN | NaN | grad\_tol |
