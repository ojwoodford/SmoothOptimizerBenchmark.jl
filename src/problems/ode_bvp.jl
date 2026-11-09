# 1D ODE Boundary Value Problem (Bratu Problem, Large Sparse Tridiagonal)
# Models nonlinear thermal diffusion / combustion:
#   -u''(x) = \lambda * exp(u(x)),  x in [0, 1],  u(0) = u(1) = 0
# Discretized using standard 2nd-order central differences across N interior grid points.
using Static, StaticArrays, LinearAlgebra, SparseArrays
using NLLSModel, LeastSquaresOptim, JuMP, Ipopt, JSOSolvers, NLPModels, NLPModelsJuMP, SecondOrderOptimization

const bratu_lambda_default = 1.0

ode_bvp_startpoint(n::Int) = zeros(Float64, n)

struct ODEBVPInternalResidual <: AbstractResidual
    inv_h2::Float64
    lambda::Float64
    varind::SVector{3, Int}
end
Base.eltype(::ODEBVPInternalResidual) = Float64
NLLSModel.ndeps(::ODEBVPInternalResidual) = static(3)
NLLSModel.nres(::ODEBVPInternalResidual) = static(1)
NLLSModel.varindices(r::ODEBVPInternalResidual) = r.varind
NLLSModel.getvars(r::ODEBVPInternalResidual, vars::AbstractVector) = (vars[r.varind[1]]::Float64, vars[r.varind[2]]::Float64, vars[r.varind[3]]::Float64)
NLLSModel.computeresidual(r::ODEBVPInternalResidual, u_prev, u_curr, u_next) = (-u_prev + 2.0 * u_curr - u_next) * r.inv_h2 - r.lambda * exp(u_curr)

struct ODEBVPBoundaryResidual <: AbstractResidual
    inv_h2::Float64
    lambda::Float64
    varind::SVector{2, Int}
    is_left::Bool
end
Base.eltype(::ODEBVPBoundaryResidual) = Float64
NLLSModel.ndeps(::ODEBVPBoundaryResidual) = static(2)
NLLSModel.nres(::ODEBVPBoundaryResidual) = static(1)
NLLSModel.varindices(r::ODEBVPBoundaryResidual) = r.varind
NLLSModel.getvars(r::ODEBVPBoundaryResidual, vars::AbstractVector) = (vars[r.varind[1]]::Float64, vars[r.varind[2]]::Float64)
function NLLSModel.computeresidual(r::ODEBVPBoundaryResidual, u1, u2)
    if r.is_left
        return (2.0 * u1 - u2) * r.inv_h2 - r.lambda * exp(u1)
    else
        return (-u1 + 2.0 * u2) * r.inv_h2 - r.lambda * exp(u2)
    end
end

function ode_bvp_res!(out, u, inv_h2::Float64=Float64((length(u)+1)^2), lambda::Float64=bratu_lambda_default)
    n = length(u)
    if n == 1
        out[1] = 2.0 * u[1] * inv_h2 - lambda * exp(u[1])
        return out
    end
    out[1] = (2.0 * u[1] - u[2]) * inv_h2 - lambda * exp(u[1])
    @inbounds for i in 2:n-1
        out[i] = (-u[i-1] + 2.0 * u[i] - u[i+1]) * inv_h2 - lambda * exp(u[i])
    end
    out[n] = (-u[n-1] + 2.0 * u[n]) * inv_h2 - lambda * exp(u[n])
    return out
end

function ode_bvp_jac!(J::SparseMatrixCSC, u, inv_h2::Float64=Float64((length(u)+1)^2), lambda::Float64=bratu_lambda_default)
    n = length(u)
    if n == 1
        J.nzval[1] = 2.0 * inv_h2 - lambda * exp(u[1])
        return J
    end
    # Column 1 (2 entries: (1,1) diag, (2,1) subdiag)
    J.nzval[1] = 2.0 * inv_h2 - lambda * exp(u[1])
    J.nzval[2] = -inv_h2

    # Columns 2 to n-1 (3 entries each: (j-1, j) superdiag, (j, j) diag, (j+1, j) subdiag)
    @inbounds for j in 2:n-1
        idx = 3 * j - 3
        J.nzval[idx]     = -inv_h2
        J.nzval[idx + 1] = 2.0 * inv_h2 - lambda * exp(u[j])
        J.nzval[idx + 2] = -inv_h2
    end

    # Column n (2 entries: (n-1, n) superdiag, (n, n) diag)
    idx_last = 3 * n - 3
    J.nzval[idx_last]     = -inv_h2
    J.nzval[idx_last + 1] = 2.0 * inv_h2 - lambda * exp(u[n])

    return J
end

function build_sparse_ode_bvp_lso(n::Int, lambda::Float64=bratu_lambda_default)
    h = 1.0 / (n + 1)
    inv_h2 = 1.0 / (h * h)
    x0 = ode_bvp_startpoint(n)

    # Build CSC sparsity structure directly
    # Total nonzeros: 3*n - 2 (for n >= 2)
    nnz_total = max(1, 3 * n - 2)
    colptr = Vector{Int}(undef, n + 1)
    rowval = Vector{Int}(undef, nnz_total)
    nzval = Vector{Float64}(undef, nnz_total)

    if n == 1
        colptr[1] = 1
        colptr[2] = 2
        rowval[1] = 1
        nzval[1] = 2.0 * inv_h2 - lambda * exp(x0[1])
    else
        colptr[1] = 1
        colptr[2] = 3
        rowval[1] = 1
        rowval[2] = 2
        for j in 2:n-1
            colptr[j+1] = 3 + 3 * (j - 1)
            idx = 3 * j - 3
            rowval[idx]     = j - 1
            rowval[idx + 1] = j
            rowval[idx + 2] = j + 1
        end
        colptr[n+1] = nnz_total + 1
        idx_last = 3 * n - 3
        rowval[idx_last]     = n - 1
        rowval[idx_last + 1] = n

        J = SparseMatrixCSC(n, n, colptr, rowval, nzval)
        ode_bvp_jac!(J, x0, inv_h2, lambda)
    end
    J = SparseMatrixCSC(n, n, colptr, rowval, nzval)
    ode_bvp_jac!(J, x0, inv_h2, lambda)

    res_closure! = (out, x) -> ode_bvp_res!(out, x, inv_h2, lambda)
    jac_closure! = (out_J, x) -> ode_bvp_jac!(out_J, x, inv_h2, lambda)

    return LeastSquaresProblem(x=x0, f! = res_closure!, g! = jac_closure!, J=J, output_length=n)
