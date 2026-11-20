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
    # The packages of the rows in the results, alphabetically (IND8)
    names = String[n for sr in res.size_results for n in keys(sr.optimizer_results)]
    return join(sort(unique(SmoothOptimizerBenchmark.row_package.(names)); by=lowercase), ", ")
end

# The problem's registered definition, by name (from the code, not from the results)
function registered_problem(problem_name::AbstractString)
    probs = get_all_problems()
    i = findfirst(p -> p.name == problem_name, probs)
    i === nothing && throw(ArgumentError("No registered problem is named $(repr(problem_name))"))
    return probs[i]
end

# The names of a problem's models at its smallest size, as the code builds them (alphabetical, IND8)
problem_models(problem_name::AbstractString) =
    [m.name for m in registered_problem(problem_name).generate_models(first(registered_problem(problem_name).default_sizes))]

# The derivative mode a problem declares (DM12): from its definition, looked up by name among the registered problems,
# not from the results
problem_derivatives(problem_name::AbstractString) = registered_problem(problem_name).derivatives

const DERIV_AUTODIFF = "**Derivatives: automatic.** Every cost of this problem depends on at most $(SmoothOptimizerBenchmark.AUTODIFF_MAX_INPUTS) scalar inputs, so each cost's Jacobian is computed by forward-mode automatic differentiation, with NLLSModel's `computeresjac`."
const DERIV_AUTODIFF_STANDALONE = " The `Standalone` model fills its residual vector and Jacobian by calling that same function for each cost in a plain single-threaded loop, so the NLLSModel and Standalone models evaluate a cost with the same code; what differs between their rows is how the linear system is assembled and how the optimizer uses it."
const DERIV_JUMP = " The mode applies to the NLLSModel and Standalone models. The `JuMP` model, the native model of JSOSolvers, Ipopt, MadNLP and CaNNOLeS, is differentiated by JuMP's own automatic differentiation, exactly and with exact second derivatives, whatever the problem's mode: a native model's derivatives are part of the package under test."
const DERIV_ANALYTIC = "**Derivatives: analytic.** A cost of this problem depends on more than $(SmoothOptimizerBenchmark.AUTODIFF_MAX_INPUTS) scalar inputs, so each cost has a hand-written Jacobian. NLLSModel calls it through `computeresjac`, and the `Standalone` model fills its residual vector and Jacobian by calling the same function for each cost in a plain single-threaded loop, so the NLLSModel and Standalone models evaluate a cost with the same code."

# The paragraph under each problem page's header: what its derivative mode means on that problem, by what its models are
const DERIVATIVES_NOTES = Dict(
    "curve_fitting" => DERIV_AUTODIFF * DERIV_AUTODIFF_STANDALONE * DERIV_JUMP,
    "ode_bvp" => DERIV_AUTODIFF * DERIV_AUTODIFF_STANDALONE * DERIV_JUMP,
    "rosenbrock_dense" => DERIV_AUTODIFF * DERIV_AUTODIFF_STANDALONE * DERIV_JUMP,
    "rosenbrock_sparse" => DERIV_AUTODIFF * DERIV_AUTODIFF_STANDALONE * DERIV_JUMP,
    "pose_chain" => DERIV_AUTODIFF * DERIV_AUTODIFF_STANDALONE * DERIV_JUMP,
    "curve_fitting_robust" => DERIV_AUTODIFF * " The `Standalone (fudged)` model, which LeastSquaresOptim, NonlinearSolve and Optim run on, fills its residual vector and Jacobian by calling that same function for each cost in a plain single-threaded loop, then rewrites each residual and scales its row as described below, so the NLLSModel and Standalone models evaluate a cost with the same code. The mode applies to those two models. The `JuMP (fudged)` model, the same rewritten residuals as JuMP expressions and the native model of JSOSolvers, Ipopt, MadNLP and CaNNOLeS, is differentiated by JuMP's own automatic differentiation, exactly and with exact second derivatives: a native model's derivatives are part of the package under test.",
    "polynomial_fitting" => DERIV_ANALYTIC * DERIV_JUMP,
    "multilateration" => DERIV_ANALYTIC * DERIV_JUMP,
    "affine_alignment" => DERIV_ANALYTIC * DERIV_JUMP,
    "robust_procrustes" => "**Derivatives: analytic.** Each correspondence's residual depends on the rotation, ``d(d-1)/2`` scalar inputs (more than $(SmoothOptimizerBenchmark.AUTODIFF_MAX_INPUTS) from ``d = 5``), and every model has a hand-written Jacobian. `NLLSModel (ManifoldVar)` computes each correspondence's Jacobian in the orthonormal tangent basis of `Manifolds.jl`, through `computeresjac`; `NLLSModel (Specialized)` does the same for its own rotation type, with a specialized kernel; and the `Manifolds` model's per-correspondence Jacobian blocks, ``-\\mathbf{R}\\,\\mathbf{E}_l \\mathbf{b}_i`` with the products ``\\mathbf{E}_l \\mathbf{b}_i`` precomputed, are hand-written as well (the Manopt row builds the same blocks).",
    "bundle_adjustment" => "**Derivatives: mixed, exempt from the rule.** Each observation depends on a camera and a point, 12 scalar inputs, but this problem is exempt from the rule: its two models are separate formulations of the problem, not two uses of the same per-cost code, so no equivalent pair of rows is being compared. The `NLLSModel` model differentiates each observation automatically (NLLSModel's `computeresjac`); `BundleAdjustmentModels` evaluates its own Jacobian.",
)

