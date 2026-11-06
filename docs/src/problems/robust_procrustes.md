# Robust Procrustes on SO(d)

- **Category**: `manifold`
- **Scaling Metric**: Size
- **Problem Sizes Evaluated**: 2, 3, 4, 5, 6, 7, 8, 9, 10, 12 (10 sizes)

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed lines) and **Cost + Linear System Assembly** (solid lines) across problem sizes.

![Robust Procrustes on SO(d) Model Evaluation Scaling](../assets/plots/robust_procrustes_models.png)

### Model Evaluation Timings

| Size | Model | Cost Time | Cost Allocs | Linsys Time | Linsys Allocs | Linsys Memory |
|:---|:---|:---|:---|:---|:---|:---|
| 2 | NLLSModel (ManifoldVar) | 3.00 μs | 12 | 2.85 μs | 12 | 480 B |
| 2 | NLLSModel (Specialized) ★ | 62.5 ns | 0 | 41.5 ns | 0 | 0 B |
| 2 | Manopt (Rotations) | 3.52 μs | 30 | 5.54 μs | 62 | 2.6 KiB |
| 3 | NLLSModel (ManifoldVar) | 4.58 μs | 24 | 4.60 μs | 24 | 960 B |
| 3 | NLLSModel (Specialized) ★ | 41.5 ns | 0 | 83.0 ns | 0 | 0 B |
| 3 | Manopt (Rotations) | 3.79 μs | 54 | 9.38 μs | 218 | 10.7 KiB |
| 4 | NLLSModel (ManifoldVar) | 5.67 μs | 40 | 3.75 μs | 40 | 1.9 KiB |
| 4 | NLLSModel (Specialized) ★ | 104.0 ns | 0 | 104.0 ns | 0 | 0 B |
| 4 | Manopt (Rotations) | 5.10 μs | 86 | 18.85 μs | 604 | 38.6 KiB |
| 5 | NLLSModel (ManifoldVar) | 4.08 μs | 60 | 4.27 μs | 60 | 2.8 KiB |
| 5 | NLLSModel (Specialized) ★ | 187.5 ns | 0 | 187.0 ns | 0 | 0 B |
| 5 | Manopt (Rotations) | 6.46 μs | 126 | 40.54 μs | 1389 | 101.4 KiB |
| 6 | NLLSModel (ManifoldVar) | 4.96 μs | 84 | 4.96 μs | 84 | 4.6 KiB |
| 6 | NLLSModel (Specialized) ★ | 292.0 ns | 0 | 271.0 ns | 0 | 0 B |
| 6 | Manopt (Rotations) | 6.15 μs | 174 | 86.50 μs | 2787 | 262.1 KiB |
| 7 | NLLSModel (ManifoldVar) | 6.67 μs | 112 | 6.90 μs | 112 | 6.1 KiB |
| 7 | NLLSModel (Specialized) ★ | 458.0 ns | 0 | 458.0 ns | 0 | 0 B |
| 7 | Manopt (Rotations) | 9.19 μs | 230 | 197.23 μs | 5063 | 565.2 KiB |
| 8 | NLLSModel (ManifoldVar) | 6.92 μs | 144 | 6.81 μs | 144 | 9.0 KiB |
| 8 | NLLSModel (Specialized) ★ | 729.5 ns | 0 | 646.0 ns | 0 | 0 B |
| 8 | Manopt (Rotations) | 10.65 μs | 295 | 262.92 μs | 8530 | 1.1 MiB |
| 9 | NLLSModel (ManifoldVar) | 8.44 μs | 180 | 8.17 μs | 180 | 11.2 KiB |
| 9 | NLLSModel (Specialized) ★ | 1.04 μs | 0 | 1.02 μs | 0 | 0 B |
| 9 | Manopt (Rotations) | 13.04 μs | 367 | 459.62 μs | 13546 | 1.9 MiB |
| 10 | NLLSModel (ManifoldVar) | 24.73 μs | 220 | 11.17 μs | 220 | 15.5 KiB |
| 10 | NLLSModel (Specialized) ★ | 1.52 μs | 0 | 1.42 μs | 0 | 0 B |
| 10 | Manopt (Rotations) | 15.37 μs | 447 | 904.71 μs | 20520 | 3.6 MiB |
| 12 | NLLSModel (ManifoldVar) | 17.08 μs | 312 | 15.21 μs | 312 | 24.4 KiB |
| 12 | NLLSModel (Specialized) ★ | 3.15 μs | 0 | 3.06 μs | 0 | 0 B |
| 12 | Manopt (Rotations) | 20.81 μs | 631 | 1.99 ms | 42214 | 9.5 MiB |

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all compatible optimizer families.

![Robust Procrustes on SO(d) Optimizer Scaling](../assets/plots/robust_procrustes_optimizers.png)

### Optimizer Results Summary

