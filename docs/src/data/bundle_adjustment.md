# Benchmark Results: Sparse Bundle Adjustment

- **Category**: large_sparse
- **Scaling Metric**: Cameras Ncam
- **Optimizer Target Model**: BundleAdjustmentModels
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s
- **Benchmark Date**: 2026-11-07T09:15:24
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Git Commit**: b62fcb5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | NLLSModel | 446.97727272727275 | 0 | 0 | 10417.0 | 0 | 0 |
| 4 | BundleAdjustmentModels | 1856.090909090909 | 0 | 0 | 24916.0 | 21 | 110400 |
| 8 | NLLSModel | 1836.75 | 0 | 0 | 43292.0 | 0 | 0 |
| 8 | BundleAdjustmentModels | 7514.0 | 0 | 0 | 99834.0 | 21 | 405360 |
| 12 | NLLSModel | 4175.0 | 0 | 0 | 95959.0 | 0 | 0 |
| 12 | BundleAdjustmentModels | 17458.0 | 0 | 0 | 219084.0 | 23 | 891744 |
| 16 | NLLSModel | 7250.0 | 0 | 0 | 166791.0 | 0 | 0 |
| 16 | BundleAdjustmentModels | 30041.0 | 0 | 0 | 389209.0 | 23 | 1551824 |
| 24 | NLLSModel | 16250.0 | 0 | 0 | 381084.0 | 0 | 0 |
| 24 | BundleAdjustmentModels | 67625.0 | 0 | 0 | 859125.0 | 23 | 3494016 |
| 32 | NLLSModel | 27083.0 | 0 | 0 | 653625.0 | 0 | 0 |
| 32 | BundleAdjustmentModels | 118667.0 | 0 | 0 | 1.52775e6 | 23 | 8163648 |
| 48 | NLLSModel | 62500.0 | 0 | 0 | 1.4565e6 | 0 | 0 |
| 48 | BundleAdjustmentModels | 278916.0 | 0 | 0 | 3.559542e6 | 23 | 13774576 |
| 64 | NLLSModel | 111417.0 | 0 | 0 | 2.595833e6 | 0 | 0 |
| 64 | BundleAdjustmentModels | 491750.0 | 0 | 0 | 6.155334e6 | 23 | 24445040 |
| 96 | NLLSModel | 324208.0 | 0 | 0 | 4.3895e6 | 3 | 3504 |
| 96 | BundleAdjustmentModels | 1.201959e6 | 0 | 0 | 1.4410042e7 | 24 | 54910000 |
| 128 | NLLSModel | 436583.0 | 0 | 0 | 6.77e6 | 3 | 3504 |
| 128 | BundleAdjustmentModels | 1.974791e6 | 0 | 0 | 2.6438542e7 | 24 | 97566256 |
| 192 | NLLSModel | 1.046084e6 | 0 | 0 | 1.2598375e7 | 3 | 3504 |
| 192 | BundleAdjustmentModels | 4.511125e6 | 0 | 0 | 6.0181208e7 | 24 | 219452976 |
| 256 | NLLSModel | 1.771916e6 | 0 | 0 | 2.213275e7 | 3 | 3504 |
| 256 | BundleAdjustmentModels | 7.826834e6 | 0 | 0 | 1.06966209e8 | 24 | 390060592 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on standard target model: `BundleAdjustmentModels` (`NLLSModel + SecondOrderOptimization` entries run natively on `NLLSModel` with pre-allocated `OptimizationWorkspace`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
|:---|:---|---:|---:|---:|---:|---:|:---|
| 4 | NLLSModel + SecondOrderOptimization (Sparse LM) | 125333.5 | 0 | 0 | 5 | 1.1366e-24 | true |
| 4 | NLLSModel + SecondOrderOptimization (Sparse Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 4 | SecondOrderOptimization (Sparse LM) | 388083.0 | 320 | 1268432 | 5 | 1.1518e-24 | true |
| 4 | SecondOrderOptimization (Sparse Dogleg) | NaN | 0 | 0 | 0 | NaN | false |
| 4 | CaNNOLeS | 176541.5 | 191 | 157808 | 3 | 3.9424e-23 | true |
| 4 | JSOSolvers (trunk) | 372125.0 | 51 | 11696 | 9 | 1.0036e-19 | true |
| 4 | JSOSolvers (tron) | 559250.0 | 125 | 24160 | 8 | 6.3202e-20 | true |
| 4 | Ipopt | 1.315437e6 | 364 | 634816 | 4 | 3.4584e-23 | true |
| 4 | MadNLP | 1.051542e6 | 679 | 648064 | 3 | 2.9930e-16 | true |
| 8 | NLLSModel + SecondOrderOptimization (Sparse LM) | 856042.0 | 0 | 0 | 8 | 5.9278e-17 | true |
| 8 | NLLSModel + SecondOrderOptimization (Sparse Dogleg) | 1.1378955e6 | 0 | 0 | 11 | 9.9892e-23 | true |
| 8 | SecondOrderOptimization (Sparse LM) | 1.886375e6 | 300 | 4573936 | 8 | 5.9278e-17 | true |
| 8 | SecondOrderOptimization (Sparse Dogleg) | 2.143979e6 | 362 | 5726000 | 11 | 2.8204e-23 | true |
| 8 | CaNNOLeS | 1.74225e6 | 208 | 611408 | 8 | 1.1305e-14 | true |
| 8 | JSOSolvers (trunk) | 6.59070959e8 | 51 | 21488 | 501 | 2.4179e-11 | false |
| 8 | JSOSolvers (tron) | 2.804098125e9 | 125 | 42928 | 109 | 8.6274e-14 | false |
| 8 | Ipopt | 5.5298545e6 | 833 | 6597152 | 11 | 1.4291e-16 | true |
| 8 | MadNLP | 2.5493125e6 | 827 | 4721776 | 7 | 1.7854e-11 | true |
| 12 | NLLSModel + SecondOrderOptimization (Sparse LM) | 1.8874795e6 | 0 | 0 | 7 | 1.1061e-15 | true |
| 12 | NLLSModel + SecondOrderOptimization (Sparse Dogleg) | 2.037e6 | 0 | 0 | 8 | 9.7860e-26 | true |
| 12 | SecondOrderOptimization (Sparse LM) | 3.2374165e6 | 316 | 9050672 | 7 | 1.1061e-15 | true |
| 12 | SecondOrderOptimization (Sparse Dogleg) | 3.555771e6 | 339 | 9830208 | 8 | 1.0006e-25 | true |
| 12 | CaNNOLeS | 3.488834e6 | 222 | 1259808 | 6 | 8.4917e-16 | true |
| 12 | JSOSolvers (trunk) | 1.998017292e9 | 63 | 33008 | 501 | 5.6156e-12 | false |
| 12 | JSOSolvers (tron) | 1.0642436959e10 | 148 | 65024 | 105 | 1.6576e-14 | true |
| 12 | Ipopt | 8.1989375e6 | 740 | 11347760 | 9 | 5.4678e-14 | true |
| 12 | MadNLP | 3.740667e6 | 792 | 7375296 | 5 | 6.7695e-09 | true |
| 16 | NLLSModel + SecondOrderOptimization (Sparse LM) | 3.8297495e6 | 0 | 0 | 7 | 2.5031e-15 | true |
| 16 | NLLSModel + SecondOrderOptimization (Sparse Dogleg) | 4.4536665e6 | 0 | 0 | 9 | 1.9672e-25 | true |
| 16 | SecondOrderOptimization (Sparse LM) | 6.1561665e6 | 317 | 15662128 | 7 | 2.5031e-15 | true |
| 16 | SecondOrderOptimization (Sparse Dogleg) | 6.698708e6 | 340 | 17020336 | 8 | 1.9816e-25 | true |
| 16 | CaNNOLeS | 6.229375e6 | 226 | 2370400 | 5 | 1.8425e-14 | true |
| 16 | JSOSolvers (trunk) | 4.731186166e9 | 63 | 39152 | 501 | 3.0615e-12 | false |
| 16 | JSOSolvers (tron) | 2.8276065334e10 | 148 | 76816 | 138 | 1.1960e-14 | false |
| 16 | Ipopt | 1.316e7 | 740 | 19373856 | 9 | 2.8960e-14 | true |
| 16 | MadNLP | 6.89125e6 | 833 | 14585168 | 6 | 2.3365e-10 | true |
| 24 | NLLSModel + SecondOrderOptimization (Sparse LM) | 1.03038955e7 | 0 | 0 | 7 | 8.8448e-15 | true |
| 24 | NLLSModel + SecondOrderOptimization (Sparse Dogleg) | 1.0335375e7 | 0 | 0 | 8 | 1.1723e-24 | true |
| 24 | SecondOrderOptimization (Sparse LM) | 1.5261437e7 | 318 | 35023472 | 7 | 8.8448e-15 | true |
| 24 | SecondOrderOptimization (Sparse Dogleg) | 1.5776625e7 | 318 | 34618912 | 8 | 1.1304e-24 | true |
| 24 | CaNNOLeS | 1.4049771e7 | 228 | 4834176 | 5 | 1.9298e-17 | true |
| 24 | JSOSolvers (trunk) | 1.5506231083e10 | 67 | 63792 | 501 | 2.4232e-11 | false |
| 24 | JSOSolvers (tron) | 3.0000744208e10 | 148 | 123936 | 37 | 1.7788e-13 | false |
| 24 | Ipopt | 3.4565e7 | 882 | 52291856 | 11 | 6.0972e-16 | true |
| 24 | MadNLP | 1.525475e7 | 845 | 32202736 | 6 | 1.3226e-10 | true |
| 32 | NLLSModel + SecondOrderOptimization (Sparse LM) | 2.7697354e7 | 0 | 0 | 9 | 1.2027e-17 | true |
| 32 | NLLSModel + SecondOrderOptimization (Sparse Dogleg) | 1.95735e7 | 0 | 0 | 7 | 2.9399e-24 | true |
| 32 | SecondOrderOptimization (Sparse LM) | 3.9051417e7 | 364 | 78651312 | 9 | 1.2027e-17 | true |
| 32 | SecondOrderOptimization (Sparse Dogleg) | 3.1869042e7 | 318 | 63116512 | 8 | 3.0005e-24 | true |
| 32 | CaNNOLeS | 3.522325e7 | 228 | 8092544 | 4 | 1.6044e-17 | true |
| 32 | JSOSolvers (trunk) | 3.0001062333e10 | 67 | 76080 | 418 | 9.0914e-11 | false |
| 32 | JSOSolvers (tron) | 3.0001890667e10 | 148 | 147520 | 22 | 8.9551e-13 | false |
| 32 | Ipopt | 5.044e7 | 740 | 74536464 | 9 | 1.3067e-14 | true |
| 32 | MadNLP | 3.1434459e7 | 886 | 63895632 | 7 | 2.1740e-11 | true |
| 48 | NLLSModel + SecondOrderOptimization (Sparse LM) | 1.04004084e8 | 0 | 0 | 12 | 1.8196e-23 | true |
| 48 | NLLSModel + SecondOrderOptimization (Sparse Dogleg) | 1.04586458e8 | 0 | 0 | 13 | 1.5955e-23 | true |
| 48 | SecondOrderOptimization (Sparse LM) | 1.33408625e8 | 433 | 206241552 | 12 | 1.7783e-23 | true |
| 48 | SecondOrderOptimization (Sparse Dogleg) | 1.35487375e8 | 433 | 207529664 | 13 | 1.6423e-23 | true |
| 48 | CaNNOLeS | 9.349475e7 | 228 | 18045824 | 4 | 1.8343e-18 | true |
| 48 | JSOSolvers (trunk) | 3.0002259875e10 | 67 | 125232 | 129 | 6.0082e-09 | false |
| 48 | JSOSolvers (tron) | 3.00042145e10 | 148 | 241776 | 18 | 4.0424e-09 | false |
| 48 | Ipopt | 2.563005205e8 | 1542 | 351228544 | 19 | 1.4722e-23 | true |
| 48 | MadNLP | 9.47573955e7 | 804 | 105275120 | 5 | 2.7168e-08 | true |
| 64 | NLLSModel + SecondOrderOptimization (Sparse LM) | 2.36143875e8 | 0 | 0 | 13 | 5.3414e-23 | true |
| 64 | NLLSModel + SecondOrderOptimization (Sparse Dogleg) | 2.37632833e8 | 0 | 0 | 14 | 5.5091e-23 | true |
| 64 | SecondOrderOptimization (Sparse LM) | 3.10020375e8 | 456 | 400047232 | 13 | 5.6257e-23 | true |
| 64 | SecondOrderOptimization (Sparse Dogleg) | 2.733492295e8 | 433 | 372861888 | 13 | 5.4399e-23 | true |
| 64 | CaNNOLeS | 1.851998125e8 | 228 | 40147840 | 4 | 1.0359e-19 | true |
| 64 | JSOSolvers (trunk) | 3.0003861042e10 | 67 | 149808 | 58 | 5.1933e-08 | false |
| 64 | JSOSolvers (tron) | 3.0007074208e10 | 148 | 288928 | 20 | 2.0058e-08 | false |
| 64 | Ipopt | 7.602015205e8 | 1510 | 621993984 | 19 | 4.8607e-23 | true |
| 64 | MadNLP | 1.88050292e8 | 804 | 186132512 | 5 | 1.6882e-08 | true |
| 96 | NLLSModel + SecondOrderOptimization (Sparse LM) | 7.77139021e8 | 0 | 0 | 14 | 2.1494e-21 | true |
| 96 | NLLSModel + SecondOrderOptimization (Sparse Dogleg) | 9.50965e8 | 0 | 0 | 18 | 2.5884e-22 | true |
| 96 | SecondOrderOptimization (Sparse LM) | 9.122497085e8 | 495 | 1111822576 | 14 | 2.1579e-21 | true |
| 96 | SecondOrderOptimization (Sparse Dogleg) | 1.080059667e9 | 522 | 1073761552 | 16 | 2.4907e-22 | true |
| 96 | CaNNOLeS | 5.368552085e8 | 228 | 81288064 | 4 | 1.6285e-21 | true |
| 96 | JSOSolvers (trunk) | 3.0008563791e10 | 67 | 248112 | 22 | 2.4180e-01 | false |
| 96 | JSOSolvers (tron) | 3.0015115292e10 | 148 | 477456 | 11 | 1.3441e-01 | false |
| 96 | Ipopt | 2.760179292e9 | 2149 | 1959168656 | 26 | 2.4973e-22 | true |
| 96 | MadNLP | 7.163939375e8 | 893 | 581221936 | 7 | 3.6600e-08 | true |
| 128 | NLLSModel + SecondOrderOptimization (Sparse LM) | 1.953558042e9 | 0 | 0 | 15 | 4.5371e-21 | true |
| 128 | NLLSModel + SecondOrderOptimization (Sparse Dogleg) | 2.132226625e9 | 0 | 0 | 17 | 8.1300e-22 | true |
| 128 | SecondOrderOptimization (Sparse LM) | 2.127398959e9 | 519 | 1762492192 | 15 | 4.5683e-21 | true |
| 128 | SecondOrderOptimization (Sparse Dogleg) | 2.8215285e9 | 615 | 2142033808 | 20 | 8.1027e-22 | true |
| 128 | CaNNOLeS | 1.168440709e9 | 228 | 167517056 | 4 | 2.8962e-21 | true |
| 128 | JSOSolvers (trunk) | 3.0016513959e10 | 67 | 297264 | 11 | 1.8865e+02 | false |
| 128 | JSOSolvers (tron) | 3.0027526458e10 | 148 | 571776 | 8 | 1.1195e+02 | false |
| 128 | Ipopt | 4.655424083e9 | 2257 | 3431048752 | 26 | 7.4245e-22 | true |
| 128 | MadNLP | 1.665250166e9 | 935 | 1177776080 | 8 | 1.3112e-07 | true |
| 192 | NLLSModel + SecondOrderOptimization (Sparse LM) | 7.162340083e9 | 0 | 0 | 17 | 4.4166e-21 | true |
| 192 | NLLSModel + SecondOrderOptimization (Sparse Dogleg) | 7.182710333e9 | 0 | 0 | 18 | 4.2809e-21 | true |
| 192 | SecondOrderOptimization (Sparse LM) | 7.861620583e9 | 567 | 4474319744 | 17 | 4.4111e-21 | true |
| 192 | SecondOrderOptimization (Sparse Dogleg) | 8.257343625e9 | 591 | 4628089184 | 19 | 4.4305e-21 | true |
| 192 | CaNNOLeS | 3.78278775e9 | 228 | 333208448 | 4 | 4.2749e-21 | true |
| 192 | JSOSolvers (trunk) | 3.0035542125e10 | 67 | 592176 | 7 | 8.9546e+04 | false |
| 192 | JSOSolvers (tron) | 3.0057205416e10 | 148 | 1137200 | 4 | 8.6969e+04 | false |
| 192 | Ipopt | 1.4282148541e10 | 2617 | 8830702016 | 27 | 4.0159e-21 | true |
| 192 | MadNLP | 1.29966279375e11 | 725 | 1263851408 | 3 | 4.2861e+00 | false |
| 256 | NLLSModel + SecondOrderOptimization (Sparse LM) | 2.0828833041e10 | 0 | 0 | 18 | 1.3183e-20 | true |
| 256 | NLLSModel + SecondOrderOptimization (Sparse Dogleg) | 1.9976356542e10 | 0 | 0 | 19 | 1.2916e-20 | true |
| 256 | SecondOrderOptimization (Sparse LM) | 2.0202886125e10 | 591 | 8227101104 | 18 | 1.3548e-20 | true |
| 256 | SecondOrderOptimization (Sparse Dogleg) | 2.24552805e10 | 639 | 8952040896 | 21 | 1.2467e-20 | true |
| 256 | CaNNOLeS | 9.872212917e9 | 228 | 503454592 | 4 | 1.2505e-20 | true |
| 256 | JSOSolvers (trunk) | 3.0065483e10 | 67 | 592176 | 3 | 2.0640e+06 | false |
| 256 | JSOSolvers (tron) | 3.0106667375e10 | 148 | 1137392 | 3 | 2.2264e+06 | false |
| 256 | Ipopt | 3.0103433375e10 | 2397 | 13479902416 | 26 | 1.1618e-20 | false |
| 256 | MadNLP | 1.5751860959e10 | 1229 | 8589219472 | 15 | 1.3193e-08 | true |