# The stopping criteria each package is given (IND5): the benchmark's gradient, step and relative cost-change tolerances
# wherever the package offers them, and what each is called there. A package's own other criteria are at its defaults
const STOPPING_GIVEN = (
    "CaNNOLeS" => ("`atol = gtol`, `rtol = 0`", "—", "—", "Its residual tolerances (`Fatol`, `Frtol`) at their defaults."),
    "Ipopt" => ("`tol`, `dual_inf_tol`", "`tiny_step_tol`", "`acceptable_obj_change_tol`", "The change is tested inside Ipopt's acceptable test (`acceptable_iter = 1`, `acceptable_tol = 1e20`) and scaled by ``\\max(1, \\lvert f \\rvert)``; the acceptable and tiny-step stops count as converged."),
    "JSOSolvers" => ("`atol = gtol`, `rtol = 0`", "—", "—", ""),
    "LeastSquaresOptim" => ("`g_tol`", "`x_tol`", "`f_tol`", ""),
    "MadNLP" => ("`tol` (KKT residual)", "—", "—", ""),
    "Manopt" => ("`StopWhenGradientNormLess`", "`StopWhenChangeLess`", "—", "Manopt 0.6.15's cost-change criteria are absolute below a cost of 1 (`StopWhenCostChangeLess`, `StopWhenRelativeAPosterioriCostChangeLessOrEqual`), so neither is given."),
    "NonlinearSolve" => ("—", "—", "—", "None of the three: its default termination mode tests the residual norm, and stalls of the residual and of the step against that same tolerance, so it runs on its own defaults."),
    "Optim" => ("`g_abstol`", "`x_abstol`", "`f_reltol`", ""),
    "SecondOrderOptimization" => ("`gtol`", "`dstep`", "`reldcost`", ""),
)
# The criteria a package is given, as one line for a problem page's row table
function stopping_given(package::AbstractString)
    idx = findfirst(p -> first(p) == package, STOPPING_GIVEN)
    idx === nothing && throw(ArgumentError("No stopping criteria are listed for the package $(repr(package))"))
    g, x, f, _ = last(STOPPING_GIVEN[idx])
    given = [name for (name, v) in (("gradient", g), ("step", x), ("relative cost change", f)) if v != "—"]
    return isempty(given) ? "its own defaults" : join(given, ", ")
end

function stopping_table()
    rows = ["| $(pkg) | $(g) | $(x) | $(f) | $(note) |" for (pkg, (g, x, f, note)) in STOPPING_GIVEN]
    return "| Package | Gradient (`gtol`) | Step (`xtol`) | Relative cost change (`ftol`) | Note |\n|:---|:---|:---|:---|:---|\n" * join(rows, "\n")
end

function pairing_table()
    rows = ["| $(pkg) | $(isempty(models) ? "none: the Standalone model" : join(["`$(m)`" for m in models], ", ")) |"
            for (pkg, models) in SmoothOptimizerBenchmark.NATIVE_MODELS]
    return "| Package | Native model (the first that the problem has) |\n|:---|:---|\n" * join(rows, "\n")
end

