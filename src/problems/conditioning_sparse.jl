# Sparse Conditioning Sweep (Large Sparse): a fixed size, the condition number of the Jacobian swept
#
# N = 32768 scalar unknowns u and N residuals r_i(u) = s·[α(−u_{i−1} + 2u_i − u_{i+1}) + u_i + 0.1·sin(u_i) − f_i], with
# u_0 = u_{N+1} = 0. J = s·(α·L + Diagonal(1 + 0.1·cos u)) is symmetric tridiagonal, L the second-difference matrix,
# whose eigenvalues lie in (λ₁, 4) with λ₁ = 4·sin²(π/(2(N + 1))). With α = (0.9κ − 1.1)/(4 − κλ₁) and
# s = 1/(4α + 1.1), J's eigenvalues lie between s(αλ₁ + 0.9) = 1/κ and 1, so cond(J) is between κ/1.25 and κ (κλ₁ < 4
# needs κ below 4.3e8). The scale s keeps the largest singular value at 1 along the sweep, so that the residuals' size
# does not change with κ. The solution u*_i = sin(3πi/(N + 1)) + 0.5·(−1)^i is stated: its smooth part lies in J's
# weakest directions and its alternating part in the strongest.
#
# Every cost has at most 3 inputs: autodiff (DM1). The residual types are the ODE BVP's in form: one with two variables
# at each end, one with three inside.

const SPARSE_CONDITIONING_N = 32768
const SPARSE_CONDITIONING_KAPPAS = Any[1e1, 3e1, 1e2, 3e2, 1e3, 3e3, 1e4, 3e4, 1e5, 3e5, 1e6, 3e6, 1e7, 3e7, 1e8]

# The diffusion weight α and the scale s of condition number κ at N unknowns
function sparse_conditioning_coefficients(κ::Real, n::Int=SPARSE_CONDITIONING_N)
    λ1 = 4 * sin(pi / (2 * (n + 1)))^2
    κ * λ1 < 4 || throw(ArgumentError("κ = $κ: the sparse conditioning sweep needs κ·λ₁ < 4, κ below $(4 / λ1)"))
    α = (0.9 * κ - 1.1) / (4 - κ * λ1)
    return α, 1 / (4 * α + 1.1)
end

sparse_conditioning_solution(n::Int=SPARSE_CONDITIONING_N) = [sin(3 * pi * i / (n + 1)) + 0.5 * (isodd(i) ? -1.0 : 1.0) for i in 1:n]
sparse_conditioning_startpoint(n::Int=SPARSE_CONDITIONING_N) = zeros(n)

# f = α·L·u* + u* + 0.1·sin(u*)
function sparse_conditioning_rhs(α::Real, ustar::Vector{Float64})
    n = length(ustar)
    f = similar(ustar)
    for i in 1:n
        left = i > 1 ? ustar[i - 1] : 0.0
        right = i < n ? ustar[i + 1] : 0.0
        f[i] = α * (-left + 2 * ustar[i] - right) + conditioning_phi(ustar[i])
    end
    return f
end

struct SparseConditioningInternalResidual <: AbstractResidual
    alpha::Float64
    scale::Float64
    f::Float64
    varind::SVector{3, Int}
end
Base.eltype(::SparseConditioningInternalResidual) = Float64
NLLSModel.ndeps(::SparseConditioningInternalResidual) = static(3)
NLLSModel.nres(::SparseConditioningInternalResidual) = static(1)
NLLSModel.varindices(r::SparseConditioningInternalResidual) = r.varind
NLLSModel.getvars(r::SparseConditioningInternalResidual, vars::AbstractVector) =
    (vars[r.varind[1]]::Float64, vars[r.varind[2]]::Float64, vars[r.varind[3]]::Float64)
NLLSModel.computeresidual(r::SparseConditioningInternalResidual, u_prev, u_curr, u_next) =
    r.scale * (r.alpha * (-u_prev + 2 * u_curr - u_next) + u_curr + 0.1 * sin(u_curr) - r.f)

# The residual at either end: `is_left` for i = 1 (variables u_1, u_2), else i = N (variables u_{N−1}, u_N)
struct SparseConditioningBoundaryResidual <: AbstractResidual
    alpha::Float64
    scale::Float64
    f::Float64
    varind::SVector{2, Int}
    is_left::Bool
end
Base.eltype(::SparseConditioningBoundaryResidual) = Float64
NLLSModel.ndeps(::SparseConditioningBoundaryResidual) = static(2)
NLLSModel.nres(::SparseConditioningBoundaryResidual) = static(1)
NLLSModel.varindices(r::SparseConditioningBoundaryResidual) = r.varind
NLLSModel.getvars(r::SparseConditioningBoundaryResidual, vars::AbstractVector) = (vars[r.varind[1]]::Float64, vars[r.varind[2]]::Float64)
function NLLSModel.computeresidual(r::SparseConditioningBoundaryResidual, u1, u2)
    u, lap = r.is_left ? (u1, 2 * u1 - u2) : (u2, -u1 + 2 * u2)
    return r.scale * (r.alpha * lap + u + 0.1 * sin(u) - r.f)
