using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# IND5: each criterion an adapter is now given can be the one that stops it, on a small problem
@testset "Stopping criteria: each one given can stop the run (IND5)" begin
    SB = SmoothOptimizerBenchmark
    row(prob, name) = only(filter(o -> o.name == name, prob.compatible_optimizers))

    # Ipopt, on curve fitting's JuMP model at 64 points: the gradient (its optimality test), the relative cost change
    # (its acceptable test) and the step (tiny_step_tol), each with the other two made unreachable. The acceptable and
    # tiny-step stops count as converged
    cf = create_curve_fitting_problem()
    cf_models = cf.generate_models(64)
    jm = only(filter(m -> m.name == "JuMP", cf_models))
    ipopt = row(cf, "Ipopt")
    @test SB.resolve_optimizer_model(ipopt, cf_models) === jm
    r_g = ipopt.optimize(jm; gtol=1e-8, xtol=1e-30, ftol=1e-30)
    @test r_g.message == "first_order" && r_g.status === :ok
    r_f = ipopt.optimize(jm; gtol=1e-30, xtol=1e-30, ftol=1e-8)
    @test r_f.message == "acceptable" && r_f.status === :ok
    # (with the acceptable test switched off: once the iterate stops moving the objective stops changing exactly, and
    # that test fires first even at ftol = 1e-30)
    r_x = ipopt.optimize(jm; gtol=1e-30, xtol=1e-2, ftol=1e-30, acceptable_iter=0)
    @test r_x.message == "small_step" && r_x.status === :ok
    @test r_f.final_cost ≈ r_g.final_cost rtol=1e-6
    @test r_x.final_cost ≈ r_g.final_cost rtol=1e-6

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
