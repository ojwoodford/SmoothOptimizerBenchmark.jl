using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")
isdefined(@__MODULE__, :generate_problem_markdown) || include(joinpath(@__DIR__, "..", "scripts", "generate_docs_content.jl"))

# PP3: the problem pages, generated from an empty result or from a committed data file, and the committed pages
# themselves. Nothing here runs a benchmark. A page is read as lines; its sections are its `## ` headings. Each check
# returns the list of what it found wrong, so that it can also be run on a fixture that violates it.

const PAGES_ROOT = pkgdir(SmoothOptimizerBenchmark)
const THE_PROBLEM = "## The Problem"
const PROBLEM_SUBSECTIONS = ["### Where it is used", "### Similar problems", "### How it scales"]
const SCALES_TABLE_HEADER = "| | In terms of the size | Smallest | Largest |"
# The old label's words, built so that a search of the repository for them finds no page, script or test that uses them
const OLD_LABEL = "for " * "Solvers"

page_row_cells(line) = strip.(split(strip(line), '|')[2:end-1])

# The lines of "The Problem" section, after its heading and up to the next `## ` heading; empty if there is none
function problem_section(lines)
    i = findfirst(==(THE_PROBLEM), lines)
    i === nothing && return String[]
    j = findnext(l -> startswith(l, "## "), lines, i + 1)
    return lines[i+1:(j === nothing ? length(lines) : j - 1)]
end

# The lines of the "How it scales" subsection, up to the end of the section
function scales_subsection(lines)
    sec = problem_section(lines)
    i = findfirst(==("### How it scales"), sec)
    i === nothing && return String[]
    j = findnext(l -> startswith(l, "### "), sec, i + 1)
    return sec[i+1:(j === nothing ? length(sec) : j - 1)]
end

# Check 2: the first `## ` heading is "The Problem", and it occurs once
function check_problem_heading(lines)
    errs = String[]
    first_h2 = findfirst(l -> startswith(l, "## "), lines)
    first_h2 === nothing && return ["the page has no `## ` heading"]
    lines[first_h2] == THE_PROBLEM || push!(errs, "the first `## ` heading is $(repr(lines[first_h2])), not $(repr(THE_PROBLEM))")
    n = count(==(THE_PROBLEM), lines)
    n == 1 || push!(errs, "$(repr(THE_PROBLEM)) occurs $(n) times")
    return errs
end

# Check 3: the section's `### ` headings are the three, in order
function check_problem_subsections(lines)
    subs = filter(l -> startswith(l, "### "), problem_section(lines))
    subs == PROBLEM_SUBSECTIONS && return String[]
    return ["the section's subsections are $(repr(subs)), not $(repr(PROBLEM_SUBSECTIONS))"]
end

# Check 4: "How it scales" has the table, with its header row and the two total rows
function check_scales_table(lines)
    errs = String[]
    rows = filter(l -> startswith(l, "|"), scales_subsection(lines))
    isempty(rows) && return ["\"How it scales\" has no table"]
    strip(first(rows)) == SCALES_TABLE_HEADER || push!(errs, "the table's header row is $(repr(first(rows)))")
    for name in ("Unknowns in total", "Residuals in total")
        any(r -> startswith(r, "| $(name)"), rows) || push!(errs, "the table has no row $(repr(name))")
    end
    return errs
end

# Check 5: the header's label
function check_baseline_label(page)
    errs = String[]
    occursin("- **Standard Baseline Model for Optimizers**:", page) || push!(errs, "the page has no \"Standard Baseline Model for Optimizers\" bullet")
    occursin(OLD_LABEL, page) && push!(errs, "the page says $(repr(OLD_LABEL))")
    return errs
end

# Check 6: the header's order: the Derivatives bullet, a blank line, the derivatives paragraph, then `---`, then the section
function check_header_order(lines)
    i = findfirst(l -> startswith(l, "- **Derivatives**:"), lines)
    i === nothing && return ["the page has no `- **Derivatives**:` bullet"]
    i + 2 <= length(lines) && isempty(strip(lines[i+1])) && startswith(lines[i+2], "**Derivatives:") ||
        return ["the Derivatives bullet is not followed by a blank line and the derivatives paragraph"]
    rest = filter(l -> !isempty(strip(l)), lines[i+3:end])
    length(rest) >= 2 && rest[1] == "---" && rest[2] == THE_PROBLEM && return String[]
    return ["after the derivatives paragraph come $(repr(first(rest, 2))), not `---` and $(repr(THE_PROBLEM))"]
