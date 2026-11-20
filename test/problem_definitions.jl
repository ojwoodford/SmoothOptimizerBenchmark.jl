using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Problem Definition & >=10 Problem Sizes" begin
    for prob in problems
        @test !isempty(prob.name)
        @test prob.category in (:small_dense, :medium_dense, :large_dense, :large_sparse, :manifold)
        @test length(prob.default_sizes) >= 10
        @test !isempty(prob.compatible_optimizers)
        @test any(opt -> occursin("secondorder", lowercase(opt.name)), prob.compatible_optimizers)
        @test !isempty(prob.size_metric_name)

        # Test model generation on smallest size
        sz = first(prob.default_sizes)
        models = prob.generate_models(sz)
        @test !isempty(models)

        for m in models
            @test !isempty(m.name)
            # Test cost evaluation
            c = m.eval_cost()
            @test c isa Real
            @test !isnan(c)

            # Test linear system / derivative evaluation
            c_ls, ls = m.eval_cost_and_linear_system()
            @test c_ls isa Real
            @test !isnan(c_ls)
            @test isapprox(c, c_ls; rtol=1e-10, atol=1e-12)

            # Test reset
            m.reset!()
        end
    end

    # DM1: each problem declares its derivative mode, the one in the specification's table
    expected_modes = Dict(
        "Exponential Curve Fitting" => :autodiff, "Robust Exponential Curve Fitting" => :autodiff,
        "1D ODE Boundary Value Problem" => :autodiff, "Dense Multi-dimensional Rosenbrock" => :autodiff,
        "Sparse Multi-dimensional Rosenbrock" => :autodiff, "Nonlinear 3D Pose Chain" => :autodiff,
        "Ill-Conditioned Polynomial Fitting" => :analytic, "Multilateration" => :analytic, "Dense Conditioning Sweep" => :analytic,
        "Dense Affine Alignment" => :analytic, "Robust Procrustes on SO(d)" => :analytic,
        "Sparse Bundle Adjustment" => :mixed)
    @test Set(p.name for p in problems) == Set(keys(expected_modes))
    for prob in problems
        @test prob.derivatives === expected_modes[prob.name]
    end
    @test SmoothOptimizerBenchmark.AUTODIFF_MAX_INPUTS == 8
    # An unknown mode is refused, by every constructor; the keyword has no default
    args = ("P", :small_dense, Any[1], n -> ModelDefinition[], OptimizerDefinition[])
    err = try ProblemDefinition(args..., "n", _ -> nothing; derivatives=:forward); nothing catch e; e end
    @test err isa ArgumentError && occursin(":autodiff, :analytic or :mixed", err.msg)
    @test_throws ArgumentError ProblemDefinition(args..., "n"; derivatives=:numeric)
    @test_throws ArgumentError ProblemDefinition(args...; derivatives=:numeric)
    @test_throws UndefKeywordError ProblemDefinition(args..., "n")
    @test ProblemDefinition(args..., "n"; derivatives=:analytic).derivatives === :analytic
    @test ProblemDefinition(args...; derivatives=:mixed).size_metric_name == "Size"
end
