# 3D Pose Chain Problem (Large Sparse Block Tridiagonal)
using Static, StaticArrays, LinearAlgebra, SparseArrays
using NLLSModel, SecondOrderOptimization, LeastSquaresOptim

struct BenchChainLink <: AbstractResidual
    offset::SVector{3, Float64}
    varind::SVector{2, Int}
end
NLLSModel.ndeps(::BenchChainLink) = static(2)
NLLSModel.nres(::BenchChainLink) = static(3)
NLLSModel.varindices(r::BenchChainLink) = r.varind
NLLSModel.getvars(r::BenchChainLink, vars::AbstractVector) = (vars[r.varind[1]]::SVector{3, Float64}, vars[r.varind[2]]::SVector{3, Float64})
NLLSModel.computeresidual(r::BenchChainLink, a, b) = b - a - r.offset + 0.1 * sin.(a)
Base.eltype(::BenchChainLink) = Float64

struct BenchChainAnchor <: AbstractResidual end
NLLSModel.ndeps(::BenchChainAnchor) = static(1)
NLLSModel.nres(::BenchChainAnchor) = static(3)
NLLSModel.varindices(::BenchChainAnchor) = SVector(1)
NLLSModel.getvars(::BenchChainAnchor, vars::AbstractVector) = (vars[1]::SVector{3, Float64},)
NLLSModel.computeresidual(::BenchChainAnchor, a) = a
Base.eltype(::BenchChainAnchor) = Float64

function generate_chain_start_vars(n_poses::Int)
    return [SVector(0.1 * i, sin(i + 1), cos(i)) for i in 1:n_poses]
end

function build_chain_nlls(n_poses::Int)
    start_vars = generate_chain_start_vars(n_poses)
    chain_prob = NLLSModel.Model(SVector{3, Float64}, Union{BenchChainLink, BenchChainAnchor})
    for v in start_vars
        addvariable!(chain_prob, v)
    end
    addcost!(chain_prob, BenchChainAnchor())
    for i in 1:n_poses-1
        addcost!(chain_prob, BenchChainLink(SVector(1.0, 0.5 * sin(i), 0.2), SVector(i, i + 1)))
    end
    return chain_prob
end

function chain_residuals!(out, x_flat, n_poses)
    # Pose 1 anchor
    out[1] = x_flat[1]
    out[2] = x_flat[2]
    out[3] = x_flat[3]
    out_idx = 4
    for i in 1:n_poses-1
        a = SVector(x_flat[3*i-2], x_flat[3*i-1], x_flat[3*i])
        b = SVector(x_flat[3*i+1], x_flat[3*i+2], x_flat[3*i+3])
        offset = SVector(1.0, 0.5 * sin(i), 0.2)
        r = b - a - offset + 0.1 * sin.(a)
        out[out_idx] = r[1]
        out[out_idx+1] = r[2]
        out[out_idx+2] = r[3]
        out_idx += 3
    end
    return out
end

function chain_jac!(J::SparseMatrixCSC, x_flat, n_poses)
    fill!(nonzeros(J), 0.0)
    J[1, 1] = 1.0
    J[2, 2] = 1.0
    J[3, 3] = 1.0
    for i in 1:n_poses-1
        r_start = 4 + 3*(i-1)
        c_a = 3*i - 2
        c_b = 3*i + 1
        for k in 0:2
            a_val = x_flat[c_a + k]
            J[r_start + k, c_a + k] = -1.0 + 0.1 * cos(a_val)
            J[r_start + k, c_b + k] = 1.0
        end
    end
    return J
end

function build_chain_sparse_jacobian(n_poses::Int)
    m_res = 3 * n_poses
    n_vars = 3 * n_poses
    rows = Int[]
    cols = Int[]
    for j in 1:3
        push!(rows, j)
        push!(cols, j)
    end
    for i in 1:n_poses-1
        r_start = 4 + 3*(i-1)
        c_a = 3*i - 2
        c_b = 3*i + 1
        for k in 0:2
            push!(rows, r_start + k)
            push!(cols, c_a + k)
            push!(rows, r_start + k)
            push!(cols, c_b + k)
        end
    end
    vals = zeros(Float64, length(rows))
    return sparse(rows, cols, vals, m_res, n_vars)
end

function create_pose_chain_problem()
    ProblemDefinition(
        "Nonlinear 3D Pose Chain",
        :large_sparse,
        Any[1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576],
        n_poses -> begin
            start_vars = generate_chain_start_vars(n_poses)
            x_flat = reduce(vcat, [collect(v) for v in start_vars])
            m_res = 3 * n_poses

            # Model 1: NLLSModel Sparse Block Tridiagonal
            nlls_prob = build_chain_nlls(n_poses)
            m_nlls = ModelDefinition(
                "NLLSModel (Sparse)",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob),
                () -> (NLLSModel.cost(nlls_prob), nothing),
                () -> copyto!(nlls_prob.variables, start_vars)
            )

            # Model 2: Standalone (Sparse)
            r_buf = zeros(Float64, m_res)
            x_lso = copy(x_flat)
            J_sp = build_chain_sparse_jacobian(n_poses)
            chain_jac!(J_sp, x_flat, n_poses)
            f!(r, x) = chain_residuals!(r, x, n_poses)
            g!(J, x) = chain_jac!(J, x, n_poses)
            lsp = LeastSquaresProblem(x=x_lso, y=r_buf, f! = f!, g! = g!, J=J_sp)
            m_lso = ModelDefinition(
                "Standalone (Sparse)",
                lsp,
                () -> begin
                    f!(r_buf, x_lso)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    f!(r_buf, x_lso)
                    g!(J_sp, x_lso)
                    return (0.5 * sum(abs2, r_buf), J_sp)
                end,
                () -> begin
                    copyto!(x_lso, x_flat)
                    chain_jac!(J_sp, x_flat, n_poses)
                end
            )

            return [m_nlls, m_lso]
        end,
        get_tier1_optimizers(),
        "Poses N"
    )
end
