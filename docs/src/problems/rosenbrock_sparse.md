# Sparse Multi-dimensional Rosenbrock

- **Category**: `large_sparse`
- **Scaling Metric**: Variables n
- **Problem Sizes Evaluated**: 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576 (11 sizes)

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed lines) and **Cost + Linear System Assembly** (solid lines) across problem sizes.

![Sparse Multi-dimensional Rosenbrock Model Evaluation Scaling](../assets/plots/rosenbrock_sparse_models.png)

### Model Evaluation Timings

| Variables n | Model | Cost Time | Cost Allocs | Linsys Time | Linsys Allocs | Linsys Memory |
|:---|:---|:---|:---|:---|:---|:---|
| 1024 | NLPModels (MathOptNLSModel) | 4.96 μs | 5 | 34.21 μs | 7 | 160 B |
| 1024 | NLLSModel | 2.71 μs | 0 | 2.71 μs | 0 | 0 B |
| 1024 | Standalone (Sparse) ★ | 667.0 ns | 0 | 1.04 μs | 0 | 0 B |
| 2048 | NLPModels (MathOptNLSModel) | 8.00 μs | 5 | 71.04 μs | 7 | 160 B |
| 2048 | NLLSModel | 5.00 μs | 0 | 5.00 μs | 0 | 0 B |
| 2048 | Standalone (Sparse) ★ | 1.21 μs | 0 | 1.92 μs | 0 | 0 B |
| 4096 | NLPModels (MathOptNLSModel) | 16.46 μs | 5 | 163.04 μs | 7 | 160 B |
| 4096 | NLLSModel | 10.58 μs | 0 | 10.62 μs | 0 | 0 B |
| 4096 | Standalone (Sparse) ★ | 2.50 μs | 0 | 4.04 μs | 0 | 0 B |
| 8192 | NLPModels (MathOptNLSModel) | 30.83 μs | 5 | 636.00 μs | 7 | 160 B |
| 8192 | NLLSModel | 19.88 μs | 0 | 19.83 μs | 0 | 0 B |
| 8192 | Standalone (Sparse) ★ | 4.75 μs | 0 | 7.88 μs | 0 | 0 B |
| 16384 | NLPModels (MathOptNLSModel) | 61.29 μs | 5 | 2.03 ms | 7 | 160 B |
| 16384 | NLLSModel | 39.67 μs | 0 | 39.67 μs | 0 | 0 B |
| 16384 | Standalone (Sparse) ★ | 9.25 μs | 0 | 15.58 μs | 0 | 0 B |
| 32768 | NLPModels (MathOptNLSModel) | 122.38 μs | 5 | 3.56 ms | 7 | 160 B |
| 32768 | NLLSModel | 79.29 μs | 0 | 79.29 μs | 0 | 0 B |
| 32768 | Standalone (Sparse) ★ | 18.42 μs | 0 | 31.04 μs | 0 | 0 B |
| 65536 | NLLSModel | 162.62 μs | 0 | 158.79 μs | 0 | 0 B |
| 65536 | Standalone (Sparse) ★ | 36.71 μs | 0 | 59.38 μs | 0 | 0 B |
| 131072 | NLLSModel | 317.79 μs | 0 | 317.88 μs | 0 | 0 B |
| 131072 | Standalone (Sparse) ★ | 73.62 μs | 0 | 123.42 μs | 0 | 0 B |
| 262144 | NLLSModel | 653.62 μs | 0 | 655.17 μs | 0 | 0 B |
| 262144 | Standalone (Sparse) ★ | 147.75 μs | 0 | 248.50 μs | 0 | 0 B |
| 524288 | NLLSModel | 1.32 ms | 0 | 1.32 ms | 0 | 0 B |
| 524288 | Standalone (Sparse) ★ | 311.33 μs | 0 | 512.08 μs | 0 | 0 B |
| 1048576 | NLLSModel | 2.56 ms | 0 | 2.58 ms | 0 | 0 B |
| 1048576 | Standalone (Sparse) ★ | 628.67 μs | 0 | 1.10 ms | 0 | 0 B |

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all compatible optimizer families.

![Sparse Multi-dimensional Rosenbrock Optimizer Scaling](../assets/plots/rosenbrock_sparse_optimizers.png)

