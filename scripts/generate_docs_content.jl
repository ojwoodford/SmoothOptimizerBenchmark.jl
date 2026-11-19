# Script to generate markdown pages for Documenter.jl from benchmark results
using SmoothOptimizerBenchmark
using Printf

function format_time(ns::Float64)
    isnan(ns) && return "FAILED"
    ns < 1e3 && return @sprintf("%.1f ns", ns)
    ns < 1e6 && return @sprintf("%.2f μs", ns / 1e3)
    ns < 1e9 && return @sprintf("%.2f ms", ns / 1e6)
    return @sprintf("%.2f s", ns / 1e9)
end

function format_bytes(bytes::Int)
    bytes < 1024 && return "$(bytes) B"
    bytes < 1024^2 && return @sprintf("%.1f KiB", bytes / 1024)
    return @sprintf("%.1f MiB", bytes / (1024^2))
end

const CANONICAL_PROBLEM_SLUGS = [
    "rosenbrock_sparse",
    "curve_fitting",
    "curve_fitting_robust",
    "polynomial_fitting",
    "rosenbrock_dense",
    "multilateration",
    "affine_alignment",
    "pose_chain",
    "ode_bvp",
    "bundle_adjustment",
    "robust_procrustes"
]

function sort_results_canonically(results::Vector{ProblemScalingBenchmarkResult})
    slug_rank(r) = begin
        idx = findfirst(==(problem_slug(r.problem)), CANONICAL_PROBLEM_SLUGS)
        idx === nothing ? 999 : idx
    end
    return sort(results; by = r -> (slug_rank(r), r.problem))
end

function summarize_solvers(res::ProblemScalingBenchmarkResult)
    pkgs = String[]
    seen = Set{String}()
    order = [
        ("secondorder", "SecondOrderOptimization"),
        ("leastsquares", "LeastSquaresOptim"),
        ("optim (", "Optim"),
        ("jsosolvers", "JSOSolvers"),
        ("ipopt", "Ipopt"),
        ("madnlp", "MadNLP"),
        ("nonlinearsolve", "NonlinearSolve"),
        ("cannoles", "CaNNOLeS"),
        ("manopt", "Manopt")
    ]
    all_names = String[]
    for sr in res.size_results
        append!(all_names, keys(sr.optimizer_results))
    end
    for (needle, label) in order
        if any(n -> occursin(needle, lowercase(n)), all_names) && !(label in seen)
            push!(pkgs, label)
            push!(seen, label)
        end
    end
    return join(pkgs, ", ")
end

# The derivative mode a problem declares (DM12): from its definition, looked up by name among the registered problems,
# not from the results
function problem_derivatives(problem_name::AbstractString)
    probs = get_all_problems()
    i = findfirst(p -> p.name == problem_name, probs)
    i === nothing && throw(ArgumentError("No registered problem is named $(repr(problem_name))"))
    return probs[i].derivatives
end

const DERIV_AUTODIFF = "**Derivatives: automatic.** Every cost of this problem depends on at most $(SmoothOptimizerBenchmark.AUTODIFF_MAX_INPUTS) scalar inputs, so each cost's Jacobian is computed by forward-mode automatic differentiation, with NLLSModel's `computeresjac`."
const DERIV_AUTODIFF_STANDALONE = " The `Standalone` model fills its residual vector and Jacobian by calling that same function for each cost in a plain single-threaded loop, so every model evaluates a cost with the same code; what differs between rows is how the linear system is assembled and how the optimizer uses it."
const DERIV_JUMP = " The `NLPModels (MathOptNLSModel)` model is differentiated by JuMP's own automatic differentiation."
const DERIV_ANALYTIC = "**Derivatives: analytic.** A cost of this problem depends on more than $(SmoothOptimizerBenchmark.AUTODIFF_MAX_INPUTS) scalar inputs, so each cost has a hand-written Jacobian. NLLSModel calls it through `computeresjac`, and the `Standalone` model fills its residual vector and Jacobian by calling the same function for each cost in a plain single-threaded loop, so every model evaluates a cost with the same code."

