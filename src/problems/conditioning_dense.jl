# Dense Conditioning Sweep (Medium Dense): a fixed size, the condition number of the Jacobian swept
#
# N = 100 unknowns x in one Vector{Float64} variable, M = 400 residuals r_i(x) = Σ_k A[i, k]·φ(x_k) − b_i with
# φ(x) = x + 0.1·sin(x), one cost per residual. A = U·Diagonal(σ)·Vᵀ, U (M × N) and V (N × N) the orthonormal cosine
# (DCT-II) bases, σ_k = κ^(−(k − 1)/(N − 1)): cond(A) = κ exactly, and J = A·Diagonal(1 + 0.1·cos x) is within a factor
# 1.1/0.9 of it. The ill-conditioning is in the spectrum only: no diagonal scaling of the variables removes it. No random
# stream is used. The solution x*_j = sin(j) is stated (b = A·φ(x*)), so the harness measures each row's error in the
# solution, which is what this problem is for: at a zero residual the cost does not see the weak directions.
#
# A cost has 100 inputs, so the problem is analytic (DM1): each cost has a hand-written Jacobian, A[i, k]·φ′(x_k), and
# owns its buffers.

const DENSE_CONDITIONING_N = 100
const DENSE_CONDITIONING_M = 400
const DENSE_CONDITIONING_KAPPAS = Any[10.0^k for k in 0:12]

# The orthonormal cosine basis of size m × n: B[i, k] = √(2/m)·cos(π(i − ½)(k − 1)/m), its first column divided by √2
function cosine_basis(m::Int, n::Int)
    B = [sqrt(2 / m) * cos(pi * (i - 0.5) * (k - 1) / m) for i in 1:m, k in 1:n]
    B[:, 1] ./= sqrt(2)
    return B
end

dense_conditioning_singular_values(κ::Real) =
    [Float64(κ)^(-(k - 1) / (DENSE_CONDITIONING_N - 1)) for k in 1:DENSE_CONDITIONING_N]
dense_conditioning_matrix(κ::Real) = cosine_basis(DENSE_CONDITIONING_M, DENSE_CONDITIONING_N) *
    Diagonal(dense_conditioning_singular_values(κ)) * transpose(cosine_basis(DENSE_CONDITIONING_N, DENSE_CONDITIONING_N))

conditioning_phi(x) = x + 0.1 * sin(x)
dense_conditioning_solution() = [sin(Float64(j)) for j in 1:DENSE_CONDITIONING_N]
dense_conditioning_startpoint() = zeros(DENSE_CONDITIONING_N)

"""
    dense_conditioning_data(κ) -> (A, b)

The matrix of condition number `κ` and the data whose least-squares solution, with zero residual, is
`dense_conditioning_solution()`.
"""
function dense_conditioning_data(κ::Real)
    A = dense_conditioning_matrix(κ)
    return A, A * conditioning_phi.(dense_conditioning_solution())
end

# One residual, Σ_k a_k·φ(x_k) − b, on the one Vector{Float64} variable; its buffers its own (NLLSModel's contract for
# returned arrays). Loops, so that nothing allocates
struct DenseConditioningResidual <: NLLSModel.AbstractResidual
    a::Vector{Float64}     # the row of A
    b::Float64
    r::Vector{Float64}     # the residual
    J::Matrix{Float64}     # its Jacobian, 1 × N
end
DenseConditioningResidual(a::AbstractVector, b::Real) =
    DenseConditioningResidual(Vector{Float64}(a), Float64(b), zeros(1), zeros(1, length(a)))
Base.eltype(::DenseConditioningResidual) = Float64
NLLSModel.ndeps(::DenseConditioningResidual) = static(1)
NLLSModel.nres(::DenseConditioningResidual) = 1
NLLSModel.varindices(::DenseConditioningResidual) = 1
NLLSModel.getvars(::DenseConditioningResidual, vars::AbstractVector) = (vars[1]::Vector{Float64},)

function NLLSModel.computeresidual(res::DenseConditioningResidual, x::Vector{Float64})
    acc = -res.b
    @inbounds for k in eachindex(res.a)
        acc += res.a[k] * conditioning_phi(x[k])
    end
    res.r[1] = acc
    return res.r
end

function NLLSModel.computeresjac(::StaticInt{1}, res::DenseConditioningResidual, x::Vector{Float64})
    acc = -res.b
    @inbounds for k in eachindex(res.a)
        s, c = sincos(x[k])
        acc += res.a[k] * (x[k] + 0.1 * s)
        res.J[1, k] = res.a[k] * (1.0 + 0.1 * c)
    end
    res.r[1] = acc
    return res.r, res.J
