module SmoothOptimizerBenchmark

using BenchmarkTools
using Static
using StaticArrays
using LinearAlgebra
using Random
using SecondOrderOptimization
using NLLSModels
using NLLSsolver
using Optim
using LeastSquaresOptim
using NLPModels

include("adapters.jl")

export run_all_benchmarks
export benchmark_rosenbrock, benchmark_exponential, benchmark_chain, benchmark_bundle_adjustment

# ==============================================================================
# Task 1: 2D Rosenbrock (Static SVector{2, Float64})
# ==============================================================================

function rosenbrock_cost(x)
    return (1.0 - x[1])^2 + 100.0 * (x[2] - x[1]^2)^2
end

function rosenbrock_fdf!(g, H, x)
    g[1] = -2.0 * (1.0 - x[1]) - 400.0 * x[1] * (x[2] - x[1]^2)
    g[2] = 200.0 * (x[2] - x[1]^2)
    H[1, 1] = 2.0 - 400.0 * x[2] + 1200.0 * x[1]^2
    H[1, 2] = -400.0 * x[1]
    H[2, 1] = -400.0 * x[1]
    H[2, 2] = 200.0
    return rosenbrock_cost(x)
end

function optim_g!(G, x)
    G[1] = -2.0 * (1.0 - x[1]) - 400.0 * x[1] * (x[2] - x[1]^2)
    G[2] = 200.0 * (x[2] - x[1]^2)
end

function optim_h!(H, x)
    H[1, 1] = 2.0 - 400.0 * x[2] + 1200.0 * x[1]^2
    H[1, 2] = -400.0 * x[1]
    H[2, 1] = -400.0 * x[1]
    H[2, 2] = 200.0
end

function rosenbrock_residuals!(r, x)
    r[1] = 1.0 - x[1]
    r[2] = 10.0 * (x[2] - x[1]^2)
    return r
end

function rosenbrock_jacobian!(J, x)
    J[1, 1] = -1.0
    J[1, 2] = 0.0
    J[2, 1] = -20.0 * x[1]
    J[2, 2] = 10.0
    return J
end

function benchmark_rosenbrock()
    println("\n[Task 1] 2D Rosenbrock (Static SVector{2, Float64})")

    x0_static = SVector(-1.2, 1.0)
    x0_vec = [-1.2, 1.0]

    opt_dogleg = OptimizationOptions(iterator = :dogleg)
    opt_lm = OptimizationOptions(iterator = :levenbergmarquardt)

    ws_dogleg = OptimizationWorkspace(rosenbrock_cost, rosenbrock_fdf!, x0_static, opt_dogleg)
    ws_lm = OptimizationWorkspace(rosenbrock_cost, rosenbrock_fdf!, x0_static, opt_lm)

    # Warmup
    SecondOrderOptimization.optimize(rosenbrock_cost, rosenbrock_fdf!, x0_static, opt_dogleg; workspace = ws_dogleg)
    SecondOrderOptimization.optimize(rosenbrock_cost, rosenbrock_fdf!, x0_static, opt_lm; workspace = ws_lm)

    # Benchmarks
    t_soo_dl = @benchmark SecondOrderOptimization.optimize($rosenbrock_cost, $rosenbrock_fdf!, $x0_static, $opt_dogleg; workspace = $ws_dogleg)
    t_soo_lm = @benchmark SecondOrderOptimization.optimize($rosenbrock_cost, $rosenbrock_fdf!, $x0_static, $opt_lm; workspace = $ws_lm)
    t_optim_tr = @benchmark Optim.optimize($rosenbrock_cost, $optim_g!, $optim_h!, $x0_vec, NewtonTrustRegion())
    t_optim_newton = @benchmark Optim.optimize($rosenbrock_cost, $optim_g!, $optim_h!, $x0_vec, Newton())
    t_lso_dl = @benchmark LeastSquaresOptim.optimize!(lsp, LeastSquaresOptim.Dogleg()) setup=(lsp = LeastSquaresProblem(x = copy($x0_vec), f! = $rosenbrock_residuals!, g! = $rosenbrock_jacobian!, output_length = 2)) evals=1
    t_lso_lm = @benchmark LeastSquaresOptim.optimize!(lsp, LeastSquaresOptim.LevenbergMarquardt()) setup=(lsp = LeastSquaresProblem(x = copy($x0_vec), f! = $rosenbrock_residuals!, g! = $rosenbrock_jacobian!, output_length = 2)) evals=1

    println("Task 1 Results (Rosenbrock 2D):")
    println("  • SecondOrderOptimization (Dogleg):   $(round(median(t_soo_dl).time/1e3, digits=2)) μs, $(t_soo_dl.allocs) allocs ($(t_soo_dl.memory) bytes)")
    println("  • SecondOrderOptimization (LM):       $(round(median(t_soo_lm).time/1e3, digits=2)) μs, $(t_soo_lm.allocs) allocs ($(t_soo_lm.memory) bytes)")
    println("  • Optim.jl (NewtonTrustRegion):       $(round(median(t_optim_tr).time/1e3, digits=2)) μs, $(t_optim_tr.allocs) allocs ($(t_optim_tr.memory) bytes)")
    println("  • Optim.jl (Newton):                  $(round(median(t_optim_newton).time/1e3, digits=2)) μs, $(t_optim_newton.allocs) allocs ($(t_optim_newton.memory) bytes)")
    println("  • LeastSquaresOptim.jl (Dogleg):      $(round(median(t_lso_dl).time/1e3, digits=2)) μs, $(t_lso_dl.allocs) allocs ($(t_lso_dl.memory) bytes)")
    println("  • LeastSquaresOptim.jl (LM):          $(round(median(t_lso_lm).time/1e3, digits=2)) μs, $(t_lso_lm.allocs) allocs ($(t_lso_lm.memory) bytes)")

    return (soo_dl=t_soo_dl, soo_lm=t_soo_lm, optim_tr=t_optim_tr, optim_newton=t_optim_newton, lso_dl=t_lso_dl, lso_lm=t_lso_lm)