# `single_threaded`: the same problems run with NLLSModel and BLAS on one thread, stored in `data/single_threaded/` and
# plotted in `assets/plots/single_threaded/`; each problem page shows them beside the multi-threaded results.
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
        models_str = join(["`$(m)`" for m in problem_models(res.problem)], ", ")
        push!(suite_rows, "| [$(res.problem)](problems/$(slug).md) | `$(res.category)` | $(res.size_metric_name) | $(n_sz) sizes ($(sz_range)) | $(models_str) | `$(target_m)` | $(problem_derivatives(res.problem)) | $(solvers_str) |")
    end
    suite_table = join(suite_rows, "\n")

    # 1. Generate index.md
    index_md = """
# SmoothOptimizerBenchmark.jl

**SmoothOptimizerBenchmark.jl** provides systematic, reproducible, multi-scale performance benchmarking across smooth second-order, nonlinear least-squares, and Riemannian manifold optimization packages in Julia:

- **`CaNNOLeS.jl`**: Constrained and nonlinear least-squares solver exploiting equality-constrained KKT structure.
- **`Ipopt.jl`**: Primal-dual interior-point nonlinear programming solver via `NLPModelsIpopt`.
- **`JSOSolvers.jl`**: Matrix-free / trust-region solvers `trunk` and `tron` via `NLPModels`.
- **`LeastSquaresOptim.jl`**: Levenberg-Marquardt and Dogleg algorithms for nonlinear least squares.
- **`MadNLP.jl`**: Pure-Julia filter line-search interior-point solver via `NLPModels`.
- **`Manopt.jl`**: Riemannian Levenberg-Marquardt optimization on matrix manifolds (`Manifolds.jl`).
- **`NonlinearSolve.jl`**: SciML nonlinear least-squares solvers (`LevenbergMarquardt`, `TrustRegion`).
- **`Optim.jl`**: Trust-Region Newton (`NewtonTrustRegion`) and Line-Search Newton (`Newton`).
- **`SecondOrderOptimization.jl`**: Levenberg-Marquardt and Dogleg trust-region algorithms with zero-allocation static, dense, and sparse linear system solvers.

What each package supports (variables, derivatives, robust kernels, constraints, steps, linear solvers), and how each model in the benchmark reaches each optimizer, is on the [Package Features](features.md) page. It explains why a package is absent from a problem's table.

---

## Benchmarking Methodology

### Two-Phase Decoupled Architecture
To separate modeling overhead from solver algorithm efficiency, every problem is benchmarked in two phases:

1. **Phase 1 — Model Evaluation Scaling**:
   Benchmarks pure **Cost Evaluation** (\$f(x) = \\frac{1}{2}\\|r(x)\\|_2^2\$) and **Cost + Linear System Assembly** (\$g = J^T r\$ and \$H = J^T J\$ or exact Hessian) across the problem's model representations (`BundleAdjustmentModels`, `JuMP`, `Manifolds`, `NLLSModel` and the `Standalone` `LeastSquaresProblem`).
2. **Phase 2 — Optimizer Scaling**:
   Each optimizer runs on its package's native model, and on the problem's `Standalone` model if its package has none or the problem has none of them. A row's package is the part of its name before " (". The native models, in order of preference:

$(pairing_table())

   So each row measures a package end to end on its own model, with the stopping criteria below, `maxiters = $(DEFAULT_MAXITERS)` and `maxtime = $(DEFAULT_MAXTIME)s`. Each problem page has a table of its rows with the model each runs on. SecondOrderOptimization has one row per problem: the configuration (iterator, linear solver, formulation, reduction, storage) that NLLSModel's `recommendoptimizer` chooses at the problem's largest size, evaluated once and fixed in the problem's code; the page states it.
   - **Stopping criteria.** Every optimizer is given the benchmark's gradient, step and relative cost-change tolerances (`gtol = $(DEFAULT_GTOL)`, `xtol = $(DEFAULT_XTOL)`, `ftol = $(DEFAULT_FTOL)`) wherever it offers that criterion; where it does not, it runs with what it has. The definitions differ between packages (norms, absolute or relative):

$(stopping_table())

   - A row that ends `timeout` at one size is not run at the larger sizes of that table: it is recorded `timeout` there, "timed out at size N". There are no size limits otherwise.
   - Every concrete `(optimizer, model-type)` specialization is pre-warmed prior to timing so LLVM JIT compilation is excluded.
   - Every row's final cost is evaluated by the harness at the point the solver returned, not taken from the solver. A row's status is decided by the harness too: `ok` when the solver reports convergence **and** the final cost is at most ``\\max(c_{\\text{ref}}(1 + 10^{-4}), 10^{-6})``, with ``c_{\\text{ref}}`` the problem's known minimum at that size (0 for affine alignment, both Rosenbrocks, the ODE BVP and bundle adjustment; the extended-precision minimum for the polynomial fit), or else the lowest final cost of any row at that size in the same table. A row whose solver claims convergence but fails that test is `local_minimum` if the cost reduction the Gauss–Newton model predicts from its point is below ``10^{-8}`` × its cost (a minimum of the Gauss–Newton model: a saddle of the true cost would pass), and `above_reference` otherwise. Rows that stop on the iteration or time limit or stall are `not_converged` or `timeout` (the message says when the cost test passes anyway).
   - Only `ok` rows are plotted (`converged = true` in the raw data tables); every other status is omitted (`NaN`) from the runtime plots, `local_minimum` included, since its time is the time to a different optimum.
   - Results stream line-by-line directly to Markdown tables in `docs/src/data/` as each model and optimizer measurement completes.

### Derivatives
Each problem has one derivative mode, which its NLLSModel and Standalone models follow, and which its page states. A problem is **automatic** when every cost depends on at most $(SmoothOptimizerBenchmark.AUTODIFF_MAX_INPUTS) scalar inputs at every size: each cost's Jacobian is then computed by NLLSModel's forward-mode automatic differentiation. Otherwise it is **analytic**, and each cost has a hand-written Jacobian. Either way the `Standalone` model fills its residuals and Jacobian by calling the same per-cost functions in a plain single-threaded loop, so their rows differ by how the linear system is assembled and how it is solved, not by how a cost is differentiated; bundle adjustment, whose two models are separate formulations, is exempt (**mixed**). A package's native model differentiates itself, as part of the package under test: JuMP its own expressions, exactly and with exact second derivatives, on every problem, the analytic ones included; `BundleAdjustmentModels` its own Jacobian; the `Manifolds` model its hand-written blocks.

### Multi-Threaded and Single-Threaded Tables
Every problem is run twice. The **multi-threaded** table runs Julia, NLLSModel and BLAS on the thread counts in its data
file's header, BLAS at its own default; the **single-threaded** table runs NLLSModel and BLAS on one thread
(`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`) and is stored separately, in `docs/src/data/single_threaded/`.
Each problem page shows both.

---

## Benchmark Problem Suite

| Problem | Category | Scaling Metric | Sizes Tested | Models | Baseline Model | Derivatives | Tested Solver Packages |
|:---|:---|:---|:---|:---|:---|:---|:---|
$(suite_table)

---

## Executive Summary of Results

1. **Model Evaluation & Linear System Assembly**:
   - `NLLSModel.jl` achieves zero-allocation cost and Gauss-Newton normal-equation assembly on static and block-sparse problems, outperforming generic `JuMP` / `NLPModels` and `BundleAdjustmentModels` coordinate assembly by **3×–10×** at scale.
   - Hand-specialized manifold residuals (`NLLSModel (Specialized)`) on \$SO(d)\$ eliminate tangent-basis allocation overhead relative to generic `Manifolds.jl` / `ManifoldVar` representations.

2. **Optimizer Efficiency & Scaling**:
   - **`SecondOrderOptimization.jl`**: Consistently delivers the lowest latency on small-to-medium dense problems and scales linearly on banded/tridiagonal sparse problems via direct sparse `LDL` factorizations.
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

# The SecondOrderOptimization configuration each problem hard-codes (IND4)
const SOO_CONFIGS = Dict(
    "affine_alignment" => SmoothOptimizerBenchmark.AFFINE_ALIGNMENT_SOO, "bundle_adjustment" => SmoothOptimizerBenchmark.BUNDLE_ADJUSTMENT_SOO,
    "curve_fitting" => SmoothOptimizerBenchmark.CURVE_FITTING_SOO, "curve_fitting_robust" => SmoothOptimizerBenchmark.ROBUST_CURVE_FITTING_SOO,
    "multilateration" => SmoothOptimizerBenchmark.MULTILATERATION_SOO, "ode_bvp" => SmoothOptimizerBenchmark.ODE_BVP_SOO,
    "polynomial_fitting" => SmoothOptimizerBenchmark.POLYNOMIAL_FITTING_SOO, "pose_chain" => SmoothOptimizerBenchmark.POSE_CHAIN_SOO,
    "robust_procrustes" => SmoothOptimizerBenchmark.ROBUST_PROCRUSTES_SOO, "rosenbrock_dense" => SmoothOptimizerBenchmark.ROSENBROCK_DENSE_SOO,
    "rosenbrock_sparse" => SmoothOptimizerBenchmark.ROSENBROCK_SPARSE_SOO)

# Sizes at which a model is not built (decision 18), with the reason, per problem
const UNBUILT_NOTES = Dict(
    "affine_alignment" => "The `JuMP` model is built up to ``n = $(SmoothOptimizerBenchmark.AFFINE_JUMP_MAX_N)`` and not above: its build took 16 s at ``n = 12``, 189 s at ``n = 16`` and over 300 s at ``n = 20`` (measured 2026-11-19), so at ``n = 20`` and above the rows that run on it (CaNNOLeS, Ipopt, JSOSolvers, MadNLP) are `skipped`, with that reason in the data.")

"""
    rows_section(problem_name, slug) -> String

