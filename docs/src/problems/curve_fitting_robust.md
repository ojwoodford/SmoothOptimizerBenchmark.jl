# Robust Exponential Curve Fitting

- **Category**: `medium_dense`
- **Scaling Metric**: Data Points m
- **Problem Sizes Evaluated**: 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536 (11 sizes)
- **Standard Baseline Model for Optimizers**: `Standalone (fudged)`
- **Derivatives**: autodiff

**Derivatives: automatic.** Every cost of this problem depends on at most 8 scalar inputs, so each cost's Jacobian is computed by forward-mode automatic differentiation, with NLLSModel's `computeresjac`. The `Standalone (fudged)` model, which LeastSquaresOptim, NonlinearSolve and Optim run on, fills its residual vector and Jacobian by calling that same function for each cost in a plain single-threaded loop, then rewrites each residual and scales its row as described below, so the NLLSModel and Standalone models evaluate a cost with the same code. The mode applies to those two models. The `JuMP (fudged)` model, the same rewritten residuals as JuMP expressions and the native model of JSOSolvers, Ipopt, MadNLP and CaNNOLeS, is differentiated by JuMP's own automatic differentiation, exactly and with exact second derivatives: a native model's derivatives are part of the package under test.

---

## The Problem

The same decay curve as [Exponential Curve Fitting](curve_fitting.md), ``a\,e^{-b t} + c``, fitted to the same data, except that **30 % of the measurements are wrong**: each of those has been moved up by 1, fifty times the noise level of 0.02. Ordinary least squares squares every gap, so those points would drag the curve up towards them. A *robust* fit limits their pull: a gap is squared only while it is small, and counted in proportion to its size once it is large. The optimizer minimizes

```math
f(a, b, c) = \tfrac12 \sum_{i=1}^{m} \rho\Bigl(\bigl(a\,e^{-b t_i} + c - y_i\bigr)^2\Bigr), \qquad
\rho(s) = \begin{cases} s & s \le w^2 \\ 2w\sqrt{s} - w^2 & s > w^2 \end{cases}
```

where ``\rho`` is the Huber kernel and ``w = 0.05`` its width (2.5 times the noise level). The optimizers start from ``(1, 1, 1)``; a good fit recovers values close to the true ``(2, 1.5, 0.5)`` in spite of the bad points.

### Where it is used

Wherever some of the data cannot be trusted and it is not known which: wrongly matched image features in computer vision, reflected signals in satellite positioning, glitches in a sensor log, the occasional bad reading in a laboratory series. Robust kernels are standard in 3D reconstruction, robot mapping and robust regression in statistics.

### Similar problems

In size and structure it is the plain curve fit: three unknowns, a 3 × 3 system, and time dominated by the pass over the data. What it adds is the kernel, which is the same ingredient that large problems such as bundle adjustment and pose-graph optimization use, here on a problem small enough to see its effect alone. The kernel changes how each residual is weighted, and packages differ in whether they support one at all (see "How each row gets the robust cost" below).

### How it scales

The size is the number of data points, ``m``, of which ``\operatorname{round}(0.3\,m)`` are outliers. The sizes are those of the plain curve fit, and the work per iteration is proportional to ``m``.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``m`` | 64 | 65536 |
| Variables | 1, of size 3 | 1 | 1 |
| Unknowns in total | 3 | 3 | 3 |
| Costs | ``m``, each one residual with a Huber kernel, depending on the whole variable | 64 | 65536 |
| Residuals in total | ``m`` | 64 | 65536 |
| Jacobian | ``m \times 3``, dense | 64 × 3 | 65536 × 3 |
| Hessian ``\mathbf{J}^T \mathbf{J}`` | ``3 \times 3``, dense | 3 × 3 | 3 × 3 |

---

## Which model each row runs on, and how it stops

Each row runs on its package's native model, or on the `Standalone` model if its package has none here (see the overview). The criteria are the benchmark's gradient, step and relative cost-change tolerances, as far as the package offers them; the overview's table says what each is called in each package.

| Row | Model | Stopping criteria given |
|:---|:---|:---|
| `CaNNOLeS (fudged)` | `JuMP (fudged)` | gradient |
| `Ipopt` | `JuMP (fudged)` | gradient, step, relative cost change |
| `JSOSolvers (tron)` | `JuMP (fudged)` | gradient |
| `JSOSolvers (trunk)` | `JuMP (fudged)` | gradient |
| `LeastSquaresOptim (Dogleg, fudged)` | `Standalone (fudged)` | gradient, step, relative cost change |
| `LeastSquaresOptim (LM, fudged)` | `Standalone (fudged)` | gradient, step, relative cost change |
| `MadNLP` | `JuMP (fudged)` | gradient |
| `NonlinearSolve (LM, fudged)` | `Standalone (fudged)` | its own defaults |
| `NonlinearSolve (TrustRegion, fudged)` | `Standalone (fudged)` | its own defaults |
| `Optim (Newton)` | `Standalone (fudged)` | gradient, step, relative cost change |
| `Optim (NewtonTrustRegion)` | `Standalone (fudged)` | gradient, step, relative cost change |
| `SecondOrderOptimization` | `NLLSModel (Static)` | gradient, step, relative cost change |

