# Ill-Conditioned Polynomial Fitting

- **Category**: `medium_dense`
- **Scaling Metric**: Data Points m
- **Problem Sizes Evaluated**: 60, 100, 160, 250, 400, 640, 1000, 1600, 2500, 4000, 6400 (11 sizes)
- **Standard Baseline Model for Solvers**: `Standalone`
- **Derivatives**: analytic

**Derivatives: analytic.** A cost of this problem depends on more than 8 scalar inputs, so each cost has a hand-written Jacobian. NLLSModel calls it through `computeresjac`, and the `Standalone` model fills its residual vector and Jacobian by calling the same function for each cost in a plain single-threaded loop, so every model evaluates a cost with the same code.

---


## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed/dotted lines) and **Cost + Linear System Assembly** (solid/dash-dot lines) across problem sizes.

![Ill-Conditioned Polynomial Fitting Model Evaluation Scaling](../assets/plots/polynomial_fitting_models.png)

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers, where each solver is evaluated on its optimal problem representation (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, and `Manifolds` for `Manopt`). Non-converged runs are omitted.

![Ill-Conditioned Polynomial Fitting Optimizer Scaling](../assets/plots/polynomial_fitting_optimizers.png)

---

## 3. Single-Threaded Results

The same benchmark with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`),
stored separately from the threaded table. Comparing the two shows what threading gains or costs at each size.

![Ill-Conditioned Polynomial Fitting Model Evaluation Scaling, 1 thread](../assets/plots/single_threaded/polynomial_fitting_models.png)

![Ill-Conditioned Polynomial Fitting Optimizer Scaling, 1 thread](../assets/plots/single_threaded/polynomial_fitting_optimizers.png)

- [View Single-Threaded Raw Benchmark Results Data (Markdown Table)](../data/single_threaded/polynomial_fitting.md)

---

## 4. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/polynomial_fitting.md)

---

## 5. Analysis & Key Takeaways

- **Model Efficiency**: At Data Points m = `6400`, **`Standalone`** achieves the fastest Cost + Linear System evaluation at **170.92 μs** (32 B allocated).
- **Top Converged Optimizer**: At Data Points m = `6400` (3/4 solvers converged), **`SecondOrderOptimization (LM, tall)`** is fastest at **11.47 ms** (18 iterations, final cost `9.70e+01`).
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) within `500` iterations and `30.0s` are plotted.
