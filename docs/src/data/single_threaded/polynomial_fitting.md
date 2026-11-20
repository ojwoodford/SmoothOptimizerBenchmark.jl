# Benchmark Results: Ill-Conditioned Polynomial Fitting

- **Category**: medium_dense
- **Scaling Metric**: Coefficients n
- **Optimizer Target Model**: Standalone
- **Derivatives**: analytic
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:35:38
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=1, Julia threads=8, BLAS threads=1
- **Git Commit**: fbb6630
- **Dependency Commits**: NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 4 | JuMP | 793.4166666666666 | 3 | 48 | 1055.5714285714287 | 5 | 128 |
| 4 | NLLSModel | 226.12359550561797 | 1 | 16 | 5656.25 | 1 | 32 |
| 4 | Standalone | 180.0909090909091 | 1 | 16 | 587.0 | 1 | 32 |
| 5 | JuMP | 858.9615384615385 | 3 | 48 | 1095.5882352941176 | 5 | 128 |
| 5 | NLLSModel | 279.6849315068493 | 1 | 16 | 8152.666666666667 | 1 | 32 |
| 5 | Standalone | 216.49484536082474 | 1 | 16 | 783.6538461538462 | 1 | 32 |
| 7 | JuMP | 845.0 | 3 | 48 | 1052.6315789473683 | 5 | 128 |
| 7 | NLLSModel | 402.7843137254902 | 1 | 16 | 12875.0 | 1 | 32 |
| 7 | Standalone | 300.6 | 1 | 16 | 1413.8666666666666 | 1 | 32 |
| 10 | JuMP | 868.0416666666666 | 3 | 48 | 1155.111111111111 | 5 | 128 |
| 10 | NLLSModel | 485.1190476190476 | 1 | 16 | 24166.0 | 1 | 32 |
| 10 | Standalone | 353.8070175438597 | 1 | 16 | 2045.8 | 1 | 32 |
| 14 | JuMP | 997.95 | 3 | 48 | 1472.2666666666667 | 5 | 128 |
| 14 | NLLSModel | 835.1304347826087 | 1 | 16 | 45292.0 | 1 | 32 |
| 14 | Standalone | 588.1142857142858 | 1 | 16 | 4433.4 | 1 | 32 |
| 19 | JuMP | 1247.5294117647059 | 3 | 48 | 1878.7272727272727 | 5 | 128 |
| 19 | NLLSModel | 1286.764705882353 | 1 | 16 | 76292.0 | 1 | 32 |
| 19 | Standalone | 927.0833333333334 | 1 | 16 | 7736.0 | 1 | 32 |
| 25 | JuMP | 1554.4615384615386 | 3 | 48 | 2677.125 | 5 | 128 |
| 25 | NLLSModel | 2104.1 | 1 | 16 | 138500.0 | 1 | 32 |
| 25 | Standalone | 1464.2857142857142 | 1 | 16 | 13417.0 | 1 | 32 |
| 35 | JuMP | 2338.0 | 3 | 48 | 4766.6 | 5 | 128 |
| 35 | NLLSModel | 4416.6 | 1 | 16 | 323125.0 | 1 | 32 |
| 35 | Standalone | 3666.6666666666665 | 1 | 16 | 27417.0 | 1 | 32 |
| 47 | JuMP | 3659.6666666666665 | 3 | 48 | 7583.333333333333 | 5 | 128 |
| 47 | NLLSModel | 8166.666666666667 | 1 | 16 | 715708.0 | 1 | 32 |
| 47 | Standalone | 6666.666666666667 | 1 | 16 | 56500.0 | 1 | 32 |
| 64 | JuMP | 5968.75 | 3 | 48 | 13292.0 | 5 | 128 |
| 64 | NLLSModel | 15333.0 | 1 | 16 | 1.710541e6 | 1 | 32 |
| 64 | Standalone | 13000.0 | 1 | 16 | 206334.0 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 4 | CaNNOLeS | 8.9892167e7 | 411973 | 19594112 | 372 | 6.0311e+06 | false | not_converged | 2.0879e-12 | NaN | max\_eval; cost test passes |
| 4 | Ipopt | 700833.0 | 397 | 28496 | 3 | 6.0311e+06 | true | ok | 5.5652e-12 | NaN | acceptable |
| 4 | JSOSolvers (tron) | 3.442125e6 | 123 | 8352 | 501 | 2.9556e+08 | false | not_converged | 2.8953e+08 | NaN | max\_iter |
| 4 | JSOSolvers (trunk) | 1.973625e6 | 59 | 4464 | 501 | 2.9556e+08 | false | not_converged | 2.8953e+08 | NaN | max\_iter |
| 4 | LeastSquaresOptim (Dogleg) | 97250.5 | 619 | 1290096 | 61 | 6.0311e+06 | true | ok | 1.3672e-11 | NaN | converged |
| 4 | LeastSquaresOptim (LM) | 14958.0 | 93 | 208272 | 4 | 2.9556e+08 | false | above_reference | 2.8953e+08 | NaN | converged; claimed convergence at cost 2.955578e+08, above the reference 6.031146e+06; predicted reduction / cost 9.80e-01 |
| 4 | MadNLP | 1.49713833e8 | 171825 | 2806560 | 500 | 6.0321e+06 | false | not_converged | 9.8314e+02 | NaN | MAXIMUM\_ITERATIONS\_EXCEEDED |
| 4 | NonlinearSolve (LM) | 1.756541e6 | 4666 | 637040 | 500 | 6.0311e+06 | false | not_converged | 1.5399e-07 | NaN | MaxIters; cost test passes |
| 4 | NonlinearSolve (TrustRegion) | 1.783083e6 | 10023 | 26362832 | 501 | 1.2801e+18 | false | not_converged | 1.2801e+18 | NaN | MaxIters |
| 4 | Optim (Newton) | 11333.5 | 77 | 3824 | 3 | 2.9556e+08 | false | above_reference | 2.8952e+08 | NaN | converged; claimed convergence at cost 2.955556e+08, above the reference 6.031146e+06; predicted reduction / cost 9.80e-01 |
| 4 | Optim (NewtonTrustRegion) | 2.237292e6 | 14432 | 1437968 | 500 | 2.9553e+08 | false | not_converged | 2.8950e+08 | NaN | not converged |
| 4 | SecondOrderOptimization | 850229.5 | 7844 | 296544 | 18 | 6.0311e+06 | true | ok | 2.4001e-12 | NaN | rel\_dcost |
| 5 | CaNNOLeS | 1.5562375e8 | 409199 | 19536560 | 126 | 7.2531e+06 | false | not_converged | 2.9870e-01 | NaN | max\_eval; cost test passes |
| 5 | Ipopt | 6.2435521e7 | 19997 | 1153168 | 420 | 7.2531e+06 | true | ok | 5.9076e+00 | NaN | acceptable |
| 5 | JSOSolvers (tron) | 5.042875e6 | 123 | 8912 | 501 | 3.5866e+08 | false | not_converged | 3.5140e+08 | NaN | max\_iter |
| 5 | JSOSolvers (trunk) | 2.164417e6 | 326 | 23808 | 338 | 7.2569e+06 | false | not_converged | 3.8453e+03 | NaN | not\_desc |
| 5 | LeastSquaresOptim (Dogleg) | 125250.0 | 589 | 1349376 | 50 | 7.2531e+06 | true | ok | 3.3479e-07 | NaN | converged |
| 5 | LeastSquaresOptim (LM) | 104021.0 | 453 | 1243264 | 24 | 7.2569e+06 | false | above_reference | 3.8457e+03 | NaN | converged; claimed convergence at cost 7.256897e+06, above the reference 7.253051e+06; predicted reduction / cost 5.30e-04 |
| 5 | MadNLP | 894500.0 | 704 | 54000 | 18 | 7.2569e+06 | false | above_reference | 3.8384e+03 | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 7.256889e+06, above the reference 7.253051e+06; predicted reduction / cost 5.29e-04 |
| 5 | NonlinearSolve (LM) | 2.235708e6 | 4666 | 768528 | 500 | 7.2531e+06 | false | not_converged | 1.3437e-06 | NaN | MaxIters; cost test passes |
| 5 | NonlinearSolve (TrustRegion) | 2.166583e6 | 10023 | 26843520 | 501 | 3.4970e+18 | false | not_converged | 3.4970e+18 | NaN | MaxIters |
| 5 | Optim (Newton) | 12208.0 | 77 | 3952 | 3 | 7.2569e+06 | false | above_reference | 3.8456e+03 | NaN | converged; claimed convergence at cost 7.256897e+06, above the reference 7.253051e+06; predicted reduction / cost 5.30e-04 |
| 5 | Optim (NewtonTrustRegion) | 3.695083e6 | 29654 | 2964304 | 500 | 3.5411e+08 | false | not_converged | 3.4685e+08 | NaN | not converged |
| 5 | SecondOrderOptimization | 988958.5 | 9184 | 350416 | 17 | 7.2531e+06 | true | ok | 3.3276e-07 | NaN | rel\_dcost |
| 7 | CaNNOLeS | 3.45011375e8 | 412912 | 22889264 | 157 | 1.6095e+05 | false | not_converged | 1.4832e-02 | NaN | max\_eval; cost test passes |
| 7 | Ipopt | 9.926354e6 | 1291 | 94128 | 22 | 1.6246e+05 | false | above_reference | 1.5149e+03 | NaN | acceptable; claimed convergence at cost 1.624606e+05, above the reference 1.609458e+05; predicted reduction / cost 9.32e-03 |
| 7 | JSOSolvers (tron) | 1.1765e7 | 123 | 10096 | 501 | 9.5849e+06 | false | not_converged | 9.4240e+06 | NaN | max\_iter |
| 7 | JSOSolvers (trunk) | 4.867708e6 | 59 | 5888 | 501 | 9.5870e+06 | false | not_converged | 9.4260e+06 | NaN | max\_iter |
| 7 | LeastSquaresOptim (Dogleg) | 156854.5 | 613 | 1321888 | 53 | 1.6095e+05 | true | ok | 2.3840e-10 | NaN | converged |
| 7 | LeastSquaresOptim (LM) | 2.69375e6 | 9522 | 26246112 | 500 | 1.6110e+05 | false | not_converged | 1.5752e+02 | NaN | not converged |
| 7 | MadNLP | 4.4056083e7 | 13692 | 272608 | 287 | 4.9663e+56 | false | not_converged | 4.9663e+56 | NaN | DIVERGING\_ITERATES |
| 7 | NonlinearSolve (LM) | 3.496458e6 | 4670 | 1160592 | 500 | 1.6095e+05 | false | not_converged | 1.5047e-07 | NaN | MaxIters; cost test passes |
| 7 | NonlinearSolve (TrustRegion) | 3.260916e6 | 11024 | 28333968 | 501 | 8.5144e+18 | false | not_converged | 8.5144e+18 | NaN | MaxIters |
| 7 | Optim (Newton) | 1.858625e6 | 6538 | 211280 | 500 | 1.6174e+05 | false | not_converged | 7.9308e+02 | NaN | not converged |
| 7 | Optim (NewtonTrustRegion) | 5.327375e6 | 30878 | 4740880 | 500 | 9.5924e+06 | false | not_converged | 9.4315e+06 | NaN | not converged |
| 7 | SecondOrderOptimization | 1.3597085e6 | 12726 | 492832 | 17 | 1.6095e+05 | true | ok | 1.8236e-10 | NaN | rel\_dcost |
| 10 | CaNNOLeS | 6.11233416e8 | 409110 | 29230224 | 149 | 1.7415e+05 | false | not_converged | 3.8856e-04 | NaN | max\_eval; cost test passes |
| 10 | Ipopt | 1.52061455e7 | 1314 | 107936 | 23 | 1.7421e+05 | false | above_reference | 5.6408e+01 | NaN | acceptable; claimed convergence at cost 1.742055e+05, above the reference 1.741491e+05; predicted reduction / cost 3.24e-04 |
| 10 | JSOSolvers (tron) | 2.7608208e7 | 123 | 11920 | 501 | 1.7996e+05 | false | not_converged | 5.8150e+03 | NaN | max\_iter |
| 10 | JSOSolvers (trunk) | 7.789792e6 | 59 | 7296 | 501 | 1.7974e+05 | false | not_converged | 5.5876e+03 | NaN | max\_iter |
| 10 | LeastSquaresOptim (Dogleg) | 236041.5 | 614 | 1289264 | 57 | 1.7415e+05 | true | ok | 9.5329e-13 | NaN | converged |
| 10 | LeastSquaresOptim (LM) | 907041.5 | 1922 | 5321808 | 100 | 1.7415e+05 | true | ok | 1.4285e-02 | NaN | converged |
| 10 | MadNLP | 719958.0 | 680 | 60112 | 15 | 1.7960e+05 | false | above_reference | 5.4542e+03 | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 1.796033e+05, above the reference 1.741491e+05; predicted reduction / cost 3.04e-02 |
| 10 | NonlinearSolve (LM) | 6.089042e6 | 4670 | 1932176 | 500 | 1.7415e+05 | false | not_converged | 1.6847e-09 | NaN | MaxIters; cost test passes |
| 10 | NonlinearSolve (TrustRegion) | 4.955083e6 | 11024 | 30546400 | 501 | 1.7164e+19 | false | not_converged | 1.7164e+19 | NaN | MaxIters |
| 10 | Optim (Newton) | 667687.5 | 1897 | 66208 | 143 | 1.7415e+05 | true | ok | 2.1953e-02 | NaN | converged |
| 10 | Optim (NewtonTrustRegion) | 797083.5 | 3202 | 796032 | 44 | 1.7960e+05 | false | above_reference | 5.4492e+03 | NaN | converged; claimed convergence at cost 1.795983e+05, above the reference 1.741491e+05; predicted reduction / cost 3.03e-02 |
| 10 | SecondOrderOptimization | 2.012083e6 | 18029 | 710400 | 17 | 1.7415e+05 | true | ok | 1.9566e-12 | NaN | rel\_dcost |
| 14 | CaNNOLeS | 1.147231917e9 | 408902 | 35770192 | 147 | 1.9267e+05 | false | not_converged | 4.3537e-03 | NaN | max\_eval; cost test passes |
| 14 | Ipopt | 2.5487708e7 | 1551 | 153168 | 28 | 1.9267e+05 | true | ok | 2.6959e-03 | NaN | acceptable |
| 14 | JSOSolvers (tron) | 1.1284167e7 | 295 | 27984 | 74 | 1.9404e+05 | false | not_converged | 1.3718e+03 | NaN | small\_step |
| 14 | JSOSolvers (trunk) | 1.298725e7 | 326 | 28528 | 325 | 1.9368e+05 | false | not_converged | 1.0079e+03 | NaN | not\_desc |
| 14 | LeastSquaresOptim (Dogleg) | 418625.0 | 482 | 1320992 | 24 | 1.9267e+05 | true | ok | 2.5091e-11 | NaN | converged |
| 14 | LeastSquaresOptim (LM) | 1.8533335e6 | 2074 | 5878208 | 108 | 1.9267e+05 | true | ok | 1.2330e-02 | NaN | converged |
| 14 | MadNLP | 739583.0 | 680 | 67584 | 15 | 1.9368e+05 | false | above_reference | 1.0088e+03 | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 1.936806e+05, above the reference 1.926718e+05; predicted reduction / cost 5.21e-03 |
| 14 | NonlinearSolve (LM) | 1.132425e7 | 4670 | 3000768 | 500 | 1.9267e+05 | false | not_converged | 3.1215e-05 | NaN | MaxIters; cost test passes |
| 14 | NonlinearSolve (TrustRegion) | 9.969292e6 | 11024 | 34898864 | 501 | 1.8354e+19 | false | not_converged | 1.8354e+19 | NaN | MaxIters |
| 14 | Optim (Newton) | 2.339771e6 | 3860 | 133168 | 294 | 1.9267e+05 | true | ok | 2.1357e-01 | NaN | converged |
| 14 | Optim (NewtonTrustRegion) | 3.3828042e7 | 36034 | 14332288 | 500 | 1.9372e+05 | false | not_converged | 1.0475e+03 | NaN | not converged |
| 14 | SecondOrderOptimization | 2.6821455e6 | 23639 | 959968 | 16 | 1.9267e+05 | true | ok | 2.8768e-10 | NaN | rel\_dcost |
| 19 | CaNNOLeS | 2.78019425e9 | 112094 | 10722672 | 119 | 2.1948e+03 | false | not_converged | 1.1166e-01 | NaN | stalled; cost test passes |
| 19 | Ipopt | 2.4570475e8 | 9849 | 968640 | 204 | 1.4735e+04 | false | above_reference | 1.2541e+04 | NaN | acceptable; claimed convergence at cost 1.473524e+04, above the reference 2.194639e+03; predicted reduction / cost 8.51e-01 |
| 19 | JSOSolvers (tron) | 4.7502334e7 | 295 | 30240 | 151 | 7.4546e+04 | false | not_converged | 7.2351e+04 | NaN | small\_step |
| 19 | JSOSolvers (trunk) | 2.16864209e8 | 59 | 11456 | 501 | 3.3439e+04 | false | not_converged | 3.1244e+04 | NaN | max\_iter |
| 19 | LeastSquaresOptim (Dogleg) | 908916.5 | 743 | 1560560 | 78 | 2.1946e+03 | true | ok | 3.1712e-10 | NaN | converged |
| 19 | LeastSquaresOptim (LM) | 1.5659625e7 | 9522 | 28257840 | 500 | 4.7816e+03 | false | not_converged | 2.5870e+03 | NaN | not converged |
| 19 | MadNLP | 1.251583e6 | 704 | 80704 | 18 | 1.8498e+04 | false | above_reference | 1.6304e+04 | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 1.849841e+04, above the reference 2.194639e+03; predicted reduction / cost 8.81e-01 |
| 19 | NonlinearSolve (LM) | 1.898725e7 | 5670 | 4960928 | 500 | 2.1946e+03 | false | not_converged | 9.9742e-07 | NaN | MaxIters; cost test passes |
| 19 | NonlinearSolve (TrustRegion) | 2.1635415e6 | 146 | 77216 | 79 | 2.1946e+03 | true | ok | 5.3506e-10 | NaN | StalledSuccess |
| 19 | Optim (Newton) | 6.57825e6 | 6540 | 225360 | 500 | 1.3697e+04 | false | not_converged | 1.1502e+04 | NaN | not converged |
| 19 | Optim (NewtonTrustRegion) | 1.8397583e7 | 16048 | 8732944 | 500 | 1.7595e+04 | false | not_converged | 1.5400e+04 | NaN | not converged |
| 19 | SecondOrderOptimization | 4.8214795e6 | 39932 | 1617808 | 20 | 2.1946e+03 | true | ok | 2.9942e-10 | NaN | step\_size |
| 25 | CaNNOLeS | 4.728032875e9 | 411388 | 52519312 | 132 | 8.9186e-02 | false | not_converged | 5.9717e-07 | NaN | max\_eval; cost test passes |
| 25 | Ipopt | 5.056201455e8 | 12070 | 1392208 | 251 | 1.0512e+00 | false | above_reference | 9.6205e-01 | NaN | acceptable; claimed convergence at cost 1.051234e+00, above the reference 8.918553e-02; predicted reduction / cost 9.15e-01 |
| 25 | JSOSolvers (tron) | 3.00129583e8 | 123 | 20672 | 501 | 1.3862e+01 | false | not_converged | 1.3773e+01 | NaN | max\_iter |
| 25 | JSOSolvers (trunk) | 3.13299417e8 | 59 | 14288 | 501 | 1.3840e+01 | false | not_converged | 1.3750e+01 | NaN | max\_iter |
| 25 | LeastSquaresOptim (Dogleg) | 1.5074585e6 | 700 | 1561296 | 71 | 8.9186e-02 | true | ok | 2.4871e-14 | NaN | converged |
| 25 | LeastSquaresOptim (LM) | 2.7282667e7 | 9522 | 28895728 | 500 | 3.1051e-01 | false | not_converged | 2.2132e-01 | NaN | not converged |
| 25 | MadNLP | 785354.0 | 656 | 101008 | 11 | 1.4882e+01 | false | above_reference | 1.4793e+01 | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 1.488173e+01, above the reference 8.918553e-02; predicted reduction / cost 9.94e-01 |
| 25 | NonlinearSolve (LM) | 2.840525e7 | 5065 | 6870192 | 445 | 8.9186e-02 | true | ok | 1.1516e-10 | NaN | StalledSuccess |
| 25 | NonlinearSolve (TrustRegion) | 3.922604e6 | 146 | 133104 | 76 | 8.9186e-02 | true | ok | 4.4332e-15 | NaN | StalledSuccess |
| 25 | Optim (Newton) | 1.0261667e7 | 6540 | 237840 | 500 | 9.7398e-02 | false | not_converged | 8.2124e-03 | NaN | not converged |
| 25 | Optim (NewtonTrustRegion) | 3.4723625e7 | 32616 | 29521568 | 500 | 9.3398e+01 | false | not_converged | 9.3309e+01 | NaN | not converged |
| 25 | SecondOrderOptimization | 6.303396e6 | 49779 | 2117248 | 19 | 8.9186e-02 | true | ok | 1.1760e-13 | NaN | rel\_dcost |
| 35 | CaNNOLeS | 4.888729e6 | 213 | 1708944 | 4 | 3.4630e-10 | true | ok | 3.4368e-10 | NaN | first\_order |
| 35 | Ipopt | 1.36105e7 | 409 | 112384 | 3 | 3.7497e-10 | true | ok | 3.7235e-10 | NaN | acceptable |
| 35 | JSOSolvers (tron) | 9.3874975e8 | 130 | 28832 | 501 | 1.4159e-06 | false | not_converged | 1.4159e-06 | NaN | max\_iter |
| 35 | JSOSolvers (trunk) | 1.34318825e9 | 65 | 20928 | 501 | 1.4342e-06 | false | not_converged | 1.4342e-06 | NaN | max\_iter |
| 35 | LeastSquaresOptim (Dogleg) | 1.873375e6 | 376 | 889168 | 38 | 2.6241e-12 | true | ok | 2.2050e-23 | NaN | converged |
| 35 | LeastSquaresOptim (LM) | 7.0108625e7 | 9525 | 30651520 | 500 | 9.1757e-12 | false | not_converged | 6.5517e-12 | NaN | not converged; cost test passes |
| 35 | MadNLP | 619021.0 | 624 | 142064 | 5 | 5.3164e-03 | false | above_reference | 5.3164e-03 | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 5.316383e-03, above the reference 2.624088e-12; predicted reduction / cost 1.00e+00 |
| 35 | NonlinearSolve (LM) | 2.56576045e7 | 2869 | 5889920 | 207 | 2.6241e-12 | true | ok | 1.7883e-19 | NaN | StalledSuccess |
| 35 | NonlinearSolve (TrustRegion) | 3.86925e6 | 155 | 213120 | 42 | 2.6241e-12 | true | ok | 3.0583e-23 | NaN | StalledSuccess |
| 35 | Optim (Newton) | 2.2207334e7 | 8790 | 712720 | 500 | 2.3971e-08 | false | not_converged | 2.3969e-08 | NaN | not converged; cost test passes |
| 35 | Optim (NewtonTrustRegion) | 1.08842208e8 | 35748 | 58039552 | 500 | 2.3326e-03 | false | not_converged | 2.3326e-03 | NaN | not converged |
| 35 | SecondOrderOptimization | 9.1226455e6 | 65884 | 2897520 | 17 | 2.6241e-12 | true | ok | 2.8227e-23 | NaN | abs\_dcost |
| 47 | CaNNOLeS | 9.697791e6 | 213 | 3009680 | 4 | 2.1405e-09 | true | ok | 2.1405e-09 | NaN | first\_order |
| 47 | Ipopt | 2.9087625e7 | 409 | 144064 | 3 | 4.7461e-11 | true | ok | 4.7461e-11 | NaN | acceptable |
| 47 | JSOSolvers (tron) | 1.769670583e9 | 130 | 34160 | 501 | 2.3696e-07 | false | not_converged | 2.3696e-07 | NaN | max\_iter; cost test passes |
| 47 | JSOSolvers (trunk) | 1.49302e9 | 65 | 25056 | 501 | 2.3689e-07 | false | not_converged | 2.3689e-07 | NaN | max\_iter; cost test passes |
| 47 | LeastSquaresOptim (Dogleg) | 3.4786875e6 | 276 | 1011664 | 13 | 3.7289e-22 | true | ok | 4.1022e-23 | NaN | converged |
| 47 | LeastSquaresOptim (LM) | 1.45535958e8 | 9525 | 32959296 | 500 | 2.3000e-12 | false | not_converged | 2.3000e-12 | NaN | not converged; cost test passes |
| 47 | MadNLP | 639708.0 | 608 | 221312 | 3 | 1.2168e-02 | false | above_reference | 1.2168e-02 | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 1.216765e-02, above the reference 2.158503e-22; predicted reduction / cost 1.00e+00 |
| 47 | NonlinearSolve (LM) | 4.7497791e7 | 2793 | 8126032 | 201 | 5.0704e-19 | true | ok | 4.9720e-19 | NaN | StalledSuccess |
| 47 | NonlinearSolve (TrustRegion) | 1.27685e7 | 155 | 361888 | 40 | 2.4957e-22 | true | ok | 4.7786e-23 | NaN | StalledSuccess |
| 47 | Optim (Newton) | 4.2278291e7 | 9030 | 341712 | 500 | 7.5873e-09 | false | not_converged | 7.5873e-09 | NaN | not converged; cost test passes |
| 47 | Optim (NewtonTrustRegion) | 1.64596709e8 | 35894 | 110274832 | 500 | 1.3719e-04 | false | not_converged | 1.3719e-04 | NaN | not converged |
| 47 | SecondOrderOptimization | 1.37548545e7 | 88348 | 4091392 | 17 | 3.9398e-22 | true | ok | 6.2353e-23 | NaN | abs\_dcost |
| 64 | CaNNOLeS | 1.784456045e8 | 218 | 5453664 | 36 | 3.7621e-09 | true | ok | 3.7621e-09 | NaN | first\_order |
| 64 | Ipopt | 3.37734375e7 | 311 | 162016 | 1 | 3.1266e-10 | true | ok | 3.1266e-10 | NaN | acceptable |
| 64 | JSOSolvers (tron) | 3.0847025e8 | 302 | 57072 | 56 | 1.1801e-09 | false | not_converged | 1.1801e-09 | NaN | small\_step; cost test passes |
| 64 | JSOSolvers (trunk) | 2.83914208e8 | 334 | 51680 | 314 | 1.1802e-09 | false | not_converged | 1.1802e-09 | NaN | not\_desc; cost test passes |
| 64 | LeastSquaresOptim (Dogleg) | 9.4888755e6 | 276 | 1217152 | 13 | 4.3565e-22 | true | ok | 7.0668e-23 | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 4.39405583e8 | 9525 | 36446240 | 500 | 4.5032e-12 | false | not_converged | 4.5032e-12 | NaN | not converged; cost test passes |
| 64 | MadNLP | 876395.5 | 608 | 388464 | 3 | 8.3922e-03 | false | above_reference | 8.3922e-03 | NaN | SOLVE\_SUCCEEDED; claimed convergence at cost 8.392249e-03, above the reference 3.041265e-22; predicted reduction / cost 1.00e+00 |
| 64 | NonlinearSolve (LM) | 1.02148166e8 | 2897 | 12231840 | 209 | 2.6454e-19 | true | ok | 2.6329e-19 | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 2.89984375e7 | 155 | 616528 | 40 | 3.2601e-22 | true | ok | 3.4573e-23 | NaN | StalledSuccess |
| 64 | Optim (Newton) | 1.26887542e8 | 9035 | 375568 | 500 | 5.0628e-10 | false | not_converged | 5.0628e-10 | NaN | not converged; cost test passes |
| 64 | Optim (NewtonTrustRegion) | 3.16216959e8 | 32709 | 160668896 | 500 | 1.8965e-06 | false | not_converged | 1.8965e-06 | NaN | not converged |
| 64 | SecondOrderOptimization | 2.3809667e7 | 120190 | 5910944 | 17 | 4.7630e-22 | true | ok | 2.6440e-23 | NaN | abs\_dcost |
