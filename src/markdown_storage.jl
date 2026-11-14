# Streaming Markdown Benchmark Storage & Deserialization
using Markdown
using Printf
using Dates

export load_problem_markdown, load_all_problem_markdown, update_problem_plots
export init_problem_markdown, append_model_evaluation, init_optimizer_section, append_optimizer_evaluation

function get_git_commit()
    pkg_root = normpath(joinpath(@__DIR__, ".."))
    try
        return strip(read(`git -C $pkg_root rev-parse --short HEAD`, String))
    catch
        return "unknown"
    end
end

function extract_text(x)
    if x isa String
        return x
    elseif hasfield(typeof(x), :text)
        return extract_text(x.text)
    elseif hasfield(typeof(x), :content)
        return extract_text(x.content)
    elseif x isa AbstractVector
        return join([extract_text(item) for item in x], "")
    else
        return string(x)
    end
end

function parse_size_val(s::AbstractString)
    i = tryparse(Int, s)
    i !== nothing && return i
    f = tryparse(Float64, s)
    f !== nothing && return f
    return String(s)
end

# The thread counts in force, for the header of a results file (M17)
function threads_line()
    t = benchmark_threads()
    return "- **Threads**: NLLSModel numthreads=$(t.numthreads), Julia threads=$(t.julia_threads), BLAS threads=$(t.blas_threads)"
end

"""
    init_problem_markdown(filepath::String, prob_name::String, category::Symbol, size_metric_name::String, target_model_name::String) -> String

Initializes a problem markdown data file with metadata headers and the Model Evaluation table header, flushing immediately.
"""
function init_problem_markdown(filepath::String, prob_name::String, category::Symbol, size_metric_name::String, target_model_name::String)
    mkpath(dirname(filepath))
    open(filepath, "w") do io
        println(io, "# Benchmark Results: $(prob_name)")
        println(io)
        println(io, "- **Category**: $(category)")
        println(io, "- **Scaling Metric**: $(size_metric_name)")
        println(io, "- **Optimizer Target Model**: $(target_model_name)")
        println(io, "- **Convergence Criteria**: gtol=$(DEFAULT_GTOL), xtol=$(DEFAULT_XTOL), ftol=$(DEFAULT_FTOL), maxiters=$(DEFAULT_MAXITERS), maxtime=$(DEFAULT_MAXTIME)s")
        println(io, "- **Benchmark Date**: $(Dates.format(Dates.now(), "yyyy-mm-ddTHH:MM:SS"))")
        println(io, "- **Host CPU**: $(Sys.CPU_NAME) ($(Sys.CPU_THREADS) cores)")
        println(io, "- **OS**: $(Sys.KERNEL) ($(Sys.MACHINE))")
        println(io, "- **Julia Version**: $(VERSION)")
        println(io, threads_line())
        println(io, "- **Git Commit**: $(get_git_commit())")
        println(io)
        println(io, "---")
        println(io)
        println(io, "## Model Evaluation Scaling")
        println(io)
        println(io, "| Size | Model | Cost Time (ns) | Cost Allocs | Cost Memory (bytes) | Linsys Time (ns) | Linsys Allocs | Linsys Memory (bytes) |")
        println(io, "|:---|:---|---:|---:|---:|---:|---:|---:|")
        flush(io)
    end
    return filepath
end

"""
    append_model_evaluation(filepath::String, sz, model_name::String, mr::ModelEvaluationResult)

Appends a single model evaluation result row to the Markdown file and flushes immediately.
"""
function append_model_evaluation(filepath::String, sz, model_name::String, mr::ModelEvaluationResult)
    open(filepath, "a") do io
        println(io, "| $(sz) | $(model_name) | $(mr.cost_time_ns) | $(mr.cost_allocs) | $(mr.cost_bytes) | $(mr.linsys_time_ns) | $(mr.linsys_allocs) | $(mr.linsys_bytes) |")
        flush(io)
    end
end

