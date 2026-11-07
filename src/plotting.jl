# Plotting utilities for SmoothOptimizerBenchmark scaling analysis
ENV["GKSwstype"] = "100" # Headless GR backend
using Plots
using Printf

export problem_slug, plot_model_scaling, plot_optimizer_scaling, generate_all_plots

"""
    problem_slug(name::String) -> String

Converts a human-readable problem title into a filename-friendly slug.
"""
function problem_slug(name::String)
    lower = lowercase(name)
    if occursin("sparse multi-dimensional rosenbrock", lower)
        return "rosenbrock_sparse"
    elseif occursin("dense multi-dimensional rosenbrock", lower)
        return "rosenbrock_dense"
    elseif occursin("exponential curve fitting", lower)
        return "curve_fitting"
    elseif occursin("affine alignment", lower)
        return "affine_alignment"
    elseif occursin("pose chain", lower)
        return "pose_chain"
    elseif occursin("bundle adjustment", lower)
        return "bundle_adjustment"
    elseif occursin("procrustes", lower)
        return "robust_procrustes"
    else
        return replace(replace(lower, " " => "_"), "(" => "", ")" => "")
    end
end

"""
    model_style(m_name::String) -> (Symbol, Symbol, Symbol, Symbol)

Maps a model formulation name to a consistent (color, marker, linsys_style, cost_style) tuple:
- Specific color for each package:
  - NLLSModel: :red (matches SecondOrderOptimization)
  - Standalone: :blue
  - NLPModels: :forestgreen (matches JSOSolvers)
  - BundleAdjustmentModels: :teal
  - Manifolds: :darkgoldenrod (matches Manopt)
- Different flavours within the same package use distinct markers and linestyles:
  - Standard / Static: :circle marker, :solid linsys, :dash cost
  - Specialized: :square marker, :dashdot linsys, :dot cost
  - ManifoldVar: :diamond marker, :dash linsys, :dot cost
  - Sparse: :utriangle marker, :solid linsys, :dash cost
"""
function model_style(m_name::String)
    name_lower = lowercase(m_name)

    # 1. Package color (matching optimizer package where related; Red for NLLSModel, Blue for Standalone)
    color = if occursin("nllsmodel", name_lower)
        :red
    elseif occursin("standalone", name_lower) || occursin("leastsquares", name_lower) || occursin("lso", name_lower)
        :blue
    elseif occursin("nlpmodels", name_lower)
        :forestgreen
    elseif occursin("bundleadjustment", name_lower) || occursin("bam", name_lower)
        :teal
    elseif occursin("manifold", name_lower) || occursin("manopt", name_lower)
        :darkgoldenrod
    else
        :black
    end

    # 2. Flavour point marker and linestyles (linsys_style, cost_style)
    if occursin("specialized", name_lower)
        marker = :square
        linsys_style = :dashdot
        cost_style = :dot
    elseif occursin("manifoldvar", name_lower)
        marker = :diamond
        linsys_style = :dash
        cost_style = :dot
    elseif occursin("sparse", name_lower)
        marker = :utriangle
        linsys_style = :solid
        cost_style = :dash
    else
        marker = :circle
        linsys_style = :solid
        cost_style = :dash
    end

    return color, marker, linsys_style, cost_style
end

