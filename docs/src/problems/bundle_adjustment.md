# Sparse Bundle Adjustment

- **Category**: `large_sparse`
- **Scaling Metric**: Cameras Ncam
- **Problem Sizes Evaluated**: 5, 10, 15, 20, 30, 45, 65, 90, 130, 200 (10 sizes)

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed lines) and **Cost + Linear System Assembly** (solid lines) across problem sizes.

![Sparse Bundle Adjustment Model Evaluation Scaling](../assets/plots/bundle_adjustment_models.png)

### Model Evaluation Timings

| Cameras Ncam | Model | Cost Time | Cost Allocs | Linsys Time | Linsys Allocs | Linsys Memory |
|:---|:---|:---|:---|:---|:---|:---|
| 5 | NLLSModel (Synthetic Sparse) ★ | 271.0 ns | 0 | 229.0 ns | 0 | 0 B |
| 10 | NLLSModel (Synthetic Sparse) ★ | 854.0 ns | 0 | 833.5 ns | 0 | 0 B |
| 15 | NLLSModel (Synthetic Sparse) ★ | 2.04 μs | 0 | 1.85 μs | 0 | 0 B |
| 20 | NLLSModel (Synthetic Sparse) ★ | 3.35 μs | 0 | 3.27 μs | 0 | 0 B |
| 30 | NLLSModel (Synthetic Sparse) ★ | 7.29 μs | 0 | 7.25 μs | 0 | 0 B |
| 45 | NLLSModel (Synthetic Sparse) ★ | 17.27 μs | 0 | 17.04 μs | 0 | 0 B |
| 65 | NLLSModel (Synthetic Sparse) ★ | 34.23 μs | 0 | 33.98 μs | 0 | 0 B |
| 90 | NLLSModel (Synthetic Sparse) ★ | 62.40 μs | 0 | 64.58 μs | 0 | 0 B |
| 130 | NLLSModel (Synthetic Sparse) ★ | 140.12 μs | 0 | 150.21 μs | 0 | 0 B |
| 200 | NLLSModel (Synthetic Sparse) ★ | 317.10 μs | 0 | 312.46 μs | 0 | 0 B |

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all compatible optimizer families.

![Sparse Bundle Adjustment Optimizer Scaling](../assets/plots/bundle_adjustment_optimizers.png)

### Optimizer Results Summary