The section of a problem page that says which model each row runs on (the pairing, IND1) and which stopping criteria
its package is given (IND5), from the problem's own definition at its smallest size, and SecondOrderOptimization's
hard-coded configuration (IND4).
"""
function rows_section(problem_name::AbstractString, slug::AbstractString)
    prob = registered_problem(problem_name)
    models = prob.generate_models(first(prob.default_sizes))
    rows = map(prob.compatible_optimizers) do o
        m = SmoothOptimizerBenchmark.resolve_optimizer_model(o, models)
        "| `$(o.name)` | `$(m.name)` | $(stopping_given(SmoothOptimizerBenchmark.row_package(o.name))) |"
    end
    c = SOO_CONFIGS[slug]
    soo_line = "The `SecondOrderOptimization` row runs `iterator = $(repr(c.iterator))`, `linsolver = $(repr(c.linsolver))`, " *
        "`formulation = $(repr(c.formulation))`, `reduction = $(repr(c.reduction))`, `storage = $(repr(c.storage))`: the " *
        "configuration NLLSModel's `recommendoptimizer` chose for this problem at its largest size, " *
        "$(prob.size_metric_name) = $(last(prob.default_sizes)), with one thread (evaluated 2026-11-19, then fixed in the " *
        "problem's code, the same at every size)."
    unbuilt = haskey(UNBUILT_NOTES, slug) ? "\n\n" * UNBUILT_NOTES[slug] : ""
    return """
## Which model each row runs on, and how it stops

Each row runs on its package's native model, or on the `Standalone` model if its package has none here (see the overview). The criteria are the benchmark's gradient, step and relative cost-change tolerances, as far as the package offers them; the overview's table says what each is called in each package.

| Row | Model | Stopping criteria given |
|:---|:---|:---|
$(join(rows, "\n"))

$(soo_line)$(unbuilt)

---
"""
end

# Problem-specific text, placed under a problem page's rows section
const PROBLEM_NOTES = Dict(
    "bundle_adjustment" => raw"""
## Bundle adjustment's rows

