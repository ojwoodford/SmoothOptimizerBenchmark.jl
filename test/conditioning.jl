using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")
isdefined(@__MODULE__, :solution_point) || include("conditioning_helpers.jl")

# One trait per problem (`improvements.md` item 30): every size-sweep problem is well conditioned at every size checked
# and its conditioning does not grow with size, and the SecondOrderOptimization row's iteration count is about the same
# at every size. cond(J) is measured at the solution: the point the SecondOrderOptimization row stops at, or the
# problem's stated solution. Starting values, not measured thresholds (rules.md 26)
const WELL_CONDITIONED_MAX = 1e3      # cond(J) at each size checked
const CONDITIONING_GROWTH_MAX = 2     # cond(J) at the largest size checked over cond(J) at the middle one
const ITERATION_SPREAD_MAX = 2        # the SecondOrderOptimization row's iterations, largest minus smallest

# The problems: their sizes checked (the smallest, a middle one, and the largest whose Jacobian can be decomposed densely
# here) and the bounds they meet. An entry whose bound differs from the constants above is an exception, with its reason
const CONDITIONING_TABLE = [
    (problem = "Exponential Curve Fitting", sizes = Any[64, 1024, 65536],
     cond_max = WELL_CONDITIONED_MAX, growth_max = CONDITIONING_GROWTH_MAX, spread_max = ITERATION_SPREAD_MAX, nullity = 0, note = ""),
    (problem = "Robust Exponential Curve Fitting", sizes = Any[64, 1024, 65536],
     cond_max = WELL_CONDITIONED_MAX, growth_max = CONDITIONING_GROWTH_MAX, spread_max = ITERATION_SPREAD_MAX, nullity = 0, note = ""),
    (problem = "Sparse Multi-dimensional Rosenbrock", sizes = Any[100, 500, 1000],
     cond_max = WELL_CONDITIONED_MAX, growth_max = CONDITIONING_GROWTH_MAX, spread_max = ITERATION_SPREAD_MAX, nullity = 0, note = ""),
    (problem = "Multilateration", sizes = Any[2, 7, 16],
     cond_max = WELL_CONDITIONED_MAX, growth_max = CONDITIONING_GROWTH_MAX, spread_max = ITERATION_SPREAD_MAX, nullity = 0, note = ""),
    (problem = "1D ODE Boundary Value Problem", sizes = Any[32, 256, 2048],
     cond_max = WELL_CONDITIONED_MAX, growth_max = CONDITIONING_GROWTH_MAX, spread_max = ITERATION_SPREAD_MAX, nullity = 0, note = ""),
    (problem = "Nonlinear 3D Pose Chain", sizes = Any[50, 200, 400],
     cond_max = WELL_CONDITIONED_MAX, growth_max = CONDITIONING_GROWTH_MAX, spread_max = ITERATION_SPREAD_MAX, nullity = 0, note = ""),
]

@testset "One trait per problem: conditioning and iterations across sizes (CN13)" begin
    byname = Dict(p.name => p for p in problems)
    for e in CONDITIONING_TABLE
        @testset "$(e.problem)" begin
            prob = byname[e.problem]
            @test all(in(prob.default_sizes), e.sizes)
            conds, iters = Float64[], Int[]
            for sz in e.sizes
                x, it, st = solution_point(prob, sz)
                @test st === :ok
                s = jacobian_singular_values(solution_jacobian(prob, sz; point=x))
                if e.nullity > 0
                    # The dropped singular values are the gauge's: below 1e-8 of the largest, and the next one is not
                    @test s[end - e.nullity + 1] < 1e-8 * s[1] <= s[end - e.nullity]
                end
                push!(conds, s[1] / s[end - e.nullity])
                push!(iters, it)
            end
            @test all(<=(e.cond_max), conds)
            @test conds[end] <= e.growth_max * conds[2]
            @test maximum(iters) - minimum(iters) <= e.spread_max
        end
    end
end
