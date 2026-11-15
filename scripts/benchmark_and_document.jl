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

# The resolved environment of this run (Manifest.toml is not committed), next to the results
using Pkg
open(joinpath(data_dir, "environment.txt"), "w") do io
    println(io, "Julia $(VERSION), started with -t $(Threads.nthreads())")
    Pkg.status(; mode=Pkg.PKGMODE_MANIFEST, io)
end

# Run scaling benchmarks (streams live markdown directly to docs/src/data/<slug>.md): threaded, at the thread
# counts Julia was started with, then single-threaded (NLLSModel and BLAS on one thread) into its own folder
t_start = time()
results = run_all_scaling_benchmarks(data_dir=data_dir)
t_elapsed = time() - t_start
println(@sprintf("\n✓ Threaded scaling benchmarks completed in %.1f seconds.", t_elapsed))
println("✓ Benchmark streaming Markdown files saved to: $data_dir")

mkpath(SINGLE_THREADED_DATA_DIR)
t_start = time()
results_1t = run_all_scaling_benchmarks(data_dir=SINGLE_THREADED_DATA_DIR, numthreads=1, blas_threads=1)
t_elapsed = time() - t_start
println(@sprintf("\n✓ Single-threaded scaling benchmarks completed in %.1f seconds.", t_elapsed))
println("✓ Benchmark streaming Markdown files saved to: $SINGLE_THREADED_DATA_DIR")

# Generate log-log scaling plots
println("\nGenerating log-log scaling plots...")
generate_all_plots(results; outdir=plots_dir)
generate_all_plots(results_1t; outdir=SINGLE_THREADED_PLOTS_DIR, title_suffix=" (1 thread)")
println("✓ Generated model and optimizer log-log plots in: $plots_dir and $SINGLE_THREADED_PLOTS_DIR")

# Generate Documenter markdown pages
println("\nGenerating documentation markdown pages...")
include(joinpath(@__DIR__, "generate_docs_content.jl"))
docs_src_dir = joinpath(@__DIR__, "..", "docs", "src")
generate_docs_markdown(results; single_threaded=results_1t, docs_dir=docs_src_dir)
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
