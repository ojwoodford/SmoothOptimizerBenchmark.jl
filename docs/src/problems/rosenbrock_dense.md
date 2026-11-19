# Dense Multi-dimensional Rosenbrock

- **Category**: `small_dense`
- **Scaling Metric**: Dimension n
- **Problem Sizes Evaluated**: 2, 3, 4, 5, 6, 8, 10, 14, 18, 22, 26, 32 (12 sizes)
- **Standard Baseline Model for Optimizers**: `Standalone`
- **Derivatives**: autodiff

**Derivatives: automatic.** Every cost of this problem depends on at most 8 scalar inputs, so each cost's Jacobian is computed by forward-mode automatic differentiation, with NLLSModel's `computeresjac`. The `Standalone` model fills its residual vector and Jacobian by calling that same function for each cost in a plain single-threaded loop, so every model evaluates a cost with the same code; what differs between rows is how the linear system is assembled and how the optimizer uses it. The `NLPModels (MathOptNLSModel)` model is differentiated by JuMP's own automatic differentiation.

---

## The Problem

A Rosenbrock-style test function (a minimum at the bottom of a curved valley) in which **every pair** of unknowns is coupled, not only neighbours. Each of the ``n`` unknowns is pulled towards 1, and for every pair ``j < k`` the later one is pulled onto the parabola ``x_k = x_j^2``:

```math
f(x) = \tfrac12 \sum_{k=1}^{n} \bigl(1.2\,(x_k - 1)\bigr)^2 + \tfrac12 \sum_{j < k} \bigl(x_k - x_j^2\bigr)^2 .
```

Every term is zero at ``x = (1, \dots, 1)``, which is the minimum. The optimizers start from the classic Rosenbrock starting values, alternating ``-1.2`` and ``1``.

### Where it is used

Nowhere directly: it is a synthetic test function. It is the dense counterpart of the [sparse Rosenbrock problem](rosenbrock_sparse.md): the same kind of nonlinearity, but with no sparsity to exploit.

### Similar problems

Small problems in which everything interacts with everything else: calibrating a set of coupled parameters, or estimating ``n`` quantities from a measurement between every pair of them (clock offsets in a network, ratings from all-play-all results). Each residual touches only one or two unknowns, so the Jacobian is mostly zeros, but the matrix ``J^T J`` is completely full. A dense factorization is the right tool at these sizes.

### How it scales

The size is the number of unknowns, ``n``. The number of residuals grows with the number of pairs, as ``n^2 / 2``; assembling the dense system costs in proportion to ``n^2`` and factorizing it to ``n^3``.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``n`` | 2 | 32 |
| Variables | ``n``, each a scalar | 2 | 32 |
| Unknowns in total | ``n`` | 2 | 32 |
| Costs | ``n(n+1)/2``, each one residual: ``n`` depend on one variable, ``n(n-1)/2`` on two | 3 | 528 |
| Residuals in total | ``n(n+1)/2`` | 3 | 528 |
| Jacobian | ``n(n+1)/2 \times n``, with ``n^2`` non-zeros | 3 × 2 | 528 × 32 |
| Hessian ``J^T J`` | ``n \times n``, dense | 2 × 2 | 32 × 32 |

---

## The SecondOrderOptimization rows

- **`SecondOrderOptimization (Gauss-Newton)`** is `iterator = :newton` on the normal equations: Gauss–Newton, since the Hessian it is given is ``J^T J``. It takes the full step, with no line search or trust region (a diagonal shift only when the system cannot be solved), so a step that raises the cost is caught only by the stall test, and the row then ends `not_converged`. **`CaNNOLeS`** (`method = :Newton_noFHess`) is Gauss–Newton too, globalized: an ``LDL^T`` factorization of the augmented system ``[\rho I\ \ J^T;\ J\ \ {-I}]``, with ``\rho`` raised from 0 only when the factorization fails or has the wrong inertia, then an Armijo backtracking line search on ``\tfrac12\|F\|^2``.
- **`SecondOrderOptimization (LM, tall)`** is Levenberg–Marquardt on the residual-and-Jacobian form (`formulation = :jacobian`): each step solves the damped least-squares problem in ``J`` by QR, without forming ``J^T J``, on the `NLLSModel` model. `storage = :auto` stores ``J`` dense or sparse from its fill (sparse at the large sizes), and `linsolver = :auto` factorizes it by dense QR or SPQR. The rows without "tall" solve the normal equations in ``J^T J``.

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

- **Model Efficiency**: At Dimension n = `32`, **`NLLSModel`** achieves the fastest Cost + Linear System evaluation at **9.36 μs** (32 B allocated).
- **Top Converged Optimizer**: At Dimension n = `32` (11/15 solvers converged), **`SecondOrderOptimization (Dogleg)`** is fastest at **167.94 μs** (10 iterations, final cost `4.58e-19`).
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) within `500` iterations and `30.0s` are plotted.