| Size | Optimizer | Runtime | Allocs | Memory | Iterations | Final Cost | Converged |
|:---|:---|:---|:---|:---|:---|:---|:---|
| 2 | SecondOrderOptimization (Dogleg) | 181.29 μs | 140624 | 137.3 KiB | 15 | 7.5728e-32 | ✓ Yes |
| 2 | SecondOrderOptimization (LM) | 177.92 μs | 147952 | 144.5 KiB | 15 | 3.0494e-31 | ✓ Yes |
| 2 | Manopt (LevenbergMarquardt) | 58.46 μs | 33712 | 32.9 KiB | 4 | 2.1387e-33 | ✓ Yes |
| 3 | SecondOrderOptimization (Dogleg) | 584.48 μs | 921776 | 900.2 KiB | 30 | 3.7711e-06 | ✓ Yes |
| 3 | SecondOrderOptimization (LM) | 578.94 μs | 950752 | 928.5 KiB | 30 | 3.7711e-06 | ✓ Yes |
| 3 | Manopt (LevenbergMarquardt) | 80.75 μs | 224752 | 219.5 KiB | 17 | 1.7353e-02 | ✓ Yes |
| 4 | SecondOrderOptimization (Dogleg) | 547.42 μs | 1552896 | 1.5 MiB | 14 | 3.9226e-06 | ✓ Yes |
| 4 | SecondOrderOptimization (LM) | 698.40 μs | 1768640 | 1.7 MiB | 15 | 3.9226e-06 | ✓ Yes |
| 4 | Manopt (LevenbergMarquardt) | 148.50 μs | 602368 | 588.2 KiB | 16 | 1.7466e-02 | ✓ Yes |
| 5 | SecondOrderOptimization (Dogleg) | 1.03 ms | 5410416 | 5.2 MiB | 16 | 3.9226e-06 | ✓ Yes |
| 5 | SecondOrderOptimization (LM) | 2.48 ms | 5724048 | 5.5 MiB | 16 | 3.9226e-06 | ✓ Yes |
| 5 | Manopt (LevenbergMarquardt) | 276.19 μs | 1343376 | 1.3 MiB | 15 | 1.7500e-02 | ✓ Yes |
| 6 | SecondOrderOptimization (Dogleg) | 1.56 ms | 12794016 | 12.2 MiB | 14 | 3.9226e-06 | ✓ Yes |
| 6 | SecondOrderOptimization (LM) | 2.17 ms | 14534944 | 13.9 MiB | 15 | 3.9226e-06 | ✓ Yes |
| 6 | Manopt (LevenbergMarquardt) | 496.54 μs | 2939488 | 2.8 MiB | 15 | 1.7510e-02 | ✓ Yes |
| 7 | SecondOrderOptimization (Dogleg) | 4.51 ms | 37220896 | 35.5 MiB | 17 | 3.9226e-06 | ✓ Yes |
| 7 | SecondOrderOptimization (LM) | 4.60 ms | 37204384 | 35.5 MiB | 16 | 3.9226e-06 | ✓ Yes |
| 7 | Manopt (LevenbergMarquardt) | 1.47 ms | 6859616 | 6.5 MiB | 10 | 1.7514e-02 | ✓ Yes |
| 8 | SecondOrderOptimization (Dogleg) | 19.33 ms | 75240096 | 71.8 MiB | 16 | 3.9226e-06 | ✓ Yes |
| 8 | SecondOrderOptimization (LM) | 8.16 ms | 79389472 | 75.7 MiB | 1 | 1.3212e-05 | ✓ Yes |
| 8 | Manopt (LevenbergMarquardt) | 1.57 ms | 12460208 | 11.9 MiB | 17 | 1.7515e-02 | ✓ Yes |
| 9 | SecondOrderOptimization (Dogleg) | 21.45 ms | 147293136 | 140.5 MiB | 16 | 3.9226e-06 | ✓ Yes |
| 9 | SecondOrderOptimization (LM) | 37.40 ms | 147617392 | 140.8 MiB | 1 | 1.3493e-05 | ✓ Yes |
| 9 | Manopt (LevenbergMarquardt) | 10.78 ms | 24020464 | 22.9 MiB | 17 | 1.7516e-02 | ✓ Yes |
| 10 | SecondOrderOptimization (Dogleg) | 27.64 ms | 275828336 | 263.1 MiB | 16 | 3.9226e-06 | ✓ Yes |
| 10 | SecondOrderOptimization (LM) | 37.86 ms | 290651840 | 277.2 MiB | 1 | 1.9660e-05 | ✓ Yes |
| 10 | Manopt (LevenbergMarquardt) | 13.68 ms | 43817360 | 41.8 MiB | 16 | 1.7516e-02 | ✓ Yes |
| 12 | SecondOrderOptimization (Dogleg) | 145.61 ms | 834209600 | 795.6 MiB | 17 | 3.9226e-06 | ✓ Yes |
| 12 | SecondOrderOptimization (LM) | 139.44 ms | 835726176 | 797.0 MiB | 9 | 3.9978e-06 | ✓ Yes |
| 12 | Manopt (LevenbergMarquardt) | 24.28 ms | 104688976 | 99.8 MiB | 17 | 1.7516e-02 | ✓ Yes |

---

## 3. Analysis & Key Takeaways

- **Asymptotic Complexity**: Log-log scaling indicates the empirical runtime growth rate as Size expands.
- **Fastest Model**: The fastest linear system assembly was consistently achieved by `NLLSModel (Specialized)`.
- **Top Optimizer**: Solvers leveraging specialized structure (e.g. sparse block factorization in SecondOrderOptimization) demonstrate superior scaling exponents on large problem regimes.
