# Adapters for third-party optimization problem abstractions
using SecondOrderOptimization
using LeastSquaresOptim
using NLPModels
using NLPModelsIpopt
using JSOSolvers
using LinearAlgebra
using SparseArrays
using Static
using StaticArrays
using NLLSModel
using Optim
using MadNLP
using NonlinearSolve
using CaNNOLeS
using BundleAdjustmentModels

export optimize_soo, optimize_nlls_soo, optimize_least_squares, optimize_optim, optimize_jsosolvers, optimize_ipopt
export optimize_madnlp, optimize_nonlinearsolve, optimize_cannoles
export get_standard_optimizers, get_tier1_optimizers, get_tier2_optimizers, as_nlpmodel, LeastSquaresNLPModel, reset_nlp_cache!
export as_nlsmodel, LeastSquaresNLSModel
export TimeoutException
export DEFAULT_GTOL, DEFAULT_XTOL, DEFAULT_FTOL, DEFAULT_MAXITERS, DEFAULT_MAXTIME

struct TimeoutException <: Exception end

# -----------------------------------------------------------------------------
# Universal Stopping Criteria Constants
# -----------------------------------------------------------------------------
const DEFAULT_GTOL = 1e-8
const DEFAULT_XTOL = 1e-8
const DEFAULT_FTOL = 1e-8
const DEFAULT_MAXITERS = 500
const DEFAULT_MAXTIME = 30.0

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

