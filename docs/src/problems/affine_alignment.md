# Dense Affine Alignment

- **Category**: `small_dense`
- **Scaling Metric**: Dimension n
- **Problem Sizes Evaluated**: 1, 2, 3, 4, 6, 8, 12, 16, 20, 24, 28, 32 (12 sizes)
- **Standard Baseline Model for Solvers**: `Standalone`
- **Derivatives**: analytic

**Derivatives: analytic, not yet in place.** A cost of this problem depends on more than 8 scalar inputs (all ``n(n+1)`` of the affine map's), so by the benchmark's rule its costs are to have hand-written Jacobians shared by every model. They do not yet: the problem has one model, `Standalone`, which computes the Jacobian of the whole residual vector by LeastSquaresOptim's forward-mode automatic differentiation (`autodiff = :forward`), and every row, SecondOrderOptimization's included, runs on it.

---

## The SecondOrderOptimization rows

- **`SecondOrderOptimization (Gauss-Newton)`** is `iterator = :newton` on the normal equations: Gauss–Newton, since the Hessian it is given is ``J^T J``. It takes the full step, with no line search or trust region (a diagonal shift only when the system cannot be solved), so a step that raises the cost is caught only by the stall test, and the row then ends `not_converged`. **`CaNNOLeS`** (`method = :Newton_noFHess`) is Gauss–Newton too, globalized: an ``LDL^T`` factorization of the augmented system ``[\rho I\ \ J^T;\ J\ \ {-I}]``, with ``\rho`` raised from 0 only when the factorization fails or has the wrong inertia, then an Armijo backtracking line search on ``\tfrac12\|F\|^2``.

---

## 1. Model Evaluation Scaling

This problem uses `Standalone` universally across all solvers via its built-in adapters; Phase 1 comparative model evaluation is omitted.

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers, where each solver is evaluated on its optimal problem representation (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, and `Manifolds` for `Manopt`). Non-converged runs are omitted.

![Dense Affine Alignment Optimizer Scaling](../assets/plots/affine_alignment_optimizers.png)

---

## 3. Single-Threaded Results

The same benchmark with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`),
stored separately from the threaded table. Comparing the two shows what threading gains or costs at each size.

![Dense Affine Alignment Optimizer Scaling, 1 thread](../assets/plots/single_threaded/affine_alignment_optimizers.png)

- [View Single-Threaded Raw Benchmark Results Data (Markdown Table)](../data/single_threaded/affine_alignment.md)

---

## 4. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/affine_alignment.md)

---

## 5. Analysis & Key Takeaways

- **Model Architecture**: Handled universally via `Standalone` with built-in zero-allocation adapters.
- **Top Converged Optimizer**: At Dimension n = `32` (13/14 solvers converged), **`SecondOrderOptimization (Gauss-Newton)`** is fastest at **1.03 s** (6 iterations, final cost `4.43e-27`).
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) within `500` iterations and `30.0s` are plotted.