- **`SecondOrderOptimization`** forms the Gauss–Newton system ``\mathbf{J}^T \mathbf{J}`` (`formulation = :hessian`), eliminates the points from it (`reduction = :eliminate`: the Schur complement), and factorizes the reduced camera system by sparse Cholesky; its iterator is Levenberg–Marquardt. The recommender chooses the Hessian path because ``\mathbf{J}`` is rank-deficient by the gauge (the scene's position, orientation and scale are free), which damping handles.
- **`CaNNOLeS`** (`method = :Newton_noFHess`, on `BundleAdjustmentModels`) is Gauss–Newton globalized by a regularized ``\mathbf{L}\mathbf{D}\mathbf{L}^T`` factorization of the augmented system and an Armijo backtracking line search.

---
""",
    "curve_fitting_robust" => raw"""
## How each row gets the robust cost

- **`SecondOrderOptimization`** runs the `NLLSModel (Static)` model, which declares the kernel.
- **Every other row runs a rewritten ("fudged") model.** Each residual ``\epsilon`` is rewritten as ``\tilde\epsilon = \operatorname{sign}(\epsilon)\sqrt{\rho(\epsilon^2)}``, and its row of the Jacobian is scaled by ``\rho'(\epsilon^2)\,|\epsilon| / \sqrt{\rho(\epsilon^2)}``. Then ``\tfrac12\lVert\tilde{\boldsymbol{\epsilon}}\rVert^2`` is the robust cost exactly and ``\tilde{\mathbf{J}}^T \tilde{\boldsymbol{\epsilon}}`` its gradient.
  - JSOSolvers, Ipopt, MadNLP and CaNNOLeS run `JuMP (fudged)`, the rewritten residuals as JuMP expressions (for the Huber kernel, ``\tilde\epsilon = \epsilon`` within the width and ``\operatorname{sign}(\epsilon)\sqrt{2w|\epsilon| - w^2}`` beyond it). JuMP differentiates them itself, so these rows get the exact Hessian of the rewritten cost. CaNNOLeS has no kernel interface, and its row is named "fudged"; the others keep their standard names.
  - LeastSquaresOptim, NonlinearSolve and Optim run `Standalone (fudged)`. LeastSquaresOptim and NonlinearSolve have no kernel interface, and their rows are named "fudged". Optim keeps its standard names: it gets the exact robust cost and gradient, but its Hessian is ``\tilde{\mathbf{J}}^T \tilde{\mathbf{J}}``.

The weight each form gives an outlier's ``\mathbf{j}_i \mathbf{j}_i^T``, with ``\mathbf{j}_i^T`` its row of the Jacobian (``|\epsilon| > w``; inliers have weight 1 in all three), **derived from the code, not measured**:

| Form | Weight | Far from the width |
|---|---|---|
| Reweighting only (IRLS) | ``w / \lvert \epsilon\rvert`` | ``w / \lvert \epsilon\rvert`` |
| NLLSModel, Triggs with its positive-definiteness guard | ``2w / (3\lvert \epsilon\rvert)`` | ``\tfrac23 \cdot w / \lvert \epsilon\rvert`` |
| Rewritten residuals, Gauss–Newton | ``w^2 / (2w\lvert \epsilon\rvert - w^2)`` | ``\to \tfrac12 \cdot w / \lvert \epsilon\rvert`` |

---
""",
)

# The body of each problem page's "The Problem" section, the first `##` section of the page: what is solved, where it is
# used, which problems it resembles, and how it scales, ending in a table of the counts at the smallest and largest
# default size. `test/problem_pages.jl` pins the numbers in those tables against the models
const PROBLEM_DESCRIPTIONS = Dict(
    "rosenbrock_sparse" => raw"""
The Rosenbrock function is the classic test of an optimizer: its minimum lies at the bottom of a long, curved valley that is easy to reach and slow to follow. This problem chains ``n`` unknowns together. Each unknown is pulled towards 1, and each neighbouring pair is pulled onto the parabola ``x_{k+1} = x_k^2``:

```math
f(\mathbf{x}) = \tfrac12 \sum_{k=1}^{n} \bigl(10\,(x_k - 1)\bigr)^2 + \tfrac12 \sum_{k=1}^{n-1} \bigl(10\,(x_{k+1} - x_k^2)\bigr)^2 .
```

Every term is zero at ``\mathbf{x} = (1, \dots, 1)``, which is the minimum. The optimizers start from ``x_k = 0.5``.

### Where it is used

Nowhere directly: it is a synthetic test function. It is in the benchmark because it is nonlinear, has a known answer, and can be made as large as wanted with no data to load, so it shows how a package's cost grows with the number of unknowns when the structure is as simple as a sparse problem gets.

### Similar problems

Any problem in which the unknowns form a chain and each is tied only to its neighbours: smoothing or denoising a sampled signal, estimating a scalar state over time (a Kalman smoother), and differential equations discretized on a line, such as this benchmark's [ODE boundary value problem](ode_bvp.md). In all of these the matrix the optimizer factorizes is tridiagonal, and a sparse direct solver handles it in time proportional to ``n``.

### How it scales

The size is the number of unknowns, ``n``. Everything grows in proportion to it.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``n`` | 100 | 75000 |
| Variables | ``n``, each a scalar | 100 | 75000 |
| Unknowns in total | ``n`` | 100 | 75000 |
| Costs | ``2n - 1``, each one residual: ``n`` depend on one variable, ``n - 1`` on two | 199 | 149999 |
| Residuals in total | ``2n - 1`` | 199 | 149999 |
| Jacobian | ``(2n - 1) \times n``, with ``3n - 2`` non-zeros (two per row at most) | 298 non-zeros | 224998 non-zeros |
| Hessian ``\mathbf{J}^T \mathbf{J}`` | ``n \times n``, tridiagonal | 298 non-zeros | 224998 non-zeros |
""",
    "curve_fitting" => raw"""
Given ``m`` noisy measurements ``y_i`` taken at times ``t_i``, find the exponential decay curve that passes closest to them. The curve has three unknown numbers: its height ``a``, its decay rate ``b`` and the level ``c`` it settles to. The optimizer minimizes the sum of squared gaps between curve and data:

```math
f(a, b, c) = \tfrac12 \sum_{i=1}^{m} \bigl(a\,e^{-b t_i} + c - y_i\bigr)^2 .
```

The data are generated from ``a = 2``, ``b = 1.5``, ``c = 0.5`` at evenly spaced times in ``[0, 2]``, with Gaussian noise of standard deviation 0.02. The optimizers start from ``(1, 1, 1)``.

### Where it is used

Fitting a decay curve is everyday work in the experimental sciences: radioactive decay, the discharge of a capacitor, a cooling object, the concentration of a drug in the blood, fluorescence lifetimes. More widely, it stands for nonlinear regression: a model with a few parameters fitted to many measurements.

### Similar problems

Any fit of a handful of parameters to a large data set: calibrating a sensor against reference readings, dose–response curves, fitting a peak to a spectrum. The linear system is tiny (3 × 3) and solving it costs nothing; nearly all the time goes into evaluating the model and its derivatives at every data point and summing them. It is the opposite regime to the sparse problems of this benchmark, where the linear solve dominates.

### How it scales

The size is the number of data points, ``m``. The number of unknowns is fixed; only the amount of data grows, so the work per iteration is proportional to ``m``.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``m`` | 64 | 65536 |
| Variables | 1, of size 3 | 1 | 1 |
| Unknowns in total | 3 | 3 | 3 |
| Costs | ``m``, each one residual depending on the whole variable | 64 | 65536 |
| Residuals in total | ``m`` | 64 | 65536 |
| Jacobian | ``m \times 3``, dense | 64 × 3 | 65536 × 3 |
| Hessian ``\mathbf{J}^T \mathbf{J}`` | ``3 \times 3``, dense | 3 × 3 | 3 × 3 |
""",
    "curve_fitting_robust" => raw"""
The same decay curve as [Exponential Curve Fitting](curve_fitting.md), ``a\,e^{-b t} + c``, fitted to the same data, except that **30 % of the measurements are wrong**: each of those has been moved up by 1, fifty times the noise level of 0.02. Ordinary least squares squares every gap, so those points would drag the curve up towards them. A *robust* fit limits their pull: a gap is squared only while it is small, and counted in proportion to its size once it is large. The optimizer minimizes

```math
f(a, b, c) = \tfrac12 \sum_{i=1}^{m} \rho\Bigl(\bigl(a\,e^{-b t_i} + c - y_i\bigr)^2\Bigr), \qquad
\rho(s) = \begin{cases} s & s \le w^2 \\ 2w\sqrt{s} - w^2 & s > w^2 \end{cases}
```

where ``\rho`` is the Huber kernel and ``w = 0.05`` its width (2.5 times the noise level). The optimizers start from ``(1, 1, 1)``; a good fit recovers values close to the true ``(2, 1.5, 0.5)`` in spite of the bad points.

### Where it is used

Wherever some of the data cannot be trusted and it is not known which: wrongly matched image features in computer vision, reflected signals in satellite positioning, glitches in a sensor log, the occasional bad reading in a laboratory series. Robust kernels are standard in 3D reconstruction, robot mapping and robust regression in statistics.

### Similar problems

In size and structure it is the plain curve fit: three unknowns, a 3 × 3 system, and time dominated by the pass over the data. What it adds is the kernel, which is the same ingredient that large problems such as bundle adjustment and pose-graph optimization use, here on a problem small enough to see its effect alone. The kernel changes how each residual is weighted, and packages differ in whether they support one at all (see "How each row gets the robust cost" below).

### How it scales

The size is the number of data points, ``m``, of which ``\operatorname{round}(0.3\,m)`` are outliers. The sizes are those of the plain curve fit, and the work per iteration is proportional to ``m``.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``m`` | 64 | 65536 |
| Variables | 1, of size 3 | 1 | 1 |
| Unknowns in total | 3 | 3 | 3 |
| Costs | ``m``, each one residual with a Huber kernel, depending on the whole variable | 64 | 65536 |
| Residuals in total | ``m`` | 64 | 65536 |
| Jacobian | ``m \times 3``, dense | 64 × 3 | 65536 × 3 |
| Hessian ``\mathbf{J}^T \mathbf{J}`` | ``3 \times 3``, dense | 3 × 3 | 3 × 3 |
""",
    "polynomial_fitting" => raw"""
Fit a polynomial with ``n`` coefficients to ``m = 8n`` samples of a smooth curve, ``y_i = \sin(3t_i) + 0.01\cos(17t_i)``, at evenly spaced points ``t_i`` in ``[-1, 1]``. The polynomial is written in a Chebyshev basis stretched by a factor ``s \ge 1``, ``T_0(t/s), \dots, T_{n-1}(t/s)``, so that the data cover only the middle of the interval on which the basis is well behaved:

```math
f(\mathbf{c}) = \tfrac12 \sum_{i=1}^{m} \Bigl(\sigma \bigl(\textstyle\sum_{k=0}^{n-1} c_k\, T_k(t_i / s) - y_i\bigr)\Bigr)^2, \qquad \sigma = 10^4 .
```

The residuals are linear in the unknowns, so this is ordinary linear least squares, and in exact arithmetic one step from the starting point (all coefficients zero) would land on the answer. The difficulty is numerical. The stretch is chosen at each ``n`` so that the Jacobian's condition number is ``4 \times 10^9`` at every size (``s`` is about 840 at 4 coefficients, 2.9 at 14 and 1.07 at 64): this is the benchmark's one size sweep that is ill-conditioned at every size, and the construction that keeps the condition number fixed is contrived. Below about 14 coefficients much of that ill-conditioning is in the columns' norms, so a scaling of the coefficients would remove part of it there (at 4 coefficients the condition number after scaling the columns to unit norm is about ``4 \times 10^6``). Forming ``\mathbf{J}^T \mathbf{J}`` squares the condition number, to about ``1.6 \times 10^{19}``, which is more than double precision can represent (about ``10^{16}``). An optimizer that forms ``\mathbf{J}^T \mathbf{J}`` therefore loses the answer's accuracy before it starts; one that factorizes ``\mathbf{J}`` itself does not. Because the cost of a computed answer is itself rounded, each row is scored by its excess cost over the true minimum, both computed in extended precision.

### Where it is used

Polynomial regression and trend fitting, calibration curves, and any linear fit whose basis functions are nearly dependent. It is in the benchmark as a test of numerical accuracy, not of nonlinearity.

### Similar problems

Problems that are poorly conditioned because some combination of unknowns barely changes the residuals: a camera's focal length and its distance to the scene when the scene is nearly flat, parameters that the data only weakly determine, inverse problems in general. In shape it is like the curve fit, fewer unknowns than residuals and a dense system. The [dense conditioning sweep](conditioning_dense.md) holds the size fixed instead, and sweeps the condition number.

### How it scales

The size is the number of coefficients, ``n``, with 8 data points per coefficient. The conditioning is the same at every size. The work per iteration is that of a dense ``8n \times n`` least-squares problem, proportional to ``n^3``, whether the optimizer forms ``\mathbf{J}^T \mathbf{J}`` (``8n^3``) or factorizes ``\mathbf{J}`` (about ``16n^3``).

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``n`` | 4 | 64 |
| Variables | 1, of size ``n`` | 1 | 1 |
| Unknowns in total | ``n`` | 4 | 64 |
| Costs | ``8n``, each one residual depending on the whole variable | 32 | 512 |
| Residuals in total | ``8n`` | 32 | 512 |
| Jacobian | ``8n \times n``, dense | 32 × 4 | 512 × 64 |
| Hessian ``\mathbf{J}^T \mathbf{J}`` | ``n \times n``, dense | 4 × 4 | 64 × 64 |
""",
    "rosenbrock_dense" => raw"""
A Rosenbrock-style test function (a minimum at the bottom of a curved valley) in which **every pair** of unknowns is coupled, not only neighbours. Each of the ``n`` unknowns is pulled towards 1, and for every pair ``j < k`` the later one is pulled onto the parabola ``x_k = x_j^2``:

```math
f(\mathbf{x}) = \tfrac12 \sum_{k=1}^{n} \bigl(1.2\,(x_k - 1)\bigr)^2 + \tfrac12 \sum_{j < k} \bigl(x_k - x_j^2\bigr)^2 .
```

Every term is zero at ``\mathbf{x} = (1, \dots, 1)``, which is the minimum. The optimizers start from ``x_k = 0.5`` in every coordinate, as on the [sparse Rosenbrock problem](rosenbrock_sparse.md).

### Where it is used

Nowhere directly: it is a synthetic test function. It is the dense counterpart of the [sparse Rosenbrock problem](rosenbrock_sparse.md): the same kind of nonlinearity, but with no sparsity to exploit.

### Similar problems

Small problems in which everything interacts with everything else: calibrating a set of coupled parameters, or estimating ``n`` quantities from a measurement between every pair of them (clock offsets in a network, ratings from all-play-all results). Each residual touches only one or two unknowns, so the Jacobian is mostly zeros, but the matrix ``\mathbf{J}^T \mathbf{J}`` is completely full. A dense factorization is the right tool at these sizes.

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
| Hessian ``\mathbf{J}^T \mathbf{J}`` | ``n \times n``, dense | 2 × 2 | 32 × 32 |
""",
    "multilateration" => raw"""
Find where something is from its distances to known places, as a satellite-navigation receiver does. There are ``m`` anchors at known positions ``\mathbf{a}_i``, and a measured range ``r_i`` to each. The unknown is the position ``\mathbf{x}``, a point in ``d`` dimensions, and the optimizer looks for the point whose distances to the anchors best match the measured ranges:

```math
f(\mathbf{x}) = \tfrac12 \sum_{i=1}^{m} \bigl(\lVert \mathbf{x} - \mathbf{a}_i \rVert - r_i\bigr)^2 .
```

Here there are ``m = 4d`` anchors, placed at random at distance 4 from the origin; the true position is at distance 1; and each range carries Gaussian noise of standard deviation 0.01. The optimizers start from the origin. The problem is well conditioned: the anchors surround the point, so every direction is measured about equally well.

### Where it is used

Satellite positioning (GPS and the other GNSS), indoor positioning from radio beacons (ultra-wideband, Wi-Fi, Bluetooth), locating a sound source from microphones, and locating an earthquake from seismometers. Those are in 2 or 3 dimensions; the higher dimensions here are for sweeping the size, though the same cost appears when points are embedded in a higher-dimensional space from their distances.

### Similar problems

Small, dense, well-conditioned problems with a single block of unknowns: the pose of one camera from known 3D points, the alignment step of point-cloud registration, the calibration of one sensor. Such problems are tiny but are solved again and again, per frame or per measurement, so what matters is overhead: memory allocation, fixed set-up costs, and how well a package handles small fixed-size arrays. The sizes 2 to 16 are those for which SecondOrderOptimization uses a statically sized linear system.

### How it scales

The size is the dimension, ``d``. The number of anchors grows with it (``4d``), so that assembling ``\mathbf{J}^T \mathbf{J}`` (``4d \cdot d^2`` operations) and factorizing it (``d^3``) grow at the same rate, ``d^3``.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``d`` | 2 | 16 |
| Variables | 1, of size ``d`` | 1 | 1 |
| Unknowns in total | ``d`` | 2 | 16 |
| Costs | ``4d``, each one residual depending on the whole variable | 8 | 64 |
| Residuals in total | ``4d`` | 8 | 64 |
| Jacobian | ``4d \times d``, dense | 8 × 2 | 64 × 16 |
| Hessian ``\mathbf{J}^T \mathbf{J}`` | ``d \times d``, dense | 2 × 2 | 16 × 16 |
""",
    "affine_alignment" => raw"""
Two clouds of points in ``n`` dimensions, ``\mathbf{x}_1, \dots, \mathbf{x}_{2n}`` and ``\mathbf{y}_1, \dots, \mathbf{y}_{2n}``. The first cloud is to be moved by an unknown *affine map*, ``\mathbf{x} \mapsto \mathbf{M} \mathbf{x} + \mathbf{t}``: a matrix ``\mathbf{M}`` that can rotate, stretch and shear it, and a shift ``\mathbf{t}``. What is known is a table of distances ``D_{ij}``, from each moved point of the first cloud to each point of the second. The optimizer looks for the map that reproduces the whole table:

```math
f(\mathbf{M}, \mathbf{t}) = \tfrac12 \sum_{i=1}^{2n} \sum_{j=1}^{2n} \bigl(D_{ij} - \lVert \mathbf{M} \mathbf{x}_i + \mathbf{t} - \mathbf{y}_j \rVert\bigr)^2 .
```

The table is generated from a true map (``\mathbf{M}`` close to the identity, ``\mathbf{t}`` random) with no noise, so the minimum is zero. The optimizers start from ``\mathbf{M} = \mathbf{I}``, ``\mathbf{t} = \mathbf{0}``.

### Where it is used

It is a synthetic problem, modelled on registration from range measurements: working out how one set of devices or landmarks sits relative to another when only the distances between them can be measured, as with radio ranging between two groups of sensors, or when fitting a shape to distance data in chemistry and statistics (distance geometry, multidimensional scaling).

### Similar problems

Dense problems in which every residual depends on every unknown, so there is no structure to exploit: fitting a small neural network or another model with a few hundred to a thousand parameters, estimating one global transformation from many measurements, calibrating all the parameters of an instrument at once. It is the largest dense problem in the benchmark: at the top size the Jacobian has over four million entries, and the time is spent in dense linear algebra (matrix products and factorizations), which is where the choice of linear-algebra library and its threading show.

### How it scales

The size is the dimension, ``n``. The unknowns (the ``n^2`` entries of ``\mathbf{M}`` and the ``n`` of ``\mathbf{t}``) and the residuals (one per pair of points) both grow as ``n^2``, so the Jacobian grows as ``n^4``, and assembling and factorizing ``\mathbf{J}^T \mathbf{J}`` as ``n^6``.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``n`` | 1 | 32 |
| Variables | 1, of size ``n(n+1)`` | 1 | 1 |
| Unknowns in total | ``n(n+1)`` | 2 | 1056 |
| Costs | ``(2n)^2`` residuals, one per pair of points, each depending on the whole variable | 4 | 4096 |
| Residuals in total | ``4n^2`` | 4 | 4096 |
| Jacobian | ``4n^2 \times n(n+1)``, dense | 4 × 2 | 4096 × 1056 |
| Hessian ``\mathbf{J}^T \mathbf{J}`` | ``n(n+1) \times n(n+1)``, dense | 2 × 2 | 1056 × 1056 |
""",
    "pose_chain" => raw"""
A robot moves along a path and records, at each step, how far it has moved since the last one. From those step measurements alone its position could be found by adding them up, but errors would accumulate. Now and then it also recognizes a place it has been before, which ties two distant points of the path together (a *loop closure*). The problem is to find the ``N`` positions, each a point in 3D, that agree best with all the measurements at once.

Each measurement between two positions ``\mathbf{x}_a`` and ``\mathbf{x}_b`` contributes three residuals,

```math
\boldsymbol{\epsilon}(\mathbf{x}_a, \mathbf{x}_b) = \mathbf{x}_b - \mathbf{x}_a - \mathbf{o}_{ab} + 0.1\,\bigl(\mathbf{x}_a + \sin(\mathbf{x}_a)\bigr),
```

where ``\mathbf{o}_{ab}`` is the measured offset and the last term (the sine applied to each coordinate) makes the problem nonlinear. Its derivative, ``0.1\,(1 + \cos x)``, is never negative, so its effect does not cancel along the chain, and the problem's conditioning is the same at every length: the Jacobian's condition number is about 20 at every size. There is one such measurement between every consecutive pair, one loop closure from position ``i - 10`` to position ``i`` for every tenth ``i``, and one extra term that pins the first position, since otherwise the whole path could slide freely. The optimizers start from the path obtained by adding up slightly wrong steps.

### Where it is used

Robot and vehicle navigation (SLAM, pose-graph optimization), visual and inertial odometry, and surveying networks. The same structure appears in any chain of states linked by relative measurements: estimating a trajectory over time, or the joints of a mechanism.

### Similar problems

Pose-graph optimization is the direct analogue; real pose graphs have orientations as well as positions (6 unknowns per pose, on a manifold), where this problem has 3 ordinary coordinates. In structure it is a chain with a few longer links, like a smoothing problem in time or the camera system left after the points of a video sequence's bundle adjustment have been eliminated. The Hessian is block-banded: 3 × 3 blocks on the diagonal, beside it, and ten blocks away. A sparse direct solver factorizes it in time proportional to ``N``.

### How it scales

The size is the number of positions, ``N``. Variables, residuals and non-zeros all grow in proportion to it, and so does the work per iteration for a solver that exploits the band.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``N`` | 50 | 10000 |
| Variables | ``N``, each of size 3 | 50 | 10000 |
| Unknowns in total | ``3N`` | 150 | 30000 |
| Costs | ``N + \lfloor (N-1)/10 \rfloor``, each of 3 residuals: 1 on one variable, the others on two (``N - 1`` steps and ``\lfloor (N-1)/10 \rfloor`` loop closures) | 54 | 10999 |
| Residuals in total | ``3\,(N + \lfloor (N-1)/10 \rfloor)`` | 162 | 32997 |
| Jacobian | ``3\,(N + \lfloor (N-1)/10 \rfloor) \times 3N``, sparse: two 3 × 3 blocks per row block at most | 162 × 150 | 32997 × 30000 |
| Hessian ``\mathbf{J}^T \mathbf{J}`` | ``3N \times 3N``, block-banded with 3 × 3 blocks and a half-bandwidth of 10 blocks | 150 × 150 | 30000 × 30000 |
""",
    "ode_bvp" => raw"""
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
""",
    "bundle_adjustment" => raw"""
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
""",
    "robust_procrustes" => raw"""
Two sets of matching points are given, and one is to be turned so that it lies on top of the other. The unknown is a rotation ``\mathbf{R}``; the points ``\mathbf{a}_i`` and ``\mathbf{b}_i`` come in pairs, and the optimizer looks for the rotation that brings each ``\mathbf{R}\,\mathbf{b}_i`` closest to its ``\mathbf{a}_i``. A few of the pairs are wrong (outliers), so the fit is made robust with a Huber kernel, which counts a small mismatch by its square and a large one only in proportion to its size:

```math
f(\mathbf{R}) = \tfrac12 \sum_{i=1}^{n} \rho\bigl(\lVert \mathbf{a}_i - \mathbf{R}\,\mathbf{b}_i \rVert^2\bigr), \qquad
\rho(s) = \begin{cases} s & s \le w^2 \\ 2w\sqrt{s} - w^2 & s > w^2 \end{cases}
```

The points are in ``d`` dimensions, and there are ``n = d(d+1)/2`` pairs. They are generated from a known rotation with no noise, apart from four pairs displaced by 0.1; the kernel's width is ``w = 10^{-5}``, so that away from the answer nearly every pair is on the kernel's linear part. The optimizers start from the identity.

A rotation is not a list of freely adjustable numbers: a ``d \times d`` matrix has ``d^2`` entries, but only those matrices with ``\mathbf{R}^T \mathbf{R} = \mathbf{I}`` and determinant 1 are rotations. They form a curved space, the manifold ``SO(d)``, of dimension ``d(d-1)/2``. The optimizers work on that space directly, taking each step in the flat space of small rotations about the current estimate and mapping the result back onto the manifold.

### Where it is used

Aligning one shape or point cloud with another: registering 3D scans, superimposing molecules, finding a spacecraft's attitude from star directions (Wahba's problem), all in 3 dimensions. In high dimensions the same problem aligns two sets of word embeddings (between languages, say) and rotates factors in statistics. Without outliers it has a closed-form solution (orthogonal Procrustes, by a singular value decomposition); with a robust kernel it needs an iterative optimizer.

