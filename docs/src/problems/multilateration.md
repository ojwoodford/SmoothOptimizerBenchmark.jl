# Multilateration

- **Category**: `small_dense`
- **Scaling Metric**: Dimension d
- **Problem Sizes Evaluated**: 2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 16 (11 sizes)
- **Standard Baseline Model for Optimizers**: `Standalone`
- **Derivatives**: analytic

**Derivatives: analytic.** A cost of this problem depends on more than 8 scalar inputs, so each cost has a hand-written Jacobian. NLLSModel calls it through `computeresjac`, and the `Standalone` model fills its residual vector and Jacobian by calling the same function for each cost in a plain single-threaded loop, so every model evaluates a cost with the same code.

---

## The Problem

Find where something is from its distances to known places, as a satellite-navigation receiver does. There are ``m`` anchors at known positions ``a_i``, and a measured range ``\rho_i`` to each. The unknown is the position ``x``, a point in ``d`` dimensions, and the optimizer looks for the point whose distances to the anchors best match the measured ranges:

```math
f(x) = \tfrac12 \sum_{i=1}^{m} \bigl(\lVert x - a_i \rVert - \rho_i\bigr)^2 .
```

Here there are ``m = 4d`` anchors, placed at random at distance 4 from the origin; the true position is at distance 1; and each range carries Gaussian noise of standard deviation 0.01. The optimizers start from the origin. The problem is well conditioned: the anchors surround the point, so every direction is measured about equally well.

### Where it is used

Satellite positioning (GPS and the other GNSS), indoor positioning from radio beacons (ultra-wideband, Wi-Fi, Bluetooth), locating a sound source from microphones, and locating an earthquake from seismometers. Those are in 2 or 3 dimensions; the higher dimensions here are for sweeping the size, though the same cost appears when points are embedded in a higher-dimensional space from their distances.

### Similar problems

Small, dense, well-conditioned problems with a single block of unknowns: the pose of one camera from known 3D points, the alignment step of point-cloud registration, the calibration of one sensor. Such problems are tiny but are solved again and again, per frame or per measurement, so what matters is overhead: memory allocation, fixed set-up costs, and how well a package handles small fixed-size arrays. The sizes 2 to 16 are those for which SecondOrderOptimization uses a statically sized linear system.

### How it scales

The size is the dimension, ``d``. The number of anchors grows with it (``4d``), so that assembling ``J^T J`` (``4d \cdot d^2`` operations) and factorizing it (``d^3``) grow at the same rate, ``d^3``.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``d`` | 2 | 16 |
| Variables | 1, of size ``d`` | 1 | 1 |
| Unknowns in total | ``d`` | 2 | 16 |
| Costs | ``4d``, each one residual depending on the whole variable | 8 | 64 |
| Residuals in total | ``4d`` | 8 | 64 |
| Jacobian | ``4d \times d``, dense | 8 × 2 | 64 × 16 |
| Hessian ``J^T J`` | ``d \times d``, dense | 2 × 2 | 16 × 16 |

---

## The SecondOrderOptimization rows

- **`SecondOrderOptimization (Gauss-Newton)`** is `iterator = :newton` on the normal equations: Gauss–Newton, since the Hessian it is given is ``J^T J``. It takes the full step, with no line search or trust region (a diagonal shift only when the system cannot be solved), so a step that raises the cost is caught only by the stall test, and the row then ends `not_converged`. **`CaNNOLeS`** (`method = :Newton_noFHess`) is Gauss–Newton too, globalized: an ``LDL^T`` factorization of the augmented system ``[\rho I\ \ J^T;\ J\ \ {-I}]``, with ``\rho`` raised from 0 only when the factorization fails or has the wrong inertia, then an Armijo backtracking line search on ``\tfrac12\|F\|^2``.
- **`SecondOrderOptimization (LM, tall)`** is Levenberg–Marquardt on the residual-and-Jacobian form (`formulation = :jacobian`): each step solves the damped least-squares problem in ``J`` by QR, without forming ``J^T J``, on the `NLLSModel` model. `storage = :auto` stores ``J`` dense or sparse from its fill (sparse at the large sizes), and `linsolver = :auto` factorizes it by dense QR or SPQR. The rows without "tall" solve the normal equations in ``J^T J``.

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed/dotted lines) and **Cost + Linear System Assembly** (solid/dash-dot lines) across problem sizes.

![Multilateration Model Evaluation Scaling](../assets/plots/multilateration_models.png)

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers, where each solver is evaluated on its optimal problem representation (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, and `Manifolds` for `Manopt`). Non-converged runs are omitted.

![Multilateration Optimizer Scaling](../assets/plots/multilateration_optimizers.png)

---

## 3. Single-Threaded Results

The same benchmark with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`),
stored separately from the threaded table. Comparing the two shows what threading gains or costs at each size.

![Multilateration Model Evaluation Scaling, 1 thread](../assets/plots/single_threaded/multilateration_models.png)

![Multilateration Optimizer Scaling, 1 thread](../assets/plots/single_threaded/multilateration_optimizers.png)

- [View Single-Threaded Raw Benchmark Results Data (Markdown Table)](../data/single_threaded/multilateration.md)

---

## 4. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/multilateration.md)

---

## 5. Analysis & Key Takeaways

- **Model Efficiency**: At Dimension d = `16`, **`Standalone`** achieves the fastest Cost + Linear System evaluation at **3.60 μs** (32 B allocated).
- **Top Converged Optimizer**: At Dimension d = `16` (14/15 solvers converged), **`SecondOrderOptimization (LM)`** is fastest at **40.54 μs** (5 iterations, final cost `2.79e-03`).
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) within `500` iterations and `30.0s` are plotted.
