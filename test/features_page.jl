using Test
using SmoothOptimizerBenchmark

# FP3: docs/src/features.md, read as lines. A section is a `## ` heading and the lines up to the next one; its
# subsections are its `### ` headings. A table is a run of lines starting with `|`; a row is split on `|`, cells
# stripped. The key tables are the tables under a `### Key` subsection; every other table is a feature table.
# Each check returns the list of what it found wrong, so that it can also be run on a fixture that violates it.

const FEATURES_ROOT = pkgdir(SmoothOptimizerBenchmark)

row_cells(line) = strip.(split(strip(line), '|')[2:end-1])

# The sections of a page: heading => vector of (subsection heading, lines)
function page_sections(lines)
    sections = Pair{String, Vector{Tuple{String, Vector{String}}}}[]
    for line in lines
        if startswith(line, "## ")
            push!(sections, strip(line[4:end]) => [("", String[])])
        elseif !isempty(sections)
            subs = last(sections).second
            startswith(line, "### ") ? push!(subs, (strip(line[5:end]), String[])) : push!(last(subs)[2], line)
        end
    end
    return sections
end

# The runs of table lines in a block of lines, each with the lines that follow it up to the next table
function tables_in(lines)
    tables = Tuple{Vector{String}, Vector{String}}[]
    intable = false
    for line in lines
        if startswith(line, "|")
            intable || push!(tables, (String[], String[]))
            push!(last(tables)[1], line)
            intable = true
        else
            !isempty(tables) && push!(last(tables)[2], line)
            intable = false
        end
    end
    return tables
end

# A feature table: its header, its body rows (the alignment row dropped) and the ordered list under it
function feature_table(table, after)
    rows = row_cells.(table)
    notes = Int[]
    for line in after
        m = match(r"^(\d+)\. \S", line)
        m === nothing || push!(notes, parse(Int, m[1]))
    end
    return (header = rows[1], body = rows[3:end], notes = notes)
end

isgrouprow(cells) = startswith(cells[1], "**") && endswith(cells[1], "**") && all(isempty, cells[2:end])

const URL = raw"(?:https://[^\s()]+|problems/[a-z0-9_]+\.md)"
const FEATURE_FORMS = [Regex("^\\[✓\\]\\($URL\\)\$"), r"^✗$", Regex("^\\[~\\]\\($URL\\) \\((\\d+)\\)\$"),
    r"^✗ \((\d+)\)$", Regex("^\\[✓\\]\\($URL\\) \\((\\d+)\\)\$")]
const MODEL_FORM = r"^(?:native|NLPModels|adapter|—)(?: \((\d+)\))?$"

# Check 3 (and 7 with `forms = [MODEL_FORM]`): every cell outside a group row has one of the forms
function bad_cells(body; forms=FEATURE_FORMS)
    bad = String[]
    for cells in body, cell in cells[2:end]
        isgrouprow(cells) && continue
        any(f -> occursin(f, cell), forms) || push!(bad, "$(cells[1]): $(repr(cell))")
    end
    return bad
end

# The note numbers in cell order, row by row
cell_notes(body) = [parse(Int, m[1]) for cells in body for cell in cells[2:end] for m in eachmatch(r" \((\d+)\)$", cell)]

# Check 5: every number used has an entry, every entry is used, the entries are 1:n, first appearances increase
function note_problems(body, notes)
    used = cell_notes(body)
    bad = String[]
    notes == collect(1:length(notes)) || push!(bad, "the notes are numbered $(notes), not 1:$(length(notes))")
    for n in setdiff(used, notes); push!(bad, "note $n is used but has no entry"); end
    for n in setdiff(notes, used); push!(bad, "note $n has an entry but is not used"); end
    firsts = unique(used)
    issorted(firsts) || push!(bad, "first appearances are not in increasing order: $(firsts)")
    return bad
end

# Check 6: no cell contains `?`
question_cells(body) = ["$(cells[1]): $(repr(cell))" for cells in body for cell in cells if occursin('?', cell)]

# Check 4: every relative link resolves to a file under docs/src
function unresolved_links(text, root)
    bad = String[]
    for m in eachmatch(r"\]\(([^)\s]+)\)", text)
        target = m[1]
        (startswith(target, "http") || startswith(target, "#") || startswith(target, "mailto:")) && continue
        isfile(joinpath(root, split(target, '#')[1])) || push!(bad, target)
    end
    return bad
end

const MODELLER_HEADER = ["Feature", "NLLSModel", "JuMP", "LSOptim", "NonlinSolve", "Optim", "Manopt", "ADNLP†", "Exa†",
    "Optimization†", "RoME†"]
const MODELLER_ROWS = ["**Problem class**", "Least-squares residuals are first class", "General scalar costs",
    "**Variables**", "Manifold variables", "Variable blocks of different types and sizes", "Fix a subset of variables",
    "**Structure**", "Explicit variable-to-cost graph", "Sparse Jacobian or Hessian", "Block-sparse storage",
    "**Derivatives**", "Automatic", "Automatic, sparse", "Hand-written derivatives", "Exact second derivatives",
    "Operator products", "**Robust kernels**", "Fixed kernels", "Second-order correction", "Adaptive kernels",
    "**Constraints**", "Bounds on variables", "Equality constraints", "Nonlinear inequality constraints",
    "**Evaluation**", "Multithreaded evaluation", "GPU evaluation"]
const OPTIMIZER_HEADER = ["Feature", "SOO", "LSOptim", "Optim", "JSO", "Ipopt", "MadNLP", "NonlinSolve", "CaNNOLeS",
    "Manopt", "LsqFit†", "Percival†", "NLopt†"]
