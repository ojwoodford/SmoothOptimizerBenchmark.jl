using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# Every row of `prob` at `sz` through the harness (one sample), each adapter's own result captured beside the row
function rows_with_own_results(prob, sz)
    models = prob.generate_models(sz)
    std = get_standard_optimizer_model(models)
    own = Dict{String, OptimizerResult}()
    capture(o) = OptimizerDefinition(o.name, (m; kwargs...) -> begin
        r = o.optimize(m; kwargs...)
        haskey(kwargs, :solution) && (own[o.name] = r)   # the first run; the warm-up passes no solution
        return r
    end, o.model_name)
    rows = run_optimizer_benchmarks(capture.(prob.compatible_optimizers), std; all_models=models, samples=1)
    return rows, own, SmoothOptimizerBenchmark.point_evaluator(std), models
end

@testset "The harness evaluates every row's cost (IT1)" begin
    SOB = SmoothOptimizerBenchmark
    ftol = SOB.DEFAULT_FTOL

    # The defect: Ipopt on the ODE BVP reports a final cost that cannot be ½‖r‖² at the point it returns (3.5e-63 at
    # 32 points, where the evaluated cost is 3e-27). Both are below the comparison floor ftol × start cost, so only a
    # relative test separates them
    ode = create_ode_bvp_problem()
    rows, own, ev, models = rows_with_own_results(ode, 32)
    ipopt_row, ipopt_own = rows["Ipopt"], own["Ipopt"]
    @test ipopt_row.status === :ok
    @test ipopt_own.final_cost < 1e-6 * ipopt_row.final_cost
    @test !isapprox(ipopt_row.final_cost, ipopt_own.final_cost; rtol=1e-8)

    # An adapter whose own cost is wrong gets the evaluated cost in its row; one that hands back no point gets NaN, as do
    # skipped and failed rows. The start cost is the evaluator's, for every row that ran
    cf = create_curve_fitting_problem()
    cf_models = cf.generate_models(64)
    cf_std = get_standard_optimizer_model(cf_models)
    cf_ev = SOB.point_evaluator(cf_std)
    x_lm = Float64[]
    r_lm = optimize_soo(cf_std; method=:lm, solution=x_lm)
    liar = OptimizerDefinition("Wrong own cost", (m; solution=nothing, kwargs...) -> begin
        solution === nothing || append!(empty!(solution), x_lm)
        OptimizerResult(1.0e3, 0, 0, 7, 123.0, 1.0e9, true)
    end, "Standalone")
    # A stub's name names no package, so it names its model (IND1)
    silent = OptimizerDefinition("No point", (m; kwargs...) -> OptimizerResult(1.0e3, 0, 0, 7, 123.0, 1.0e9, true), "Standalone")
    skip = OptimizerDefinition("Skipping adapter", (m; kwargs...) -> skipped_result("not applicable"; start_cost=123.0), "Standalone")
    stub_rows = run_optimizer_benchmarks([liar, silent, skip], cf_std; all_models=cf_models, samples=1)
    @test stub_rows["Wrong own cost"].final_cost == cf_ev.cost(x_lm)
    @test isapprox(stub_rows["Wrong own cost"].final_cost, r_lm.final_cost; rtol=1e-12)
    @test stub_rows["Wrong own cost"].start_cost == cf_ev.cost(cf_ev.x0) == r_lm.start_cost
    @test isnan(stub_rows["No point"].final_cost)
    @test isnan(stub_rows["Skipping adapter"].final_cost)

    # On one small problem per adapter (and each model it is run on), the evaluated cost equals the solver's own at the
    # comparison tolerances: curve fitting (Standalone and NLLSModel (Static)), the ODE BVP (MathOptNLSModel, sparse
    # Standalone and NLLSModel), the pose chain (sparse Standalone and NLLSModel), bundle adjustment (BundleAdjustmentModels,
    # and the NLLSModel's own layout) and robust Procrustes (Manopt and the rotation variables)
    @test !isempty(ev.x0)
    checked = Set{Tuple{String, String}}()
    for (prob, sz, prev) in ((cf, 64, nothing), (ode, 32, (rows, own, ev, models)), (create_pose_chain_problem(), 50, nothing),
                             (create_bundle_adjustment_problem(), 4, nothing), (create_robust_procrustes_problem(), 3, nothing))
        p_rows, p_own, p_ev, p_models = prev === nothing ? rows_with_own_results(prob, sz) : prev
        @test p_ev !== nothing
        for (name, r) in p_rows
            r.status in (:skipped, :error) && continue
            o = p_own[name]
            @test r.start_cost ≈ o.start_cost rtol=1e-12
            ok = isapprox(r.final_cost, o.final_cost; rtol=1e-8, atol=ftol * o.start_cost)
            ok || @info "Evaluated cost differs from the solver's own" prob.name sz name r.final_cost o.final_cost
            @test ok
            push!(checked, (prob.name, name))
        end
    end
    # Every adapter appears; Ipopt's own cost on the ODE BVP is within the floor too (above)
    @test length(checked) >= 40

    # The ManifoldVar model, which no row runs on by default, hands back the same rotation layout
    pr = create_robust_procrustes_problem()
    pr_models = pr.generate_models(3)
    pr_ev = SOB.point_evaluator(get_standard_optimizer_model(pr_models))
    m_ovi = only(filter(m -> m.name == "NLLSModel (ManifoldVar)", pr_models))
    x_ovi = Float64[]
    r_ovi = optimize_soo(m_ovi; method=:lm, solution=x_ovi)
    @test length(x_ovi) == 9
    @test isapprox(pr_ev.cost(m_ovi.to_point(x_ovi)), r_ovi.final_cost; rtol=1e-8, atol=ftol * r_ovi.start_cost)

    # A model type with no evaluator gives NaN costs, not a throw
    @test SOB.point_evaluator(:not_a_model) === nothing
    @test isnan(SOB.evaluated_result(r_lm, x_lm, cf_std, nothing).final_cost)