### Similar problems

Like [multilateration](multilateration.md) and [affine alignment](affine_alignment.md) it has a single block of unknowns on which every residual depends, and a dense linear system. It differs in two ways: the unknown lives on a manifold, as camera and robot orientations do in bundle adjustment and pose-graph optimization, and the cost has a robust kernel, as in [robust curve fitting](curve_fitting_robust.md). It is the benchmark's test of both features together, and the one problem on which a manifold optimization package (Manopt) is compared.

### How it scales

The size is the dimension, ``d``. The rotation's degrees of freedom grow as ``d^2 / 2`` and the residuals as ``d^3 / 2``; the linear system is dense, so factorizing it costs in proportion to ``d^6``.

| | In terms of the size | Smallest | Largest |
|:---|:---|---:|---:|
| Size | ``d`` | 3 | 32 |
| Variables | 1: a ``d \times d`` rotation with ``d(d-1)/2`` degrees of freedom | 1 | 1 |
| Unknowns in total | ``d(d-1)/2`` | 3 | 496 |
| Costs | ``d(d+1)/2`` pairs, each of ``d`` residuals with a Huber kernel, depending on the whole variable | 6 | 528 |
| Residuals in total | ``d^2(d+1)/2`` | 18 | 16896 |
| Jacobian | ``d^2(d+1)/2 \times d(d-1)/2``, dense | 18 × 3 | 16896 × 496 |
| Hessian ``\mathbf{J}^T \mathbf{J}`` | ``d(d-1)/2 \times d(d-1)/2``, dense | 3 × 3 | 496 × 496 |
""",
)

# The subsection of a problem whose rows carry an error in the solution (CN3): its two plots, from `plotdir`
function solution_error_section(res::ProblemScalingBenchmarkResult, slug::AbstractString, plotdir::AbstractString, label::AbstractString)
    return """