const OPTIMIZER_ROWS = ["**Objective**", "General scalar objective", "Least squares from the residual and Jacobian",
    "**Step**", "Newton", "Gauss–Newton, undamped", "Levenberg", "Marquardt", "Dogleg trust region",
    "Other trust region", "Line search", "Quasi-Newton", "Interior point", "Augmented Lagrangian",
    "Geodesic acceleration", "**Constraints enforced**", "Bounds", "Equality", "Nonlinear inequality", "**Variables**",
    "Manifold updates", "Variable blocks of different types and sizes", "**Linear solve**",
    "Static systems for small problems", "Dense factorization", "Sparse direct factorization",
    "Sparse QR of the Jacobian", "Iterative (Krylov)", "Matrix-free", "Elimination of a block of variables",
    "Choice of linear-solver backend", "**Other**", "GPU", "Element types other than `Float64`",
    "Covariance of the estimate"]
const MODEL_HEADER = ["Model", "SOO", "LSOptim", "Optim", "JSO", "Ipopt", "MadNLP", "NonlinSolve", "CaNNOLeS", "Manopt"]
const MODEL_ROWS = ["NLLSModel `Model`, Euclidean variables", "NLLSModel `Model`, manifold variables",
    "`LeastSquaresProblem` (\"Standalone\")", "JuMP model (`MathOptNLSModel`)", "`BundleAdjustmentModel`",
    "Manifolds.jl residual blocks"]

@testset "The features page: every cell has a state and its evidence (FP3)" begin
    text = read(joinpath(FEATURES_ROOT, "docs", "src", "features.md"), String)
    sections = page_sections(split(text, '\n'))

    # 1. The three sections, in order, each with exactly one feature table; the first two with a key table
    @test first.(sections) == ["Modelling packages", "Optimizers", "Which optimizer accepts which model"]
    tables = map(sections) do (_, subs)
        feature = [(t, a) for (name, lines) in subs if name != "Key" for (t, a) in tables_in(lines)]
        @test length(feature) == 1
        feature_table(only(feature)...)
    end
    for (_, subs) in sections[1:2]
        @test any(((name, lines),) -> name == "Key" && !isempty(tables_in(lines)), subs)
    end
    modeller, optimizer, models = tables

    # 2. The header row and the first cell of every row, as published
    @test modeller.header == MODELLER_HEADER
    @test first.(modeller.body) == MODELLER_ROWS
    @test optimizer.header == OPTIMIZER_HEADER
    @test first.(optimizer.body) == OPTIMIZER_ROWS
    @test models.header == MODEL_HEADER
    @test first.(models.body) == MODEL_ROWS
    @test all(row -> length(row) == length(modeller.header), modeller.body)
    @test all(row -> length(row) == length(optimizer.header), optimizer.body)
    @test all(row -> length(row) == length(models.header), models.body)

    # 3. Every cell of the two feature tables has one of the five forms
    @test isempty(bad_cells(modeller.body))
    @test isempty(bad_cells(optimizer.body))

    # 4. Every relative link resolves
    @test isempty(unresolved_links(text, joinpath(FEATURES_ROOT, "docs", "src")))

    # 5. The notes of each table
    @test isempty(note_problems(modeller.body, modeller.notes))
    @test isempty(note_problems(optimizer.body, optimizer.notes))

    # 6. No `?` in any table
    @test isempty(question_cells(modeller.body))
    @test isempty(question_cells(optimizer.body))
    @test isempty(question_cells(models.body))

    # 7. The third table: one of the four words, with its notes checked as in 5
    @test isempty(bad_cells(models.body; forms=[MODEL_FORM]))
    @test isempty(note_problems(models.body, models.notes))

    # 8. The page is in the navigation and linked from the overview, in the page and in its generator
    @test occursin("\"Package Features\" => \"features.md\"", read(joinpath(FEATURES_ROOT, "docs", "make.jl"), String))
    @test occursin("[Package Features](features.md)", read(joinpath(FEATURES_ROOT, "docs", "src", "index.md"), String))
    @test occursin("[Package Features](features.md)", read(joinpath(FEATURES_ROOT, "scripts", "generate_docs_content.jl"), String))

    # Checks 3, 5, 6 and 7 fail on a fixture that violates each
    fixture = """
    ## Fixture

    ### Table

    | Feature | A | B |
    |:---|:-:|:-:|
    | **Group** | | |
    | Row one | [✓](https://example.org) | ✓ |
    | Row two | [~](problems/x.md) (2) | ? |
    | Row three | ✗ (1) | [~](https://example.org) (3) |

    Notes

    1. One.
    2. Two.
    """
    fx = feature_table(only(tables_in(only(page_sections(split(fixture, '\n'))).second[2][2]))...)
    @test bad_cells(fx.body) == ["Row one: \"✓\"", "Row two: \"?\""]                     # 3: a bare tick, a `?`
    @test length(note_problems(fx.body, fx.notes)) == 2                                     # 5: note 3 has no entry, 2 before 1
    @test question_cells(fx.body) == ["Row two: \"?\""]                                     # 6
    @test bad_cells([["M", "native", "native (1)", "adaptor", "— (x)"]]; forms=[MODEL_FORM]) ==
        ["M: \"adaptor\"", "M: \"— (x)\""]                                                  # 7: a misspelt word, a bad note
    @test note_problems([["M", "native (2)"]], [1, 2]) == ["note 1 has an entry but is not used"]
end
