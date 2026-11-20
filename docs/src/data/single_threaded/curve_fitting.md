# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T17:29:25
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
| 64 | JuMP | 9667.0 | 2 | 32 | 20958.0 | 5 | 128 |
| 64 | NLLSModel (Static) | 333.344262295082 | 1 | 16 | 1383.3333333333333 | 1 | 32 |
| 64 | Standalone | 335.37704918032784 | 1 | 16 | 1443.4285714285713 | 1 | 32 |
| 128 | JuMP | 18500.0 | 2 | 32 | 41041.0 | 5 | 128 |
| 128 | NLLSModel (Static) | 585.7142857142857 | 1 | 16 | 3224.0 | 1 | 32 |
| 128 | Standalone | 648.2941176470588 | 1 | 16 | 2732.1428571428573 | 1 | 32 |
| 256 | JuMP | 36875.0 | 2 | 32 | 80667.0 | 5 | 128 |
| 256 | NLLSModel (Static) | 1106.4444444444443 | 1 | 16 | 5375.0 | 1 | 32 |
| 256 | Standalone | 1134.2777777777778 | 1 | 16 | 5364.5 | 1 | 32 |
| 512 | JuMP | 70500.0 | 2 | 32 | 165875.0 | 5 | 128 |
| 512 | NLLSModel (Static) | 2152.777777777778 | 1 | 16 | 12708.0 | 1 | 32 |
| 512 | Standalone | 2250.0 | 1 | 16 | 11000.0 | 1 | 32 |
| 1024 | JuMP | 150208.0 | 2 | 32 | 321083.0 | 5 | 128 |
| 1024 | NLLSModel (Static) | 4233.4 | 1 | 16 | 21083.0 | 1 | 32 |
| 1024 | Standalone | 4408.4 | 1 | 16 | 22583.0 | 1 | 32 |
| 2048 | JuMP | 309833.0 | 2 | 32 | 736958.0 | 5 | 128 |
| 2048 | NLLSModel (Static) | 8416.666666666666 | 1 | 16 | 43666.0 | 1 | 32 |
| 2048 | Standalone | 8805.333333333334 | 1 | 16 | 72458.0 | 1 | 32 |
| 4096 | JuMP | 1.356625e6 | 2 | 32 | 2.675291e6 | 5 | 128 |
| 4096 | NLLSModel (Static) | 16750.0 | 1 | 16 | 78750.0 | 1 | 32 |
| 4096 | Standalone | 17792.0 | 1 | 16 | 88334.0 | 1 | 32 |
| 8192 | JuMP | 3.745833e6 | 2 | 32 | 1.0531208e7 | 5 | 128 |
| 8192 | NLLSModel (Static) | 34417.0 | 1 | 16 | 171750.0 | 1 | 32 |
| 8192 | Standalone | 36083.0 | 1 | 16 | 172833.0 | 1 | 32 |
| 16384 | JuMP | 9.179584e6 | 2 | 32 | 2.5070666e7 | 5 | 128 |
| 16384 | NLLSModel (Static) | 69083.0 | 1 | 16 | 326750.0 | 1 | 32 |
| 16384 | Standalone | 74875.0 | 1 | 16 | 346250.0 | 1 | 32 |
| 32768 | JuMP | 2.019075e7 | 2 | 32 | 5.7671708e7 | 5 | 128 |
| 32768 | NLLSModel (Static) | 138250.0 | 1 | 16 | 667583.0 | 1 | 32 |
| 32768 | Standalone | 140834.0 | 1 | 16 | 702459.0 | 1 | 32 |
| 65536 | JuMP | 5.037025e7 | 2 | 32 | 1.37288333e8 | 5 | 128 |
| 65536 | NLLSModel (Static) | 281583.0 | 1 | 16 | 1.375792e6 | 1 | 32 |
| 65536 | Standalone | 296708.0 | 1 | 16 | 1.496667e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 64 | CaNNOLeS | 128729.0 | 198 | 79408 | 6 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 1.2732085e6 | 521 | 57872 | 5 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 219271.0 | 214 | 14224 | 7 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 141812.5 | 115 | 8512 | 6 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | LeastSquaresOptim (Dogleg) | 18000.0 | 115 | 258976 | 5 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 23458.0 | 147 | 360688 | 7 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | MadNLP | 618208.0 | 655 | 51152 | 7 | 1.3405e-02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 439166.5 | 1246 | 210736 | 120 | 1.3405e-02 | true | ok | NaN | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 220792.0 | 1563 | 4094928 | 16 | 1.3405e-02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 64 | Optim (Newton) | 24583.0 | 116 | 4816 | 6 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 29437.5 | 225 | 15792 | 5 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | SecondOrderOptimization | 9542.0 | 32 | 2064 | 5 | 1.3405e-02 | true | ok | NaN | NaN | rel\_dcost |
| 128 | CaNNOLeS | 214041.5 | 205 | 137168 | 5 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 1.9921875e6 | 523 | 78320 | 5 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 547062.0 | 232 | 18896 | 7 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 361729.0 | 122 | 12112 | 7 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | LeastSquaresOptim (Dogleg) | 28083.5 | 116 | 262080 | 5 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 38333.5 | 148 | 364272 | 7 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | MadNLP | 781187.5 | 653 | 51088 | 6 | 2.5926e-02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 621979.0 | 1223 | 337568 | 117 | 2.5926e-02 | true | ok | NaN | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 203000.0 | 885 | 2266704 | 9 | 2.5926e-02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 128 | Optim (Newton) | 30562.5 | 103 | 4400 | 5 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 32125.0 | 197 | 13584 | 4 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | SecondOrderOptimization | 16229.0 | 32 | 2064 | 5 | 2.5926e-02 | true | ok | NaN | NaN | rel\_dcost |
| 256 | CaNNOLeS | 420458.5 | 235 | 285072 | 5 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 3.3814585e6 | 561 | 152752 | 5 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | 1.0105625e6 | 227 | 25264 | 6 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (trunk) | 716208.5 | 128 | 18064 | 7 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | LeastSquaresOptim (Dogleg) | 48604.0 | 119 | 268128 | 5 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 74792.0 | 169 | 422272 | 8 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | MadNLP | 2.043625e6 | 791 | 53488 | 12 | 5.5410e-02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 1.025083e6 | 1465 | 712800 | 117 | 5.5410e-02 | true | ok | NaN | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 482959.0 | 1587 | 4213872 | 11 | 5.5410e-02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 256 | Optim (Newton) | 50125.5 | 103 | 4400 | 5 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 45792.0 | 197 | 13584 | 4 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | SecondOrderOptimization | 29979.0 | 32 | 2064 | 5 | 5.5410e-02 | true | ok | NaN | NaN | rel\_dcost |
| 512 | CaNNOLeS | 897354.5 | 244 | 589920 | 6 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | Ipopt | 5.778625e6 | 563 | 303760 | 5 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (tron) | 1.5910835e6 | 212 | 38880 | 5 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (trunk) | 1.665375e6 | 144 | 31056 | 9 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | LeastSquaresOptim (Dogleg) | 89000.0 | 119 | 280416 | 5 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 121271.0 | 151 | 385168 | 7 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | MadNLP | 3.082917e6 | 741 | 52656 | 11 | 1.0665e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 1.887458e6 | 1465 | 1357408 | 117 | 1.0665e-01 | true | ok | NaN | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 2.219291e6 | 3149 | 9589664 | 59 | 1.0665e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 512 | Optim (Newton) | 106291.5 | 116 | 4816 | 6 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 89708.5 | 225 | 15792 | 5 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | SecondOrderOptimization | 57875.0 | 32 | 2064 | 5 | 1.0665e-01 | true | ok | NaN | NaN | rel\_dcost |
| 1024 | CaNNOLeS | 1.647521e6 | 242 | 1149952 | 5 | 2.0673e-01 | true | ok | NaN | NaN | first\_order |
| 1024 | Ipopt | 1.13902505e7 | 567 | 486768 | 5 | 2.0673e-01 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (tron) | 4.0261665e6 | 233 | 68560 | 6 | 2.0673e-01 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (trunk) | 7.2716e7 | 3264 | 211440 | 325 | 2.0673e-01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 1024 | LeastSquaresOptim (Dogleg) | 173500.0 | 119 | 304992 | 5 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 235792.0 | 151 | 412816 | 7 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | MadNLP | 3.5841875e6 | 665 | 51280 | 6 | 2.0673e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 3.3597915e6 | 1465 | 2646624 | 117 | 2.0673e-01 | true | ok | NaN | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 1.50575e6 | 1543 | 5815760 | 8 | 2.0673e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 1024 | Optim (Newton) | 164167.0 | 103 | 4400 | 5 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 128458.5 | 197 | 13584 | 4 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | SecondOrderOptimization | 109833.0 | 32 | 2064 | 5 | 2.0673e-01 | true | ok | NaN | NaN | rel\_dcost |
| 2048 | CaNNOLeS | 4.214021e6 | 246 | 2139264 | 6 | 4.1154e-01 | true | ok | NaN | NaN | first\_order |
| 2048 | Ipopt | 2.5246041e7 | 571 | 971696 | 5 | 4.1154e-01 | true | ok | NaN | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 4.2492291e7 | 769 | 156512 | 24 | 4.1154e-01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 2048 | JSOSolvers (trunk) | 4.8914585e6 | 115 | 103392 | 5 | 4.1154e-01 | true | ok | NaN | NaN | first\_order |
| 2048 | LeastSquaresOptim (Dogleg) | 478750.0 | 119 | 354144 | 5 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 659895.5 | 151 | 476304 | 7 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | MadNLP | 6.9102715e6 | 665 | 51280 | 6 | 4.1154e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 6.757229e6 | 1454 | 5208208 | 116 | 4.1154e-01 | true | ok | NaN | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 3.11801958e8 | 1455 | 7643280 | 9 | 4.1154e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 2048 | Optim (Newton) | 575458.0 | 116 | 4816 | 6 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 461000.0 | 225 | 15792 | 5 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | SecondOrderOptimization | 220208.5 | 32 | 2064 | 5 | 4.1154e-01 | true | ok | NaN | NaN | rel\_dcost |
| 4096 | CaNNOLeS | 1.16299165e7 | 246 | 4224064 | 5 | 8.3061e-01 | true | ok | NaN | NaN | first\_order |
| 4096 | Ipopt | 5.828675e7 | 575 | 2047984 | 5 | 8.3061e-01 | true | ok | NaN | NaN | first\_order |
| 4096 | JSOSolvers (tron) | 1.54287334e8 | 822 | 273744 | 28 | 8.3061e-01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 4096 | JSOSolvers (trunk) | 4.4572575e8 | 3301 | 360672 | 330 | 8.3061e-01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4096 | LeastSquaresOptim (Dogleg) | 952208.5 | 119 | 452448 | 5 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 1.310416e6 | 151 | 586896 | 7 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | MadNLP | 2.9102208e7 | 673 | 51440 | 7 | 8.3061e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 1.2336229e7 | 1465 | 12323424 | 117 | 8.3061e-01 | true | ok | NaN | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion) | 3.772583e6 | 905 | 7416256 | 7 | 8.3061e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 4096 | Optim (Newton) | 714583.0 | 103 | 4400 | 5 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 841020.5 | 225 | 15792 | 5 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | SecondOrderOptimization | 513562.5 | 32 | 2064 | 5 | 8.3061e-01 | true | ok | NaN | NaN | rel\_dcost |
| 8192 | CaNNOLeS | 3.88901255e7 | 250 | 7910592 | 6 | 1.6555e+00 | true | ok | NaN | NaN | first\_order |
| 8192 | Ipopt | 1.29885479e8 | 579 | 3873200 | 5 | 1.6555e+00 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (tron) | 1.281349585e8 | 252 | 470880 | 7 | 1.6555e+00 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (trunk) | 1.959458166e9 | 3303 | 557360 | 331 | 1.6555e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8192 | LeastSquaresOptim (Dogleg) | 1.407083e6 | 119 | 649056 | 5 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 2.076229e6 | 151 | 783504 | 7 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | MadNLP | 8.8285896e7 | 673 | 51440 | 7 | 1.6555e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | 2.4332667e7 | 1465 | 20646496 | 117 | 1.6555e+00 | true | ok | NaN | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion) | 7.722833e6 | 949 | 13416544 | 8 | 1.6555e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 8192 | Optim (Newton) | 1.4511665e6 | 116 | 4816 | 6 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 910646.0 | 197 | 13584 | 4 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | SecondOrderOptimization | 875479.0 | 32 | 2064 | 5 | 1.6555e+00 | true | ok | NaN | NaN | rel\_dcost |
| 16384 | CaNNOLeS | 9.12036665e7 | 252 | 15316192 | 6 | 3.3011e+00 | true | ok | NaN | NaN | first\_order |
| 16384 | Ipopt | 2.663480835e8 | 595 | 7541872 | 5 | 3.3011e+00 | true | ok | NaN | NaN | first\_order |
| 16384 | JSOSolvers (tron) | 1.373221625e9 | 746 | 958224 | 20 | 3.3011e+00 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 16384 | JSOSolvers (trunk) | 5.707477833e9 | 3233 | 947232 | 321 | 3.3011e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 16384 | LeastSquaresOptim (Dogleg) | 2.902479e6 | 119 | 1042272 | 5 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 3.8767495e6 | 151 | 1176720 | 7 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | MadNLP | 2.67244687e8 | 711 | 52080 | 8 | 3.3011e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | 5.02223955e7 | 1454 | 36997264 | 116 | 3.3011e+00 | true | ok | NaN | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion) | 1.5420333e7 | 905 | 23538112 | 8 | 3.3011e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 16384 | Optim (Newton) | 3.1788335e6 | 136 | 5328 | 6 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 1.762396e6 | 197 | 13584 | 4 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | SecondOrderOptimization | 1.721396e6 | 32 | 2064 | 5 | 3.3011e+00 | true | ok | NaN | NaN | rel\_dcost |
| 32768 | CaNNOLeS | 1.91096791e8 | 254 | 32175360 | 6 | 6.5496e+00 | true | ok | NaN | NaN | first\_order |
| 32768 | Ipopt | 5.317301455e8 | 599 | 14860464 | 5 | 6.5496e+00 | true | ok | NaN | NaN | first\_order |
| 32768 | JSOSolvers (tron) | 3.333453167e9 | 748 | 1875824 | 24 | 6.5496e+00 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 32768 | JSOSolvers (trunk) | 1.3534074625e10 | 3245 | 1734240 | 323 | 6.5496e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 32768 | LeastSquaresOptim (Dogleg) | 5.9134165e6 | 119 | 1828704 | 5 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 7.6108125e6 | 151 | 1963152 | 7 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | MadNLP | 5.42653146e8 | 673 | 51440 | 7 | 6.5496e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | 1.053178335e8 | 1465 | 70584928 | 117 | 6.5496e+00 | true | ok | NaN | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion) | 5.0661458e7 | 1543 | 76922320 | 9 | 6.5496e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 32768 | Optim (Newton) | 5.8728545e6 | 116 | 4816 | 6 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 3.5554995e6 | 197 | 13584 | 4 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | SecondOrderOptimization | 3.4721875e6 | 32 | 2064 | 5 | 6.5496e+00 | true | ok | NaN | NaN | rel\_dcost |
| 65536 | CaNNOLeS | 3.79954958e8 | 258 | 65123648 | 6 | 1.3174e+01 | true | ok | NaN | NaN | first\_order |
| 65536 | Ipopt | 1.100414042e9 | 605 | 34511120 | 5 | 1.3174e+01 | true | ok | NaN | NaN | first\_order |
| 65536 | JSOSolvers (tron) | 5.933802958e9 | 703 | 3708672 | 20 | 1.3174e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 65536 | JSOSolvers (trunk) | 2.7657991792e10 | 3234 | 3306576 | 321 | 1.3174e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 65536 | LeastSquaresOptim (Dogleg) | 1.1842521e7 | 119 | 3401568 | 5 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | LeastSquaresOptim (LM) | 1.5385271e7 | 151 | 3536016 | 7 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | MadNLP | 6.632763042e9 | 1441 | 63920 | 12 | 1.3174e+01 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 65536 | NonlinearSolve (LM) | 2.08204e8 | 1465 | 137169504 | 117 | 1.3174e+01 | true | ok | NaN | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion) | 1.3062875e8 | 1719 | 167508048 | 15 | 1.3174e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 65536 | Optim (Newton) | 1.1715021e7 | 116 | 4816 | 6 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 7.0107085e6 | 197 | 13584 | 4 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | SecondOrderOptimization | 6.927104e6 | 32 | 2064 | 5 | 1.3174e+01 | true | ok | NaN | NaN | rel\_dcost |