end

# CN2: a problem that states its solution gives each row its relative error in the solution, at the point it handed back,
# from the first run; without a stated solution, and for a skipped or failed row, the error is NaN. It survives the data
# file's round trip, and a file written before the column existed loads it as NaN
@testset "A row's error in the solution (CN2)" begin
    SOB = SmoothOptimizerBenchmark
    cf = create_curve_fitting_problem()
    models = cf.generate_models(64)
    std = get_standard_optimizer_model(models)
    x_lm = Float64[]
    optimize_soo(std; method=:lm, solution=x_lm)
    xstar = x_lm .+ [0.1, -0.2, 0.3]
    handing(x) = (m; solution=nothing, kwargs...) -> begin
        solution === nothing || append!(empty!(solution), x)
        OptimizerResult(1.0e3, 0, 0, 7, 1.0, 1.0, true)
    end
    rows = [OptimizerDefinition("At the LM point", handing(x_lm), "Standalone"),
            OptimizerDefinition("At the solution", handing(xstar), "Standalone"),
            OptimizerDefinition("No point", (m; kwargs...) -> OptimizerResult(1.0e3, 0, 0, 7, 1.0, 1.0, true), "Standalone"),
            OptimizerDefinition("Skipping adapter", (m; kwargs...) -> skipped_result("not applicable"), "Standalone"),
            OptimizerDefinition("Throwing adapter", (m; kwargs...) -> error("boom"), "Standalone")]
    res = run_optimizer_benchmarks(rows, std; all_models=models, samples=1, reference_solution=xstar)
    @test res["At the LM point"].solution_error ≈ SOB.norm(x_lm - xstar) / SOB.norm(xstar) rtol=1e-14
    @test res["At the solution"].solution_error == 0.0
    @test isnan(res["No point"].solution_error)
    @test isnan(res["Skipping adapter"].solution_error)
    @test res["Throwing adapter"].status === :error && isnan(res["Throwing adapter"].solution_error)
    # It changes no status: the rows' costs decide them
    res_none = run_optimizer_benchmarks(rows[1:2], std; all_models=models, samples=1)
    @test all(r -> isnan(r.solution_error), values(res_none))
    @test [res_none[o.name].status for o in rows[1:2]] == [res[o.name].status for o in rows[1:2]]
    # The copies keep it
    r = res["At the LM point"]
    @test SOB.with_timing(r, 1.0, 0, 0).solution_error == r.solution_error
    @test SOB.with_status(r, :local_minimum, "x").solution_error == r.solution_error
    @test SOB.with_costs(r, 1.0, 2.0).solution_error == r.solution_error
    @test SOB.with_excess_cost(r, 1.0).solution_error == r.solution_error
    @test isnan(OptimizerResult(1.0, 0, 0, 1, 1.0, 1.0, true).solution_error)
    # A problem states it through its definition, and the harness passes it on; by default it states none
    @test cf.reference_solution(64) === nothing
    stated = ProblemDefinition("Stated", :small_dense, Any[64], cf.generate_models, rows[1:1], "m", _ -> 0.0;
                               derivatives=:autodiff, reference_solution=_ -> xstar)
    @test stated.reference_solution(64) == xstar
    @test run_problem_benchmark(stated, 64; samples=1).optimizer_results["At the LM point"].solution_error ≈ r.solution_error rtol=1e-14
    @test ProblemDefinition("S", :small_dense, Any[1], n -> ModelDefinition[], OptimizerDefinition[], "n";
                            derivatives=:analytic, reference_solution=_ -> [1.0]).reference_solution(1) == [1.0]
    @test ProblemDefinition("S", :small_dense, Any[1], n -> ModelDefinition[], OptimizerDefinition[];
                            derivatives=:analytic, reference_solution=_ -> [1.0]).reference_solution(1) == [1.0]
    # The data file's round trip, and a file without the column
    dir = mktempdir()
    f = joinpath(dir, "stated.md")
    init_problem_markdown(f, "Stated", :small_dense, "m", std.name; derivatives=:autodiff)
    init_optimizer_section(f, std.name)
    for o in rows
        append_optimizer_evaluation(f, 64, o.name, res[o.name])
    end
    loaded = load_problem_markdown(f).size_results[1].optimizer_results
    @test loaded["At the LM point"].solution_error ≈ r.solution_error rtol=1e-4
    @test loaded["At the solution"].solution_error == 0.0
    @test isnan(loaded["No point"].solution_error)
    old = replace(read(f, String), " Solution Error |" => "", "|---:|---:|:---|\n" => "|---:|:---|\n")
    old_lines = [occursin(r"^\| 64 \|", l) ? join(deleteat!(split(l, " | "), 11), " | ") : l for l in split(old, '\n')]
    old_file = joinpath(dir, "old.md")
    write(old_file, join(old_lines, '\n'))
    old_loaded = load_problem_markdown(old_file).size_results[1].optimizer_results
    @test all(r -> isnan(r.solution_error), values(old_loaded))
    @test old_loaded["At the LM point"].status === loaded["At the LM point"].status
    @test old_loaded["At the LM point"].iterations == 7
end
