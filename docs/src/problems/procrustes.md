# Procrustes on SO(d)

- **Category**: `manifold`
- **Scaling Metric**: Matrix Dimension d
- **Problem Sizes Evaluated**: 2, 3, 4, 5, 6, 8, 10, 12, 15, 18, 21, 24 (12 sizes)
- **Standard Baseline Model for Solvers**: `Manifolds`

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed/dotted lines) and **Cost + Linear System Assembly** (solid/dash-dot lines) across problem sizes.

![Procrustes on SO(d) Model Evaluation Scaling](../assets/plots/procrustes_models.png)

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers, where each solver is evaluated on its optimal problem representation (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, and `Manifolds` for `Manopt`). Non-converged runs are omitted.

![Procrustes on SO(d) Optimizer Scaling](../assets/plots/procrustes_optimizers.png)

---

## 3. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/procrustes.md)

---

## 4. Analysis & Key Takeaways

- **Model Efficiency**: At Matrix Dimension d = `24`, **`Manifolds`** achieves the fastest Cost + Linear System evaluation at **31.37 ms** (0 B allocated).
- **Top Converged Optimizer**: At Matrix Dimension d = `24` (3/3 solvers converged), **`SecondOrderOptimization (LM)`** is fastest at **138.91 ms** (3 iterations, final cost `4.64e-20`).
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) within `500` iterations and `30.0s` are plotted.
