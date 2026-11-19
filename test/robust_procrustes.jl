using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

@testset "Robust Procrustes: the first-order Huber kernel (IT3)" begin
    SOB = SmoothOptimizerBenchmark
    # HuberKernel, not Huber2oKernel: no second-order term in the Gauss–Newton Hessian
    k = SOB.procrustes_huber_kernel
    @test k == SOB.NLLSModel.HuberKernel(SOB.PROCRUSTES_HUBER_WIDTH)
    @test k != SOB.NLLSModel.Huber2oKernel(SOB.PROCRUSTES_HUBER_WIDTH)
    @test SOB.NLLSModel.robustifydcost(k, 1.0)[3] == 0

    # The three SecondOrderOptimization rows still reach Manopt's cost at d = 3 and 4, through the harness; Manopt, which
    # stops on its gradient norm about 1e-8 relative above them, is ok under the cost test's 1e-4
    prob = create_robust_procrustes_problem()
    for d in (3, 4)
        models = prob.generate_models(d)
        std = get_standard_optimizer_model(models)
        rows = run_optimizer_benchmarks(prob.compatible_optimizers, std; all_models=models, samples=1)
        manopt = rows["Manopt (LevenbergMarquardt)"]
        @test manopt.status === :ok
        for name in ("SecondOrderOptimization (LM)", "SecondOrderOptimization (LM, tall)", "SecondOrderOptimization (Dogleg)")
            @test rows[name].status === :ok
            @test isapprox(rows[name].final_cost, manopt.final_cost; rtol=1e-8, atol=SOB.DEFAULT_FTOL * manopt.start_cost)
        end
    end
end