### Optimizer Results Summary

| Variables n | Optimizer | Runtime | Allocs | Memory | Iterations | Final Cost | Converged |
|:---|:---|:---|:---|:---|:---|:---|:---|
| 1024 | SecondOrderOptimization (Dogleg) | 6.17 ms | 19298640 | 18.4 MiB | 100 | 5.0401e+02 | ✓ Yes |
| 1024 | LeastSquaresOptim (Dogleg) | 54.29 ms | 2208288 | 2.1 MiB | 100 | 4.7209e+02 | ✗ No |
| 1024 | NonlinearSolve (TrustRegion) | 132.47 ms | 153823840 | 146.7 MiB | 100 | 4.8210e+02 | ✗ No |
| 1024 | Optim (NewtonTrustRegion) | FAILED | 243168 | 237.5 KiB | 0 | NaN | ✗ No |
| 1024 | MadNLP | 50.76 ms | 28937872 | 27.6 MiB | 100 | 4.6278e+02 | ✗ No |
| 1024 | NonlinearSolve (LM) | 2.07 s | 432007824 | 412.0 MiB | 100 | 4.9602e+02 | ✗ No |
| 1024 | Optim (Newton) | 42.51 ms | 63622208 | 60.7 MiB | 100 | 4.9299e+02 | ✗ No |
| 1024 | LeastSquaresOptim (LM) | 27.04 ms | 504448 | 492.6 KiB | 100 | 4.7139e+02 | ✗ No |
| 1024 | Ipopt | 56.59 ms | 28647136 | 27.3 MiB | 100 | 4.7268e+02 | ✗ No |
| 1024 | JSOSolvers (tron) | 12.07 ms | 847632 | 827.8 KiB | 101 | 4.7802e+02 | ✗ No |
| 1024 | JSOSolvers (trunk) | 18.07 ms | 754176 | 736.5 KiB | 101 | 4.6852e+02 | ✗ No |
| 1024 | SecondOrderOptimization (LM) | 6.73 ms | 18551936 | 17.7 MiB | 100 | 4.6212e+02 | ✓ Yes |
| 2048 | SecondOrderOptimization (Dogleg) | 12.19 ms | 38521008 | 36.7 MiB | 100 | 1.0106e+03 | ✓ Yes |
| 2048 | LeastSquaresOptim (Dogleg) | 49.79 ms | 612192 | 597.8 KiB | 100 | 9.7840e+02 | ✗ No |
| 2048 | NonlinearSolve (TrustRegion) | 193.90 ms | 305495776 | 291.3 MiB | 100 | 9.8071e+02 | ✗ No |
| 2048 | Optim (NewtonTrustRegion) | FAILED | 185728 | 181.4 KiB | 0 | NaN | ✗ No |
| 2048 | MadNLP | 93.51 ms | 57559104 | 54.9 MiB | 100 | 9.6960e+02 | ✗ No |
| 2048 | NonlinearSolve (LM) | 8.47 s | 110514800 | 105.4 MiB | 100 | 1.0028e+03 | ✗ No |
| 2048 | Optim (Newton) | 56.66 ms | 126699648 | 120.8 MiB | 100 | 9.9980e+02 | ✗ No |
| 2048 | LeastSquaresOptim (LM) | 53.96 ms | 589488 | 575.7 KiB | 100 | 9.7852e+02 | ✗ No |
| 2048 | Ipopt | 99.31 ms | 56812032 | 54.2 MiB | 100 | 9.7950e+02 | ✗ No |
| 2048 | JSOSolvers (tron) | 22.01 ms | 1308464 | 1.2 MiB | 101 | 9.7833e+02 | ✗ No |
| 2048 | JSOSolvers (trunk) | 32.39 ms | 1124672 | 1.1 MiB | 101 | 9.7535e+02 | ✗ No |
| 2048 | SecondOrderOptimization (LM) | 13.55 ms | 37034912 | 35.3 MiB | 100 | 9.6875e+02 | ✓ Yes |
| 4096 | SecondOrderOptimization (Dogleg) | 24.38 ms | 77815984 | 74.2 MiB | 100 | 2.0245e+03 | ✓ Yes |
| 4096 | LeastSquaresOptim (Dogleg) | 92.56 ms | 1102880 | 1.1 MiB | 100 | 1.9930e+03 | ✗ No |
| 4096 | NonlinearSolve (TrustRegion) | 296.45 ms | 619905984 | 591.2 MiB | 100 | 2.0029e+03 | ✗ No |
| 4096 | Optim (NewtonTrustRegion) | FAILED | 378240 | 369.4 KiB | 0 | NaN | ✗ No |
| 4096 | MadNLP | 179.23 ms | 117466944 | 112.0 MiB | 100 | 1.9833e+03 | ✗ No |
| 4096 | NonlinearSolve (LM) | 30.69 s | 1726709040 | 1646.7 MiB | 100 | 2.0165e+03 | ✗ No |
| 4096 | Optim (Newton) | 100.31 ms | 262238400 | 250.1 MiB | 100 | 2.0134e+03 | ✗ No |
| 4096 | LeastSquaresOptim (LM) | 105.20 ms | 1066096 | 1.0 MiB | 100 | 1.9933e+03 | ✗ No |
| 4096 | Ipopt | 190.87 ms | 115806144 | 110.4 MiB | 100 | 1.9932e+03 | ✗ No |
| 4096 | JSOSolvers (tron) | 46.68 ms | 2639408 | 2.5 MiB | 101 | 1.9904e+03 | ✗ No |
| 4096 | JSOSolvers (trunk) | 64.23 ms | 2275136 | 2.2 MiB | 101 | 1.9890e+03 | ✗ No |
| 4096 | SecondOrderOptimization (LM) | 27.70 ms | 74867616 | 71.4 MiB | 100 | 1.9823e+03 | ✓ Yes |
| 8192 | SecondOrderOptimization (Dogleg) | 49.42 ms | 153841840 | 146.7 MiB | 100 | 4.0516e+03 | ✓ Yes |
| 8192 | LeastSquaresOptim (Dogleg) | FAILED | 673088 | 657.3 KiB | 0 | NaN | ✗ No |
| 8192 | NonlinearSolve (TrustRegion) | 582.07 ms | 1201065088 | 1145.4 MiB | 100 | 4.0216e+03 | ✗ No |
| 8192 | Optim (NewtonTrustRegion) | FAILED | 738688 | 721.4 KiB | 0 | NaN | ✗ No |
| 8192 | MadNLP | 365.16 ms | 229852960 | 219.2 MiB | 100 | 4.0106e+03 | ✗ No |
| 8192 | NonlinearSolve (LM) | 121.52 s | 3379280112 | 3222.7 MiB | 100 | 4.0438e+03 | ✗ No |
| 8192 | Optim (Newton) | 188.74 ms | 506061344 | 482.6 MiB | 100 | 4.0402e+03 | ✗ No |
| 8192 | LeastSquaresOptim (LM) | 193.16 ms | 2005232 | 1.9 MiB | 100 | 4.0207e+03 | ✗ No |
| 8192 | Ipopt | 384.43 ms | 226323136 | 215.8 MiB | 100 | 4.0195e+03 | ✗ No |
| 8192 | JSOSolvers (tron) | 89.69 ms | 5203216 | 5.0 MiB | 101 | 4.0199e+03 | ✗ No |
| 8192 | JSOSolvers (trunk) | 131.56 ms | 4477952 | 4.3 MiB | 101 | 4.0163e+03 | ✗ No |
| 8192 | SecondOrderOptimization (LM) | 56.61 ms | 147919776 | 141.1 MiB | 100 | 4.0096e+03 | ✓ Yes |
| 16384 | SecondOrderOptimization (Dogleg) | 99.33 ms | 305893552 | 291.7 MiB | 100 | 8.1064e+03 | ✓ Yes |
| 16384 | LeastSquaresOptim (Dogleg) | FAILED | 1328448 | 1.3 MiB | 0 | NaN | ✗ No |
| 16384 | NonlinearSolve (TrustRegion) | 1.16 s | 2506447920 | 2390.3 MiB | 100 | 8.0842e+03 | ✗ No |
| 16384 | Optim (NewtonTrustRegion) | FAILED | 1459584 | 1.4 MiB | 0 | NaN | ✗ No |
| 16384 | MadNLP | 707.35 ms | 454500672 | 433.4 MiB | 100 | 8.0652e+03 | ✗ No |
| 16384 | NonlinearSolve (LM) | 480.93 s | 6850572544 | 6533.2 MiB | 100 | 8.0984e+03 | ✗ No |
| 16384 | Optim (Newton) | 359.92 ms | 993706528 | 947.7 MiB | 100 | 8.0948e+03 | ✗ No |
| 16384 | LeastSquaresOptim (LM) | 379.34 ms | 3873904 | 3.7 MiB | 100 | 8.0753e+03 | ✗ No |
| 16384 | Ipopt | 784.10 ms | 447357312 | 426.6 MiB | 100 | 8.0741e+03 | ✗ No |
| 16384 | JSOSolvers (tron) | 189.82 ms | 10330288 | 9.9 MiB | 101 | 8.0684e+03 | ✗ No |
| 16384 | JSOSolvers (trunk) | 266.20 ms | 8883008 | 8.5 MiB | 101 | 8.0709e+03 | ✗ No |
| 16384 | SecondOrderOptimization (LM) | 110.16 ms | 294024096 | 280.4 MiB | 100 | 8.0641e+03 | ✓ Yes |
| 32768 | SecondOrderOptimization (Dogleg) | 226.94 ms | 610128048 | 581.9 MiB | 100 | 1.6215e+04 | ✓ Yes |
| 32768 | LeastSquaresOptim (Dogleg) | FAILED | 2639168 | 2.5 MiB | 0 | NaN | ✗ No |
| 32768 | NonlinearSolve (TrustRegion) | FAILED | 2901376 | 2.8 MiB | 0 | NaN | ✗ No |
| 32768 | Optim (NewtonTrustRegion) | FAILED | 2901376 | 2.8 MiB | 0 | NaN | ✗ No |
| 32768 | MadNLP | 1.46 s | 903797056 | 861.9 MiB | 100 | 1.6174e+04 | ✗ No |
| 32768 | NonlinearSolve (LM) | FAILED | 2901376 | 2.8 MiB | 0 | NaN | ✗ No |
| 32768 | Optim (Newton) | 754.94 ms | 1968996976 | 1877.8 MiB | 100 | 1.6204e+04 | ✗ No |
| 32768 | LeastSquaresOptim (LM) | FAILED | 2639168 | 2.5 MiB | 0 | NaN | ✗ No |
| 32768 | Ipopt | 1.47 s | 889426304 | 848.2 MiB | 100 | 1.6183e+04 | ✗ No |
| 32768 | JSOSolvers (tron) | 424.15 ms | 20584544 | 19.6 MiB | 101 | 1.6183e+04 | ✗ No |
| 32768 | JSOSolvers (trunk) | 524.05 ms | 17693504 | 16.9 MiB | 101 | 1.6181e+04 | ✗ No |
| 32768 | SecondOrderOptimization (LM) | 247.49 ms | 586363808 | 559.2 MiB | 100 | 1.6173e+04 | ✓ Yes |
| 65536 | SecondOrderOptimization (Dogleg) | 485.55 ms | 1214845104 | 1158.6 MiB | 100 | 3.2434e+04 | ✓ Yes |
| 65536 | LeastSquaresOptim (Dogleg) | FAILED | 5260608 | 5.0 MiB | 0 | NaN | ✗ No |
| 65536 | NonlinearSolve (TrustRegion) | FAILED | 5784960 | 5.5 MiB | 0 | NaN | ✗ No |
| 65536 | Optim (NewtonTrustRegion) | FAILED | 5784960 | 5.5 MiB | 0 | NaN | ✗ No |
| 65536 | MadNLP | 2.97 s | 1799080256 | 1715.7 MiB | 100 | 3.2393e+04 | ✗ No |
| 65536 | NonlinearSolve (LM) | FAILED | 5784960 | 5.5 MiB | 0 | NaN | ✗ No |
| 65536 | Optim (Newton) | 1.48 s | 3916202592 | 3734.8 MiB | 100 | 3.2422e+04 | ✗ No |
| 65536 | LeastSquaresOptim (LM) | FAILED | 5260608 | 5.0 MiB | 0 | NaN | ✗ No |
| 65536 | Ipopt | 3.02 s | 1770254720 | 1688.2 MiB | 100 | 3.2402e+04 | ✗ No |
| 65536 | JSOSolvers (tron) | 730.73 ms | 41060400 | 39.2 MiB | 101 | 3.2400e+04 | ✗ No |
| 65536 | JSOSolvers (trunk) | 1.05 s | 35281792 | 33.6 MiB | 101 | 3.2400e+04 | ✗ No |
| 65536 | SecondOrderOptimization (LM) | 539.32 ms | 1167274912 | 1113.2 MiB | 100 | 3.2392e+04 | ✓ Yes |
| 131072 | SecondOrderOptimization (Dogleg) | 965.82 ms | 2435453104 | 2322.6 MiB | 100 | 6.4871e+04 | ✓ Yes |
| 131072 | LeastSquaresOptim (Dogleg) | FAILED | 10503488 | 10.0 MiB | 0 | NaN | ✗ No |
| 131072 | NonlinearSolve (TrustRegion) | FAILED | 11552128 | 11.0 MiB | 0 | NaN | ✗ No |
| 131072 | Optim (NewtonTrustRegion) | FAILED | 11552128 | 11.0 MiB | 0 | NaN | ✗ No |
| 131072 | MadNLP | 5.94 s | 3629902144 | 3461.7 MiB | 100 | 6.4830e+04 | ✗ No |
| 131072 | NonlinearSolve (LM) | FAILED | 11552128 | 11.0 MiB | 0 | NaN | ✗ No |
| 131072 | Optim (Newton) | 3.00 s | 8231289440 | 7850.0 MiB | 100 | 6.4859e+04 | ✗ No |
| 131072 | LeastSquaresOptim (LM) | FAILED | 10503488 | 10.0 MiB | 0 | NaN | ✗ No |
| 131072 | Ipopt | 6.20 s | 3543462272 | 3379.3 MiB | 100 | 6.4839e+04 | ✗ No |
| 131072 | JSOSolvers (tron) | 1.43 s | 82012272 | 78.2 MiB | 101 | 6.4843e+04 | ✗ No |
| 131072 | JSOSolvers (trunk) | 2.17 s | 70458176 | 67.2 MiB | 101 | 6.4837e+04 | ✗ No |
| 131072 | SecondOrderOptimization (LM) | 1.08 s | 2336502688 | 2228.3 MiB | 100 | 6.4829e+04 | ✓ Yes |
| 262144 | SecondOrderOptimization (Dogleg) | 2.03 s | 4861874352 | 4636.6 MiB | 100 | 1.2974e+05 | ✓ Yes |
| 262144 | LeastSquaresOptim (Dogleg) | FAILED | 20989248 | 20.0 MiB | 0 | NaN | ✗ No |
| 262144 | NonlinearSolve (TrustRegion) | FAILED | 23086464 | 22.0 MiB | 0 | NaN | ✗ No |
| 262144 | Optim (NewtonTrustRegion) | FAILED | 23086464 | 22.0 MiB | 0 | NaN | ✗ No |
| 262144 | MadNLP | 11.90 s | 7271213376 | 6934.4 MiB | 100 | 1.2970e+05 | ✗ No |
| 262144 | NonlinearSolve (LM) | FAILED | 23086464 | 22.0 MiB | 0 | NaN | ✗ No |
| 262144 | Optim (Newton) | 6.02 s | 16888365712 | 16106.0 MiB | 100 | 1.2973e+05 | ✗ No |
| 262144 | LeastSquaresOptim (LM) | FAILED | 20989248 | 20.0 MiB | 0 | NaN | ✗ No |
| 262144 | Ipopt | 12.78 s | 7083700624 | 6755.5 MiB | 100 | 1.2971e+05 | ✗ No |
| 262144 | JSOSolvers (tron) | 2.60 s | 163948592 | 156.4 MiB | 101 | 1.2972e+05 | ✗ No |
| 262144 | JSOSolvers (trunk) | 4.25 s | 140843840 | 134.3 MiB | 101 | 1.2971e+05 | ✗ No |
| 262144 | SecondOrderOptimization (LM) | 2.14 s | 4693930912 | 4476.5 MiB | 100 | 1.2970e+05 | ✓ Yes |
| 524288 | SecondOrderOptimization (Dogleg) | 4.01 s | 9699496112 | 9250.2 MiB | 100 | 2.5949e+05 | ✓ Yes |
| 524288 | LeastSquaresOptim (Dogleg) | FAILED | 41960768 | 40.0 MiB | 0 | NaN | ✗ No |
| 524288 | NonlinearSolve (TrustRegion) | FAILED | 46187904 | 44.0 MiB | 0 | NaN | ✗ No |
| 524288 | Optim (NewtonTrustRegion) | FAILED | 46155136 | 44.0 MiB | 0 | NaN | ✗ No |
| 524288 | MadNLP | 24.09 s | 14479354176 | 13808.6 MiB | 100 | 2.5945e+05 | ✗ No |
| 524288 | NonlinearSolve (LM) | FAILED | 46171520 | 44.0 MiB | 0 | NaN | ✗ No |
| 524288 | Optim (Newton) | 11.81 s | 34401747584 | 32808.1 MiB | 100 | 2.5948e+05 | ✗ No |
| 524288 | LeastSquaresOptim (LM) | FAILED | 41960768 | 40.0 MiB | 0 | NaN | ✗ No |
| 524288 | Ipopt | 25.54 s | 14455714176 | 13786.0 MiB | 100 | 2.5946e+05 | ✗ No |
| 524288 | JSOSolvers (tron) | 6.10 s | 327985232 | 312.8 MiB | 101 | 2.5946e+05 | ✗ No |
| 524288 | JSOSolvers (trunk) | 8.63 s | 285825856 | 272.6 MiB | 101 | 2.5946e+05 | ✗ No |
| 524288 | SecondOrderOptimization (LM) | 4.30 s | 9573529040 | 9130.0 MiB | 100 | 2.5945e+05 | ✓ Yes |
| 1048576 | SecondOrderOptimization (Dogleg) | 7.78 s | 19462656176 | 18561.0 MiB | 100 | 5.1899e+05 | ✓ Yes |
| 1048576 | LeastSquaresOptim (Dogleg) | FAILED | 83903808 | 80.0 MiB | 0 | NaN | ✗ No |
| 1048576 | NonlinearSolve (TrustRegion) | FAILED | 100681088 | 96.0 MiB | 0 | NaN | ✗ No |
| 1048576 | Optim (NewtonTrustRegion) | FAILED | 92292480 | 88.0 MiB | 0 | NaN | ✗ No |
| 1048576 | MadNLP | 47.72 s | 29176768832 | 27825.1 MiB | 100 | 5.1895e+05 | ✗ No |
| 1048576 | NonlinearSolve (LM) | FAILED | 92308864 | 88.0 MiB | 0 | NaN | ✗ No |
| 1048576 | Optim (Newton) | 23.25 s | 68123771488 | 64967.9 MiB | 100 | 5.1898e+05 | ✗ No |
| 1048576 | LeastSquaresOptim (LM) | FAILED | 83903808 | 80.0 MiB | 0 | NaN | ✗ No |
| 1048576 | Ipopt | 51.04 s | 29507416448 | 28140.5 MiB | 100 | 5.1896e+05 | ✗ No |
| 1048576 | JSOSolvers (tron) | 12.00 s | 664004656 | 633.2 MiB | 101 | 5.1896e+05 | ✗ No |
| 1048576 | JSOSolvers (trunk) | 17.39 s | 612637568 | 584.3 MiB | 101 | 5.1896e+05 | ✗ No |
| 1048576 | SecondOrderOptimization (LM) | 8.86 s | 19262206880 | 18369.9 MiB | 100 | 5.1895e+05 | ✓ Yes |

---

## 3. Analysis & Key Takeaways

- **Asymptotic Complexity**: Log-log scaling indicates the empirical runtime growth rate as Variables n expands.
- **Fastest Model**: The fastest linear system assembly was consistently achieved by `Standalone (Sparse)`.
- **Top Optimizer**: Solvers leveraging specialized structure (e.g. sparse block factorization in SecondOrderOptimization) demonstrate superior scaling exponents on large problem regimes.
