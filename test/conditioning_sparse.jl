using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

csp_rel(a, b) = SmoothOptimizerBenchmark.norm(a - b) / max(SmoothOptimizerBenchmark.norm(b), floatmin())

# The Sparse Conditioning Sweep (CN12): a symmetric tridiagonal Jacobian whose spectrum lies in [1/κ, 1], from a diffusion
# weight α and a scale s set by κ, and a stated solution
@testset "Sparse Conditioning Sweep (CN12)" begin
    SB = SmoothOptimizerBenchmark
    NL = SB.NLLSModel
    prob = create_sparse_conditioning_problem()
    @test prob.default_sizes == Any[1e1, 3e1, 1e2, 3e2, 1e3, 3e3, 1e4, 3e4, 1e5, 3e5, 1e6, 3e6, 1e7, 3e7, 1e8]
    N = SB.SPARSE_CONDITIONING_N
    # α and s: the bounds of J's spectrum, s(αλ₁ + 0.9) and s(4α + 1.1), are 1/κ and 1
    λ1 = 4 * sin(pi / (2 * (N + 1)))^2
    for κ in (10.0, 1e4, 1e8)
        α, s = SB.sparse_conditioning_coefficients(κ)
        @test s * (α * λ1 + 0.9) ≈ 1 / κ rtol=1e-10
        @test s * (4α + 1.1) ≈ 1 rtol=1e-12
    end
    @test_throws ArgumentError SB.sparse_conditioning_coefficients(1e9)
    # The stated solution: a smooth part and an alternating part
    ustar = SB.sparse_conditioning_solution()
    @test length(ustar) == N && ustar[1] ≈ sin(3pi / (N + 1)) - 0.5 && ustar[2] ≈ sin(6pi / (N + 1)) + 0.5
    # The cost at the stated solution is below 1e-20 times the start's at every κ
    for κ in prob.default_sizes
        @test prob.reference_solution(κ) == ustar
        ev = SB.point_evaluator(get_standard_optimizer_model(prob.generate_models(κ)))
        @test ev.cost(ustar) < 1e-20 * ev.cost(ev.x0)
    end
    # The three models agree at κ = 10 and 1e4, at the start and at a perturbed point: NLLSModel's residuals and Jacobian
    # with the Standalone model's (as sets of rows: the Standalone model lists the two boundary costs first), and JuMP's
    # cost and gradient with them
    for κ in (10.0, 1e4)
        models = prob.generate_models(κ)
        nl = only(filter(m -> m.name == "NLLSModel (Sparse)", models)).model
        sa = only(filter(m -> m.name == "Standalone (Sparse)", models)).model
        jm = only(filter(m -> m.name == "JuMP", models)).model
        cb = NL.nls_callbacks(deepcopy(nl); numthreads=SB.static(1))
        r1, J1 = zeros(cb.nequ), copy(cb.J0)
        r2, J2 = zeros(length(sa.y)), copy(sa.J)
        g = zeros(N)
        @test jm.meta.x0 == sa.x == SB.soo_solution(nl)
        for x in (copy(sa.x), sa.x .+ 0.1 .* randn(SB.MersenneTwister(5), N))
            cb.res!(r1, x); cb.jac!(J1, x)
            sa.f!(r2, x); sa.g!(J2, x)
            @test csp_rel(sort(r1), sort(r2)) <= 1e-12
            @test csp_rel(Matrix(J1' * J1), Matrix(J2' * J2)) <= 1e-12
            @test csp_rel(J1' * r1, J2' * r2) <= 1e-12
            @test csp_rel(SB.NLPModels.obj(jm, x), 0.5 * sum(abs2, r2)) <= 1e-10
            @test csp_rel(SB.NLPModels.grad!(jm, x, g), J2' * r2) <= 1e-10
        end
    end
end
