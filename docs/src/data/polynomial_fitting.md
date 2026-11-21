# Benchmark Results: Ill-Conditioned Polynomial Fitting

- **Category**: medium_dense
- **Scaling Metric**: Coefficients n
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-8 × start cost), the reference being the known minimum or else the lowest cost of any row at that size, and, where the problem states its solution, its relative error in the solution is at most 0.0001 (wrong_solution if not); a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-21T03:10:34
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.2.0)
- **Julia Version**: 1.13.4
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: 1dd4c9b
- **Dependency Commits**: BlockLinearSystems 78c771c, DampedLinearSolve e361765, NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | JuMP | 786.8461538461538 | 3 | 48 | 1016.7 | 5 | 128 |
| 4 | NLLSModel | 235.632183908046 | 1 | 16 | 5427.0 | 1 | 32 |
| 4 | Standalone | 163.672 | 1 | 16 | 553.2222222222222 | 1 | 32 |
| 5 | JuMP | 802.8846153846154 | 3 | 48 | 1017.5263157894736 | 5 | 128 |
| 5 | NLLSModel | 290.4492753623188 | 1 | 16 | 7653.0 | 1 | 32 |
| 5 | Standalone | 200.98039215686273 | 1 | 16 | 760.8148148148148 | 1 | 32 |
| 7 | JuMP | 835.0 | 3 | 48 | 1059.2105263157894 | 5 | 128 |
| 7 | NLLSModel | 413.34 | 1 | 16 | 11834.0 | 1 | 32 |
| 7 | Standalone | 284.15277777777777 | 1 | 16 | 1358.3333333333333 | 1 | 32 |
| 10 | JuMP | 865.9130434782609 | 3 | 48 | 1189.8333333333333 | 5 | 128 |
| 10 | NLLSModel | 508.56410256410254 | 1 | 16 | 11750.0 | 1 | 32 |
| 10 | Standalone | 338.271186440678 | 1 | 16 | 1931.8181818181818 | 1 | 32 |
| 14 | JuMP | 995.85 | 3 | 48 | 1443.5 | 5 | 128 |
| 14 | NLLSModel | 862.875 | 1 | 16 | 12333.0 | 1 | 32 |
| 14 | Standalone | 690.2666666666667 | 1 | 16 | 3979.1666666666665 | 1 | 32 |
| 19 | JuMP | 1220.5882352941176 | 3 | 48 | 1928.090909090909 | 5 | 128 |
| 19 | NLLSModel | 1309.875 | 1 | 16 | 21416.0 | 1 | 32 |
| 19 | Standalone | 916.6363636363636 | 1 | 16 | 7791.666666666667 | 1 | 32 |
| 25 | JuMP | 1583.3846153846155 | 3 | 48 | 2661.5 | 5 | 128 |
| 25 | NLLSModel | 2245.8 | 1 | 16 | 43417.0 | 1 | 32 |
| 25 | Standalone | 1512.8461538461538 | 1 | 16 | 12750.0 | 1 | 32 |
| 35 | JuMP | 2310.222222222222 | 3 | 48 | 4433.4 | 5 | 128 |
| 35 | NLLSModel | 2500.0 | 1 | 16 | 87125.0 | 1 | 32 |
| 35 | Standalone | 3548.5 | 1 | 16 | 28084.0 | 1 | 32 |
| 47 | JuMP | 3645.8333333333335 | 3 | 48 | 7375.0 | 5 | 128 |
| 47 | NLLSModel | 3194.3333333333335 | 1 | 16 | 195541.0 | 1 | 32 |
| 47 | Standalone | 6583.5 | 1 | 16 | 55708.0 | 1 | 32 |
| 64 | JuMP | 6083.25 | 3 | 48 | 13292.0 | 5 | 128 |
| 64 | NLLSModel | 4541.6 | 1 | 16 | 446250.0 | 1 | 32 |
| 64 | Standalone | 13750.0 | 1 | 16 | 203250.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 4 | CaNNOLeS | 1.00434083e8 | 411973 | 19594112 | 372 | 6.0311e+06 | false | not_converged | 2.0879e-12 | NaN | max\_eval; cost test passes |
| 4 | Ipopt | 2.304688e6 | 1738 | 134800 | 12 | 6.0311e+06 | true | ok | 3.5711e-12 | NaN | acceptable |
| 4 | JSOSolvers (tron) | 3.46625e6 | 123 | 8352 | 501 | 2.9556e+08 | false | not_converged | 2.8953e+08 | NaN | max\_iter |
| 4 | JSOSolvers (trunk) | 1.9815e6 | 59 | 4464 | 501 | 2.9556e+08 | false | not_converged | 2.8953e+08 | NaN | max\_iter |
| 4 | LeastSquaresOptim (Dogleg) | 74792.0 | 619 | 1290096 | 61 | 6.0311e+06 | true | ok | 1.3672e-11 | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 10895.5 | 93 | 208272 | 4 | 2.9556e+08 | false | above_reference | 2.8953e+08 | NaN | converged; claimed convergence at cost 2.955578e+08, above the reference 6.031146e+06; predicted reduction / cost 9.80e-01 |
| 4 | MadNLP | 1.47507875e8 | 171825 | 2806560 | 500 | 6.0321e+06 | false | not_converged | 9.8314e+02 | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 4 | NonlinearSolve (LM) | 1.548834e6 | 4666 | 637040 | 500 | 6.0311e+06 | false | not_converged | 1.5399e-07 | NaN | MaxIters; cost test passes |
| 4 | NonlinearSolve (TrustRegion) | 3.07935e7 | 10023 | 26362832 | 501 | 1.2801e+18 | false | not_converged | 1.2801e+18 | NaN | MaxIters |
| 4 | Optim (Newton) | 10416.5 | 77 | 3824 | 3 | 2.9556e+08 | false | above_reference | 2.8952e+08 | NaN | converged; claimed convergence at cost 2.955556e+08, above the reference 6.031146e+06; predicted reduction / cost 9.80e-01 |
| 4 | Optim (NewtonTrustRegion) | 2.098208e6 | 13932 | 1421968 | 500 | 2.9553e+08 | false | not_converged | 2.8950e+08 | NaN | not converged |
| 4 | SecondOrderOptimization | 723479.0 | 7844 | 296544 | 18 | 6.0311e+06 | true | ok | 2.4001e-12 | NaN | rel\_dcost |
| 5 | CaNNOLeS | 1.49590709e8 | 409199 | 19536560 | 126 | 7.2531e+06 | false | not_converged | 2.9870e-01 | NaN | max\_eval; cost test passes |
| 5 | Ipopt | 7.4586458e7 | 23749 | 1367808 | 500 | 7.2531e+06 | false | not_converged | 1.7124e+00 | NaN | max\_iter; cost test passes |
| 5 | JSOSolvers (tron) | 4.956209e6 | 123 | 8912 | 501 | 3.5866e+08 | false | not_converged | 3.5140e+08 | NaN | max\_iter |
| 5 | JSOSolvers (trunk) | 2.109708e6 | 326 | 23808 | 338 | 7.2569e+06 | false | not_converged | 3.8453e+03 | NaN | not\_desc |
| 5 | LeastSquaresOptim (Dogleg) | 97499.5 | 589 | 1349376 | 50 | 7.2531e+06 | true | ok | 3.3479e-07 | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 81917.0 | 453 | 1243264 | 24 | 7.2569e+06 | false | above_reference | 3.8457e+03 | NaN | converged; claimed convergence at cost 7.256897e+06, above the reference 7.253051e+06; predicted reduction / cost 5.30e-04 |
| 5 | MadNLP | 868104.0 | 704 | 54000 | 18 | 7.2569e+06 | false | above_reference | 3.8384e+03 | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 7.256889e+06, above the reference 7.253051e+06; predicted reduction / cost 5.29e-04 |
| 5 | NonlinearSolve (LM) | 2.072375e6 | 4666 | 768528 | 500 | 7.2531e+06 | false | not_converged | 1.3437e-06 | NaN | MaxIters; cost test passes |
| 5 | NonlinearSolve (TrustRegion) | 3.2420875e7 | 10023 | 26843520 | 501 | 3.4970e+18 | false | not_converged | 3.4970e+18 | NaN | MaxIters |
| 5 | Optim (Newton) | 11708.0 | 77 | 3952 | 3 | 7.2569e+06 | false | above_reference | 3.8456e+03 | NaN | converged; claimed convergence at cost 7.256897e+06, above the reference 7.253051e+06; predicted reduction / cost 5.30e-04 |
| 5 | Optim (NewtonTrustRegion) | 3.679333e6 | 29154 | 2948304 | 500 | 3.5411e+08 | false | not_converged | 3.4685e+08 | NaN | not converged |
| 5 | SecondOrderOptimization | 855229.5 | 9184 | 350416 | 17 | 7.2531e+06 | true | ok | 3.3276e-07 | NaN | rel\_dcost |
| 7 | CaNNOLeS | 3.41831667e8 | 412912 | 22889264 | 157 | 1.6095e+05 | false | not_converged | 1.4832e-02 | NaN | max\_eval; cost test passes |
| 7 | Ipopt | 1.77117e8 | 23797 | 1507040 | 500 | 1.6095e+05 | false | not_converged | 2.7126e+00 | NaN | max\_iter; cost test passes |
| 7 | JSOSolvers (tron) | 1.149825e7 | 123 | 10096 | 501 | 9.5849e+06 | false | not_converged | 9.4240e+06 | NaN | max\_iter |
| 7 | JSOSolvers (trunk) | 4.824e6 | 59 | 5888 | 501 | 9.5870e+06 | false | not_converged | 9.4260e+06 | NaN | max\_iter |
| 7 | LeastSquaresOptim (Dogleg) | 142833.5 | 613 | 1321888 | 53 | 1.6095e+05 | true | ok | 2.3840e-10 | NaN | converged |
| 7 | LeastSquaresOptim (LM) | 2.608166e6 | 9522 | 26246112 | 500 | 1.6110e+05 | false | not_converged | 1.5752e+02 | NaN | not converged |
| 7 | MadNLP | 4.5440375e7 | 13692 | 272608 | 287 | 4.9663e+56 | false | not_converged | 4.9663e+56 | NaN | DIVERGING\_ITERATES |
| 7 | NonlinearSolve (LM) | 3.319542e6 | 4670 | 1160592 | 500 | 1.6095e+05 | false | not_converged | 1.5047e-07 | NaN | MaxIters; cost test passes |
| 7 | NonlinearSolve (TrustRegion) | 2.6505625e7 | 11024 | 28333968 | 501 | 8.5144e+18 | false | not_converged | 8.5144e+18 | NaN | MaxIters |
| 7 | Optim (Newton) | 1.804166e6 | 6538 | 211280 | 500 | 1.6174e+05 | false | not_converged | 7.9308e+02 | NaN | not converged |
| 7 | Optim (NewtonTrustRegion) | 5.199959e6 | 30378 | 4724880 | 500 | 9.5924e+06 | false | not_converged | 9.4315e+06 | NaN | not converged |
| 7 | SecondOrderOptimization | 1.220792e6 | 12726 | 492832 | 17 | 1.6095e+05 | true | ok | 1.8236e-10 | NaN | rel\_dcost |
| 10 | CaNNOLeS | 5.99432583e8 | 409110 | 29230224 | 149 | 1.7415e+05 | false | not_converged | 3.8856e-04 | NaN | max\_eval; cost test passes |
| 10 | Ipopt | 5.8139042e7 | 5748 | 506992 | 95 | 1.7415e+05 | true | ok | 3.5696e-04 | NaN | acceptable |
| 10 | JSOSolvers (tron) | 2.6712209e7 | 123 | 11920 | 501 | 1.7996e+05 | false | not_converged | 5.8150e+03 | NaN | max\_iter |
| 10 | JSOSolvers (trunk) | 7.657e6 | 59 | 7296 | 501 | 1.7974e+05 | false | not_converged | 5.5876e+03 | NaN | max\_iter |
| 10 | LeastSquaresOptim (Dogleg) | 226604.0 | 614 | 1289264 | 57 | 1.7415e+05 | true | ok | 9.5329e-13 | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 883708.5 | 1922 | 5321808 | 100 | 1.7415e+05 | true | ok | 1.4285e-02 | NaN | converged |
| 10 | MadNLP | 718062.5 | 680 | 60112 | 15 | 1.7960e+05 | false | above_reference | 5.4542e+03 | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 1.796033e+05, above the reference 1.741491e+05; predicted reduction / cost 3.04e-02 |
| 10 | NonlinearSolve (LM) | 5.594417e6 | 4670 | 1932176 | 500 | 1.7415e+05 | false | not_converged | 1.6847e-09 | NaN | MaxIters; cost test passes |
| 10 | NonlinearSolve (TrustRegion) | 5.070583e6 | 11024 | 30546400 | 501 | 1.7164e+19 | false | not_converged | 1.7164e+19 | NaN | MaxIters |
| 10 | Optim (Newton) | 660896.0 | 1897 | 66208 | 143 | 1.7415e+05 | true | ok | 2.1953e-02 | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 776687.5 | 3158 | 794624 | 44 | 1.7960e+05 | false | above_reference | 5.4492e+03 | NaN | converged; claimed convergence at cost 1.795983e+05, above the reference 1.741491e+05; predicted reduction / cost 3.03e-02 |
| 10 | SecondOrderOptimization | 755146.0 | 18080 | 711280 | 17 | 1.7415e+05 | true | ok | 1.9566e-12 | NaN | rel\_dcost |
| 14 | CaNNOLeS | 1.125990417e9 | 408902 | 35770192 | 147 | 1.9267e+05 | false | not_converged | 4.3537e-03 | NaN | max\_eval; cost test passes |
| 14 | Ipopt | 5.4605875e7 | 4067 | 479632 | 62 | 1.9267e+05 | true | ok | 1.0504e-07 | NaN | acceptable |
| 14 | JSOSolvers (tron) | 1.2128458e7 | 295 | 27984 | 74 | 1.9404e+05 | false | not_converged | 1.3718e+03 | NaN | small\_step |
| 14 | JSOSolvers (trunk) | 1.2150208e7 | 326 | 28528 | 325 | 1.9368e+05 | false | not_converged | 1.0079e+03 | NaN | not\_desc |
| 14 | LeastSquaresOptim (Dogleg) | 383437.0 | 482 | 1320992 | 24 | 1.9267e+05 | true | ok | 2.5091e-11 | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 1.842125e6 | 2074 | 5878208 | 108 | 1.9267e+05 | true | ok | 1.2330e-02 | NaN | converged |
| 14 | MadNLP | 771041.5 | 680 | 67584 | 15 | 1.9368e+05 | false | above_reference | 1.0088e+03 | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 1.936806e+05, above the reference 1.926718e+05; predicted reduction / cost 5.21e-03 |
| 14 | NonlinearSolve (LM) | 1.0617625e7 | 4670 | 3000768 | 500 | 1.9267e+05 | false | not_converged | 3.1215e-05 | NaN | MaxIters; cost test passes |
| 14 | NonlinearSolve (TrustRegion) | 9.679709e6 | 11024 | 34898864 | 501 | 1.8354e+19 | false | not_converged | 1.8354e+19 | NaN | MaxIters |
| 14 | Optim (Newton) | 2.356834e6 | 3860 | 133168 | 294 | 1.9267e+05 | true | ok | 2.1357e-01 | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 1.396e7 | 35534 | 14316288 | 500 | 1.9372e+05 | false | not_converged | 1.0475e+03 | NaN | not converged |
| 14 | SecondOrderOptimization | 672750.0 | 23735 | 961664 | 16 | 1.9267e+05 | true | ok | 2.8768e-10 | NaN | rel\_dcost |
| 19 | CaNNOLeS | 2.7695225e9 | 112094 | 10722672 | 119 | 2.1948e+03 | false | not_converged | 1.1166e-01 | NaN | stalled; cost test passes |
| 19 | Ipopt | 5.68150291e8 | 23861 | 2312064 | 500 | 1.1821e+04 | false | not_converged | 9.6265e+03 | NaN | max\_iter |
| 19 | JSOSolvers (tron) | 4.814325e7 | 295 | 30240 | 151 | 7.4546e+04 | false | not_converged | 7.2351e+04 | NaN | small\_step |
| 19 | JSOSolvers (trunk) | 2.1894525e8 | 59 | 11456 | 501 | 3.3439e+04 | false | not_converged | 3.1244e+04 | NaN | max\_iter |
| 19 | LeastSquaresOptim (Dogleg) | 889937.5 | 743 | 1560560 | 78 | 2.1946e+03 | true | ok | 3.1712e-10 | NaN | converged |
| 19 | LeastSquaresOptim (LM) | 3.9912584e7 | 9522 | 28257840 | 500 | 4.7816e+03 | false | not_converged | 2.5870e+03 | NaN | not converged |
| 19 | MadNLP | 1.1671045e6 | 704 | 80704 | 18 | 1.8498e+04 | false | above_reference | 1.6304e+04 | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 1.849841e+04, above the reference 2.194639e+03; predicted reduction / cost 8.81e-01 |
| 19 | NonlinearSolve (LM) | 1.7606084e7 | 5670 | 4960928 | 500 | 2.1946e+03 | false | not_converged | 9.9742e-07 | NaN | MaxIters; cost test passes |
| 19 | NonlinearSolve (TrustRegion) | 2.106458e6 | 146 | 77216 | 79 | 2.1946e+03 | true | ok | 5.3506e-10 | NaN | StalledSuccess |
| 19 | Optim (Newton) | 6.529125e6 | 6540 | 225360 | 500 | 1.3697e+04 | false | not_converged | 1.1502e+04 | NaN | not converged |
| 19 | Optim (NewtonTrustRegion) | 1.800375e7 | 15548 | 8716944 | 500 | 1.7595e+04 | false | not_converged | 1.5400e+04 | NaN | not converged |
| 19 | SecondOrderOptimization | 1.145583e6 | 40092 | 1620592 | 20 | 2.1946e+03 | true | ok | 2.9942e-10 | NaN | step\_size |
| 25 | CaNNOLeS | 4.604000708e9 | 411388 | 52519312 | 132 | 8.9186e-02 | false | not_converged | 5.9717e-07 | NaN | max\_eval; cost test passes |
| 25 | Ipopt | 9.66769167e8 | 23813 | 2705760 | 500 | 9.3375e-01 | false | not_converged | 8.4456e-01 | NaN | max\_iter; cost test passes |
| 25 | JSOSolvers (tron) | 3.0696625e8 | 123 | 20672 | 501 | 1.3862e+01 | false | not_converged | 1.3773e+01 | NaN | max\_iter; cost test passes |
| 25 | JSOSolvers (trunk) | 3.1026e8 | 59 | 14288 | 501 | 1.3840e+01 | false | not_converged | 1.3750e+01 | NaN | max\_iter; cost test passes |
| 25 | LeastSquaresOptim (Dogleg) | 1.4946665e6 | 700 | 1561296 | 71 | 8.9186e-02 | true | ok | 2.4871e-14 | NaN | converged |
| 25 | LeastSquaresOptim (LM) | 2.7218458e7 | 9522 | 28895728 | 500 | 3.1051e-01 | false | not_converged | 2.2132e-01 | NaN | not converged; cost test passes |
| 25 | MadNLP | 738437.5 | 656 | 101008 | 11 | 1.4882e+01 | true | ok | 1.4793e+01 | NaN | SOLVE\_SUCCEEDED |
| 25 | NonlinearSolve (LM) | 2.747225e7 | 5065 | 6870192 | 445 | 8.9186e-02 | true | ok | 1.1516e-10 | NaN | StalledSuccess |
| 25 | NonlinearSolve (TrustRegion) | 3.9068335e6 | 146 | 133104 | 76 | 8.9186e-02 | true | ok | 4.4332e-15 | NaN | StalledSuccess |
| 25 | Optim (Newton) | 1.023575e7 | 6540 | 237840 | 500 | 9.7398e-02 | false | not_converged | 8.2124e-03 | NaN | not converged; cost test passes |
| 25 | Optim (NewtonTrustRegion) | 3.4614417e7 | 32116 | 29505568 | 500 | 9.3398e+01 | false | not_converged | 9.3309e+01 | NaN | not converged |
| 25 | SecondOrderOptimization | 1.590333e6 | 49931 | 2119904 | 19 | 8.9186e-02 | true | ok | 1.1760e-13 | NaN | rel\_dcost |
| 35 | CaNNOLeS | 4.8153335e6 | 213 | 1708944 | 4 | 3.4630e-10 | true | ok | 3.4368e-10 | NaN | first\_order |
| 35 | Ipopt | 1.59780835e7 | 450 | 119120 | 4 | 3.6441e-10 | true | ok | 3.6179e-10 | NaN | first\_order |
| 35 | JSOSolvers (tron) | 9.40771459e8 | 130 | 28832 | 501 | 1.4159e-06 | false | not_converged | 1.4159e-06 | NaN | max\_iter; cost test passes |
| 35 | JSOSolvers (trunk) | 1.327941667e9 | 65 | 20928 | 501 | 1.4342e-06 | false | not_converged | 1.4342e-06 | NaN | max\_iter; cost test passes |
| 35 | LeastSquaresOptim (Dogleg) | 2.1244165e6 | 376 | 889168 | 38 | 2.6241e-12 | true | ok | 2.2050e-23 | NaN | converged |
| 35 | LeastSquaresOptim (LM) | 8.3167041e7 | 9525 | 30651520 | 500 | 9.1757e-12 | false | not_converged | 6.5517e-12 | NaN | not converged; cost test passes |
| 35 | MadNLP | 682937.5 | 624 | 142064 | 5 | 5.3164e-03 | true | ok | 5.3164e-03 | NaN | SOLVE\_SUCCEEDED |
| 35 | NonlinearSolve (LM) | 2.4776375e7 | 2869 | 5889920 | 207 | 2.6241e-12 | true | ok | 1.7883e-19 | NaN | StalledSuccess |
| 35 | NonlinearSolve (TrustRegion) | 3.8544585e6 | 155 | 213120 | 42 | 2.6241e-12 | true | ok | 3.0583e-23 | NaN | StalledSuccess |
| 35 | Optim (Newton) | 2.1908125e7 | 8790 | 712720 | 500 | 2.3971e-08 | false | not_converged | 2.3969e-08 | NaN | not converged; cost test passes |
| 35 | Optim (NewtonTrustRegion) | 9.771675e7 | 35248 | 58023552 | 500 | 2.3326e-03 | false | not_converged | 2.3326e-03 | NaN | not converged; cost test passes |
| 35 | SecondOrderOptimization | 3.41330167e8 | 66028 | 2900048 | 17 | 2.6241e-12 | true | ok | 2.8227e-23 | NaN | abs\_dcost |
| 47 | CaNNOLeS | 9.6255625e6 | 213 | 3009680 | 4 | 2.1405e-09 | true | ok | 2.1405e-09 | NaN | first\_order |
| 47 | Ipopt | 3.4562375e7 | 450 | 151824 | 4 | 4.3768e-11 | true | ok | 4.3768e-11 | NaN | first\_order |
| 47 | JSOSolvers (tron) | 1.761848e9 | 130 | 34160 | 501 | 2.3696e-07 | false | not_converged | 2.3696e-07 | NaN | max\_iter; cost test passes |
| 47 | JSOSolvers (trunk) | 1.472305833e9 | 65 | 25056 | 501 | 2.3689e-07 | false | not_converged | 2.3689e-07 | NaN | max\_iter; cost test passes |
| 47 | LeastSquaresOptim (Dogleg) | 4.3123125e6 | 276 | 1011664 | 13 | 3.7289e-22 | true | ok | 4.1022e-23 | NaN | converged |
| 47 | LeastSquaresOptim (LM) | 1.79628916e8 | 9525 | 32959296 | 500 | 2.3000e-12 | false | not_converged | 2.3000e-12 | NaN | not converged; cost test passes |
| 47 | MadNLP | 695708.5 | 608 | 221312 | 3 | 1.2168e-02 | true | ok | 1.2168e-02 | NaN | SOLVE\_SUCCEEDED |
| 47 | NonlinearSolve (LM) | 4.5913646e7 | 2793 | 8126032 | 201 | 5.0704e-19 | true | ok | 4.9720e-19 | NaN | StalledSuccess |
| 47 | NonlinearSolve (TrustRegion) | 1.2747813e7 | 155 | 361888 | 40 | 2.4957e-22 | true | ok | 4.7786e-23 | NaN | StalledSuccess |
| 47 | Optim (Newton) | 4.2274167e7 | 9030 | 341712 | 500 | 7.5873e-09 | false | not_converged | 7.5873e-09 | NaN | not converged; cost test passes |
| 47 | Optim (NewtonTrustRegion) | 1.58244333e8 | 35394 | 110258832 | 500 | 1.3719e-04 | false | not_converged | 1.3719e-04 | NaN | not converged; cost test passes |
| 47 | SecondOrderOptimization | 3.81903792e8 | 88492 | 4093920 | 17 | 3.9398e-22 | true | ok | 6.2353e-23 | NaN | abs\_dcost |
| 64 | CaNNOLeS | 1.786309375e8 | 218 | 5453664 | 36 | 3.7621e-09 | true | ok | 3.7621e-09 | NaN | first\_order |
| 64 | Ipopt | 6.2849e7 | 401 | 182032 | 3 | 1.1917e-12 | true | ok | 1.1917e-12 | NaN | first\_order |
| 64 | JSOSolvers (tron) | 3.21313667e8 | 302 | 57072 | 56 | 1.1801e-09 | false | not_converged | 1.1801e-09 | NaN | small\_step; cost test passes |
| 64 | JSOSolvers (trunk) | 2.80832166e8 | 334 | 51680 | 314 | 1.1802e-09 | false | not_converged | 1.1802e-09 | NaN | not\_desc; cost test passes |
| 64 | LeastSquaresOptim (Dogleg) | 1.07715835e7 | 276 | 1217152 | 13 | 4.3565e-22 | true | ok | 7.0668e-23 | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 4.63739917e8 | 9525 | 36446240 | 500 | 4.5032e-12 | false | not_converged | 4.5032e-12 | NaN | not converged; cost test passes |
| 64 | MadNLP | 936479.0 | 608 | 388464 | 3 | 8.3922e-03 | true | ok | 8.3922e-03 | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 9.53923955e7 | 2832 | 11969200 | 204 | 3.1400e-19 | true | ok | 3.1200e-19 | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 2.9020166e7 | 155 | 616528 | 40 | 3.2601e-22 | true | ok | 3.4573e-23 | NaN | StalledSuccess |
| 64 | Optim (Newton) | 1.26828167e8 | 9035 | 375568 | 500 | 5.0628e-10 | false | not_converged | 5.0628e-10 | NaN | not converged; cost test passes |
| 64 | Optim (NewtonTrustRegion) | 3.31061e8 | 32209 | 160652896 | 500 | 1.8965e-06 | false | not_converged | 1.8965e-06 | NaN | not converged; cost test passes |
| 64 | SecondOrderOptimization | 3.75946959e8 | 120334 | 5913472 | 17 | 4.7630e-22 | true | ok | 2.6440e-23 | NaN | abs\_dcost |