end

# ==============================================================================
# Task 2: 20-Point Exponential Curve Fitting
# ==============================================================================

struct ExpResidual <: AbstractResidual
    t::Float64
    y::Float64
end
NLLSModels.ndeps(::ExpResidual) = static(1)
NLLSModels.nres(::ExpResidual) = static(1)
NLLSModels.varindices(::ExpResidual) = SVector(1)
NLLSModels.getvars(::ExpResidual, vars::Vector) = (vars[1]::SVector{3, Float64},)
NLLSModels.computeresidual(res::ExpResidual, p) = SVector(p[1] * exp(-p[2] * res.t) + p[3] - res.y)
Base.eltype(::ExpResidual) = Float64

function benchmark_exponential()
    println("\n[Task 2] 20-Point Exponential Curve Fitting: y = a * exp(-b * t) + c")

    rng = MersenneTwister(42)
    t_pts = SVector{20, Float64}(range(0.0, 2.0, length=20))
    a_true, b_true, c_true = 2.0, 1.5, 0.5
    y_data = SVector{20, Float64}([a_true * exp(-b_true * t) + c_true + 0.02 * randn(rng) for t in t_pts])

    p0_static = SVector(1.0, 1.0, 1.0)
    p0_vec = [1.0, 1.0, 1.0]
    opt_dogleg = OptimizationOptions(iterator = :dogleg, numthreads = static(1))

    # NLLSModels setup
    prob_exp = NLLSProblem(SVector{3, Float64}, ExpResidual)
    addvariable!(prob_exp, p0_static)
    for i in 1:20
        addcost!(prob_exp, ExpResidual(t_pts[i], y_data[i]))
    end
    cache_exp = OptimizeCache(prob_exp, opt_dogleg, 1)
    NLLSsolver.optimize!(prob_exp, opt_dogleg, 1, nullcallback, cache_exp)

    t_nlls_cold = @benchmark NLLSsolver.optimize!(p, $opt_dogleg) setup=(p = deepcopy($prob_exp); p.variables[1] = $p0_static) evals=1
    t_nlls_warm = @benchmark NLLSsolver.optimize!($prob_exp, $opt_dogleg, 1, $nullcallback, $cache_exp) setup=($prob_exp.variables[1] = $p0_static) evals=1

    # LeastSquaresOptim with in-place residual and Jacobian
    function exp_residuals!(r, p)
        @inbounds for i in 1:20
            r[i] = p[1] * exp(-p[2] * t_pts[i]) + p[3] - y_data[i]
        end
        return r
    end
    function exp_jacobian!(J, p)
        @inbounds for i in 1:20
            e = exp(-p[2] * t_pts[i])
            J[i, 1] = e
            J[i, 2] = -p[1] * t_pts[i] * e
            J[i, 3] = 1.0
        end
        return J
    end
    t_lso_exp = @benchmark LeastSquaresOptim.optimize!(lsp, LeastSquaresOptim.Dogleg()) setup=(lsp = LeastSquaresProblem(x = copy($p0_vec), f! = $exp_residuals!, g! = $exp_jacobian!, output_length = 20)) evals=1

    println("Task 2 Results (Exponential Curve Fitting):")
    println("  • NLLSModels.jl (Dogleg, cold):       $(round(median(t_nlls_cold).time/1e3, digits=2)) μs, $(t_nlls_cold.allocs) allocs ($(t_nlls_cold.memory) bytes)")
    println("  • NLLSModels.jl (Dogleg, cached):     $(round(median(t_nlls_warm).time/1e3, digits=2)) μs, $(t_nlls_warm.allocs) allocs ($(t_nlls_warm.memory) bytes)")
    println("  • LeastSquaresOptim.jl (Dogleg):      $(round(median(t_lso_exp).time/1e3, digits=2)) μs, $(t_lso_exp.allocs) allocs ($(t_lso_exp.memory) bytes)")

    return (nlls_cold=t_nlls_cold, nlls_warm=t_nlls_warm, lso=t_lso_exp)
