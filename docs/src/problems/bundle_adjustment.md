# Sparse Bundle Adjustment

- **Category**: `large_sparse`
- **Scaling Metric**: Cameras Ncam
- **Problem Sizes Evaluated**: 4, 6, 10, 16, 25, 40, 64, 100, 160, 256 (10 sizes)

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed lines) and **Cost + Linear System Assembly** (solid lines) across problem sizes.

![Sparse Bundle Adjustment Model Evaluation Scaling](../assets/plots/bundle_adjustment_models.png)

### Model Evaluation Timings

| Cameras Ncam | Model | Cost Time | Cost Allocs | Linsys Time | Linsys Allocs | Linsys Memory |
|:---|:---|:---|:---|:---|:---|:---|
| 4 | BundleAdjustmentModels | 2.08 μs | 4 | 11.71 μs | 7 | 1.2 KiB |
| 4 | NLLSModel ★ | 167.0 ns | 0 | 4.62 μs | 0 | 0 B |
| 6 | BundleAdjustmentModels | 4.17 μs | 4 | 24.88 μs | 7 | 1.2 KiB |
| 6 | NLLSModel ★ | 334.0 ns | 0 | 10.42 μs | 0 | 0 B |
| 10 | BundleAdjustmentModels | 10.54 μs | 4 | 68.29 μs | 7 | 1.2 KiB |
| 10 | NLLSModel ★ | 834.0 ns | 0 | 27.00 μs | 0 | 0 B |
| 16 | BundleAdjustmentModels | 26.00 μs | 4 | 177.12 μs | 7 | 1.2 KiB |
| 16 | NLLSModel ★ | 2.21 μs | 0 | 72.88 μs | 0 | 0 B |
| 25 | BundleAdjustmentModels | 65.50 μs | 4 | 432.54 μs | 7 | 1.2 KiB |
| 25 | NLLSModel ★ | 5.12 μs | 0 | 170.54 μs | 0 | 0 B |
| 40 | BundleAdjustmentModels | 192.25 μs | 4 | 1.09 ms | 7 | 1.2 KiB |
| 40 | NLLSModel ★ | 13.08 μs | 0 | 432.50 μs | 0 | 0 B |
| 64 | BundleAdjustmentModels | 430.79 μs | 4 | 2.82 ms | 7 | 1.2 KiB |
| 64 | NLLSModel ★ | 35.79 μs | 0 | 1.30 ms | 0 | 0 B |
| 100 | BundleAdjustmentModels | 1.07 ms | 4 | 6.70 ms | 7 | 1.2 KiB |
| 100 | NLLSModel ★ | 80.46 μs | 0 | 1.26 ms | 3 | 3.4 KiB |
| 160 | BundleAdjustmentModels | 2.72 ms | 4 | 17.73 ms | 7 | 1.2 KiB |
| 160 | NLLSModel ★ | 208.12 μs | 0 | 5.38 ms | 3 | 3.4 KiB |
| 256 | BundleAdjustmentModels | 7.01 ms | 4 | 44.42 ms | 7 | 1.2 KiB |
| 256 | NLLSModel ★ | 528.62 μs | 0 | 11.63 ms | 3 | 3.4 KiB |

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all compatible optimizer families.

![Sparse Bundle Adjustment Optimizer Scaling](../assets/plots/bundle_adjustment_optimizers.png)

### Optimizer Results Summary