### Error in the solution and iterations$(label)

The first plot shows each row's relative error in the solution, ``\\lVert \\mathbf{x} - \\mathbf{x}^\\star \\rVert / \\lVert \\mathbf{x}^\\star \\rVert``, at the point it stopped, against $(res.size_metric_name) (an error below 1e-16 is drawn at 1e-16), and the second its iteration count. A row that is not `ok` at a value is missing there.

![$(res.problem) Error in the Solution$(label)]($(plotdir)/$(slug)_solution_error.png)

![$(res.problem) Iterations$(label)]($(plotdir)/$(slug)_iterations.png)
"""
end

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
        st_error_plots = SmoothOptimizerBenchmark.has_solution_errors(single_threaded) ?
            solution_error_section(single_threaded, slug, "../assets/plots/single_threaded", ", 1 thread") : ""
        """
## 3. Single-Threaded Results

The same benchmark with NLLSModel and BLAS on one thread (`set_benchmark_threads!(numthreads = 1, blas_threads = 1)`),
stored separately from the multi-threaded table. Comparing the two shows what threading gains or costs at each size.
$(model_plot)
![$(res.problem) Optimizer Scaling, 1 thread](../assets/plots/single_threaded/$(slug)_optimizers.png)
$(st_error_plots)
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
- **Standard Baseline Model for Optimizers**: `$(target_model_name)`
- **Derivatives**: $(derivatives)

$(DERIVATIVES_NOTES[slug])

---

## The Problem

$(PROBLEM_DESCRIPTIONS[slug])
---

$(rows_section(res.problem, slug))
$(get(PROBLEM_NOTES, slug, ""))
$(phase1_section)
---

## 2. Optimizer Evaluation Scaling

The plot below shows the log-log scaling of **Optimizer Runtime to Convergence** across all tested solvers, each on the model given in the table above (its package's native model, or the `Standalone` model). Only `ok` rows are plotted.

![$(res.problem) Optimizer Scaling](../assets/plots/$(slug)_optimizers.png)
$(SmoothOptimizerBenchmark.has_solution_errors(res) ? solution_error_section(res, slug, "../assets/plots", "") : "")
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
