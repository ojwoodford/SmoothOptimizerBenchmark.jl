# Sparse Bundle Adjustment

- **Category**: `large_sparse`
- **Scaling Metric**: Cameras Ncam
- **Problem Sizes Evaluated**: 4, 8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 256 (12 sizes)
- **Standard Baseline Model for Optimizers**: `BundleAdjustmentModels`
- **Derivatives**: mixed

**Derivatives: mixed, exempt from the rule.** Each observation depends on a camera and a point, 12 scalar inputs, but this problem is exempt from the rule: its two models are separate formulations of the problem, not two uses of the same per-cost code, so no equivalent pair of rows is being compared. The `NLLSModel` model differentiates each observation automatically (NLLSModel's `computeresjac`); `BundleAdjustmentModels` evaluates its own Jacobian.

---

## The Problem

Take many photographs of a scene from different places. Bundle adjustment works out, at the same time, where every camera was and where every visible point of the scene is in 3D, by making them agree with where each point actually appears in each photograph. For each observation of a point in a photograph there is a prediction (project the 3D point through the camera) and a measurement (the pixel where it was seen); their difference is the *reprojection error*, two numbers, and the optimizer minimizes the sum of the squares of all of them:

```math
f(\text{cameras}, \text{points}) = \tfrac12 \sum_{(c,\,p)\ \text{observed}} \bigl\lVert \pi(\text{camera}_c, \text{point}_p) - z_{cp} \bigr\rVert^2 .
```

A camera has 9 unknowns (3 for its orientation, 3 for its position, its focal length and 2 lens-distortion coefficients, the model of the "Bundle Adjustment in the Large" data sets); a point has 3. The scenes here are synthetic: ``N_{cam}`` cameras in a row, ``5 N_{cam}`` points, each point seen by a run of neighbouring cameras, 30 % of them (and at least 3). The observations are exact, so the minimum is zero; the optimizers start from the true scene with the points and the cameras' orientations and positions slightly perturbed.

### Where it is used

Photogrammetry and 3D reconstruction from photographs (structure from motion), mapping from aerial and street-level imagery, visual SLAM in robotics and augmented reality, camera tracking for film visual effects, and multi-camera calibration.

### Similar problems

Problems with two kinds of unknown, a few large ones and many small ones, where each measurement involves one of each: SLAM with landmarks, calibrating a sensor network against targets, and matrix factorization. That structure allows the standard trick of this field: the points can be eliminated exactly (the Schur complement), leaving a much smaller system in the cameras alone, of side ``9 N_{cam}``. Here two cameras share points when they are within about ``0.3\,N_{cam}`` of each other in the row, so that reduced system is banded and about half full.

### How it scales

The size is the number of cameras, ``N_{cam}``. The unknowns grow in proportion to it. The observations grow faster, as ``N_{cam}^2``, because each point is seen by a fixed fraction of the cameras; in real data sets a point is typically seen by a bounded number of cameras, and observations grow in proportion to the scene.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``N_{cam}`` | 4 | 256 |
| Variables | ``N_{cam}`` cameras of size 9 and ``5 N_{cam}`` points of size 3 | 4 and 20 | 256 and 1280 |
| Unknowns in total | ``24\,N_{cam}`` | 96 | 6144 |
| Costs | one per observation, each of 2 residuals depending on one camera and one point (12 unknowns): about ``1.5\,N_{cam}^2`` (``15\,N_{cam}`` at the two smallest sizes) | 60 | 98304 |
| Residuals in total | about ``3\,N_{cam}^2`` | 120 | 196608 |
| Jacobian | residuals × unknowns, sparse: 24 non-zeros per observation | 120 × 96 | 196608 × 6144 |
| Hessian ``J^T J`` | ``24 N_{cam} \times 24 N_{cam}``, block-sparse: a 9 × 9 block per camera, a 3 × 3 block per point, a 9 × 3 block per observation; ``9 N_{cam} \times 9 N_{cam}`` once the points are eliminated | 96 × 96 | 6144 × 6144 |

---

## The SecondOrderOptimization rows

- **`SecondOrderOptimization (LM)`** and **`(Dogleg)`** solve the normal equations with the points eliminated by a Schur complement (`reduction = :eliminate`); LM uses `:levenbergmarquardt_dtd`, whose damping is scaled by the running maximum of the squared column norms of ``J`` (the diagonal of ``J^T J``).
- **`SecondOrderOptimization (Gauss-Newton)`** is `iterator = :newton`, with the same Schur elimination: the full Gauss–Newton step, with no line search or trust region, so a step that raises the cost is caught only by the stall test. **`CaNNOLeS`** (`method = :Newton_noFHess`, on `BundleAdjustmentModels`) is Gauss–Newton globalized by a regularized ``LDL^T`` factorization of the augmented system and an Armijo backtracking line search.
- **`SecondOrderOptimization (LM, tall)`** uses the same iterator and `reduction = :eliminate` on the residual-and-Jacobian form (`formulation = :jacobian`): the points are eliminated by QR of their blocks (square-root bundle adjustment), and the reduced camera system is stored as `storage = :auto` chooses and factorized by QR, without forming ``J^T J``.
- **`SecondOrderOptimization (LM, tall, LSMR)`** is the tall row with `linsolver = :lsmr`: the reduced least-squares problem is solved iteratively by LSMR (Krylov.jl) instead of by QR.

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed/dotted lines) and **Cost + Linear System Assembly** (solid/dash-dot lines) across problem sizes.

![Sparse Bundle Adjustment Model Evaluation Scaling](../assets/plots/bundle_adjustment_models.png)

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers, where each solver is evaluated on its optimal problem representation (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, and `Manifolds` for `Manopt`). Non-converged runs are omitted.

![Sparse Bundle Adjustment Optimizer Scaling](../assets/plots/bundle_adjustment_optimizers.png)

---

## 3. Single-Threaded Results

The same benchmark with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`),
stored separately from the threaded table. Comparing the two shows what threading gains or costs at each size.

![Sparse Bundle Adjustment Model Evaluation Scaling, 1 thread](../assets/plots/single_threaded/bundle_adjustment_models.png)

![Sparse Bundle Adjustment Optimizer Scaling, 1 thread](../assets/plots/single_threaded/bundle_adjustment_optimizers.png)

- [View Single-Threaded Raw Benchmark Results Data (Markdown Table)](../data/single_threaded/bundle_adjustment.md)

---

## 4. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/bundle_adjustment.md)

---

## 5. Analysis & Key Takeaways

- **Model Efficiency**: At Cameras Ncam = `256`, **`NLLSModel`** achieves the fastest Cost + Linear System evaluation at **18.25 ms** (93.0 MiB allocated).
- **Top Converged Optimizer**: At Cameras Ncam = `256` (4/10 solvers converged), **`SecondOrderOptimization (LM)`** is fastest at **1.51 s** (10 iterations, final cost `1.36e-20`).
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) within `500` iterations and `30.0s` are plotted.
