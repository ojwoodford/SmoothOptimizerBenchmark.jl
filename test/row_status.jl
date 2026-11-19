using Test
using SmoothOptimizerBenchmark, Printf
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# A stub row that claims `converged` (or not) at a given point, with a solver's own cost that the harness ignores
stub_row(name, x; converged=true) = OptimizerDefinition(name, (m; solution=nothing, kwargs...) -> begin
    solution === nothing || append!(empty!(solution), x)
    OptimizerResult(1.0e3, 0, 0, 3, 0.0, 0.0, converged; message="stub")
end)

@testset "A row is ok only if its cost passes the test (IT4)" begin
    SOB = SmoothOptimizerBenchmark
    @test (:local_minimum in OPTIMIZER_STATUSES) && (:above_reference in OPTIMIZER_STATUSES)
    @test SOB.passes_cost_test(1.0 + 0.5e-4, 1.0) && !SOB.passes_cost_test(1.0 + 2e-4, 1.0)
    @test SOB.passes_cost_test(9e-7, 0.0) && !SOB.passes_cost_test(2e-6, 0.0) && !SOB.passes_cost_test(NaN, 0.0)

    # The defect: LeastSquaresOptim (Dogleg) on the ODE BVP at 4096 points claims convergence after 2 iterations at
    # 2047.7, from a start of 2048, and was ok. The reference is the known minimum, 0, and the point is not stationary
    ode = create_ode_bvp_problem()
    @test ode.reference_cost(4096) == 0.0
    ode_models = ode.generate_models(4096)
    ode_std = get_standard_optimizer_model(ode_models, ode.category)
    lso = only(filter(o -> o.name == "LeastSquaresOptim (Dogleg)", ode.compatible_optimizers))
    r_lso = run_optimizer_benchmarks([lso], ode_std; all_models=ode_models, samples=1, reference=0.0)[lso.name]
    @test r_lso.final_cost > 0.99 * r_lso.start_cost
    @test r_lso.status === :above_reference
    @test !r_lso.converged
    @test occursin("converged; claimed convergence at cost", r_lso.message)

    # Dense Rosenbrock, n = 6: the local minimum at 2.5072 (x₁ ≈ -0.66; MadNLP's published point, polished by LM) and
    # the start (28.75), each claimed as converged. The known reference, 0, is used although no row reaches it
    rd = create_rosenbrock_dense_problem()
    @test rd.reference_cost(6) == 0.0
    rd_models = rd.generate_models(6)
    rd_std = get_standard_optimizer_model(rd_models, rd.category)
    ev = SOB.point_evaluator(rd_std)
    x_local = [-0.663967779442176, 0.8669554213761816, 0.8440265088560183, 0.8129759294645175, 0.770498797438184, 0.7141993664423817]
    @test ev.cost(x_local) ≈ 2.5072 rtol=1e-4
    @test SOB.predicted_reduction_ratio(ev, x_local) < 1e-12
    @test SOB.predicted_reduction_ratio(ev, ev.x0) ≈ 0.76 rtol=0.01
    rows = run_optimizer_benchmarks([stub_row("At a local minimum", x_local), stub_row("At the start", ev.x0),
                                     stub_row("Not converged at the minimum", ones(6); converged=false)],
                                    rd_std; all_models=rd_models, samples=1, reference=rd.reference_cost(6))
    @test rows["At a local minimum"].status === :local_minimum
    @test rows["At the start"].status === :above_reference
    @test ev.cost(ones(6)) == 0.0
    @test rows["Not converged at the minimum"].status === :not_converged
    @test endswith(rows["Not converged at the minimum"].message, "cost test passes")
    @test count(r -> r.converged, values(rows)) == 0

    # Without a known reference, the best row's cost is the reference, whatever its status: curve fitting, with LM's
    # minimum claimed as not converged and as converged, and the start claimed as converged
    cf = create_curve_fitting_problem()
    @test cf.reference_cost(64) === nothing
    cf_models = cf.generate_models(64)
    cf_std = get_standard_optimizer_model(cf_models, cf.category)
    x_min = Float64[]
    optimize_soo(cf_std; method=:lm, solution=x_min)
    cf_ev = SOB.point_evaluator(cf_std)
    best_nc = stub_row("Best, not converged", x_min; converged=false)
    rows_cf = run_optimizer_benchmarks([best_nc, stub_row("Converged at the minimum", x_min), stub_row("Converged at the start", cf_ev.x0)],
                                       cf_std; all_models=cf_models, samples=1)
    @test rows_cf["Best, not converged"].status === :not_converged
    @test endswith(rows_cf["Best, not converged"].message, "cost test passes")
    @test rows_cf["Converged at the minimum"].status === :ok
    @test rows_cf["Converged at the start"].status === :above_reference
    @test occursin(@sprintf("reference %.6e", cf_ev.cost(x_min)), rows_cf["Converged at the start"].message)

    # A converged row that hands back no point fails the cost test and cannot be tested for stationarity
    silent = OptimizerDefinition("No point", (m; kwargs...) -> OptimizerResult(1.0e3, 0, 0, 3, 0.0, 0.0, true))
    @test run_optimizer_benchmarks([silent], cf_std; all_models=cf_models, samples=1)["No point"].status === :above_reference

    # Rows reach on_result, and so the results file, only once the size has run, with their final statuses
    seen = Pair{String, Symbol}[]
    run_optimizer_benchmarks([stub_row("At the start", cf_ev.x0), best_nc], cf_std; all_models=cf_models, samples=1,
        on_result=(name, r) -> push!(seen, name => r.status))
    @test seen == ["At the start" => :above_reference, "Best, not converged" => :not_converged]

    # The new statuses are written and read back
    file = joinpath(mktempdir(), "status.md")
    init_problem_markdown(file, "Status", :small_dense, "Size", "Standalone"; derivatives=:analytic)
    @test occursin("above_reference", read(file, String))
    init_optimizer_section(file, "Standalone")
    for (name, r) in rows
        append_optimizer_evaluation(file, 6, name, r)
    end
    loaded = load_problem_markdown(file).size_results[1].optimizer_results
    @test Dict(k => v.status for (k, v) in loaded) == Dict(k => v.status for (k, v) in rows)
end
