using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "A Gauss-Newton row beside CaNNOLeS (IT2)" begin
    SOB = SmoothOptimizerBenchmark
    gn_name = "SecondOrderOptimization (Gauss-Newton)"
    has(p, name) = any(o -> o.name == name, p.compatible_optimizers)
    # On exactly the problems that have a CaNNOLeS row (robust curve fitting's is "CaNNOLeS (fudged)")
    @test [p.name for p in problems if has(p, gn_name)] == [p.name for p in problems if has(p, "CaNNOLeS") || has(p, "CaNNOLeS (fudged)")]
    @test count(p -> has(p, gn_name), problems) == 9
    @test SOB.optimizer_style(gn_name) == (:red, :dot, :diamond)
    @test SOB.optimizer_style(gn_name) != SOB.optimizer_style("SecondOrderOptimization (LM, fudged)")

    # At the two smallest sizes of each problem, through the harness (evaluated costs, IT4 statuses), the row is ok and
    # reaches the LM row's cost at the comparison tolerances; it runs on the LM row's model
    for prob in problems
        has(prob, gn_name) || continue
        gn = only(filter(o -> o.name == gn_name, prob.compatible_optimizers))
        lm = only(filter(o -> o.name == "SecondOrderOptimization (LM)", prob.compatible_optimizers))
        for sz in prob.default_sizes[1:2]
            models = prob.generate_models(sz)
            std = get_standard_optimizer_model(models, prob.category)
            @test SOB.resolve_optimizer_model(gn, std, models) === SOB.resolve_optimizer_model(lm, std, models)
            rows = run_optimizer_benchmarks([gn, lm], std; all_models=models, samples=1, reference=prob.reference_cost(sz))
            r_gn, r_lm = rows[gn_name], rows[lm.name]
            @test r_lm.status === :ok
            reached = r_gn.status === :ok && isapprox(r_gn.final_cost, r_lm.final_cost; rtol=1e-8, atol=SOB.DEFAULT_FTOL * r_lm.start_cost)
            if prob.name == create_bundle_adjustment_problem().name
                # Bundle adjustment's J is rank deficient at every point (nothing fixes the gauge), and whether the first
                # full Gauss–Newton step from the start succeeds depends on rounding: measured 2026-11-18, at 4 and 8
                # cameras it converges in 5 or 6 iterations, or fails on max_fails at the start cost, with the thread
                # count, the Julia version and what ran earlier in the process. Pinned on both outcomes
                failed = r_gn.status === :not_converged && occursin("max_fails", r_gn.message) && r_gn.final_cost ≈ r_gn.start_cost
                @test reached || failed
            elseif prob.name == create_affine_alignment_problem().name && sz == 1
                # At n = 1 each residual D[i, j] − |w_i − Y_j| is piecewise linear, with a kink where w_i = Y_j. Whether
                # the first full Gauss–Newton step lands on a kink (two residuals equal, their Jacobian rows opposite,
                # so Jᵀr ≈ 0 at a non-minimum and grad_tol fires) depends on rounding: measured 2026-11-19 on the
                # NLLSModel model (DM10), it converges on 1.13's data and stops on grad_tol at cost 1.27, which the
                # harness labels local_minimum, on 1.10's. Pinned on both outcomes (maintainer, 2026-11-19)
                kink = r_gn.status === :local_minimum && occursin("grad_tol", r_gn.message)
                @test reached || kink
            else
                @test reached
            end
        end
    end
end