The `SecondOrderOptimization` row runs `iterator = :levenbergmarquardt`, `linsolver = :cholesky`, `formulation = :hessian`, `reduction = :none`, `storage = :dense`: the configuration NLLSModel's `recommendoptimizer` chose for this problem at its largest size, Data Points m = 65536, with one thread (then fixed in the problem's code, the same at every size).

---

## How each row gets the robust cost

- **`SecondOrderOptimization`** runs the `NLLSModel (Static)` model, which declares the kernel.
- **Every other row runs a rewritten ("fudged") model.** Each residual ``\epsilon`` is rewritten as ``\tilde\epsilon = \operatorname{sign}(\epsilon)\sqrt{\rho(\epsilon^2)}``, and its row of the Jacobian is scaled by ``\rho'(\epsilon^2)\,|\epsilon| / \sqrt{\rho(\epsilon^2)}``. Then ``\tfrac12\lVert\tilde{\boldsymbol{\epsilon}}\rVert^2`` is the robust cost exactly and ``\tilde{\mathbf{J}}^T \tilde{\boldsymbol{\epsilon}}`` its gradient.
  - JSOSolvers, Ipopt, MadNLP and CaNNOLeS run `JuMP (fudged)`, the rewritten residuals as JuMP expressions (for the Huber kernel, ``\tilde\epsilon = \epsilon`` within the width and ``\operatorname{sign}(\epsilon)\sqrt{2w|\epsilon| - w^2}`` beyond it). JuMP differentiates them itself, so these rows get the exact Hessian of the rewritten cost. CaNNOLeS has no kernel interface, and its row is named "fudged"; the others keep their standard names.
  - LeastSquaresOptim, NonlinearSolve and Optim run `Standalone (fudged)`. LeastSquaresOptim and NonlinearSolve have no kernel interface, and their rows are named "fudged". Optim keeps its standard names: it gets the exact robust cost and gradient, but its Hessian is ``\tilde{\mathbf{J}}^T \tilde{\mathbf{J}}``.

The weight each form gives an outlier's ``\mathbf{j}_i \mathbf{j}_i^T``, with ``\mathbf{j}_i^T`` its row of the Jacobian (``|\epsilon| > w``; inliers have weight 1 in all three), **derived from the code, not measured**:

| Form | Weight | Far from the width |
|---|---|---|
| Reweighting only (IRLS) | ``w / \lvert \epsilon\rvert`` | ``w / \lvert \epsilon\rvert`` |
| NLLSModel, Triggs with its positive-definiteness guard | ``2w / (3\lvert \epsilon\rvert)`` | ``\tfrac23 \cdot w / \lvert \epsilon\rvert`` |
| Rewritten residuals, Gauss–Newton | ``w^2 / (2w\lvert \epsilon\rvert - w^2)`` | ``\to \tfrac12 \cdot w / \lvert \epsilon\rvert`` |

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed/dotted lines) and **Cost + Linear System Assembly** (solid/dash-dot lines) across problem sizes.

![Robust Exponential Curve Fitting Model Evaluation Scaling](../assets/plots/curve_fitting_robust_models.png)

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers, each on the model given in the table above (its package's native model, or the `Standalone` model). Only `ok` rows are plotted.

![Robust Exponential Curve Fitting Optimizer Scaling](../assets/plots/curve_fitting_robust_optimizers.png)

---

## 3. Single-Threaded Results

The same benchmark with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`),
stored separately from the multi-threaded table. Comparing the two shows what threading gains or costs at each size.

![Robust Exponential Curve Fitting Model Evaluation Scaling, 1 thread](../assets/plots/single_threaded/curve_fitting_robust_models.png)

![Robust Exponential Curve Fitting Optimizer Scaling, 1 thread](../assets/plots/single_threaded/curve_fitting_robust_optimizers.png)

- [View Single-Threaded Raw Benchmark Results Data (Markdown Table)](../data/single_threaded/curve_fitting_robust.md)

---

## 4. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/curve_fitting_robust.md)

---

## 5. Analysis & Key Takeaways

- **Model Efficiency**: At Data Points m = `65536`, **`NLLSModel (Static)`** achieves the fastest Cost + Linear System evaluation at **979.50 μs** (32 B allocated).
- **Top Converged Optimizer**: At Data Points m = `65536` (9/12 solvers converged), **`SecondOrderOptimization`** is fastest at **9.65 ms** (8 iterations, final cost `9.57e+02`).
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) within `500` iterations and `30.0s` are plotted.
