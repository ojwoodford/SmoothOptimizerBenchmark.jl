# Multi-dimensional Rosenbrock Dense (Large Dense, from Gist 789e85)
using Static, StaticArrays, LinearAlgebra
using NLLSModel, LeastSquaresOptim, JuMP, Ipopt, JSOSolvers, NLPModels, NLPModelsJuMP, SecondOrderOptimization
const MOI = JuMP.MOI

const rosen_diag_w_dense = 1.2
const rosen_offdiag_w_dense = 1.0

rosen_startpoint(n::Int) = Float64[i % 2 == 0 ? 1.0 : -1.2 for i in 1:n]

struct RosenDiagDense <: NLLSModel.AbstractResidual
    weight::Float64
    varind::Int
end
Base.eltype(::RosenDiagDense) = Float64
NLLSModel.ndeps(::RosenDiagDense) = static(1)
NLLSModel.nres(::RosenDiagDense) = static(1)
NLLSModel.varindices(res::RosenDiagDense) = res.varind
NLLSModel.getvars(res::RosenDiagDense, vars::AbstractVector) = (vars[res.varind]::Float64,)
NLLSModel.computeresidual(res::RosenDiagDense, x) = res.weight * (x - 1.0)

struct RosenOffDiagDense <: NLLSModel.AbstractResidual
    weight::Float64
    varind::SVector{2, Int}
end
Base.eltype(::RosenOffDiagDense) = Float64
NLLSModel.ndeps(::RosenOffDiagDense) = static(2)
NLLSModel.nres(::RosenOffDiagDense) = static(1)
NLLSModel.varindices(res::RosenOffDiagDense) = res.varind
NLLSModel.getvars(res::RosenOffDiagDense, vars::AbstractVector) = (vars[res.varind[1]]::Float64, vars[res.varind[2]]::Float64)
NLLSModel.computeresidual(res::RosenOffDiagDense, x, y) = res.weight * (y - x^2)

function rosenbrock_dense_res!(out, x)
    n = length(x)
    @inbounds for k in 1:n
        out[k] = rosen_diag_w_dense * (x[k] - 1.0)
    end
    i = n + 1
    @inbounds for j in 1:n-1
        xj2 = x[j]^2
        for k in j+1:n
            out[i] = rosen_offdiag_w_dense * (x[k] - xj2)
            i += 1
        end
    end
    return out
end

function build_nlls_dense(n::Int)
    costs = NLLSModel.CostStruct{Union{RosenDiagDense, RosenOffDiagDense}}()
    append!(get(costs, RosenDiagDense), [RosenDiagDense(rosen_diag_w_dense, k) for k in 1:n])
    append!(get(costs, RosenOffDiagDense), vcat(collect(Iterators.flatten([[RosenOffDiagDense(rosen_offdiag_w_dense, SVector(j, k)) for k in j+1:n] for j in 1:n-1]))))
    return NLLSModel.Model(rosen_startpoint(n), costs)
end

function build_jso_dense(n::Int)
    model = JuMP.Model()
    x0 = rosen_startpoint(n)
    @variable(model, x[i = 1:n], start = x0[i])
    FA = Any[]
    for j in 1:n-1
        for k in j+1:n
            push!(FA, @NLexpression(model, rosen_offdiag_w_dense * (x[k] - x[j]^2)))
        end
    end
    @expression(model, FB[k = 1:n], rosen_diag_w_dense * (x[k] - 1.0))
    return MathOptNLSModel(model, [FA; FB])
end

function create_rosenbrock_dense_problem()
    ProblemDefinition(
        "Dense Multi-dimensional Rosenbrock",
        :small_dense,
        Any[2, 3, 4, 5, 6, 8, 10, 14, 18, 22, 26, 32],
        n -> begin
            x0 = rosen_startpoint(n)
            m_len = n + ((n - 1) * n) >> 1

            # Model 1: NLLSModel
            nlls_prob = build_nlls_dense(n)
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

            # Model 2: Standalone
            r_buf = zeros(Float64, m_len)
            x_lso = copy(x0)
            lsp = LeastSquaresProblem(x=x_lso, f! = rosenbrock_dense_res!, output_length=m_len, autodiff=:forward)
            J_buf = deepcopy(lsp.J)
            g_buf = zeros(Float64, n)
            H_buf = zeros(Float64, n, n)
            m_lso = ModelDefinition(
                "Standalone",
                lsp,
                () -> begin
                    rosenbrock_dense_res!(r_buf, x_lso)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    rosenbrock_dense_res!(r_buf, x_lso)
                    lsp.g!(J_buf, x_lso)
                    mul!(g_buf, J_buf', r_buf)
                    mul!(H_buf, J_buf', J_buf)
                    return (0.5 * sum(abs2, r_buf), H_buf)
                end,
                () -> copyto!(x_lso, x0)
            )

            # Model 3: NLPModels / MathOptNLSModel
            nls = build_jso_dense(n)
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

            return [m_nlls, m_lso, m_nlp]
        end,
        get_standard_optimizers(; tall=true),
        "Dimension n"
    )
end