"""
    compute_mean_ranks(item_names::Vector{String}, sizes, get_time::Function) -> Dict{String, Float64}

Computes the mean rank per size for each item in `item_names`.
At each size `j`, items are ranked from 1 (fastest) to K (slowest).
Items that failed or have NaN/Inf time receive the worst rank.
Returns a dictionary mapping item name to its mean rank across all sizes.
"""
function compute_mean_ranks(item_names::Vector{String}, sizes, get_time::Function)
    n_items = length(item_names)
    n_sizes = length(sizes)
    if n_items == 0 || n_sizes == 0
        return Dict{String, Float64}()
    end

    rank_sums = Dict{String, Float64}(name => 0.0 for name in item_names)

    for (j, sz) in enumerate(sizes)
        times_at_sz = Float64[]
        for name in item_names
            t = get_time(name, j)
            val = (!isnan(t) && t > 0 && isfinite(t)) ? t : Inf
            push!(times_at_sz, val)
        end

        perm = sortperm(times_at_sz)
        i = 1
        while i <= n_items
            j_end = i
            while j_end < n_items && times_at_sz[perm[j_end + 1]] == times_at_sz[perm[i]]
                j_end += 1
            end
            avg_rank = (i + j_end) / 2.0
            for k in i:j_end
                name = item_names[perm[k]]
                rank_sums[name] += avg_rank
            end
            i = j_end + 1
        end
    end

    return Dict{String, Float64}(name => rank_sums[name] / n_sizes for name in item_names)
end

"""
    plot_model_scaling(res::ProblemScalingBenchmarkResult; outdir=DEFAULT_PLOTS_DIR) -> String

Generates a log-log scaling plot of model evaluation time vs problem size.
Saves the plot as a PNG image in `outdir` and returns the file path.
"""
function plot_model_scaling(res::ProblemScalingBenchmarkResult; outdir=DEFAULT_PLOTS_DIR)
    mkpath(outdir)
    slug = problem_slug(res.problem)
    filepath = joinpath(outdir, "$(slug)_models.png")

    sizes = [Float64(s) for s in res.sizes]

    # Collect distinct model names across all sizes
    all_models = String[]
    for s_res in res.size_results
        for m_name in keys(s_res.model_results)
            if !(m_name in all_models)
                push!(all_models, m_name)
            end
        end
    end

    # If a problem has <= 1 models (e.g. Phase 1 model comparison omitted), do not generate a model plot
    if length(all_models) <= 1
        isfile(filepath) && rm(filepath; force=true)
        return ""
    end

    # Rank models according to their mean rank per size (slowest at top, fastest at bottom)
    get_model_time(m_name, j) = begin
        s_res = res.size_results[j]
        if haskey(s_res.model_results, m_name)
            mr = s_res.model_results[m_name]
            if !isnan(mr.linsys_time_ns) && mr.linsys_time_ns > 0
                return mr.linsys_time_ns
            end
        end
        return Inf
    end
    model_mean_ranks = compute_mean_ranks(all_models, sizes, get_model_time)
    sort!(all_models, by = m -> (model_mean_ranks[m], m), rev = true)

    is_small_sizes = maximum(sizes) <= 32
    plot_kwargs = if is_small_sizes
        if minimum(sizes) >= 2 || occursin("so(", lowercase(res.problem)) || occursin("procrustes", lowercase(res.problem))
            (xticks = ([2, 4, 8, 16, 32], ["2", "4", "8", "16", "32"]), xlims = (1.8, 36.0))
        else
            (xticks = ([1, 2, 4, 8, 16, 32], ["1", "2", "4", "8", "16", "32"]), xlims = (0.85, 36.0))
        end
    else
        NamedTuple()
    end

    p = plot(
        title = "$(res.problem): Model Evaluation Scaling",
        xlabel = res.size_metric_name * " (log scale)",
        ylabel = "Evaluation Time (μs, log scale)",
        xscale = :log10,
        yscale = :log10,
        legend = :topleft,
        grid = true,
        size = (850, 550),
        dpi = 150;
        plot_kwargs...
    )

    for m_name in all_models
        cost_times = Float64[]
        linsys_times = Float64[]
        valid_sizes = Float64[]

        for (j, s_res) in enumerate(res.size_results)
            if haskey(s_res.model_results, m_name)
                mr = s_res.model_results[m_name]
                # convert ns to microseconds
                c_us = mr.cost_time_ns / 1e3
                ls_us = mr.linsys_time_ns / 1e3
                if !isnan(c_us) && c_us > 0 && !isnan(ls_us) && ls_us > 0
                    push!(valid_sizes, sizes[j])
                    push!(cost_times, c_us)
                    push!(linsys_times, ls_us)
                end
            end
        end

        c_color, m_shape, linsys_style, cost_style = model_style(m_name)

        if !isempty(valid_sizes)
            # Linear system assembly curve (solid, slower -> plotted first)
            plot!(
                p, valid_sizes, linsys_times,
                label = "$(m_name) (Cost + Linsys)",
                linestyle = linsys_style,
                color = c_color,
                markershape = m_shape,
                markerstrokecolor = c_color,
                markersize = 5,
                linewidth = 2.0
            )
            # Cost evaluation curve (dashed, faster -> plotted second)
            plot!(
                p, valid_sizes, cost_times,
                label = "$(m_name) (Cost)",
                linestyle = cost_style,
                color = c_color,
                markershape = m_shape,
                markerstrokecolor = c_color,
                markersize = 4,
                linewidth = 1.5
            )
        end
    end

    savefig(p, filepath)
    return filepath
