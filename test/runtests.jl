using Test
using SmoothOptimizerBenchmark

@testset "SmoothOptimizerBenchmark Suite" begin
    problems = get_all_problems()
    # 9 distinct problems (8 Euclidean non-manifold + 1 manifold)
    @test length(problems) == 9

    @testset "Problem Definition & >=10 Problem Sizes" begin
        for prob in problems
            @test !isempty(prob.name)
            @test prob.category in (:small_dense, :medium_dense, :large_dense, :large_sparse, :manifold)
            @test length(prob.default_sizes) >= 10
            @test !isempty(prob.compatible_optimizers)
            @test any(opt -> occursin("secondorder", lowercase(opt.name)), prob.compatible_optimizers)
            @test !isempty(prob.size_metric_name)

            # Test model generation on smallest size
            sz = first(prob.default_sizes)
            models = prob.generate_models(sz)
            @test !isempty(models)

            for m in models
                @test !isempty(m.name)
                # Test cost evaluation
                c = m.eval_cost()
                @test c isa Real
                @test !isnan(c)

                # Test linear system / derivative evaluation
                c_ls, ls = m.eval_cost_and_linear_system()
                @test c_ls isa Real
                @test !isnan(c_ls)
                @test isapprox(c, c_ls; rtol=1e-10, atol=1e-12)

                # Test reset
                m.reset!()
            end
        end
    end

    @testset "Plot Styling & Unsupported Sparse Solver Handling" begin
        @test SmoothOptimizerBenchmark.model_style("Manifolds")[1] == :blue
        @test SmoothOptimizerBenchmark.optimizer_style("Manopt (LevenbergMarquardt)")[1] == :blue
        @test SmoothOptimizerBenchmark.optimizer_style("CaNNOLeS")[1] == :chocolate
        @test SmoothOptimizerBenchmark.optimizer_style("MadNLP")[1] == :teal
        @test SmoothOptimizerBenchmark.optimizer_style("NonlinearSolve (LM)")[1] == :deeppink
        @test SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (LM)") == (:red, :solid, :circle)
        @test SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (Dogleg)") == (:red, :dash, :square)
        @test SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (Sparse LM)") == (:red, :solid, :circle)
        @test SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (Sparse Dogleg)") == (:red, :dash, :square)
        @test SmoothOptimizerBenchmark.optimizer_style("NLLSModel + SecondOrderOptimization (LM)") == (:red, :dot, :star5)
        @test SmoothOptimizerBenchmark.optimizer_style("NLLSModel + SecondOrderOptimization (Dogleg)") == (:red, :dashdot, :star5)
        @test SmoothOptimizerBenchmark.optimizer_style("NLLSModel + SecondOrderOptimization (Sparse LM)") == (:red, :dot, :star5)
        @test SmoothOptimizerBenchmark.optimizer_style("NLLSModel + SecondOrderOptimization (Sparse Dogleg)") == (:red, :dashdot, :star5)
        # B11: the tall row has a line of its own; the polynomial fit has an explicit slug
        tall_style = SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (LM, tall)")
        @test tall_style == (:red, :dashdotdot, :utriangle)
        @test tall_style != SmoothOptimizerBenchmark.optimizer_style("SecondOrderOptimization (LM)")
        @test problem_slug(create_polynomial_fitting_problem().name) == "polynomial_fitting"
        @test length(unique(problem_slug(p.name) for p in problems)) == length(problems)

        # Optim NewtonTrustRegion on sparse problem must gracefully return converged=false & NaN time
        sp_prob = create_rosenbrock_sparse_problem()
        sp_models = sp_prob.generate_models(10)
        sp_target = get_standard_optimizer_model(sp_models, sp_prob.category)
        res_ntr = optimize_optim(sp_target; method=:newton_trust_region)
        @test isnan(res_ntr.time_ns)
        @test !res_ntr.converged
        @test res_ntr.status === :skipped
        @test !isempty(res_ntr.message)

        # SOO with maxiters=1 from non-optimal start must report converged=false
        res_soo_1 = optimize_soo(sp_target; method=:lm, maxiters=1)
        @test !res_soo_1.converged
        @test res_soo_1.status === :not_converged
        @test occursin("max_iters", res_soo_1.message)
    end

    @testset "Every SecondOrderOptimization termination mask has a name" begin
        SOO = SmoothOptimizerBenchmark.SecondOrderOptimization
        exported = Set(getfield(SOO, n) for n in names(SOO) if startswith(String(n), "TERMINATION_"))
        named = Set(mask for (_, mask) in SmoothOptimizerBenchmark.SOO_TERMINATION_NAMES)
        @test named == exported
        @test allunique(first.(SmoothOptimizerBenchmark.SOO_TERMINATION_NAMES))
        @test SmoothOptimizerBenchmark.soo_termination_message(SOO.TERMINATION_GRAD_NAN | SOO.TERMINATION_START_NOT_FINITE) == "start_not_finite, grad_nan"
    end

    @testset "Optimizer status (B3)" begin
        @test_throws ArgumentError OptimizerResult(1.0, 0, 0, 1, 1.0, 0.5, true, :not_converged, "")
        @test_throws ArgumentError OptimizerResult(1.0, 0, 0, 1, 1.0, 0.5, false, :failed, "")
        @test OptimizerResult(1.0, 0, 0, 1, 1.0, 0.5, false; timed_out=true).status === :timeout

        # An adapter that throws is reported as :error with the exception text, not as a bare NaN row
        prob = create_curve_fitting_problem()
        models = prob.generate_models(64)
        target = get_standard_optimizer_model(models, prob.category)
        bad = OptimizerDefinition("Broken adapter", (m; kwargs...) -> error("adapter exploded"))
        skip = OptimizerDefinition("Skipping adapter", (m; kwargs...) -> skipped_result("not applicable"))
        good = OptimizerDefinition("SecondOrderOptimization (LM)", (m; kwargs...) -> optimize_nlls_soo(m; method=:lm, kwargs...))
        res = @test_logs (:warn, r"Broken adapter") match_mode=:any run_optimizer_benchmarks([bad, skip, good], target; all_models=models, samples=1)
        @test res["Broken adapter"].status === :error
        @test occursin("adapter exploded", res["Broken adapter"].message)
        @test res["Skipping adapter"].status === :skipped
        @test res["SecondOrderOptimization (LM)"].status === :ok
        @test res["SecondOrderOptimization (LM)"].converged

        # B10: a throw in a later timing sample, after a converged first run, makes the row an :error too
        calls = Ref(0)
        flaky = OptimizerDefinition("Flaky adapter", (m; kwargs...) -> begin
            calls[] += 1
            calls[] >= 3 && error("sample exploded")   # call 1 is the warm-up, call 2 the first timed run
            OptimizerResult(1.0e3, 0, 0, 1, 1.0, 0.5, true)
        end)
        res_flaky = @test_logs (:warn, r"Flaky adapter threw in a timing sample") match_mode=:any run_optimizer_benchmarks([flaky], target; all_models=models, samples=3)
        @test calls[] == 3
        @test res_flaky["Flaky adapter"].status === :error
        @test occursin("sample exploded", res_flaky["Flaky adapter"].message)

        # Result files written before the status column still load
        legacy = joinpath(mktempdir(), "legacy.md")
        write(legacy, """
        # Benchmark Results: Legacy

        - **Category**: small_dense

        | Size | Optimizer | Runtime (ns) | Allocs | Memory (bytes) | Iterations | Final Cost | Converged |
        |:---|:---|---:|---:|---:|---:|---:|:---|
        | 4 | A | 10.0 | 1 | 2 | 3 | 1.0000e-01 | true |
        | 4 | B | NaN | 0 | 0 | 0 | NaN | false |
        """)
        lr = load_problem_markdown(legacy)
        @test lr.size_results[1].optimizer_results["A"].status === :ok
        @test lr.size_results[1].optimizer_results["B"].status === :not_converged
    end

    @testset "Cold-Start NLLSModel + SecondOrderOptimization & BAL Equivalence" begin
        # 1. Exponential Curve Fitting (static variable)
        cf_models = create_curve_fitting_problem().generate_models(64)
        cf_nlls = first(filter(m -> occursin("nllsmodel", lowercase(m.name)), cf_models))
        r_cf = optimize_nlls_soo(cf_nlls; method=:lm)
        @test r_cf.converged
        @test r_cf.final_cost < r_cf.start_cost
        @test r_cf.allocs > 0

        # 2. Sparse Rosenbrock (block-sparse LDL)
        rs_models = create_rosenbrock_sparse_problem().generate_models(100)
        rs_nlls = first(filter(m -> occursin("nllsmodel", lowercase(m.name)), rs_models))
        r_rs = optimize_nlls_soo(rs_nlls; method=:lm)
        @test r_rs.converged
        @test r_rs.final_cost < r_rs.start_cost
        @test r_rs.allocs > 0

        # 3. Pose Chain (block-sparse SVector{3} LDL)
        pc_models = create_pose_chain_problem().generate_models(50)
        pc_nlls = first(filter(m -> occursin("nllsmodel", lowercase(m.name)), pc_models))
        r_pc = optimize_nlls_soo(pc_nlls; method=:lm)
        @test r_pc.converged
        @test r_pc.final_cost < r_pc.start_cost
        @test r_pc.allocs > 0

        # 4. Sparse Bundle Adjustment (9-DOF BAL equivalence & cold-start solve)
        ba_models = create_bundle_adjustment_problem().generate_models(8)
        ba_nlls = first(filter(m -> m.name == "NLLSModel", ba_models))
        ba_bam = first(filter(m -> m.name == "BundleAdjustmentModels", ba_models))
        @test isapprox(ba_nlls.eval_cost(), ba_bam.eval_cost(); rtol=1e-12)
        r_ba = optimize_nlls_soo(ba_nlls; method=:lm, reduction=:none, linsolver=:ldl)
        @test r_ba.converged
        @test r_ba.final_cost < r_ba.start_cost
        @test r_ba.allocs > 0

        r_ba_schur = optimize_nlls_soo(ba_nlls; method=:lm, reduction=:eliminate)
        @test r_ba_schur.converged
        @test r_ba_schur.final_cost < r_ba_schur.start_cost
        @test r_ba_schur.allocs > 0

        # 5. Robust Procrustes on SO(d) (specialized Cayley + static linear system for d <= 6)
        pr_models = create_robust_procrustes_problem().generate_models(6)
        pr_spec = first(filter(m -> m.name == "NLLSModel (Specialized)", pr_models))
        r_pr = optimize_nlls_soo(pr_spec; method=:lm)
        @test r_pr.converged
        @test r_pr.final_cost < r_pr.start_cost
        @test r_pr.allocs > 0

        # 6. 1D ODE Boundary Value Problem (Bratu problem, tridiagonal sparse)
        ode_models = create_ode_bvp_problem().generate_models(32)
        ode_nlls = first(filter(m -> occursin("nllsmodel", lowercase(m.name)), ode_models))
        r_ode = optimize_nlls_soo(ode_nlls; method=:lm)
        @test r_ode.converged
        @test r_ode.final_cost < r_ode.start_cost
        @test r_ode.allocs > 0
    end

    @testset "Thread counts and NLLSModel threading thresholds (M17, F4)" begin
        @test_throws ArgumentError set_benchmark_threads!(; numthreads=Threads.nthreads() + 1)
        t = set_benchmark_threads!(; numthreads=1, blas_threads=1)
        @test t == (; numthreads=1, julia_threads=Threads.nthreads(), blas_threads=1)
        @test benchmark_numthreads() === SmoothOptimizerBenchmark.static(1)

        # min_work and min_work_cost reach NLLSModel: forcing threading on or off changes nothing but the schedule
        set_benchmark_threads!()
        cf = first(filter(m -> occursin("nllsmodel", lowercase(m.name)), create_curve_fitting_problem().generate_models(256)))
        r_default = optimize_nlls_soo(cf; method=:lm)
        r_forced = optimize_nlls_soo(cf; method=:lm, min_work=0, min_work_cost=0)
        r_serial = optimize_nlls_soo(cf; method=:lm, min_work=typemax(Int), min_work_cost=typemax(Int))
        @test r_forced.status === :ok && r_serial.status === :ok
        @test r_forced.final_cost ≈ r_default.final_cost rtol=1e-10
        @test r_serial.final_cost ≈ r_default.final_cost rtol=1e-10
        @test_throws TypeError optimize_nlls_soo(cf; method=:lm, min_work="a lot")   # forwarded to optimize!, which types it
    end

    @testset "Single-variable NLLSModel rows use the linear system's own buffer types (M18)" begin
        set_benchmark_threads!(; numthreads=1, blas_threads=1)
        # Curve fitting: one SVector{3} variable, so a static system; its g and H are an MVector and an MMatrix, and an
        # fdf! call writes straight into them without allocating
        cf = first(filter(m -> occursin("nllsmodel", lowercase(m.name)), create_curve_fitting_problem().generate_models(16)))
        linsys = cf.eval_cost_and_linear_system
        @test linsys.g_nlls isa SmoothOptimizerBenchmark.MVector{3, Float64}
        @test linsys.H_nlls isa SmoothOptimizerBenchmark.MMatrix{3, 3, Float64, 9}
        linsys()
        @test (@allocated linsys()) == 0
        # Procrustes, specialized rotation: nvars = d(d-1)/2 is static, so the system is static while it is <= 16
        # (d <= 6) and dynamic above; the buffers follow it
        for (d, static_sys) in ((4, true), (6, true), (8, false))
            sp = only(filter(m -> m.name == "NLLSModel (Specialized)", create_robust_procrustes_problem().generate_models(d)))
            nv = d * (d - 1) ÷ 2
            @test SmoothOptimizerBenchmark.nvars(sp.model.variables[1]) === SmoothOptimizerBenchmark.static(nv)
            H = sp.eval_cost_and_linear_system.H_spec
            @test H isa (static_sys ? SmoothOptimizerBenchmark.MMatrix{nv, nv, Float64, nv * nv} : Matrix{Float64})
            @test sp.eval_cost_and_linear_system.g_spec isa (static_sys ? SmoothOptimizerBenchmark.MVector{nv, Float64} : Vector{Float64})
        end
        set_benchmark_threads!()
    end

    @testset "Tall formulation (N1, N2, N5)" begin
        # N5: the tall and normal rows reach the same cost on the well-conditioned dense problems
        tall = soo_tall_optimizer()
        @test tall.name == "SecondOrderOptimization (LM, tall)"
        normal_lm(m) = optimize_soo(m; method=:lm)
        for (prob, sz) in ((create_curve_fitting_problem(), 256), (create_rosenbrock_dense_problem(), 8), (create_robust_procrustes_problem(), 4))
            @test any(o -> o.name == tall.name, prob.compatible_optimizers)
            models = prob.generate_models(sz)
            target = get_standard_optimizer_model(models, prob.category)
            md = SmoothOptimizerBenchmark.resolve_optimizer_model(tall, target, models)
            r_tall = tall.optimize(md)
            r_norm = normal_lm(md)
            @test r_norm.status === :ok
            if r_tall.status === :skipped
                # The tall path does not support this model: reported as a skip with NLLSModel's reason, not a failure
                @test occursin("formulation = :tall", r_tall.message)
                @info "Tall row skipped on $(prob.name)" r_tall.message
            else
                @test r_tall.status === :ok
                @test isapprox(r_tall.final_cost, r_norm.final_cost; rtol=1e-6, atol=1e-12)
            end
        end

        # The tall row is skipped, not failed, where a dense Jacobian is forced above the cap
        sp = create_rosenbrock_sparse_problem()
        sp_models = sp.generate_models(10)
        sp_nlls = first(filter(m -> m.model isa SmoothOptimizerBenchmark.NLLSModel.Model, sp_models))
        r_big = optimize_nlls_soo(sp_nlls; method=:lm, formulation=:tall, storage=:dense, max_dense_bytes=8)
        @test r_big.status === :skipped
        @test occursin("dense", r_big.message)
        # U1: under storage = :auto (NLLSModel NTP1) the same run stores J sparse and runs, to the normal row's cost
        J_auto = last(SmoothOptimizerBenchmark.NLLSModel.optimvars_nls(sp_nlls.model; storage=:auto, max_dense_bytes=8))
        @test J_auto isa SmoothOptimizerBenchmark.SparseMatrixCSC
        r_auto = optimize_nlls_soo(sp_nlls; method=:lm, formulation=:tall, storage=:auto, max_dense_bytes=8)
        @test r_auto.status === :ok
        @test r_auto.converged
        r_auto_norm = optimize_nlls_soo(sp_nlls; method=:lm)
        @test isapprox(r_auto.final_cost, r_auto_norm.final_cost; rtol=1e-8, atol=1e-12)
        # optimize_soo forwards storage likewise (NLLSModel checks it)
        @test optimize_soo(sp_nlls; method=:lm, formulation=:tall, storage=:sparse).status === :ok
        @test_throws ArgumentError optimize_soo(sp_nlls; method=:lm, storage=:bogus)
        @test_throws ArgumentError optimize_nlls_soo(sp_nlls; method=:lm, storage=:bogus)
        sp_lsp = get_standard_optimizer_model(sp_models, sp.category)
        @test optimize_soo(sp_lsp; method=:lm, formulation=:tall).status === :skipped

        # N2: the tall objective of a dense LeastSquaresProblem gives the same minimum as the normal equations
        cf_models = create_curve_fitting_problem().generate_models(256)
        cf_lsp = first(filter(m -> m.name == "Standalone", cf_models))
        x_t, x_n = Float64[], Float64[]
        r_t = optimize_soo(cf_lsp; method=:lm, formulation=:tall, solution=x_t)
        r_n = optimize_soo(cf_lsp; method=:lm, solution=x_n)
        @test r_t.status === :ok && r_n.status === :ok
        @test r_t.final_cost ≈ r_n.final_cost rtol=1e-8
        @test x_t ≈ x_n rtol=1e-5
        x0, obj = soo_objective_tall(cf_lsp.model)
        @test obj isa SmoothOptimizerBenchmark.SecondOrderOptimization.JacobianObjective
        @test all(iszero, obj.J)
        @test_throws ArgumentError soo_objective_tall(sp_lsp.model)
    end

    @testset "Ill-conditioned polynomial fit: excess cost over the reference minimum (N3, N4)" begin
        prob = create_polynomial_fitting_problem()
        sz = first(prob.default_sizes)
        ref = SmoothOptimizerBenchmark.polyfit_reference(sz)
        models = prob.generate_models(sz)
        target = get_standard_optimizer_model(models, prob.category)
        res = run_optimizer_benchmarks(prob.compatible_optimizers, target; all_models=models, samples=1)
        r_tall = res["SecondOrderOptimization (LM, tall)"]
        r_norm = res["SecondOrderOptimization (LM)"]
        @test all(r -> !isnan(r.excess_cost), values(res))
        # The tall path reaches the extended-precision minimum; the normal equations stop well above it
        @test 0 <= r_tall.excess_cost <= 1e-12 * Float64(ref.minimum)
        @test r_norm.excess_cost > 1e-8 * Float64(ref.minimum)
        @test r_tall.iterations < r_norm.iterations
        # The excess survives the round trip through the results file
        dir = mktempdir()
        f = joinpath(dir, "polyfit.md")
        init_problem_markdown(f, prob.name, prob.category, prob.size_metric_name, target.name)
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

    @testset "Quick Single-Size Benchmark" begin
        for prob in problems
            sz = first(prob.default_sizes)
            res = run_problem_benchmark(prob, sz; samples=1)
            @test res.problem == prob.name
            @test res.size == sz
            @test !isempty(res.model_results)
            @test !isempty(res.target_model)
            @test !isempty(res.optimizer_results)
            @test haskey(res.model_results, res.target_model)
        end
    end

    @testset "Scaling Benchmark, Markdown Serialization & Plotting" begin
        prob = create_rosenbrock_sparse_problem()
        test_sizes = Any[4, 8]
        tmp_data_dir = mktempdir()
        scaling_res = run_scaling_benchmark(prob; sizes=test_sizes, samples=1, data_dir=tmp_data_dir)

        @test scaling_res.problem == prob.name
        @test length(scaling_res.size_results) == 2
        @test scaling_res.sizes == test_sizes

        # Verify streaming markdown file exists and round-trips accurately
        streamed_md = joinpath(tmp_data_dir, "rosenbrock_sparse.md")
        @test isfile(streamed_md)
        md_text = read(streamed_md, String)
        @test occursin("**Threads**: NLLSModel numthreads=$(Threads.nthreads()), Julia threads=$(Threads.nthreads()), BLAS threads=$(Threads.nthreads())", md_text)
        @test !occursin("Git Commit: unknown", md_text)
        # Every header records the commit of each sibling package it ran against
        for dep in SmoothOptimizerBenchmark.RECORDED_DEPENDENCIES
            @test occursin(Regex("Dependency Commits\\*\\*: .*\\b$(dep) [0-9a-f]{7,}"), md_text)
        end

        loaded = load_problem_markdown(streamed_md)
        @test loaded.problem == prob.name
        @test loaded.sizes == test_sizes
        @test length(loaded.size_results) == 2
        @test loaded.category == scaling_res.category
        @test loaded.size_metric_name == scaling_res.size_metric_name
        for (sr_orig, sr_load) in zip(scaling_res.size_results, loaded.size_results)
            for (opt_name, opt_orig) in sr_orig.optimizer_results
                opt_load = sr_load.optimizer_results[opt_name]
                @test opt_load.converged == opt_orig.converged
                @test opt_load.iterations == opt_orig.iterations
                @test opt_load.status === opt_orig.status
                @test opt_load.message == SmoothOptimizerBenchmark.table_message(opt_orig.message)
            end
        end
        # D3: BlockLinearSystems is no longer recorded, and a header written before then, which names it, still loads
        @test !occursin("BlockLinearSystems", md_text)
        old_md = joinpath(tmp_data_dir, "old_header", "rosenbrock_sparse.md")
        mkpath(dirname(old_md))
        write(old_md, replace(md_text, "**Dependency Commits**: " => "**Dependency Commits**: BlockLinearSystems d38552c, "))
        @test occursin("BlockLinearSystems d38552c", read(old_md, String))
        loaded_old = load_problem_markdown(old_md)
        @test loaded_old.problem == loaded.problem
        @test loaded_old.sizes == loaded.sizes
        @test loaded_old.category == loaded.category
        for (sr_new, sr_old) in zip(loaded.size_results, loaded_old.size_results)
            @test keys(sr_old.optimizer_results) == keys(sr_new.optimizer_results)
            @test keys(sr_old.model_results) == keys(sr_new.model_results)
        end
        rm(tmp_data_dir; recursive=true, force=true)

        # Test Plotting Pipeline
        tmp_plot_dir = mktempdir()
        m_plot = plot_model_scaling(scaling_res; outdir=tmp_plot_dir)
        o_plot = plot_optimizer_scaling(scaling_res; outdir=tmp_plot_dir)
        @test isfile(m_plot)
        @test isfile(o_plot)
        rm(tmp_plot_dir; recursive=true, force=true)

        # The single-threaded table: its own folder under the data folder, 1 thread in its header, ignored when the
        # threaded folder is loaded
        @test dirname(SINGLE_THREADED_DATA_DIR) == DEFAULT_DATA_DIR
        @test dirname(SINGLE_THREADED_PLOTS_DIR) == DEFAULT_PLOTS_DIR
        tmp_root = mktempdir()
        st_dir = joinpath(tmp_root, "single_threaded")
        run_scaling_benchmark(prob; sizes=Any[4], samples=1, data_dir=tmp_root)
        st_res = run_scaling_benchmark(prob; sizes=Any[4], samples=1, data_dir=st_dir, numthreads=1, blas_threads=1)
        @test occursin("**Threads**: NLLSModel numthreads=1, Julia threads=$(Threads.nthreads()), BLAS threads=1", read(joinpath(st_dir, "rosenbrock_sparse.md"), String))
        @test length(load_all_problem_markdown(tmp_root)) == 1
        st_plot = plot_optimizer_scaling(st_res; outdir=joinpath(tmp_root, "plots"), title_suffix=" (1 thread)")
        @test isfile(st_plot)
        set_benchmark_threads!()
        rm(tmp_root; recursive=true, force=true)
    end

    @testset "NLPModels Evaluation Recomputation and Cache Invalidation" begin
        prob = create_rosenbrock_sparse_problem()
        models = prob.generate_models(16)
        nlp_m = first(filter(m -> occursin("NLPModels", m.name), models))
        nls = nlp_m.model

        # Ensure cost evaluation computes finite cost
        cost1 = nlp_m.eval_cost()
        @test isfinite(cost1)

        # reset_nlp_cache! sets last_x back to NaN
        reset_nlp_cache!(nls)
        if hasproperty(nls, :ceval) && hasproperty(nls.ceval, :backend)
            @test any(isnan, nls.ceval.backend.last_x)
        end

        # eval_cost recomputes and returns consistent cost
        cost2 = nlp_m.eval_cost()
        @test isapprox(cost1, cost2)

        # run_model_benchmarks accurately measures recomputed cost
        res = run_model_benchmarks([nlp_m]; samples=3)
        @test res[nlp_m.name].cost_time_ns > 0
    end
end