end

page_checks(page) = (lines = split(page, '\n');
    vcat(check_problem_heading(lines), check_problem_subsections(lines), check_scales_table(lines),
         check_baseline_label(page), check_header_order(lines)))

# The counts at the smallest and largest default size, computed by hand from the problem files (the specification's
# table); (c) below checks the smallest against the models
const PAGE_COUNTS = Dict(
    #  slug                    => (smallest, unknowns, residuals, largest, unknowns, residuals)
    "rosenbrock_sparse"    => (100, 100, 199, 75000, 75000, 149999),
    "curve_fitting"        => (64, 3, 64, 65536, 3, 65536),
    "curve_fitting_robust" => (64, 3, 64, 65536, 3, 65536),
    "polynomial_fitting"   => (4, 4, 32, 64, 64, 512),
    "rosenbrock_dense"     => (2, 2, 3, 32, 32, 528),
    "multilateration"      => (2, 2, 8, 16, 16, 64),
    "affine_alignment"     => (1, 2, 4, 32, 1056, 4096),
    "pose_chain"           => (50, 150, 162, 10000, 30000, 32997),
    "ode_bvp"              => (32, 32, 32, 32768, 32768, 32768),
    "bundle_adjustment"    => (4, 96, 160, 256, 6144, 327680),
    "robust_procrustes"    => (3, 3, 18, 32, 496, 16896),
)

# The unknowns and residuals of a problem at a size, counted from the models it builds there
function counted_sizes(slug, prob, sz)
    if slug == "robust_procrustes"
        d = sz
        @test size(SmoothOptimizerBenchmark.generate_procrustes_data(d)) == (d, d * (d + 1) ÷ 2)
        return d * (d - 1) ÷ 2, d * size(SmoothOptimizerBenchmark.generate_procrustes_data(d), 2)
    end
    models = prob.generate_models(sz)
    if slug == "pose_chain"
        model = only(filter(m -> m.name == "NLLSModel (Sparse)", models)).model
        # NLLSModel.nresiduals counts the model's scalar residuals (each cost's nres, summed), so it is used here in
        # place of 3 * (N + number of loop closures)
        return 3 * length(model.variables), SmoothOptimizerBenchmark.NLLSModel.nresiduals(model)
    elseif slug == "bundle_adjustment"
        bam = models[findfirst(m -> m.model isa SmoothOptimizerBenchmark.BundleAdjustmentModel, models)].model
        return 9 * bam.ncams + 3 * bam.npnts, 2 * bam.nobs
    end
    lsp = models[findfirst(m -> m.model isa SmoothOptimizerBenchmark.LeastSquaresOptim.LeastSquaresProblem, models)].model
    return length(lsp.x), length(lsp.y)
end

# Whether a table cell holds the number n, as plain digits
holds_number(cell, n) = occursin(Regex("(?<![0-9])$(n)(?![0-9])"), cell)

