# Dense Multi-dimensional Rosenbrock

- **Category**: `large_dense`
- **Scaling Metric**: Dimension n
- **Problem Sizes Evaluated**: 4, 6, 8, 10, 14, 18, 24, 32, 45, 60 (10 sizes)

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed lines) and **Cost + Linear System Assembly** (solid lines) across problem sizes.

![Dense Multi-dimensional Rosenbrock Model Evaluation Scaling](../assets/plots/rosenbrock_dense_models.png)

### Model Evaluation Timings

| Dimension n | Model | Cost Time | Cost Allocs | Linsys Time | Linsys Allocs | Linsys Memory |
|:---|:---|:---|:---|:---|:---|:---|
| 4 | NLPModels (MathOptNLSModel) | 3.02 μs | 5 | 7.10 μs | 7 | 160 B |
| 4 | LeastSquaresOptim | 62.5 ns | 0 | 62.0 ns | 0 | 0 B |
| 4 | NLLSModel ★ | 42.0 ns | 0 | 42.0 ns | 0 | 0 B |
| 6 | NLPModels (MathOptNLSModel) | 3.17 μs | 5 | 7.10 μs | 7 | 160 B |
| 6 | LeastSquaresOptim | 41.5 ns | 0 | 63.0 ns | 0 | 0 B |
| 6 | NLLSModel ★ | 42.0 ns | 0 | 20.5 ns | 0 | 0 B |
| 8 | NLPModels (MathOptNLSModel) | 3.35 μs | 5 | 8.17 μs | 7 | 160 B |
| 8 | LeastSquaresOptim ★ | 62.5 ns | 0 | 62.5 ns | 0 | 0 B |
| 8 | NLLSModel | 62.5 ns | 0 | 62.5 ns | 0 | 0 B |
| 10 | NLPModels (MathOptNLSModel) | 3.06 μs | 5 | 9.75 μs | 7 | 160 B |
| 10 | LeastSquaresOptim | 104.0 ns | 0 | 84.0 ns | 0 | 0 B |
| 10 | NLLSModel ★ | 83.5 ns | 0 | 83.0 ns | 0 | 0 B |
| 14 | NLPModels (MathOptNLSModel) | 3.33 μs | 5 | 13.08 μs | 7 | 160 B |
| 14 | LeastSquaresOptim ★ | 125.0 ns | 0 | 104.0 ns | 0 | 0 B |
| 14 | NLLSModel | 146.0 ns | 0 | 125.0 ns | 0 | 0 B |
| 18 | NLPModels (MathOptNLSModel) | 3.33 μs | 5 | 15.58 μs | 7 | 160 B |
| 18 | LeastSquaresOptim ★ | 146.0 ns | 0 | 125.0 ns | 0 | 0 B |
| 18 | NLLSModel | 229.0 ns | 0 | 208.0 ns | 0 | 0 B |
| 24 | NLPModels (MathOptNLSModel) | 3.04 μs | 5 | 23.79 μs | 7 | 160 B |
| 24 | LeastSquaresOptim ★ | 166.0 ns | 0 | 166.5 ns | 0 | 0 B |
| 24 | NLLSModel | 375.0 ns | 0 | 375.0 ns | 0 | 0 B |
| 32 | NLPModels (MathOptNLSModel) | 2.71 μs | 5 | 35.25 μs | 7 | 160 B |
| 32 | LeastSquaresOptim ★ | 270.5 ns | 0 | 250.0 ns | 0 | 0 B |
| 32 | NLLSModel | 667.0 ns | 0 | 666.0 ns | 0 | 0 B |
| 45 | NLPModels (MathOptNLSModel) | 2.90 μs | 5 | 64.92 μs | 7 | 160 B |
| 45 | LeastSquaresOptim ★ | 437.0 ns | 0 | 354.5 ns | 0 | 0 B |
| 45 | NLLSModel | 1.40 μs | 0 | 1.33 μs | 0 | 0 B |
| 60 | NLPModels (MathOptNLSModel) | 3.62 μs | 5 | 114.81 μs | 7 | 160 B |
| 60 | LeastSquaresOptim ★ | 625.5 ns | 0 | 583.0 ns | 0 | 0 B |
| 60 | NLLSModel | 2.40 μs | 0 | 2.38 μs | 0 | 0 B |

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all compatible optimizer families.

