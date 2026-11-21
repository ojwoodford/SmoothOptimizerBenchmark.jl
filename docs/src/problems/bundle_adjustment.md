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
f(\mathbf{c}_1, \dots, \mathbf{p}_1, \dots) = \tfrac12 \sum_{(j,\,i)\ \text{observed}} \bigl\lVert \pi(\mathbf{c}_j, \mathbf{p}_i) - \mathbf{z}_{ji} \bigr\rVert^2 ,
```

where ``\mathbf{c}_j`` holds camera ``j``'s parameters, ``\mathbf{p}_i`` is point ``i``'s position, ``\mathbf{z}_{ji}`` is where point ``i`` was seen in photograph ``j``, and ``\pi`` is the camera projection. A camera has 9 unknowns (3 for its orientation, 3 for its position, its focal length and 2 lens-distortion coefficients, the model of the "Bundle Adjustment in the Large" data sets); a point has 3. The scenes here are synthetic and the same at every size but for the counts: ``N_{cam}`` cameras evenly spaced on a ring of radius 3, each looking at the centre, around ``5 N_{cam}`` points drawn uniformly in a ball of radius 1.5 at the centre, every camera with a focal length of 1 and no lens distortion. Each point is seen by the half of the cameras nearest its direction on the ring (at least 8, or all of them when there are fewer). So every camera sees the scene from the same distance and at the same angle, whatever ``N_{cam}``, and the conditioning does not change with the size: without its 7 gauge directions the Jacobian's condition number is about 300 from 8 cameras up (860 at 4). The observations are exact, so the minimum is zero; the optimizers start from the true scene with the points and the cameras' orientations and positions slightly perturbed.

### Where it is used

Photogrammetry and 3D reconstruction from photographs (structure from motion), mapping from aerial and street-level imagery, visual SLAM in robotics and augmented reality, camera tracking for film visual effects, and multi-camera calibration.

### Similar problems

Problems with two kinds of unknown, a few large ones and many small ones, where each measurement involves one of each: SLAM with landmarks, calibrating a sensor network against targets, and matrix factorization. That structure allows the standard trick of this field: the points can be eliminated exactly (the Schur complement), leaving a much smaller system in the cameras alone, of side ``9 N_{cam}``. Here two cameras share points unless they are on opposite sides of the ring, so that reduced system is nearly full.

### How it scales

The size is the number of cameras, ``N_{cam}``. The unknowns grow in proportion to it. The observations grow faster, as ``N_{cam}^2``, because each point is seen by a fixed fraction of the cameras (a bounded number of cameras would let the conditioning grow with the size: a chain of cameras with points seen by 8 of them was measured and rejected for that); in real data sets a point is typically seen by a bounded number of cameras, and observations grow in proportion to the scene.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``N_{cam}`` | 4 | 256 |
| Variables | ``N_{cam}`` cameras of size 9 and ``5 N_{cam}`` points of size 3 | 4 and 20 | 256 and 1280 |
| Unknowns in total | ``24\,N_{cam}`` | 96 | 6144 |
| Costs | one per observation, each of 2 residuals depending on one camera and one point (12 unknowns): ``5 N_{cam} \min\bigl(N_{cam}, \max(8, N_{cam}/2)\bigr)``, so ``2.5\,N_{cam}^2`` from 16 cameras | 80 | 163840 |
| Residuals in total | twice the costs: ``5\,N_{cam}^2`` from 16 cameras | 160 | 327680 |
| Jacobian | residuals × unknowns, sparse: 24 non-zeros per observation | 160 × 96 | 327680 × 6144 |
| Hessian ``\mathbf{J}^T \mathbf{J}`` | ``24 N_{cam} \times 24 N_{cam}``, block-sparse: a 9 × 9 block per camera, a 3 × 3 block per point, a 9 × 3 block per observation; ``9 N_{cam} \times 9 N_{cam}`` once the points are eliminated | 96 × 96 | 6144 × 6144 |

---

## Which model each row runs on, and how it stops

Each row runs on its package's native model, or on the `Standalone` model if its package has none here (see the overview). The criteria are the benchmark's gradient, step and relative cost-change tolerances, as far as the package offers them; the overview's table says what each is called in each package.

| Row | Model | Stopping criteria given |
|:---|:---|:---|
| `CaNNOLeS` | `BundleAdjustmentModels` | gradient |
| `Ipopt` | `BundleAdjustmentModels` | gradient, step |
| `JSOSolvers (tron)` | `BundleAdjustmentModels` | gradient |
| `JSOSolvers (trunk)` | `BundleAdjustmentModels` | gradient |
| `MadNLP` | `BundleAdjustmentModels` | gradient |
| `SecondOrderOptimization` | `NLLSModel` | gradient, step, relative cost change |

The `SecondOrderOptimization` row runs `iterator = :levenbergmarquardt`, `linsolver = :cholesky`, `formulation = :hessian`, `reduction = :eliminate`, `storage = :sparse`: the configuration NLLSModel's `recommendoptimizer` chose for this problem at its largest size, Cameras Ncam = 256, with one thread (then fixed in the problem's code, the same at every size).

---

## Bundle adjustment's rows

- **`SecondOrderOptimization`** forms the Gauss–Newton system ``\mathbf{J}^T \mathbf{J}`` (`formulation = :hessian`), eliminates the points from it (`reduction = :eliminate`: the Schur complement), and factorizes the reduced camera system by sparse Cholesky; its iterator is Levenberg–Marquardt. The recommender chooses the Hessian path because ``\mathbf{J}`` is rank-deficient by the gauge (the scene's position, orientation and scale are free), which damping handles.
- **`CaNNOLeS`** (`method = :Newton_noFHess`, on `BundleAdjustmentModels`) is Gauss–Newton globalized by a regularized ``\mathbf{L}\mathbf{D}\mathbf{L}^T`` factorization of the augmented system and an Armijo backtracking line search.

---

## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed/dotted lines) and **Cost + Linear System Assembly** (solid/dash-dot lines) across problem sizes.

![Sparse Bundle Adjustment Model Evaluation Scaling](../assets/plots/bundle_adjustment_models.png)

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers, each on the model given in the table above (its package's native model, or the `Standalone` model). Only `ok` rows are plotted.

![Sparse Bundle Adjustment Optimizer Scaling](../assets/plots/bundle_adjustment_optimizers.png)

---

## 3. Single-Threaded Results

The same benchmark with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`),
stored separately from the multi-threaded table. Comparing the two shows what threading gains or costs at each size.

![Sparse Bundle Adjustment Model Evaluation Scaling, 1 thread](../assets/plots/single_threaded/bundle_adjustment_models.png)

![Sparse Bundle Adjustment Optimizer Scaling, 1 thread](../assets/plots/single_threaded/bundle_adjustment_optimizers.png)

- [View Single-Threaded Raw Benchmark Results Data (Markdown Table)](../data/single_threaded/bundle_adjustment.md)

---

## 4. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/bundle_adjustment.md)

---

## 5. Analysis & Key Takeaways

- **Model Efficiency**: At Cameras Ncam = `256`, **`NLLSModel`** achieves the fastest Cost + Linear System evaluation at **30.95 ms** (155.0 MiB allocated).
- **Top Converged Optimizer**: At Cameras Ncam = `256` (4/6 solvers converged), **`SecondOrderOptimization`** is fastest at **1.38 s** (3 iterations, final cost `2.39e-19`).
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) within `500` iterations and `30.0s` are plotted.