end

"""
    optimizer_style(opt_name::String) -> (Symbol, Symbol, Symbol)

Maps an optimizer name to a consistent (color, linestyle, marker) tuple:
- Single color per package across all benchmark problems:
  - SecondOrderOptimization: :red
  - LeastSquaresOptim: :blue
  - Optim: :darkorange
  - JSOSolvers: :forestgreen
  - Ipopt: :purple
  - MadNLP: :teal
  - NonlinearSolve: :deeppink
  - CaNNOLeS: :chocolate
  - Manopt: :darkgoldenrod
- Different flavours (e.g. LM, Dogleg, tron, trunk, NLLSModel + SecondOrderOptimization) use distinct linestyles and markers:
  - NLLSModel + SecondOrderOptimization (LM): :dot with :star5
  - NLLSModel + SecondOrderOptimization (Dogleg): :dashdot with :star5
  - LM / trunk / default Newton: :solid with :circle
  - Dogleg / tron / TrustRegion: :dash with :square
  - GaussNewton: :dot with :diamond
"""
function optimizer_style(opt_name::String)
    name_lower = lowercase(opt_name)

    # Full-stack NLLSModel + SecondOrderOptimization uses red star markers
    if occursin("nllsmodel", name_lower) && (occursin("secondorder", name_lower) || occursin("soo", name_lower))
        linestyle = occursin("dogleg", name_lower) ? :dashdot : :dot
        return :red, linestyle, :star5
    end

    # 1. Package color
    color = if occursin("secondorder", name_lower) || startswith(name_lower, "soo")
        :red
    elseif occursin("leastsquares", name_lower) || occursin("lso", name_lower)
        :blue
    elseif occursin("nonlinearsolve", name_lower)
        :deeppink
    elseif occursin("optim", name_lower) # checked after leastsquaresoptim
        :darkorange
    elseif occursin("jsosolvers", name_lower)
        :forestgreen
    elseif occursin("ipopt", name_lower)
        :purple
    elseif occursin("madnlp", name_lower)
        :teal
    elseif occursin("cannoles", name_lower)
        :chocolate
    elseif occursin("manopt", name_lower)
        :darkgoldenrod
    else
        :black
    end

    # 2. Flavour linestyle & marker
    if occursin("dogleg", name_lower) || occursin("trustregion", name_lower) || occursin("trust_region", name_lower) || occursin("tron", name_lower)
        linestyle = :dash
        marker = :square
    elseif occursin("gaussnewton", name_lower) || occursin("gauss_newton", name_lower)
        linestyle = :dot
        marker = :diamond
    else
        linestyle = :solid
        marker = :circle
    end

    return color, linestyle, marker
end

