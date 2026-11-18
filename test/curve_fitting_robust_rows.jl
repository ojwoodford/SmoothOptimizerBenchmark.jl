using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# P2 step 20, moved here from curve_fitting_robust.jl (ET4): it runs every optimizer on the fudged model, so it is in the
# integration group, where each third-party adapter is first compiled
@testset "Robust exponential curve fitting: every row on the fudged model (P2)" begin
    prob = create_robust_curve_fitting_problem()
    for n in (64, 1024)
        models = prob.generate_models(n)
        m_nlls = only(filter(m -> m.name == "NLLSModel (Static)", models))
        m_sa = only(filter(m -> m.name == "Standalone (fudged)", models))
        r_lm = only(filter(o -> o.name == "SecondOrderOptimization (LM)", prob.compatible_optimizers)).optimize(m_nlls)
        @test r_lm.status === :ok
        # Step 20: every row on the fudged model, pinned to what step 13 measured: :ok at the native LM cost, or the
        # measured failure (a stop without convergence, at the same minimum)
        # Measured on Julia 1.10 and 1.13 alike, with EXP_OUTLIER_SEED = 4245
        measured_failures = n == 64 ? ("NonlinearSolve (TrustRegion, fudged)",) :
            ("JSOSolvers (trunk)", "JSOSolvers (tron)", "NonlinearSolve (TrustRegion, fudged)")
        for o in prob.compatible_optimizers[4:end]
            m_sa.reset!()
            r = o.optimize(m_sa)
            if o.name in measured_failures
                @test r.status === :not_converged
            elseif n == 1024 && o.name == "MadNLP"
                # MadNLP ends at the minimum in 14 iterations, and whether it then reports SOLVE_SUCCEEDED or
                # SEARCH_DIRECTION_BECOMES_TOO_SMALL depends on rounding that changes with what ran earlier in the
                # process (measured on Julia 1.10): pinned on cost, either status (maintainer, 2026-11-17)
                @test r.status in (:ok, :not_converged)
                @test r.final_cost ≈ r_lm.final_cost rtol=1e-6
            else
                @test r.status === :ok
                @test r.final_cost ≈ r_lm.final_cost rtol=1e-6
            end
        end
        m_sa.reset!()
    end
end
