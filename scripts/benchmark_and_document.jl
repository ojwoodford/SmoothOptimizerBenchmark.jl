# Script to run multi-size scaling benchmarks, save results, generate plots, and build docs
using SmoothOptimizerBenchmark
using Printf
using Dates

println("================================================================================")
println("Running SmoothOptimizerBenchmark Scaling Suite across >=10 sizes per problem...")
println("================================================================================")

data_dir = DEFAULT_DATA_DIR
plots_dir = DEFAULT_PLOTS_DIR
mkpath(data_dir)
mkpath(plots_dir)

# Run scaling benchmarks (streams live markdown directly to docs/src/data/<slug>.md)
t_start = time()
results = run_all_scaling_benchmarks(data_dir=data_dir)
t_elapsed = time() - t_start
println(@sprintf("\n✓ All scaling benchmarks completed in %.1f seconds.", t_elapsed))
println("✓ Benchmark streaming Markdown files saved to: $data_dir")

# Generate log-log scaling plots
println("\nGenerating log-log scaling plots...")
generate_all_plots(results; outdir=plots_dir)
println("✓ Generated model and optimizer log-log plots in: $plots_dir")

# Generate Documenter markdown pages
println("\nGenerating documentation markdown pages...")
include(joinpath(@__DIR__, "generate_docs_content.jl"))
docs_src_dir = joinpath(@__DIR__, "..", "docs", "src")
generate_docs_markdown(results; docs_dir=docs_src_dir)
println("✓ Generated Documenter pages in: $docs_src_dir")

# Re-build HTML docs using the docs project environment
println("\nBuilding HTML documentation with Documenter...")
try
    docs_dir = joinpath(@__DIR__, "..", "docs")
    docs_make = joinpath(docs_dir, "make.jl")
    run(`$(Base.julia_cmd()) --startup-file=no --project=$docs_dir $docs_make`)
    println("✓ HTML documentation successfully built into docs/build/")
catch err
    @warn "Failed to build HTML documentation" exception=err
end

println("\n✓ Benchmark and documentation asset pipeline finished.")