function _symbolic_jtj(J::SparseMatrixCSC)
    J_sym = SparseMatrixCSC(J.m, J.n, copy(J.colptr), copy(J.rowval), ones(Float64, length(J.nzval)))
    return sparse(J_sym' * J_sym)
end

function LeastSquaresNLPModel(lsp::LeastSquaresProblem)
    n = length(lsp.x)
    m = length(lsp.y)
    r_buf = zeros(Float64, m)
    J_buf = deepcopy(lsp.J)
    Jv_buf = zeros(Float64, m)

    if lsp.J isa SparseMatrixCSC
        H_proto = tril(_symbolic_jtj(lsp.J))
        nnzh = nnz(H_proto)
        h_rows = Vector{Int}(undef, nnzh)
        h_cols = Vector{Int}(undef, nnzh)
        idx = 1
        for col in 1:size(H_proto, 2)
            for p in nzrange(H_proto, col)
                h_rows[idx] = H_proto.rowval[p]
                h_cols[idx] = col
                idx += 1
            end
        end
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
        nz = nonzeros(H_sp)
        if length(nz) == length(vals)
            vals .= w .* nz
        else
            @inbounds for k in eachindex(vals)
                vals[k] = w * H_sp[nlp.h_rows[k], nlp.h_cols[k]]
            end
        end
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
# LeastSquaresProblem <-> AbstractNLSModel Adapter
# -----------------------------------------------------------------------------

"""
    LeastSquaresNLSModel <: AbstractNLSModel{Float64, Vector{Float64}}

Adapts a `LeastSquaresOptim.LeastSquaresProblem` to the `NLPModels.AbstractNLSModel` interface,
allowing solvers such as `JSOSolvers` (trunk/tron) and `CaNNOLeS` to optimize least squares problems
via direct matrix-free Gauss-Newton products (`jprod_residual!` / `jtprod_residual!`).
"""
mutable struct LeastSquaresNLSModel{TLSP, TR, TJ} <: AbstractNLSModel{Float64, Vector{Float64}}
    meta::NLPModelMeta{Float64, Vector{Float64}}
    nls_meta::NLSMeta{Float64, Vector{Float64}}
    counters::NLSCounters
    lsp::TLSP
    r_buf::TR
    J_buf::TJ
    last_x::Vector{Float64}
    cache_valid::Base.RefValue{Bool}
end

function LeastSquaresNLSModel(lsp::LeastSquaresProblem)
    n = length(lsp.x)
    m = length(lsp.y)
    r_buf = zeros(Float64, m)
    J_buf = deepcopy(lsp.J)
    nnzj = lsp.J isa SparseMatrixCSC ? nnz(lsp.J) : n * m
    meta = NLPModelMeta(n, x0=copy(lsp.x), name="LeastSquaresNLSModel")
    nls_meta = NLSMeta(m, n, x0=copy(lsp.x), nnzj=nnzj)
    return LeastSquaresNLSModel(meta, nls_meta, NLSCounters(), lsp, r_buf, J_buf, fill(NaN, n), Ref(false))
end

function update_nls!(nls::LeastSquaresNLSModel, x::AbstractVector)
    if !nls.cache_valid[] || x != nls.last_x
        copyto!(nls.last_x, x)
        nls.lsp.f!(nls.r_buf, x)
        nls.lsp.g!(nls.J_buf, x)
        nls.cache_valid[] = true
    end
end

function NLPModels.residual!(nls::LeastSquaresNLSModel, x::AbstractVector, Fx::AbstractVector)
    NLPModels.increment!(nls, :neval_residual)
    if nls.cache_valid[] && x == nls.last_x
        copyto!(Fx, nls.r_buf)
    else
        copyto!(nls.last_x, x)
        nls.lsp.f!(nls.r_buf, x)
        copyto!(Fx, nls.r_buf)
        nls.cache_valid[] = false
    end
    return Fx
end

function NLPModels.jprod_residual!(nls::LeastSquaresNLSModel, x::AbstractVector, v::AbstractVector, Jv::AbstractVector)
    NLPModels.increment!(nls, :neval_jprod_residual)
    update_nls!(nls, x)
    mul!(Jv, nls.J_buf, v)
    return Jv
end

function NLPModels.jtprod_residual!(nls::LeastSquaresNLSModel, x::AbstractVector, v::AbstractVector, Jtv::AbstractVector)
    NLPModels.increment!(nls, :neval_jtprod_residual)
    update_nls!(nls, x)
    mul!(Jtv, transpose(nls.J_buf), v)
    return Jtv
end

function NLPModels.jac_structure_residual!(nls::LeastSquaresNLSModel, rows::AbstractVector{<:Integer}, cols::AbstractVector{<:Integer})
    if nls.J_buf isa SparseMatrixCSC
        idx = 1
        for col in 1:size(nls.J_buf, 2)
            for p in nzrange(nls.J_buf, col)
                rows[idx] = nls.J_buf.rowval[p]
                cols[idx] = col
                idx += 1
            end
        end
    else
        m, n = size(nls.J_buf)
        idx = 1
        for j in 1:n
            for i in 1:m
                rows[idx] = i
                cols[idx] = j
                idx += 1
            end
        end
    end
    return rows, cols
end

function NLPModels.jac_coord_residual!(nls::LeastSquaresNLSModel, x::AbstractVector, vals::AbstractVector)
    NLPModels.increment!(nls, :neval_jac_residual)
    update_nls!(nls, x)
    if nls.J_buf isa SparseMatrixCSC
        copyto!(vals, nonzeros(nls.J_buf))
    else
        copyto!(vals, vec(nls.J_buf))
    end
    return vals
end

function NLPModels.obj(nls::LeastSquaresNLSModel, x::AbstractVector)
    NLPModels.increment!(nls, :neval_obj)
    if nls.cache_valid[] && x == nls.last_x
        return 0.5 * sum(abs2, nls.r_buf)
    end
    nls.lsp.f!(nls.r_buf, x)
    return 0.5 * sum(abs2, nls.r_buf)
end

function NLPModels.grad!(nls::LeastSquaresNLSModel, x::AbstractVector, g::AbstractVector)
    NLPModels.increment!(nls, :neval_grad)
    update_nls!(nls, x)
    mul!(g, transpose(nls.J_buf), nls.r_buf)
    return g
end

function NLPModels.objgrad!(nls::LeastSquaresNLSModel, x::AbstractVector, g::AbstractVector)
    NLPModels.increment!(nls, :neval_obj)
    NLPModels.increment!(nls, :neval_grad)
    update_nls!(nls, x)
    mul!(g, transpose(nls.J_buf), nls.r_buf)
    return 0.5 * sum(abs2, nls.r_buf), g
end

function NLPModels.reset!(nls::LeastSquaresNLSModel)
    NLPModels.reset!(nls.counters)
    nls.cache_valid[] = false
    fill!(nls.last_x, NaN)
    return nls
end

# -----------------------------------------------------------------------------
# General Model to NLPModel / NLSModel Converters
# -----------------------------------------------------------------------------

function NLPModels.jprod_residual!(bam::BundleAdjustmentModel, x::AbstractVector, v::AbstractVector, Jv::AbstractVector)
    rows = Vector{Int}(undef, bam.nls_meta.nnzj)
    cols = Vector{Int}(undef, bam.nls_meta.nnzj)
    NLPModels.jac_structure_residual!(bam, rows, cols)
    vals = Vector{Float64}(undef, bam.nls_meta.nnzj)
    NLPModels.jac_coord_residual!(bam, x, vals)
    J = sparse(rows, cols, vals, bam.nls_meta.nequ, bam.meta.nvar)
    mul!(Jv, J, v)
    return Jv
end

function NLPModels.jtprod_residual!(bam::BundleAdjustmentModel, x::AbstractVector, v::AbstractVector, Jtv::AbstractVector)
    rows = Vector{Int}(undef, bam.nls_meta.nnzj)
    cols = Vector{Int}(undef, bam.nls_meta.nnzj)
    NLPModels.jac_structure_residual!(bam, rows, cols)
    vals = Vector{Float64}(undef, bam.nls_meta.nnzj)
    NLPModels.jac_coord_residual!(bam, x, vals)
    J = sparse(rows, cols, vals, bam.nls_meta.nequ, bam.meta.nvar)
    mul!(Jtv, transpose(J), v)
    return Jtv
end

"""
    as_least_squares_problem(bam::BundleAdjustmentModel) -> LeastSquaresProblem
"""
function as_least_squares_problem(bam::BundleAdjustmentModel)
    rows = Vector{Int}(undef, bam.nls_meta.nnzj)
    cols = Vector{Int}(undef, bam.nls_meta.nnzj)
    NLPModels.jac_structure_residual!(bam, rows, cols)
    vals = Vector{Float64}(undef, bam.nls_meta.nnzj)
    NLPModels.jac_coord_residual!(bam, bam.meta.x0, vals)

    idx_sp = sparse(rows, cols, collect(1:bam.nls_meta.nnzj), bam.nls_meta.nequ, bam.meta.nvar)
    perm = nonzeros(idx_sp)

    J_proto = sparse(rows, cols, ones(Float64, bam.nls_meta.nnzj), bam.nls_meta.nequ, bam.meta.nvar)
    @inbounds for k in 1:length(perm)
        J_proto.nzval[k] = vals[perm[k]]
    end

    f_res!(r, x) = NLPModels.residual!(bam, x, r)
    g_jac!(J, x) = begin
        NLPModels.jac_coord_residual!(bam, x, vals)
        @inbounds for k in 1:length(perm)
            J.nzval[k] = vals[perm[k]]
        end
        return J
    end
    return LeastSquaresProblem(x=copy(bam.meta.x0), (f!) = f_res!, (g!) = g_jac!, y=zeros(Float64, bam.nls_meta.nequ), J=deepcopy(J_proto))
end

"""
    as_nlpmodel(m) -> AbstractNLPModel

Extracts or converts a problem/model into an `NLPModels.AbstractNLPModel`.
"""
as_nlpmodel(nlp::AbstractNLPModel) = nlp
as_nlpmodel(bam::BundleAdjustmentModel) = LeastSquaresNLPModel(as_least_squares_problem(bam))
as_nlpmodel(m::ModelDefinition) = as_nlpmodel(m.model)
as_nlpmodel(prob::NLLSModel.Model) = NLLSModel.NLPLSModel(prob)
as_nlpmodel(lsp::LeastSquaresProblem) = LeastSquaresNLPModel(lsp)

"""
    as_nlsmodel(m) -> AbstractNLSModel

Extracts or converts a problem/model into an `NLPModels.AbstractNLSModel`.
"""
as_nlsmodel(nls::AbstractNLSModel) = nls
as_nlsmodel(bam::BundleAdjustmentModel) = bam
as_nlsmodel(m::ModelDefinition) = as_nlsmodel(m.model)
as_nlsmodel(prob::NLLSModel.Model) = NLLSModel.NLLSNLSModel(prob)
as_nlsmodel(lsp::LeastSquaresProblem) = LeastSquaresNLSModel(lsp)

"""
    reset_nlp_cache!(nlp)

Invalidates any internal evaluation cache in NLP models (such as JuMP/ReverseAD-backed `MathOptNLSModel`,
`MathOptNLPModel`, or `LeastSquaresNLPModel`) so that subsequent cost and linear system evaluations are
guaranteed to be fully recomputed rather than returning cached values.
"""
function reset_nlp_cache!(nlp)
    if hasproperty(nlp, :ceval) && hasproperty(nlp.ceval, :backend) && hasproperty(nlp.ceval.backend, :last_x)
        fill!(nlp.ceval.backend.last_x, NaN)
    end
    if hasproperty(nlp, :Feval) && hasproperty(nlp.Feval, :backend) && hasproperty(nlp.Feval.backend, :last_x)
        fill!(nlp.Feval.backend.last_x, NaN)
    end
    if hasproperty(nlp, :evaluator) && hasproperty(nlp.evaluator, :backend) && hasproperty(nlp.evaluator.backend, :last_x)
        fill!(nlp.evaluator.backend.last_x, NaN)
    end
    if hasproperty(nlp, :cache_valid)
        nlp.cache_valid[] = false
    end
    if hasproperty(nlp, :last_x) && nlp.last_x isa AbstractArray
        fill!(nlp.last_x, NaN)
    end
    return nlp
end
reset_nlp_cache!(m::ModelDefinition) = reset_nlp_cache!(m.model)

# -----------------------------------------------------------------------------
# SecondOrderOptimization objectives
# -----------------------------------------------------------------------------
# `NLLSModel.Model` is solved through NLLSModel's own `SecondOrderOptimization.optimize!(model, options)`.
# The other model types are wrapped here in a `HessianObjective`, returning `(x0, objective)`.

function soo_objective(lsp::LeastSquaresProblem)
    m = length(lsp.y)
    r_buffer = zeros(Float64, m)
    J_buffer = deepcopy(lsp.J)
    f(x) = begin
        lsp.f!(r_buffer, x)
        return 0.5 * sum(abs2, r_buffer)
    end

    if lsp.J isa SparseMatrixCSC
        H_proto = _symbolic_jtj(lsp.J)
        fdf_sp!(g, H, x) = begin
            lsp.f!(r_buffer, x)
            lsp.g!(J_buffer, x)
            mul!(g, J_buffer', r_buffer)
            H_computed = J_buffer' * J_buffer
            if length(H.nzval) == length(H_computed.nzval)
                copyto!(H.nzval, H_computed.nzval)
            else
                fill!(H.nzval, 0.0)
                rows_c, cols_c, vals_c = findnz(H_computed)
                @inbounds for (r, c, v) in zip(rows_c, cols_c, vals_c)
                    H[r, c] = v
                end
            end
            return 0.5 * sum(abs2, r_buffer)
        end
        return lsp.x, HessianObjective(f, fdf_sp!; H = H_proto)
    else
        n = length(lsp.x)
        fdf_dn!(g, H, x) = begin
            lsp.f!(r_buffer, x)
            lsp.g!(J_buffer, x)
            mul!(g, J_buffer', r_buffer)
            mul!(H, J_buffer', J_buffer)
            return 0.5 * sum(abs2, r_buffer)
        end
        return lsp.x, HessianObjective(f, fdf_dn!; H = zeros(Float64, n, n))
    end
end

function soo_objective(nlp::AbstractNLPModel)
    nlp.meta.ncon == 0 || error("Constrained NLPModels are not supported by SecondOrderOptimization")
    f(x) = NLPModels.obj(nlp, x)
    H_prototype = Matrix(Symmetric(NLPModels.hess(nlp, nlp.meta.x0), :L))
    fdf!(g, H, x) = begin
        NLPModels.grad!(nlp, x, g)
        copyto!(H, Symmetric(NLPModels.hess(nlp, x), :L))
        return NLPModels.obj(nlp, x)
    end
    return copy(nlp.meta.x0), HessianObjective(f, fdf!; H = H_prototype)
end

# Run SecondOrderOptimization on a (copied) model and return its OptimizationResult
soo_run!(m::NLLSModel.Model, opt; reduction=:auto) = SecondOrderOptimization.optimize!(m, opt; reduction=reduction)
function soo_run!(m, opt; reduction=:auto)
    x0, obj = soo_objective(m)
    return SecondOrderOptimization.optimize!(x0, obj, opt)
end

# -----------------------------------------------------------------------------
# Uniform Optimizer Dispatchers
# -----------------------------------------------------------------------------

# The named termination masks, for the message of a SecondOrderOptimization row. TERMINATION_STALLED is
# new (SecondOrderOptimization's Q7); include it only when the loaded version defines it.
const SOO_TERMINATION_NAMES = let names = Pair{String, Int}[
        "cost_inf" => TERMINATION_COST_INF, "cost_nan" => TERMINATION_COST_NAN,
        "rel_dcost" => TERMINATION_REL_DCOST, "abs_dcost" => TERMINATION_ABS_DCOST,
        "step_inf" => TERMINATION_STEP_INF, "step_nan" => TERMINATION_STEP_NAN,
        "step_size" => TERMINATION_STEP_SIZE, "max_fails" => TERMINATION_MAX_FAILS,
        "max_iters" => TERMINATION_MAX_ITERS, "max_time" => TERMINATION_MAX_TIME,
        "cost_discrepancy" => TERMINATION_COST_DISCREPANCY, "start_not_finite" => TERMINATION_START_NOT_FINITE,
        "grad_not_finite" => TERMINATION_GRAD_NOT_FINITE, "grad_tol" => TERMINATION_GRAD_TOL,
        "linsolver_failed" => TERMINATION_LINSOLVER_FAILED]
    isdefined(SecondOrderOptimization, :TERMINATION_STALLED) && push!(names, "stalled" => getfield(SecondOrderOptimization, :TERMINATION_STALLED))
    Tuple(names)
end

soo_termination_message(termination::Integer) =
    join([name for (name, mask) in SOO_TERMINATION_NAMES if termination & mask != 0], ", ")

# OptimizerResult for a SecondOrderOptimization run: converged from isconverged, the reason from the named masks
function soo_result(t_total, timed, res)
    converged = isconverged(res)
    timed_out = !converged && (res.termination & TERMINATION_MAX_TIME != 0)
    return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, res.niterations, res.startcost, res.bestcost,
        converged; timed_out, message=soo_termination_message(res.termination))
end

"""
    optimize_soo(model; method=:dogleg, gtol=DEFAULT_GTOL, xtol=DEFAULT_XTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...) -> OptimizerResult

Optimizes a model using `SecondOrderOptimization.jl`.
Supported methods: `:dogleg`, `:lm` / `:levenbergmarquardt`.
"""
function optimize_soo(target; method=:dogleg, reduction=:auto, gtol=DEFAULT_GTOL, xtol=DEFAULT_XTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...)
    actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime
    opt = OptimizationOptions(iterator=soo_iterator(method), gtol=gtol, dstep=xtol, reldcost=ftol, maxiters=maxiters, maxtime=actual_maxtime; kwargs...)
    m = target isa ModelDefinition ? target.model : target
    if m isa BundleAdjustmentModel
        m = as_least_squares_problem(m)
    elseif !(m isa NLLSModel.Model || m isa LeastSquaresProblem || m isa AbstractNLPModel)
        error("Unsupported model type for optimize_soo: $(typeof(m))")
    end
    p = deepcopy(m)
    t_start = time_ns()
    timed = @timed soo_run!(p, opt; reduction=reduction)
    t_total = time_ns() - t_start
    return soo_result(t_total, timed, timed.value)
end

soo_iterator(method) = method === :lm ? :levenbergmarquardt :
    (method === :lm_dtd || method === :levenbergmarquardt_dtd) ? :levenbergmarquardt_dtd : method

"""
    optimize_nlls_soo(target; method=:dogleg, reduction=:auto, linsolver=:auto, gtol=DEFAULT_GTOL, xtol=DEFAULT_XTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...) -> OptimizerResult

Optimizes an `NLLSModel.Model` directly using `SecondOrderOptimization.jl` from a cold start,
measuring initialization and linear solver setup alongside outer iterations on an equal footing with all solvers.
"""
function optimize_nlls_soo(target; method=:dogleg, reduction=:auto, linsolver=:auto, gtol=DEFAULT_GTOL, xtol=DEFAULT_XTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...)
    if target isa ModelDefinition
        target.reset!()
        prob = target.model
    else
        prob = target
    end
    if !(prob isa NLLSModel.Model)
        return skipped_result("not an NLLSModel.Model")
    end

    actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime
    opt = OptimizationOptions(
        iterator=soo_iterator(method),
        linsolver=linsolver,
        gtol=gtol,
        dstep=xtol,
        reldcost=ftol,
        maxiters=maxiters,
        maxtime=actual_maxtime;
        kwargs...
    )

    p = deepcopy(prob)
    t_start = time_ns()
    timed = @timed SecondOrderOptimization.optimize!(p, opt; reduction=reduction)
    t_total = time_ns() - t_start
    return soo_result(t_total, timed, timed.value)
end

"""
    optimize_least_squares(model; method=:dogleg, gtol=DEFAULT_GTOL, xtol=DEFAULT_XTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...) -> OptimizerResult

Optimizes a model using `LeastSquaresOptim.jl`.
Supported methods: `:dogleg`, `:lm` / `:levenbergmarquardt`.
"""
function optimize_least_squares(target; method=:dogleg, gtol=DEFAULT_GTOL, xtol=DEFAULT_XTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...)
    m = target isa ModelDefinition ? target.model : target
    lso_method = (method === :lm || method === :levenbergmarquardt) ? LeastSquaresOptim.LevenbergMarquardt() : LeastSquaresOptim.Dogleg()

    if m isa NLLSModel.Model
        cb = NLLSModel.nls_callbacks(m)
        lsp = LeastSquaresProblem(x=copy(cb.x0), y=cb.r0, f! = cb.res!, g! = cb.jac!, J=copy(cb.J0))
        return optimize_least_squares(lsp; method=method, gtol=gtol, xtol=xtol, ftol=ftol, maxiters=maxiters, maxtime=maxtime, time_limit=time_limit, kwargs...)
    end

    if !(m isa LeastSquaresProblem)
        return skipped_result("not a LeastSquaresProblem")
    end

    lsp = deepcopy(m)
    n_vars = length(lsp.x)
    is_sparse = lsp.J isa SparseMatrixCSC
    if is_sparse
        # LeastSquaresOptim uses un-preconditioned iterative LSMR for sparse problems without timeout support.
        # Dogleg attempts to solve the un-damped Gauss-Newton system (singular on gauge-free problems like pose graphs),
        # causing LSMR to stall beyond ~5,000 variables.
        if (method === :dogleg && n_vars > 5000) || n_vars > 25000
            return skipped_result("sparse LSMR beyond $(method === :dogleg ? 5000 : 25000) variables")
        end
    end

    r0 = zeros(Float64, length(lsp.y))
    lsp.f!(r0, lsp.x)
    start_c = 0.5 * sum(abs2, r0)

    actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime
    actual_maxiters = (time_limit !== nothing && time_limit <= 1.0) ? min(maxiters, 10) : maxiters

    deadline = time_ns() + UInt64(round(actual_maxtime * 1e9))
    timed_out = Ref(false)
    last_r = copy(r0)
    iters_count = Ref(0)

    orig_f! = lsp.f!
    orig_g! = lsp.g!

    timeout_f!(r, x) = begin
        if time_ns() > deadline
            timed_out[] = true
            throw(TimeoutException())
        end
        orig_f!(r, x)
        copyto!(last_r, r)
    end

    timeout_g!(J, x) = begin
        if time_ns() > deadline
            timed_out[] = true
            throw(TimeoutException())
        end
        orig_g!(J, x)
        iters_count[] += 1
    end

    lsp_wrapped = LeastSquaresProblem(x=copy(lsp.x), y=lsp.y, f! = timeout_f!, g! = timeout_g!, J=lsp.J)

    t_start = time_ns()
    timed = try
        @timed LeastSquaresOptim.optimize!(lsp_wrapped, lso_method; g_tol=gtol, x_tol=xtol, f_tol=ftol, iterations=actual_maxiters, kwargs...)
    catch err
        if err isa TimeoutException || timed_out[]
            t_total = time_ns() - t_start
            final_c = 0.5 * sum(abs2, last_r)
            return OptimizerResult(Float64(t_total), 0, 0, iters_count[], start_c, final_c, false; timed_out=true, message="time limit")
        else
            rethrow(err)
        end
    end
    t_total = time_ns() - t_start
    res = timed.value

    final_c = timed_out[] ? 0.5 * sum(abs2, last_r) : res.ssr * 0.5
    converged = timed_out[] ? false : res.converged
    return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, res.iterations, start_c, final_c, converged;
        timed_out=timed_out[], message=timed_out[] ? "time limit" : converged ? "converged" : "not converged")
end

"""
    optimize_optim(model; method=:newton_trust_region, gtol=DEFAULT_GTOL, xtol=DEFAULT_XTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...) -> OptimizerResult

Optimizes a model using `Optim.jl`.
Supported methods: `:newton_trust_region`, `:newton`.
"""
function optimize_optim(target; method=:newton_trust_region, gtol=DEFAULT_GTOL, xtol=DEFAULT_XTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...)
    m = target isa ModelDefinition ? target.model : target
    optim_method = method === :newton ? Optim.Newton(linesearch=Optim.LineSearches.BackTracking()) : Optim.NewtonTrustRegion()
    actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime

    if m isa LeastSquaresProblem
        lsp = deepcopy(m)
        x0 = copy(lsp.x)
        n = length(x0)
        is_sparse = lsp.J isa SparseMatrixCSC

        if method === :newton_trust_region && is_sparse
            # NewtonTrustRegion requires dense eigen/factorization in Optim; unsupported for sparse problems.
            return skipped_result("NewtonTrustRegion needs a dense Hessian")
        end

        r_buf = zeros(Float64, length(lsp.y))
        J_buf = deepcopy(lsp.J)
        lsp.f!(r_buf, x0)
        start_c = 0.5 * sum(abs2, r_buf)

        H0 = if is_sparse
            _symbolic_jtj(lsp.J)
        else
            zeros(Float64, n, n)
        end
        g0 = zeros(Float64, n)

        last_eval_x = fill(NaN, n)
        eval_valid = Ref(false)

        function eval_at!(x)
            if !eval_valid[] || x != last_eval_x
                copyto!(last_eval_x, x)
                lsp.f!(r_buf, x)
                lsp.g!(J_buf, x)
                eval_valid[] = true
            end
        end

        fgh!(F, G, H, x) = begin
            if F !== nothing && G === nothing && H === nothing
                if eval_valid[] && x == last_eval_x
                    return 0.5 * sum(abs2, r_buf)
                end
                lsp.f!(r_buf, x)
                return 0.5 * sum(abs2, r_buf)
            end

            eval_at!(x)
            cost = 0.5 * sum(abs2, r_buf)

            if G !== nothing
                mul!(G, transpose(J_buf), r_buf)
            end
            if H !== nothing
                if is_sparse
                    H_calc = J_buf' * J_buf
                    if length(H.nzval) == length(H_calc.nzval)
                        copyto!(H.nzval, H_calc.nzval)
                    else
                        fill!(H.nzval, 0.0)
                        rows_c, cols_c, vals_c = findnz(H_calc)
                        @inbounds for (r, c, v) in zip(rows_c, cols_c, vals_c)
                            H[r, c] = v
                        end
                    end
                else
                    mul!(H, transpose(J_buf), J_buf)
                end
            end
            return cost
        end

        td = Optim.NLSolversBase.TwiceDifferentiable(Optim.NLSolversBase.only_fgh!(fgh!), copy(x0), start_c, g0, H0)
        opts = Optim.Options(g_abstol=gtol, x_abstol=xtol, f_reltol=ftol, iterations=maxiters, time_limit=actual_maxtime; kwargs...)

        t_start = time_ns()
        timed = @timed Optim.optimize(td, copy(x0), optim_method, opts)
        t_total = time_ns() - t_start
        res = timed.value

        return optim_result(t_total, timed, res.iterations, start_c, res.minimum)

    elseif m isa NLLSModel.Model
        p = deepcopy(m)
        f, fdf!, x0, H_proto = NLLSModel.optimvars(p)
        if !(x0 isa Vector{Float64})
            cb = NLLSModel.nls_callbacks(p)
            m_len = cb.nequ
            n_len = cb.nvar
            x0_cb = copy(cb.x0)
            is_sparse = cb.J0 isa SparseMatrixCSC

            if method === :newton_trust_region && is_sparse
                return skipped_result("NewtonTrustRegion needs a dense Hessian")
            end

            H0 = if is_sparse
                cb.J0' * cb.J0
            else
                zeros(Float64, n_len, n_len)
            end
            H_buf = deepcopy(H0)
            g0 = zeros(Float64, n_len)
            r_buf = zeros(Float64, m_len)
            J_buf = copy(cb.J0)
            cb.res!(r_buf, x0_cb)
            start_c = 0.5 * sum(abs2, r_buf)
            g_buf = zeros(Float64, n_len)
            last_nlls_x = fill(NaN, n_len)
            cost_cached = Ref(start_c)
            fdf_valid = Ref(false)

            function eval_cb_nlls!(x)
                if !fdf_valid[] || x != last_nlls_x
                    copyto!(last_nlls_x, x)
                    cb.res!(r_buf, x)
                    cost_cached[] = 0.5 * sum(abs2, r_buf)
                    cb.jac!(J_buf, x)
                    mul!(g_buf, transpose(J_buf), r_buf)
                    if is_sparse
                        H_calc = J_buf' * J_buf
                        if length(H_buf.nzval) == length(H_calc.nzval)
                            copyto!(H_buf.nzval, H_calc.nzval)
                        else
                            H_buf = H_calc
                        end
                    else
                        mul!(H_buf, transpose(J_buf), J_buf)
                    end
                    fdf_valid[] = true
                end
            end

            fgh_cb_nlls!(F, G, H, x) = begin
                eval_cb_nlls!(x)
                if G !== nothing
                    copyto!(G, g_buf)
                end
                if H !== nothing
                    copyto!(H, H_buf)
                end
                return cost_cached[]
            end

            td = Optim.NLSolversBase.TwiceDifferentiable(Optim.NLSolversBase.only_fgh!(fgh_cb_nlls!), copy(x0_cb), start_c, g0, H0)
            opts = Optim.Options(g_abstol=gtol, x_abstol=xtol, f_reltol=ftol, iterations=maxiters, time_limit=actual_maxtime; kwargs...)

            t_start = time_ns()
            timed = @timed Optim.optimize(td, copy(x0_cb), optim_method, opts)
            t_total = time_ns() - t_start
            res = timed.value
            return optim_result(t_total, timed, Optim.iterations(res), start_c, Optim.minimum(res))
        end
        n = length(x0)
        is_sparse = H_proto isa SparseMatrixCSC

        if method === :newton_trust_region && is_sparse
            # NewtonTrustRegion requires dense eigen/factorization in Optim; unsupported for sparse problems.
            return skipped_result("NewtonTrustRegion needs a dense Hessian")
        end

        H0, H_buf = if is_sparse
            (deepcopy(H_proto), deepcopy(H_proto))
        else
            (zeros(Float64, n, n), zeros(Float64, n, n))
        end

        g0 = zeros(Float64, n)
        start_c = f(copy(x0))
        g_buf = zeros(Float64, n)
        last_nlls_x = fill(NaN, n)
        cost_cached = Ref(start_c)
        fdf_valid = Ref(false)

        function eval_nlls!(x)
            if !fdf_valid[] || x != last_nlls_x
                copyto!(last_nlls_x, x)
                cost_cached[] = fdf!(g_buf, H_buf, x)
                fdf_valid[] = true
            end
        end

        fgh_nlls!(F, G, H, x) = begin
            if F !== nothing && G === nothing && H === nothing
                if fdf_valid[] && x == last_nlls_x
                    return cost_cached[]
                end
                return f(x)
            end
            eval_nlls!(x)
            if G !== nothing
                copyto!(G, g_buf)
            end
            if H !== nothing
                copyto!(H, H_buf)
            end
            return cost_cached[]
        end

        td = Optim.NLSolversBase.TwiceDifferentiable(Optim.NLSolversBase.only_fgh!(fgh_nlls!), copy(x0), start_c, g0, H0)
        opts = Optim.Options(g_abstol=gtol, x_abstol=xtol, f_reltol=ftol, iterations=maxiters, time_limit=actual_maxtime; kwargs...)

        t_start = time_ns()
        timed = @timed Optim.optimize(td, copy(x0), optim_method, opts)
        t_total = time_ns() - t_start
        res = timed.value
        return optim_result(t_total, timed, Optim.iterations(res), start_c, Optim.minimum(res))

    elseif m isa AbstractNLPModel
        nlp = deepcopy(m)
        x0 = copy(nlp.meta.x0)
        n = length(x0)
        start_c = NLPModels.obj(nlp, x0)

        rows, cols = NLPModels.hess_structure(nlp)
        vals = zeros(Float64, length(rows))
        is_sparse = length(rows) < (n * (n + 1) ÷ 2)

        if method === :newton_trust_region && is_sparse
            return skipped_result("NewtonTrustRegion needs a dense Hessian"; start_c)
        end

        f_nlp(x) = NLPModels.obj(nlp, x)
        g_nlp!(g, x) = NLPModels.grad!(nlp, x, g)
        g0 = zeros(Float64, n)

        H0, h_nlp! = if is_sparse
            H_tril = sparse(rows, cols, ones(Float64, length(rows)), n, n)
            H_init = sparse(Symmetric(H_tril, :L))
            (H_init, (H, x) -> begin
                NLPModels.hess_coord!(nlp, x, vals)
                copyto!(H_tril.nzval, vals)
                H_sym = sparse(Symmetric(H_tril, :L))
                copyto!(H.nzval, H_sym.nzval)
                return H
            end)
        else
            H_dense = zeros(Float64, n, n)
            h_dense_eval = (H, x) -> begin
                H_x = NLPModels.hess(nlp, x)
                copyto!(H, Symmetric(H_x, :L))
                return H
            end
            (H_dense, h_dense_eval)
        end

        td = Optim.NLSolversBase.TwiceDifferentiable(f_nlp, g_nlp!, h_nlp!, copy(x0), start_c, g0, H0)
        opts = Optim.Options(g_abstol=gtol, x_abstol=xtol, f_reltol=ftol, iterations=maxiters, time_limit=actual_maxtime; kwargs...)

        t_start = time_ns()
        timed = @timed Optim.optimize(td, copy(x0), optim_method, opts)
        t_total = time_ns() - t_start
        res = timed.value
        return optim_result(t_total, timed, Optim.iterations(res), start_c, Optim.minimum(res))

    else
        error("Unsupported model type for optimize_optim: $(typeof(m))")
    end
end

function optim_result(t_total, timed, iterations, start_c, final_c)
    res = timed.value
    converged = Optim.converged(res)
    timed_out = !converged && hasproperty(res, :time_run) && hasproperty(res, :time_limit) && res.time_run >= res.time_limit
    return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, iterations, start_c, final_c, converged;
        timed_out, message=timed_out ? "time limit" : converged ? "converged" : "not converged")
end

# OptimizerResult for a solver that reports a status symbol (JSOSolvers, Ipopt, CaNNOLeS)
function stats_result(t_total, timed, iterations, start_c, final_c, status)
    converged = status in (:first_order, :acceptable)
    return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, iterations, start_c, final_c, converged;
        timed_out=status === :max_time, message=string(status))