"""
    init_optimizer_section(filepath::String, target_model_name::String)

Appends the optimizer evaluation table header to the Markdown file and flushes immediately.
"""
function init_optimizer_section(filepath::String, target_model_name::String)
    open(filepath, "a") do io
        println(io)
        println(io, "---")
        println(io)
        println(io, "## Optimizer Evaluation Scaling")
        println(io)
        println(io, "Solvers evaluated on their respective optimal model representations (e.g. `NLLSModel` for `SecondOrderOptimization`, `LeastSquaresProblem` for `LeastSquaresOptim`, `NLPModels` for JSO/interior-point solvers, `Manifolds` for `Manopt`).")
        println(io)
        println(io, "| Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged | Status | Excess Cost | Message |")
        println(io, "|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|:---|")
        flush(io)
    end
end

"""
    append_optimizer_evaluation(filepath::String, sz, opt_name::String, r::OptimizerResult)

Appends a single optimizer result row to the Markdown file and flushes immediately.
"""
function append_optimizer_evaluation(filepath::String, sz, opt_name::String, r::OptimizerResult)
    open(filepath, "a") do io
        cost_str = isnan(r.final_cost) ? "NaN" : @sprintf("%.4e", r.final_cost)
        excess_str = isnan(r.excess_cost) ? "NaN" : @sprintf("%.4e", r.excess_cost)
        println(io, "| $(sz) | $(opt_name) | $(r.time_ns) | $(r.allocs) | $(r.bytes) | $(r.iterations) | $(cost_str) | $(r.converged) | $(r.status) | $(excess_str) | $(md_escape(table_message(r.message))) |")
        flush(io)
    end
end

# A message fit for one table cell: one line, no pipes, at most `maxlen` characters
function table_message(msg::AbstractString; maxlen::Int=160)
    s = strip(replace(msg, r"\s+" => " ", "|" => "/"))
    return length(s) <= maxlen ? s : first(s, maxlen - 1) * "…"
end

# Escape the characters Markdown would read as formatting (`abs_dcost` would lose its underscore)
md_escape(s::AbstractString) = replace(s, r"([\\`*_\[\]<>])" => s"\\\1")

