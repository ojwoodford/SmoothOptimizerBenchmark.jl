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

## 3. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/rosenbrock_dense.md)

---

## 4. Analysis & Key Takeaways

- **Model Efficiency**: At Dimension n = `32`, **`NLLSModel`** achieves the fastest Cost + Linear System evaluation at **7.08 μs** (32 B allocated).
- **Top Converged Optimizer**: At Dimension n = `32` (11/13 solvers converged), **`SecondOrderOptimization (Dogleg)`** is fastest at **157.98 μs** (10 iterations, final cost `4.58e-19`).
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) within `500` iterations and `30.0s` are plotted.