@testset "Problem pages: header, The Problem section and its numbers (PP3)" begin
    # Moved from scaling_markdown_plotting.jl (DM12): a generated page states the mode in its header and says, under it,
    # what the mode means on that problem. The mode comes from the problem's definition, not from the results
    rosen_res = load_problem_markdown(joinpath(PAGES_ROOT, "docs", "src", "data", "rosenbrock_sparse.md"))
    page = generate_problem_markdown(rosen_res, "rosenbrock_sparse")
    @test occursin("- **Standard Baseline Model for Optimizers**: `Standalone (Sparse)`\n- **Derivatives**: autodiff\n\n**Derivatives: automatic.**", page)
    @test occursin("The `Standalone` model fills its residual vector and Jacobian by calling that same function", page)
    @test occursin("JuMP's own automatic differentiation", page)
    empty_result(name, cat) = ProblemScalingBenchmarkResult(name, cat, "n", Any[], SingleSizeBenchmarkResult[])
    for (name, slug, line, text) in (
            ("Multilateration", "multilateration", "analytic", "**Derivatives: analytic.** A cost of this problem depends on more than 8"),
            ("Nonlinear 3D Pose Chain", "pose_chain", "autodiff", "**Derivatives: automatic.**"),
            ("Sparse Bundle Adjustment", "bundle_adjustment", "mixed", "**Derivatives: mixed, exempt from the rule.**"),
            ("Robust Procrustes on SO(d)", "robust_procrustes", "analytic", "every model has a hand-written Jacobian"))
        p = generate_problem_markdown(empty_result(name, :small_dense), slug)
        @test occursin("- **Derivatives**: $(line)\n", p)
        @test occursin(text, p)
    end
    # The pose chain has a Standalone model (IND2): its page has the Standalone sentence
    @test occursin("The `Standalone` model fills its residual vector and Jacobian by calling that same function",
        generate_problem_markdown(empty_result("Nonlinear 3D Pose Chain", :large_sparse), "pose_chain"))
    @test_throws ArgumentError problem_derivatives("No Such Problem")

    # 1. The three dictionaries have the same keys, and every registered problem has a page
    @test Set(keys(PROBLEM_DESCRIPTIONS)) == Set(CANONICAL_PROBLEM_SLUGS)
    @test Set(keys(DERIVATIVES_NOTES)) == Set(CANONICAL_PROBLEM_SLUGS)
    @test length(CANONICAL_PROBLEM_SLUGS) == length(unique(CANONICAL_PROBLEM_SLUGS))
    @test all(p -> problem_slug(p.name) in CANONICAL_PROBLEM_SLUGS, problems)
    @test Set(keys(PAGE_COUNTS)) == Set(CANONICAL_PROBLEM_SLUGS)

    for slug in CANONICAL_PROBLEM_SLUGS
        @testset "$(slug)" begin
            prob = problems[findfirst(p -> problem_slug(p.name) == slug, problems)]
            page = generate_problem_markdown(empty_result(prob.name, prob.category), slug)
            lines = split(page, '\n')
            # 2 to 6
            @test isempty(check_problem_heading(lines))
            @test isempty(check_problem_subsections(lines))
            @test isempty(check_scales_table(lines))
            @test isempty(check_baseline_label(page))
            @test isempty(check_header_order(lines))

            # IND9: the section on which model each row runs on and how it stops: one line per row, with the model the
            # pairing gives it and its package's criteria, then the SecondOrderOptimization configuration; no section on
            # the removed SecondOrderOptimization rows
            @test occursin("\n## Which model each row runs on, and how it stops\n", page)
            @test !occursin("## The SecondOrderOptimization rows", page)
            models = prob.generate_models(first(prob.default_sizes))
            for o in prob.compatible_optimizers
                m = SmoothOptimizerBenchmark.resolve_optimizer_model(o, models)
                @test occursin("| `$(o.name)` | `$(m.name)` | ", page)
            end
            c = SOO_CONFIGS[slug]
            @test occursin("`iterator = $(repr(c.iterator))`, `linsolver = $(repr(c.linsolver))`, `formulation = $(repr(c.formulation))`", page)
            @test occursin("model is built up to", page) == (slug == "affine_alignment")   # decision 18

            # The numbers: (a) the sizes are the first and last default sizes
            small, u_small, r_small, large, u_large, r_large = PAGE_COUNTS[slug]
            @test first(prob.default_sizes) == small
            @test last(prob.default_sizes) == large
            # (b) the table's total rows hold them
            rows = Dict(first(page_row_cells(r)) => page_row_cells(r) for r in scales_subsection(lines) if startswith(r, "|"))
            @test holds_number(rows["Size"][3], small) && holds_number(rows["Size"][4], large)
            @test holds_number(rows["Unknowns in total"][3], u_small)
            @test holds_number(rows["Unknowns in total"][4], u_large)
            @test holds_number(rows["Residuals in total"][3], r_small)
            @test holds_number(rows["Residuals in total"][4], r_large)
            # (c) the smallest size's counts are the models'
            @test counted_sizes(slug, prob, small) == (u_small, r_small)
            if slug == "robust_procrustes"
                @test counted_sizes(slug, prob, large) == (u_large, r_large)
            elseif slug == "bundle_adjustment"
                # The largest size's observations, from the data alone (no models built)
                @test SmoothOptimizerBenchmark.make_synthetic_bam(large).nobs == r_large ÷ 2 == 163840
            end
        end
    end

    # CN3: a result whose rows carry an error in the solution has the two extra plots, in both tables, and its page links
    # them where they are written; a result without has neither link
    let base_res = load_problem_markdown(joinpath(PAGES_ROOT, "docs", "src", "data", "rosenbrock_sparse.md"))
        with_err(res) = ProblemScalingBenchmarkResult(res.problem, res.category, res.size_metric_name, res.sizes,
            [SingleSizeBenchmarkResult(sr.problem, sr.category, sr.size, sr.size_metric_name, sr.model_results, sr.target_model,
                 Dict(k => SmoothOptimizerBenchmark.with_solution_error(r, 1e-3) for (k, r) in sr.optimizer_results))
             for sr in res.size_results])
        res_err = with_err(base_res)
        root = mktempdir()
        generate_all_plots([res_err]; outdir=joinpath(root, "assets", "plots"))
        generate_all_plots([res_err]; outdir=joinpath(root, "assets", "plots", "single_threaded"), title_suffix=" (1 thread)")
        pg = generate_problem_markdown(res_err, "rosenbrock_sparse"; single_threaded=res_err)
        links = [m.captures[1] for m in eachmatch(r"\]\((\.\./assets/plots/[^)]*_(?:solution_error|iterations)\.png)\)", pg)]
        @test length(links) == 4
        @test all(l -> isfile(normpath(joinpath(root, "problems", l))), links)
        @test count("### Error in the solution and iterations", pg) == 2
        @test occursin("A row that is not `ok` at a value is missing there.", pg)
        @test isempty(page_checks(pg))
        pg_none = generate_problem_markdown(base_res, "rosenbrock_sparse"; single_threaded=base_res)
        @test !occursin("_solution_error.png", pg_none) && !occursin("_iterations.png", pg_none)
        rm(root; recursive=true, force=true)
    end

    # The committed pages pass checks 2 to 6: this fails if the generator is changed and the pages are not regenerated
    for slug in CANONICAL_PROBLEM_SLUGS
        committed = read(joinpath(PAGES_ROOT, "docs", "src", "problems", "$(slug).md"), String)
        errs = page_checks(committed)
        isempty(errs) || @info "docs/src/problems/$(slug).md" errs
        @test isempty(errs)
    end

    # A fixture that fails each check: the stored sparse Rosenbrock page, which passes them all, broken one way at a time
    base = page
    @test isempty(page_checks(base))
    no_section = replace(base, THE_PROBLEM * "\n" => "")
    @test !isempty(check_problem_heading(split(no_section, '\n')))
    no_subsection = replace(base, "### Similar problems\n" => "")
    @test !isempty(check_problem_subsections(split(no_subsection, '\n')))
    new_header = replace(base, SCALES_TABLE_HEADER => "| | Formula | Smallest | Largest |")
    @test !isempty(check_scales_table(split(new_header, '\n')))
    old_label = replace(base, "Standard Baseline Model for Optimizers" => "Standard Baseline Model " * OLD_LABEL)
    @test !isempty(check_baseline_label(old_label))
    # The section, from its heading to the `---` after it, moved above the derivatives paragraph
    sec_start = findfirst(THE_PROBLEM, base)
    sec_end = findnext("\n---\n", base, last(sec_start))
    section = base[first(sec_start):last(sec_end)]
    deriv = findfirst("\n**Derivatives:", base)
    moved = base[1:first(deriv)] * section * "\n" * replace(base[first(deriv)+1:end], section => ""; count=1)
    @test occursin(THE_PROBLEM, moved) && findfirst(THE_PROBLEM, moved) < findfirst("\n**Derivatives:", moved)
    @test !isempty(check_header_order(split(moved, '\n')))
end
