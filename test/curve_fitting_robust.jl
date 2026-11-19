using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Robust exponential curve fitting (P2)" begin
    SB = SmoothOptimizerBenchmark
    norm = SB.norm
    prob = create_robust_curve_fitting_problem()
    resolve = SB.resolve_optimizer_model
    # Step 14: its own slug, before curve fitting's substring branch
    @test problem_slug("Exponential Curve Fitting") == "curve_fitting"
    @test problem_slug(prob.name) == "curve_fitting_robust"
    @test prob.default_sizes == create_curve_fitting_problem().default_sizes

    # Step 15: curve fitting's data with exactly round(Int, 0.3n) points moved up by +1
    for n in (64, 1000)
        t, y, outliers = SB.generate_exp_outlier_data(n)
        @test (t, y, outliers) == SB.generate_exp_outlier_data(n)
        t0, y0 = SB.generate_exp_data(n)
        @test t == t0
        moved = findall(y .!= y0)
        @test length(moved) == round(Int, 0.3n) && moved == outliers
        @test all(y[i] == y0[i] + 1.0 for i in moved)
    end

    # Step 16: the rewrite's identities. The central difference uses h = 1e-8: at the width (|r| = 0.05) r̃ is C¹ but
    # its second derivative jumps, so the difference's error is O(h), 5e-6 relative with h = 1e-6
    k = SB.exp_huber_kernel
    for r in (0.0, 0.01, -0.01, 0.05, -0.05, 0.2, -0.2, 1.0, -1.0)
        rt = SB.fudged_residual(k, r)
        @test 0.5 * rt^2 ≈ 0.5 * SB.robustify(k, r^2) rtol=1e-14
        h = 1e-8
        cd = (SB.fudged_residual(k, r + h) - SB.fudged_residual(k, r - h)) / 2h
        scale = SB.fudged_scale(k, r)
        @test isfinite(scale)
        @test scale ≈ cd rtol=1e-6
        abs(r) <= SB.EXP_HUBER_WIDTH && @test scale == 1
    end

    # Rows (step 9): the four native rows (IT2 added Gauss-Newton), the control row, then the others, the residual-only
    # packages' renamed
    names = [o.name for o in prob.compatible_optimizers]
    @test names[1:5] == ["SecondOrderOptimization (Dogleg)", "SecondOrderOptimization (LM)", "SecondOrderOptimization (Gauss-Newton)",
        "SecondOrderOptimization (LM, tall)", "SecondOrderOptimization (LM, fudged)"]
    @test names[6:end] == ["LeastSquaresOptim (Dogleg, fudged)", "LeastSquaresOptim (LM, fudged)", "Optim (NewtonTrustRegion)", "Optim (Newton)",
        "JSOSolvers (trunk)", "JSOSolvers (tron)", "Ipopt", "MadNLP", "NonlinearSolve (LM, fudged)", "NonlinearSolve (TrustRegion, fudged)", "CaNNOLeS (fudged)"]
    @test SB.fudged_name("CaNNOLeS") == "CaNNOLeS (fudged)" && SB.fudged_name("NonlinearSolve (LM)") == "NonlinearSolve (LM, fudged)"
    standard = Dict(o.name => o for o in get_standard_optimizers(; tall=true))

    for n in (64, 1024)
        models = prob.generate_models(n)
        m_nlls = only(filter(m -> m.name == "NLLSModel (Static)", models))
        m_sa = only(filter(m -> m.name == "Standalone (fudged)", models))
        target = get_standard_optimizer_model(models)
        @test target === m_sa
        # Routing: the native rows run Model 1, every other row the fudged model; a renamed row has its original's
        # model and style, and the control row has a style of its own
        for o in prob.compatible_optimizers
            native = o.name in names[1:4]
            @test resolve(o, models) === (native ? m_nlls : m_sa)
            orig = replace(replace(o.name, ", fudged)" => ")"), " (fudged)" => "")
            if o.model_name === nothing && o.name != orig
                @test resolve(standard[orig], models) === m_sa
                @test SB.optimizer_style(o.name) == SB.optimizer_style(orig)
            end
        end
        @test SB.optimizer_style("SecondOrderOptimization (LM, fudged)") == (:red, :dash, :diamond)
        @test SB.optimizer_style("SecondOrderOptimization (LM, fudged)") != SB.optimizer_style("SecondOrderOptimization (LM)")

        # Step 19: the native rows converge to one cost, near (2, 1.5, 0.5)
        row(name) = only(filter(o -> o.name == name, prob.compatible_optimizers))
        x_native = Float64[]
        r_lm = row("SecondOrderOptimization (LM)").optimize(m_nlls; solution=x_native)
        r_dl = row("SecondOrderOptimization (Dogleg)").optimize(m_nlls)
        r_tall = row("SecondOrderOptimization (LM, tall)").optimize(m_nlls)
        @test r_lm.status === :ok && r_dl.status === :ok && r_tall.status === :ok
        @test r_dl.final_cost ≈ r_lm.final_cost rtol=1e-8
        @test r_tall.final_cost ≈ r_lm.final_cost rtol=1e-8
        @test maximum(abs.(x_native .- [2.0, 1.5, 0.5])) < 0.1

        # Step 17: the models agree, at the start and at the native solution, on the cost and the gradient
        for p in ([1.0, 1.0, 1.0], x_native)
            m_nlls.model.variables[1] = SB.SVector{3}(p)
            copyto!(m_sa.model.x, p)
            c_nlls = SB.NLLSModel.cost(m_nlls.model)
            m_nlls.eval_cost_and_linear_system()
            g_nlls = copy(m_nlls.eval_cost_and_linear_system.g_nlls)
            c_sa, (g_sa, _) = m_sa.eval_cost_and_linear_system()
            @test c_sa ≈ c_nlls rtol=1e-12
            @test g_sa ≈ g_nlls rtol=1e-10
        end
        m_nlls.reset!()
        m_sa.reset!()
        # J̃ matches central differences of r̃ at the start
        lsp = m_sa.model
        p0 = [1.0, 1.0, 1.0]
        J = zeros(n, 3)
        lsp.g!(J, p0)
        J_fd = zeros(n, 3)
        r_p, r_m = zeros(n), zeros(n)
        for j in 1:3
            e = zeros(3); e[j] = 1e-6
            lsp.f!(r_p, p0 + e)
            lsp.f!(r_m, p0 - e)
            J_fd[:, j] = (r_p - r_m) / 2e-6
        end
        @test J ≈ J_fd rtol=1e-8

        # Step 19: a plain least-squares fit of the same data is pulled off in c, checked at 1024 points only (at 64 the
        # outliers move b instead: c is 0.064 off, b 0.63; maintainer, 2026-11-17)
        if n == 1024
            t, y, _ = SB.generate_exp_outlier_data(n)
            plain = SB.standalone_problem(([SB.ExpFitResidual(t[i], y[i]) for i in 1:n],), [SB.SVector(1.0, 1.0, 1.0)])
            x_ls = Float64[]
            @test optimize_soo(plain; method=:lm, solution=x_ls).status === :ok
            @test abs(x_ls[3] - 0.5) > 0.2
        end

        # Step 20, every row on the fudged model, is in curve_fitting_robust_rows.jl (the integration group)
        m_sa.reset!()
    end
end
