# Adapters for third-party optimization problem abstractions
using SecondOrderOptimization
using LeastSquaresOptim
using NLPModels
using NLPModelsIpopt
using JSOSolvers
using LinearAlgebra
using SparseArrays
using StaticArrays
using NLLSModel
using Optim
using MadNLP
using NonlinearSolve

export optimize_soo, optimize_least_squares, optimize_optim, optimize_jsosolvers, optimize_ipopt
export optimize_madnlp, optimize_nonlinearsolve
export get_tier1_optimizers, get_tier2_optimizers, as_nlpmodel, LeastSquaresNLPModel

# -----------------------------------------------------------------------------
# LeastSquaresProblem <-> NLPModels Adapter
# -----------------------------------------------------------------------------

"""
    LeastSquaresNLPModel <: AbstractNLPModel{Float64, Vector{Float64}}

Adapts a `LeastSquaresOptim.LeastSquaresProblem` to the `NLPModels.AbstractNLPModel` interface,
allowing solvers such as `JSOSolvers` (trunk/tron) and `Ipopt` to optimize least squares problems.
"""
mutable struct LeastSquaresNLPModel{TLSP, TR, TJ} <: AbstractNLPModel{Float64, Vector{Float64}}
    meta::NLPModelMeta{Float64, Vector{Float64}}
    counters::Counters
    lsp::TLSP
    r_buf::TR
    J_buf::TJ
    Jv_buf::TR
    H_dense::Matrix{Float64}
    h_rows::Vector{Int}
    h_cols::Vector{Int}
    last_x::Vector{Float64}
    cache_valid::Base.RefValue{Bool}
end

