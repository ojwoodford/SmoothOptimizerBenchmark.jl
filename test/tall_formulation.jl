using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Tall formulation (N1, N2, N5)" begin
    # N5: the tall and normal rows reach the same cost on the well-conditioned dense problems
    tall = soo_tall_optimizer()
    @test tall.name == "SecondOrderOptimization (LM, tall)"
    normal_lm(m) = optimize_soo(m; method=:lm)
    for (prob, sz) in ((create_curve_fitting_problem(), 256), (create_rosenbrock_dense_problem(), 8), (create_robust_procrustes_problem(), 4), (create_multilateration_problem(), 8), (create_robust_curve_fitting_problem(), 256))
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

    # T1: the tall row on the sparse problems, at their smallest and largest sizes. NLLSModel's storage = :auto stores J
    # from its fill: sparse at the largest size; at the smallest it may be dense. Costs agree to rtol = 1e-8, with an
    # absolute floor of ftol times the start cost, since ODE BVP and sparse Rosenbrock are zero-residual problems whose
    # final costs are rounding (rules.md 31)
    # ET1: at the largest size only the prototype's type is checked, on the NLLSModel model built alone (the builder that
    # generate_models calls), with no solve; the sparse tall solve itself is U1's test below (max_dense_bytes = 8)
    for (prob, build_nlls) in ((create_pose_chain_problem(), SmoothOptimizerBenchmark.build_chain_nlls),
                               (create_rosenbrock_sparse_problem(), SmoothOptimizerBenchmark.build_sparse_nlls),
                               (create_ode_bvp_problem(), SmoothOptimizerBenchmark.build_sparse_ode_bvp_nlls))
        @test any(o -> o.name == tall.name, prob.compatible_optimizers)
        sz = first(prob.default_sizes)
        models = prob.generate_models(sz)
        md = SmoothOptimizerBenchmark.resolve_optimizer_model(tall, get_standard_optimizer_model(models, prob.category), models)
        @test md.model isa SmoothOptimizerBenchmark.NLLSModel.Model
        r_tall = tall.optimize(md)
        r_norm = normal_lm(md)
        @test r_tall.status === :ok && r_tall.converged
        @test r_norm.status === :ok
        @test isapprox(r_tall.final_cost, r_norm.final_cost; rtol=1e-8, atol=SmoothOptimizerBenchmark.DEFAULT_FTOL * r_norm.start_cost)
        J_largest = last(SmoothOptimizerBenchmark.NLLSModel.optimvars_nls(build_nlls(last(prob.default_sizes))))
        @test J_largest isa SmoothOptimizerBenchmark.SparseMatrixCSC
    end

    # T2: bundle adjustment on the tall path with QR elimination, beside the normal Schur rows. At the smallest size it
    # converges to the normal Schur LM row's cost, with the reduced system stored as storage = :auto chooses (the published
    # row) and sparse (forced); the synthetic problem is zero-residual, so the same absolute floor as T1. ET2: :auto
    # resolves to the dense reduced system at these sizes, so :dense is checked by its prototype's type, the same as
    # :auto's, without a second solve; the second size ran the same compiled code and is not run
    ba = create_bundle_adjustment_problem()
    ba_tall = only(filter(o -> o.name == tall.name, ba.compatible_optimizers))
    ba_lm = only(filter(o -> o.name == "SecondOrderOptimization (LM)", ba.compatible_optimizers))
    models = ba.generate_models(first(ba.default_sizes))
    target = get_standard_optimizer_model(models, ba.category)
    md = SmoothOptimizerBenchmark.resolve_optimizer_model(ba_tall, target, models)
    @test md.model isa SmoothOptimizerBenchmark.NLLSModel.Model
    @test SmoothOptimizerBenchmark.resolve_optimizer_model(ba_lm, target, models) === md
    r_norm = ba_lm.optimize(md)
    @test r_norm.status === :ok
    ba_proto(storage) = last(SmoothOptimizerBenchmark.NLLSModel.optimvars_nls(md.model; reduction=:eliminate, storage))
    J_auto, J_dense, J_sparse = ba_proto(:auto), ba_proto(:dense), ba_proto(:sparse)
    # BlockLinearSystems is not a dependency of this package (D4), so the prototype's type is checked by name
    @test all(J -> nameof(typeof(J)) === :SchurBlockJacobian, (J_auto, J_dense, J_sparse))
    @test typeof(J_dense).parameters[2] === Matrix{Float64}
    @test typeof(J_auto) === typeof(J_dense)
    @test typeof(J_sparse).parameters[2] <: SmoothOptimizerBenchmark.SparseMatrixCSC
    for storage in (:auto, :sparse)
        r_tall = ba_tall.optimize(md; storage)
        @test r_tall.status === :ok && r_tall.converged
        @test isapprox(r_tall.final_cost, r_norm.final_cost; rtol=1e-8, atol=SmoothOptimizerBenchmark.DEFAULT_FTOL * r_norm.start_cost)
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