# The paragraph under each problem page's header: what its derivative mode means on that problem, by what its models are
const DERIVATIVES_NOTES = Dict(
    "curve_fitting" => DERIV_AUTODIFF * DERIV_AUTODIFF_STANDALONE,
    "ode_bvp" => DERIV_AUTODIFF * DERIV_AUTODIFF_STANDALONE * DERIV_JUMP,
    "rosenbrock_dense" => DERIV_AUTODIFF * DERIV_AUTODIFF_STANDALONE * DERIV_JUMP,
    "rosenbrock_sparse" => DERIV_AUTODIFF * DERIV_AUTODIFF_STANDALONE * DERIV_JUMP,
    "pose_chain" => DERIV_AUTODIFF,
    "curve_fitting_robust" => "**Derivatives: automatic.** Every cost of this problem depends on at most $(SmoothOptimizerBenchmark.AUTODIFF_MAX_INPUTS) scalar inputs, so its costs are differentiated by forward-mode automatic differentiation: the `NLLSModel (Static)` model, which the native SecondOrderOptimization rows run on, computes each cost's Jacobian with NLLSModel's `computeresjac`. The `Standalone (fudged)` model, which every other row runs on, does not use that code yet: its rewritten residuals have a hand-written Jacobian (the exponential model's derivative, each row scaled as described below).",
    "polynomial_fitting" => DERIV_ANALYTIC,
    "multilateration" => DERIV_ANALYTIC,
    "affine_alignment" => "**Derivatives: analytic, not yet in place.** A cost of this problem depends on more than $(SmoothOptimizerBenchmark.AUTODIFF_MAX_INPUTS) scalar inputs (all ``n(n+1)`` of the affine map's), so by the benchmark's rule its costs are to have hand-written Jacobians shared by every model. They do not yet: the problem has one model, `Standalone`, which computes the Jacobian of the whole residual vector by LeastSquaresOptim's forward-mode automatic differentiation (`autodiff = :forward`), and every row, SecondOrderOptimization's included, runs on it.",
    "robust_procrustes" => "**Derivatives: analytic.** Each correspondence's residual depends on the rotation, ``d(d-1)/2`` scalar inputs (more than $(SmoothOptimizerBenchmark.AUTODIFF_MAX_INPUTS) from ``d = 5``), and every model has a hand-written Jacobian. `NLLSModel (ManifoldVar)` computes each correspondence's Jacobian in the orthonormal tangent basis of `Manifolds.jl`, through `computeresjac`; `NLLSModel (Specialized)` does the same for its own rotation type, with a specialized kernel; and the `Manifolds` model's per-correspondence Jacobian blocks, ``-p E_l b_i`` with the products ``E_l b_i`` precomputed, are hand-written as well (the Manopt row builds the same blocks).",
    "bundle_adjustment" => "**Derivatives: mixed, exempt from the rule.** Each observation depends on a camera and a point, 12 scalar inputs, but this problem is exempt from the rule: its two models are separate formulations of the problem, not two uses of the same per-cost code, so no equivalent pair of rows is being compared. The `NLLSModel` model differentiates each observation automatically (NLLSModel's `computeresjac`); `BundleAdjustmentModels` evaluates its own Jacobian.",
)

