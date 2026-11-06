# Script to run multi-size scaling benchmarks, save results, generate plots, and build docs
using SmoothOptimizerBenchmark
using Printf
using Dates

println("================================================================================")
println("Running SmoothOptimizerBenchmark Scaling Suite across >=10 sizes per problem...")
println("================================================================================")

data_file = joinpath(@__DIR__, "..", "data", "benchmark_results.json")
plots_dir = joinpath(@__DIR__, "..", "docs", "src", "assets", "plots")
mkpath(dirname(data_file))
mkpath(plots_dir)

# Run scaling benchmarks
t_start = time()
results = run_all_scaling_benchmarks(verbose=true)
t_elapsed = time() - t_start
println(@sprintf("\n✓ All scaling benchmarks completed in %.1f seconds.", t_elapsed))

# Save results to JSON
save_benchmark_results(results, data_file)
println("✓ Benchmark data saved to: $data_file")

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

# Optional: re-build HTML docs if Documenter is available
try
    import Documenter
    println("\nBuilding HTML documentation with Documenter...")
    include(joinpath(@__DIR__, "..", "docs", "make.jl"))
    println("✓ HTML documentation successfully built into docs/build/")
catch
    println("Note: Documenter is in the 'docs' environment. Run 'julia --project=docs docs/make.jl' to build HTML.")
end

println("\n✓ Benchmark and documentation asset pipeline finished.")
