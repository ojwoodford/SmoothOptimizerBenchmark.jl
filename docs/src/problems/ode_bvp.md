# 1D ODE Boundary Value Problem

- **Category**: `large_sparse`
- **Scaling Metric**: Grid Points N
- **Problem Sizes Evaluated**: 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768 (11 sizes)
- **Standard Baseline Model for Optimizers**: `Standalone (Sparse)`
- **Derivatives**: autodiff

**Derivatives: automatic.** Every cost of this problem depends on at most 8 scalar inputs, so each cost's Jacobian is computed by forward-mode automatic differentiation, with NLLSModel's `computeresjac`. The `Standalone` model fills its residual vector and Jacobian by calling that same function for each cost in a plain single-threaded loop, so the NLLSModel and Standalone models evaluate a cost with the same code; what differs between their rows is how the linear system is assembled and how the optimizer uses it. The mode applies to the NLLSModel and Standalone models. The `JuMP` model, the native model of JSOSolvers, Ipopt, MadNLP and CaNNOLeS, is differentiated by JuMP's own automatic differentiation, exactly and with exact second derivatives, whatever the problem's mode: a native model's derivatives are part of the package under test.

---

## The Problem

A differential equation describes how a quantity varies along a line; a *boundary value problem* fixes its value at both ends and asks for everything in between. This one is the Bratu equation with a linear loss term, a simple model of a material that generates heat by a reaction that speeds up as it warms, while losing heat in proportion to its temperature and by conduction to its two cooled ends:

```math
-u''(x) + c\, u(x) = \lambda\, e^{u(x)}, \qquad 0 < x < (N+1)h, \qquad u(0) = u\bigl((N+1)h\bigr) = 0, \qquad c = 4, \quad \lambda = 1 .
```

To solve it on a computer, the line is divided by ``N`` evenly spaced grid points a fixed distance ``h = 0.1`` apart, and the unknowns are the values ``u_1, \dots, u_N`` at those points. The line is ``(N+1)h`` long, so it grows with ``N`` while the spacing stays the same: refining a fixed line instead would divide the residuals by a shrinking ``h^2`` and make the conditioning grow as ``N^2``, a second thing changing with the size. The equation becomes one algebraic equation per grid point, each involving a point and its two neighbours:

```math
\epsilon_i(\mathbf{u}) = \frac{-u_{i-1} + 2u_i - u_{i+1}}{h^2} + c\, u_i - \lambda\, e^{u_i}, \qquad u_0 = u_{N+1} = 0 .
```

The optimizer minimizes ``\tfrac12 \sum_i \epsilon_i(\mathbf{u})^2``, starting from ``\mathbf{u} = \mathbf{0}``. There are as many equations as unknowns, so at the solution every residual is zero: this is a system of nonlinear equations, solved as a least-squares problem.

### Where it is used

Discretized differential equations are the daily work of scientific computing: heat conduction, reaction and diffusion in chemical engineering, the bending of beams, electrostatics. More generally the problem stands for solving a large sparse system of nonlinear equations.

### Similar problems

Its structure is that of the [sparse Rosenbrock problem](rosenbrock_sparse.md), a chain in which each unknown is tied to its neighbours, with a tridiagonal Jacobian; unlike it, it is square (as many residuals as unknowns). Its conditioning is the same at every size: the Jacobian's condition number is about 110 at 32 points and about 160 from a few hundred points up, where the line is longer than the distance over which the loss term damps a disturbance. The [sparse conditioning sweep](conditioning_sparse.md) has the same tridiagonal structure at one size, with the condition number as what is swept.

### How it scales

