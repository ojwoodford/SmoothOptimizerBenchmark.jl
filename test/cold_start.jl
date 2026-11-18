using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

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