# `single_threaded`: the same problems run with NLLSModel and BLAS on one thread, stored in `data/single_threaded/` and
# plotted in `assets/plots/single_threaded/`; each problem page shows them beside the threaded results.
function generate_docs_markdown(results::Vector{ProblemScalingBenchmarkResult}; single_threaded::Vector{ProblemScalingBenchmarkResult}=ProblemScalingBenchmarkResult[], docs_dir=DEFAULT_DOCS_DIR)
    mkpath(joinpath(docs_dir, "problems"))
    mkpath(joinpath(docs_dir, "assets", "plots"))
    mkpath(joinpath(docs_dir, "data"))

    ordered_results = sort_results_canonically(results)

    suite_rows = String[]
    for res in ordered_results
        slug = problem_slug(res.problem)
        n_sz = length(res.sizes)
        sz_range = isempty(res.sizes) ? "-" : "$(first(res.sizes)) … $(last(res.sizes))"
        target_m = isempty(res.size_results) ? "Standard" : first(res.size_results).target_model
        solvers_str = summarize_solvers(res)
        push!(suite_rows, "| [$(res.problem)](problems/$(slug).md) | `$(res.category)` | $(res.size_metric_name) | $(n_sz) sizes ($(sz_range)) | `$(target_m)` | $(problem_derivatives(res.problem)) | $(solvers_str) |")
    end
    suite_table = join(suite_rows, "\n")

    # 1. Generate index.md
    index_md = """
# SmoothOptimizerBenchmark.jl

**SmoothOptimizerBenchmark.jl** provides systematic, reproducible, multi-scale performance benchmarking across smooth second-order, nonlinear least-squares, and Riemannian manifold optimization packages in Julia:

- **`SecondOrderOptimization.jl`**: Levenberg-Marquardt and Dogleg trust-region algorithms with zero-allocation static, dense, and sparse linear system solvers.
- **`LeastSquaresOptim.jl`**: Levenberg-Marquardt and Dogleg algorithms for nonlinear least squares.
- **`Optim.jl`**: Trust-Region Newton (`NewtonTrustRegion`) and Line-Search Newton (`Newton`).
- **`JSOSolvers.jl`**: Matrix-free / trust-region solvers `trunk` and `tron` via `NLPModels`.
- **`Ipopt.jl`**: Primal-dual interior-point nonlinear programming solver via `NLPModelsIpopt`.
- **`MadNLP.jl`**: Pure-Julia filter line-search interior-point solver via `NLPModels`.
- **`NonlinearSolve.jl`**: SciML nonlinear least-squares solvers (`LevenbergMarquardt`, `TrustRegion`).
- **`CaNNOLeS.jl`**: Constrained and nonlinear least-squares solver exploiting equality-constrained KKT structure.
- **`Manopt.jl`**: Riemannian Levenberg-Marquardt optimization on matrix manifolds (`Manifolds.jl`).

What each package supports (variables, derivatives, robust kernels, constraints, steps, linear solvers), and how each model in the benchmark reaches each optimizer, is on the [Package Features](features.md) page. It explains why a package is absent from a problem's table.

---

## Benchmarking Methodology

### Two-Phase Decoupled Architecture
To separate modeling overhead from solver algorithm efficiency, every problem is benchmarked in two phases:

1. **Phase 1 — Model Evaluation Scaling**:
   Benchmarks pure **Cost Evaluation** (\$f(x) = \\frac{1}{2}\\|r(x)\\|_2^2\$) and **Cost + Linear System Assembly** (\$g = J^T r\$ and \$H = J^T J\$ or exact Hessian) across competing model representations (`NLLSModel`, `Standalone` `LeastSquaresProblem`, `NLPModels` / `JuMP`, `BundleAdjustmentModels`, and `Manifolds`).
2. **Phase 2 — Peak Solver Throughput Scaling (Each Optimizer on Optimal Model)**:
   Every optimizer is benchmarked on its natural, optimal model representation (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` / `BundleAdjustmentModels` for JSO and interior-point solvers, and `Manifolds` for `Manopt`) under identical universal stopping criteria (`gtol = $(DEFAULT_GTOL)`, `xtol = $(DEFAULT_XTOL)`, `ftol = $(DEFAULT_FTOL)`, `maxiters = $(DEFAULT_MAXITERS)`, `maxtime = $(DEFAULT_MAXTIME)s`).
   - Every optimizer appears as **exactly one curve**, comparing solvers at their peak practical throughput from a fair cold start without wrapper penalties or duplicate entries.
   - Every concrete `(optimizer, model-type)` specialization is pre-warmed prior to timing so LLVM JIT compilation is excluded.
   - Every row's final cost is evaluated by the harness at the point the solver returned, not taken from the solver. A row's status is decided by the harness too: `ok` when the solver reports convergence **and** the final cost is at most ``\\max(c_{\\text{ref}}(1 + 10^{-4}), 10^{-6})``, with ``c_{\\text{ref}}`` the problem's known minimum at that size (0 for affine alignment, both Rosenbrocks, the ODE BVP and bundle adjustment; the extended-precision minimum for the polynomial fit), or else the lowest final cost of any row at that size in the same table. A row whose solver claims convergence but fails that test is `local_minimum` if the cost reduction the Gauss–Newton model predicts from its point is below ``10^{-8}`` × its cost (a minimum of the Gauss–Newton model: a saddle of the true cost would pass), and `above_reference` otherwise. Rows that stop on the iteration or time limit or stall are `not_converged` or `timeout` (the message says when the cost test passes anyway).
   - Only `ok` rows are plotted (`converged = true` in the raw data tables); every other status is omitted (`NaN`) from the runtime plots, `local_minimum` included, since its time is the time to a different optimum.
   - Results stream line-by-line directly to Markdown tables in `docs/src/data/` as each model and optimizer measurement completes.

### Derivatives
Each problem has one derivative mode, which every model handed to an optimizer follows, and which its page states. A problem is **automatic** when every cost depends on at most $(SmoothOptimizerBenchmark.AUTODIFF_MAX_INPUTS) scalar inputs at every size: each cost's Jacobian is then computed by NLLSModel's forward-mode automatic differentiation. Otherwise it is **analytic**, and each cost has a hand-written Jacobian. Either way the `Standalone` model fills its residuals and Jacobian by calling the same per-cost functions in a plain single-threaded loop, so the rows differ by how the linear system is assembled and how it is solved, not by how a cost is differentiated; bundle adjustment, whose two models are separate formulations, is exempt (**mixed**).

### Threaded and Single-Threaded Tables
Every problem is run twice. The **threaded** table runs Julia and NLLSModel on the thread counts in its data file's
header and **BLAS on one thread**; the **single-threaded** table runs NLLSModel and BLAS on one thread
(`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`) and is stored separately, in `docs/src/data/single_threaded/`.
Each problem page shows both.

---

## Benchmark Problem Suite

| Problem | Category | Scaling Metric | Sizes Tested | Baseline Model | Derivatives | Tested Solver Packages |
|:---|:---|:---|:---|:---|:---|:---|
$(suite_table)

---

## Executive Summary of Results

1. **Model Evaluation & Linear System Assembly**:
   - `NLLSModel.jl` achieves zero-allocation cost and Gauss-Newton normal-equation assembly on static and block-sparse problems, outperforming generic `JuMP` / `NLPModels` and `BundleAdjustmentModels` coordinate assembly by **3×–10×** at scale.
   - Hand-specialized manifold residuals (`NLLSModel (Specialized)`) on \$SO(d)\$ eliminate tangent-basis allocation overhead relative to generic `Manifolds.jl` / `ManifoldVar` representations.

2. **Optimizer Efficiency & Scaling**:
   - **`SecondOrderOptimization.jl` (LM & Dogleg)**: Consistently delivers the lowest latency on small-to-medium dense problems and scales linearly on banded/tridiagonal sparse problems via direct sparse `LDL` factorizations.
   - **`CaNNOLeS.jl` & `MadNLP.jl`**: Excel on large-scale sparse Bundle Adjustment, where augmented KKT / interior-point sparse factorizations avoid dense fill-in from high-degree camera columns in \$J^T J\$.
   - **`Optim.jl` (`Newton` / `NewtonTrustRegion`)**: Strong performance on dense problems and sparse line-search Newton; `NewtonTrustRegion` requires dense eigendecompositions and is inapplicable to sparse Hessians.
   - **`JSOSolvers.jl` (`trunk` / `tron`)**: Matrix-free Krylov trust-region methods (`hprod!`) scale well on well-conditioned sparse problems (such as Sparse Rosenbrock) with minimal memory footprint, though unpreconditioned CG struggles on ill-conditioned Bundle Adjustment and long Pose Chains.
   - **`Ipopt.jl`**: Highly reliable global convergence across dense and sparse problems, with higher per-iteration interior-point overhead at small problem sizes.
   - **`LeastSquaresOptim.jl` & `NonlinearSolve.jl`**: Competitive on small and medium dense problems; on large sparse problems, unpreconditioned iterative `LSMR` (`LeastSquaresOptim`) and sparse QR (`NonlinearSolve`) become bottlenecked compared to sparse Cholesky/LDL normal-equation or KKT solvers.
"""
    open(joinpath(docs_dir, "index.md"), "w") do io
        write(io, index_md)
    end

    # 2. Generate per-problem pages
    for res in ordered_results
        slug = problem_slug(res.problem)
        st_idx = findfirst(r -> r.problem == res.problem, single_threaded)
        prob_md = generate_problem_markdown(res, slug; single_threaded = st_idx === nothing ? nothing : single_threaded[st_idx])
        open(joinpath(docs_dir, "problems", "$(slug).md"), "w") do io
            write(io, prob_md)
        end
    end