"""
    plot_optimizer_scaling(res::ProblemScalingBenchmarkResult; outdir=DEFAULT_PLOTS_DIR) -> String

Generates a log-log scaling plot of optimizer execution time vs problem size.
Saves the plot as a PNG image in `outdir` and returns the file path.
"""
function plot_optimizer_scaling(res::ProblemScalingBenchmarkResult; outdir=DEFAULT_PLOTS_DIR)
    mkpath(outdir)
    slug = problem_slug(res.problem)
    filepath = joinpath(outdir, "$(slug)_optimizers.png")

    sizes = [Float64(s) for s in res.sizes]

    # Collect distinct optimizer names from optimizer_results
    all_optimizers = String[]
    for s_res in res.size_results
        for opt_name in keys(s_res.optimizer_results)
            if !(opt_name in all_optimizers)
                push!(all_optimizers, opt_name)
            end
        end
    end

    # Rank optimizers according to their mean rank per size (slowest at top, fastest at bottom)
    get_opt_time(opt_name, j) = begin
        s_res = res.size_results[j]
        opt_r = get(s_res.optimizer_results, opt_name, nothing)
        if opt_r !== nothing && opt_r.converged && !isnan(opt_r.time_ns) && opt_r.time_ns > 0
            return opt_r.time_ns
        else
            return Inf
        end
    end
    opt_mean_ranks = compute_mean_ranks(all_optimizers, sizes, get_opt_time)
    sort!(all_optimizers, by = o -> (opt_mean_ranks[o], o), rev = true)

    is_small_sizes = maximum(sizes) <= 32
    plot_kwargs = if is_small_sizes
        if minimum(sizes) >= 2 || occursin("so(", lowercase(res.problem)) || occursin("procrustes", lowercase(res.problem))
            (xticks = ([2, 4, 8, 16, 32], ["2", "4", "8", "16", "32"]), xlims = (1.8, 36.0))
        else
            (xticks = ([1, 2, 4, 8, 16, 32], ["1", "2", "4", "8", "16", "32"]), xlims = (0.85, 36.0))
        end
    else
        NamedTuple()
    end

    p = plot(
        title = "$(res.problem): Optimizer Convergence Scaling",
        xlabel = res.size_metric_name * " (log scale)",
        ylabel = "Runtime (ms, log scale)",
        xscale = :log10,
        yscale = :log10,
        legend = :topleft,
        grid = true,
        size = (850, 550),
        dpi = 150;
        plot_kwargs...
    )

    plotted_count = 0
    for opt_name in all_optimizers
        run_times = Float64[]

        for (j, s_res) in enumerate(res.size_results)
            opt_r = get(s_res.optimizer_results, opt_name, nothing)
            # Only show times for optimizers that actually converged based on convergence criteria;
            # points that did not converge are missing (set to NaN).
            if opt_r !== nothing && opt_r.converged && !isnan(opt_r.time_ns) && opt_r.time_ns > 0
                # convert ns to milliseconds
                push!(run_times, opt_r.time_ns / 1e6)
            else
                push!(run_times, NaN)
            end
        end

        if any(!isnan, run_times)
            plotted_count += 1
            c_color, l_style, m_shape = optimizer_style(opt_name)
            m_size = m_shape === :star5 ? 7 : 5
            plot!(
                p, sizes, run_times,
                label = opt_name,
                color = c_color,
                linestyle = l_style,
                markershape = m_shape,
                markerstrokecolor = c_color,
                markersize = m_size,
                linewidth = 2.0
            )
        end
    end

    if plotted_count == 0
        plot!(p, [sizes[1]], [NaN], label="(no converged solvers)", ylims=(0.01, 1000.0))
    end

    savefig(p, filepath)
    return filepath
end

"""
    generate_all_plots(results::Vector{ProblemScalingBenchmarkResult}; outdir=DEFAULT_PLOTS_DIR) -> Dict{String, Tuple{String, String}}

Generates both model and optimizer log-log scaling plots for all benchmarked problems.
"""
function generate_all_plots(results::Vector{ProblemScalingBenchmarkResult}; outdir=DEFAULT_PLOTS_DIR)
    paths = Dict{String, Tuple{String, String}}()
    for res in results
        m_path = plot_model_scaling(res; outdir=outdir)
        o_path = plot_optimizer_scaling(res; outdir=outdir)
        paths[res.problem] = (m_path, o_path)
    end
    return paths
end
