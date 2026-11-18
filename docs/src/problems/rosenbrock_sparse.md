# Sparse Multi-dimensional Rosenbrock

- **Category**: `large_sparse`
- **Scaling Metric**: Variables n
- **Problem Sizes Evaluated**: 100, 250, 500, 1000, 2500, 5000, 10000, 20000, 35000, 50000, 75000 (11 sizes)
- **Standard Baseline Model for Solvers**: `Standalone (Sparse)`

---


## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed/dotted lines) and **Cost + Linear System Assembly** (solid/dash-dot lines) across problem sizes.

![Sparse Multi-dimensional Rosenbrock Model Evaluation Scaling](../assets/plots/rosenbrock_sparse_models.png)

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers, where each solver is evaluated on its optimal problem representation (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, and `Manifolds` for `Manopt`). Non-converged runs are omitted.

![Sparse Multi-dimensional Rosenbrock Optimizer Scaling](../assets/plots/rosenbrock_sparse_optimizers.png)

---

## 3. Single-Threaded Results

The same benchmark with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`),
stored separately from the threaded table. Comparing the two shows what threading gains or costs at each size.

![Sparse Multi-dimensional Rosenbrock Model Evaluation Scaling, 1 thread](../assets/plots/single_threaded/rosenbrock_sparse_models.png)

![Sparse Multi-dimensional Rosenbrock Optimizer Scaling, 1 thread](../assets/plots/single_threaded/rosenbrock_sparse_optimizers.png)

- [View Single-Threaded Raw Benchmark Results Data (Markdown Table)](../data/single_threaded/rosenbrock_sparse.md)

---

## 4. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/rosenbrock_sparse.md)

---

## 5. Analysis & Key Takeaways

- **Model Efficiency**: At Variables n = `75000`, **`NLLSModel`** achieves the fastest Cost + Linear System evaluation at **895.42 μs** (64 B allocated).
- **Top Converged Optimizer**: At Variables n = `75000` (8/14 solvers converged), **`SecondOrderOptimization (LM)`** is fastest at **34.62 ms** (5 iterations, final cost `0.00e+00`).
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) within `500` iterations and `30.0s` are plotted.
