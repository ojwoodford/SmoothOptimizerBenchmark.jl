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
        r_lm = only(filter(o -> o.name == "SecondOrderOptimization", prob.compatible_optimizers)).optimize(m_nlls)
        @test r_lm.status === :ok
        # Step 20: every row on the fudged model, pinned to what step 13 measured: :ok at the native LM cost, or the
        # measured failure (a stop without convergence, at the same minimum)
        # Measured on Julia 1.10 and 1.13 alike, with EXP_OUTLIER_SEED = 4245
        measured_failures = n == 64 ? ("NonlinearSolve (TrustRegion, fudged)",) :
            ("JSOSolvers (trunk)", "JSOSolvers (tron)", "NonlinearSolve (TrustRegion, fudged)")
        for o in filter(o -> o.name != "SecondOrderOptimization", prob.compatible_optimizers)   # all but the native row
            m_sa.reset!()
            r = o.optimize(m_sa)
            if o.name in measured_failures
                @test r.status === :not_converged
            elseif o.name == "MadNLP"
                # MadNLP ends at the minimum, and whether it then reports SOLVE_SUCCEEDED or
                # SEARCH_DIRECTION_BECOMES_TOO_SMALL depends on rounding that changes with what ran earlier in the
                # process (measured on Julia 1.10 at 1024 points, and at 64 once the fudged Jacobian came from
                # autodiff, DM4): pinned on cost, either status (maintainer, 2026-11-17; both sizes 2026-11-19)
                @test r.status in (:ok, :not_converged)
                @test r.final_cost ≈ r_lm.final_cost rtol=1e-6
            else
                @test r.status === :ok
                @test r.final_cost ≈ r_lm.final_cost rtol=1e-6
            end
        end
        m_sa.reset!()

        # IND3c: the rows whose package's native model is JuMP, on the model they are paired with, JuMP (fudged): ok at
        # the native LM cost, or the measured failure at 1024 points (trunk ends on not_desc, tron on small_step, at the
        # same minimum). Measured on Julia 1.10 and 1.13 alike, 2026-11-19
        m_jump = only(filter(m -> m.name == "JuMP (fudged)", models))
        jump_failures = n == 64 ? () : ("JSOSolvers (trunk)", "JSOSolvers (tron)")
        jump_rows = filter(o -> SmoothOptimizerBenchmark.resolve_optimizer_model(o, models) === m_jump, prob.compatible_optimizers)
        @test sort([o.name for o in jump_rows]) == ["CaNNOLeS (fudged)", "Ipopt", "JSOSolvers (tron)", "JSOSolvers (trunk)", "MadNLP"]
        for o in jump_rows
            m_jump.reset!()
            r = o.optimize(m_jump)
            @test r.status === (o.name in jump_failures ? :not_converged : :ok)
            @test r.final_cost ≈ r_lm.final_cost rtol=1e-6
        end
        m_jump.reset!()
    end
end
