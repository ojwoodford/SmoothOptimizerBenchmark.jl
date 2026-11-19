# Benchmark Results: 1D ODE Boundary Value Problem

- **Category**: large_sparse
- **Scaling Metric**: Grid Points N
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-19T02:26:33
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: 2c10368
- **Dependency Commits**: OptimizationVariableInterface f130043, SecondOrderOptimization 377b96e, NLLSModel 78a4ef5

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 32 | NLLSModel (Sparse) | 218.75 | 1 | 16 | 1535.7142857142858 | 1 | 32 |
| 32 | Standalone (Sparse) | 264.8809523809524 | 1 | 16 | 3065.5714285714284 | 20 | 7856 |
| 32 | NLPModels (MathOptNLSModel) | 5729.25 | 2 | 32 | 13458.0 | 5 | 128 |
| 64 | NLLSModel (Sparse) | 352.3333333333333 | 1 | 16 | 3089.285714285714 | 1 | 64 |
| 64 | Standalone (Sparse) | 407.24528301886795 | 1 | 16 | 4625.0 | 20 | 17200 |
| 64 | NLPModels (MathOptNLSModel) | 11208.0 | 2 | 32 | 25833.0 | 5 | 128 |
| 128 | NLLSModel (Sparse) | 639.3125 | 1 | 16 | 5968.75 | 1 | 64 |
| 128 | Standalone (Sparse) | 709.7333333333333 | 1 | 16 | 9209.0 | 22 | 33584 |
| 128 | NLPModels (MathOptNLSModel) | 21916.0 | 2 | 32 | 51375.0 | 5 | 128 |
| 256 | NLLSModel (Sparse) | 1208.3529411764705 | 1 | 16 | 11916.0 | 1 | 64 |
| 256 | Standalone (Sparse) | 1354.1875 | 1 | 16 | 17333.0 | 24 | 67440 |
| 256 | NLPModels (MathOptNLSModel) | 42500.0 | 2 | 32 | 102167.0 | 5 | 128 |
| 512 | NLLSModel (Sparse) | 2333.3333333333335 | 1 | 16 | 23625.0 | 1 | 64 |
| 512 | Standalone (Sparse) | 2552.125 | 1 | 16 | 33167.0 | 24 | 134256 |
| 512 | NLPModels (MathOptNLSModel) | 84333.0 | 2 | 32 | 205791.0 | 5 | 128 |
| 1024 | NLLSModel (Sparse) | 4758.2 | 1 | 16 | 47292.0 | 1 | 64 |
| 1024 | Standalone (Sparse) | 5146.0 | 1 | 16 | 64792.0 | 24 | 267920 |
| 1024 | NLPModels (MathOptNLSModel) | 168125.0 | 2 | 32 | 407750.0 | 5 | 128 |
| 2048 | NLLSModel (Sparse) | 9208.333333333334 | 1 | 16 | 94458.0 | 1 | 64 |
| 2048 | Standalone (Sparse) | 11042.0 | 1 | 16 | 130958.0 | 25 | 502384 |
| 2048 | NLPModels (MathOptNLSModel) | 397917.0 | 2 | 32 | 1.380125e6 | 5 | 128 |
| 4096 | NLLSModel (Sparse) | 18416.0 | 1 | 16 | 191292.0 | 1 | 64 |
| 4096 | Standalone (Sparse) | 22208.0 | 1 | 16 | 274584.0 | 25 | 1020528 |
| 4096 | NLPModels (MathOptNLSModel) | 1.60875e6 | 2 | 32 | 3.149083e6 | 5 | 128 |
| 8192 | NLLSModel (Sparse) | 37833.0 | 1 | 16 | 425291.0 | 1 | 64 |
| 8192 | Standalone (Sparse) | 44125.0 | 1 | 16 | 509833.0 | 25 | 2007664 |
| 8192 | NLPModels (MathOptNLSModel) | 4.064834e6 | 2 | 32 | 1.2502959e7 | 5 | 128 |
| 16384 | NLLSModel (Sparse) | 74292.0 | 1 | 16 | 806542.0 | 1 | 64 |
| 16384 | Standalone (Sparse) | 81791.0 | 1 | 16 | 1.028125e6 | 25 | 3981936 |
| 16384 | NLPModels (MathOptNLSModel) | 1.074875e7 | 2 | 32 | 2.9122084e7 | 5 | 128 |
| 32768 | NLLSModel (Sparse) | 147291.0 | 1 | 16 | 1.520417e6 | 1 | 64 |
| 32768 | Standalone (Sparse) | 168291.0 | 1 | 16 | 2.062e6 | 25 | 7897712 |
| 32768 | NLPModels (MathOptNLSModel) | 2.2742083e7 | 2 | 32 | 6.1683334e7 | 5 | 128 |

