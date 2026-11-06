# Dense Affine Alignment

- **Category**: `small_dense`
- **Scaling Metric**: Dimension n
- **Problem Sizes Evaluated**: 1, 2, 3, 4, 6, 8, 10, 14, 18, 22, 26, 32 (12 sizes)

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed lines) and **Cost + Linear System Assembly** (solid lines) across problem sizes.

![Dense Affine Alignment Model Evaluation Scaling](../assets/plots/affine_alignment_models.png)

### Model Evaluation Timings

| Dimension n | Model | Cost Time | Cost Allocs | Linsys Time | Linsys Allocs | Linsys Memory |
|:---|:---|:---|:---|:---|:---|:---|
| 1 | Standalone ★ | 583.0 ns | 16 | 542.0 ns | 16 | 800 B |
| 1 | NLLSModel | 500.0 ns | 16 | 708.0 ns | 16 | 800 B |
| 2 | Standalone ★ | 583.0 ns | 16 | 583.0 ns | 16 | 1.2 KiB |
| 2 | NLLSModel | 625.0 ns | 16 | 833.0 ns | 16 | 1.2 KiB |
| 3 | Standalone ★ | 792.0 ns | 16 | 667.0 ns | 16 | 1.9 KiB |
| 3 | NLLSModel | 750.0 ns | 16 | 875.0 ns | 16 | 1.9 KiB |
| 4 | Standalone ★ | 1.00 μs | 16 | 750.0 ns | 16 | 2.8 KiB |
| 4 | NLLSModel | 1.08 μs | 16 | 1.12 μs | 16 | 2.8 KiB |
| 6 | Standalone | 1.33 μs | 16 | 1.50 μs | 16 | 5.5 KiB |
| 6 | NLLSModel ★ | 1.38 μs | 16 | 1.33 μs | 16 | 5.5 KiB |
| 8 | Standalone ★ | 2.08 μs | 19 | 2.38 μs | 19 | 8.9 KiB |
| 8 | NLLSModel | 2.12 μs | 19 | 2.38 μs | 19 | 8.9 KiB |
| 10 | Standalone ★ | 3.46 μs | 19 | 3.29 μs | 19 | 14.6 KiB |
| 10 | NLLSModel | 3.04 μs | 19 | 3.42 μs | 19 | 14.6 KiB |
| 14 | Standalone | 5.96 μs | 21 | 4.79 μs | 21 | 29.1 KiB |
| 14 | NLLSModel ★ | 4.67 μs | 21 | 4.54 μs | 21 | 29.1 KiB |
| 18 | Standalone | 6.21 μs | 21 | 7.29 μs | 21 | 49.2 KiB |
| 18 | NLLSModel ★ | 6.67 μs | 21 | 6.38 μs | 21 | 49.2 KiB |
| 22 | Standalone | 9.54 μs | 21 | 11.42 μs | 21 | 65.3 KiB |
| 22 | NLLSModel ★ | 9.17 μs | 21 | 9.58 μs | 21 | 65.3 KiB |
| 26 | Standalone | 14.62 μs | 21 | 15.33 μs | 21 | 97.4 KiB |
| 26 | NLLSModel ★ | 12.96 μs | 21 | 14.38 μs | 21 | 97.4 KiB |
| 32 | Standalone | 22.92 μs | 21 | 21.29 μs | 21 | 129.6 KiB |
| 32 | NLLSModel ★ | 21.54 μs | 21 | 20.38 μs | 21 | 129.6 KiB |

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all compatible optimizer families.

![Dense Affine Alignment Optimizer Scaling](../assets/plots/affine_alignment_optimizers.png)

### Optimizer Results Summary