end

"""
    optimize_jsosolvers(model; solver=:trunk, gtol=DEFAULT_GTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...) -> OptimizerResult

Optimizes a model using `JSOSolvers.jl`.
Supported solvers: `:trunk`, `:tron`.
"""
function optimize_jsosolvers(target; solver=:trunk, gtol=DEFAULT_GTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...)
    m = target isa ModelDefinition ? target.model : target
    nlp = try
        as_nlsmodel(m)
    catch
        as_nlpmodel(m)
    end
    NLPModels.reset!(nlp)
    start_c = NLPModels.obj(nlp, nlp.meta.x0)
    actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime

    t_start = time_ns()
    timed = if solver === :tron
        @timed JSOSolvers.tron(nlp; atol=gtol, rtol=0.0, max_iter=maxiters, max_time=actual_maxtime, kwargs...)
    else
        @timed JSOSolvers.trunk(nlp; atol=gtol, rtol=0.0, max_iter=maxiters, max_time=actual_maxtime, kwargs...)
    end
    t_total = time_ns() - t_start
    res = timed.value

    return stats_result(t_total, timed, res.iter, start_c, res.objective, res.status)
end

"""
    optimize_ipopt(model; gtol=DEFAULT_GTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, print_level=0, time_limit=nothing, kwargs...) -> OptimizerResult

Optimizes a model using `Ipopt` via `NLPModelsIpopt`.
"""
function optimize_ipopt(target; gtol=DEFAULT_GTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, print_level=0, time_limit=nothing, kwargs...)
    nlp = as_nlpmodel(target)
    NLPModels.reset!(nlp)
    start_c = NLPModels.obj(nlp, nlp.meta.x0)
    actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime

    t_start = time_ns()
    timed = @timed NLPModelsIpopt.ipopt(nlp; tol=gtol, dual_inf_tol=gtol, acceptable_tol=gtol, max_iter=maxiters, max_wall_time=actual_maxtime, print_level=print_level, kwargs...)
    t_total = time_ns() - t_start
    res = timed.value

    return stats_result(t_total, timed, res.iter, start_c, res.objective, res.status)
