# Benchmark Results: Sparse Conditioning Sweep

- **Category**: large_sparse
- **Scaling Metric**: Condition Number κ
- **Optimizer Target Model**: Standalone (Sparse)
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:40:11
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
| 10.0 | JuMP | 2.6259e7 | 2 | 32 | 7.4607417e7 | 5 | 128 |
| 10.0 | NLLSModel (Sparse) | 81958.0 | 1 | 16 | 1.289375e6 | 1 | 64 |
| 10.0 | Standalone (Sparse) | 102584.0 | 1 | 16 | 1.96675e6 | 25 | 7897712 |
| 30.0 | JuMP | 2.6536625e7 | 2 | 32 | 7.4850208e7 | 5 | 128 |
| 30.0 | NLLSModel (Sparse) | 84375.0 | 1 | 16 | 1.31025e6 | 1 | 64 |
| 30.0 | Standalone (Sparse) | 102375.0 | 1 | 16 | 1.879291e6 | 25 | 7897712 |
| 100.0 | JuMP | 2.3682125e7 | 2 | 32 | 6.88695e7 | 5 | 128 |
| 100.0 | NLLSModel (Sparse) | 81834.0 | 1 | 16 | 1.293542e6 | 1 | 64 |
| 100.0 | Standalone (Sparse) | 98792.0 | 1 | 16 | 2.005792e6 | 25 | 7897712 |
| 300.0 | JuMP | 2.3598459e7 | 2 | 32 | 6.8683625e7 | 5 | 128 |
| 300.0 | NLLSModel (Sparse) | 81916.0 | 1 | 16 | 1.301167e6 | 1 | 64 |
| 300.0 | Standalone (Sparse) | 101625.0 | 1 | 16 | 1.897666e6 | 25 | 7897712 |
| 1000.0 | JuMP | 2.7458875e7 | 2 | 32 | 7.4232208e7 | 5 | 128 |
| 1000.0 | NLLSModel (Sparse) | 81875.0 | 1 | 16 | 1.302375e6 | 1 | 64 |
| 1000.0 | Standalone (Sparse) | 101458.0 | 1 | 16 | 1.887041e6 | 25 | 7897712 |
| 3000.0 | JuMP | 2.4034417e7 | 2 | 32 | 6.9357167e7 | 5 | 128 |
| 3000.0 | NLLSModel (Sparse) | 81833.0 | 1 | 16 | 1.310333e6 | 1 | 64 |
| 3000.0 | Standalone (Sparse) | 100584.0 | 1 | 16 | 1.888041e6 | 25 | 7897712 |
| 10000.0 | JuMP | 2.4692125e7 | 2 | 32 | 6.899e7 | 5 | 128 |
| 10000.0 | NLLSModel (Sparse) | 81834.0 | 1 | 16 | 1.299459e6 | 1 | 64 |
| 10000.0 | Standalone (Sparse) | 102125.0 | 1 | 16 | 1.86875e6 | 25 | 7897712 |
| 30000.0 | JuMP | 2.7504959e7 | 2 | 32 | 7.5282583e7 | 5 | 128 |
| 30000.0 | NLLSModel (Sparse) | 83416.0 | 1 | 16 | 1.309958e6 | 1 | 64 |
| 30000.0 | Standalone (Sparse) | 101083.0 | 1 | 16 | 1.877875e6 | 25 | 7897712 |
| 100000.0 | JuMP | 2.5890167e7 | 2 | 32 | 7.1871083e7 | 5 | 128 |
| 100000.0 | NLLSModel (Sparse) | 81834.0 | 1 | 16 | 1.316917e6 | 1 | 64 |
| 100000.0 | Standalone (Sparse) | 99792.0 | 1 | 16 | 2.020208e6 | 25 | 7897712 |
| 300000.0 | JuMP | 2.4227375e7 | 2 | 32 | 6.856075e7 | 5 | 128 |
| 300000.0 | NLLSModel (Sparse) | 81875.0 | 1 | 16 | 1.308584e6 | 1 | 64 |
| 300000.0 | Standalone (Sparse) | 101333.0 | 1 | 16 | 1.877292e6 | 25 | 7897712 |
| 1.0e6 | JuMP | 2.5037083e7 | 2 | 32 | 6.922325e7 | 5 | 128 |
| 1.0e6 | NLLSModel (Sparse) | 83416.0 | 1 | 16 | 1.31025e6 | 1 | 64 |
| 1.0e6 | Standalone (Sparse) | 101667.0 | 1 | 16 | 1.916916e6 | 25 | 7897712 |
| 3.0e6 | JuMP | 2.7286875e7 | 2 | 32 | 7.47095e7 | 5 | 128 |
| 3.0e6 | NLLSModel (Sparse) | 83500.0 | 1 | 16 | 1.299208e6 | 1 | 64 |
| 3.0e6 | Standalone (Sparse) | 106125.0 | 1 | 16 | 1.90875e6 | 25 | 7897712 |
| 1.0e7 | JuMP | 2.9498542e7 | 2 | 32 | 7.9518875e7 | 5 | 128 |
| 1.0e7 | NLLSModel (Sparse) | 81875.0 | 1 | 16 | 1.309542e6 | 1 | 64 |
| 1.0e7 | Standalone (Sparse) | 101167.0 | 1 | 16 | 1.958958e6 | 25 | 7897712 |
| 3.0e7 | JuMP | 2.8154917e7 | 2 | 32 | 7.6558334e7 | 5 | 128 |
| 3.0e7 | NLLSModel (Sparse) | 83458.0 | 1 | 16 | 1.311083e6 | 1 | 64 |
| 3.0e7 | Standalone (Sparse) | 104250.0 | 1 | 16 | 1.909583e6 | 25 | 7897712 |
| 1.0e8 | JuMP | 2.5153708e7 | 2 | 32 | 6.8430208e7 | 5 | 128 |
| 1.0e8 | NLLSModel (Sparse) | 81833.0 | 1 | 16 | 1.308917e6 | 1 | 64 |
| 1.0e8 | Standalone (Sparse) | 105500.0 | 1 | 16 | 1.898708e6 | 25 | 7897712 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 10.0 | CaNNOLeS | 1.34045958e8 | 258 | 41956224 | 3 | 1.4881e-20 | true | ok | NaN | 8.5278e-12 | first\_order |
| 10.0 | Ipopt | 1.548686045e8 | 379 | 16245680 | 1 | 9.3292e-02 | false | above_reference | NaN | 1.7202e-02 | acceptable; claimed convergence at cost 9.329156e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 10.0 | JSOSolvers (tron) | 2.364270291e9 | 435 | 6606080 | 12 | 3.4156e-16 | true | ok | NaN | 1.2673e-09 | first\_order |
| 10.0 | JSOSolvers (trunk) | 1.703568833e9 | 282 | 4468784 | 11 | 2.2400e-15 | true | ok | NaN | 3.4975e-09 | first\_order |
| 10.0 | LeastSquaresOptim (Dogleg) | 9.1157167e7 | 122 | 3456976 | 8 | 4.1853e-26 | true | ok | NaN | 1.4353e-14 | converged |
| 10.0 | LeastSquaresOptim (LM) | 9.0232167e7 | 203 | 3239264 | 20 | 4.8162e-15 | true | ok | NaN | 5.1809e-09 | converged |
| 10.0 | MadNLP | 2.743974795e8 | 645 | 20090416 | 3 | 2.2497e-17 | true | ok | NaN | 3.6137e-10 | SOLVE\_SUCCEEDED |
| 10.0 | NonlinearSolve (LM) | 3.8343711792e10 | 1220 | 193021680 | 3 | 5.1275e+01 | false | timeout | NaN | 5.4203e-01 | MaxTime |
| 10.0 | NonlinearSolve (TrustRegion) | 1.9055625e8 | 76014 | 143998416 | 16 | 9.6934e-28 | true | ok | NaN | 1.9526e-15 | Success |
| 10.0 | Optim (Newton) | 2.9722917e7 | 442 | 95039584 | 3 | 1.4881e-20 | true | ok | NaN | 8.5278e-12 | converged |
| 10.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 10.0 | SecondOrderOptimization | 6.2885125e7 | 300 | 65919952 | 3 | 2.8545e-20 | true | ok | NaN | 1.2404e-11 | grad\_tol |
| 30.0 | CaNNOLeS | 1.34178416e8 | 258 | 41956224 | 3 | 1.0951e-21 | true | ok | NaN | 7.1313e-12 | first\_order |
| 30.0 | Ipopt | 1.511890415e8 | 373 | 16245584 | 1 | 1.0428e-02 | false | above_reference | NaN | 1.7101e-02 | acceptable; claimed convergence at cost 1.042800e-02, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 30.0 | JSOSolvers (tron) | 4.186230833e9 | 673 | 6617504 | 13 | 1.2079e-14 | true | ok | NaN | 2.5108e-08 | first\_order |
| 30.0 | JSOSolvers (trunk) | 3.405776625e9 | 504 | 4479440 | 12 | 1.3528e-14 | true | ok | NaN | 2.2748e-08 | first\_order |
| 30.0 | LeastSquaresOptim (Dogleg) | 1.89920146e8 | 128 | 3467824 | 8 | 8.1400e-25 | true | ok | NaN | 1.7747e-13 | converged |
| 30.0 | LeastSquaresOptim (LM) | 2.02697458e8 | 237 | 3264576 | 22 | 1.1700e-13 | true | ok | NaN | 7.7314e-08 | converged |
| 30.0 | MadNLP | 2.752505005e8 | 645 | 20090416 | 3 | 1.7400e-18 | true | ok | NaN | 3.0339e-10 | SOLVE\_SUCCEEDED |
| 30.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 30.0 | NonlinearSolve (TrustRegion) | 2.34420229e8 | 76014 | 144473552 | 17 | 6.6933e-29 | true | ok | NaN | 6.2378e-16 | Success |
| 30.0 | Optim (Newton) | 2.9383416e7 | 442 | 95039584 | 3 | 1.0951e-21 | true | ok | NaN | 7.1313e-12 | converged |
| 30.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 30.0 | SecondOrderOptimization | 6.3507833e7 | 300 | 65919952 | 3 | 2.9290e-20 | true | ok | NaN | 3.9558e-11 | grad\_tol |
| 100.0 | CaNNOLeS | 1.466292285e8 | 258 | 41956224 | 3 | 8.7077e-23 | true | ok | NaN | 6.7524e-12 | first\_order |
| 100.0 | Ipopt | 1.66491542e8 | 373 | 16245584 | 1 | 9.4049e-04 | false | above_reference | NaN | 1.7089e-02 | acceptable; claimed convergence at cost 9.404879e-04, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 100.0 | JSOSolvers (tron) | 1.2532330959e10 | 1616 | 6662768 | 14 | 2.0915e-14 | true | ok | NaN | 1.0719e-07 | first\_order |
| 100.0 | JSOSolvers (trunk) | 8.323878e9 | 1060 | 4506128 | 11 | 1.8185e-13 | true | ok | NaN | 2.9311e-07 | first\_order |
| 100.0 | LeastSquaresOptim (Dogleg) | 4.48691375e8 | 142 | 3525392 | 8 | 2.2951e-22 | true | ok | NaN | 1.0786e-11 | converged |
| 100.0 | LeastSquaresOptim (LM) | 4.908125e8 | 260 | 3316944 | 21 | 2.0198e-12 | true | ok | NaN | 1.0749e-06 | converged |
| 100.0 | MadNLP | 2.590569375e8 | 645 | 20090416 | 3 | 1.3861e-19 | true | ok | NaN | 2.8584e-10 | SOLVE\_SUCCEEDED |
| 100.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 100.0 | NonlinearSolve (TrustRegion) | 1.97404083e8 | 75990 | 136100768 | 16 | 1.6352e-26 | true | ok | NaN | 7.4131e-14 | Success |
| 100.0 | Optim (Newton) | 2.93136255e7 | 414 | 95039136 | 3 | 8.7076e-23 | true | ok | NaN | 6.7523e-12 | converged |
| 100.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 100.0 | SecondOrderOptimization | 6.246775e7 | 300 | 65919952 | 3 | 5.1131e-19 | true | ok | NaN | 5.5211e-10 | grad\_tol |
| 300.0 | CaNNOLeS | 1.425963955e8 | 258 | 41956224 | 3 | 9.3572e-24 | true | ok | NaN | 6.6523e-12 | first\_order |
| 300.0 | Ipopt | 1.5920975e8 | 373 | 16245584 | 1 | 1.0456e-04 | false | above_reference | NaN | 1.7088e-02 | acceptable; claimed convergence at cost 1.045612e-04, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 300.0 | JSOSolvers (tron) | 2.7110713292e10 | 3425 | 6749600 | 17 | 9.7207e-13 | true | ok | NaN | 2.1148e-06 | first\_order |
| 300.0 | JSOSolvers (trunk) | 1.9741579667e10 | 2465 | 4573568 | 12 | 2.2449e-12 | true | ok | NaN | 3.3655e-06 | first\_order |
| 300.0 | LeastSquaresOptim (Dogleg) | 9.38171083e8 | 146 | 3623760 | 8 | 2.1497e-19 | true | ok | NaN | 1.0342e-09 | converged |
| 300.0 | LeastSquaresOptim (LM) | 1.110557375e9 | 288 | 3483360 | 21 | 3.0256e-11 | true | ok | NaN | 1.2512e-05 | converged |
| 300.0 | MadNLP | 2.612510835e8 | 645 | 20090416 | 3 | 1.4878e-20 | true | ok | NaN | 2.8103e-10 | SOLVE\_SUCCEEDED |
| 300.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 300.0 | NonlinearSolve (TrustRegion) | 2.11731667e8 | 75990 | 136149920 | 16 | 1.7336e-27 | true | ok | NaN | 7.0465e-14 | Success |
| 300.0 | Optim (Newton) | 2.71809021e8 | 414 | 95039136 | 3 | 9.3571e-24 | true | ok | NaN | 6.6524e-12 | converged |
| 300.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 300.0 | SecondOrderOptimization | 6.4332208e7 | 300 | 65919952 | 3 | 1.9218e-16 | true | ok | NaN | 3.2049e-08 | grad\_tol |
| 1000.0 | CaNNOLeS | 1.53519167e8 | 262 | 41956288 | 3 | 8.3255e-25 | true | ok | NaN | 6.6176e-12 | first\_order |
| 1000.0 | Ipopt | 1.70584958e8 | 373 | 16245584 | 1 | 9.4125e-06 | false | above_reference | NaN | 1.7088e-02 | acceptable; claimed convergence at cost 9.412456e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 1000.0 | JSOSolvers (tron) | 3.0134375833e10 | 3668 | 6761264 | 8 | 9.6300e-08 | false | timeout | NaN | 2.3880e-03 | max\_time; cost test passes |
| 1000.0 | JSOSolvers (trunk) | 3.0052354417e10 | 3659 | 4630880 | 10 | 8.6135e-09 | false | timeout | NaN | 6.4760e-04 | max\_time; cost test passes |
| 1000.0 | LeastSquaresOptim (Dogleg) | 1.921847084e9 | 162 | 3908688 | 8 | 1.5122e-16 | true | ok | NaN | 6.8224e-08 | converged |
| 1000.0 | LeastSquaresOptim (LM) | 2.393799042e9 | 279 | 3477872 | 20 | 6.0209e-10 | true | ok | NaN | 1.8641e-04 | converged |
| 1000.0 | MadNLP | 1.92141834e8 | 637 | 20090256 | 2 | 3.1538e-11 | true | ok | NaN | 4.3114e-05 | SOLVE\_SUCCEEDED |
| 1000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1000.0 | NonlinearSolve (TrustRegion) | 2.03604458e8 | 75990 | 136100768 | 16 | 2.0699e-28 | true | ok | NaN | 6.9332e-14 | Success |
| 1000.0 | Optim (Newton) | 2.0221375e7 | 307 | 68625264 | 2 | 2.5858e-12 | true | ok | NaN | 1.1489e-05 | converged |
| 1000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1000.0 | SecondOrderOptimization | 6.237275e7 | 300 | 65919952 | 3 | 4.3721e-12 | true | ok | NaN | 1.6083e-05 | grad\_tol |
| 3000.0 | CaNNOLeS | 1.417825005e8 | 262 | 41956288 | 3 | 9.2141e-26 | true | ok | NaN | 6.6012e-12 | first\_order |
| 3000.0 | Ipopt | 1.59116646e8 | 373 | 16245584 | 1 | 1.0459e-06 | false | above_reference | NaN | 1.7087e-02 | acceptable; claimed convergence at cost 1.045885e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 3000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3000.0 | LeastSquaresOptim (Dogleg) | 3.610950625e9 | 166 | 4154512 | 8 | 4.0231e-13 | true | ok | NaN | 1.1970e-05 | converged |
| 3000.0 | LeastSquaresOptim (LM) | 4.65457225e9 | 284 | 3862240 | 19 | 7.6653e-09 | true | ok | NaN | 2.0043e-03 | converged |
| 3000.0 | MadNLP | 1.81329459e8 | 637 | 20090256 | 2 | 3.4976e-12 | true | ok | NaN | 4.3075e-05 | SOLVE\_SUCCEEDED |
| 3000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 3000.0 | NonlinearSolve (TrustRegion) | 2.10657375e8 | 75990 | 136100768 | 15 | 9.1028e-27 | true | ok | NaN | 1.6561e-12 | Success |
| 3000.0 | Optim (Newton) | 2.0303459e7 | 331 | 68625648 | 2 | 2.8663e-13 | true | ok | NaN | 1.1479e-05 | converged |
| 3000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 3000.0 | SecondOrderOptimization | 8.0000666e7 | 336 | 75864000 | 4 | 1.1376e-13 | true | ok | NaN | 7.7833e-06 | grad\_tol |
| 10000.0 | CaNNOLeS | 1.15267333e8 | 256 | 41956128 | 2 | 2.5757e-14 | true | ok | NaN | 1.1468e-05 | first\_order |
| 10000.0 | Ipopt | 1.6770675e8 | 373 | 16245584 | 1 | 9.4130e-08 | true | ok | NaN | 1.7085e-02 | acceptable |
| 10000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 10000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 10000.0 | LeastSquaresOptim (Dogleg) | 7.086415916e9 | 178 | 4564304 | 8 | 1.5828e-09 | true | ok | NaN | 2.9657e-03 | converged |
| 10000.0 | LeastSquaresOptim (LM) | 7.823669917e9 | 276 | 4368320 | 18 | 3.7362e-07 | true | ok | NaN | 4.6664e-02 | converged |
| 10000.0 | MadNLP | 2.1504825e8 | 637 | 20090256 | 2 | 3.1432e-13 | true | ok | NaN | 4.3033e-05 | SOLVE\_SUCCEEDED |
| 10000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 10000.0 | NonlinearSolve (TrustRegion) | 2.63196271e8 | 75990 | 136149920 | 15 | 9.0353e-28 | true | ok | NaN | 1.6467e-12 | Success |
| 10000.0 | Optim (Newton) | 2.1266396e7 | 307 | 68625264 | 2 | 2.5757e-14 | true | ok | NaN | 1.1468e-05 | converged |
| 10000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 10000.0 | SecondOrderOptimization | 1.02165167e8 | 372 | 85808048 | 5 | 1.7844e-14 | true | ok | NaN | 1.0273e-05 | grad\_tol |
| 30000.0 | CaNNOLeS | 1.16381271e8 | 256 | 41956128 | 2 | 2.8548e-15 | true | ok | NaN | 1.1445e-05 | first\_order |
| 30000.0 | Ipopt | 1.75226625e8 | 373 | 16245584 | 1 | 1.0458e-08 | true | ok | NaN | 1.7078e-02 | acceptable |
| 30000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 30000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 30000.0 | LeastSquaresOptim (Dogleg) | 7.029892333e9 | 171 | 4819456 | 7 | 7.7972e-07 | true | ok | NaN | 2.0185e-01 | converged |
| 30000.0 | LeastSquaresOptim (LM) | 3.94532708e8 | 133 | 3263136 | 9 | 1.3042e-05 | false | above_reference | NaN | 8.1619e-01 | converged; claimed convergence at cost 1.304240e-05, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 30000.0 | MadNLP | 2.01781666e8 | 637 | 20090256 | 2 | 3.4829e-14 | true | ok | NaN | 4.2940e-05 | SOLVE\_SUCCEEDED |
| 30000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 30000.0 | NonlinearSolve (TrustRegion) | 1.94241375e8 | 76014 | 143998416 | 15 | 2.1352e-28 | true | ok | NaN | 2.3166e-12 | Success |
| 30000.0 | Optim (Newton) | 2.0364833e7 | 307 | 68625264 | 2 | 2.8546e-15 | true | ok | NaN | 1.1444e-05 | converged |
| 30000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 30000.0 | SecondOrderOptimization | 4.4878875e7 | 264 | 55975904 | 2 | 1.1887e-05 | false | above_reference | NaN | 7.7955e-01 | grad\_tol; claimed convergence at cost 1.188672e-05, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 100000.0 | CaNNOLeS | 1.14346959e8 | 256 | 41956128 | 2 | 2.5488e-16 | true | ok | NaN | 1.1365e-05 | first\_order |
| 100000.0 | Ipopt | 1.61710208e8 | 373 | 16245584 | 1 | 9.4107e-10 | true | ok | NaN | 1.7054e-02 | acceptable |
| 100000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 100000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 100000.0 | LeastSquaresOptim (Dogleg) | 9.58603104e8 | 126 | 3550288 | 6 | 1.1771e-06 | false | above_reference | NaN | 8.1649e-01 | converged; claimed convergence at cost 1.177141e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 100000.0 | LeastSquaresOptim (LM) | 3.45655917e8 | 127 | 3244016 | 9 | 1.1772e-06 | false | above_reference | NaN | 8.1649e-01 | converged; claimed convergence at cost 1.177159e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 100000.0 | MadNLP | 1.96772292e8 | 637 | 20090256 | 2 | 3.1067e-15 | true | ok | NaN | 4.2636e-05 | SOLVE\_SUCCEEDED |
| 100000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 100000.0 | NonlinearSolve (TrustRegion) | 2.03364084e8 | 76014 | 144195024 | 14 | 1.5983e-26 | true | ok | NaN | 8.0990e-11 | Success |
| 100000.0 | Optim (Newton) | 2.047475e7 | 331 | 68625648 | 2 | 2.5494e-16 | true | ok | NaN | 1.1366e-05 | converged |
| 100000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 100000.0 | SecondOrderOptimization | 4.45118545e7 | 264 | 55975904 | 2 | 1.1671e-06 | false | above_reference | NaN | 8.1304e-01 | grad\_tol; claimed convergence at cost 1.167118e-06, above the reference 0.000000e+00; predicted reduction / cost 1.00e+00 |
| 300000.0 | CaNNOLeS | 1.16338292e8 | 256 | 41956128 | 2 | 2.7693e-17 | true | ok | NaN | 1.1147e-05 | first\_order |
| 300000.0 | Ipopt | 1.698159375e8 | 373 | 16245584 | 1 | 1.0450e-10 | true | ok | NaN | 1.6987e-02 | acceptable |
| 300000.0 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 300000.0 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 300000.0 | LeastSquaresOptim (Dogleg) | 3.49460959e8 | 118 | 3492816 | 6 | 1.3158e-07 | true | ok | NaN | 8.1650e-01 | converged |
| 300000.0 | LeastSquaresOptim (LM) | 4.0084875e8 | 135 | 3248608 | 10 | 1.3158e-07 | true | ok | NaN | 8.1650e-01 | converged |
| 300000.0 | MadNLP | 1.79620792e8 | 637 | 20090256 | 2 | 3.3688e-16 | true | ok | NaN | 4.1822e-05 | SOLVE\_SUCCEEDED |
| 300000.0 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 300000.0 | NonlinearSolve (TrustRegion) | 1.95294e8 | 76014 | 144047568 | 14 | 1.6553e-27 | true | ok | NaN | 7.4153e-11 | Success |
| 300000.0 | Optim (Newton) | 2.01899165e7 | 307 | 68625264 | 2 | 2.7801e-17 | true | ok | NaN | 1.1173e-05 | converged |
| 300000.0 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 300000.0 | SecondOrderOptimization | 4.51216875e7 | 264 | 55975904 | 2 | 1.3146e-07 | true | ok | NaN | 8.1611e-01 | grad\_tol |
| 1.0e6 | CaNNOLeS | 1.19161708e8 | 256 | 41956128 | 2 | 2.3132e-18 | true | ok | NaN | 1.0477e-05 | first\_order |
| 1.0e6 | Ipopt | 1.71311208e8 | 373 | 16245584 | 1 | 9.3860e-12 | true | ok | NaN | 1.6762e-02 | acceptable |
| 1.0e6 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e6 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e6 | LeastSquaresOptim (Dogleg) | 4.0637175e8 | 123 | 3536640 | 7 | 1.2091e-08 | true | ok | NaN | 8.1650e-01 | converged |
| 1.0e6 | LeastSquaresOptim (LM) | 4.67975375e8 | 141 | 3284400 | 11 | 1.2091e-08 | true | ok | NaN | 8.1650e-01 | converged |
| 1.0e6 | MadNLP | 1.81768542e8 | 637 | 20090256 | 2 | 2.7794e-17 | true | ok | NaN | 3.9234e-05 | SOLVE\_SUCCEEDED |
| 1.0e6 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1.0e6 | NonlinearSolve (TrustRegion) | 2.01015584e8 | 76072 | 143999344 | 14 | 1.6785e-28 | true | ok | NaN | 5.8222e-11 | Success |
| 1.0e6 | Optim (Newton) | 2.02981045e7 | 328 | 68625600 | 2 | 2.3210e-18 | true | ok | NaN | 1.0499e-05 | converged |
| 1.0e6 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1.0e6 | SecondOrderOptimization | 4.4442917e7 | 264 | 55975904 | 2 | 1.2090e-08 | true | ok | NaN | 8.1647e-01 | grad\_tol |
| 3.0e6 | CaNNOLeS | 1.21319333e8 | 256 | 41956128 | 2 | 2.1261e-19 | true | ok | NaN | 9.0489e-06 | first\_order |
| 3.0e6 | Ipopt | 1.75972e8 | 373 | 16245584 | 1 | 1.0364e-12 | true | ok | NaN | 1.6170e-02 | acceptable |
| 3.0e6 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e6 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e6 | LeastSquaresOptim (Dogleg) | 5.38982958e8 | 123 | 3536640 | 7 | 1.4240e-09 | true | ok | NaN | 8.1650e-01 | converged |
| 3.0e6 | LeastSquaresOptim (LM) | 6.381082705e8 | 150 | 3289888 | 12 | 1.4240e-09 | true | ok | NaN | 8.1650e-01 | converged |
| 3.0e6 | MadNLP | 1.18736416e8 | 629 | 20090096 | 1 | 1.0469e-12 | true | ok | NaN | 1.6332e-02 | SOLVE\_SUCCEEDED |
| 3.0e6 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 3.0e6 | NonlinearSolve (TrustRegion) | 2.37836187e8 | 76014 | 144047568 | 13 | 8.0828e-27 | true | ok | NaN | 1.5355e-09 | Success |
| 3.0e6 | Optim (Newton) | 1.156725e7 | 200 | 42211392 | 1 | 1.0214e-12 | true | ok | NaN | 1.5935e-02 | converged |
| 3.0e6 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 3.0e6 | SecondOrderOptimization | 4.5413834e7 | 264 | 55975904 | 2 | 1.4239e-09 | true | ok | NaN | 8.1650e-01 | grad\_tol |
| 1.0e7 | CaNNOLeS | 8.3407333e7 | 254 | 41956032 | 1 | 9.0793e-14 | true | ok | NaN | 1.4401e-02 | first\_order |
| 1.0e7 | Ipopt | 1.76903459e8 | 373 | 16245584 | 1 | 9.1042e-14 | true | ok | NaN | 1.4437e-02 | first\_order |
| 1.0e7 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e7 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e7 | LeastSquaresOptim (Dogleg) | 7.48787875e8 | 123 | 3536640 | 7 | 1.5519e-10 | true | ok | NaN | 8.1650e-01 | converged |
| 1.0e7 | LeastSquaresOptim (LM) | 8.85370417e8 | 170 | 3304480 | 14 | 1.5519e-10 | true | ok | NaN | 8.1650e-01 | converged |
| 1.0e7 | MadNLP | 1.32941271e8 | 629 | 20090096 | 1 | 8.9273e-14 | true | ok | NaN | 1.4149e-02 | SOLVE\_SUCCEEDED |
| 1.0e7 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1.0e7 | NonlinearSolve (TrustRegion) | 5.724589795e8 | 76386 | 262512480 | 27 | 5.0785e-27 | true | ok | NaN | 4.0136e-09 | Success |
| 1.0e7 | Optim (Newton) | 1.1516333e7 | 200 | 42211392 | 1 | 9.2898e-14 | true | ok | NaN | 1.4727e-02 | converged |
| 1.0e7 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1.0e7 | SecondOrderOptimization | 4.6199458e7 | 264 | 55975904 | 2 | 1.5516e-10 | true | ok | NaN | 8.1650e-01 | grad\_tol |
| 3.0e7 | CaNNOLeS | 7.9912291e7 | 254 | 41956032 | 1 | 1.0047e-14 | true | ok | NaN | 1.1714e-02 | first\_order |
| 3.0e7 | Ipopt | 1.71617292e8 | 373 | 16245584 | 1 | 9.3352e-15 | true | ok | NaN | 1.0944e-02 | first\_order |
| 3.0e7 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e7 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 3.0e7 | LeastSquaresOptim (Dogleg) | 9.422442915e8 | 125 | 3618592 | 7 | 2.7406e-11 | true | ok | NaN | 8.1650e-01 | converged |
| 3.0e7 | LeastSquaresOptim (LM) | 1.122462541e9 | 183 | 3395536 | 15 | 2.7405e-11 | true | ok | NaN | 8.1650e-01 | converged |
| 3.0e7 | MadNLP | 1.29399041e8 | 629 | 20090096 | 1 | 1.1873e-14 | true | ok | NaN | 1.4751e-02 | SOLVE\_SUCCEEDED |
| 3.0e7 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 3.0e7 | NonlinearSolve (TrustRegion) | 7.140518335e8 | 76398 | 270409936 | 27 | 4.6879e-28 | true | ok | NaN | 2.1643e-09 | Success |
| 3.0e7 | Optim (Newton) | 1.14444375e7 | 200 | 42211392 | 1 | 5.1495e-15 | true | ok | NaN | 3.4344e-03 | converged |
| 3.0e7 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 3.0e7 | SecondOrderOptimization | 4.49809375e7 | 264 | 55975904 | 2 | 2.7397e-11 | true | ok | NaN | 8.1650e-01 | grad\_tol |
| 1.0e8 | CaNNOLeS | 8.448075e7 | 254 | 41956032 | 1 | 6.8207e-16 | true | ok | NaN | 6.5590e-03 | first\_order |
| 1.0e8 | Ipopt | 1.69816646e8 | 373 | 16245584 | 1 | 5.8955e-16 | true | ok | NaN | 5.2870e-03 | first\_order |
| 1.0e8 | JSOSolvers (tron) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e8 | JSOSolvers (trunk) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 1000.0 |
| 1.0e8 | LeastSquaresOptim (Dogleg) | 1.150049958e9 | 127 | 3667776 | 7 | 7.3287e-12 | true | ok | NaN | 8.1650e-01 | converged |
| 1.0e8 | LeastSquaresOptim (LM) | 1.071711291e9 | 181 | 3381168 | 15 | 7.3337e-12 | true | ok | NaN | 8.1650e-01 | converged |
| 1.0e8 | MadNLP | 1.04793604e8 | 629 | 20090096 | 1 | 6.3230e-16 | true | ok | NaN | 6.4770e-03 | SOLVE\_SUCCEEDED |
| 1.0e8 | NonlinearSolve (LM) | NaN | 0 | 0 | 0 | NaN | false | timeout | NaN | NaN | timed out at size 10.0 |
| 1.0e8 | NonlinearSolve (TrustRegion) | 7.9012625e8 | 76398 | 270409936 | 28 | 5.0510e-27 | true | ok | NaN | 4.6371e-08 | Success |
| 1.0e8 | Optim (Newton) | 1.1232125e7 | 200 | 42211392 | 1 | 1.9118e-15 | true | ok | NaN | 1.4440e-02 | converged |
| 1.0e8 | Optim (NewtonTrustRegion) | NaN | 0 | 0 | 0 | NaN | false | skipped | NaN | NaN | NewtonTrustRegion needs a dense Hessian |
| 1.0e8 | SecondOrderOptimization | 4.4501667e7 | 264 | 55975904 | 2 | 7.3252e-12 | true | ok | NaN | 8.1650e-01 | grad\_tol |
