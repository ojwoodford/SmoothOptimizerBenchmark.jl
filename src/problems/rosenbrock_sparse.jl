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
            f_nlls, fdf_nlls!, x0_nlls, H_proto_nlls = NLLSModel.optimvars(nlls_prob; unfixed=nothing, numthreads=nt)
            g_nlls = zeros(Float64, n)
            H_buf_nlls = H_proto_nlls === nothing ? zeros(Float64, n, n) : deepcopy(H_proto_nlls)
            m_nlls = ModelDefinition(
                "NLLSModel",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob, nt),
                () -> (fdf_nlls!(g_nlls, H_buf_nlls, x0_nlls), H_buf_nlls),
                () -> copyto!(nlls_prob.variables, x0)
            )

            # Model 2: Standalone (Sparse): the NLLSModel model's own costs, their residuals and Jacobians filled cost by
            # cost by NLLSModel's computeresidual and computeresjac (autodiff), in a plain loop, into a sparsity pattern
            # computed once (DM7)
            lsp = standalone_problem((get(nlls_prob.costs, RosenDiagSparse), get(nlls_prob.costs, RosenOffDiagSparse)), x0;
                                     sparse=true)
            r_buf = zeros(Float64, len)
            g_buf = zeros(Float64, n)
            m_lso = ModelDefinition(
                "Standalone (Sparse)",
                lsp,
                () -> begin
                    lsp.f!(r_buf, lsp.x)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    lsp.f!(r_buf, lsp.x)
                    lsp.g!(lsp.J, lsp.x)
                    mul!(g_buf, lsp.J', r_buf)
                    H_sp = lsp.J' * lsp.J
                    return (0.5 * sum(abs2, r_buf), H_sp)
                end,
                () -> copyto!(lsp.x, x0)
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
        get_standard_optimizers(; tall=true, lsmr=true),
        "Variables n",
        # The global minimum, x = 1, has zero residuals (IT4)
        _ -> 0.0;
        # Derivatives (DM1): every cost has at most 2 inputs
        derivatives = :autodiff
    )
end