end

"""
    UnconstrainedHessView(nlp)

Forwards an unconstrained `AbstractNLPModel` to MadNLP, routing the Lagrangian Hessian
`hess_coord!(nlp, x, y, vals)` (always called by MadNLP) to the objective-only Hessian.
Works around NLPModelsJuMP v0.13.6, whose `hess_coord!(::MathOptNLSModel, x, y, vals)`
accesses a non-existent `nls.nnln` field whenever the residuals are nonlinear.
"""
struct UnconstrainedHessView{T, S, M <: AbstractNLPModel{T, S}} <: AbstractNLPModel{T, S}
    inner::M
    meta::NLPModels.NLPModelMeta{T, S}
    counters::NLPModels.Counters
end
UnconstrainedHessView(nlp::AbstractNLPModel) = UnconstrainedHessView(nlp, nlp.meta, NLPModels.Counters())

NLPModels.obj(v::UnconstrainedHessView, x::AbstractVector) = NLPModels.obj(v.inner, x)
NLPModels.grad!(v::UnconstrainedHessView, x::AbstractVector, g::AbstractVector) = NLPModels.grad!(v.inner, x, g)
NLPModels.cons!(v::UnconstrainedHessView, x::AbstractVector, c::AbstractVector) = c
NLPModels.jac_structure!(v::UnconstrainedHessView, rows::AbstractVector{<:Integer}, cols::AbstractVector{<:Integer}) = (rows, cols)
NLPModels.jac_coord!(v::UnconstrainedHessView, x::AbstractVector, vals::AbstractVector) = vals
NLPModels.hess_structure!(v::UnconstrainedHessView, rows::AbstractVector{<:Integer}, cols::AbstractVector{<:Integer}) =
    NLPModels.hess_structure!(v.inner, rows, cols)
