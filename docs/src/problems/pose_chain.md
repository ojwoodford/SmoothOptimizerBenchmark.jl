# Nonlinear 3D Pose Chain

- **Category**: `large_sparse`
- **Scaling Metric**: Poses N
- **Problem Sizes Evaluated**: 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576 (11 sizes)

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed lines) and **Cost + Linear System Assembly** (solid lines) across problem sizes.

![Nonlinear 3D Pose Chain Model Evaluation Scaling](../assets/plots/pose_chain_models.png)

### Model Evaluation Timings

| Poses N | Model | Cost Time | Cost Allocs | Linsys Time | Linsys Allocs | Linsys Memory |
|:---|:---|:---|:---|:---|:---|:---|
| 1024 | NLLSModel (Sparse) ★ | 18.88 μs | 0 | 18.25 μs | 0 | 0 B |
| 1024 | Standalone (Sparse) | 22.38 μs | 0 | 78.46 μs | 0 | 0 B |
| 2048 | NLLSModel (Sparse) ★ | 35.88 μs | 0 | 35.54 μs | 0 | 0 B |
| 2048 | Standalone (Sparse) | 43.96 μs | 0 | 151.25 μs | 0 | 0 B |
| 4096 | NLLSModel (Sparse) ★ | 74.92 μs | 0 | 70.83 μs | 0 | 0 B |
| 4096 | Standalone (Sparse) | 89.33 μs | 0 | 301.33 μs | 0 | 0 B |
| 8192 | NLLSModel (Sparse) ★ | 141.88 μs | 0 | 139.38 μs | 0 | 0 B |
| 8192 | Standalone (Sparse) | 173.38 μs | 0 | 598.00 μs | 0 | 0 B |
| 16384 | NLLSModel (Sparse) ★ | 280.17 μs | 0 | 279.88 μs | 0 | 0 B |
| 16384 | Standalone (Sparse) | 353.08 μs | 0 | 1.19 ms | 0 | 0 B |
| 32768 | NLLSModel (Sparse) ★ | 568.38 μs | 0 | 567.38 μs | 0 | 0 B |
| 32768 | Standalone (Sparse) | 717.04 μs | 0 | 2.40 ms | 0 | 0 B |
| 65536 | NLLSModel (Sparse) ★ | 1.16 ms | 0 | 1.16 ms | 0 | 0 B |
| 65536 | Standalone (Sparse) | 1.45 ms | 0 | 4.84 ms | 0 | 0 B |
| 131072 | NLLSModel (Sparse) ★ | 2.35 ms | 0 | 2.35 ms | 0 | 0 B |
| 131072 | Standalone (Sparse) | 2.96 ms | 0 | 9.82 ms | 0 | 0 B |
| 262144 | NLLSModel (Sparse) ★ | 4.75 ms | 0 | 4.71 ms | 0 | 0 B |
| 262144 | Standalone (Sparse) | 6.01 ms | 0 | 20.19 ms | 0 | 0 B |
| 524288 | NLLSModel (Sparse) ★ | 9.84 ms | 0 | 9.87 ms | 0 | 0 B |
| 524288 | Standalone (Sparse) | 12.56 ms | 0 | 41.00 ms | 0 | 0 B |
| 1048576 | NLLSModel (Sparse) ★ | 19.46 ms | 0 | 19.10 ms | 0 | 0 B |
| 1048576 | Standalone (Sparse) | 24.00 ms | 0 | 83.68 ms | 0 | 0 B |

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all compatible optimizer families.

![Nonlinear 3D Pose Chain Optimizer Scaling](../assets/plots/pose_chain_optimizers.png)

### Optimizer Results Summary