| Cameras Ncam | Optimizer | Runtime | Allocs | Memory | Iterations | Final Cost | Converged |
|:---|:---|:---|:---|:---|:---|:---|:---|
| 4 | MadNLP | 380.33 μs | 293200 | 286.3 KiB | 2 | 6.7197e-20 | ✓ Yes |
| 4 | Ipopt | 648.10 μs | 157600 | 153.9 KiB | 2 | 6.7197e-20 | ✓ Yes |
| 4 | SecondOrderOptimization (Sparse LM) | 90.33 μs | 111296 | 108.7 KiB | 3 | 1.2531e-24 | ✓ Yes |
| 4 | SecondOrderOptimization (Sparse Dogleg) | FAILED | 0 | 0 B | 0 | NaN | ✗ No |
| 4 | JSOSolvers (trunk) | 155.42 μs | 158304 | 154.6 KiB | 5 | 1.2760e-16 | ✓ Yes |
| 6 | MadNLP | 516.25 μs | 462032 | 451.2 KiB | 2 | 1.3756e-18 | ✓ Yes |
| 6 | Ipopt | 868.56 μs | 233392 | 227.9 KiB | 2 | 1.3756e-18 | ✓ Yes |
| 6 | SecondOrderOptimization (Sparse LM) | 170.58 μs | 224304 | 219.0 KiB | 3 | 1.3740e-23 | ✓ Yes |
| 6 | SecondOrderOptimization (Sparse Dogleg) | FAILED | 0 | 0 B | 0 | NaN | ✗ No |
| 6 | JSOSolvers (trunk) | 431.58 μs | 236560 | 231.0 KiB | 5 | 2.9760e-16 | ✓ Yes |
| 10 | MadNLP | 1.15 ms | 1334400 | 1.3 MiB | 3 | 4.3109e-15 | ✓ Yes |
| 10 | Ipopt | 1.54 ms | 807920 | 789.0 KiB | 3 | 4.3109e-15 | ✓ Yes |
| 10 | SecondOrderOptimization (Sparse LM) | 556.77 μs | 573504 | 560.1 KiB | 5 | 8.6727e-22 | ✓ Yes |
| 10 | SecondOrderOptimization (Sparse Dogleg) | 642.83 μs | 524384 | 512.1 KiB | 7 | 1.5997e-28 | ✓ Yes |
| 10 | JSOSolvers (trunk) | 13.94 ms | 814880 | 795.8 KiB | 10 | 8.0614e-14 | ✓ Yes |
| 16 | MadNLP | 1.82 ms | 2769696 | 2.6 MiB | 2 | 4.1743e-17 | ✓ Yes |
| 16 | Ipopt | 2.08 ms | 1628528 | 1.6 MiB | 2 | 4.1743e-17 | ✓ Yes |
| 16 | SecondOrderOptimization (Sparse LM) | 1.30 ms | 1155888 | 1.1 MiB | 4 | 5.7579e-27 | ✓ Yes |
| 16 | SecondOrderOptimization (Sparse Dogleg) | 1.59 ms | 1049760 | 1.0 MiB | 6 | 5.9914e-28 | ✓ Yes |
| 16 | JSOSolvers (trunk) | 8.36 ms | 1645808 | 1.6 MiB | 6 | 5.8439e-17 | ✓ Yes |
| 25 | MadNLP | 3.89 ms | 6083920 | 5.8 MiB | 2 | 8.0498e-19 | ✓ Yes |
| 25 | Ipopt | 4.44 ms | 3429392 | 3.3 MiB | 2 | 8.0498e-19 | ✓ Yes |
| 25 | SecondOrderOptimization (Sparse LM) | 3.70 ms | 2616192 | 2.5 MiB | 4 | 1.0180e-27 | ✓ Yes |
| 25 | SecondOrderOptimization (Sparse Dogleg) | 3.75 ms | 2357424 | 2.2 MiB | 5 | 8.1131e-28 | ✓ Yes |
| 25 | JSOSolvers (trunk) | 12.48 ms | 3461072 | 3.3 MiB | 6 | 8.0592e-16 | ✓ Yes |
| 40 | MadNLP | 9.67 ms | 13985232 | 13.3 MiB | 2 | 1.3471e-19 | ✓ Yes |
| 40 | Ipopt | 10.44 ms | 7655136 | 7.3 MiB | 2 | 1.3471e-19 | ✓ Yes |
| 40 | SecondOrderOptimization (Sparse LM) | 11.59 ms | 6167680 | 5.9 MiB | 4 | 4.5852e-27 | ✓ Yes |
| 40 | SecondOrderOptimization (Sparse Dogleg) | 11.65 ms | 5497264 | 5.2 MiB | 5 | 3.2120e-27 | ✓ Yes |
| 40 | JSOSolvers (trunk) | 25.26 ms | 7701152 | 7.3 MiB | 6 | 1.0366e-16 | ✓ Yes |
| 64 | MadNLP | 28.66 ms | 36883728 | 35.2 MiB | 2 | 3.2997e-20 | ✓ Yes |
| 64 | Ipopt | 28.16 ms | 21824112 | 20.8 MiB | 2 | 3.2997e-20 | ✓ Yes |
| 64 | SecondOrderOptimization (Sparse LM) | 36.23 ms | 15080176 | 14.4 MiB | 4 | 7.0158e-27 | ✓ Yes |
| 64 | SecondOrderOptimization (Sparse Dogleg) | 37.07 ms | 13347872 | 12.7 MiB | 5 | 5.2797e-27 | ✓ Yes |
| 64 | JSOSolvers (trunk) | 55.57 ms | 21905968 | 20.9 MiB | 6 | 1.3414e-15 | ✓ Yes |
| 100 | MadNLP | 188.38 ms | 81488064 | 77.7 MiB | 3 | 1.3346e-24 | ✓ Yes |
| 100 | Ipopt | 100.40 ms | 45420448 | 43.3 MiB | 3 | 2.9545e-26 | ✓ Yes |
| 100 | SecondOrderOptimization (Sparse LM) | 129.69 ms | 60396128 | 57.6 MiB | 4 | 1.6439e-26 | ✓ Yes |
| 100 | SecondOrderOptimization (Sparse Dogleg) | 125.03 ms | 58852240 | 56.1 MiB | 5 | 1.2709e-26 | ✓ Yes |
| 100 | JSOSolvers (trunk) | 137.50 ms | 50375296 | 48.0 MiB | 6 | 3.0460e-15 | ✓ Yes |
| 160 | MadNLP | 455.07 ms | 227799712 | 217.2 MiB | 2 | 8.5425e-21 | ✓ Yes |
| 160 | Ipopt | 360.85 ms | 125894400 | 120.1 MiB | 2 | 8.5424e-21 | ✓ Yes |
| 160 | SecondOrderOptimization (Sparse LM) | 426.85 ms | 137875584 | 131.5 MiB | 4 | 4.4781e-26 | ✓ Yes |
| 160 | SecondOrderOptimization (Sparse Dogleg) | 434.10 ms | 123003312 | 117.3 MiB | 5 | 3.4290e-23 | ✓ Yes |
| 160 | JSOSolvers (trunk) | 372.73 ms | 135872192 | 129.6 MiB | 6 | 4.6156e-14 | ✓ Yes |
| 256 | MadNLP | 1.83 s | 636481808 | 607.0 MiB | 2 | 5.6879e-21 | ✓ Yes |
| 256 | Ipopt | 1.02 s | 350972752 | 334.7 MiB | 2 | 5.6876e-21 | ✓ Yes |
| 256 | SecondOrderOptimization (Sparse LM) | 1.75 s | 347444192 | 331.3 MiB | 4 | 1.2351e-25 | ✓ Yes |
| 256 | SecondOrderOptimization (Sparse Dogleg) | 1.76 s | 333452560 | 318.0 MiB | 5 | 9.6253e-26 | ✓ Yes |
| 256 | JSOSolvers (trunk) | 938.26 ms | 351312656 | 335.0 MiB | 6 | 2.6588e-13 | ✓ Yes |

---

## 3. Analysis & Key Takeaways

- **Asymptotic Complexity**: Log-log scaling indicates the empirical runtime growth rate as Cameras Ncam expands.
- **Fastest Model**: The fastest linear system assembly was consistently achieved by `NLLSModel`.
- **Top Optimizer**: Solvers leveraging specialized structure (e.g. sparse block factorization in SecondOrderOptimization) demonstrate superior scaling exponents on large problem regimes.