The size is the number of grid points, ``N``. Variables, residuals and non-zeros grow in proportion to it, and so does the work per iteration for a sparse direct solver; the conditioning does not change.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``N`` | 32 | 32768 |
| Variables | ``N``, each a scalar | 32 | 32768 |
| Unknowns in total | ``N`` | 32 | 32768 |
| Costs | ``N``, each one residual: ``N - 2`` depend on three variables, the 2 at the ends on two | 32 | 32768 |
| Residuals in total | ``N`` | 32 | 32768 |
| Jacobian | ``N \times N``, tridiagonal, ``3N - 2`` non-zeros | 94 non-zeros | 98302 non-zeros |
| Hessian ``\mathbf{J}^T \mathbf{J}`` | ``N \times N``, pentadiagonal, ``5N - 6`` non-zeros | 154 non-zeros | 163834 non-zeros |

---

## Which model each row runs on, and how it stops

Each row runs on its package's native model, or on the `Standalone` model if its package has none here (see the overview). The criteria are the benchmark's gradient, step and relative cost-change tolerances, as far as the package offers them; the overview's table says what each is called in each package.

| Row | Model | Stopping criteria given |
|:---|:---|:---|
| `CaNNOLeS` | `JuMP` | gradient |
| `Ipopt` | `JuMP` | gradient, step, relative cost change |
| `JSOSolvers (tron)` | `JuMP` | gradient |
| `JSOSolvers (trunk)` | `JuMP` | gradient |
| `LeastSquaresOptim (Dogleg)` | `Standalone (Sparse)` | gradient, step, relative cost change |
| `LeastSquaresOptim (LM)` | `Standalone (Sparse)` | gradient, step, relative cost change |
| `MadNLP` | `JuMP` | gradient |
| `NonlinearSolve (LM)` | `Standalone (Sparse)` | its own defaults |
| `NonlinearSolve (TrustRegion)` | `Standalone (Sparse)` | its own defaults |
| `Optim (Newton)` | `Standalone (Sparse)` | gradient, step, relative cost change |
| `Optim (NewtonTrustRegion)` | `Standalone (Sparse)` | gradient, step, relative cost change |
| `SecondOrderOptimization` | `NLLSModel (Sparse)` | gradient, step, relative cost change |

The `SecondOrderOptimization` row runs `iterator = :levenbergmarquardt`, `linsolver = :ldl`, `formulation = :hessian`, `reduction = :none`, `storage = :sparse`: the configuration NLLSModel's `recommendoptimizer` chose for this problem at its largest size, Grid Points N = 32768, with one thread (then fixed in the problem's code, the same at every size).

---


## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed/dotted lines) and **Cost + Linear System Assembly** (solid/dash-dot lines) across problem sizes.

![1D ODE Boundary Value Problem Model Evaluation Scaling](../assets/plots/ode_bvp_models.png)

---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers, each on the model given in the table above (its package's native model, or the `Standalone` model). Only `ok` rows are plotted.

![1D ODE Boundary Value Problem Optimizer Scaling](../assets/plots/ode_bvp_optimizers.png)

---

## 3. Single-Threaded Results

The same benchmark with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`),
stored separately from the multi-threaded table. Comparing the two shows what threading gains or costs at each size.

![1D ODE Boundary Value Problem Model Evaluation Scaling, 1 thread](../assets/plots/single_threaded/ode_bvp_models.png)

![1D ODE Boundary Value Problem Optimizer Scaling, 1 thread](../assets/plots/single_threaded/ode_bvp_optimizers.png)

- [View Single-Threaded Raw Benchmark Results Data (Markdown Table)](../data/single_threaded/ode_bvp.md)

---

## 4. Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/ode_bvp.md)

---

## 5. Analysis & Key Takeaways

- **Model Efficiency**: At Grid Points N = `32768`, **`NLLSModel (Sparse)`** achieves the fastest Cost + Linear System evaluation at **1.00 ms** (64 B allocated).
- **Top Converged Optimizer**: At Grid Points N = `32768` (7/12 solvers converged), **`SecondOrderOptimization`** is fastest at **17.22 ms** (4 iterations, final cost `9.35e-21`).
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = 1.0e-8`, `xtol = 1.0e-8`, `ftol = 1.0e-8`) within `500` iterations and `30.0s` are plotted.