![Dense Multi-dimensional Rosenbrock Optimizer Scaling](../assets/plots/rosenbrock_dense_optimizers.png)

### Optimizer Results Summary

| Dimension n | Optimizer | Runtime | Allocs | Memory | Iterations | Final Cost | Converged |
|:---|:---|:---|:---|:---|:---|:---|:---|
| 4 | LeastSquaresOptim (LM) | 35.17 μs | 472832 | 461.8 KiB | 9 | 4.8047e-28 | ✓ Yes |
| 4 | SecondOrderOptimization (Dogleg) | 155.97 ms | 13264 | 13.0 KiB | 8 | 0.0000e+00 | ✓ Yes |
| 4 | LeastSquaresOptim (Dogleg) | 48.46 μs | 420928 | 411.1 KiB | 8 | 0.0000e+00 | ✓ Yes |
| 4 | Ipopt | 17.96 ms | 22560 | 22.0 KiB | 7 | 1.3440e-21 | ✓ Yes |
| 4 | Optim (NewtonTrustRegion) | 5.94 ms | 46128 | 45.0 KiB | 8 | 0.0000e+00 | ✓ Yes |
| 4 | JSOSolvers (tron) | 265.86 ms | 17360 | 17.0 KiB | 9 | 1.2086e-16 | ✓ Yes |
| 4 | Optim (Newton) | 35.60 μs | 26064 | 25.5 KiB | 7 | 3.6348e-22 | ✓ Yes |
| 4 | SecondOrderOptimization (LM) | 53.56 ms | 13408 | 13.1 KiB | 8 | 0.0000e+00 | ✓ Yes |
| 4 | JSOSolvers (trunk) | 189.71 ms | 12320 | 12.0 KiB | 7 | 5.5528e-17 | ✓ Yes |
| 6 | LeastSquaresOptim (LM) | 53.94 μs | 485184 | 473.8 KiB | 9 | 6.5103e-28 | ✓ Yes |
| 6 | SecondOrderOptimization (Dogleg) | 171.77 ms | 20928 | 20.4 KiB | 8 | 0.0000e+00 | ✓ Yes |
| 6 | LeastSquaresOptim (Dogleg) | 64.15 μs | 485776 | 474.4 KiB | 14 | 0.0000e+00 | ✓ Yes |
| 6 | Ipopt | 18.05 ms | 29632 | 28.9 KiB | 8 | 1.3644e-26 | ✓ Yes |
| 6 | Optim (NewtonTrustRegion) | 5.60 ms | 69728 | 68.1 KiB | 8 | 3.2466e-25 | ✓ Yes |
| 6 | JSOSolvers (tron) | 264.54 ms | 21952 | 21.4 KiB | 10 | 3.8580e-15 | ✓ Yes |
| 6 | Optim (Newton) | 42.35 μs | 39728 | 38.8 KiB | 8 | 2.8008e-27 | ✓ Yes |
| 6 | SecondOrderOptimization (LM) | 53.01 ms | 27712 | 27.1 KiB | 10 | 5.3805e-30 | ✓ Yes |
| 6 | JSOSolvers (trunk) | 175.47 ms | 18048 | 17.6 KiB | 9 | 3.0650e-18 | ✓ Yes |
| 8 | LeastSquaresOptim (LM) | 72.19 μs | 502048 | 490.3 KiB | 9 | 1.0826e-24 | ✓ Yes |
| 8 | SecondOrderOptimization (Dogleg) | 36.56 μs | 32768 | 32.0 KiB | 8 | 0.0000e+00 | ✓ Yes |
| 8 | LeastSquaresOptim (Dogleg) | 87.58 μs | 501776 | 490.0 KiB | 9 | 0.0000e+00 | ✓ Yes |
| 8 | Ipopt | 950.38 μs | 34624 | 33.8 KiB | 8 | 2.0175e-24 | ✓ Yes |
| 8 | Optim (NewtonTrustRegion) | 231.58 μs | 111088 | 108.5 KiB | 9 | 0.0000e+00 | ✓ Yes |
| 8 | JSOSolvers (tron) | 80.25 μs | 29968 | 29.3 KiB | 10 | 1.1583e-14 | ✓ Yes |
| 8 | Optim (Newton) | 72.17 μs | 54624 | 53.3 KiB | 8 | 2.0175e-24 | ✓ Yes |
| 8 | SecondOrderOptimization (LM) | 29.85 μs | 35824 | 35.0 KiB | 9 | 0.0000e+00 | ✓ Yes |
| 8 | JSOSolvers (trunk) | 56.33 μs | 24624 | 24.0 KiB | 9 | 3.2796e-16 | ✓ Yes |
| 10 | LeastSquaresOptim (LM) | 139.00 μs | 847664 | 827.8 KiB | 15 | 3.8422e-25 | ✓ Yes |
| 10 | SecondOrderOptimization (Dogleg) | 167.61 ms | 56112 | 54.8 KiB | 10 | 0.0000e+00 | ✓ Yes |
| 10 | LeastSquaresOptim (Dogleg) | 105.73 μs | 522928 | 510.7 KiB | 9 | 0.0000e+00 | ✓ Yes |
| 10 | Ipopt | 17.70 ms | 43456 | 42.4 KiB | 8 | 1.1201e-22 | ✓ Yes |
| 10 | Optim (NewtonTrustRegion) | 5.66 ms | 195680 | 191.1 KiB | 11 | 9.9092e-29 | ✓ Yes |
| 10 | JSOSolvers (tron) | 265.69 ms | 41888 | 40.9 KiB | 11 | 5.9759e-16 | ✓ Yes |
| 10 | Optim (Newton) | 66.04 μs | 79232 | 77.4 KiB | 8 | 1.1201e-22 | ✓ Yes |
| 10 | SecondOrderOptimization (LM) | 55.14 ms | 55360 | 54.1 KiB | 9 | 0.0000e+00 | ✓ Yes |
| 10 | JSOSolvers (trunk) | 193.54 ms | 35856 | 35.0 KiB | 10 | 1.3972e-17 | ✓ Yes |
| 14 | LeastSquaresOptim (LM) | 276.29 μs | 1046816 | 1022.3 KiB | 18 | 7.5856e-27 | ✓ Yes |
| 14 | SecondOrderOptimization (Dogleg) | 76.06 μs | 77872 | 76.0 KiB | 10 | 0.0000e+00 | ✓ Yes |
| 14 | LeastSquaresOptim (Dogleg) | 163.58 μs | 547872 | 535.0 KiB | 9 | 0.0000e+00 | ✓ Yes |
| 14 | Ipopt | 1.11 ms | 55472 | 54.2 KiB | 9 | 0.0000e+00 | ✓ Yes |
| 14 | Optim (NewtonTrustRegion) | 312.94 μs | 229056 | 223.7 KiB | 9 | 5.0883e-19 | ✓ Yes |
| 14 | JSOSolvers (tron) | 171.42 μs | 51456 | 50.2 KiB | 11 | 2.7717e+00 | ✓ Yes |
| 14 | Optim (Newton) | 105.56 μs | 96432 | 94.2 KiB | 9 | 0.0000e+00 | ✓ Yes |
| 14 | SecondOrderOptimization (LM) | 81.40 μs | 80752 | 78.9 KiB | 10 | 0.0000e+00 | ✓ Yes |
| 14 | JSOSolvers (trunk) | 113.60 μs | 45072 | 44.0 KiB | 10 | 2.7717e+00 | ✓ Yes |
| 18 | LeastSquaresOptim (LM) | 500.90 μs | 1141584 | 1.1 MiB | 18 | 5.6493e-26 | ✓ Yes |
| 18 | SecondOrderOptimization (Dogleg) | 130.58 μs | 144832 | 141.4 KiB | 10 | 0.0000e+00 | ✓ Yes |
| 18 | LeastSquaresOptim (Dogleg) | 287.83 μs | 679904 | 664.0 KiB | 10 | 0.0000e+00 | ✓ Yes |
| 18 | Ipopt | 1.11 ms | 84688 | 82.7 KiB | 9 | 2.4556e-23 | ✓ Yes |
| 18 | Optim (NewtonTrustRegion) | 530.42 μs | 402512 | 393.1 KiB | 10 | 5.6406e-24 | ✓ Yes |
| 18 | JSOSolvers (tron) | 270.71 μs | 82880 | 80.9 KiB | 12 | 1.8665e-14 | ✓ Yes |
| 18 | Optim (Newton) | 188.48 μs | 165616 | 161.7 KiB | 9 | 2.4556e-23 | ✓ Yes |
| 18 | SecondOrderOptimization (LM) | 148.02 μs | 151264 | 147.7 KiB | 10 | 0.0000e+00 | ✓ Yes |
| 18 | JSOSolvers (trunk) | 202.48 μs | 77920 | 76.1 KiB | 11 | 2.8014e+00 | ✓ Yes |
| 24 | LeastSquaresOptim (LM) | 1.24 ms | 1291328 | 1.2 MiB | 18 | 4.6659e-25 | ✓ Yes |
| 24 | SecondOrderOptimization (Dogleg) | 334.52 μs | 292336 | 285.5 KiB | 11 | 0.0000e+00 | ✓ Yes |
| 24 | LeastSquaresOptim (Dogleg) | 679.60 μs | 812800 | 793.8 KiB | 10 | 0.0000e+00 | ✓ Yes |
| 24 | Ipopt | 1.40 ms | 146352 | 142.9 KiB | 9 | 2.9696e-19 | ✓ Yes |
| 24 | Optim (NewtonTrustRegion) | 1.36 ms | 894272 | 873.3 KiB | 13 | 1.1415e-26 | ✓ Yes |
| 24 | JSOSolvers (tron) | 640.27 μs | 153040 | 149.5 KiB | 13 | 5.2091e-15 | ✓ Yes |
| 24 | Optim (Newton) | 485.46 μs | 313136 | 305.8 KiB | 9 | 2.9696e-19 | ✓ Yes |
| 24 | SecondOrderOptimization (LM) | 328.62 μs | 294240 | 287.3 KiB | 10 | 0.0000e+00 | ✓ Yes |
| 24 | JSOSolvers (trunk) | 481.79 μs | 143280 | 139.9 KiB | 11 | 2.8248e+00 | ✓ Yes |
| 32 | LeastSquaresOptim (LM) | 4.01 ms | 1590864 | 1.5 MiB | 18 | 3.9810e-22 | ✓ Yes |
| 32 | SecondOrderOptimization (Dogleg) | 674.35 μs | 553440 | 540.5 KiB | 11 | 0.0000e+00 | ✓ Yes |
| 32 | LeastSquaresOptim (Dogleg) | 1.98 ms | 1144896 | 1.1 MiB | 11 | 0.0000e+00 | ✓ Yes |
| 32 | Ipopt | 2.37 ms | 272960 | 266.6 KiB | 10 | 4.5840e-19 | ✓ Yes |
| 32 | Optim (NewtonTrustRegion) | 2.91 ms | 1550144 | 1.5 MiB | 14 | 1.3363e-29 | ✓ Yes |
| 32 | JSOSolvers (tron) | 1.65 ms | 286512 | 279.8 KiB | 14 | 1.5035e-15 | ✓ Yes |
| 32 | Optim (Newton) | 1.16 ms | 585840 | 572.1 KiB | 10 | 4.5840e-19 | ✓ Yes |
| 32 | SecondOrderOptimization (LM) | 737.65 μs | 572448 | 559.0 KiB | 11 | 0.0000e+00 | ✓ Yes |
| 32 | JSOSolvers (trunk) | 1.24 ms | 273728 | 267.3 KiB | 12 | 2.8407e+00 | ✓ Yes |
| 45 | LeastSquaresOptim (LM) | 15.78 ms | 2457744 | 2.3 MiB | 20 | 5.9483e-29 | ✓ Yes |
| 45 | SecondOrderOptimization (Dogleg) | 2.65 ms | 1284016 | 1.2 MiB | 13 | 0.0000e+00 | ✓ Yes |
| 45 | LeastSquaresOptim (Dogleg) | 8.88 ms | 1869872 | 1.8 MiB | 12 | 0.0000e+00 | ✓ Yes |
| 45 | Ipopt | 4.19 ms | 604592 | 590.4 KiB | 11 | 1.2638e-19 | ✓ Yes |
| 45 | Optim (NewtonTrustRegion) | 8.39 ms | 3208128 | 3.1 MiB | 16 | 0.0000e+00 | ✓ Yes |
| 45 | JSOSolvers (tron) | 5.59 ms | 634992 | 620.1 KiB | 15 | 6.1715e-15 | ✓ Yes |
| 45 | Optim (Newton) | 4.65 ms | 1347552 | 1.3 MiB | 11 | 4.3833e-20 | ✓ Yes |
| 45 | SecondOrderOptimization (LM) | 2.71 ms | 1294032 | 1.2 MiB | 12 | 0.0000e+00 | ✓ Yes |
| 45 | JSOSolvers (trunk) | 3.97 ms | 603664 | 589.5 KiB | 12 | 2.8001e-13 | ✓ Yes |
| 60 | LeastSquaresOptim (LM) | 45.79 ms | 4016416 | 3.8 MiB | 22 | 1.8055e-23 | ✓ Yes |
| 60 | SecondOrderOptimization (Dogleg) | 9.00 ms | 2917152 | 2.8 MiB | 18 | 0.0000e+00 | ✓ Yes |
| 60 | LeastSquaresOptim (Dogleg) | 27.28 ms | 3425168 | 3.3 MiB | 15 | 0.0000e+00 | ✓ Yes |
| 60 | Ipopt | 10.76 ms | 1306000 | 1.2 MiB | 15 | 0.0000e+00 | ✓ Yes |
| 60 | Optim (NewtonTrustRegion) | 21.06 ms | 6970640 | 6.6 MiB | 18 | 2.3069e-19 | ✓ Yes |
| 60 | JSOSolvers (tron) | 17.15 ms | 1352432 | 1.3 MiB | 20 | 4.8159e-15 | ✓ Yes |
| 60 | Optim (Newton) | 10.98 ms | 2669936 | 2.5 MiB | 12 | 1.5807e-17 | ✓ Yes |
| 60 | SecondOrderOptimization (LM) | 8.47 ms | 2919840 | 2.8 MiB | 16 | 0.0000e+00 | ✓ Yes |
| 60 | JSOSolvers (trunk) | 11.84 ms | 1289136 | 1.2 MiB | 15 | 1.3595e-12 | ✓ Yes |

---

## 3. Analysis & Key Takeaways

- **Asymptotic Complexity**: Log-log scaling indicates the empirical runtime growth rate as Dimension n expands.
- **Fastest Model**: The fastest linear system assembly was consistently achieved by `NLLSModel`.
- **Top Optimizer**: Solvers leveraging specialized structure (e.g. sparse block factorization in SecondOrderOptimization) demonstrate superior scaling exponents on large problem regimes.