end

# What the Gauss-Newton row is against CaNNOLeS (IT2), on the page of every problem that has both
const GN_ROW_NOTE = raw"""
- **`SecondOrderOptimization (Gauss-Newton)`** is `iterator = :newton` on the normal equations: Gauss–Newton, since the Hessian it is given is ``J^T J``. It takes the full step, with no line search or trust region (a diagonal shift only when the system cannot be solved), so a step that raises the cost is caught only by the stall test, and the row then ends `not_converged`. **`CaNNOLeS`** (`method = :Newton_noFHess`) is Gauss–Newton too, globalized: an ``LDL^T`` factorization of the augmented system ``[\rho I\ \ J^T;\ J\ \ {-I}]``, with ``\rho`` raised from 0 only when the factorization fails or has the wrong inertia, then an Armijo backtracking line search on ``\tfrac12\|F\|^2``.
"""
const SOO_ROWS_HEADER = "## The SecondOrderOptimization rows\n\n"
const SECTION_END = "\n---\n"

# What the tall rows are (T4), on the pages of the problems that have them beyond the dense ones
const TALL_ROW_NOTE = raw"""
- **`SecondOrderOptimization (LM, tall)`** is Levenberg–Marquardt on the residual-and-Jacobian form (`formulation = :jacobian`): each step solves the damped least-squares problem in ``J`` by QR, without forming ``J^T J``, on the `NLLSModel` model. `storage = :auto` stores ``J`` dense or sparse from its fill (sparse at the large sizes), and `linsolver = :auto` factorizes it by dense QR or SPQR. The rows without "tall" solve the normal equations in ``J^T J``.
"""
const LSMR_ROW_NOTE = raw"""
- **`SecondOrderOptimization (LM, tall, LSMR)`** is the tall row with `linsolver = :lsmr`: each step's least-squares problem is solved iteratively by LSMR (Krylov.jl) instead of by QR.
"""