NLPModels.hess_coord!(v::UnconstrainedHessView, x::AbstractVector, vals::AbstractVector; obj_weight::Real=one(eltype(x))) =
    NLPModels.hess_coord!(v.inner, x, vals; obj_weight=Float64(obj_weight))
NLPModels.hess_coord!(v::UnconstrainedHessView, x::AbstractVector, y::AbstractVector, vals::AbstractVector; obj_weight::Real=one(eltype(x))) =
    NLPModels.hess_coord!(v.inner, x, vals; obj_weight=Float64(obj_weight))

"""
    optimize_madnlp(model; gtol=DEFAULT_GTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...) -> OptimizerResult

Optimizes a model using `MadNLP.jl`.
"""
function optimize_madnlp(target; gtol=DEFAULT_GTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...)
    nlp = as_nlpmodel(target)
    if nlp isa NLPModelsJuMP.MathOptNLSModel && nlp.meta.ncon == 0
        nlp = UnconstrainedHessView(nlp)
    end
    NLPModels.reset!(nlp)
    start_c = NLPModels.obj(nlp, nlp.meta.x0)
    actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime

    t_start = time_ns()
    timed = @timed MadNLP.madnlp(nlp; tol=gtol, acceptable_tol=gtol, max_iter=maxiters, max_wall_time=actual_maxtime, print_level=MadNLP.ERROR, kwargs...)
    t_total = time_ns() - t_start
    res = timed.value

    converged = res.status in (MadNLP.SOLVE_SUCCEEDED, MadNLP.SOLVED_TO_ACCEPTABLE_LEVEL)
    return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, res.iter, start_c, res.objective, converged;
        timed_out=res.status == MadNLP.MAXIMUM_WALLTIME_EXCEEDED, message=string(res.status))
