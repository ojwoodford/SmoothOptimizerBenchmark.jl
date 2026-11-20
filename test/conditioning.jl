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
    (problem = "Dense Multi-dimensional Rosenbrock", sizes = Any[2, 8, 32],
     cond_max = WELL_CONDITIONED_MAX, growth_max = CONDITIONING_GROWTH_MAX, spread_max = ITERATION_SPREAD_MAX, nullity = 0, note = ""),
    # Exceptions: CN7 was reverted (its design's cond(J) grew 2.3-fold from n = 8 to 32), so the problem is as before:
    # cond(J) 32, 28, 125 at n = 2, 8, 32 (measured 2026-11-20)
    (problem = "Dense Affine Alignment", sizes = Any[2, 8, 32],
     cond_max = WELL_CONDITIONED_MAX, growth_max = 6, spread_max = ITERATION_SPREAD_MAX, nullity = 0,
     note = "exception: cond(J) grows 4.5-fold from n = 8 to 32 (CN7 reverted)"),
    # CN8 was reverted (its design's iterations were 9, 6, 5 at d = 3, 8, 20), so the problem is as before: cond(J) of the
    # weighted Jacobian 2.5, 273, 710 and 26, 12, 12 iterations at d = 3, 8, 20 (measured 2026-11-20)
    (problem = "Robust Procrustes on SO(d)", sizes = Any[3, 8, 20],
     cond_max = WELL_CONDITIONED_MAX, growth_max = 3, spread_max = 16, nullity = 0,
     note = "exception: cond(J) grows 2.6-fold from d = 8 to 20, and the iterations fall from 26 at d = 3 to 12 (CN8 reverted)"),
    # Measured without its 7 gauge directions (rigid motion and scale); 4 cameras give each point 4 views, the others 8 or more
    (problem = "Sparse Bundle Adjustment", sizes = Any[4, 16, 32],
     cond_max = WELL_CONDITIONED_MAX, growth_max = CONDITIONING_GROWTH_MAX, spread_max = 3, nullity = 7,
     note = "the iteration spread may be 3 (CN9): 4 cameras have 4 views of each point"),
]

# Polynomial fitting, the one ill-conditioned size sweep (decision 3): cond(J) at the solution is within this fraction of
# POLYFIT_TARGET_COND at every size. A starting value (rules.md 26)
const POLYFIT_COND_RTOL = 0.01
# The conditioning sweeps (CN11, CN12): cond(J) at the stated solution is within this factor of the nominal κ, at every
# value of the sweep. A starting value (rules.md 26)
const SWEEP_COND_FACTOR = 1.3
const SWEEP_TABLE = [
    (problem = "Dense Conditioning Sweep", values = :all),
    # Here at three values; all fifteen are within the factor too (CN12, a scratch run)
    (problem = "Sparse Conditioning Sweep", values = Any[1e1, 1e4, 1e8]),
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
    @testset "Ill-Conditioned Polynomial Fitting" begin
        prob = byname["Ill-Conditioned Polynomial Fitting"]
        for n in prob.default_sizes
            x, _, _ = solution_point(prob, n)
            κ = jacobian_condition(solution_jacobian(prob, n; point=x))
            @test abs(κ / SmoothOptimizerBenchmark.POLYFIT_TARGET_COND - 1) <= POLYFIT_COND_RTOL
        end
    end
    for e in SWEEP_TABLE
        @testset "$(e.problem)" begin
            prob = byname[e.problem]
            for κ in (e.values === :all ? prob.default_sizes : e.values)
                x = prob.reference_solution(κ)
                @test x !== nothing
                c = jacobian_condition(solution_jacobian(prob, κ; point=x))
                @test κ / SWEEP_COND_FACTOR <= c <= κ * SWEEP_COND_FACTOR
            end
        end
    end
end