| Dimension n | Optimizer | Runtime | Allocs | Memory | Iterations | Final Cost | Converged |
|:---|:---|:---|:---|:---|:---|:---|:---|
| 1 | SecondOrderOptimization (Dogleg) | 13.85 μs | 15280 | 14.9 KiB | 3 | 6.1630e-33 | ✓ Yes |
| 1 | LeastSquaresOptim (Dogleg) | 13.33 μs | 165392 | 161.5 KiB | 3 | 4.9304e-32 | ✓ Yes |
| 1 | NonlinearSolve (TrustRegion) | 33.25 μs | 31696 | 31.0 KiB | 3 | 8.0119e-32 | ✓ Yes |
| 1 | Optim (NewtonTrustRegion) | 15.92 μs | 24432 | 23.9 KiB | 1 | 5.5467e-32 | ✓ Yes |
| 1 | MadNLP | 195.81 μs | 53456 | 52.2 KiB | 1 | 4.9304e-32 | ✓ Yes |
| 1 | NonlinearSolve (LM) | 58.40 μs | 55120 | 53.8 KiB | 8 | 5.8055e-28 | ✓ Yes |
| 1 | Optim (Newton) | 15.29 μs | 23280 | 22.7 KiB | 1 | 3.0815e-32 | ✓ Yes |
| 1 | LeastSquaresOptim (LM) | 20.73 μs | 324480 | 316.9 KiB | 6 | 1.6911e-26 | ✓ Yes |
| 1 | Ipopt | 311.40 μs | 15440 | 15.1 KiB | 1 | 0.0000e+00 | ✓ Yes |
| 1 | JSOSolvers (tron) | 15.38 μs | 19360 | 18.9 KiB | 2 | 4.9304e-32 | ✓ Yes |
| 1 | JSOSolvers (trunk) | 16.33 μs | 23072 | 22.5 KiB | 4 | 2.4652e-32 | ✓ Yes |
| 1 | SecondOrderOptimization (LM) | 13.46 μs | 15168 | 14.8 KiB | 3 | 6.1630e-33 | ✓ Yes |
| 2 | SecondOrderOptimization (Dogleg) | 28.60 μs | 61904 | 60.5 KiB | 6 | 6.9025e-31 | ✓ Yes |
| 2 | LeastSquaresOptim (Dogleg) | 38.46 μs | 365568 | 357.0 KiB | 6 | 1.2819e-30 | ✓ Yes |
| 2 | NonlinearSolve (TrustRegion) | 78.00 μs | 90320 | 88.2 KiB | 6 | 6.9025e-31 | ✓ Yes |
| 2 | Optim (NewtonTrustRegion) | 63.04 μs | 138784 | 135.5 KiB | 5 | 1.7417e-28 | ✓ Yes |
| 2 | MadNLP | 295.21 μs | 100944 | 98.6 KiB | 5 | 4.4573e-28 | ✓ Yes |
| 2 | NonlinearSolve (LM) | 315.95 ms | 177536 | 173.4 KiB | 13 | 2.3102e-26 | ✓ Yes |
| 2 | Optim (Newton) | 42.27 μs | 114928 | 112.2 KiB | 5 | 4.4287e-28 | ✓ Yes |
| 2 | LeastSquaresOptim (LM) | 46.81 μs | 541968 | 529.3 KiB | 9 | 2.0176e-26 | ✓ Yes |
| 2 | Ipopt | 578.73 μs | 64928 | 63.4 KiB | 5 | 4.4267e-28 | ✓ Yes |
| 2 | JSOSolvers (tron) | 54.38 μs | 85488 | 83.5 KiB | 8 | 9.0168e-14 | ✓ Yes |
| 2 | JSOSolvers (trunk) | 41.54 μs | 82800 | 80.9 KiB | 8 | 7.7333e-21 | ✓ Yes |
| 2 | SecondOrderOptimization (LM) | 27.81 μs | 61392 | 60.0 KiB | 6 | 1.8735e-30 | ✓ Yes |
| 3 | SecondOrderOptimization (Dogleg) | 75.92 μs | 252864 | 246.9 KiB | 9 | 9.4294e-31 | ✓ Yes |
| 3 | LeastSquaresOptim (Dogleg) | 111.67 μs | 710704 | 694.0 KiB | 9 | 1.0415e-30 | ✓ Yes |
| 3 | NonlinearSolve (TrustRegion) | 157.00 μs | 328816 | 321.1 KiB | 9 | 1.2677e-26 | ✓ Yes |
| 3 | Optim (NewtonTrustRegion) | 246.54 μs | 568464 | 555.1 KiB | 8 | 2.9832e-20 | ✓ Yes |
| 3 | MadNLP | 434.17 μs | 279648 | 273.1 KiB | 8 | 4.0949e-21 | ✓ Yes |
| 3 | NonlinearSolve (LM) | 465.15 μs | 606208 | 592.0 KiB | 20 | 6.4350e-27 | ✓ Yes |
| 3 | Optim (Newton) | 144.71 μs | 481520 | 470.2 KiB | 8 | 4.0949e-21 | ✓ Yes |
| 3 | LeastSquaresOptim (LM) | 128.10 μs | 787264 | 768.8 KiB | 10 | 1.4699e-24 | ✓ Yes |
| 3 | Ipopt | 777.58 μs | 238720 | 233.1 KiB | 8 | 4.0949e-21 | ✓ Yes |
| 3 | JSOSolvers (tron) | 156.40 μs | 302576 | 295.5 KiB | 11 | 8.3278e-16 | ✓ Yes |
| 3 | JSOSolvers (trunk) | 128.85 μs | 300080 | 293.0 KiB | 11 | 2.4938e-22 | ✓ Yes |
| 3 | SecondOrderOptimization (LM) | 72.44 μs | 257856 | 251.8 KiB | 9 | 8.8747e-31 | ✓ Yes |
| 4 | SecondOrderOptimization (Dogleg) | 184.38 μs | 875200 | 854.7 KiB | 13 | 2.3173e-30 | ✓ Yes |
| 4 | LeastSquaresOptim (Dogleg) | 256.07 ms | 1878672 | 1.8 MiB | 22 | 4.7085e-30 | ✓ Yes |
| 4 | NonlinearSolve (TrustRegion) | 585.88 μs | 1214464 | 1.2 MiB | 20 | 1.8242e-30 | ✓ Yes |
| 4 | Optim (NewtonTrustRegion) | 632.10 μs | 1811696 | 1.7 MiB | 10 | 7.5511e-20 | ✓ Yes |
| 4 | MadNLP | 960.92 μs | 1127712 | 1.1 MiB | 15 | 1.1585e-21 | ✓ Yes |
| 4 | NonlinearSolve (LM) | 706.37 ms | 104971904 | 100.1 MiB | 100 | 1.0115e+00 | ✗ No |
| 4 | Optim (Newton) | 514.12 μs | 2479696 | 2.4 MiB | 19 | 3.9823e-23 | ✓ Yes |
| 4 | LeastSquaresOptim (LM) | 562.46 μs | 2387888 | 2.3 MiB | 23 | 1.8934e-27 | ✓ Yes |
| 4 | Ipopt | 1.72 ms | 1081936 | 1.0 MiB | 15 | 1.1585e-21 | ✓ Yes |
| 4 | JSOSolvers (tron) | 440.02 μs | 1166992 | 1.1 MiB | 19 | 1.2355e-15 | ✓ Yes |
| 4 | JSOSolvers (trunk) | 216.98 μs | 691456 | 675.2 KiB | 10 | 2.5726e-17 | ✓ Yes |
| 4 | SecondOrderOptimization (LM) | 267.40 μs | 1176752 | 1.1 MiB | 15 | 2.2564e-28 | ✓ Yes |
| 6 | SecondOrderOptimization (Dogleg) | 433.93 ms | 2536224 | 2.4 MiB | 9 | 2.1324e-29 | ✓ Yes |
| 6 | LeastSquaresOptim (Dogleg) | 255.49 ms | 2622448 | 2.5 MiB | 8 | 1.1340e-29 | ✓ Yes |
| 6 | NonlinearSolve (TrustRegion) | 918.25 μs | 2543328 | 2.4 MiB | 8 | 1.3139e-29 | ✓ Yes |
| 6 | Optim (NewtonTrustRegion) | 2.24 ms | 6597008 | 6.3 MiB | 9 | 1.9549e-29 | ✓ Yes |
| 6 | MadNLP | 2.90 s | 314699696 | 300.1 MiB | 7 | 1.7897e-29 | ✓ Yes |
| 6 | NonlinearSolve (LM) | 352.33 ms | 8446096 | 8.1 MiB | 56 | 4.4991e-26 | ✓ Yes |
| 6 | Optim (Newton) | 815.56 μs | 4631824 | 4.4 MiB | 7 | 1.6961e-29 | ✓ Yes |
| 6 | LeastSquaresOptim (LM) | 1.36 ms | 3256304 | 3.1 MiB | 10 | 1.4863e-24 | ✓ Yes |
| 6 | Ipopt | 1.44 ms | 2113616 | 2.0 MiB | 7 | 1.3016e-29 | ✓ Yes |
| 6 | JSOSolvers (tron) | 267.18 ms | 3368736 | 3.2 MiB | 12 | 1.2747e-14 | ✓ Yes |
| 6 | JSOSolvers (trunk) | 270.72 ms | 2864864 | 2.7 MiB | 10 | 7.4532e-14 | ✓ Yes |
| 6 | SecondOrderOptimization (LM) | 484.17 μs | 2489632 | 2.4 MiB | 8 | 1.2992e-29 | ✓ Yes |
| 8 | SecondOrderOptimization (Dogleg) | 1.29 ms | 6561088 | 6.3 MiB | 8 | 2.9385e-29 | ✓ Yes |
| 8 | LeastSquaresOptim (Dogleg) | 2.99 ms | 5904608 | 5.6 MiB | 7 | 3.1554e-29 | ✓ Yes |
| 8 | NonlinearSolve (TrustRegion) | 2.28 ms | 6293952 | 6.0 MiB | 7 | 1.9919e-29 | ✓ Yes |
| 8 | Optim (NewtonTrustRegion) | 5.54 ms | 15163200 | 14.5 MiB | 7 | 3.1949e-29 | ✓ Yes |
| 8 | MadNLP | 1.89 ms | 5786912 | 5.5 MiB | 6 | 6.6971e-26 | ✓ Yes |
| 8 | NonlinearSolve (LM) | 58.49 ms | 38516880 | 36.7 MiB | 100 | 1.3827e-25 | ✗ No |
| 8 | Optim (Newton) | 2.26 ms | 12039296 | 11.5 MiB | 6 | 6.6749e-26 | ✓ Yes |
| 8 | LeastSquaresOptim (LM) | 4.93 ms | 7531360 | 7.2 MiB | 9 | 6.0110e-22 | ✓ Yes |
| 8 | Ipopt | 2.23 ms | 5351472 | 5.1 MiB | 6 | 6.6899e-26 | ✓ Yes |
| 8 | JSOSolvers (tron) | 3.94 ms | 8983744 | 8.6 MiB | 11 | 1.2329e-16 | ✓ Yes |
| 8 | JSOSolvers (trunk) | 3.15 ms | 8257504 | 7.9 MiB | 10 | 3.8467e-16 | ✓ Yes |
| 8 | SecondOrderOptimization (LM) | 1.28 ms | 6530576 | 6.2 MiB | 7 | 3.5795e-29 | ✓ Yes |
| 10 | SecondOrderOptimization (Dogleg) | 3.82 ms | 19248704 | 18.4 MiB | 9 | 5.5911e-29 | ✓ Yes |
| 10 | LeastSquaresOptim (Dogleg) | 11.69 ms | 17001488 | 16.2 MiB | 8 | 5.6897e-29 | ✓ Yes |
| 10 | NonlinearSolve (TrustRegion) | 7.19 ms | 18147168 | 17.3 MiB | 9 | 8.7465e-29 | ✓ Yes |
| 10 | Optim (NewtonTrustRegion) | 15.32 ms | 45513904 | 43.4 MiB | 8 | 8.6856e-24 | ✓ Yes |
| 10 | MadNLP | 4.56 ms | 17056224 | 16.3 MiB | 7 | 4.7529e-29 | ✓ Yes |
| 10 | NonlinearSolve (LM) | 148.43 ms | 85970160 | 82.0 MiB | 100 | 2.9673e-25 | ✗ No |
| 10 | Optim (Newton) | 6.58 ms | 36013680 | 34.3 MiB | 7 | 8.3619e-29 | ✓ Yes |
| 10 | LeastSquaresOptim (LM) | 17.41 ms | 21134992 | 20.2 MiB | 10 | 9.6849e-24 | ✓ Yes |
| 10 | Ipopt | 5.61 ms | 16168752 | 15.4 MiB | 7 | 5.3445e-29 | ✓ Yes |
| 10 | JSOSolvers (tron) | 9.50 ms | 23967536 | 22.9 MiB | 11 | 5.2983e-14 | ✓ Yes |
| 10 | JSOSolvers (trunk) | 8.28 ms | 23968320 | 22.9 MiB | 11 | 4.0562e-17 | ✓ Yes |
| 10 | SecondOrderOptimization (LM) | 3.85 ms | 19186560 | 18.3 MiB | 8 | 4.1317e-29 | ✓ Yes |
| 14 | SecondOrderOptimization (Dogleg) | 17.28 ms | 56463392 | 53.8 MiB | 8 | 2.0678e-28 | ✓ Yes |
| 14 | LeastSquaresOptim (Dogleg) | 51.75 ms | 47869456 | 45.7 MiB | 7 | 1.3657e-28 | ✓ Yes |
| 14 | NonlinearSolve (TrustRegion) | 23.24 ms | 45702416 | 43.6 MiB | 6 | 4.9264e-28 | ✓ Yes |
| 14 | Optim (NewtonTrustRegion) | 66.85 ms | 161425472 | 153.9 MiB | 9 | 6.5665e-20 | ✓ Yes |
| 14 | MadNLP | 18.19 ms | 49503136 | 47.2 MiB | 6 | 3.3625e-28 | ✓ Yes |
| 14 | NonlinearSolve (LM) | 724.09 ms | 261177664 | 249.1 MiB | 100 | 9.3385e-25 | ✗ No |
| 14 | Optim (Newton) | 26.31 ms | 105138560 | 100.3 MiB | 6 | 2.5599e-28 | ✓ Yes |
| 14 | LeastSquaresOptim (LM) | 100.62 ms | 73911216 | 70.5 MiB | 11 | 2.2508e-27 | ✓ Yes |
| 14 | Ipopt | 19.45 ms | 46424496 | 44.3 MiB | 6 | 2.6269e-28 | ✓ Yes |
| 14 | JSOSolvers (tron) | 41.50 ms | 71780384 | 68.5 MiB | 10 | 9.6790e-13 | ✓ Yes |
| 14 | JSOSolvers (trunk) | 43.18 ms | 84511584 | 80.6 MiB | 12 | 2.2994e-14 | ✓ Yes |
| 14 | SecondOrderOptimization (LM) | 17.48 ms | 56478192 | 53.9 MiB | 7 | 2.0747e-28 | ✓ Yes |
| 18 | SecondOrderOptimization (Dogleg) | 65.42 ms | 176726400 | 168.5 MiB | 9 | 4.1415e-28 | ✓ Yes |
| 18 | LeastSquaresOptim (Dogleg) | 208.67 ms | 151164576 | 144.2 MiB | 8 | 3.4986e-28 | ✓ Yes |
| 18 | NonlinearSolve (TrustRegion) | 90.80 ms | 144688688 | 138.0 MiB | 7 | 3.9719e-28 | ✓ Yes |
| 18 | Optim (NewtonTrustRegion) | 257.58 ms | 545341872 | 520.1 MiB | 11 | 4.5872e-28 | ✓ Yes |
| 18 | MadNLP | 67.40 ms | 156094064 | 148.9 MiB | 7 | 3.8181e-28 | ✓ Yes |
| 18 | NonlinearSolve (LM) | 2.62 s | 719669136 | 686.3 MiB | 100 | 1.9810e-24 | ✗ No |
| 18 | Optim (Newton) | 96.30 ms | 331511984 | 316.2 MiB | 7 | 3.7274e-28 | ✓ Yes |
| 18 | LeastSquaresOptim (LM) | 388.83 ms | 223881760 | 213.5 MiB | 12 | 1.3774e-22 | ✓ Yes |
| 18 | Ipopt | 73.63 ms | 148274464 | 141.4 MiB | 7 | 3.5617e-28 | ✓ Yes |
| 18 | JSOSolvers (tron) | 194.00 ms | 291101312 | 277.6 MiB | 16 | 5.8648e-13 | ✓ Yes |
| 18 | JSOSolvers (trunk) | 164.40 ms | 255533248 | 243.7 MiB | 13 | 1.2219e-11 | ✓ Yes |
| 18 | SecondOrderOptimization (LM) | 66.70 ms | 177692848 | 169.5 MiB | 8 | 2.8636e-28 | ✓ Yes |
| 22 | SecondOrderOptimization (Dogleg) | 193.44 ms | 334901744 | 319.4 MiB | 8 | 8.7011e-28 | ✓ Yes |
| 22 | LeastSquaresOptim (Dogleg) | 521.08 ms | 281599792 | 268.6 MiB | 7 | 8.2278e-28 | ✓ Yes |
| 22 | NonlinearSolve (TrustRegion) | 264.19 ms | 306138192 | 292.0 MiB | 7 | 8.3264e-28 | ✓ Yes |
| 22 | Optim (NewtonTrustRegion) | 642.80 ms | 1077546096 | 1027.6 MiB | 10 | 2.1983e-22 | ✓ Yes |
| 22 | MadNLP | 165.45 ms | 293103696 | 279.5 MiB | 6 | 1.5757e-25 | ✓ Yes |
| 22 | NonlinearSolve (LM) | 7.52 s | 1444216304 | 1377.3 MiB | 100 | 5.5771e-24 | ✗ No |
| 22 | Optim (Newton) | 226.99 ms | 629884880 | 600.7 MiB | 6 | 1.6213e-25 | ✓ Yes |
| 22 | LeastSquaresOptim (LM) | 1.02 s | 435641968 | 415.5 MiB | 11 | 8.5033e-22 | ✓ Yes |
| 22 | Ipopt | 168.07 ms | 276366528 | 263.6 MiB | 6 | 1.6097e-25 | ✓ Yes |
| 22 | JSOSolvers (tron) | 490.11 ms | 578538128 | 551.7 MiB | 15 | 7.6294e-11 | ✓ Yes |
| 22 | JSOSolvers (trunk) | 475.77 ms | 540935776 | 515.9 MiB | 13 | 1.9909e-11 | ✓ Yes |
| 22 | SecondOrderOptimization (LM) | 186.58 ms | 338613440 | 322.9 MiB | 7 | 1.0204e-27 | ✓ Yes |
| 26 | SecondOrderOptimization (Dogleg) | 485.73 ms | 706439120 | 673.7 MiB | 9 | 1.0654e-27 | ✓ Yes |
| 26 | LeastSquaresOptim (Dogleg) | 1.32 s | 524150128 | 499.9 MiB | 7 | 1.1730e-27 | ✓ Yes |
| 26 | NonlinearSolve (TrustRegion) | 639.72 ms | 586201824 | 559.0 MiB | 7 | 1.2551e-27 | ✓ Yes |
| 26 | Optim (NewtonTrustRegion) | 1.65 s | 2312151904 | 2205.0 MiB | 11 | 1.2034e-27 | ✓ Yes |
| 26 | MadNLP | 448.99 ms | 546975008 | 521.6 MiB | 6 | 2.3089e-17 | ✓ Yes |
| 26 | NonlinearSolve (LM) | 18.37 s | 2671875552 | 2548.1 MiB | 100 | 6.1360e-24 | ✗ No |
| 26 | Optim (Newton) | 615.85 ms | 1316888160 | 1255.9 MiB | 7 | 1.2606e-27 | ✓ Yes |
| 26 | LeastSquaresOptim (LM) | 2.81 s | 883603744 | 842.7 MiB | 12 | 3.3899e-23 | ✓ Yes |
| 26 | Ipopt | 390.74 ms | 514979024 | 491.1 MiB | 6 | 2.3089e-17 | ✓ Yes |
| 26 | JSOSolvers (tron) | 1.41 s | 1428432384 | 1362.3 MiB | 20 | 2.6685e-11 | ✓ Yes |
| 26 | JSOSolvers (trunk) | 1.14 s | 1077710544 | 1027.8 MiB | 14 | 3.7176e-11 | ✓ Yes |
| 26 | SecondOrderOptimization (LM) | 465.97 ms | 643969088 | 614.1 MiB | 7 | 1.2330e-27 | ✓ Yes |
| 32 | SecondOrderOptimization (Dogleg) | 1.33 s | 1349772496 | 1287.2 MiB | 8 | 2.4112e-27 | ✓ Yes |
| 32 | LeastSquaresOptim (Dogleg) | 4.71 s | 1128993248 | 1076.7 MiB | 7 | 2.2798e-27 | ✓ Yes |
| 32 | NonlinearSolve (TrustRegion) | 1.75 s | 1083807072 | 1033.6 MiB | 6 | 3.9648e-27 | ✓ Yes |
| 32 | Optim (NewtonTrustRegion) | 4.77 s | 4788436000 | 4566.6 MiB | 11 | 2.4964e-27 | ✓ Yes |
| 32 | MadNLP | 1.26 s | 1212659408 | 1156.5 MiB | 6 | 4.0508e-27 | ✓ Yes |
| 32 | NonlinearSolve (LM) | 60.30 s | 5674365760 | 5411.5 MiB | 100 | 1.4662e-23 | ✗ No |
| 32 | Optim (Newton) | 1.56 s | 2528319888 | 2411.2 MiB | 6 | 3.7325e-27 | ✓ Yes |
| 32 | LeastSquaresOptim (LM) | 8.42 s | 1742811488 | 1662.1 MiB | 11 | 4.0979e-22 | ✓ Yes |
| 32 | Ipopt | 1.14 s | 1118459088 | 1066.6 MiB | 6 | 3.6714e-27 | ✓ Yes |
| 32 | JSOSolvers (tron) | 3.63 s | 2477577040 | 2362.8 MiB | 16 | 3.9724e-13 | ✓ Yes |
| 32 | JSOSolvers (trunk) | 3.11 s | 2327411600 | 2219.6 MiB | 14 | 6.6281e-12 | ✓ Yes |
| 32 | SecondOrderOptimization (LM) | 1.27 s | 1357138752 | 1294.3 MiB | 7 | 2.4727e-27 | ✓ Yes |

---

## 3. Analysis & Key Takeaways

- **Asymptotic Complexity**: Log-log scaling indicates the empirical runtime growth rate as Dimension n expands.
- **Fastest Model**: The fastest linear system assembly was consistently achieved by `Standalone`.
- **Top Optimizer**: Solvers leveraging specialized structure (e.g. sparse block factorization in SecondOrderOptimization) demonstrate superior scaling exponents on large problem regimes.
