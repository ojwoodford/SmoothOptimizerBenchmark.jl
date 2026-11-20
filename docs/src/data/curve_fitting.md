# Benchmark Results: Exponential Curve Fitting

- **Category**: medium_dense
- **Scaling Metric**: Data Points m
- **Optimizer Target Model**: Standalone
- **Derivatives**: autodiff
- **Convergence Criteria**: gtol=1.0e-8, xtol=1.0e-8, ftol=1.0e-8, maxiters=500, maxtime=30.0s; a row is ok when the solver reports convergence and its final cost, evaluated by the harness, is at most max(reference × (1 + 0.0001), 1.0e-6), the reference being the known minimum or else the lowest cost of any row at that size; a row that claims convergence and fails is local_minimum if the Gauss–Newton predicted reduction is below 1.0e-8 × its cost, else above_reference
- **Benchmark Date**: 2026-11-20T16:34:15
- **Host CPU**: apple-m1 (10 cores)
- **OS**: Darwin (arm64-apple-darwin27.0.0)
- **Julia Version**: 1.13.3
- **Threads**: NLLSModel numthreads=8, Julia threads=8, BLAS threads=8
- **Git Commit**: fbb6630
- **Dependency Commits**: NLLSModel d2e4374, OptimizationVariableInterface f130043, SecondOrderOptimization 29026b7

---

## Model Evaluation Scaling

| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |
|:---|:---|---:|---:|---:|---:|---:|---:|
| 64 | JuMP | 9875.0 | 2 | 32 | 23042.0 | 5 | 128 |
| 64 | NLLSModel (Static) | 349.72131147540983 | 1 | 16 | 1776.4545454545455 | 1 | 32 |
| 64 | Standalone | 369.6909090909091 | 1 | 16 | 1577.357142857143 | 1 | 32 |
| 128 | JuMP | 20042.0 | 2 | 32 | 41709.0 | 5 | 128 |
| 128 | NLLSModel (Static) | 595.5882352941177 | 1 | 16 | 2857.1428571428573 | 1 | 32 |
| 128 | Standalone | 665.3225806451613 | 1 | 16 | 2791.5714285714284 | 1 | 32 |
| 256 | JuMP | 39250.0 | 2 | 32 | 87875.0 | 5 | 128 |
| 256 | NLLSModel (Static) | 1164.3333333333333 | 1 | 16 | 6281.25 | 1 | 32 |
| 256 | Standalone | 1159.7222222222222 | 1 | 16 | 5791.75 | 1 | 32 |
| 512 | JuMP | 77417.0 | 2 | 32 | 163167.0 | 5 | 128 |
| 512 | NLLSModel (Static) | 1147.2 | 1 | 16 | 12667.0 | 1 | 32 |
| 512 | Standalone | 2435.222222222222 | 1 | 16 | 11542.0 | 1 | 32 |
| 1024 | JuMP | 143667.0 | 2 | 32 | 371875.0 | 5 | 128 |
| 1024 | NLLSModel (Static) | 3035.3076923076924 | 1 | 16 | 14458.0 | 1 | 32 |
| 1024 | Standalone | 4825.0 | 1 | 16 | 22708.0 | 1 | 32 |
| 2048 | JuMP | 481958.0 | 2 | 32 | 796125.0 | 5 | 128 |
| 2048 | NLLSModel (Static) | 2097.3333333333335 | 1 | 16 | 17834.0 | 1 | 32 |
| 2048 | Standalone | 9639.0 | 1 | 16 | 77125.0 | 1 | 32 |
| 4096 | JuMP | 1.173209e6 | 2 | 32 | 3.598125e6 | 5 | 128 |
| 4096 | NLLSModel (Static) | 11750.0 | 1 | 16 | 48750.0 | 1 | 32 |
| 4096 | Standalone | 19166.0 | 1 | 16 | 91125.0 | 1 | 32 |
| 8192 | JuMP | 3.277042e6 | 2 | 32 | 9.229792e6 | 5 | 128 |
| 8192 | NLLSModel (Static) | 5305.333333333333 | 1 | 16 | 80583.0 | 1 | 32 |
| 8192 | Standalone | 35916.0 | 1 | 16 | 212541.0 | 1 | 32 |
| 16384 | JuMP | 9.640375e6 | 2 | 32 | 2.4064333e7 | 5 | 128 |
| 16384 | NLLSModel (Static) | 43666.0 | 1 | 16 | 178042.0 | 1 | 32 |
| 16384 | Standalone | 71792.0 | 1 | 16 | 346167.0 | 1 | 32 |
| 32768 | JuMP | 2.0942208e7 | 2 | 32 | 5.7174958e7 | 5 | 128 |
| 32768 | NLLSModel (Static) | 18958.0 | 1 | 16 | 355084.0 | 1 | 32 |
| 32768 | Standalone | 143458.0 | 1 | 16 | 692667.0 | 1 | 32 |
| 65536 | JuMP | 4.797625e7 | 2 | 32 | 1.21391458e8 | 5 | 128 |
| 65536 | NLLSModel (Static) | 36584.0 | 1 | 16 | 521750.0 | 1 | 32 |
| 65536 | Standalone | 303209.0 | 1 | 16 | 1.400791e6 | 1 | 32 |