end

function build_sparse_ode_bvp_nlls(n::Int, lambda::Float64=bratu_lambda_default)
    h = 1.0 / (n + 1)
    inv_h2 = 1.0 / (h * h)
    costs = NLLSModel.CostStruct{Union{ODEBVPBoundaryResidual, ODEBVPInternalResidual}}()
    if n == 1
        push!(get(costs, ODEBVPBoundaryResidual), ODEBVPBoundaryResidual(inv_h2, lambda, SVector(1, 1), true))
    elseif n == 2
        push!(get(costs, ODEBVPBoundaryResidual), ODEBVPBoundaryResidual(inv_h2, lambda, SVector(1, 2), true))
        push!(get(costs, ODEBVPBoundaryResidual), ODEBVPBoundaryResidual(inv_h2, lambda, SVector(1, 2), false))
    else
        push!(get(costs, ODEBVPBoundaryResidual), ODEBVPBoundaryResidual(inv_h2, lambda, SVector(1, 2), true))
        for i in 2:n-1
            push!(get(costs, ODEBVPInternalResidual), ODEBVPInternalResidual(inv_h2, lambda, SVector(i-1, i, i+1)))
        end
        push!(get(costs, ODEBVPBoundaryResidual), ODEBVPBoundaryResidual(inv_h2, lambda, SVector(n-1, n), false))
    end
    return NLLSModel.Model(ode_bvp_startpoint(n), costs)
end

function build_sparse_ode_bvp_jso(n::Int, lambda::Float64=bratu_lambda_default)
    h = 1.0 / (n + 1)
    inv_h2 = 1.0 / (h * h)
    model = JuMP.Model()
    x0 = ode_bvp_startpoint(n)
    @variable(model, u[i = 1:n], start = x0[i])
    if n == 1
        @NLexpression(model, F[1], 2.0 * u[1] * inv_h2 - lambda * exp(u[1]))
    else
        @NLexpression(model, F_left, (2.0 * u[1] - u[2]) * inv_h2 - lambda * exp(u[1]))
        @NLexpression(model, F_mid[i = 2:n-1], (-u[i-1] + 2.0 * u[i] - u[i+1]) * inv_h2 - lambda * exp(u[i]))
        @NLexpression(model, F_right, (-u[n-1] + 2.0 * u[n]) * inv_h2 - lambda * exp(u[n]))
    end
    exprs = n == 1 ? [F[1]] : [F_left; [F_mid[i] for i in 2:n-1]; F_right]
    return MathOptNLSModel(model, exprs)
end

function create_ode_bvp_problem()
    ProblemDefinition(
        "1D ODE Boundary Value Problem",
        :large_sparse,
        Any[32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768],
        n -> begin
            x0 = ode_bvp_startpoint(n)
            h = 1.0 / (n + 1)
            inv_h2 = 1.0 / (h * h)

            # Model 1: NLLSModel Problem
            nlls_prob = build_sparse_ode_bvp_nlls(n)
            f_nlls, fdf_nlls!, x0_nlls, H_proto_nlls = NLLSModel.optimvars(nlls_prob)
            g_nlls = zeros(Float64, n)
            H_buf_nlls = H_proto_nlls === nothing ? zeros(Float64, n, n) : deepcopy(H_proto_nlls)
            m_nlls = ModelDefinition(
                "NLLSModel (Sparse)",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob),
                () -> (fdf_nlls!(g_nlls, H_buf_nlls, x0_nlls), H_buf_nlls),
                () -> copyto!(nlls_prob.variables, x0)
            )

            # Model 2: Standalone Sparse LeastSquaresProblem
            lsp = build_sparse_ode_bvp_lso(n)
            r_buf = zeros(Float64, n)
            g_buf = zeros(Float64, n)
            m_lso = ModelDefinition(
                "Standalone (Sparse)",
                lsp,
                () -> begin
                    ode_bvp_res!(r_buf, lsp.x, inv_h2, bratu_lambda_default)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    ode_bvp_res!(r_buf, lsp.x, inv_h2, bratu_lambda_default)
                    ode_bvp_jac!(lsp.J, lsp.x, inv_h2, bratu_lambda_default)
                    mul!(g_buf, lsp.J', r_buf)
                    H_sp = lsp.J' * lsp.J
                    return (0.5 * sum(abs2, r_buf), H_sp)
                end,
                () -> begin
                    copyto!(lsp.x, x0)
                    ode_bvp_jac!(lsp.J, x0, inv_h2, bratu_lambda_default)
                end
            )

            # Model 3: NLPModels Sparse (up to 32k)
            models = ModelDefinition[m_nlls, m_lso]
            if n <= 32768
                nls = build_sparse_ode_bvp_jso(n)
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
        "Grid Points N"
    )
end
