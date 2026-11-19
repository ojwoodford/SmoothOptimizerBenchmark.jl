using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# The problems with a JuMP model (IND3) and its name
const JUMP_MODEL_NAMES = Dict(
    "Exponential Curve Fitting" => "JuMP",
    "Robust Exponential Curve Fitting" => "JuMP (fudged)",
    "Ill-Conditioned Polynomial Fitting" => "JuMP",
    "Multilateration" => "JuMP",
    "1D ODE Boundary Value Problem" => "JuMP",
    "Dense Multi-dimensional Rosenbrock" => "JuMP",
    "Sparse Multi-dimensional Rosenbrock" => "JuMP",
)

jm_rel(a, b) = SmoothOptimizerBenchmark.norm(a - b) / max(SmoothOptimizerBenchmark.norm(b), floatmin())

@testset "The JuMP models agree with the Standalone models (IND3)" begin
    NLP = SmoothOptimizerBenchmark.NLPModels
    for p in problems
        haskey(JUMP_MODEL_NAMES, p.name) || continue
        for sz in p.default_sizes[1:2]
            models = p.generate_models(sz)
            jm = only(filter(m -> m.name == JUMP_MODEL_NAMES[p.name], models))
            sa = get_standard_optimizer_model(models)
            # The JuMP model's variables are in the Standalone model's order: its start is the Standalone start, and a
            # point it hands back needs no conversion
            @test jm.to_point === identity
            x0 = copy(sa.model.x)
            @test jm.model.meta.x0 == x0
            r = zeros(length(sa.model.y))
            J = copy(sa.model.J)
            g = zeros(length(x0))
            for x in (x0, x0 .+ 0.1 .* randn(SmoothOptimizerBenchmark.MersenneTwister(11), length(x0)))
                sa.model.f!(r, x)
                sa.model.g!(J, x)
                # Cost and gradient (through NLPModels.grad!) to 1e-10 relative
                @test jm_rel(NLP.obj(jm.model, x), 0.5 * sum(abs2, r)) <= 1e-10
                @test jm_rel(NLP.grad!(jm.model, x, g), J' * r) <= 1e-10
            end
            jm.reset!()
            @test jm.model.meta.x0 == x0
        end
    end
end
