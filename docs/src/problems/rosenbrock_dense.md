# Dense Multi-dimensional Rosenbrock

- **Category**: `small_dense`
- **Scaling Metric**: Dimension n
- **Problem Sizes Evaluated**: 2, 3, 4, 5, 6, 8, 10, 14, 18, 22, 26, 32 (12 sizes)
- **Standard Baseline Model for Solvers**: `Standalone`

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed/dotted lines) and **Cost + Linear System Assembly** (solid/dash-dot lines) across problem sizes.

![Dense Multi-dimensional Rosenbrock Model Evaluation Scaling](../assets/plots/rosenbrock_dense_models.png)

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers, where each solver is evaluated on its optimal problem representation (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, and `Manifolds` for `Manopt`). Non-converged runs are omitted.

![Dense Multi-dimensional Rosenbrock Optimizer Scaling](../assets/plots/rosenbrock_dense_optimizers.png)

---

## 3. Single-Threaded Results

The same benchmark with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`),
stored separately from the threaded table. Comparing the two shows what threading gains or costs at each size.

![Dense Multi-dimensional Rosenbrock Model Evaluation Scaling, 1 thread](../assets/plots/single_threaded/rosenbrock_dense_models.png)

![Dense Multi-dimensional Rosenbrock Optimizer Scaling, 1 thread](../assets/plots/single_threaded/rosenbrock_dense_optimizers.png)

- [View Single-Threaded Raw Benchmark Results Data (Markdown Table)](../data/single_threaded/rosenbrock_dense.md)

---

## 4. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/rosenbrock_dense.md)

---

## 5. Analysis & Key Takeaways

- **Model Efficiency**: At Dimension n = `32`, **`NLLSModel`** achieves the fastest Cost + Linear System evaluation at **8.38 μs** (32 B allocated).
- **Top Converged Optimizer**: At Dimension n = `32` (12/14 solvers converged), **`SecondOrderOptimization (LM)`** is fastest at **167.46 μs** (10 iterations, final cost `4.58e-19`).
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) within `500` iterations and `30.0s` are plotted.
