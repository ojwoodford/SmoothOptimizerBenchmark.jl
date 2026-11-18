using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# Bytes allocated by a call of `f()`, after a warm-up call. Measured behind this function barrier: at a testset's top-level
# scope Julia 1.10 boxes the returned value (32 bytes for a linear-system closure's tuple), which is the test's
# allocation, not the closure's
allocated_bytes(f) = (f(); @allocated f())

@testset "Single-variable NLLSModel rows use the linear system's own buffer types (M18)" begin
    set_benchmark_threads!(; numthreads=1, blas_threads=1)
    # Curve fitting: one SVector{3} variable, so a static system; its g and H are an MVector and an MMatrix, and an
    # fdf! call writes straight into them without allocating
    cf = first(filter(m -> occursin("nllsmodel", lowercase(m.name)), create_curve_fitting_problem().generate_models(16)))
    linsys = cf.eval_cost_and_linear_system
    @test linsys.g_nlls isa SmoothOptimizerBenchmark.MVector{3, Float64}
    @test linsys.H_nlls isa SmoothOptimizerBenchmark.MMatrix{3, 3, Float64, 9}
    @test allocated_bytes(linsys) == 0
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
    # P1: multilateration's one SVector{d} variable gives a static d × d system at every size of its sweep
    for d in (2, 8, 16)
        ml = only(filter(m -> m.name == "NLLSModel (Static)", create_multilateration_problem().generate_models(d)))
        ml_linsys = ml.eval_cost_and_linear_system
        @test ml_linsys.g_nlls isa SmoothOptimizerBenchmark.MVector{d, Float64}
        @test ml_linsys.H_nlls isa SmoothOptimizerBenchmark.MMatrix{d, d, Float64, d * d}
        @test allocated_bytes(ml_linsys) == 0
    end
    # P2: robust curve fitting's Model 1, with the kernel declared, has the same static system
    rcf = only(filter(m -> m.name == "NLLSModel (Static)", create_robust_curve_fitting_problem().generate_models(16)))
    rcf_linsys = rcf.eval_cost_and_linear_system
    @test rcf_linsys.g_nlls isa SmoothOptimizerBenchmark.MVector{3, Float64}
    @test rcf_linsys.H_nlls isa SmoothOptimizerBenchmark.MMatrix{3, 3, Float64, 9}
    @test allocated_bytes(rcf_linsys) == 0
    set_benchmark_threads!()
end