---

## Optimizer Evaluation Scaling

Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|
| 32 | SecondOrderOptimization (Dogleg) | 28750.0 | 149 | 72000 | 3 | 5.6402e-27 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM) | 35896.0 | 145 | 71344 | 4 | 7.9500e-20 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (Gauss-Newton) | 27604.0 | 136 | 54400 | 3 | 5.6402e-27 | true | ok | NaN | grad\_tol |
| 32 | SecondOrderOptimization (LM, tall) | 75104.5 | 106 | 72304 | 4 | 7.9506e-20 | true | ok | NaN | grad\_tol |
| 32 | LeastSquaresOptim (Dogleg) | 279625.5 | 171 | 28576 | 17 | 2.5247e-12 | true | ok | NaN | converged |
| 32 | LeastSquaresOptim (LM) | 362521.0 | 185 | 31040 | 19 | 9.9980e-15 | true | ok | NaN | converged |
| 32 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32 | Optim (Newton) | 94396.0 | 351 | 103856 | 3 | 2.8725e-27 | true | ok | NaN | converged |
| 32 | JSOSolvers (trunk) | 480875.0 | 617 | 39760 | 6 | 7.8113e-20 | false | not_converged | NaN | not\_desc; cost test passes |
| 32 | JSOSolvers (tron) | 728792.0 | 715 | 40832 | 4 | 2.2735e-21 | false | not_converged | NaN | small\_residual; cost test passes |
| 32 | Ipopt | 672895.5 | 398 | 33296 | 3 | 3.0462e-27 | true | ok | NaN | first\_order |
| 32 | MadNLP | 308771.0 | 578 | 67344 | 3 | 5.7856e-23 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 32 | NonlinearSolve (LM) | 458792.0 | 784 | 103392 | 17 | 9.4775e-20 | true | ok | NaN | Success |
| 32 | NonlinearSolve (TrustRegion) | 108895.5 | 849 | 122960 | 5 | 1.5138e-18 | true | ok | NaN | Success |
| 32 | CaNNOLeS | 52146.0 | 180 | 48880 | 3 | 3.3924e-27 | true | ok | NaN | first\_order |
| 64 | SecondOrderOptimization (Dogleg) | 47666.5 | 226 | 101744 | 3 | 9.0812e-26 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (LM) | 62583.5 | 222 | 100576 | 5 | 1.0959e-18 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (Gauss-Newton) | 44958.5 | 214 | 96672 | 3 | 9.0812e-26 | true | ok | NaN | grad\_tol |
| 64 | SecondOrderOptimization (LM, tall) | 340812.5 | 106 | 241456 | 5 | 1.0960e-18 | true | ok | NaN | grad\_tol |
| 64 | LeastSquaresOptim (Dogleg) | 3.0172208e7 | 5035 | 2512240 | 500 | 4.6078e-03 | false | not_converged | NaN | not converged |
| 64 | LeastSquaresOptim (LM) | 2.061958e6 | 257 | 112000 | 23 | 5.2056e-14 | true | ok | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 64 | Optim (Newton) | 128708.0 | 355 | 204208 | 3 | 1.0023e-25 | true | ok | NaN | converged |
| 64 | JSOSolvers (trunk) | 2.605709e6 | 1467 | 84912 | 7 | 5.2143e-22 | false | not_converged | NaN | not\_desc; cost test passes |
| 64 | JSOSolvers (tron) | 7.177583e6 | 3559 | 188656 | 13 | 6.3499e-17 | false | not_converged | NaN | small\_step; cost test passes |
| 64 | Ipopt | 684124.5 | 346 | 54288 | 2 | 4.5413e-12 | true | ok | NaN | first\_order |
| 64 | MadNLP | 491395.5 | 580 | 87536 | 3 | 1.1280e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 1.534979e6 | 791 | 225152 | 20 | 3.9916e-21 | true | ok | NaN | Success |
| 64 | NonlinearSolve (TrustRegion) | 126459.0 | 861 | 233888 | 5 | 2.9639e-18 | true | ok | NaN | Success |
| 64 | CaNNOLeS | 93875.0 | 194 | 97008 | 3 | 9.6264e-26 | true | ok | NaN | first\_order |
| 128 | SecondOrderOptimization (Dogleg) | 101187.5 | 240 | 195216 | 4 | 2.3553e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM) | 150791.5 | 234 | 191840 | 7 | 3.5241e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (Gauss-Newton) | 94291.5 | 228 | 185408 | 4 | 2.3553e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | SecondOrderOptimization (LM, tall) | 2.5698125e6 | 110 | 780624 | 7 | 2.8865e-24 | true | ok | NaN | abs\_dcost, step\_size |
| 128 | LeastSquaresOptim (Dogleg) | 1.04208542e8 | 5035 | 2527312 | 500 | 1.4555e+01 | false | not_converged | NaN | not converged |
| 128 | LeastSquaresOptim (LM) | 1.9708575e8 | 4639 | 7390288 | 385 | 2.4579e-09 | true | ok | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 128 | Optim (Newton) | 266792.0 | 472 | 506576 | 4 | 2.9738e-24 | true | ok | NaN | converged |
| 128 | JSOSolvers (trunk) | 2.0221375e7 | 4457 | 237680 | 8 | 4.9369e-18 | false | not_converged | NaN | not\_desc; cost test passes |
| 128 | JSOSolvers (tron) | 1.290773416e9 | 259829 | 12503280 | 12 | 1.1094e-16 | false | not_converged | NaN | small\_step; cost test passes |
| 128 | Ipopt | 965750.0 | 360 | 78416 | 2 | 9.0053e-12 | true | ok | NaN | first\_order |
| 128 | MadNLP | 776020.5 | 591 | 127184 | 3 | 2.2634e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 6.0723745e6 | 811 | 503744 | 22 | 2.2479e-19 | true | ok | NaN | Success |
| 128 | NonlinearSolve (TrustRegion) | 201125.0 | 894 | 326240 | 4 | 3.0086e-17 | true | ok | NaN | Success |
| 128 | CaNNOLeS | 181354.5 | 217 | 174944 | 3 | 2.6889e-24 | true | ok | NaN | first\_order |
| 256 | SecondOrderOptimization (Dogleg) | 204104.0 | 287 | 386592 | 4 | 1.0706e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (LM) | 332145.5 | 278 | 380240 | 8 | 1.2124e-22 | true | ok | NaN | step\_size |
| 256 | SecondOrderOptimization (Gauss-Newton) | 194167.0 | 271 | 367696 | 4 | 1.0706e-22 | true | ok | NaN | abs\_dcost, step\_size |
| 256 | SecondOrderOptimization (LM, tall) | 2.2309833e7 | 134 | 2818672 | 8 | 9.2329e-23 | true | ok | NaN | step\_size |
| 256 | LeastSquaresOptim (Dogleg) | 3.91076375e8 | 6048 | 9732208 | 500 | 8.3983e+01 | false | not_converged | NaN | not converged |
| 256 | LeastSquaresOptim (LM) | 9.3644875e8 | 6033 | 9654640 | 500 | 2.3129e+01 | false | not_converged | NaN | not converged |
| 256 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 256 | Optim (Newton) | 403083.5 | 500 | 1005008 | 4 | 8.2267e-23 | true | ok | NaN | converged |
| 256 | JSOSolvers (trunk) | 3.979866833e9 | 422824 | 20335344 | 208 | 2.5351e-17 | false | not_converged | NaN | not\_desc; cost test passes |
| 256 | JSOSolvers (tron) | 3.0000216792e10 | 3145620 | 151040096 | 63 | 1.5061e-12 | false | timeout | NaN | max\_time; cost test passes |
| 256 | Ipopt | 1.3937715e6 | 382 | 155504 | 2 | 1.7937e-11 | true | ok | NaN | first\_order |
| 256 | MadNLP | 1.195708e6 | 621 | 204128 | 3 | 5.0789e-22 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 2.6055708e7 | 862 | 1530304 | 25 | 1.0326e-18 | true | ok | NaN | Success |
| 256 | NonlinearSolve (TrustRegion) | 347208.5 | 960 | 571248 | 5 | 7.3379e-18 | true | ok | NaN | Success |
| 256 | CaNNOLeS | 365708.5 | 240 | 352864 | 3 | 9.7289e-23 | true | ok | NaN | first\_order |
| 512 | SecondOrderOptimization (Dogleg) | 349917.0 | 287 | 759328 | 4 | 2.5649e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 512 | SecondOrderOptimization (LM) | 651624.5 | 281 | 750992 | 9 | 4.0273e-21 | true | ok | NaN | step\_size |
| 512 | SecondOrderOptimization (Gauss-Newton) | 314354.0 | 271 | 722000 | 4 | 2.5649e-21 | true | ok | NaN | abs\_dcost, step\_size |
| 512 | SecondOrderOptimization (LM, tall) | 2.674563e6 | 514 | 2293936 | 9 | 3.8058e-21 | true | ok | NaN | step\_size |
| 512 | LeastSquaresOptim (Dogleg) | 1.115842666e9 | 6048 | 9774832 | 500 | 2.0404e+02 | false | not_converged | NaN | not converged |
| 512 | LeastSquaresOptim (LM) | 1.198821833e9 | 6125 | 12003248 | 500 | 2.0330e+02 | false | not_converged | NaN | not converged |
| 512 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 512 | Optim (Newton) | 3.507e6 | 515 | 1861968 | 4 | 2.8821e-21 | false | not_converged | NaN | not converged; cost test passes |
| 512 | JSOSolvers (trunk) | 3.0000272166e10 | 1557429 | 74825024 | 382 | 2.4177e+01 | false | timeout | NaN | max\_time |
| 512 | JSOSolvers (tron) | 3.0000350833e10 | 1559329 | 74949072 | 16 | 1.1028e+01 | false | timeout | NaN | max\_time |
| 512 | Ipopt | 2.3628755e6 | 384 | 316944 | 2 | 3.5802e-11 | true | ok | NaN | first\_order |
| 512 | MadNLP | 1.9783335e6 | 633 | 362384 | 3 | 3.4618e-21 | true | ok | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 9.4838417e7 | 5123 | 25256528 | 27 | 3.4852e-17 | true | ok | NaN | Success |
| 512 | NonlinearSolve (TrustRegion) | 587271.0 | 971 | 1112032 | 6 | 4.5624e-20 | true | ok | NaN | Success |
| 512 | CaNNOLeS | 697083.5 | 248 | 725728 | 3 | 3.4085e-21 | true | ok | NaN | first\_order |
| 1024 | SecondOrderOptimization (Dogleg) | 678896.0 | 291 | 1582592 | 4 | 9.5650e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (LM) | 1.575208e6 | 285 | 1566064 | 11 | 8.5848e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (Gauss-Newton) | 627667.0 | 275 | 1500208 | 4 | 9.5650e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | SecondOrderOptimization (LM, tall) | 6.218229e6 | 586 | 5037776 | 11 | 8.9791e-20 | true | ok | NaN | abs\_dcost, step\_size |
| 1024 | LeastSquaresOptim (Dogleg) | 1.78647225e9 | 6108 | 11335600 | 500 | 4.6395e+02 | false | not_converged | NaN | not converged |
| 1024 | LeastSquaresOptim (LM) | 2.20172575e9 | 6077 | 10903984 | 500 | 4.6397e+02 | false | not_converged | NaN | not converged |
| 1024 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 1024 | Optim (Newton) | 1.3209375e6 | 516 | 4206192 | 4 | 8.5372e-20 | true | ok | NaN | converged |
| 1024 | JSOSolvers (trunk) | 3.000045825e10 | 792221 | 38164672 | 99 | 3.9558e+02 | false | timeout | NaN | max\_time |
| 1024 | JSOSolvers (tron) | 3.0000876125e10 | 791022 | 38173792 | 5 | 4.1345e+02 | false | timeout | NaN | max\_time |
| 1024 | Ipopt | 5.5188955e6 | 388 | 520816 | 2 | 7.1534e-11 | true | ok | NaN | first\_order |
| 1024 | MadNLP | 1.8018916e7 | 957 | 682192 | 8 | 9.1699e-20 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 1024 | NonlinearSolve (LM) | 2.175175792e9 | 28257 | 289475440 | 163 | 6.8739e-16 | true | ok | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 2.5197505e6 | 3427 | 3524208 | 5 | 4.9101e-18 | true | ok | NaN | Success |
| 1024 | CaNNOLeS | 1.7464585e6 | 310 | 1406656 | 3 | 8.9525e-20 | true | ok | NaN | first\_order |
| 2048 | SecondOrderOptimization (Dogleg) | 1.4007085e6 | 295 | 2975232 | 4 | 2.7584e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (LM) | 2.647417e6 | 289 | 2942320 | 12 | 2.8708e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (Gauss-Newton) | 1.2170415e6 | 279 | 2827312 | 4 | 2.7584e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | SecondOrderOptimization (LM, tall) | 1.3442833e7 | 622 | 10549056 | 12 | 3.0229e-18 | true | ok | NaN | abs\_dcost, step\_size |
| 2048 | LeastSquaresOptim (Dogleg) | 3.092049542e9 | 6096 | 11473136 | 500 | 9.8231e+02 | false | not_converged | NaN | not converged |
| 2048 | LeastSquaresOptim (LM) | 3.684599792e9 | 6053 | 10476080 | 500 | 9.8235e+02 | false | not_converged | NaN | not converged |
| 2048 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 2048 | Optim (Newton) | 2.453479e6 | 521 | 7774672 | 4 | 2.8565e-18 | true | ok | NaN | converged |
| 2048 | JSOSolvers (trunk) | 3.0001396833e10 | 392259 | 19105760 | 26 | 9.0869e+02 | false | timeout | NaN | max\_time |
| 2048 | JSOSolvers (tron) | 3.0003018e10 | 390972 | 19177136 | 1 | 9.3061e+02 | false | timeout | NaN | max\_time |
| 2048 | Ipopt | 1.0924979e7 | 392 | 1047472 | 2 | 1.4300e-10 | true | ok | NaN | first\_order |
| 2048 | MadNLP | 3.2951e7 | 945 | 1310864 | 8 | 2.9149e-18 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 2048 | NonlinearSolve (LM) | 8.772327083e9 | 29424 | 614037216 | 171 | 2.3172e-14 | true | ok | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 5.1710415e6 | 5780 | 6688832 | 6 | 2.5688e-17 | true | ok | NaN | Success |
| 2048 | CaNNOLeS | 4.2070835e6 | 250 | 2700032 | 3 | 2.9864e-18 | true | ok | NaN | first\_order |
| 4096 | SecondOrderOptimization (Dogleg) | 2.5680835e6 | 295 | 6080256 | 4 | 9.7013e-17 | true | ok | NaN | abs\_dcost, step\_size |
| 4096 | SecondOrderOptimization (LM) | 5.660292e6 | 289 | 6014576 | 13 | 9.6078e-17 | true | ok | NaN | abs\_dcost, step\_size |
| 4096 | SecondOrderOptimization (Gauss-Newton) | 2.463146e6 | 279 | 5784880 | 4 | 9.7013e-17 | true | ok | NaN | abs\_dcost, step\_size |
| 4096 | SecondOrderOptimization (LM, tall) | 2.9762041e7 | 658 | 21910832 | 13 | 9.5985e-17 | true | ok | NaN | step\_size |
| 4096 | LeastSquaresOptim (Dogleg) | 1.5025825e8 | 80 | 729616 | 2 | 2.0477e+03 | false | above_reference | NaN | converged; claimed convergence at cost 2.047669e+03, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 4096 | LeastSquaresOptim (LM) | 5.414726416e9 | 5685 | 7913264 | 500 | 2.0119e+03 | false | not_converged | NaN | not converged |
| 4096 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 4096 | Optim (Newton) | 5.0308545e6 | 521 | 15960528 | 4 | 9.6961e-17 | true | ok | NaN | converged |
| 4096 | JSOSolvers (trunk) | 3.0002733042e10 | 133759 | 6976288 | 7 | 1.9505e+03 | false | timeout | NaN | max\_time |
| 4096 | JSOSolvers (tron) | 3.0008296084e10 | 135015 | 7302848 | 1 | 1.9659e+03 | false | timeout | NaN | max\_time |
| 4096 | Ipopt | 2.4035292e7 | 396 | 2109104 | 2 | 2.8593e-10 | true | ok | NaN | first\_order |
| 4096 | MadNLP | 1.25e8 | 1037 | 2570096 | 9 | 9.4483e-17 | false | not_converged | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 4096 | NonlinearSolve (LM) | 3.0068763792e10 | 873 | 291021312 | 122 | 8.6005e-13 | false | timeout | NaN | MaxTime; cost test passes |
| 4096 | NonlinearSolve (TrustRegion) | 6.4441917e7 | 10592 | 15646816 | 38 | 9.2716e-17 | true | ok | NaN | StalledSuccess |
| 4096 | CaNNOLeS | 1.12596875e7 | 252 | 5288736 | 3 | 9.9773e-17 | true | ok | NaN | first\_order |
| 8192 | SecondOrderOptimization (Dogleg) | 6.458104e6 | 295 | 11897120 | 6 | 3.2591e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (LM) | 1.375025e7 | 289 | 11765904 | 16 | 3.0995e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (Gauss-Newton) | 6.109834e6 | 279 | 11306832 | 6 | 3.2591e-15 | true | ok | NaN | step\_size |
| 8192 | SecondOrderOptimization (LM, tall) | 6.46474375e7 | 694 | 44832608 | 14 | 3.0357e-15 | true | ok | NaN | step\_size |
| 8192 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 8192 | LeastSquaresOptim (LM) | 2.6279585e6 | 53 | 790400 | 1 | 4.0954e+03 | false | above_reference | NaN | converged; claimed convergence at cost 4.095422e+03, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 8192 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 8192 | Optim (Newton) | 1.70486875e7 | 775 | 44577456 | 6 | 3.1342e-15 | true | ok | NaN | converged |
| 8192 | JSOSolvers (trunk) | 3.0006738625e10 | 33689 | 2729984 | 3 | 4.0425e+03 | false | timeout | NaN | max\_time |
| 8192 | JSOSolvers (tron) | 3.0022719667e10 | 33817 | 3268640 | 1 | 4.0425e+03 | false | timeout | NaN | max\_time |
| 8192 | Ipopt | 4.8361125e7 | 406 | 4199152 | 2 | 5.7178e-10 | true | ok | NaN | first\_order |
| 8192 | MadNLP | 1.2871499334e10 | 4609 | 5199632 | 500 | 1.3036e-01 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 8192 | NonlinearSolve (LM) | 3.0024407583e10 | 6934 | 518831136 | 37 | 3.1989e-11 | false | timeout | NaN | MaxTime; cost test passes |
| 8192 | NonlinearSolve (TrustRegion) | 1.922829375e8 | 19949 | 34838592 | 41 | 3.0843e-15 | true | ok | NaN | StalledSuccess |
| 8192 | CaNNOLeS | 2.7961667e7 | 254 | 10449728 | 3 | 3.1855e-15 | true | ok | NaN | first\_order |
| 16384 | SecondOrderOptimization (Dogleg) | 1.47276045e7 | 296 | 23440640 | 7 | 4.2558e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (LM) | 3.06542505e7 | 290 | 23178352 | 19 | 1.3348e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (Gauss-Newton) | 1.3453625e7 | 280 | 22260528 | 7 | 4.2558e-13 | true | ok | NaN | step\_size |
| 16384 | SecondOrderOptimization (LM, tall) | 1.43050334e8 | 732 | 93115152 | 15 | 1.0026e-13 | true | ok | NaN | step\_size |
| 16384 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 16384 | LeastSquaresOptim (LM) | 5.1345415e6 | 54 | 1577824 | 1 | 8.1914e+03 | false | above_reference | NaN | converged; claimed convergence at cost 8.191422e+03, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 16384 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 16384 | Optim (Newton) | 4.16199585e7 | 1029 | 114535312 | 8 | 1.2417e-13 | true | ok | NaN | converged |
| 16384 | JSOSolvers (trunk) | 3.0018703167e10 | 9933 | 2703808 | 3 | 8.1638e+03 | false | timeout | NaN | max\_time |
| 16384 | JSOSolvers (tron) | 3.0064031833e10 | 10159 | 3779648 | 1 | 8.1636e+03 | false | timeout | NaN | max\_time |
| 16384 | Ipopt | 1.06043916e8 | 416 | 8395376 | 2 | 1.1436e-09 | true | ok | NaN | first\_order |
| 16384 | MadNLP | 2.9566543083e10 | 4618 | 10189296 | 500 | 4.1475e+00 | false | not_converged | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 16384 | NonlinearSolve (LM) | 3.1795565792e10 | 2426 | 284903520 | 10 | 8.1849e+03 | false | timeout | NaN | MaxTime |
| 16384 | NonlinearSolve (TrustRegion) | 4.50548125e8 | 38754 | 88985888 | 43 | 9.7876e-14 | true | ok | NaN | StalledSuccess |
| 16384 | CaNNOLeS | 7.306509209e9 | 1252 | 21081632 | 501 | 1.0151e-13 | false | not_converged | NaN | max\_iter; cost test passes |
| 32768 | SecondOrderOptimization (Dogleg) | 6.41212562e8 | 296 | 46839040 | 158 | 2.4787e-07 | true | ok | NaN | rel\_dcost, abs\_dcost, step\_size |
| 32768 | SecondOrderOptimization (LM) | 5.772084165e8 | 290 | 46314608 | 134 | 5.0237e-11 | true | ok | NaN | step\_size |
| 32768 | SecondOrderOptimization (Gauss-Newton) | 6.02364125e8 | 283 | 44741488 | 160 | 2.4787e-07 | false | not_converged | NaN | max\_fails; cost test passes |
| 32768 | SecondOrderOptimization (LM, tall) | 3.34848375e8 | 804 | 205136624 | 17 | 3.1595e-12 | true | ok | NaN | step\_size |
| 32768 | LeastSquaresOptim (Dogleg) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 5000 variables |
| 32768 | LeastSquaresOptim (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse LSMR beyond 25000 variables |
| 32768 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NewtonTrustRegion needs a dense Hessian |
| 32768 | Optim (Newton) | 3.312715e8 | 782 | 244575328 | 5 | 5.9465e-08 | false | not_converged | NaN | not converged; cost test passes |
| 32768 | JSOSolvers (trunk) | 3.0035541625e10 | 4351 | 4664096 | 3 | 1.6366e+04 | false | timeout | NaN | max\_time |
| 32768 | JSOSolvers (tron) | 3.0151085458e10 | 4433 | 6797984 | 1 | 1.6366e+04 | false | timeout | NaN | max\_time |
| 32768 | Ipopt | 2.15735959e8 | 420 | 16771760 | 2 | 2.2901e-09 | true | ok | NaN | first\_order |
| 32768 | MadNLP | 3.0050495875e10 | 2618 | 20129200 | 250 | 1.4769e+04 | false | timeout | NaN | MAXIMUM\_WALLTIME\_EXCEEDED |
| 32768 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | NonlinearSolve (TrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | sparse QR beyond 25000 variables |
| 32768 | CaNNOLeS | 1.4824975458e10 | 1254 | 42004032 | 501 | 3.2323e-12 | false | not_converged | NaN | max\_iter; cost test passes |
