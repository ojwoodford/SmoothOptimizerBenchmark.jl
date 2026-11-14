# Multi-dimensional Rosenbrock Sparse (Large Sparse, from Gist 789e85)
using Static, StaticArrays, LinearAlgebra, SparseArrays
using NLLSModel, LeastSquaresOptim, JuMP, Ipopt, JSOSolvers, NLPModels, NLPModelsJuMP, SecondOrderOptimization
const MOI = JuMP.MOI

const rosen_diag_w_sparse = 10.0
const rosen_offdiag_w_sparse = 10.0

rosen_sparse_startpoint(n::Int) = fill(0.5, n)

struct RosenDiagSparse <: NLLSModel.AbstractResidual
    weight::Float64
    varind::Int
end
Base.eltype(::RosenDiagSparse) = Float64
NLLSModel.ndeps(::RosenDiagSparse) = static(1)
NLLSModel.nres(::RosenDiagSparse) = static(1)
NLLSModel.varindices(res::RosenDiagSparse) = res.varind
NLLSModel.getvars(res::RosenDiagSparse, vars::AbstractVector) = (vars[res.varind]::Float64,)
NLLSModel.computeresidual(res::RosenDiagSparse, x) = res.weight * (x - 1.0)

struct RosenOffDiagSparse <: NLLSModel.AbstractResidual
    weight::Float64
    varind::SVector{2, Int}
end
Base.eltype(::RosenOffDiagSparse) = Float64
NLLSModel.ndeps(::RosenOffDiagSparse) = static(2)
NLLSModel.nres(::RosenOffDiagSparse) = static(1)
NLLSModel.varindices(res::RosenOffDiagSparse) = res.varind
NLLSModel.getvars(res::RosenOffDiagSparse, vars::AbstractVector) = (vars[res.varind[1]]::Float64, vars[res.varind[2]]::Float64)
NLLSModel.computeresidual(res::RosenOffDiagSparse, x, y) = res.weight * (y - x^2)

function rosenbrock_sparse_res!(out, x)
    n = length(x)
    @inbounds for k in 1:n-1
        out[2*k - 1] = rosen_diag_w_sparse * (x[k] - 1.0)
        out[2*k]     = rosen_offdiag_w_sparse * (x[k+1] - x[k]^2)
    end
    out[2*n - 1] = rosen_diag_w_sparse * (x[n] - 1.0)
    return out
end

function rosenbrock_sparse_jac!(out, x)
    n = length(x)
    @inbounds for k in 1:n-1
        out.nzval[3*k - 2] = rosen_diag_w_sparse
        out.nzval[3*k - 1] = -2.0 * rosen_offdiag_w_sparse * x[k]
        out.nzval[3*k]     = rosen_offdiag_w_sparse
    end
    out.nzval[end] = rosen_diag_w_sparse
    return out
end

function build_sparse_lso(n::Int)
    len = 2 * n - 1
    x0 = rosen_sparse_startpoint(n)
    rows = vcat(collect(Iterators.flatten([(2*k-1, 2*k, 2*k) for k in 1:(n-1)])), len)
    cols = vcat(collect(Iterators.flatten([(k, k, k+1) for k in 1:(n-1)])), n)
    J = SparseArrays.sparse(rows, cols, ones(3*n - 2), len, n)
    rosenbrock_sparse_jac!(J, x0)
    return LeastSquaresProblem(x=x0, f! = rosenbrock_sparse_res!, g! = rosenbrock_sparse_jac!, J=J, output_length=len)
end

function build_sparse_nlls(n::Int)
    costs = NLLSModel.CostStruct{Union{RosenDiagSparse, RosenOffDiagSparse}}()
    append!(get(costs, RosenDiagSparse), [RosenDiagSparse(rosen_diag_w_sparse, k) for k in 1:n])
    append!(get(costs, RosenOffDiagSparse), [RosenOffDiagSparse(rosen_offdiag_w_sparse, SVector(k, k+1)) for k in 1:n-1])
    return NLLSModel.Model(rosen_sparse_startpoint(n), costs)
end

function build_sparse_jso(n::Int)
    model = JuMP.Model()
    x0 = rosen_sparse_startpoint(n)
    @variable(model, x[i = 1:n], start = x0[i])
    @NLexpression(model, FA[k = 1:(n - 1)], rosen_offdiag_w_sparse * (x[k + 1] - x[k]^2))
    @expression(model, FB[k = 1:n], rosen_diag_w_sparse * (x[k] - 1.0))
    return MathOptNLSModel(model, [FA; FB])
end

function create_rosenbrock_sparse_problem()
    ProblemDefinition(
        "Sparse Multi-dimensional Rosenbrock",
        :large_sparse,
        Any[100, 250, 500, 1000, 2500, 5000, 10000, 20000, 35000, 50000, 75000],
        n -> begin
            x0 = rosen_sparse_startpoint(n)
            len = 2 * n - 1

            # Model 1: NLLSModel Problem
            nlls_prob = build_sparse_nlls(n)
            nt = benchmark_numthreads()
            f_nlls, fdf_nlls!, x0_nlls, H_proto_nlls = NLLSModel.optimvars(nlls_prob, nothing, nt)
            g_nlls = zeros(Float64, n)
            H_buf_nlls = H_proto_nlls === nothing ? zeros(Float64, n, n) : deepcopy(H_proto_nlls)
            m_nlls = ModelDefinition(
                "NLLSModel",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob, nt),
                () -> (fdf_nlls!(g_nlls, H_buf_nlls, x0_nlls), H_buf_nlls),
                () -> copyto!(nlls_prob.variables, x0)
            )

            # Model 2: Standalone Sparse
            lsp = build_sparse_lso(n)
            r_buf = zeros(Float64, len)
            g_buf = zeros(Float64, n)
            m_lso = ModelDefinition(
                "Standalone (Sparse)",
                lsp,
                () -> begin
                    rosenbrock_sparse_res!(r_buf, lsp.x)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    rosenbrock_sparse_res!(r_buf, lsp.x)
                    rosenbrock_sparse_jac!(lsp.J, lsp.x)
                    mul!(g_buf, lsp.J', r_buf)
                    H_sp = lsp.J' * lsp.J
                    return (0.5 * sum(abs2, r_buf), H_sp)
                end,
                () -> begin
                    copyto!(lsp.x, x0)
                    rosenbrock_sparse_jac!(lsp.J, x0)
                end
            )

            # Model 3: NLPModels Sparse (up to 32k to avoid JuMP AST memory overhead)
            models = ModelDefinition[m_nlls, m_lso]
            if n <= 32768
                nls = build_sparse_jso(n)
                g_nlp = zeros(Float64, n)
                h_vals_nlp = zeros(Float64, nls.meta.nnzh)
                m_nlp = ModelDefinition(
                    "NLPModels (MathOptNLSModel)",
                    nls,
                    () -> begin
                        reset_nlp_cache!(nls)
                        NLPModels.obj(nls, x0)
                    end,
                    () -> begin
                        reset_nlp_cache!(nls)
                        c = NLPModels.obj(nls, x0)
                        NLPModels.grad!(nls, x0, g_nlp)
                        NLPModels.hess_coord!(nls, x0, h_vals_nlp)
                        return (c, h_vals_nlp)
                    end,
                    () -> begin
                        copyto!(nls.meta.x0, x0)
                        reset_nlp_cache!(nls)
                    end
                )
                push!(models, m_nlp)
            end

            return models
        end,
        get_standard_optimizers(),
        "Variables n"
    )
end
