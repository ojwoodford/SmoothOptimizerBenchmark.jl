using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Multilateration (P1)" begin
    norm = SmoothOptimizerBenchmark.norm
    prob = create_multilateration_problem()
    @test problem_slug(prob.name) == "multilateration"
    @test prob.default_sizes == Any[2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 16]
    # Data: deterministic, 4d anchors at radius 4, the true point on the unit sphere
    for d in (2, 7, 16)
        data = SmoothOptimizerBenchmark.multilateration_data(d)
        @test data == SmoothOptimizerBenchmark.multilateration_data(d)
        @test size(data.anchors) == (d, 4d)
        @test length(data.ranges) == 4d
        @test all(a -> norm(a) ≈ 4, eachcol(data.anchors))
        @test norm(data.xtrue) ≈ 1
        @test data.x0 == zeros(d)
    end
    # The SecondOrderOptimization row (IND4: Levenberg–Marquardt on the normal equations), and its iterator on the
    # Jacobian path, called directly (the "LM, tall" row is gone)
    lm = only(filter(o -> o.name == "SecondOrderOptimization", prob.compatible_optimizers))
    tall = (m; kwargs...) -> optimize_soo(m; method=:lm, formulation=:jacobian, kwargs...)
    for d in (2, 5, 16)
        data = SmoothOptimizerBenchmark.multilateration_data(d)
        models = prob.generate_models(d)
        m_nlls = only(filter(m -> m.name == "NLLSModel (Static)", models))
        m_sa = only(filter(m -> m.name == "Standalone", models))
        # The two models agree on the start cost, and the analytic Jacobian matches central differences
        @test m_nlls.eval_cost() ≈ m_sa.eval_cost() rtol=1e-12
        lsp = m_sa.model
        J = zeros(4d, d)
        lsp.g!(J, data.x0)
        J_fd = zeros(4d, d)
        r_p, r_m = zeros(4d), zeros(4d)
        h = 1e-6
        for k in 1:d
            e = zeros(d); e[k] = h
            lsp.f!(r_p, data.x0 + e)
            lsp.f!(r_m, data.x0 - e)
            J_fd[:, k] = (r_p - r_m) / 2h
        end
        @test J ≈ J_fd rtol=1e-8
        # Routing: the SecondOrderOptimization row runs Model 1
        target = get_standard_optimizer_model(models)
        @test target === m_sa
        @test SmoothOptimizerBenchmark.resolve_optimizer_model(lm, models) === m_nlls
        # The formulations agree on cost (rules.md 31), and each solution is near the true point
        x_nlls, x_sa, x_tall = Float64[], Float64[], Float64[]
        r_nlls = lm.optimize(m_nlls; solution=x_nlls)
        r_sa = lm.optimize(m_sa; solution=x_sa)
        r_tall = tall(m_nlls; solution=x_tall)
        @test r_nlls.status === :ok && r_sa.status === :ok && r_tall.status === :ok
        @test r_sa.final_cost ≈ r_nlls.final_cost rtol=1e-8
        @test r_tall.final_cost ≈ r_nlls.final_cost rtol=1e-8
        for x in (x_nlls, x_sa, x_tall)
            @test norm(x - data.xtrue) < 0.05
        end
    end
end