end

"""
    optimize_nonlinearsolve(model; method=:lm, gtol=DEFAULT_GTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...) -> OptimizerResult

Optimizes a model using `NonlinearSolve.jl`.
Supported methods: `:lm`, `:trust_region`, `:gauss_newton`.
"""
function optimize_nonlinearsolve(target; method=:lm, gtol=DEFAULT_GTOL, ftol=DEFAULT_FTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...)
    m = target isa ModelDefinition ? target.model : target

    if m isa NLLSModel.Model
        cb = NLLSModel.nls_callbacks(m)
        m_len = cb.nequ
        n_len = cb.nvar
        if cb.J0 isa SparseMatrixCSC && n_len > 25000
            # Avoid excessive sparse QR solve time on massive sparse regimes
            return skipped_result("sparse QR beyond 25000 variables")
        end
        x0 = copy(cb.x0)
        actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime
        r_init = zeros(Float64, m_len)
        cb.res!(r_init, x0)
        start_c = 0.5 * sum(abs2, r_init)

        f_cb_nls!(du, u, p) = cb.res!(du, u)
        njac = Ref(0)
        jac_cb_nls!(J, u, p) = (njac[] += 1; cb.jac!(J, u))

        nl_func = NonlinearFunction(f_cb_nls!; jac=jac_cb_nls!, resid_prototype=zeros(Float64, m_len), jac_prototype=copy(cb.J0))
        prob = NonlinearLeastSquaresProblem(nl_func, x0)

        solver = if method === :trust_region || method === :dogleg
            (n_len <= 16 && !(cb.J0 isa SparseMatrixCSC)) ? NonlinearSolve.SimpleTrustRegion() : NonlinearSolve.TrustRegion()
        elseif method === :gauss_newton
            (n_len <= 16 && !(cb.J0 isa SparseMatrixCSC)) ? NonlinearSolve.SimpleGaussNewton() : NonlinearSolve.GaussNewton()
        else
            NonlinearSolve.LevenbergMarquardt()
        end

        t_start = time_ns()
        timed = @timed solve(prob, solver; abstol=gtol, reltol=ftol, maxiters=maxiters, maxtime=actual_maxtime, kwargs...)
        t_total = time_ns() - t_start
        return nonlinearsolve_result(t_total, timed, njac[], start_c)
    end

    if !(m isa LeastSquaresProblem)
        return skipped_result("not a LeastSquaresProblem")
    end

    lsp = deepcopy(m)
    m_len = length(lsp.y)
    n_len = length(lsp.x)
    x0 = copy(lsp.x)
    actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime

    if lsp.J isa SparseMatrixCSC && n_len > 25000
        # Avoid excessive sparse QR solve time on massive sparse regimes
        return skipped_result("sparse QR beyond 25000 variables")
    end

    r_init = zeros(Float64, m_len)
    lsp.f!(r_init, x0)
    start_c = 0.5 * sum(abs2, r_init)

    f_lsp_nls!(du, u, p) = lsp.f!(du, u)
    njac = Ref(0)
    jac_lsp_nls!(J, u, p) = (njac[] += 1; lsp.g!(J, u))

    nl_func = NonlinearFunction(f_lsp_nls!; jac=jac_lsp_nls!, resid_prototype=zeros(Float64, m_len), jac_prototype=deepcopy(lsp.J))
    prob = NonlinearLeastSquaresProblem(nl_func, x0)

    solver = if method === :trust_region || method === :dogleg
        (n_len <= 16 && !(lsp.J isa SparseMatrixCSC)) ? NonlinearSolve.SimpleTrustRegion() : NonlinearSolve.TrustRegion()
    elseif method === :gauss_newton
        (n_len <= 16 && !(lsp.J isa SparseMatrixCSC)) ? NonlinearSolve.SimpleGaussNewton() : NonlinearSolve.GaussNewton()
    else
        NonlinearSolve.LevenbergMarquardt()
    end

    t_start = time_ns()
    timed = @timed solve(prob, solver; abstol=gtol, reltol=ftol, maxiters=maxiters, maxtime=actual_maxtime, kwargs...)
    t_total = time_ns() - t_start
    return nonlinearsolve_result(t_total, timed, njac[], start_c)
