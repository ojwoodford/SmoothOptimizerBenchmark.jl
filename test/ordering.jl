using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# IND8: models and optimizers are listed alphabetically by displayed name, ignoring case, in the code and the docs
@testset "Alphabetical order of models and optimizers (IND8)" begin
    SB = SmoothOptimizerBenchmark
    sorted(names) = issorted(names; by=lowercase)
    @test sorted([o.name for o in get_standard_optimizers(SB.CURVE_FITTING_SOO)])
    for p in problems
        @test sorted([o.name for o in p.compatible_optimizers])
        @test sorted([m.name for m in p.generate_models(first(p.default_sizes))])
    end
    @test sorted(collect(first.(SB.NATIVE_MODELS)))
    @test sorted(collect(first.(SB.MODEL_COLORS)))
    @test sorted(collect(first.(SB.OPTIMIZER_COLORS)))
    @test sorted(collect(SB.RECORDED_DEPENDENCIES))
    # The package lists of the README and of the index's generator
    root = normpath(joinpath(@__DIR__, ".."))
    listed(file, pattern) = [m[1] for m in eachmatch(pattern, read(joinpath(root, file), String))]
    readme = listed("README.md", r"\n- \*\*([A-Za-z]+)\.jl\*\*")
    @test length(readme) == 10 && sorted(readme)
    index = listed(joinpath("scripts", "generate_docs_content.jl"), r"\n- \*\*`([A-Za-z]+)\.jl`\*\*")
    @test length(index) == 9 && sorted(index)
end