| Poses N | Optimizer | Runtime | Allocs | Memory | Iterations | Final Cost | Converged |
|:---|:---|:---|:---|:---|:---|:---|:---|
| 1024 | SecondOrderOptimization (Dogleg) | 29.81 ms | 49521792 | 47.2 MiB | 100 | 2.7027e+02 | ✓ Yes |
| 1024 | LeastSquaresOptim (Dogleg) | 2.65 s | 7493280 | 7.1 MiB | 100 | 4.3830e+02 | ✗ No |
| 1024 | NonlinearSolve (TrustRegion) | 37.86 ms | 82601824 | 78.8 MiB | 100 | 3.0013e+02 | ✗ No |
| 1024 | Optim (NewtonTrustRegion) | FAILED | 3283824 | 3.1 MiB | 0 | NaN | ✗ No |
| 1024 | MadNLP | 274.58 ms | 82256032 | 78.4 MiB | 100 | 9.9207e+02 | ✗ No |
| 1024 | NonlinearSolve (LM) | 12.83 s | 255117216 | 243.3 MiB | 100 | 3.5356e+02 | ✗ No |
| 1024 | Optim (Newton) | 153.60 ms | 184675568 | 176.1 MiB | 100 | 1.1227e+03 | ✗ No |
| 1024 | LeastSquaresOptim (LM) | 166.71 ms | 951120 | 928.8 KiB | 100 | 3.3668e+02 | ✗ No |
| 1024 | Ipopt | 49.43 ms | 13710384 | 13.1 MiB | 13 | 9.9208e+02 | ✗ No |
| 1024 | JSOSolvers (tron) | 31.19 ms | 1985856 | 1.9 MiB | 101 | 3.4343e+02 | ✗ No |
| 1024 | JSOSolvers (trunk) | 61.82 ms | 3492384 | 3.3 MiB | 101 | 3.3822e+02 | ✗ No |
| 1024 | SecondOrderOptimization (LM) | 32.51 ms | 56628608 | 54.0 MiB | 100 | 3.1285e+02 | ✓ Yes |
| 2048 | SecondOrderOptimization (Dogleg) | 58.11 ms | 97321088 | 92.8 MiB | 100 | 6.9713e+02 | ✓ Yes |
| 2048 | LeastSquaresOptim (Dogleg) | FAILED | 361872 | 353.4 KiB | 0 | NaN | ✗ No |
| 2048 | NonlinearSolve (TrustRegion) | 56.00 ms | 176038128 | 167.9 MiB | 100 | 6.5580e+02 | ✗ No |
| 2048 | Optim (NewtonTrustRegion) | FAILED | 411088 | 401.5 KiB | 0 | NaN | ✗ No |
| 2048 | MadNLP | 447.07 ms | 156925760 | 149.7 MiB | 100 | 1.8185e+03 | ✗ No |
| 2048 | NonlinearSolve (LM) | 44.46 s | 1826258448 | 1741.7 MiB | 100 | 7.2122e+02 | ✗ No |
| 2048 | Optim (Newton) | 235.76 ms | 374698320 | 357.3 MiB | 100 | 1.7819e+03 | ✗ No |
| 2048 | LeastSquaresOptim (LM) | 291.14 ms | 1313616 | 1.3 MiB | 100 | 6.9380e+02 | ✗ No |
| 2048 | Ipopt | 115.96 ms | 46739728 | 44.6 MiB | 28 | 1.8185e+03 | ✗ No |
| 2048 | JSOSolvers (tron) | 58.17 ms | 3560880 | 3.4 MiB | 101 | 7.0088e+02 | ✗ No |
| 2048 | JSOSolvers (trunk) | 92.09 ms | 3016112 | 2.9 MiB | 101 | 6.9570e+02 | ✗ No |
| 2048 | SecondOrderOptimization (LM) | 62.68 ms | 108494576 | 103.5 MiB | 100 | 6.7952e+02 | ✓ Yes |
| 4096 | SecondOrderOptimization (Dogleg) | 123.78 ms | 187873408 | 179.2 MiB | 100 | 1.3760e+03 | ✓ Yes |
| 4096 | LeastSquaresOptim (Dogleg) | FAILED | 705936 | 689.4 KiB | 0 | NaN | ✗ No |
| 4096 | NonlinearSolve (TrustRegion) | 110.75 ms | 323621504 | 308.6 MiB | 100 | 1.3822e+03 | ✗ No |
| 4096 | Optim (NewtonTrustRegion) | FAILED | 804304 | 785.5 KiB | 0 | NaN | ✗ No |
| 4096 | MadNLP | 904.09 ms | 303724304 | 289.7 MiB | 100 | 4.3640e+03 | ✗ No |
| 4096 | NonlinearSolve (LM) | 176.70 s | 3689757680 | 3518.8 MiB | 100 | 1.4452e+03 | ✗ No |
| 4096 | Optim (Newton) | 249.98 ms | 621490464 | 592.7 MiB | 27 | 3.6044e+03 | ✗ No |
| 4096 | LeastSquaresOptim (LM) | 507.13 ms | 2342096 | 2.2 MiB | 100 | 1.4109e+03 | ✗ No |
| 4096 | Ipopt | 232.70 ms | 90328912 | 86.1 MiB | 28 | 3.4816e+03 | ✗ No |
| 4096 | JSOSolvers (tron) | 120.93 ms | 6996992 | 6.7 MiB | 101 | 1.4170e+03 | ✗ No |
| 4096 | JSOSolvers (trunk) | 142.46 ms | 5910736 | 5.6 MiB | 101 | 1.4125e+03 | ✗ No |
| 4096 | SecondOrderOptimization (LM) | 125.29 ms | 207320256 | 197.7 MiB | 100 | 1.3948e+03 | ✓ Yes |
| 8192 | SecondOrderOptimization (Dogleg) | 248.36 ms | 368978048 | 351.9 MiB | 100 | 2.9573e+03 | ✓ Yes |
| 8192 | LeastSquaresOptim (Dogleg) | FAILED | 1394064 | 1.3 MiB | 0 | NaN | ✗ No |
| 8192 | NonlinearSolve (TrustRegion) | 298.03 ms | 618902368 | 590.2 MiB | 100 | 2.8466e+03 | ✗ No |
| 8192 | Optim (NewtonTrustRegion) | FAILED | 1590736 | 1.5 MiB | 0 | NaN | ✗ No |
| 8192 | MadNLP | 1.82 s | 597278032 | 569.6 MiB | 100 | 8.6329e+03 | ✗ No |
| 8192 | NonlinearSolve (LM) | 696.47 s | 8210199536 | 7829.9 MiB | 100 | 2.8958e+03 | ✗ No |
| 8192 | Optim (Newton) | 926.13 ms | 1431123840 | 1364.8 MiB | 100 | 6.9672e+03 | ✗ No |
| 8192 | LeastSquaresOptim (LM) | 1.08 s | 4498768 | 4.3 MiB | 100 | 2.8414e+03 | ✗ No |
| 8192 | Ipopt | 633.48 ms | 240941856 | 229.8 MiB | 39 | 8.0522e+03 | ✗ No |
| 8192 | JSOSolvers (tron) | 235.33 ms | 13868096 | 13.2 MiB | 101 | 2.8488e+03 | ✗ No |
| 8192 | JSOSolvers (trunk) | 317.82 ms | 11699024 | 11.2 MiB | 101 | 2.8444e+03 | ✗ No |
| 8192 | SecondOrderOptimization (LM) | 256.98 ms | 406754496 | 387.9 MiB | 100 | 2.8253e+03 | ✓ Yes |
| 16384 | SecondOrderOptimization (Dogleg) | 544.64 ms | 970557568 | 925.6 MiB | 100 | 5.7701e+03 | ✓ Yes |
| 16384 | LeastSquaresOptim (Dogleg) | FAILED | 2770320 | 2.6 MiB | 0 | NaN | ✗ No |
| 16384 | NonlinearSolve (TrustRegion) | FAILED | 3163600 | 3.0 MiB | 0 | NaN | ✗ No |
| 16384 | Optim (NewtonTrustRegion) | FAILED | 3163600 | 3.0 MiB | 0 | NaN | ✗ No |
| 16384 | MadNLP | 3.71 s | 1383256400 | 1319.2 MiB | 100 | 1.4896e+04 | ✗ No |
| 16384 | NonlinearSolve (LM) | FAILED | 3163600 | 3.0 MiB | 0 | NaN | ✗ No |
| 16384 | Optim (Newton) | 1.66 s | 3027881264 | 2887.6 MiB | 100 | 1.3952e+04 | ✗ No |
| 16384 | LeastSquaresOptim (LM) | FAILED | 2770320 | 2.6 MiB | 0 | NaN | ✗ No |
| 16384 | Ipopt | 2.00 s | 785788400 | 749.4 MiB | 54 | 1.2462e+04 | ✗ No |
| 16384 | JSOSolvers (tron) | 479.19 ms | 29593728 | 28.2 MiB | 101 | 5.7134e+03 | ✗ No |
| 16384 | JSOSolvers (trunk) | 490.78 ms | 25471824 | 24.3 MiB | 101 | 5.7091e+03 | ✗ No |
| 16384 | SecondOrderOptimization (LM) | 551.68 ms | 1046941232 | 998.4 MiB | 100 | 5.6905e+03 | ✓ Yes |
| 32768 | SecondOrderOptimization (Dogleg) | 1.08 s | 1564706944 | 1492.2 MiB | 100 | 1.1767e+04 | ✓ Yes |
| 32768 | LeastSquaresOptim (Dogleg) | FAILED | 5522832 | 5.3 MiB | 0 | NaN | ✗ No |
| 32768 | NonlinearSolve (TrustRegion) | FAILED | 6309328 | 6.0 MiB | 0 | NaN | ✗ No |
| 32768 | Optim (NewtonTrustRegion) | FAILED | 6309328 | 6.0 MiB | 0 | NaN | ✗ No |
| 32768 | MadNLP | 7.30 s | 2678405456 | 2554.3 MiB | 100 | 2.9548e+04 | ✗ No |
| 32768 | NonlinearSolve (LM) | FAILED | 6309328 | 6.0 MiB | 0 | NaN | ✗ No |
| 32768 | Optim (Newton) | 3.44 s | 6353748400 | 6059.4 MiB | 100 | 2.7225e+04 | ✗ No |
| 32768 | LeastSquaresOptim (LM) | FAILED | 5522832 | 5.3 MiB | 0 | NaN | ✗ No |
| 32768 | Ipopt | 965.32 ms | 402618208 | 384.0 MiB | 13 | 2.9553e+04 | ✗ No |
| 32768 | JSOSolvers (tron) | 958.68 ms | 56113216 | 53.5 MiB | 101 | 1.1441e+04 | ✗ No |
| 32768 | JSOSolvers (trunk) | 993.95 ms | 47446928 | 45.2 MiB | 101 | 1.1436e+04 | ✗ No |
| 32768 | SecondOrderOptimization (LM) | 1.13 s | 1802606320 | 1719.1 MiB | 100 | 1.1414e+04 | ✓ Yes |
| 65536 | SecondOrderOptimization (Dogleg) | 2.28 s | 3309783168 | 3156.5 MiB | 100 | 2.3332e+04 | ✓ Yes |
| 65536 | LeastSquaresOptim (Dogleg) | FAILED | 11027856 | 10.5 MiB | 0 | NaN | ✗ No |
| 65536 | NonlinearSolve (TrustRegion) | FAILED | 12600784 | 12.0 MiB | 0 | NaN | ✗ No |
| 65536 | Optim (NewtonTrustRegion) | FAILED | 12600784 | 12.0 MiB | 0 | NaN | ✗ No |
| 65536 | MadNLP | 15.65 s | 4971694416 | 4741.4 MiB | 100 | 5.2238e+04 | ✗ No |
| 65536 | NonlinearSolve (LM) | FAILED | 12600784 | 12.0 MiB | 0 | NaN | ✗ No |
| 65536 | Optim (Newton) | 6.39 s | 12095166496 | 11534.8 MiB | 100 | 5.6748e+04 | ✗ No |
| 65536 | LeastSquaresOptim (LM) | FAILED | 11027856 | 10.5 MiB | 0 | NaN | ✗ No |
| 65536 | Ipopt | 7.48 s | 2727823440 | 2601.5 MiB | 54 | 5.0879e+04 | ✗ No |
| 65536 | JSOSolvers (tron) | 2.08 s | 116852800 | 111.4 MiB | 101 | 2.2896e+04 | ✗ No |
| 65536 | JSOSolvers (trunk) | 1.86 s | 98081664 | 93.5 MiB | 101 | 2.2892e+04 | ✗ No |
| 65536 | SecondOrderOptimization (LM) | 2.45 s | 3846809152 | 3668.6 MiB | 100 | 2.2872e+04 | ✓ Yes |
| 131072 | SecondOrderOptimization (Dogleg) | 4.31 s | 6514002048 | 6212.2 MiB | 100 | 4.6582e+04 | ✓ Yes |
| 131072 | LeastSquaresOptim (Dogleg) | FAILED | 22037904 | 21.0 MiB | 0 | NaN | ✗ No |
| 131072 | NonlinearSolve (TrustRegion) | FAILED | 25183696 | 24.0 MiB | 0 | NaN | ✗ No |
| 131072 | Optim (NewtonTrustRegion) | FAILED | 25232848 | 24.1 MiB | 0 | NaN | ✗ No |
| 131072 | MadNLP | 31.66 s | 9512315216 | 9071.7 MiB | 100 | 1.0400e+05 | ✗ No |
| 131072 | NonlinearSolve (LM) | FAILED | 25183696 | 24.0 MiB | 0 | NaN | ✗ No |
| 131072 | Optim (Newton) | 13.75 s | 24446028368 | 23313.5 MiB | 100 | 1.0871e+05 | ✗ No |
| 131072 | LeastSquaresOptim (LM) | FAILED | 22037904 | 21.0 MiB | 0 | NaN | ✗ No |
| 131072 | Ipopt | 7.75 s | 2644576144 | 2522.1 MiB | 26 | 1.0557e+05 | ✗ No |
| 131072 | JSOSolvers (tron) | 3.94 s | 236169280 | 225.2 MiB | 101 | 4.5807e+04 | ✗ No |
| 131072 | JSOSolvers (trunk) | 3.70 s | 195320656 | 186.3 MiB | 101 | 4.5803e+04 | ✗ No |
| 131072 | SecondOrderOptimization (LM) | 4.89 s | 7469703648 | 7123.7 MiB | 100 | 4.5782e+04 | ✓ Yes |
| 262144 | SecondOrderOptimization (Dogleg) | 9.10 s | 11973331072 | 11418.7 MiB | 100 | 9.3195e+04 | ✓ Yes |
| 262144 | LeastSquaresOptim (Dogleg) | FAILED | 44058000 | 42.0 MiB | 0 | NaN | ✗ No |
| 262144 | NonlinearSolve (TrustRegion) | FAILED | 50398672 | 48.1 MiB | 0 | NaN | ✗ No |
| 262144 | Optim (NewtonTrustRegion) | FAILED | 53495248 | 51.0 MiB | 0 | NaN | ✗ No |
| 262144 | MadNLP | 67.55 s | 19049867600 | 18167.4 MiB | 100 | 2.0790e+05 | ✗ No |
| 262144 | NonlinearSolve (LM) | FAILED | 50382288 | 48.0 MiB | 0 | NaN | ✗ No |
| 262144 | Optim (Newton) | 27.61 s | 48218208464 | 45984.5 MiB | 100 | 2.2723e+05 | ✗ No |
| 262144 | LeastSquaresOptim (LM) | FAILED | 44058000 | 42.0 MiB | 0 | NaN | ✗ No |
| 262144 | Ipopt | 8.89 s | 3281304096 | 3129.3 MiB | 15 | 2.1093e+05 | ✗ No |
| 262144 | JSOSolvers (tron) | 7.96 s | 447129744 | 426.4 MiB | 101 | 9.1627e+04 | ✗ No |
| 262144 | JSOSolvers (trunk) | 7.51 s | 393567056 | 375.3 MiB | 101 | 9.1623e+04 | ✗ No |
| 262144 | SecondOrderOptimization (LM) | 9.00 s | 13489197712 | 12864.3 MiB | 100 | 9.1604e+04 | ✓ Yes |
| 524288 | SecondOrderOptimization (Dogleg) | 17.76 s | 24411261056 | 23280.4 MiB | 100 | 1.8643e+05 | ✓ Yes |
| 524288 | LeastSquaresOptim (Dogleg) | FAILED | 94389648 | 90.0 MiB | 0 | NaN | ✗ No |
| 524288 | NonlinearSolve (TrustRegion) | FAILED | 107005392 | 102.0 MiB | 0 | NaN | ✗ No |
| 524288 | Optim (NewtonTrustRegion) | FAILED | 116704720 | 111.3 MiB | 0 | NaN | ✗ No |
| 524288 | MadNLP | 137.15 s | 38782986576 | 36986.3 MiB | 100 | 4.1734e+05 | ✗ No |
| 524288 | NonlinearSolve (LM) | FAILED | 100730320 | 96.1 MiB | 0 | NaN | ✗ No |
| 524288 | Optim (Newton) | 115.38 s | 254922361488 | 243112.9 MiB | 100 | 4.3089e+05 | ✗ No |
| 524288 | LeastSquaresOptim (LM) | FAILED | 94389648 | 90.0 MiB | 0 | NaN | ✗ No |
| 524288 | Ipopt | 49.13 s | 16289081120 | 15534.5 MiB | 39 | 3.1785e+05 | ✗ No |
| 524288 | JSOSolvers (tron) | 15.98 s | 977086576 | 931.8 MiB | 101 | 1.8327e+05 | ✗ No |
| 524288 | JSOSolvers (trunk) | 15.34 s | 883858256 | 842.9 MiB | 101 | 1.8326e+05 | ✗ No |
| 524288 | SecondOrderOptimization (LM) | 19.50 s | 29010189696 | 27666.3 MiB | 100 | 1.8324e+05 | ✓ Yes |
| 1048576 | SecondOrderOptimization (Dogleg) | 34.95 s | 50512365696 | 48172.3 MiB | 100 | 3.7365e+05 | ✓ Yes |
| 1048576 | LeastSquaresOptim (Dogleg) | FAILED | 188761488 | 180.0 MiB | 0 | NaN | ✗ No |
| 1048576 | NonlinearSolve (TrustRegion) | FAILED | 201344464 | 192.0 MiB | 0 | NaN | ✗ No |
| 1048576 | Optim (NewtonTrustRegion) | FAILED | 201344464 | 192.0 MiB | 0 | NaN | ✗ No |
| 1048576 | MadNLP | 307.56 s | 76109605200 | 72583.8 MiB | 100 | 8.0942e+05 | ✗ No |
| 1048576 | NonlinearSolve (LM) | FAILED | 201360848 | 192.0 MiB | 0 | NaN | ✗ No |
| 1048576 | Optim (Newton) | 231.98 s | 518264422112 | 494255.5 MiB | 100 | 8.5832e+05 | ✗ No |
| 1048576 | LeastSquaresOptim (LM) | FAILED | 176178576 | 168.0 MiB | 0 | NaN | ✗ No |
| 1048576 | Ipopt | 165.30 s | 47984920464 | 45762.0 MiB | 58 | 7.2451e+05 | ✗ No |
| 1048576 | JSOSolvers (tron) | 31.96 s | 1857185856 | 1771.2 MiB | 101 | 3.6655e+05 | ✗ No |
| 1048576 | JSOSolvers (trunk) | 31.23 s | 1691769728 | 1613.4 MiB | 101 | 3.6655e+05 | ✗ No |
| 1048576 | SecondOrderOptimization (LM) | 37.82 s | 55497333584 | 52926.4 MiB | 100 | 3.6652e+05 | ✓ Yes |

---

## 3. Analysis & Key Takeaways

- **Asymptotic Complexity**: Log-log scaling indicates the empirical runtime growth rate as Poses N expands.
- **Fastest Model**: The fastest linear system assembly was consistently achieved by `NLLSModel (Sparse)`.
- **Top Optimizer**: Solvers leveraging specialized structure (e.g. sparse block factorization in SecondOrderOptimization) demonstrate superior scaling exponents on large problem regimes.