end

dense_conditioning_costs(A, b) = [DenseConditioningResidual(view(A, i, :), b[i]) for i in axes(A, 1)]

# The JuMP model: φ(x_k) as subexpressions, then each residual Σ_k A[i, k]·φ_k − b_i
function build_jump_dense_conditioning(A::Matrix{Float64}, b::Vector{Float64}, x0::Vector{Float64})
    n = size(A, 2)
    model = JuMP.Model()
    @variable(model, x[k = 1:n], start = x0[k])
    @NLexpression(model, phi[k = 1:n], x[k] + 0.1 * sin(x[k]))
    F = [@NLexpression(model, sum(A[i, k] * phi[k] for k in 1:n) - b[i]) for i in axes(A, 1)]
    return MathOptNLSModel(model, F)
end

# The SecondOrderOptimization row's configuration (IND4): NLLSModel's recommendoptimizer at the last value of the sweep,
# κ = 1e12, and the same at every κ (decision 17), with numthreads = 1, evaluated 2026-11-20 at NLLSModel d2e4374
# (Julia 1.13.3); rules F_illconditioned, RS_jacobian, L_jacobian, I_lm. At κ = 1 it would be the normal equations of the
# Jacobian (F_normalequations, linsolver = :cholesky)
const DENSE_CONDITIONING_SOO = (; iterator = :levenbergmarquardt, linsolver = :qr, formulation = :jacobian, reduction = :none, storage = :dense)

function create_dense_conditioning_problem()
    ProblemDefinition(
        "Dense Conditioning Sweep",
        :medium_dense,
        copy(DENSE_CONDITIONING_KAPPAS),
        κ -> begin
            A, b = dense_conditioning_data(κ)
            x0 = dense_conditioning_startpoint()
            n = DENSE_CONDITIONING_N

            # Model 1: NLLSModel, one Vector{Float64} variable and one cost per residual
            nlls_prob = NLLSModel.Model(Vector{Float64}, DenseConditioningResidual)
            addvariable!(nlls_prob, copy(x0))
            for c in dense_conditioning_costs(A, b)
                addcost!(nlls_prob, c)
            end
            nt = benchmark_numthreads()
            f_nlls, fdf_nlls!, _, H_proto_nlls = NLLSModel.optimvars(nlls_prob; unfixed=nothing, numthreads=nt)
            H_nlls = deepcopy(H_proto_nlls)
            g_nlls = zero(H_proto_nlls[:, 1])
            m_nlls = ModelDefinition(
                "NLLSModel",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob, nt),
                () -> (fdf_nlls!(g_nlls, H_nlls, nlls_prob.variables[1]), H_nlls),
                () -> copyto!(nlls_prob.variables[1], x0)
            )

            # Model 2: Standalone, its own copy of the costs, filled cost by cost by the same computeresidual and the
            # hand-written computeresjac, in a plain loop (DM2)
            lsp = standalone_problem((dense_conditioning_costs(A, b),), [copy(x0)])
            x_sa = lsp.x
            r_buf = zeros(Float64, DENSE_CONDITIONING_M)
            J_buf = deepcopy(lsp.J)
            g_buf = zeros(Float64, n)
            H_buf = zeros(Float64, n, n)
            m_sa = ModelDefinition(
                "Standalone",
                lsp,
                () -> begin
                    lsp.f!(r_buf, x_sa)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    lsp.f!(r_buf, x_sa)
                    lsp.g!(J_buf, x_sa)
                    mul!(g_buf, J_buf', r_buf)
                    mul!(H_buf, J_buf', J_buf)
                    return (0.5 * sum(abs2, r_buf), H_buf)
                end,
                () -> copyto!(x_sa, x0)
            )

            # Model 3: JuMP, as a MathOptNLSModel
            m_jump = jump_model("JuMP", build_jump_dense_conditioning(A, b, x0), copy(x0))

            return [m_jump, m_nlls, m_sa]   # alphabetical (IND8)
        end,
        get_standard_optimizers(DENSE_CONDITIONING_SOO),
        "Condition Number κ",
        # Zero-residual: the data are computed from the stated solution
        _ -> 0.0;
        # Derivatives (DM1): a cost has N = 100 inputs
        derivatives = :analytic,
        # The stated solution, the same at every κ, in the variable's layout (CN2)
        reference_solution = _ -> dense_conditioning_solution()
    )
end
