# Dense Affine Alignment Problem (Large Dense, from Gist 0af1c9)
using Distances, LinearAlgebra, Random, Static, StaticArrays
using NLLSModel, LeastSquaresOptim, SecondOrderOptimization

safe_dist(X, Y) = [!iszero(z) ? sqrt(z) : z for z in pairwise(SqEuclidean(), X, Y; dims=2)]

function generate_affine_data(n::Int)
    rng = MersenneTwister(42 + n)
    num_points = 2 * n
    X = randn(rng, n, num_points)
    Y = randn(rng, n, num_points)
    M = randn(rng, n, n) * 0.1 + I
    T = randn(rng, n)
    D = safe_dist(M * X .+ T, Y)
    return X, Y, D
end

function affine_resfun!(out::AbstractVector, x::AbstractVector{TX}, X::Matrix{Float64}, Y::Matrix{Float64}, D::Matrix{Float64}) where TX
    T = promote_type(TX, Float64)
    n, m_pts = size(X)
    w = n <= 64 ? MVector{64, T}(undef) : Vector{T}(undef, n)
    t_off = n * n
    @inbounds for i in 1:m_pts
        for k in 1:n
            acc = T(x[t_off + k])
            for c in 1:n
                acc += x[(c - 1) * n + k] * X[c, i]
            end
            w[k] = acc
        end
        for j in 1:m_pts
            sq = zero(T)
            for k in 1:n
                diff = w[k] - Y[k, j]
                sq += diff * diff
            end
            d_ij = iszero(sq) ? sq : sqrt(sq)
            out[(j - 1) * m_pts + i] = D[i, j] - d_ij
        end
    end
    return out
end

function affine_resfun(x, X, Y, D)
    T = promote_type(eltype(x), Float64)
    out = Vector{T}(undef, length(D))
    return affine_resfun!(out, x, X, Y, D)
end

struct AffineInPlaceFunc
    X::Matrix{Float64}
    Y::Matrix{Float64}
    D::Matrix{Float64}
end
@inline (f::AffineInPlaceFunc)(out, x) = affine_resfun!(out, x, f.X, f.Y, f.D)

struct AffineResidual{JC} <: NLLSModel.AbstractResidual
    X::Matrix{Float64}
    Y::Matrix{Float64}
    D::Matrix{Float64}
    f_ip!::AffineInPlaceFunc
    r_buf::Vector{Float64}
    y_scratch::Vector{Float64}
    J_buf::Matrix{Float64}
    g_buf::Vector{Float64}
    H_buf::Matrix{Float64}
    jcfg::JC
end

function AffineResidual(X::Matrix{Float64}, Y::Matrix{Float64}, D::Matrix{Float64})
    n = size(X, 1)
    n_vars = n * (n + 1)
    m_res = length(D)
    f_ip! = AffineInPlaceFunc(X, Y, D)
    r_buf = zeros(Float64, m_res)
    y_scratch = zeros(Float64, m_res)
    J_buf = zeros(Float64, m_res, n_vars)
    g_buf = zeros(Float64, n_vars)
    H_buf = zeros(Float64, n_vars, n_vars)
    x_proto = zeros(Float64, n_vars)
    jcfg = NLLSModel.ForwardDiff.JacobianConfig(f_ip!, y_scratch, x_proto)
    return AffineResidual(X, Y, D, f_ip!, r_buf, y_scratch, J_buf, g_buf, H_buf, jcfg)
end

Base.eltype(::AffineResidual) = Float64
NLLSModel.ndeps(::AffineResidual) = static(1)
NLLSModel.nres(res::AffineResidual) = length(res.D)
NLLSModel.varindices(::AffineResidual) = 1
NLLSModel.getvars(::AffineResidual, vars::AbstractVector) = (@inbounds(vars[1]),)
NLLSModel.computeresidual(res::AffineResidual, x) = affine_resfun(x, res.X, res.Y, res.D)

@inline function NLLSModel.computecost(res::AffineResidual, x::Vector{Float64})::Float64
    affine_resfun!(res.r_buf, x, res.X, res.Y, res.D)
    return 0.5 * sum(abs2, res.r_buf)
end

@inline function NLLSModel.computecostgradhess(::StaticInt{1}, res::AffineResidual, x::Vector{Float64})
    affine_resfun!(res.r_buf, x, res.X, res.Y, res.D)
    NLLSModel.ForwardDiff.jacobian!(res.J_buf, res.f_ip!, res.y_scratch, x, res.jcfg)
    mul!(res.g_buf, transpose(res.J_buf), res.r_buf)
    mul!(res.H_buf, transpose(res.J_buf), res.J_buf)
    return 0.5 * sum(abs2, res.r_buf), res.g_buf, res.H_buf
end

function create_affine_alignment_problem()
    ProblemDefinition(
        "Dense Affine Alignment",
        :small_dense,
        Any[1, 2, 3, 4, 6, 8, 12, 16, 20, 24, 28, 32],
        n -> begin
            X, Y, D = generate_affine_data(n)
            start_vec = zeros(n * n + n)
            start_vec[1:n+1:end] .= 1.0

            # Model 1: NLLSModel Problem
            aff_res = AffineResidual(X, Y, D)
            nlls_prob = NLLSModel.Model(Vector{Float64}, typeof(aff_res))
            addvariable!(nlls_prob, copy(start_vec))
            addcost!(nlls_prob, aff_res)
            f_nlls, fdf_nlls!, _, _ = NLLSModel.optimvars(nlls_prob, nothing, StaticInt(1))
            n_vars = length(start_vec)
            g_nlls = zeros(Float64, n_vars)
            H_nlls = zeros(Float64, n_vars, n_vars)
            m_nlls = ModelDefinition(
                "NLLSModel",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob, StaticInt(1)),
                () -> (fdf_nlls!(g_nlls, H_nlls, nlls_prob.variables[1]), H_nlls),
                () -> begin
                    nlls_prob.variables[1] .= 0.0
                    nlls_prob.variables[1][1:n+1:end] .= 1.0
                end
            )

            # Model 2: Standalone
            x_lso = copy(start_vec)
            r_len = length(D)
            r_buf = zeros(Float64, r_len)
            costfun! = AffineInPlaceFunc(X, Y, D)
            lsp = LeastSquaresProblem(x=x_lso, f! = costfun!, output_length=r_len, autodiff=:forward)
            J_buf = deepcopy(lsp.J)
            g_buf = zeros(Float64, length(start_vec))
            H_buf = zeros(Float64, length(start_vec), length(start_vec))
            m_lso = ModelDefinition(
                "Standalone",
                lsp,
                () -> begin
                    costfun!(r_buf, x_lso)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    costfun!(r_buf, x_lso)
                    lsp.g!(J_buf, x_lso)
                    mul!(g_buf, J_buf', r_buf)
                    mul!(H_buf, J_buf', J_buf)
                    return (0.5 * sum(abs2, r_buf), H_buf)
                end,
                () -> begin
                    x_lso .= 0.0
                    x_lso[1:n+1:end] .= 1.0
                end
            )

            return [m_nlls, m_lso]
        end,
        get_standard_optimizers(),
        "Dimension n"
    )
end
