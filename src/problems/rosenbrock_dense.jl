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

# The SecondOrderOptimization row's configuration (IND4): NLLSModel's recommendoptimizer at the largest size, n = 32,
# with numthreads = 1, evaluated 2026-11-19 at NLLSModel 78a4ef5 (Julia 1.13.3); rules F_wellconditioned, RS_hessian, L_dense, I_lm
const ROSENBROCK_DENSE_SOO = (; iterator = :levenbergmarquardt, linsolver = :cholesky, formulation = :hessian, reduction = :none, storage = :dense)

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

            # Model 2: Standalone: the NLLSModel model's own costs, their residuals and Jacobians filled cost by cost by
            # NLLSModel's computeresidual and computeresjac (autodiff), in a plain loop, into a dense J (DM6)
            lsp = standalone_problem((get(nlls_prob.costs, RosenDiagDense), get(nlls_prob.costs, RosenOffDiagDense)), x0)
            x_lso = lsp.x
            r_buf = zeros(Float64, m_len)
            J_buf = deepcopy(lsp.J)
            g_buf = zeros(Float64, n)
            H_buf = zeros(Float64, n, n)
            m_lso = ModelDefinition(
                "Standalone",
                lsp,
                () -> begin
                    lsp.f!(r_buf, x_lso)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    lsp.f!(r_buf, x_lso)
                    lsp.g!(J_buf, x_lso)
                    mul!(g_buf, J_buf', r_buf)
                    mul!(H_buf, J_buf', J_buf)
                    return (0.5 * sum(abs2, r_buf), H_buf)
                end,
                () -> copyto!(x_lso, x0)
            )

            # Model 3: JuMP, as a MathOptNLSModel
            m_jump = jump_model("JuMP", build_jso_dense(n), x0)

            return [m_nlls, m_lso, m_jump]
        end,
        get_standard_optimizers(ROSENBROCK_DENSE_SOO),
        "Dimension n",
        # The global minimum, x = 1, has zero residuals (IT4)
        _ -> 0.0;
        # Derivatives (DM1): every cost has at most 2 inputs
        derivatives = :autodiff
    )
end
