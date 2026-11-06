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
    plot_model_scaling(res::ProblemScalingBenchmarkResult; outdir="docs/src/assets/plots") -> String

Generates a log-log scaling plot of model evaluation time vs problem size.
Saves the plot as a PNG image in `outdir` and returns the file path.
"""
function plot_model_scaling(res::ProblemScalingBenchmarkResult; outdir="docs/src/assets/plots")
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

    p = plot(
        title = "$(res.problem): Model Evaluation Scaling",
        xlabel = res.size_metric_name * " (log scale)",
        ylabel = "Evaluation Time (μs, log scale)",
        xscale = :log10,
        yscale = :log10,
        legend = :topleft,
        grid = true,
        size = (800, 500),
        dpi = 150
    )

    markers = [:circle, :square, :utriangle, :diamond, :hexagon, :star5]
    colors = [:blue, :red, :green, :purple, :orange, :teal]

    for (i, m_name) in enumerate(all_models)
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

        c_color = colors[mod1(i, length(colors))]
        m_shape = markers[mod1(i, length(markers))]

        if !isempty(valid_sizes)
            # Cost evaluation curve (dashed)
            plot!(
                p, valid_sizes, cost_times,
                label = "$(m_name) (Cost)",
                linestyle = :dash,
                color = c_color,
                markershape = m_shape,
                markerstrokecolor = c_color,
                markersize = 4,
                linewidth = 1.5
            )
            # Linear system assembly curve (solid)
            plot!(
                p, valid_sizes, linsys_times,
                label = "$(m_name) (Cost + Linsys)",
                linestyle = :solid,
                color = c_color,
                markershape = m_shape,
                markerstrokecolor = c_color,
                markersize = 5,
                linewidth = 2.0
            )
        end
    end

    savefig(p, filepath)
    return filepath
end

"""
    plot_optimizer_scaling(res::ProblemScalingBenchmarkResult; outdir="docs/src/assets/plots") -> String

Generates a log-log scaling plot of optimizer execution time vs problem size.
Saves the plot as a PNG image in `outdir` and returns the file path.
"""
function plot_optimizer_scaling(res::ProblemScalingBenchmarkResult; outdir="docs/src/assets/plots")
    mkpath(outdir)
    slug = problem_slug(res.problem)
    filepath = joinpath(outdir, "$(slug)_optimizers.png")

    sizes = [Float64(s) for s in res.sizes]

    # Collect distinct optimizer names across Tier 1 and Tier 2
    all_optimizers = String[]
    for s_res in res.size_results
        for opt_name in keys(s_res.tier2_optimizer_results)
            if !(opt_name in all_optimizers)
                push!(all_optimizers, opt_name)
            end
        end
        for opt_name in keys(s_res.tier1_optimizer_results)
            if !(opt_name in all_optimizers)
                push!(all_optimizers, opt_name)
            end
        end
    end

    p = plot(
        title = "$(res.problem): Optimizer Convergence Scaling",
        xlabel = res.size_metric_name * " (log scale)",
        ylabel = "Runtime (ms, log scale)",
        xscale = :log10,
        yscale = :log10,
        legend = :topleft,
        grid = true,
        size = (800, 500),
        dpi = 150
    )

    colors = [:blue, :dodgerblue, :red, :crimson, :green, :darkgreen, :purple, :darkmagenta, :darkorange]
    markers = [:circle, :diamond, :square, :cross, :utriangle, :dtriangle, :hexagon, :star6, :pentagon]

    for (i, opt_name) in enumerate(all_optimizers)
        run_times = Float64[]
        valid_sizes = Float64[]

        for (j, s_res) in enumerate(res.size_results)
            # Prefer tier2 if present, otherwise tier1
            opt_r = get(s_res.tier2_optimizer_results, opt_name, get(s_res.tier1_optimizer_results, opt_name, nothing))
            if opt_r !== nothing && !isnan(opt_r.time_ns) && opt_r.time_ns > 0
                push!(valid_sizes, sizes[j])
                # convert ns to milliseconds
                push!(run_times, opt_r.time_ns / 1e6)
            end
        end

        if !isempty(valid_sizes)
            c_color = colors[mod1(i, length(colors))]
            m_shape = markers[mod1(i, length(markers))]
            plot!(
                p, valid_sizes, run_times,
                label = opt_name,
                color = c_color,
                markershape = m_shape,
                markerstrokecolor = c_color,
                markersize = 5,
                linewidth = 2.0
            )
        end
    end

    savefig(p, filepath)
    return filepath
end

"""
    generate_all_plots(results::Vector{ProblemScalingBenchmarkResult}; outdir="docs/src/assets/plots") -> Dict{String, Tuple{String, String}}

Generates both model and optimizer log-log scaling plots for all benchmarked problems.
"""
function generate_all_plots(results::Vector{ProblemScalingBenchmarkResult}; outdir="docs/src/assets/plots")
    paths = Dict{String, Tuple{String, String}}()
    for res in results
        m_path = plot_model_scaling(res; outdir=outdir)
        o_path = plot_optimizer_scaling(res; outdir=outdir)
        paths[res.problem] = (m_path, o_path)
    end
    return paths
end