# Problem-specific text, placed under a problem page's header
const PROBLEM_NOTES = Dict(
    "rosenbrock_sparse" => SOO_ROWS_HEADER * GN_ROW_NOTE * TALL_ROW_NOTE * LSMR_ROW_NOTE * SECTION_END,
    "pose_chain" => SOO_ROWS_HEADER * GN_ROW_NOTE * TALL_ROW_NOTE * LSMR_ROW_NOTE * SECTION_END,
    "ode_bvp" => SOO_ROWS_HEADER * GN_ROW_NOTE * TALL_ROW_NOTE * SECTION_END,
    "curve_fitting" => SOO_ROWS_HEADER * GN_ROW_NOTE * TALL_ROW_NOTE * SECTION_END,
    "rosenbrock_dense" => SOO_ROWS_HEADER * GN_ROW_NOTE * TALL_ROW_NOTE * SECTION_END,
    "multilateration" => SOO_ROWS_HEADER * GN_ROW_NOTE * TALL_ROW_NOTE * SECTION_END,
    "affine_alignment" => SOO_ROWS_HEADER * GN_ROW_NOTE * SECTION_END,
    "bundle_adjustment" => raw"""
## The SecondOrderOptimization rows

- **`SecondOrderOptimization (LM)`** and **`(Dogleg)`** solve the normal equations with the points eliminated by a Schur complement (`reduction = :eliminate`); LM uses `:levenbergmarquardt_dtd`, whose damping is scaled by the running maximum of the squared column norms of ``J`` (the diagonal of ``J^T J``).
- **`SecondOrderOptimization (Gauss-Newton)`** is `iterator = :newton`, with the same Schur elimination: the full Gauss–Newton step, with no line search or trust region, so a step that raises the cost is caught only by the stall test. **`CaNNOLeS`** (`method = :Newton_noFHess`, on `BundleAdjustmentModels`) is Gauss–Newton globalized by a regularized ``LDL^T`` factorization of the augmented system and an Armijo backtracking line search.
- **`SecondOrderOptimization (LM, tall)`** uses the same iterator and `reduction = :eliminate` on the residual-and-Jacobian form (`formulation = :jacobian`): the points are eliminated by QR of their blocks (square-root bundle adjustment), and the reduced camera system is stored as `storage = :auto` chooses and factorized by QR, without forming ``J^T J``.
- **`SecondOrderOptimization (LM, tall, LSMR)`** is the tall row with `linsolver = :lsmr`: the reduced least-squares problem is solved iteratively by LSMR (Krylov.jl) instead of by QR.

---
""",
    "curve_fitting_robust" => raw"""
## About this problem

Exponential curve fitting, ``a e^{-b t} + c - y`` with one `SVector{3}` variable, on curve fitting's data with **30 % of the points moved up by +1** (one-sided outliers, against noise of σ = 0.02), fitted with a **Huber kernel of width 0.05** (2.5σ, `Huber2oKernel`, with the second-order correction).

- **Native rows.** `SecondOrderOptimization` (Dogleg, LM, Gauss-Newton, LM tall) run the `NLLSModel (Static)` model, which declares the kernel. The Gauss-Newton row is `iterator = :newton`, the full step with no line search or trust region; `CaNNOLeS (fudged)` is Gauss–Newton globalized by a regularized ``LDL^T`` factorization and an Armijo line search.
- **Every other row runs `Standalone (fudged)`.** That includes the general solvers, whether or not the row's name says "fudged". The residuals are rewritten as ``\tilde r = \operatorname{sign}(r)\sqrt{\rho(r^2)}``, and each row of the Jacobian is scaled by ``\rho'(r^2)\,|r| / \sqrt{\rho(r^2)}``. Then ``\tfrac12\|\tilde r\|^2`` is the robust cost exactly and ``\tilde J^T \tilde r`` its gradient.
  - LeastSquaresOptim, NonlinearSolve and CaNNOLeS have no kernel interface, and their rows are named "fudged".
  - So is the control row, `SecondOrderOptimization (LM, fudged)`: the native LM optimizer on the fudged model.
  - Optim, JSOSolvers, Ipopt and MadNLP keep their standard names. They get the exact robust cost and gradient, but their Hessian is ``\tilde J^T \tilde J``.

The weight each form gives an outlier's ``J_i^T J_i`` (``|r| > w``; inliers have weight 1 in all three), **derived from the code, not measured**:

| Form | Weight | Far from the width |
|---|---|---|
| Reweighting only (IRLS) | ``w / \lvert r\rvert`` | ``w / \lvert r\rvert`` |
| NLLSModel, Triggs with its positive-definiteness guard | ``2w / (3\lvert r\rvert)`` | ``\tfrac23 \cdot w / \lvert r\rvert`` |
| Rewritten residuals, Gauss–Newton | ``w^2 / (2w\lvert r\rvert - w^2)`` | ``\to \tfrac12 \cdot w / \lvert r\rvert`` |

---
""",
)