end

# ==============================================================================
# Task 3: Sparse 3D Chain (60 variables, 20 poses)
# ==============================================================================

struct BenchChainLink <: AbstractResidual
    offset::SVector{3, Float64}
    varind::SVector{2, Int}
end
NLLSModels.ndeps(::BenchChainLink) = static(2)
NLLSModels.nres(::BenchChainLink) = static(3)
NLLSModels.varindices(r::BenchChainLink) = r.varind
NLLSModels.getvars(r::BenchChainLink, vars::Vector) = (vars[r.varind[1]]::SVector{3, Float64}, vars[r.varind[2]]::SVector{3, Float64})
NLLSModels.computeresidual(r::BenchChainLink, a, b) = b - a - r.offset + 0.1 * sin.(a)
Base.eltype(::BenchChainLink) = Float64

struct BenchChainAnchor <: AbstractResidual end
NLLSModels.ndeps(::BenchChainAnchor) = static(1)
NLLSModels.nres(::BenchChainAnchor) = static(3)
NLLSModels.varindices(::BenchChainAnchor) = SVector(1)
NLLSModels.getvars(::BenchChainAnchor, vars::Vector) = (vars[1]::SVector{3, Float64},)
NLLSModels.computeresidual(::BenchChainAnchor, a) = a
Base.eltype(::BenchChainAnchor) = Float64

