using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# Bytes allocated by a cost's residual and its residual and Jacobian, after a warm-up call, each behind a function barrier
# with concrete arguments (a closure capturing a variable assigned twice boxes it, and on Julia 1.10 a Vararg barrier is
# not specialized and boxes the returned tuple: both are the test's allocations)
cnd_allocated_res(c, x) = (SmoothOptimizerBenchmark.NLLSModel.computeresidual(c, x); @allocated SmoothOptimizerBenchmark.NLLSModel.computeresidual(c, x))
cnd_allocated_resjac(c, x) = (SmoothOptimizerBenchmark.NLLSModel.computeresjac(SmoothOptimizerBenchmark.static(1), c, x);
                              @allocated SmoothOptimizerBenchmark.NLLSModel.computeresjac(SmoothOptimizerBenchmark.static(1), c, x))
cnd_rel(a, b) = SmoothOptimizerBenchmark.norm(a - b) / max(SmoothOptimizerBenchmark.norm(b), floatmin())

# The Dense Conditioning Sweep (CN11): a matrix of prescribed singular values from two orthonormal cosine bases, a mild
# nonlinearity, and a stated solution
@testset "Dense Conditioning Sweep (CN11)" begin
    SB = SmoothOptimizerBenchmark
    NL = SB.NLLSModel
    prob = create_dense_conditioning_problem()
    @test prob.default_sizes == Any[10.0^k for k in 0:12]
    @test all(κ -> κ isa Float64, prob.default_sizes)
    # U (M × N) and V (N × N) have orthonormal columns, so cond(A) is κ
    U, V = SB.cosine_basis(SB.DENSE_CONDITIONING_M, SB.DENSE_CONDITIONING_N), SB.cosine_basis(SB.DENSE_CONDITIONING_N, SB.DENSE_CONDITIONING_N)
    @test SB.opnorm(U' * U - SB.I) <= 1e-12
    @test SB.opnorm(V' * V - SB.I) <= 1e-12
    σ = SB.svdvals(SB.dense_conditioning_matrix(1e6))
    @test σ[1] ≈ 1 rtol=1e-10
    @test σ[1] / σ[end] ≈ 1e6 rtol=1e-6
    # The cost at the stated solution is below 1e-20 times the start's at every κ
    xstar = SB.dense_conditioning_solution()
    for κ in prob.default_sizes
        @test prob.reference_solution(κ) == xstar
        ev = SB.point_evaluator(get_standard_optimizer_model(prob.generate_models(κ)))
        @test ev.cost(xstar) < 1e-20 * ev.cost(ev.x0)
    end
    # The three models agree, at κ = 1 and 1e6, at the start and at a perturbed point: NLLSModel's residuals and Jacobian
    # with the Standalone model's, and JuMP's cost and gradient with them
    for κ in (1.0, 1e6)
        models = prob.generate_models(κ)
        nl = only(filter(m -> m.name == "NLLSModel", models)).model
        sa = only(filter(m -> m.name == "Standalone", models)).model
        jm = only(filter(m -> m.name == "JuMP", models)).model
        cb = NL.nls_callbacks(deepcopy(nl); numthreads=SB.static(1))
        r1, J1 = zeros(cb.nequ), copy(cb.J0)
        r2, J2 = zeros(length(sa.y)), copy(sa.J)
        g = zeros(SB.DENSE_CONDITIONING_N)
        @test jm.meta.x0 == sa.x == SB.soo_solution(nl)
        for x in (copy(sa.x), sa.x .+ 0.1 .* randn(SB.MersenneTwister(3), length(sa.x)))
            cb.res!(r1, x); cb.jac!(J1, x)
            sa.f!(r2, x); sa.g!(J2, x)
            @test cnd_rel(r1, r2) <= 1e-12
            @test cnd_rel(Matrix(J1), J2) <= 1e-12
            @test cnd_rel(SB.NLPModels.obj(jm, x), 0.5 * sum(abs2, r2)) <= 1e-10
            @test cnd_rel(SB.NLPModels.grad!(jm, x, g), J2' * r2) <= 1e-10
        end
        # The hand-written Jacobian against central differences
        c = first(nl.costs[SB.DenseConditioningResidual])
        x = collect(range(-1, 1; length=SB.DENSE_CONDITIONING_N))
        r0, J = map(copy, NL.computeresjac(SB.static(1), c, x))
        h = 1e-6
        Jfd = reduce(hcat, [(copy(NL.computeresidual(c, x + h * (1:length(x) .== k))) -
                             copy(NL.computeresidual(c, x - h * (1:length(x) .== k)))) / 2h for k in eachindex(x)])
        @test cnd_rel(J, Jfd) <= 1e-7
        @test r0 ≈ NL.computeresidual(c, x)
        # A cost allocates nothing after warm-up
        @test cnd_allocated_res(c, x) == 0
        @test cnd_allocated_resjac(c, x) == 0
    end
end
