using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# IND5: each criterion an adapter is now given can be the one that stops it, on a small problem
@testset "Stopping criteria: each one given can stop the run (IND5)" begin
    SB = SmoothOptimizerBenchmark
    row(prob, name) = only(filter(o -> o.name == name, prob.compatible_optimizers))

    # Ipopt, on curve fitting's JuMP model at 64 points: the gradient (its optimality test) and the step (tiny_step_tol),
    # each with the other made unreachable. It is given no cost-change criterion: its acceptable test is off, so ftol
    # stops nothing (2026-11-20). The tiny-step stop counts as converged
    cf = create_curve_fitting_problem()
    cf_models = cf.generate_models(64)
    jm = only(filter(m -> m.name == "JuMP", cf_models))
    ipopt = row(cf, "Ipopt")
    @test SB.resolve_optimizer_model(ipopt, cf_models) === jm
    r_g = ipopt.optimize(jm; gtol=1e-8, xtol=1e-30, ftol=1e-30)
    @test r_g.message == "first_order" && r_g.status === :ok
    # ftol has no effect: a loose and an unreachable one give the same run (with gtol unreachable, Ipopt may still end
    # "acceptable", its fallback when it fails near an acceptable point, which is not the cost-change test)
    r_f = ipopt.optimize(jm; gtol=1e-30, xtol=1e-30, ftol=1e-1, maxiters=50)
    r_f0 = ipopt.optimize(jm; gtol=1e-30, xtol=1e-30, ftol=1e-30, maxiters=50)
    @test (r_f.iterations, r_f.message) == (r_f0.iterations, r_f0.message)
    @test r_f.iterations > 3
    r_x = ipopt.optimize(jm; gtol=1e-30, xtol=1e-2, ftol=1e-30)
    @test r_x.message == "small_step" && r_x.status === :ok
    @test r_x.final_cost ≈ r_g.final_cost rtol=1e-6

    # JSOSolvers (tron), on affine alignment's zero-residual data at n = 2: a small-residual stop needs its gradient test
    # as well, and counts as converged (it ends with it on Julia 1.13 and on first_order on 1.10, at a cost below 1e-16)
    @test SB.stats_result(0, (@timed nothing), 1, 1.0, 0.0, :small_residual; converged_statuses=SB.JSO_CONVERGED).converged
    aa = create_affine_alignment_problem()
    aa_models = aa.generate_models(2)
    tron = row(aa, "JSOSolvers (tron)")
    r_t = tron.optimize(SB.resolve_optimizer_model(tron, aa_models))
    @test Symbol(r_t.message) in SB.JSO_CONVERGED && r_t.converged && r_t.final_cost < 1e-16

    # Manopt, on robust Procrustes at d = 3: the gradient and the step (it is given no cost-change criterion: see the
    # Manopt row in robust_procrustes.jl)
    pr = create_robust_procrustes_problem()
    pr_models = pr.generate_models(3)
    manopt = row(pr, "Manopt (LevenbergMarquardt)")
    m_man = SB.resolve_optimizer_model(manopt, pr_models)
    stops(; kwargs...) = (m_man.reset!(); manopt.optimize(m_man; kwargs...))
    @test occursin("StopWhenGradientNormLess", stops(; gtol=1e-3, xtol=1e-30).message)
    @test occursin("StopWhenChangeLess", stops(; gtol=1e-30, xtol=1e-2).message)

    # NonlinearSolve is given none of the three (it has no gradient or cost-change test, and its step test shares its
    # residual tolerance): it runs on its own defaults, so on the zero-residual ODE BVP its residual test stops it at
    # NonlinearSolve's default absolute tolerance, 3e-13 on the residual norm, far below the 1e-8 it was given before
    ode = create_ode_bvp_problem()
    ode_models = ode.generate_models(32)
    nls_tr = row(ode, "NonlinearSolve (TrustRegion)")
    r_n = nls_tr.optimize(SB.resolve_optimizer_model(nls_tr, ode_models))
    @test r_n.message == "Success" && r_n.status === :ok
    @test sqrt(2 * r_n.final_cost) <= 3.0e-13
end