end

function nonlinearsolve_result(t_total, timed, njac, start_c)
    sol = timed.value
    final_c = 0.5 * sum(abs2, sol.resid)
    converged = NonlinearSolve.SciMLBase.successful_retcode(sol.retcode)
    # Simple* solvers do not populate `stats`; fall back to Jacobian evaluations (one per iteration)
    iters = sol.stats === nothing ? njac : sol.stats.nsteps
    return OptimizerResult(Float64(t_total), Base.gc_alloc_count(timed.gcstats), timed.bytes, iters, start_c, final_c, converged;
        timed_out=sol.retcode == NonlinearSolve.SciMLBase.ReturnCode.MaxTime, message=string(sol.retcode))
end

"""
    optimize_cannoles(model; gtol=DEFAULT_GTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, time_limit=nothing, kwargs...) -> OptimizerResult

Optimizes a model using `CaNNOLeS.jl`.
"""
function optimize_cannoles(target; gtol=DEFAULT_GTOL, maxiters=DEFAULT_MAXITERS, maxtime=DEFAULT_MAXTIME, linsolve=:ldlfactorizations, time_limit=nothing, kwargs...)
    m = target isa ModelDefinition ? target.model : target
    nls = as_nlsmodel(m)
    NLPModels.reset!(nls)
    start_c = NLPModels.obj(nls, nls.meta.x0)
    actual_maxtime = time_limit !== nothing ? Float64(time_limit) : maxtime
    cannoles_method = :Newton_noFHess

    t_start = time_ns()
    timed = @timed CaNNOLeS.cannoles(nls; method=cannoles_method, linsolve=linsolve, atol=gtol, rtol=0.0, max_iter=maxiters, max_time=actual_maxtime, kwargs...)
    t_total = time_ns() - t_start
    stats = timed.value

    return stats_result(t_total, timed, stats.iter, start_c, stats.objective, stats.status)
end

# -----------------------------------------------------------------------------
# Standard Optimizer Sets
# -----------------------------------------------------------------------------

"""
    get_standard_optimizers() -> Vector{OptimizerDefinition}

Returns standard unified optimizer definitions for Euclidean problems on the standardized baseline model (e.g. `LeastSquaresProblem`).
Includes all solver families configured with universal stopping criteria.
"""
function get_standard_optimizers()
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
        OptimizerDefinition("NonlinearSolve (TrustRegion)", (m; kwargs...) -> optimize_nonlinearsolve(m; method=:trust_region, kwargs...)),
        OptimizerDefinition("CaNNOLeS", (m; kwargs...) -> optimize_cannoles(m; kwargs...))
    ]
end

# Backwards-compatibility aliases
get_tier1_optimizers() = get_standard_optimizers()
get_tier2_optimizers() = get_standard_optimizers()