---

## Optimizer Evaluation Scaling

Each row runs on its package's native model, or on the problem's Standalone model if its package has none (`resolve_optimizer_model`).

| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Solution Error | Message |
|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|:---|
| 64 | CaNNOLeS | 137103.5 | 198 | 79408 | 6 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | Ipopt | 1.467354e6 | 521 | 57872 | 5 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (tron) | 226417.0 | 214 | 14224 | 7 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | JSOSolvers (trunk) | 148416.5 | 115 | 8512 | 6 | 1.3405e-02 | true | ok | NaN | NaN | first\_order |
| 64 | LeastSquaresOptim (Dogleg) | 17791.0 | 115 | 258976 | 5 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | LeastSquaresOptim (LM) | 25396.0 | 147 | 360688 | 7 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | MadNLP | 710271.0 | 655 | 51152 | 7 | 1.3405e-02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 64 | NonlinearSolve (LM) | 461500.0 | 1246 | 210736 | 120 | 1.3405e-02 | true | ok | NaN | NaN | StalledSuccess |
| 64 | NonlinearSolve (TrustRegion) | 239250.0 | 1563 | 4094928 | 16 | 1.3405e-02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 64 | Optim (Newton) | 24625.0 | 116 | 4816 | 6 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | Optim (NewtonTrustRegion) | 30979.0 | 225 | 15792 | 5 | 1.3405e-02 | true | ok | NaN | NaN | converged |
| 64 | SecondOrderOptimization | 10770.5 | 32 | 2064 | 5 | 1.3405e-02 | true | ok | NaN | NaN | rel\_dcost |
| 128 | CaNNOLeS | 212875.0 | 205 | 137168 | 5 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | Ipopt | 2.2220625e6 | 523 | 78320 | 5 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (tron) | 579604.0 | 232 | 18896 | 7 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | JSOSolvers (trunk) | 372792.0 | 122 | 12112 | 7 | 2.5926e-02 | true | ok | NaN | NaN | first\_order |
| 128 | LeastSquaresOptim (Dogleg) | 34770.5 | 116 | 262080 | 5 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | LeastSquaresOptim (LM) | 48604.5 | 148 | 364272 | 7 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | MadNLP | 848520.5 | 653 | 51088 | 6 | 2.5926e-02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 128 | NonlinearSolve (LM) | 641937.5 | 1223 | 337568 | 117 | 2.5926e-02 | true | ok | NaN | NaN | StalledSuccess |
| 128 | NonlinearSolve (TrustRegion) | 267667.0 | 885 | 2266704 | 9 | 2.5926e-02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 128 | Optim (Newton) | 30166.0 | 103 | 4400 | 5 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | Optim (NewtonTrustRegion) | 31396.0 | 197 | 13584 | 4 | 2.5926e-02 | true | ok | NaN | NaN | converged |
| 128 | SecondOrderOptimization | 17250.0 | 32 | 2064 | 5 | 2.5926e-02 | true | ok | NaN | NaN | rel\_dcost |
| 256 | CaNNOLeS | 429333.0 | 235 | 285072 | 5 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | Ipopt | 3.6375415e6 | 561 | 152752 | 5 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (tron) | 1.021396e6 | 227 | 25264 | 6 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | JSOSolvers (trunk) | 736812.5 | 128 | 18064 | 7 | 5.5410e-02 | true | ok | NaN | NaN | first\_order |
| 256 | LeastSquaresOptim (Dogleg) | 58312.5 | 119 | 268128 | 5 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | LeastSquaresOptim (LM) | 92479.0 | 169 | 422272 | 8 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | MadNLP | 2.264896e6 | 791 | 53488 | 12 | 5.5410e-02 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 256 | NonlinearSolve (LM) | 1.130167e6 | 1465 | 712800 | 117 | 5.5410e-02 | true | ok | NaN | NaN | StalledSuccess |
| 256 | NonlinearSolve (TrustRegion) | 619584.0 | 1587 | 4213872 | 11 | 5.5410e-02 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 256 | Optim (Newton) | 53187.5 | 103 | 4400 | 5 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | Optim (NewtonTrustRegion) | 48895.5 | 197 | 13584 | 4 | 5.5410e-02 | true | ok | NaN | NaN | converged |
| 256 | SecondOrderOptimization | 30708.5 | 32 | 2064 | 5 | 5.5410e-02 | true | ok | NaN | NaN | rel\_dcost |
| 512 | CaNNOLeS | 986229.5 | 244 | 589920 | 6 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | Ipopt | 6.8834585e6 | 563 | 303760 | 5 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (tron) | 1.7078335e6 | 212 | 38880 | 5 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | JSOSolvers (trunk) | 1.7844165e6 | 144 | 31056 | 9 | 1.0665e-01 | true | ok | NaN | NaN | first\_order |
| 512 | LeastSquaresOptim (Dogleg) | 99812.5 | 119 | 280416 | 5 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | LeastSquaresOptim (LM) | 128270.5 | 151 | 385168 | 7 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | MadNLP | 3.3684375e6 | 741 | 52656 | 11 | 1.0665e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 512 | NonlinearSolve (LM) | 1.902917e6 | 1465 | 1357408 | 117 | 1.0665e-01 | true | ok | NaN | NaN | StalledSuccess |
| 512 | NonlinearSolve (TrustRegion) | 2.088625e6 | 3149 | 9589664 | 59 | 1.0665e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 512 | Optim (Newton) | 105562.5 | 116 | 4816 | 6 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | Optim (NewtonTrustRegion) | 88916.5 | 225 | 15792 | 5 | 1.0665e-01 | true | ok | NaN | NaN | converged |
| 512 | SecondOrderOptimization | 58687.5 | 32 | 2064 | 5 | 1.0665e-01 | true | ok | NaN | NaN | rel\_dcost |
| 1024 | CaNNOLeS | 1.7957705e6 | 242 | 1149952 | 5 | 2.0673e-01 | true | ok | NaN | NaN | first\_order |
| 1024 | Ipopt | 1.3294e7 | 567 | 486768 | 5 | 2.0673e-01 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (tron) | 4.38225e6 | 233 | 68560 | 6 | 2.0673e-01 | true | ok | NaN | NaN | first\_order |
| 1024 | JSOSolvers (trunk) | 7.3930208e7 | 3264 | 211440 | 325 | 2.0673e-01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 1024 | LeastSquaresOptim (Dogleg) | 181874.5 | 119 | 304992 | 5 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | LeastSquaresOptim (LM) | 253979.5 | 151 | 412816 | 7 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | MadNLP | 3.893708e6 | 665 | 51280 | 6 | 2.0673e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 1024 | NonlinearSolve (LM) | 3.795396e6 | 1465 | 2646624 | 117 | 2.0673e-01 | true | ok | NaN | NaN | StalledSuccess |
| 1024 | NonlinearSolve (TrustRegion) | 2.32185708e8 | 1543 | 5815760 | 8 | 2.0673e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 1024 | Optim (Newton) | 174375.5 | 103 | 4400 | 5 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | Optim (NewtonTrustRegion) | 136937.0 | 197 | 13584 | 4 | 2.0673e-01 | true | ok | NaN | NaN | converged |
| 1024 | SecondOrderOptimization | 59750.0 | 54 | 3344 | 5 | 2.0673e-01 | true | ok | NaN | NaN | rel\_dcost |
| 2048 | CaNNOLeS | 5.3296665e6 | 246 | 2139264 | 6 | 4.1154e-01 | true | ok | NaN | NaN | first\_order |
| 2048 | Ipopt | 2.77442505e7 | 571 | 971696 | 5 | 4.1154e-01 | true | ok | NaN | NaN | first\_order |
| 2048 | JSOSolvers (tron) | 4.6529667e7 | 782 | 157296 | 24 | 4.1154e-01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 2048 | JSOSolvers (trunk) | 5.6232285e6 | 115 | 103392 | 5 | 4.1154e-01 | true | ok | NaN | NaN | first\_order |
| 2048 | LeastSquaresOptim (Dogleg) | 511583.0 | 119 | 354144 | 5 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | LeastSquaresOptim (LM) | 706333.5 | 151 | 476304 | 7 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | MadNLP | 9.3031455e6 | 665 | 51280 | 6 | 4.1154e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 2048 | NonlinearSolve (LM) | 7.3350625e6 | 1454 | 5208208 | 116 | 4.1154e-01 | true | ok | NaN | NaN | StalledSuccess |
| 2048 | NonlinearSolve (TrustRegion) | 3.170875e6 | 1455 | 7643280 | 9 | 4.1154e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 2048 | Optim (Newton) | 613084.0 | 116 | 4816 | 6 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | Optim (NewtonTrustRegion) | 480937.0 | 225 | 15792 | 5 | 4.1154e-01 | true | ok | NaN | NaN | converged |
| 2048 | SecondOrderOptimization | 123041.5 | 56 | 3552 | 5 | 4.1154e-01 | true | ok | NaN | NaN | rel\_dcost |
| 4096 | CaNNOLeS | 1.2446271e7 | 246 | 4224064 | 5 | 8.3061e-01 | true | ok | NaN | NaN | first\_order |
| 4096 | Ipopt | 5.7844917e7 | 575 | 2047984 | 5 | 8.3061e-01 | true | ok | NaN | NaN | first\_order |
| 4096 | JSOSolvers (tron) | 1.67670291e8 | 822 | 273744 | 28 | 8.3061e-01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 4096 | JSOSolvers (trunk) | 5.73233375e8 | 3301 | 360672 | 330 | 8.3061e-01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 4096 | LeastSquaresOptim (Dogleg) | 949499.5 | 119 | 452448 | 5 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | LeastSquaresOptim (LM) | 1.3387915e6 | 151 | 586896 | 7 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | MadNLP | 3.06912285e7 | 673 | 51440 | 7 | 8.3061e-01 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 4096 | NonlinearSolve (LM) | 1.3177396e7 | 1465 | 12323424 | 117 | 8.3061e-01 | true | ok | NaN | NaN | StalledSuccess |
| 4096 | NonlinearSolve (TrustRegion) | 3.537291e6 | 905 | 7416256 | 7 | 8.3061e-01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 4096 | Optim (Newton) | 665437.5 | 103 | 4400 | 5 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | Optim (NewtonTrustRegion) | 715041.0 | 225 | 15792 | 5 | 8.3061e-01 | true | ok | NaN | NaN | converged |
| 4096 | SecondOrderOptimization | 233583.5 | 56 | 3552 | 5 | 8.3061e-01 | true | ok | NaN | NaN | rel\_dcost |
| 8192 | CaNNOLeS | 4.0417125e7 | 250 | 7910592 | 6 | 1.6555e+00 | true | ok | NaN | NaN | first\_order |
| 8192 | Ipopt | 1.357341455e8 | 579 | 3873200 | 5 | 1.6555e+00 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (tron) | 1.33641396e8 | 252 | 470880 | 7 | 1.6555e+00 | true | ok | NaN | NaN | first\_order |
| 8192 | JSOSolvers (trunk) | 2.035035042e9 | 3303 | 557360 | 331 | 1.6555e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 8192 | LeastSquaresOptim (Dogleg) | 1.599042e6 | 119 | 649056 | 5 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | LeastSquaresOptim (LM) | 2.0414375e6 | 151 | 783504 | 7 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | MadNLP | 9.1763666e7 | 673 | 51440 | 7 | 1.6555e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 8192 | NonlinearSolve (LM) | 2.60108955e7 | 1465 | 20646496 | 117 | 1.6555e+00 | true | ok | NaN | NaN | StalledSuccess |
| 8192 | NonlinearSolve (TrustRegion) | 8.211e6 | 949 | 13416544 | 8 | 1.6555e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 8192 | Optim (Newton) | 1.546458e6 | 116 | 4816 | 6 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | Optim (NewtonTrustRegion) | 946416.5 | 197 | 13584 | 4 | 1.6555e+00 | true | ok | NaN | NaN | converged |
| 8192 | SecondOrderOptimization | 459271.0 | 56 | 3552 | 5 | 1.6555e+00 | true | ok | NaN | NaN | rel\_dcost |
| 16384 | CaNNOLeS | 8.96437085e7 | 252 | 15316192 | 6 | 3.3011e+00 | true | ok | NaN | NaN | first\_order |
| 16384 | Ipopt | 2.101786167e9 | 595 | 7541872 | 5 | 3.3011e+00 | true | ok | NaN | NaN | first\_order |
| 16384 | JSOSolvers (tron) | 2.048937875e9 | 796 | 960624 | 25 | 3.3011e+00 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 16384 | JSOSolvers (trunk) | 6.787327166e9 | 3226 | 946896 | 320 | 3.3011e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 16384 | LeastSquaresOptim (Dogleg) | 3.0321875e6 | 119 | 1042272 | 5 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | LeastSquaresOptim (LM) | 3.9741875e6 | 151 | 1176720 | 7 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | MadNLP | 2.67282229e8 | 711 | 52080 | 8 | 3.3011e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 16384 | NonlinearSolve (LM) | 5.08759165e7 | 1454 | 36997264 | 116 | 3.3011e+00 | true | ok | NaN | NaN | StalledSuccess |
| 16384 | NonlinearSolve (TrustRegion) | 1.5745167e7 | 905 | 23538112 | 8 | 3.3011e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 16384 | Optim (Newton) | 3.8790835e6 | 136 | 5328 | 6 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | Optim (NewtonTrustRegion) | 1.884583e6 | 197 | 13584 | 4 | 3.3011e+00 | true | ok | NaN | NaN | converged |
| 16384 | SecondOrderOptimization | 1.6259795e6 | 56 | 3552 | 5 | 3.3011e+00 | true | ok | NaN | NaN | rel\_dcost |
| 32768 | CaNNOLeS | 1.78388875e8 | 254 | 30569728 | 6 | 6.5496e+00 | true | ok | NaN | NaN | first\_order |
| 32768 | Ipopt | 2.319044833e9 | 599 | 14860464 | 5 | 6.5496e+00 | true | ok | NaN | NaN | first\_order |
| 32768 | JSOSolvers (tron) | 3.3578705e9 | 748 | 1875824 | 24 | 6.5496e+00 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 32768 | JSOSolvers (trunk) | 1.2841655291e10 | 3238 | 1733904 | 321 | 6.5496e+00 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 32768 | LeastSquaresOptim (Dogleg) | 6.3830625e6 | 119 | 1828704 | 5 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | LeastSquaresOptim (LM) | 8.169854e6 | 151 | 1963152 | 7 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | MadNLP | 4.961616255e8 | 673 | 51440 | 7 | 6.5496e+00 | true | ok | NaN | NaN | SOLVE\_SUCCEEDED |
| 32768 | NonlinearSolve (LM) | 1.004028335e8 | 1465 | 70584928 | 117 | 6.5496e+00 | true | ok | NaN | NaN | StalledSuccess |
| 32768 | NonlinearSolve (TrustRegion) | 5.1874125e7 | 1543 | 76922320 | 9 | 6.5496e+00 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 32768 | Optim (Newton) | 5.7553125e6 | 116 | 4816 | 6 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | Optim (NewtonTrustRegion) | 3.517542e6 | 197 | 13584 | 4 | 6.5496e+00 | true | ok | NaN | NaN | converged |
| 32768 | SecondOrderOptimization | 1.3784375e6 | 56 | 3552 | 5 | 6.5496e+00 | true | ok | NaN | NaN | rel\_dcost |
| 65536 | CaNNOLeS | 4.001065e8 | 258 | 71300416 | 6 | 1.3174e+01 | true | ok | NaN | NaN | first\_order |
| 65536 | Ipopt | 2.933203666e9 | 605 | 34822416 | 5 | 1.3174e+01 | true | ok | NaN | NaN | first\_order |
| 65536 | JSOSolvers (tron) | 6.035170792e9 | 703 | 3708672 | 20 | 1.3174e+01 | false | not_converged | NaN | NaN | small\_step; cost test passes |
| 65536 | JSOSolvers (trunk) | 2.71228295e10 | 3222 | 3306000 | 317 | 1.3174e+01 | false | not_converged | NaN | NaN | not\_desc; cost test passes |
| 65536 | LeastSquaresOptim (Dogleg) | 1.2301688e7 | 119 | 3401568 | 5 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | LeastSquaresOptim (LM) | 1.5890021e7 | 151 | 3536016 | 7 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | MadNLP | 6.207672e9 | 1441 | 63920 | 12 | 1.3174e+01 | false | not_converged | NaN | NaN | SEARCH\_DIRECTION\_BECOMES\_TOO\_SMALL; cost test passes |
| 65536 | NonlinearSolve (LM) | 2.06080541e8 | 1465 | 137169504 | 117 | 1.3174e+01 | true | ok | NaN | NaN | StalledSuccess |
| 65536 | NonlinearSolve (TrustRegion) | 1.26542125e8 | 1719 | 167508048 | 15 | 1.3174e+01 | false | not_converged | NaN | NaN | ShrinkThresholdExceeded; cost test passes |
| 65536 | Optim (Newton) | 1.18609375e7 | 116 | 4816 | 6 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | Optim (NewtonTrustRegion) | 7.295188e6 | 197 | 13584 | 4 | 1.3174e+01 | true | ok | NaN | NaN | converged |
| 65536 | SecondOrderOptimization | 2.899292e6 | 56 | 3552 | 5 | 1.3174e+01 | true | ok | NaN | NaN | rel\_dcost |
