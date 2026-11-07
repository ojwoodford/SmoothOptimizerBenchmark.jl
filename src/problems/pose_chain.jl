# 3D Pose Chain Problem (Large Sparse Block Tridiagonal with Loop Closures)
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

function generate_chain_ground_truth(n_poses::Int)
    return [SVector(1.0 * i, sin(i), 0.2 * i) for i in 1:n_poses]
end

function get_chain_measurements(n_poses::Int, K::Int=10)
    x_true = generate_chain_ground_truth(n_poses)
    link_offsets = [x_true[i+1] - x_true[i] + 0.1 * sin.(x_true[i]) for i in 1:n_poses-1]
    lcs = Tuple{Int, Int, SVector{3, Float64}}[]
    for i in (K + 1):n_poses
        if (i - 1) % K == 0
            u = i - K
            v = i
            off = x_true[v] - x_true[u] + 0.1 * sin.(x_true[u])
            push!(lcs, (u, v, off))
        end
    end
    return link_offsets, lcs
end

function get_chain_loop_closures(n_poses::Int, K::Int=10)
    _, lcs = get_chain_measurements(n_poses, K)
    return lcs
end

function generate_chain_start_vars(n_poses::Int)
    x_true = generate_chain_ground_truth(n_poses)
    x0 = Vector{SVector{3, Float64}}(undef, n_poses)
    x0[1] = SVector(0.0, 0.0, 0.0)
    for i in 1:n_poses-1
        noise = 0.02 * SVector(sin(2.3 * i), cos(1.7 * i), sin(3.1 * i))
        x0[i+1] = x0[i] + (x_true[i+1] - x_true[i]) + noise
    end
    return x0
end

function build_chain_nlls(n_poses::Int, link_offsets::Vector{SVector{3, Float64}}, lcs::Vector{Tuple{Int, Int, SVector{3, Float64}}}, start_vars::Vector{SVector{3, Float64}}=generate_chain_start_vars(n_poses))
    chain_prob = NLLSModel.Model(SVector{3, Float64}, Union{BenchChainLink, BenchChainAnchor})
    for v in start_vars
        addvariable!(chain_prob, v)
    end
    addcost!(chain_prob, BenchChainAnchor())
    for i in 1:n_poses-1
        addcost!(chain_prob, BenchChainLink(link_offsets[i], SVector(i, i + 1)))
    end
    for (u, v, off) in lcs
        addcost!(chain_prob, BenchChainLink(off, SVector(u, v)))
    end
    return chain_prob
end

function build_chain_nlls(n_poses::Int)
    link_offsets, lcs = get_chain_measurements(n_poses)
    start_vars = generate_chain_start_vars(n_poses)
    return build_chain_nlls(n_poses, link_offsets, lcs, start_vars)
end

function create_pose_chain_problem()
    ProblemDefinition(
        "Nonlinear 3D Pose Chain",
        :large_sparse,
        Any[50, 100, 200, 400, 800, 1200, 2000, 3500, 5000, 7500, 10000],
        n_poses -> begin
            link_offsets, lcs = get_chain_measurements(n_poses)
            start_vars = generate_chain_start_vars(n_poses)

            # Universal Model: NLLSModel Sparse Block Tridiagonal with Loop Closures
            nlls_prob = build_chain_nlls(n_poses, link_offsets, lcs, start_vars)
            f_nlls, fdf_nlls!, x0_nlls, H_proto_chain = NLLSModel.optimvars(nlls_prob)
            n_tot_vars = 3 * n_poses
            g_nlls = zeros(Float64, n_tot_vars)
            H_buf_chain = H_proto_chain === nothing ? zeros(Float64, n_tot_vars, n_tot_vars) : deepcopy(H_proto_chain)
            m_nlls = ModelDefinition(
                "NLLSModel (Sparse)",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob),
                () -> (fdf_nlls!(g_nlls, H_buf_chain, x0_nlls), H_buf_chain),
                () -> copyto!(nlls_prob.variables, start_vars)
            )

            return [m_nlls]
        end,
        [
            OptimizerDefinition("NLLSModel + SecondOrderOptimization (Dogleg)", (m; kwargs...) -> optimize_soo(m; method=:dogleg, kwargs...)),
            OptimizerDefinition("NLLSModel + SecondOrderOptimization (LM)", (m; kwargs...) -> optimize_soo(m; method=:lm, kwargs...)),
            OptimizerDefinition("LeastSquaresOptim (Dogleg)", (m; kwargs...) -> optimize_least_squares(m; method=:dogleg, kwargs...)),
            OptimizerDefinition("LeastSquaresOptim (LM)", (m; kwargs...) -> optimize_least_squares(m; method=:lm, kwargs...)),
            OptimizerDefinition("Optim (Newton)", (m; kwargs...) -> optimize_optim(m; method=:newton, kwargs...)),
            OptimizerDefinition("JSOSolvers (trunk)", (m; kwargs...) -> optimize_jsosolvers(m; solver=:trunk, kwargs...)),
            OptimizerDefinition("JSOSolvers (tron)", (m; kwargs...) -> optimize_jsosolvers(m; solver=:tron, kwargs...)),
            OptimizerDefinition("Ipopt", (m; kwargs...) -> optimize_ipopt(m; kwargs...)),
            OptimizerDefinition("MadNLP", (m; kwargs...) -> optimize_madnlp(m; kwargs...)),
            OptimizerDefinition("NonlinearSolve (LM)", (m; kwargs...) -> optimize_nonlinearsolve(m; method=:lm, kwargs...)),
            OptimizerDefinition("NonlinearSolve (TrustRegion)", (m; kwargs...) -> optimize_nonlinearsolve(m; method=:trust_region, kwargs...)),
            OptimizerDefinition("CaNNOLeS", (m; kwargs...) -> optimize_cannoles(m; kwargs...))
        ],
        "Poses N"
    )
end
