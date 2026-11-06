# Exponential Curve Fitting

- **Category**: `medium_dense`
- **Scaling Metric**: Data Points m
- **Problem Sizes Evaluated**: 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768 (10 sizes)

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed lines) and **Cost + Linear System Assembly** (solid lines) across problem sizes.

![Exponential Curve Fitting Model Evaluation Scaling](../assets/plots/curve_fitting_models.png)

### Model Evaluation Timings

| Data Points m | Model | Cost Time | Cost Allocs | Linsys Time | Linsys Allocs | Linsys Memory |
|:---|:---|:---|:---|:---|:---|:---|
| 64 | Standalone | 333.0 ns | 0 | 958.0 ns | 0 | 0 B |
| 64 | NLLSModel (Static) ★ | 333.0 ns | 0 | 291.0 ns | 0 | 0 B |
| 128 | Standalone | 542.0 ns | 0 | 1.75 μs | 0 | 0 B |
| 128 | NLLSModel (Static) ★ | 625.0 ns | 0 | 542.0 ns | 0 | 0 B |
| 256 | Standalone | 1.12 μs | 0 | 3.58 μs | 0 | 0 B |
| 256 | NLLSModel (Static) ★ | 1.12 μs | 0 | 1.12 μs | 0 | 0 B |
| 512 | Standalone | 2.12 μs | 0 | 6.83 μs | 0 | 0 B |
| 512 | NLLSModel (Static) ★ | 2.17 μs | 0 | 2.17 μs | 0 | 0 B |
| 1024 | Standalone | 4.42 μs | 0 | 14.21 μs | 0 | 0 B |
| 1024 | NLLSModel (Static) ★ | 4.46 μs | 0 | 4.42 μs | 0 | 0 B |
| 2048 | Standalone | 8.83 μs | 0 | 28.62 μs | 0 | 0 B |
| 2048 | NLLSModel (Static) ★ | 11.00 μs | 0 | 8.88 μs | 0 | 0 B |
| 4096 | Standalone | 17.75 μs | 0 | 58.46 μs | 0 | 0 B |
| 4096 | NLLSModel (Static) ★ | 17.75 μs | 0 | 18.33 μs | 0 | 0 B |
| 8192 | Standalone | 42.12 μs | 0 | 123.54 μs | 0 | 0 B |
| 8192 | NLLSModel (Static) ★ | 35.92 μs | 0 | 37.88 μs | 0 | 0 B |
| 16384 | Standalone | 69.75 μs | 0 | 238.71 μs | 0 | 0 B |
| 16384 | NLLSModel (Static) ★ | 71.25 μs | 0 | 68.50 μs | 0 | 0 B |
| 32768 | Standalone | 130.33 μs | 0 | 441.83 μs | 0 | 0 B |
| 32768 | NLLSModel (Static) ★ | 133.83 μs | 0 | 133.33 μs | 0 | 0 B |

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all compatible optimizer families.

![Exponential Curve Fitting Optimizer Scaling](../assets/plots/curve_fitting_optimizers.png)

### Optimizer Results Summary

