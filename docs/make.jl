using Documenter
using SmoothOptimizerBenchmark

makedocs(
    root = @__DIR__,
    sitename = "SmoothOptimizerBenchmark.jl",
    authors = "Oliver Woodford",
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        sidebar_sitename = true,
        canonical = "https://ojwoodford.github.io/SmoothOptimizerBenchmark.jl"
    ),
    modules = [SmoothOptimizerBenchmark],
    warnonly = true,
    pages = [
        "Overview & Summary" => "index.md",
        "Package Features" => "features.md",
        "Problem Benchmarks" => [
            "Sparse Multi-dimensional Rosenbrock" => "problems/rosenbrock_sparse.md",
            "Exponential Curve Fitting" => "problems/curve_fitting.md",
            "Robust Exponential Curve Fitting" => "problems/curve_fitting_robust.md",
            "Ill-Conditioned Polynomial Fitting" => "problems/polynomial_fitting.md",
            "Dense Multi-dimensional Rosenbrock" => "problems/rosenbrock_dense.md",
            "Multilateration" => "problems/multilateration.md",
            "Dense Affine Alignment" => "problems/affine_alignment.md",
            "Nonlinear 3D Pose Chain" => "problems/pose_chain.md",
            "1D ODE Boundary Value Problem" => "problems/ode_bvp.md",
            "Sparse Bundle Adjustment" => "problems/bundle_adjustment.md",
            "Robust Procrustes on SO(d)" => "problems/robust_procrustes.md"
        ],
        "API Reference" => "api.md"
    ]
)