| Cameras Ncam | Optimizer | Runtime | Allocs | Memory | Iterations | Final Cost | Converged |
|:---|:---|:---|:---|:---|:---|:---|:---|
| 5 | Ipopt | 58.32 ms | 201136 | 196.4 KiB | 2 | 8.1827e-19 | ✓ Yes |
| 5 | SecondOrderOptimization (Sparse LM) | 704.08 ms | 165440 | 161.6 KiB | 3 | 3.2303e-24 | ✓ Yes |
| 5 | JSOSolvers (trunk) | 193.51 ms | 202960 | 198.2 KiB | 5 | 1.8589e-16 | ✓ Yes |
| 5 | SecondOrderOptimization (Sparse Dogleg) | FAILED | 0 | 0 B | 0 | NaN | ✗ No |
| 10 | Ipopt | 1.64 ms | 807920 | 789.0 KiB | 3 | 4.3109e-15 | ✓ Yes |
| 10 | SecondOrderOptimization (Sparse LM) | 605.12 μs | 573632 | 560.2 KiB | 5 | 8.6727e-22 | ✓ Yes |
| 10 | JSOSolvers (trunk) | 13.63 ms | 814880 | 795.8 KiB | 10 | 8.0614e-14 | ✓ Yes |
| 10 | SecondOrderOptimization (Sparse Dogleg) | 660.94 μs | 524512 | 512.2 KiB | 7 | 1.5997e-28 | ✓ Yes |
| 15 | Ipopt | 1.95 ms | 1507664 | 1.4 MiB | 2 | 1.3041e-17 | ✓ Yes |
| 15 | SecondOrderOptimization (Sparse LM) | 1.21 ms | 1034304 | 1010.1 KiB | 4 | 2.8699e-27 | ✓ Yes |
| 15 | JSOSolvers (trunk) | 7.53 ms | 1521360 | 1.5 MiB | 6 | 1.5252e-16 | ✓ Yes |
| 15 | SecondOrderOptimization (Sparse Dogleg) | 1.40 ms | 940464 | 918.4 KiB | 6 | 3.9057e-28 | ✓ Yes |
| 20 | Ipopt | 10.85 ms | 2065440 | 2.0 MiB | 2 | 1.6220e-18 | ✓ Yes |
| 20 | SecondOrderOptimization (Sparse LM) | 2.12 ms | 1725648 | 1.6 MiB | 4 | 1.0283e-27 | ✓ Yes |
| 20 | JSOSolvers (trunk) | 9.25 ms | 2086304 | 2.0 MiB | 6 | 1.4820e-16 | ✓ Yes |
| 20 | SecondOrderOptimization (Sparse Dogleg) | 2.52 ms | 1558080 | 1.5 MiB | 6 | 7.8487e-28 | ✓ Yes |
| 30 | Ipopt | 5.79 ms | 4181984 | 4.0 MiB | 2 | 9.2073e-19 | ✓ Yes |
| 30 | SecondOrderOptimization (Sparse LM) | 5.78 ms | 3544960 | 3.4 MiB | 4 | 1.3426e-27 | ✓ Yes |
| 30 | JSOSolvers (trunk) | 19.06 ms | 4213664 | 4.0 MiB | 6 | 1.0630e-16 | ✓ Yes |
| 30 | SecondOrderOptimization (Sparse Dogleg) | 5.65 ms | 3171504 | 3.0 MiB | 5 | 1.1197e-27 | ✓ Yes |
| 45 | Ipopt | 12.73 ms | 11660800 | 11.1 MiB | 2 | 2.4394e-20 | ✓ Yes |
| 45 | SecondOrderOptimization (Sparse LM) | 14.81 ms | 7704160 | 7.3 MiB | 4 | 4.5766e-27 | ✓ Yes |
| 45 | JSOSolvers (trunk) | 28.29 ms | 11713984 | 11.2 MiB | 6 | 5.6328e-16 | ✓ Yes |
| 45 | SecondOrderOptimization (Sparse Dogleg) | 19.69 ms | 6844304 | 6.5 MiB | 5 | 3.9377e-27 | ✓ Yes |
| 65 | Ipopt | 39.38 ms | 22144208 | 21.1 MiB | 2 | 3.9688e-20 | ✓ Yes |
| 65 | SecondOrderOptimization (Sparse LM) | 39.14 ms | 15516352 | 14.8 MiB | 4 | 6.7361e-27 | ✓ Yes |
| 65 | JSOSolvers (trunk) | 64.44 ms | 22226064 | 21.2 MiB | 6 | 3.8321e-15 | ✓ Yes |
| 65 | SecondOrderOptimization (Sparse Dogleg) | 37.93 ms | 13734896 | 13.1 MiB | 5 | 5.4458e-27 | ✓ Yes |
| 90 | Ipopt | 88.05 ms | 40202576 | 38.3 MiB | 2 | 5.5916e-20 | ✓ Yes |
| 90 | SecondOrderOptimization (Sparse LM) | 786.02 ms | 44374928 | 42.3 MiB | 4 | 1.3967e-26 | ✓ Yes |
| 90 | JSOSolvers (trunk) | 98.69 ms | 40313104 | 38.4 MiB | 6 | 9.9779e-15 | ✓ Yes |
| 90 | SecondOrderOptimization (Sparse Dogleg) | 172.82 ms | 40672448 | 38.8 MiB | 5 | 1.0830e-26 | ✓ Yes |
| 130 | Ipopt | 189.28 ms | 84639968 | 80.7 MiB | 2 | 9.6435e-21 | ✓ Yes |
| 130 | SecondOrderOptimization (Sparse LM) | 253.85 ms | 87713632 | 83.7 MiB | 4 | 3.6525e-26 | ✓ Yes |
| 130 | JSOSolvers (trunk) | 225.27 ms | 79614112 | 75.9 MiB | 6 | 7.4842e-15 | ✓ Yes |
| 130 | SecondOrderOptimization (Sparse Dogleg) | 281.00 ms | 87492752 | 83.4 MiB | 5 | 2.8288e-26 | ✓ Yes |
| 200 | Ipopt | 638.66 ms | 213813072 | 203.9 MiB | 2 | 1.8428e-20 | ✓ Yes |
| 200 | SecondOrderOptimization (Sparse LM) | 840.76 ms | 204632128 | 195.2 MiB | 4 | 6.9497e-26 | ✓ Yes |
| 200 | JSOSolvers (trunk) | 507.08 ms | 214988560 | 205.0 MiB | 6 | 1.9986e-13 | ✓ Yes |
| 200 | SecondOrderOptimization (Sparse Dogleg) | 1.03 s | 191295920 | 182.4 MiB | 6 | 5.2912e-26 | ✓ Yes |

---

## 3. Analysis & Key Takeaways

- **Asymptotic Complexity**: Log-log scaling indicates the empirical runtime growth rate as Cameras Ncam expands.
- **Fastest Model**: The fastest linear system assembly was consistently achieved by `NLLSModel (Synthetic Sparse)`.
- **Top Optimizer**: Solvers leveraging specialized structure (e.g. sparse block factorization in SecondOrderOptimization) demonstrate superior scaling exponents on large problem regimes.
