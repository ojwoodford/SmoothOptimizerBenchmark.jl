using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Ill-conditioned polynomial fit: excess cost over the reference minimum (N3, N4)" begin
    SB = SmoothOptimizerBenchmark
    prob = create_polynomial_fitting_problem()
    # CN10: the size is the number of coefficients, and cond(J) is the target at every size, by the stretch of the
    # Chebyshev basis, which cond(J) rises with wherever Float64 resolves it (below 1e14; above, its singular values are
    # rounding noise), and which is 1 or more
    @test prob.default_sizes == Any[4, 5, 7, 10, 14, 19, 25, 35, 47, 64]
    for n in prob.default_sizes
        V, y = SB.polyfit_data(n)
        @test size(V) == (8n, n) && length(y) == 8n
        σ = SB.svdvals(V)
        @test abs(σ[1] / σ[end] / SB.POLYFIT_TARGET_COND - 1) <= 0.01
        s = SB.polyfit_stretch(n)
        @test 1 < s < 1e6
        @test SB.polyfit_condition(n, 1.0) < SB.POLYFIT_TARGET_COND
        c = [SB.polyfit_condition(n, exp(l)) for l in range(0, log(1e6); length=40)]
        k = something(findfirst(>(1e14), c), length(c) + 1)
        @test all(>(0), diff(c[1:k-1]))
    end
    # The basis is T_{k−1}(t/s): its first columns are 1 and t/s, scaled
    V4, _ = SB.polyfit_data(4)
    t4 = SB.polyfit_points(4) ./ SB.polyfit_stretch(4)
    @test V4[:, 1] == fill(SB.POLYFIT_SCALE, 32)
    @test V4[:, 2] ≈ SB.POLYFIT_SCALE .* t4
    @test V4[:, 3] ≈ SB.POLYFIT_SCALE .* (2 .* t4 .^ 2 .- 1)

    sz = 14
    ref = SB.polyfit_reference(sz)
    models = prob.generate_models(sz)
    target = get_standard_optimizer_model(models)
    res = run_optimizer_benchmarks(prob.compatible_optimizers, target; all_models=models, samples=1)
    # The one SecondOrderOptimization row is NLLSModel's recommendation, which is the Jacobian path (CN10; before, the
    # normal equations, which the comparison below now runs by hand)
    r_soo = res["SecondOrderOptimization"]
    @test SB.POLYNOMIAL_FITTING_SOO.formulation === :jacobian
    @test SB.POLYNOMIAL_FITTING_SOO.linsolver === :qr
    m_nlls = only(filter(m -> m.name == "NLLSModel", models))
    @test m_nlls.model.variables[1] isa Vector{Float64}
    m_nlls.reset!()
    x_tall = Float64[]
    r_tall = optimize_soo(m_nlls; method=:lm, formulation=:jacobian, solution=x_tall)
    tall_excess = SB.polyfit_excess_cost(sz, x_tall)
    m_nlls.reset!()
    x_norm = Float64[]
    r_norm = optimize_soo(m_nlls; method=:lm, formulation=:hessian, linsolver=:cholesky, solution=x_norm)
    norm_excess = SB.polyfit_excess_cost(sz, x_norm)
    @test all(r -> !isnan(r.excess_cost), values(res))
    # The Jacobian path reaches the extended-precision minimum, as the pinned row does; the normal equations stop well
    # above it, after more iterations
    @test 0 <= tall_excess <= 1e-12 * Float64(ref.minimum)
    @test 0 <= r_soo.excess_cost <= 1e-12 * Float64(ref.minimum)
    @test norm_excess > 1e-8 * Float64(ref.minimum)
    @test r_tall.iterations < r_norm.iterations
    # The excess survives the round trip through the results file
    dir = mktempdir()
    f = joinpath(dir, "polyfit.md")
    init_problem_markdown(f, prob.name, prob.category, prob.size_metric_name, target.name; derivatives=prob.derivatives)
    init_optimizer_section(f, target.name)
    for (k, r) in res
        append_optimizer_evaluation(f, sz, k, r)
    end
    loaded = load_problem_markdown(f).size_results[1].optimizer_results
    for (k, r) in res
        @test loaded[k].excess_cost ≈ r.excess_cost rtol=1e-3
        @test loaded[k].status === r.status
    end
end