function generate_problem_markdown(res::ProblemScalingBenchmarkResult, slug::String; single_threaded=nothing)
    target_model_name = isempty(res.size_results) ? "Standard" : first(res.size_results).target_model
    num_sizes = length(res.sizes)

    # Compute data-driven highlights at largest size with model/optimizer data
    model_summary_str = "Block-sparse and static formulations minimize heap allocations during normal-equation assembly."
    opt_summary_str = "Solvers exploiting problem sparsity and exact second-order structure achieve superior asymptotic scaling."

    if !isempty(res.size_results)
        last_sr = last(res.size_results)
        valid_m = [(k, v) for (k, v) in last_sr.model_results if !isnan(v.linsys_time_ns) && v.linsys_time_ns > 0]
        if !isempty(valid_m)
            sort!(valid_m, by = x -> x[2].linsys_time_ns)
            best_m_name, best_mr = first(valid_m)
            model_summary_str = "At $(res.size_metric_name) = `$(last_sr.size)`, **`$(best_m_name)`** achieves the fastest Cost + Linear System evaluation at **$(format_time(best_mr.linsys_time_ns))** ($(format_bytes(best_mr.linsys_bytes)) allocated)."
        end

        # Find largest size where at least one optimizer converged
        for idx in length(res.size_results):-1:1
            sr = res.size_results[idx]
            conv_opts = [(k, v) for (k, v) in sr.optimizer_results if v.converged && !isnan(v.time_ns) && v.time_ns > 0]
            if !isempty(conv_opts)
                sort!(conv_opts, by = x -> x[2].time_ns)
                best_o_name, best_or = first(conv_opts)
                n_total = length(sr.optimizer_results)
                opt_summary_str = "At $(res.size_metric_name) = `$(sr.size)` ($(length(conv_opts))/$(n_total) solvers converged), **`$(best_o_name)`** is fastest at **$(format_time(best_or.time_ns))** ($(best_or.iterations) iterations, final cost `$(@sprintf("%.2e", best_or.final_cost))`)."
                break
            end
        end
    end

    has_phase1 = !isempty(res.size_results) && any(sr -> length(sr.model_results) > 1, res.size_results)

    phase1_section = if has_phase1
        """
## 1. Model Evaluation Scaling

The plot below shows the log-log scaling of **Pure Cost Evaluation** (dashed/dotted lines) and **Cost + Linear System Assembly** (solid/dash-dot lines) across problem sizes.

![$(res.problem) Model Evaluation Scaling](../assets/plots/$(slug)_models.png)
"""
    else
        """
## 1. Model Evaluation Scaling

This problem uses `$(target_model_name)` universally across all solvers via its built-in adapters; Phase 1 comparative model evaluation is omitted.
"""
    end

    single_threaded_section = if single_threaded === nothing
        ""
    else
        st_phase1 = any(sr -> length(sr.model_results) > 1, single_threaded.size_results)
        model_plot = st_phase1 ? "\n![$(res.problem) Model Evaluation Scaling, 1 thread](../assets/plots/single_threaded/$(slug)_models.png)\n" : ""
        """
## 3. Single-Threaded Results

The same benchmark with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`),
stored separately from the threaded table. Comparing the two shows what threading gains or costs at each size.
$(model_plot)
![$(res.problem) Optimizer Scaling, 1 thread](../assets/plots/single_threaded/$(slug)_optimizers.png)

- [View Single-Threaded Raw Benchmark Results Data (Markdown Table)](../data/single_threaded/$(slug).md)

---
"""
    end
    raw_n, analysis_n = single_threaded === nothing ? (3, 4) : (4, 5)

    model_summary_line = has_phase1 ? "- **Model Efficiency**: $(model_summary_str)" : "- **Model Architecture**: Handled universally via `$(target_model_name)` with built-in zero-allocation adapters."

    derivatives = problem_derivatives(res.problem)
    md = """
# $(res.problem)

- **Category**: `$(res.category)`
- **Scaling Metric**: $(res.size_metric_name)
- **Problem Sizes Evaluated**: $(join(res.sizes, ", ")) ($(num_sizes) sizes)
- **Standard Baseline Model for Solvers**: `$(target_model_name)`
- **Derivatives**: $(derivatives)

$(DERIVATIVES_NOTES[slug])

---

$(get(PROBLEM_NOTES, slug, ""))
$(phase1_section)
---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers, where each solver is evaluated on its optimal problem representation (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, and `Manifolds` for `Manopt`). Non-converged runs are omitted.

![$(res.problem) Optimizer Scaling](../assets/plots/$(slug)_optimizers.png)

---

$(single_threaded_section)
## $(raw_n). Raw Data

The full numeric benchmark measurements (cost, linear system assembly times, outer iterations, memory, and convergence status across all sizes) are persisted in the streaming Markdown data file:

- [View Full Raw Benchmark Results Data (Markdown Table)](../data/$(slug).md)

---

## $(analysis_n). Analysis & Key Takeaways

$(model_summary_line)
- **Top Converged Optimizer**: $(opt_summary_str)
- **Convergence Filtering**: Only runs satisfying universal convergence tolerances (`gtol = $(DEFAULT_GTOL)`, `xtol = $(DEFAULT_XTOL)`, `ftol = $(DEFAULT_FTOL)`) within `$(DEFAULT_MAXITERS)` iterations and `$(DEFAULT_MAXTIME)s` are plotted.
"""

    return md
end