end

function build_sparse_conditioning_nlls(κ::Real, n::Int=SPARSE_CONDITIONING_N)
    α, s = sparse_conditioning_coefficients(κ, n)
    f = sparse_conditioning_rhs(α, sparse_conditioning_solution(n))
    costs = NLLSModel.CostStruct{Union{SparseConditioningBoundaryResidual, SparseConditioningInternalResidual}}()
    push!(get(costs, SparseConditioningBoundaryResidual), SparseConditioningBoundaryResidual(α, s, f[1], SVector(1, 2), true))
    for i in 2:n-1
        push!(get(costs, SparseConditioningInternalResidual), SparseConditioningInternalResidual(α, s, f[i], SVector(i - 1, i, i + 1)))
    end
    push!(get(costs, SparseConditioningBoundaryResidual), SparseConditioningBoundaryResidual(α, s, f[n], SVector(n - 1, n), false))
    return NLLSModel.Model(sparse_conditioning_startpoint(n), costs)
end

# The JuMP model: the same residuals, in the same order as the Standalone model's (the two boundary residuals, then
# the interior ones; see `create_sparse_conditioning_problem`)
function build_jump_sparse_conditioning(κ::Real, n::Int=SPARSE_CONDITIONING_N)
    α, s = sparse_conditioning_coefficients(κ, n)
    f = sparse_conditioning_rhs(α, sparse_conditioning_solution(n))
    x0 = sparse_conditioning_startpoint(n)
    model = JuMP.Model()
    @variable(model, u[i = 1:n], start = x0[i])
    F_left = @NLexpression(model, s * (α * (2 * u[1] - u[2]) + u[1] + 0.1 * sin(u[1]) - f[1]))
    F_right = @NLexpression(model, s * (α * (-u[n-1] + 2 * u[n]) + u[n] + 0.1 * sin(u[n]) - f[n]))
    F_mid = [@NLexpression(model, s * (α * (-u[i-1] + 2 * u[i] - u[i+1]) + u[i] + 0.1 * sin(u[i]) - f[i])) for i in 2:n-1]
    return MathOptNLSModel(model, [F_left; F_right; F_mid])
end

# The SecondOrderOptimization row's configuration (IND4): NLLSModel's recommendoptimizer at the last value of the sweep,
# κ = 1e8, and the same at every κ (decision 17), with numthreads = 1, evaluated 2026-11-20 at NLLSModel d2e4374
# (Julia 1.13.3); rules F_illconditioned, RS_jacobian, L_jacobian, I_lm. At κ = 10 it would be the Hessian path
# (F_wellconditioned, linsolver = :ldl)
const SPARSE_CONDITIONING_SOO = (; iterator = :levenbergmarquardt, linsolver = :qr, formulation = :jacobian, reduction = :none, storage = :sparse)

function create_sparse_conditioning_problem()
    ProblemDefinition(
        "Sparse Conditioning Sweep",
        :large_sparse,
        copy(SPARSE_CONDITIONING_KAPPAS),
        κ -> begin
            n = SPARSE_CONDITIONING_N
            x0 = sparse_conditioning_startpoint(n)

            # Model 1: NLLSModel, sparse
            nlls_prob = build_sparse_conditioning_nlls(κ, n)
            nt = benchmark_numthreads()
            f_nlls, fdf_nlls!, x0_nlls, H_proto_nlls = NLLSModel.optimvars(nlls_prob; unfixed=nothing, numthreads=nt)
            g_nlls = zeros(Float64, n)
            H_buf_nlls = H_proto_nlls === nothing ? zeros(Float64, n, n) : deepcopy(H_proto_nlls)
            m_nlls = ModelDefinition(
                "NLLSModel (Sparse)",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob, nt),
                () -> (fdf_nlls!(g_nlls, H_buf_nlls, x0_nlls), H_buf_nlls),
                () -> copyto!(nlls_prob.variables, x0)
            )

            # Model 2: Standalone (Sparse): the NLLSModel model's own costs, filled cost by cost by NLLSModel's
            # computeresidual and computeresjac (autodiff), in a plain loop, into a sparsity pattern computed once (DM5)
            lsp = standalone_problem((get(nlls_prob.costs, SparseConditioningBoundaryResidual),
                                      get(nlls_prob.costs, SparseConditioningInternalResidual)), x0; sparse=true)
            r_buf = zeros(Float64, n)
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

            # Model 3: JuMP, as a MathOptNLSModel
            m_jump = jump_model("JuMP", build_jump_sparse_conditioning(κ, n), x0)

            return ModelDefinition[m_jump, m_nlls, m_lso]   # alphabetical (IND8)
        end,
        get_standard_optimizers(SPARSE_CONDITIONING_SOO),
        "Condition Number κ",
        # Zero-residual: the data are computed from the stated solution
        _ -> 0.0;
        # Derivatives (DM1): every cost has at most 3 inputs
        derivatives = :autodiff,
        # The stated solution, the same at every κ, in the variables' layout (CN2)
        reference_solution = _ -> sparse_conditioning_solution()
    )
end