| Data Points m | Optimizer | Runtime | Allocs | Memory | Iterations | Final Cost | Converged |
|:---|:---|:---|:---|:---|:---|:---|:---|
| 64 | SecondOrderOptimization (Dogleg) | 24.00 μs | 9712 | 9.5 KiB | 7 | 1.3405e-02 | ✓ Yes |
| 64 | LeastSquaresOptim (Dogleg) | 18.83 μs | 263712 | 257.5 KiB | 5 | 1.3405e-02 | ✓ Yes |
| 64 | NonlinearSolve (TrustRegion) | 175.27 μs | 81808 | 79.9 KiB | 61 | 1.3405e-02 | ✓ Yes |
| 64 | Optim (NewtonTrustRegion) | 29.54 μs | 23232 | 22.7 KiB | 5 | 1.3405e-02 | ✓ Yes |
| 64 | MadNLP | 278.67 μs | 49856 | 48.7 KiB | 6 | 1.3405e-02 | ✓ Yes |
| 64 | NonlinearSolve (LM) | 27.07 ms | 2104512 | 2.0 MiB | 100 | 1.3405e-02 | ✗ No |
| 64 | Optim (Newton) | 22.92 μs | 11696 | 11.4 KiB | 6 | 1.3405e-02 | ✓ Yes |
| 64 | LeastSquaresOptim (LM) | 23.15 μs | 365424 | 356.9 KiB | 7 | 1.3405e-02 | ✓ Yes |
| 64 | Ipopt | 586.69 μs | 17680 | 17.3 KiB | 6 | 1.3405e-02 | ✓ Yes |
| 64 | JSOSolvers (tron) | 27.25 μs | 12128 | 11.8 KiB | 5 | 1.3405e-02 | ✓ Yes |
| 64 | JSOSolvers (trunk) | 16.35 μs | 8576 | 8.4 KiB | 5 | 1.3405e-02 | ✓ Yes |
| 64 | SecondOrderOptimization (LM) | 12.44 μs | 9168 | 9.0 KiB | 6 | 1.3405e-02 | ✓ Yes |
| 128 | SecondOrderOptimization (Dogleg) | 21.67 μs | 14608 | 14.3 KiB | 6 | 2.5926e-02 | ✓ Yes |
| 128 | LeastSquaresOptim (Dogleg) | 24.21 μs | 270464 | 264.1 KiB | 5 | 2.5926e-02 | ✓ Yes |
| 128 | NonlinearSolve (TrustRegion) | 159.27 μs | 97904 | 95.6 KiB | 39 | 2.5926e-02 | ✓ Yes |
| 128 | Optim (NewtonTrustRegion) | 35.88 μs | 26384 | 25.8 KiB | 4 | 2.5926e-02 | ✓ Yes |
| 128 | MadNLP | 277.83 μs | 52416 | 51.2 KiB | 5 | 2.5926e-02 | ✓ Yes |
| 128 | NonlinearSolve (LM) | 792.88 μs | 330336 | 322.6 KiB | 100 | 2.5926e-02 | ✗ No |
| 128 | Optim (Newton) | 30.46 μs | 16704 | 16.3 KiB | 5 | 2.5926e-02 | ✓ Yes |
| 128 | LeastSquaresOptim (LM) | 32.60 μs | 372656 | 363.9 KiB | 7 | 2.5926e-02 | ✓ Yes |
| 128 | Ipopt | 557.60 μs | 18992 | 18.5 KiB | 5 | 2.5926e-02 | ✓ Yes |
| 128 | JSOSolvers (tron) | 37.25 μs | 14688 | 14.3 KiB | 5 | 2.5926e-02 | ✓ Yes |
| 128 | JSOSolvers (trunk) | 25.19 μs | 11136 | 10.9 KiB | 5 | 2.5926e-02 | ✓ Yes |
| 128 | SecondOrderOptimization (LM) | 18.06 μs | 14288 | 14.0 KiB | 6 | 2.5926e-02 | ✓ Yes |
| 256 | SecondOrderOptimization (Dogleg) | 34.92 μs | 24720 | 24.1 KiB | 6 | 5.5410e-02 | ✓ Yes |
| 256 | LeastSquaresOptim (Dogleg) | 41.00 μs | 283552 | 276.9 KiB | 5 | 5.5410e-02 | ✓ Yes |
| 256 | NonlinearSolve (TrustRegion) | 242.62 μs | 161456 | 157.7 KiB | 38 | 5.5410e-02 | ✓ Yes |
| 256 | Optim (NewtonTrustRegion) | 51.25 μs | 36496 | 35.6 KiB | 4 | 5.5410e-02 | ✓ Yes |
| 256 | MadNLP | 280.19 μs | 57472 | 56.1 KiB | 5 | 5.5410e-02 | ✓ Yes |
| 256 | NonlinearSolve (LM) | 1.18 ms | 665536 | 649.9 KiB | 100 | 5.5410e-02 | ✗ No |
| 256 | Optim (Newton) | 47.46 μs | 26816 | 26.2 KiB | 5 | 5.5410e-02 | ✓ Yes |
| 256 | LeastSquaresOptim (LM) | 60.94 μs | 437696 | 427.4 KiB | 8 | 5.5410e-02 | ✓ Yes |
| 256 | Ipopt | 534.33 μs | 24048 | 23.5 KiB | 5 | 5.5410e-02 | ✓ Yes |
| 256 | JSOSolvers (tron) | 56.54 μs | 19744 | 19.3 KiB | 5 | 5.5410e-02 | ✓ Yes |
| 256 | JSOSolvers (trunk) | 40.83 μs | 16192 | 15.8 KiB | 5 | 5.5410e-02 | ✓ Yes |
| 256 | SecondOrderOptimization (LM) | 35.04 μs | 24976 | 24.4 KiB | 6 | 5.5410e-02 | ✓ Yes |
| 512 | SecondOrderOptimization (Dogleg) | 71.85 μs | 45424 | 44.4 KiB | 7 | 1.0665e-01 | ✓ Yes |
| 512 | LeastSquaresOptim (Dogleg) | 74.38 μs | 310176 | 302.9 KiB | 5 | 1.0665e-01 | ✓ Yes |
| 512 | NonlinearSolve (TrustRegion) | 415.56 μs | 294576 | 287.7 KiB | 38 | 1.0665e-01 | ✓ Yes |
| 512 | Optim (NewtonTrustRegion) | 99.62 μs | 58944 | 57.6 KiB | 5 | 1.0665e-01 | ✓ Yes |
| 512 | MadNLP | 335.15 μs | 67712 | 66.1 KiB | 6 | 1.0665e-01 | ✓ Yes |
| 512 | NonlinearSolve (LM) | 1.99 ms | 1245632 | 1.2 MiB | 100 | 1.0665e-01 | ✗ No |
| 512 | Optim (Newton) | 101.02 μs | 47408 | 46.3 KiB | 6 | 1.0665e-01 | ✓ Yes |
| 512 | LeastSquaresOptim (LM) | 97.71 μs | 414928 | 405.2 KiB | 7 | 1.0665e-01 | ✓ Yes |
| 512 | Ipopt | 653.58 μs | 35536 | 34.7 KiB | 6 | 1.0665e-01 | ✓ Yes |
| 512 | JSOSolvers (tron) | 98.10 μs | 29984 | 29.3 KiB | 5 | 1.0665e-01 | ✓ Yes |
| 512 | JSOSolvers (trunk) | 76.48 μs | 26432 | 25.8 KiB | 5 | 1.0665e-01 | ✓ Yes |
| 512 | SecondOrderOptimization (LM) | 53.71 μs | 45024 | 44.0 KiB | 6 | 1.0665e-01 | ✓ Yes |
| 1024 | SecondOrderOptimization (Dogleg) | 120.69 μs | 86160 | 84.1 KiB | 6 | 2.0673e-01 | ✓ Yes |
| 1024 | LeastSquaresOptim (Dogleg) | 145.98 μs | 363424 | 354.9 KiB | 5 | 2.0673e-01 | ✓ Yes |
| 1024 | NonlinearSolve (TrustRegion) | 1.11 ms | 731696 | 714.5 KiB | 58 | 2.0673e-01 | ✓ Yes |
| 1024 | Optim (NewtonTrustRegion) | 152.35 μs | 97936 | 95.6 KiB | 4 | 2.0673e-01 | ✓ Yes |
| 1024 | MadNLP | 398.56 μs | 88192 | 86.1 KiB | 5 | 2.0673e-01 | ✓ Yes |
| 1024 | NonlinearSolve (LM) | 3.63 ms | 2405824 | 2.3 MiB | 100 | 2.0673e-01 | ✗ No |
| 1024 | Optim (Newton) | 164.27 μs | 88256 | 86.2 KiB | 5 | 2.0673e-01 | ✓ Yes |
| 1024 | LeastSquaresOptim (LM) | 193.23 μs | 471248 | 460.2 KiB | 7 | 2.0673e-01 | ✓ Yes |
| 1024 | Ipopt | 620.67 μs | 54768 | 53.5 KiB | 5 | 2.0673e-01 | ✓ Yes |
| 1024 | JSOSolvers (tron) | 219.31 μs | 50464 | 49.3 KiB | 6 | 2.0673e-01 | ✓ Yes |
| 1024 | JSOSolvers (trunk) | 138.75 μs | 46912 | 45.8 KiB | 5 | 2.0673e-01 | ✓ Yes |
| 1024 | SecondOrderOptimization (LM) | 99.35 μs | 85840 | 83.8 KiB | 6 | 2.0673e-01 | ✓ Yes |
| 2048 | SecondOrderOptimization (Dogleg) | 265.54 μs | 168304 | 164.4 KiB | 7 | 4.1154e-01 | ✓ Yes |
| 2048 | LeastSquaresOptim (Dogleg) | 278.48 μs | 469920 | 458.9 KiB | 5 | 4.1154e-01 | ✓ Yes |
| 2048 | NonlinearSolve (TrustRegion) | 1.47 ms | 1093296 | 1.0 MiB | 38 | 4.1154e-01 | ✓ Yes |
| 2048 | Optim (NewtonTrustRegion) | 350.60 μs | 181824 | 177.6 KiB | 5 | 4.1154e-01 | ✓ Yes |
| 2048 | MadNLP | 476.52 μs | 129152 | 126.1 KiB | 5 | 4.1154e-01 | ✓ Yes |
| 2048 | NonlinearSolve (LM) | 7.79 ms | 4750784 | 4.5 MiB | 100 | 4.1154e-01 | ✗ No |
| 2048 | Optim (Newton) | 372.50 μs | 170288 | 166.3 KiB | 6 | 4.1154e-01 | ✓ Yes |
| 2048 | LeastSquaresOptim (LM) | 369.75 μs | 592080 | 578.2 KiB | 7 | 4.1154e-01 | ✓ Yes |
| 2048 | Ipopt | 723.40 μs | 95728 | 93.5 KiB | 5 | 4.1154e-01 | ✓ Yes |
| 2048 | JSOSolvers (tron) | 276.21 μs | 91424 | 89.3 KiB | 4 | 4.1154e-01 | ✓ Yes |
| 2048 | JSOSolvers (trunk) | 230.12 μs | 87872 | 85.8 KiB | 4 | 4.1154e-01 | ✓ Yes |
| 2048 | SecondOrderOptimization (LM) | 226.48 μs | 168336 | 164.4 KiB | 6 | 4.1154e-01 | ✓ Yes |
| 4096 | SecondOrderOptimization (Dogleg) | 521.96 μs | 332144 | 324.4 KiB | 7 | 8.3061e-01 | ✓ Yes |
| 4096 | LeastSquaresOptim (Dogleg) | 523.60 μs | 682912 | 666.9 KiB | 5 | 8.3061e-01 | ✓ Yes |
| 4096 | NonlinearSolve (TrustRegion) | 2.74 ms | 2125136 | 2.0 MiB | 37 | 8.3061e-01 | ✓ Yes |
| 4096 | Optim (NewtonTrustRegion) | 648.21 μs | 345664 | 337.6 KiB | 5 | 8.3061e-01 | ✓ Yes |
| 4096 | MadNLP | 703.12 μs | 211072 | 206.1 KiB | 5 | 8.3061e-01 | ✓ Yes |
| 4096 | NonlinearSolve (LM) | 17.69 ms | 11029952 | 10.5 MiB | 100 | 8.3061e-01 | ✗ No |
| 4096 | Optim (Newton) | 638.04 μs | 334016 | 326.2 KiB | 5 | 8.3061e-01 | ✓ Yes |
| 4096 | LeastSquaresOptim (LM) | 681.40 μs | 817360 | 798.2 KiB | 7 | 8.3061e-01 | ✓ Yes |
| 4096 | Ipopt | 962.38 μs | 177648 | 173.5 KiB | 5 | 8.3061e-01 | ✓ Yes |
| 4096 | JSOSolvers (tron) | 685.96 μs | 173344 | 169.3 KiB | 5 | 8.3061e-01 | ✓ Yes |
| 4096 | JSOSolvers (trunk) | 543.52 μs | 169792 | 165.8 KiB | 5 | 8.3061e-01 | ✓ Yes |
| 4096 | SecondOrderOptimization (LM) | 371.42 μs | 331600 | 323.8 KiB | 6 | 8.3061e-01 | ✓ Yes |
| 8192 | SecondOrderOptimization (Dogleg) | 1.05 ms | 659824 | 644.4 KiB | 7 | 1.6555e+00 | ✓ Yes |
| 8192 | LeastSquaresOptim (Dogleg) | 1.14 ms | 1108896 | 1.1 MiB | 5 | 1.6555e+00 | ✓ Yes |
| 8192 | NonlinearSolve (TrustRegion) | 5.25 ms | 4288176 | 4.1 MiB | 38 | 1.6555e+00 | ✓ Yes |
| 8192 | Optim (NewtonTrustRegion) | 1.10 ms | 671376 | 655.6 KiB | 4 | 1.6555e+00 | ✓ Yes |
| 8192 | MadNLP | 1.12 ms | 374912 | 366.1 KiB | 5 | 1.6555e+00 | ✓ Yes |
| 8192 | NonlinearSolve (LM) | 25.80 ms | 18599360 | 17.7 MiB | 100 | 1.6555e+00 | ✗ No |
| 8192 | Optim (Newton) | 1.49 ms | 661808 | 646.3 KiB | 6 | 1.6555e+00 | ✓ Yes |
| 8192 | LeastSquaresOptim (LM) | 1.49 ms | 1243344 | 1.2 MiB | 7 | 1.6555e+00 | ✓ Yes |
| 8192 | Ipopt | 1.38 ms | 341488 | 333.5 KiB | 5 | 1.6555e+00 | ✓ Yes |
| 8192 | JSOSolvers (tron) | 1.50 ms | 337184 | 329.3 KiB | 5 | 1.6555e+00 | ✓ Yes |
| 8192 | JSOSolvers (trunk) | 1.11 ms | 333632 | 325.8 KiB | 5 | 1.6555e+00 | ✓ Yes |
| 8192 | SecondOrderOptimization (LM) | 747.50 μs | 659280 | 643.8 KiB | 6 | 1.6555e+00 | ✓ Yes |
| 16384 | SecondOrderOptimization (Dogleg) | 4.70 ms | 1315184 | 1.3 MiB | 7 | 3.3011e+00 | ✓ Yes |
| 16384 | LeastSquaresOptim (Dogleg) | 2.41 ms | 1960864 | 1.9 MiB | 5 | 3.3011e+00 | ✓ Yes |
| 16384 | NonlinearSolve (TrustRegion) | 11.09 ms | 8548016 | 8.2 MiB | 38 | 3.3011e+00 | ✓ Yes |
| 16384 | Optim (NewtonTrustRegion) | 2.21 ms | 1326736 | 1.3 MiB | 4 | 3.3011e+00 | ✓ Yes |
| 16384 | MadNLP | 1.99 ms | 702592 | 686.1 KiB | 5 | 3.3011e+00 | ✓ Yes |
| 16384 | NonlinearSolve (LM) | 52.86 ms | 33738176 | 32.2 MiB | 100 | 3.3011e+00 | ✗ No |
| 16384 | Optim (Newton) | 3.84 ms | 1317664 | 1.3 MiB | 7 | 3.3011e+00 | ✓ Yes |
| 16384 | LeastSquaresOptim (LM) | 3.00 ms | 2095312 | 2.0 MiB | 7 | 3.3011e+00 | ✓ Yes |
| 16384 | Ipopt | 2.28 ms | 669168 | 653.5 KiB | 5 | 3.3011e+00 | ✓ Yes |
| 16384 | JSOSolvers (tron) | 3.19 ms | 664864 | 649.3 KiB | 5 | 3.3011e+00 | ✓ Yes |
| 16384 | JSOSolvers (trunk) | 2.33 ms | 661312 | 645.8 KiB | 5 | 3.3011e+00 | ✓ Yes |
| 16384 | SecondOrderOptimization (LM) | 1.48 ms | 1314640 | 1.3 MiB | 6 | 3.3011e+00 | ✓ Yes |
| 32768 | SecondOrderOptimization (Dogleg) | 3.65 ms | 2625680 | 2.5 MiB | 6 | 6.5496e+00 | ✓ Yes |
| 32768 | LeastSquaresOptim (Dogleg) | 4.70 ms | 3664800 | 3.5 MiB | 5 | 6.5496e+00 | ✓ Yes |
| 32768 | NonlinearSolve (TrustRegion) | 21.48 ms | 16805200 | 16.0 MiB | 37 | 6.5496e+00 | ✓ Yes |
| 32768 | Optim (NewtonTrustRegion) | 4.44 ms | 2637456 | 2.5 MiB | 4 | 6.5496e+00 | ✓ Yes |
| 32768 | MadNLP | 3.85 ms | 1357952 | 1.3 MiB | 5 | 6.5496e+00 | ✓ Yes |
| 32768 | NonlinearSolve (LM) | 105.16 ms | 64015808 | 61.1 MiB | 100 | 6.5496e+00 | ✗ No |
| 32768 | Optim (Newton) | 5.84 ms | 2627888 | 2.5 MiB | 6 | 6.5496e+00 | ✓ Yes |
| 32768 | LeastSquaresOptim (LM) | 5.85 ms | 3799248 | 3.6 MiB | 7 | 6.5496e+00 | ✓ Yes |
| 32768 | Ipopt | 4.07 ms | 1324528 | 1.3 MiB | 5 | 6.5496e+00 | ✓ Yes |
| 32768 | JSOSolvers (tron) | 6.15 ms | 1320224 | 1.3 MiB | 5 | 6.5496e+00 | ✓ Yes |
| 32768 | JSOSolvers (trunk) | 4.65 ms | 1316672 | 1.3 MiB | 5 | 6.5496e+00 | ✓ Yes |
| 32768 | SecondOrderOptimization (LM) | 2.98 ms | 2625360 | 2.5 MiB | 6 | 6.5496e+00 | ✓ Yes |

---

## 3. Analysis & Key Takeaways

- **Asymptotic Complexity**: Log-log scaling indicates the empirical runtime growth rate as Data Points m expands.
- **Fastest Model**: The fastest linear system assembly was consistently achieved by `NLLSModel (Static)`.
- **Top Optimizer**: Solvers leveraging specialized structure (e.g. sparse block factorization in SecondOrderOptimization) demonstrate superior scaling exponents on large problem regimes.