function benchmark_chain()
    println("\n[Task 3] Nonlinear Sparse 3D Chain (20 poses × 3D = 60 variables, Block Tridiagonal)")

    start_vars = [SVector(0.1 * i, sin(i + 1), cos(i)) for i in 1:20]
    chain_prob = NLLSProblem(SVector{3, Float64}, Union{BenchChainLink, BenchChainAnchor})
    for v in start_vars
        addvariable!(chain_prob, v)
    end
    addcost!(chain_prob, BenchChainAnchor())
    for i in 1:19
        addcost!(chain_prob, BenchChainLink(SVector(1.0, 0.5 * sin(i), 0.2), SVector(i, i + 1)))
    end

    opt_sparse = OptimizationOptions(iterator = :levenbergmarquardt, linsolver = :ldl, numthreads = static(1))
    cache_chain = OptimizeCache(chain_prob, opt_sparse)
    NLLSsolver.optimize!(chain_prob, opt_sparse, nothing, nullcallback, cache_chain)

    t_chain_cold = @benchmark NLLSsolver.optimize!(p, $opt_sparse) setup=(p = deepcopy($chain_prob); p.variables .= $start_vars) evals=1
    t_chain_warm = @benchmark NLLSsolver.optimize!($chain_prob, $opt_sparse, nothing, $nullcallback, $cache_chain) setup=($chain_prob.variables .= $start_vars) evals=1

    println("Task 3 Results (Sparse 3D Chain):")
    println("  • NLLSModels.jl (Sparse LM, cold):    $(round(median(t_chain_cold).time/1e3, digits=2)) μs, $(t_chain_cold.allocs) allocs ($(t_chain_cold.memory) bytes)")
    println("  • NLLSModels.jl (Sparse LM, cached):  $(round(median(t_chain_warm).time/1e3, digits=2)) μs, $(t_chain_warm.allocs) allocs ($(t_chain_warm.memory) bytes)")

    return (nlls_chain_cold=t_chain_cold, nlls_chain_warm=t_chain_warm)
end

# ==============================================================================
# Task 4: Sparse Bundle Adjustment (10 cameras, 50 points = 210 DoF)
# ==============================================================================

NLLSModels.generatemeasurement(pose::SVector{6, T}, X::SVector{3, U}) where {T, U} = SVector(dot(@inbounds(view(pose, StaticArrays.SUnitRange(1, 3))), X), dot(@inbounds(view(pose, StaticArrays.SUnitRange(4, 6))), X))