function LeastSquaresNLPModel(lsp::LeastSquaresProblem)
    n = length(lsp.x)
    m = length(lsp.y)
    r_buf = zeros(Float64, m)
    J_buf = deepcopy(lsp.J)
    Jv_buf = zeros(Float64, m)

    if lsp.J isa SparseMatrixCSC
        H_proto = tril(sparse(lsp.J' * lsp.J))
        h_rows, h_cols, _ = findnz(H_proto)
        nnzh = length(h_rows)
        H_dense = Matrix{Float64}(undef, 0, 0)
    else
        nnzh = n * (n + 1) ÷ 2
        h_rows = Vector{Int}(undef, nnzh)
        h_cols = Vector{Int}(undef, nnzh)
        idx = 1
        for j in 1:n
            for i in j:n
                h_rows[idx] = i
                h_cols[idx] = j
                idx += 1
            end
        end
        H_dense = zeros(Float64, n, n)
    end

    meta = NLPModelMeta(n, x0=copy(lsp.x), nnzh=nnzh, name="LeastSquaresNLPModel")
    return LeastSquaresNLPModel(
        meta,
        Counters(),
        lsp,
        r_buf,
        J_buf,
        Jv_buf,
        H_dense,
        h_rows,
        h_cols,
        fill(NaN, n),
        Ref(false)
    )
end

function update_evals!(nlp::LeastSquaresNLPModel, x::AbstractVector)
    if !nlp.cache_valid[] || x != nlp.last_x
        copyto!(nlp.last_x, x)
        nlp.lsp.f!(nlp.r_buf, x)
        nlp.lsp.g!(nlp.J_buf, x)
        if !(nlp.J_buf isa SparseMatrixCSC)
            mul!(nlp.H_dense, nlp.J_buf', nlp.J_buf)
        end
        nlp.cache_valid[] = true
    end
end

function NLPModels.obj(nlp::LeastSquaresNLPModel, x::AbstractVector)
    NLPModels.increment!(nlp, :neval_obj)
    if nlp.cache_valid[] && x == nlp.last_x
        return 0.5 * sum(abs2, nlp.r_buf)
    end
    nlp.lsp.f!(nlp.r_buf, x)
    return 0.5 * sum(abs2, nlp.r_buf)
end

function NLPModels.grad!(nlp::LeastSquaresNLPModel, x::AbstractVector, g::AbstractVector)
    NLPModels.increment!(nlp, :neval_grad)
    update_evals!(nlp, x)
    mul!(g, nlp.J_buf', nlp.r_buf)
    return g
end

function NLPModels.objgrad!(nlp::LeastSquaresNLPModel, x::AbstractVector, g::AbstractVector)
    NLPModels.increment!(nlp, :neval_obj)
    NLPModels.increment!(nlp, :neval_grad)
    update_evals!(nlp, x)
    mul!(g, nlp.J_buf', nlp.r_buf)
    return 0.5 * sum(abs2, nlp.r_buf), g
end

function NLPModels.hess_structure!(nlp::LeastSquaresNLPModel, rows::AbstractVector{<:Integer}, cols::AbstractVector{<:Integer})
    copyto!(rows, nlp.h_rows)
    copyto!(cols, nlp.h_cols)
    return rows, cols
end

function NLPModels.hess_coord!(nlp::LeastSquaresNLPModel, x::AbstractVector, vals::AbstractVector; obj_weight::Real=1.0)
    NLPModels.increment!(nlp, :neval_hess)
    update_evals!(nlp, x)
    w = Float64(obj_weight)
    if nlp.J_buf isa SparseMatrixCSC
        H_sp = tril(sparse(nlp.J_buf' * nlp.J_buf))
        vals .= w .* nonzeros(H_sp)
    else
        @inbounds for k in 1:length(nlp.h_rows)
            vals[k] = w * nlp.H_dense[nlp.h_rows[k], nlp.h_cols[k]]
        end
    end
    return vals
end

function NLPModels.hess_coord!(nlp::LeastSquaresNLPModel, x::AbstractVector, y::AbstractVector, vals::AbstractVector; obj_weight::Real=1.0)
    return NLPModels.hess_coord!(nlp, x, vals; obj_weight=obj_weight)
end

function NLPModels.hprod!(nlp::LeastSquaresNLPModel, x::AbstractVector, v::AbstractVector, Hv::AbstractVector; obj_weight::Real=1.0)
    NLPModels.increment!(nlp, :neval_hprod)
    update_evals!(nlp, x)
    mul!(nlp.Jv_buf, nlp.J_buf, v)
    mul!(Hv, nlp.J_buf', nlp.Jv_buf)
    if obj_weight != 1.0
        Hv .*= Float64(obj_weight)
    end
    return Hv
end

function NLPModels.reset!(nlp::LeastSquaresNLPModel)
    NLPModels.reset!(nlp.counters)
    nlp.cache_valid[] = false
    fill!(nlp.last_x, NaN)
    return nlp
end

# -----------------------------------------------------------------------------
# General Model to NLPModel Converter
# -----------------------------------------------------------------------------

"""
    as_nlpmodel(m) -> AbstractNLPModel

Extracts or converts a problem/model into an `NLPModels.AbstractNLPModel`.
"""
as_nlpmodel(nlp::AbstractNLPModel) = nlp
as_nlpmodel(m::ModelDefinition) = as_nlpmodel(m.model)
as_nlpmodel(prob::NLLSModel.Model) = NLLSModel.NLPLSModel(prob)
as_nlpmodel(lsp::LeastSquaresProblem) = LeastSquaresNLPModel(lsp)

# -----------------------------------------------------------------------------
# SecondOrderOptimization In-Place Extensions
# -----------------------------------------------------------------------------

function SecondOrderOptimization.optimize!(lsp::LeastSquaresProblem, options::OptimizationOptions=OptimizationOptions(); kwargs...)
    m = length(lsp.y)
    n = length(lsp.x)
    r_buffer = zeros(Float64, m)
    J_buffer = deepcopy(lsp.J)
    f(x) = begin
        lsp.f!(r_buffer, x)
        return 0.5 * sum(abs2, r_buffer)
    end

    if lsp.J isa SparseMatrixCSC
        H_proto = lsp.J' * lsp.J
        fdf_sp!(g, H, x) = begin
            lsp.f!(r_buffer, x)
            lsp.g!(J_buffer, x)
            mul!(g, J_buffer', r_buffer)
            H_computed = J_buffer' * J_buffer
            copyto!(H.nzval, H_computed.nzval)
            return 0.5 * sum(abs2, r_buffer)
        end
        return SecondOrderOptimization.optimize!(f, fdf_sp!, lsp.x, options; H=H_proto, kwargs...)
    else
        H_proto = zeros(Float64, n, n)
        fdf_dn!(g, H, x) = begin
            lsp.f!(r_buffer, x)
            lsp.g!(J_buffer, x)
            mul!(g, J_buffer', r_buffer)
            mul!(H, J_buffer', J_buffer)
            return 0.5 * sum(abs2, r_buffer)
        end
        return SecondOrderOptimization.optimize!(f, fdf_dn!, lsp.x, options; H=H_proto, kwargs...)
    end
end

function SecondOrderOptimization.optimize(lsp::LeastSquaresProblem, options::OptimizationOptions=OptimizationOptions(); kwargs...)
    return SecondOrderOptimization.optimize!(deepcopy(lsp), options; kwargs...)
end

function SecondOrderOptimization.optimize!(nlp::AbstractNLPModel, options::OptimizationOptions=OptimizationOptions(); kwargs...)
    if nlp.meta.ncon != 0
        error("Constrained NLPModels are not supported by SecondOrderOptimization")
    end
    f(x) = NLPModels.obj(nlp, x)
    H_low = NLPModels.hess(nlp, nlp.meta.x0)
    H_prototype = Matrix(Symmetric(H_low, :L))
    fdf!(g, H, x) = begin
        NLPModels.grad!(nlp, x, g)
        H_x = NLPModels.hess(nlp, x)
        copyto!(H, Symmetric(H_x, :L))
        return NLPModels.obj(nlp, x)
    end
    return SecondOrderOptimization.optimize!(f, fdf!, nlp.meta.x0, options; H=H_prototype, kwargs...)
end

function SecondOrderOptimization.optimize(nlp::AbstractNLPModel, options::OptimizationOptions=OptimizationOptions(); kwargs...)
    x0 = copy(nlp.meta.x0)
    f(x) = NLPModels.obj(nlp, x)
    H_low = NLPModels.hess(nlp, x0)
    H_prototype = Matrix(Symmetric(H_low, :L))
    fdf!(g, H, x) = begin
        NLPModels.grad!(nlp, x, g)
        H_x = NLPModels.hess(nlp, x)
        copyto!(H, Symmetric(H_x, :L))
        return NLPModels.obj(nlp, x)
    end
    return SecondOrderOptimization.optimize(f, fdf!, x0, options; H=H_prototype, kwargs...)
end

function SecondOrderOptimization.optimize!(prob::NLLSModel.Model, options::OptimizationOptions=OptimizationOptions(); unfixed=nothing, kwargs...)
    f, fdf!, x0, H = NLLSModel.optimvars(prob, unfixed)
    return SecondOrderOptimization.optimize!(f, fdf!, x0, options; H=H, kwargs...)
end

function SecondOrderOptimization.optimize(prob::NLLSModel.Model, options::OptimizationOptions=OptimizationOptions(); unfixed=nothing, kwargs...)
    p = deepcopy(prob)
    return SecondOrderOptimization.optimize!(p, options; unfixed=unfixed, kwargs...)
end

# -----------------------------------------------------------------------------
# Uniform Optimizer Dispatchers
# -----------------------------------------------------------------------------

"""
    optimize_soo(model; method=:dogleg, maxiters=100, time_limit=nothing, maxtime=time_limit === nothing ? 1e6 : Float64(time_limit), kwargs...) -> OptimizerResult

Optimizes a model using `SecondOrderOptimization.jl`.
Supported methods: `:dogleg`, `:lm` / `:levenbergmarquardt`.
"""
function optimize_soo(target; method=:dogleg, maxiters=100, time_limit=nothing, maxtime=time_limit === nothing ? 1e6 : Float64(time_limit), kwargs...)
    actual_method = method === :lm ? :levenbergmarquardt : method
    opt = OptimizationOptions(iterator=actual_method, maxiters=maxiters, maxtime=maxtime; kwargs...)
    m = target isa ModelDefinition ? target.model : target

    if m isa NLLSModel.Model
        p = deepcopy(m)
        t_start = time_ns()
        timed = @timed SecondOrderOptimization.optimize!(p, opt)
        t_total = time_ns() - t_start
        _, res = timed.value
        return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, res.niterations, res.startcost, res.bestcost, res.termination != 0)
    elseif m isa LeastSquaresProblem
        p = deepcopy(m)
        t_start = time_ns()
        timed = @timed SecondOrderOptimization.optimize!(p, opt)
        t_total = time_ns() - t_start
        _, res = timed.value
        return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, res.niterations, res.startcost, res.bestcost, res.termination != 0)
    elseif m isa AbstractNLPModel
        p = deepcopy(m)
        t_start = time_ns()
        timed = @timed SecondOrderOptimization.optimize!(p, opt)
        t_total = time_ns() - t_start
        _, res = timed.value
        return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, res.niterations, res.startcost, res.bestcost, res.termination != 0)
    else
        error("Unsupported model type for optimize_soo: $(typeof(m))")
    end
end

"""
    optimize_least_squares(model; method=:dogleg, maxiters=100, time_limit=nothing, kwargs...) -> OptimizerResult

Optimizes a model using `LeastSquaresOptim.jl`.
Supported methods: `:dogleg`, `:lm` / `:levenbergmarquardt`.
"""
function optimize_least_squares(target; method=:dogleg, maxiters=100, time_limit=nothing, kwargs...)
    m = target isa ModelDefinition ? target.model : target
    lso_method = (method === :lm || method === :levenbergmarquardt) ? LeastSquaresOptim.LevenbergMarquardt() : LeastSquaresOptim.Dogleg()

    if !(m isa LeastSquaresProblem)
        return OptimizerResult(NaN, 0, 0, 0, NaN, NaN, false)
    end

    lsp = deepcopy(m)
    n_vars = length(lsp.x)
    is_sparse = lsp.J isa SparseMatrixCSC
    if is_sparse
        # LeastSquaresOptim uses un-preconditioned iterative LSMR for sparse problems without timeout support.
        # Dogleg attempts to solve the un-damped Gauss-Newton system (singular on gauge-free problems like pose graphs),
        # causing LSMR to stall beyond ~5,000 variables.
        if (method === :dogleg && n_vars > 5000) || n_vars > 25000
            return OptimizerResult(NaN, 0, 0, 0, NaN, NaN, false)
        end
    end

    r0 = zeros(Float64, length(lsp.y))
    lsp.f!(r0, lsp.x)
    start_c = 0.5 * sum(abs2, r0)

    actual_maxiters = (time_limit !== nothing && time_limit <= 1.0) ? min(maxiters, 10) : maxiters

    t_start = time_ns()
    timed = @timed LeastSquaresOptim.optimize!(lsp, lso_method; iterations=actual_maxiters, kwargs...)
    t_total = time_ns() - t_start
    res = timed.value

    return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, res.iterations, start_c, res.ssr * 0.5, res.converged)
end

"""
    optimize_optim(model; method=:newton_trust_region, maxiters=100, time_limit=nothing, kwargs...) -> OptimizerResult

Optimizes a model using `Optim.jl`.
Supported methods: `:newton_trust_region`, `:newton`.
"""
function optimize_optim(target; method=:newton_trust_region, maxiters=100, time_limit=nothing, kwargs...)
    m = target isa ModelDefinition ? target.model : target
    optim_method = method === :newton ? Optim.Newton(linesearch=Optim.LineSearches.BackTracking()) : Optim.NewtonTrustRegion()
    t_lim = time_limit === nothing ? NaN : Float64(time_limit)

    if m isa LeastSquaresProblem
        lsp = deepcopy(m)
        x0 = copy(lsp.x)
        n = length(x0)
        is_sparse = lsp.J isa SparseMatrixCSC

        if method === :newton_trust_region && is_sparse && n > 1000
            # NewtonTrustRegion requires dense Cholesky; unsupported for large sparse problems.
            return OptimizerResult(NaN, 0, 0, 0, NaN, NaN, false)
        end

        r_buf = zeros(Float64, length(lsp.y))
        J_buf = deepcopy(lsp.J)
        lsp.f!(r_buf, x0)
        start_c = 0.5 * sum(abs2, r_buf)

        f(x) = begin
            lsp.f!(r_buf, x)
            return 0.5 * sum(abs2, r_buf)
        end
        g!(g, x) = begin
            lsp.f!(r_buf, x)
            lsp.g!(J_buf, x)
            mul!(g, J_buf', r_buf)
            return g
        end

        H0 = if is_sparse
            sparse(lsp.J' * lsp.J)
        else
            Matrix{Float64}(undef, n, n)
        end

        h! = if is_sparse
            (H, x) -> begin
                lsp.g!(J_buf, x)
                H_calc = J_buf' * J_buf
                copyto!(H.nzval, H_calc.nzval)
                return H
            end
        else
            (H, x) -> begin
                lsp.g!(J_buf, x)
                mul!(H, J_buf', J_buf)
                return H
            end
        end

        g0 = zeros(Float64, n)
        g!(g0, x0)
        h!(H0, x0)

        td = TwiceDifferentiable(f, g!, h!, x0, start_c, g0, H0)
        opts = Optim.Options(iterations=maxiters, time_limit=t_lim; kwargs...)

        t_start = time_ns()
        timed = @timed Optim.optimize(td, x0, optim_method, opts)
        t_total = time_ns() - t_start
        res = timed.value

        return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, res.iterations, start_c, res.minimum, Optim.converged(res))

    elseif m isa NLLSModel.Model
        p = deepcopy(m)
        f, fdf!, x0, H_proto = NLLSModel.optimvars(p)
        if !(x0 isa Vector{Float64})
            # Optim requires a flat Vector{Float64}; incompatible with structured/manifold variables
            return OptimizerResult(NaN, 0, 0, 0, NaN, NaN, false)
        end
        n = length(x0)
        is_sparse = H_proto isa SparseMatrixCSC

        if method === :newton_trust_region && is_sparse && n > 1000
            # NewtonTrustRegion requires dense Cholesky; unsupported for large sparse problems.
            return OptimizerResult(NaN, 0, 0, 0, NaN, NaN, false)
        end

        H0, H_buf = if is_sparse
            (deepcopy(H_proto), deepcopy(H_proto))
        else
            (Matrix{Float64}(undef, n, n), Matrix{Float64}(undef, n, n))
        end

        g0 = zeros(Float64, n)
        start_c = fdf!(g0, H0, copy(x0))
        g_buf = zeros(Float64, n)

        f_opt(x) = f(x)
        g_opt!(g, x) = begin
            fdf!(g, H_buf, x)
            return g
        end
        h_opt!(H, x) = begin
            fdf!(g_buf, H, x)
            return H
        end

        td = Optim.NLSolversBase.TwiceDifferentiable(f_opt, g_opt!, h_opt!, copy(x0), start_c, g0, H0)
        opts = Optim.Options(iterations=maxiters, time_limit=t_lim; kwargs...)

        t_start = time_ns()
        timed = @timed Optim.optimize(td, copy(x0), optim_method, opts)
        t_total = time_ns() - t_start
        res = timed.value
        return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, Optim.iterations(res), start_c, Optim.minimum(res), Optim.converged(res))

    elseif m isa AbstractNLPModel
        nlp = deepcopy(m)
        x0 = copy(nlp.meta.x0)
        n = length(x0)
        start_c = NLPModels.obj(nlp, x0)

        rows, cols = NLPModels.hess_structure(nlp)
        vals = zeros(Float64, length(rows))
        NLPModels.hess_coord!(nlp, x0, vals)
        is_sparse = length(rows) < (n * (n + 1) ÷ 2)

        if method === :newton_trust_region && is_sparse && n > 1000
            return OptimizerResult(NaN, 0, 0, 0, NaN, NaN, false)
        end

        f_nlp(x) = NLPModels.obj(nlp, x)
        g_nlp!(g, x) = NLPModels.grad!(nlp, x, g)
        g0 = zeros(Float64, n)
        g_nlp!(g0, x0)

        H0, h_nlp! = if is_sparse
            H_tril = sparse(rows, cols, vals, n, n)
            H_init = sparse(Symmetric(H_tril, :L))
            (H_init, (H, x) -> begin
                NLPModels.hess_coord!(nlp, x, vals)
                copyto!(H_tril.nzval, vals)
                H_sym = sparse(Symmetric(H_tril, :L))
                copyto!(H.nzval, H_sym.nzval)
                return H
            end)
        else
            H_dense = Matrix{Float64}(undef, n, n)
            h_dense_eval = (H, x) -> begin
                H_x = NLPModels.hess(nlp, x)
                copyto!(H, Symmetric(H_x, :L))
                return H
            end
            h_dense_eval(H_dense, x0)
            (H_dense, h_dense_eval)
        end

        td = Optim.NLSolversBase.TwiceDifferentiable(f_nlp, g_nlp!, h_nlp!, copy(x0), start_c, g0, H0)
        opts = Optim.Options(iterations=maxiters, time_limit=t_lim; kwargs...)

        t_start = time_ns()
        timed = @timed Optim.optimize(td, copy(x0), optim_method, opts)
        t_total = time_ns() - t_start
        res = timed.value
        return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, Optim.iterations(res), start_c, Optim.minimum(res), Optim.converged(res))

    else
        error("Unsupported model type for optimize_optim: $(typeof(m))")
    end
end

"""
    optimize_jsosolvers(model; solver=:trunk, maxiters=100, time_limit=nothing, max_time=time_limit === nothing ? 3600.0 : Float64(time_limit), kwargs...) -> OptimizerResult

Optimizes a model using `JSOSolvers.jl`.
Supported solvers: `:trunk`, `:tron`.
"""
function optimize_jsosolvers(target; solver=:trunk, maxiters=100, time_limit=nothing, max_time=time_limit === nothing ? 3600.0 : Float64(time_limit), kwargs...)
    nlp = as_nlpmodel(target)
    NLPModels.reset!(nlp)
    start_c = NLPModels.obj(nlp, nlp.meta.x0)

    t_start = time_ns()
    timed = if solver === :tron
        @timed JSOSolvers.tron(nlp; max_iter=maxiters, max_time=max_time, kwargs...)
    else
        @timed JSOSolvers.trunk(nlp; max_iter=maxiters, max_time=max_time, kwargs...)
    end
    t_total = time_ns() - t_start
    res = timed.value

    return OptimizerResult(
        Float64(t_total),
        Base.gc_alloc_count(timed.gcstats),
        timed.bytes,
        res.iter,
        start_c,
        res.objective,
        res.status == :first_order
    )
end

"""
    optimize_ipopt(model; maxiters=100, print_level=0, time_limit=nothing, max_cpu_time=time_limit === nothing ? 1e6 : Float64(time_limit), kwargs...) -> OptimizerResult

Optimizes a model using `Ipopt` via `NLPModelsIpopt`.
"""
function optimize_ipopt(target; maxiters=100, print_level=0, time_limit=nothing, max_cpu_time=time_limit === nothing ? 1e6 : Float64(time_limit), kwargs...)
    nlp = as_nlpmodel(target)
    NLPModels.reset!(nlp)
    start_c = NLPModels.obj(nlp, nlp.meta.x0)

    t_start = time_ns()
    timed = @timed NLPModelsIpopt.ipopt(nlp; max_iter=maxiters, max_cpu_time=max_cpu_time, print_level=print_level, kwargs...)
    t_total = time_ns() - t_start
    res = timed.value

    converged = res.status in (:first_order, :acceptable_level)
    return OptimizerResult(
        Float64(t_total),
        Base.gc_alloc_count(timed.gcstats),
        timed.bytes,
        res.iter,
        start_c,
        res.objective,
        converged
    )
end

"""
    optimize_madnlp(model; maxiters=100, time_limit=nothing, max_wall_time=time_limit === nothing ? 1e6 : Float64(time_limit), kwargs...) -> OptimizerResult

Optimizes a model using `MadNLP.jl`.
"""
function optimize_madnlp(target; maxiters=100, time_limit=nothing, max_wall_time=time_limit === nothing ? 1e6 : Float64(time_limit), kwargs...)
    nlp = as_nlpmodel(target)
    NLPModels.reset!(nlp)
    start_c = NLPModels.obj(nlp, nlp.meta.x0)

    t_start = time_ns()
    timed = @timed MadNLP.madnlp(nlp; max_iter=maxiters, max_wall_time=max_wall_time, print_level=MadNLP.ERROR, kwargs...)
    t_total = time_ns() - t_start
    res = timed.value

    converged = res.status in (MadNLP.SOLVE_SUCCEEDED, MadNLP.SOLVED_TO_ACCEPTABLE_LEVEL)
    return OptimizerResult(
        Float64(t_total),
        Base.gc_alloc_count(timed.gcstats),
        timed.bytes,
        res.iter,
        start_c,
        res.objective,
        converged
    )
end

"""
    optimize_nonlinearsolve(model; method=:lm, maxiters=100, time_limit=nothing, maxtime=time_limit === nothing ? Inf : Float64(time_limit), kwargs...) -> OptimizerResult

Optimizes a model using `NonlinearSolve.jl`.
Supported methods: `:lm`, `:trust_region`, `:gauss_newton`.
"""
function optimize_nonlinearsolve(target; method=:lm, maxiters=100, time_limit=nothing, maxtime=time_limit === nothing ? Inf : Float64(time_limit), kwargs...)
    m = target isa ModelDefinition ? target.model : target

    if !(m isa LeastSquaresProblem)
        return OptimizerResult(NaN, 0, 0, 0, NaN, NaN, false)
    end

    lsp = deepcopy(m)
    m_len = length(lsp.y)
    n_len = length(lsp.x)
    x0 = copy(lsp.x)

    if lsp.J isa SparseMatrixCSC && n_len > 25000
        # Avoid excessive sparse QR solve time on massive sparse regimes
        return OptimizerResult(NaN, 0, 0, 0, NaN, NaN, false)
    end

    r_init = zeros(Float64, m_len)
    lsp.f!(r_init, x0)
    start_c = 0.5 * sum(abs2, r_init)

    f_nls!(du, u, p) = lsp.f!(du, u)
    jac_nls!(J, u, p) = lsp.g!(J, u)

    nl_func = NonlinearFunction(f_nls!; jac=jac_nls!, resid_prototype=zeros(Float64, m_len), jac_prototype=deepcopy(lsp.J))
    prob = NonlinearLeastSquaresProblem(nl_func, x0)

    solver = if method === :trust_region || method === :dogleg
        NonlinearSolve.TrustRegion()
    elseif method === :gauss_newton
        NonlinearSolve.GaussNewton()
    else
        NonlinearSolve.LevenbergMarquardt()
    end

    t_start = time_ns()
    timed = @timed solve(prob, solver; maxiters=maxiters, maxtime=maxtime, kwargs...)
    t_total = time_ns() - t_start
    sol = timed.value

    final_c = 0.5 * sum(abs2, sol.resid)
    converged = NonlinearSolve.SciMLBase.successful_retcode(sol.retcode)
    iters = sol.stats.nsteps

    return OptimizerResult(
        Float64(t_total),
        Base.gc_alloc_count(timed.gcstats),
        timed.bytes,
        iters,
        start_c,
        final_c,
        converged
    )
end

# -----------------------------------------------------------------------------
# Default Tier 1 & Tier 2 Optimizer Sets
# -----------------------------------------------------------------------------

"""
    get_tier1_optimizers() -> Vector{OptimizerDefinition}

Returns optimizer definitions capable of running directly on peak-performance models (e.g. `NLLSModel.Model`).
Includes SecondOrderOptimization, Optim, JSOSolvers, Ipopt, and MadNLP.
"""
function get_tier1_optimizers()
    return OptimizerDefinition[
        OptimizerDefinition("SecondOrderOptimization (Dogleg)", (m; kwargs...) -> optimize_soo(m; method=:dogleg, kwargs...)),
        OptimizerDefinition("SecondOrderOptimization (LM)", (m; kwargs...) -> optimize_soo(m; method=:lm, kwargs...)),
        OptimizerDefinition("Optim (NewtonTrustRegion)", (m; kwargs...) -> optimize_optim(m; method=:newton_trust_region, kwargs...)),
        OptimizerDefinition("Optim (Newton)", (m; kwargs...) -> optimize_optim(m; method=:newton, kwargs...)),
        OptimizerDefinition("JSOSolvers (trunk)", (m; kwargs...) -> optimize_jsosolvers(m; solver=:trunk, kwargs...)),
        OptimizerDefinition("JSOSolvers (tron)", (m; kwargs...) -> optimize_jsosolvers(m; solver=:tron, kwargs...)),
        OptimizerDefinition("Ipopt", (m; kwargs...) -> optimize_ipopt(m; kwargs...)),
        OptimizerDefinition("MadNLP", (m; kwargs...) -> optimize_madnlp(m; kwargs...))
    ]
end

"""
    get_tier2_optimizers() -> Vector{OptimizerDefinition}

Returns optimizer definitions for universal apples-to-apples comparison on Common Models (e.g. `LeastSquaresProblem`).
Includes all solver families: SecondOrderOptimization, LeastSquaresOptim, Optim, JSOSolvers, Ipopt, MadNLP, and NonlinearSolve.
"""
function get_tier2_optimizers()
    return OptimizerDefinition[
        OptimizerDefinition("SecondOrderOptimization (Dogleg)", (m; kwargs...) -> optimize_soo(m; method=:dogleg, kwargs...)),
        OptimizerDefinition("SecondOrderOptimization (LM)", (m; kwargs...) -> optimize_soo(m; method=:lm, kwargs...)),
        OptimizerDefinition("LeastSquaresOptim (Dogleg)", (m; kwargs...) -> optimize_least_squares(m; method=:dogleg, kwargs...)),
        OptimizerDefinition("LeastSquaresOptim (LM)", (m; kwargs...) -> optimize_least_squares(m; method=:lm, kwargs...)),
        OptimizerDefinition("Optim (NewtonTrustRegion)", (m; kwargs...) -> optimize_optim(m; method=:newton_trust_region, kwargs...)),
        OptimizerDefinition("Optim (Newton)", (m; kwargs...) -> optimize_optim(m; method=:newton, kwargs...)),
        OptimizerDefinition("JSOSolvers (trunk)", (m; kwargs...) -> optimize_jsosolvers(m; solver=:trunk, kwargs...)),
        OptimizerDefinition("JSOSolvers (tron)", (m; kwargs...) -> optimize_jsosolvers(m; solver=:tron, kwargs...)),
        OptimizerDefinition("Ipopt", (m; kwargs...) -> optimize_ipopt(m; kwargs...)),
        OptimizerDefinition("MadNLP", (m; kwargs...) -> optimize_madnlp(m; kwargs...)),
        OptimizerDefinition("NonlinearSolve (LM)", (m; kwargs...) -> optimize_nonlinearsolve(m; method=:lm, kwargs...)),
        OptimizerDefinition("NonlinearSolve (TrustRegion)", (m; kwargs...) -> optimize_nonlinearsolve(m; method=:trust_region, kwargs...))
    ]
end