"""
    load_problem_markdown(filepath::String) -> ProblemScalingBenchmarkResult

Deserializes a ProblemScalingBenchmarkResult from a Markdown file using stdlib Markdown.parse.
"""
function load_problem_markdown(filepath::String)::ProblemScalingBenchmarkResult
    content = read(filepath, String)
    doc = Markdown.parse(content)

    problem_name = ""
    category = :general
    size_metric_name = "Size"
    target_model_name = "Standard"

    for elem in doc.content
        if elem isa Markdown.Header && occursin("Benchmark Results:", extract_text(elem))
            h_text = extract_text(elem)
            m = match(r"Benchmark Results:\s*(.*)$", h_text)
            if m !== nothing
                problem_name = strip(m.captures[1])
            end
        elseif elem isa Markdown.List
            for item in elem.items
                line = extract_text(item)
                m = match(r"^([^:]+):\s*(.*)$", line)
                if m !== nothing
                    k = lowercase(strip(m.captures[1]))
                    v = strip(m.captures[2])
                    if k == "category"
                        category = Symbol(v)
                    elseif k == "scaling metric"
                        size_metric_name = v
                    elseif k == "optimizer target model"
                        target_model_name = v
                    end
                end
            end
        end
    end

    if isempty(problem_name)
        problem_name = replace(basename(filepath), ".md" => "")
    end

    tables = [e for e in doc.content if e isa Markdown.Table]
    models_by_size = Dict{Any, Dict{String, ModelEvaluationResult}}()
    opts_by_size = Dict{Any, Dict{String, OptimizerResult}}()
    ordered_sizes = Any[]

    model_table = nothing
    opt_table = nothing

    for t in tables
        if !isempty(t.rows)
            hdr = [lowercase(strip(extract_text(c))) for c in t.rows[1]]
            if any(h -> occursin("optimizer", h), hdr)
                opt_table = t
            elseif any(h -> occursin("model", h), hdr)
                model_table = t
            end
        end
    end

    if model_table !== nothing
        for row in model_table.rows[2:end]
            cells = [strip(extract_text(c)) for c in row]
            length(cells) < 8 && continue
            sz = parse_size_val(cells[1])
            m_name = cells[2]
            c_time = parse(Float64, cells[3])
            c_alloc = parse(Int, cells[4])
            c_bytes = parse(Int, cells[5])
            ls_time = parse(Float64, cells[6])
            ls_alloc = parse(Int, cells[7])
            ls_bytes = parse(Int, cells[8])

            if !haskey(models_by_size, sz)
                models_by_size[sz] = Dict{String, ModelEvaluationResult}()
                push!(ordered_sizes, sz)
            end
            models_by_size[sz][m_name] = ModelEvaluationResult(c_time, c_alloc, c_bytes, ls_time, ls_alloc, ls_bytes)
        end
    end

    if opt_table !== nothing
        # Columns are found by header, so files written before a column existed still load
        hdr = [lowercase(strip(extract_text(c))) for c in opt_table.rows[1]]
        col(name) = findfirst(h -> startswith(h, name), hdr)
        c_status, c_message, c_excess = col("status"), col("message"), col("excess")
        for row in opt_table.rows[2:end]
            cells = [strip(extract_text(c)) for c in row]
            length(cells) < 8 && continue
            sz = parse_size_val(cells[1])
            opt_name = cells[2]
            time_ns = parse(Float64, cells[3])
            allocs = parse(Int, cells[4])
            bytes = parse(Int, cells[5])
            iters = parse(Int, cells[6])
            final_cost = cells[7] == "NaN" ? NaN : parse(Float64, cells[7])
            converged = parse(Bool, cells[8])
            # Rows from before the status column: only convergence was recorded
            status = c_status !== nothing && c_status <= length(cells) ? Symbol(cells[c_status]) : (converged ? :ok : :not_converged)
            message = c_message !== nothing && c_message <= length(cells) ? String(cells[c_message]) : ""
            excess = c_excess !== nothing && c_excess <= length(cells) && cells[c_excess] != "NaN" ? parse(Float64, cells[c_excess]) : NaN

            if !haskey(opts_by_size, sz)
                opts_by_size[sz] = Dict{String, OptimizerResult}()
                if !(sz in ordered_sizes)
                    push!(ordered_sizes, sz)
                end
            end
            opts_by_size[sz][opt_name] = OptimizerResult(time_ns, allocs, bytes, iters, NaN, final_cost, converged, status, message, excess)
        end
    end

    size_results = SingleSizeBenchmarkResult[]
    for sz in ordered_sizes
        m_dict = get(models_by_size, sz, Dict{String, ModelEvaluationResult}())
        o_dict = get(opts_by_size, sz, Dict{String, OptimizerResult}())
        push!(size_results, SingleSizeBenchmarkResult(
            problem_name,
            category,
            sz,
            size_metric_name,
            m_dict,
            target_model_name,
            o_dict
        ))
    end

    return ProblemScalingBenchmarkResult(
        problem_name,
        category,
        size_metric_name,
        ordered_sizes,
        size_results
    )
end

"""
    load_all_problem_markdown(dir::String=DEFAULT_DATA_DIR) -> Vector{ProblemScalingBenchmarkResult}

Loads all `.md` benchmark result files from `dir`.
"""
function load_all_problem_markdown(dir::String=DEFAULT_DATA_DIR)::Vector{ProblemScalingBenchmarkResult}
    !isdir(dir) && return ProblemScalingBenchmarkResult[]
    files = sort(filter(f -> endswith(f, ".md"), readdir(dir; join=true)))
    return ProblemScalingBenchmarkResult[load_problem_markdown(f) for f in files]
end

"""
    update_problem_plots(slug::String; data_dir=DEFAULT_DATA_DIR, outdir=DEFAULT_PLOTS_DIR) -> Tuple{String, String}

Regenerates the model and optimizer plots for a single problem using its Markdown data file.
"""
function update_problem_plots(slug::String; data_dir=DEFAULT_DATA_DIR, outdir=DEFAULT_PLOTS_DIR)
    md_file = joinpath(data_dir, "$(slug).md")
    !isfile(md_file) && error("Data file not found: $(md_file)")
    res = load_problem_markdown(md_file)
    m_path = plot_model_scaling(res; outdir=outdir)
    o_path = plot_optimizer_scaling(res; outdir=outdir)
    return (m_path, o_path)
end