function benchmark_bundle_adjustment()
    println("\n[Task 4] Sparse Bundle Adjustment (10 cameras, 50 points, 30% visibility)")

    rng = MersenneTwister(42)
    ba_prob = NLLSProblem(Union{SVector{6, Float64}, SVector{3, Float64}}, SimpleError2{2, Float64, SVector{6, Float64}, SVector{3, Float64}})
    ncameras = 10
    nlandmarks = 50
    propvisible = 0.3

    camoffset = SVector(1.0, 0.0, 0.0, 0.0, 1.0, 0.0)
    for i in 1:ncameras
        addvariable!(ba_prob, randn(rng, SVector{6, Float64}) .+ camoffset)
    end
    lmoffset = SVector(-0.5, -0.5, 10.0)
    for j in 1:nlandmarks
        addvariable!(ba_prob, rand(rng, SVector{3, Float64}) .+ lmoffset)
    end

    visibility = abs.(repeat(vec(1:ncameras), outer=(1, nlandmarks)) .- LinRange(2, ncameras - 1, nlandmarks)')
    visibility = visibility .<= sort(vec(visibility))[Int(ceil(length(visibility) * propvisible))]
    for camind in 1:ncameras
        camera = ba_prob.variables[camind]::SVector{6, Float64}
        for (landmark, tf) in enumerate(view(visibility, camind, :)')
            if tf
                landmarkind = landmark + ncameras
                meas = generatemeasurement(camera, ba_prob.variables[landmarkind]::SVector{3, Float64})
                addcost!(ba_prob, SimpleError2{SVector{6, Float64}, SVector{3, Float64}}(meas, camind, landmarkind))
            end
        end
    end

    # Perturb starting variables
    start_vars = copy(ba_prob.variables)
    for ind in eachindex(start_vars)
        if start_vars[ind] isa SVector{3, Float64}
            start_vars[ind] = start_vars[ind]::SVector{3, Float64} + randn(rng, SVector{3, Float64}) * 0.001
        else
            start_vars[ind] = start_vars[ind]::SVector{6, Float64} + randn(rng, SVector{6, Float64}) * 0.001
        end
    end
    ba_prob.variables .= start_vars

    opt_ba_lm = OptimizationOptions(iterator = :levenbergmarquardt, linsolver = :ldl, numthreads = static(1))
    opt_ba_dtd = OptimizationOptions(iterator = :levenbergmarquardt_dtd, linsolver = :ldl, numthreads = static(1))
    opt_ba_dl = OptimizationOptions(iterator = :dogleg, linsolver = :ldl, numthreads = static(1))

    cache_lm = OptimizeCache(ba_prob, opt_ba_lm)
    cache_dtd = OptimizeCache(ba_prob, opt_ba_dtd)
    cache_dl = OptimizeCache(ba_prob, opt_ba_dl)

    # Warmup
    NLLSsolver.optimize!(ba_prob, opt_ba_lm, nothing, nullcallback, cache_lm)
    ba_prob.variables .= start_vars
    NLLSsolver.optimize!(ba_prob, opt_ba_dtd, nothing, nullcallback, cache_dtd)
    ba_prob.variables .= start_vars
    NLLSsolver.optimize!(ba_prob, opt_ba_dl, nothing, nullcallback, cache_dl)

    t_ba_lm_cold = @benchmark NLLSsolver.optimize!(p, $opt_ba_lm) setup=(p = deepcopy($ba_prob); p.variables .= $start_vars) samples=10 evals=1
    t_ba_lm_warm = @benchmark NLLSsolver.optimize!($ba_prob, $opt_ba_lm, nothing, $nullcallback, $cache_lm) setup=($ba_prob.variables .= $start_vars) samples=10 evals=1
    t_ba_dtd_warm = @benchmark NLLSsolver.optimize!($ba_prob, $opt_ba_dtd, nothing, $nullcallback, $cache_dtd) setup=($ba_prob.variables .= $start_vars) samples=10 evals=1
    t_ba_dl_warm = @benchmark NLLSsolver.optimize!($ba_prob, $opt_ba_dl, nothing, $nullcallback, $cache_dl) setup=($ba_prob.variables .= $start_vars) samples=10 evals=1
    t_ba_singles = @benchmark NLLSsolver.optimizesingles!($ba_prob, $opt_ba_lm, SVector{3, Float64}) setup=($ba_prob.variables .= $start_vars) samples=10 evals=1

    println("Task 4 Results (Bundle Adjustment):")
    println("  • NLLSModels.jl (Sparse LM, cold):    $(round(median(t_ba_lm_cold).time/1e3, digits=2)) μs, $(t_ba_lm_cold.allocs) allocs ($(t_ba_lm_cold.memory) bytes)")
    println("  • NLLSModels.jl (Sparse LM, cached):  $(round(median(t_ba_lm_warm).time/1e3, digits=2)) μs, $(t_ba_lm_warm.allocs) allocs ($(t_ba_lm_warm.memory) bytes)")
    println("  • NLLSModels.jl (Sparse DTD, cached): $(round(median(t_ba_dtd_warm).time/1e3, digits=2)) μs, $(t_ba_dtd_warm.allocs) allocs ($(t_ba_dtd_warm.memory) bytes)")
    println("  • NLLSModels.jl (Sparse DL, cached):  $(round(median(t_ba_dl_warm).time/1e3, digits=2)) μs, $(t_ba_dl_warm.allocs) allocs ($(t_ba_dl_warm.memory) bytes)")
    println("  • NLLSModels.jl (Landmarks singles):  $(round(median(t_ba_singles).time/1e3, digits=2)) μs, $(t_ba_singles.allocs) allocs ($(t_ba_singles.memory) bytes)")

    return (lm_cold=t_ba_lm_cold, lm_warm=t_ba_lm_warm, dtd_warm=t_ba_dtd_warm, dl_warm=t_ba_dl_warm, singles=t_ba_singles)
end

function run_all_benchmarks()
    println("=" ^ 80)
    println("SMOOTH OPTIMIZER BENCHMARK SUITE")
    println("=" ^ 80)

    res1 = benchmark_rosenbrock()
    res2 = benchmark_exponential()
    res3 = benchmark_chain()
    res4 = benchmark_bundle_adjustment()

    println("\n" * "=" ^ 80)
    println("ALL BENCHMARKS COMPLETED SUCCESSFULLY")
    println("=" ^ 80)

    return (task1=res1, task2=res2, task3=res3, task4=res4)
end

end # module
