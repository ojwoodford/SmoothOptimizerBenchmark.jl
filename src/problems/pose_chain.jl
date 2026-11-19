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

# Model 3: JuMP (IND3g). One 3-vector per pose, flattened in pose order (pose i is x[3i − 2 : 3i], the Standalone model's
# layout); the residuals of `build_chain_nlls`, coordinate by coordinate: the anchor (pose 1), the links between
# consecutive poses, then the loop closures, each x_b − x_a − offset + 0.1·sin(x_a)
function build_jump_pose_chain(n_poses::Int, link_offsets::Vector{SVector{3, Float64}}, lcs::Vector{Tuple{Int, Int, SVector{3, Float64}}},
                               start_vars::Vector{SVector{3, Float64}})
    x0 = reduce(vcat, [collect(v) for v in start_vars])
    model = JuMP.Model()
    @variable(model, x[l = 1:(3 * n_poses)], start = x0[l])
    F = Any[@expression(model, x[k]) for k in 1:3]
    links = [[(i, i + 1, link_offsets[i]) for i in 1:n_poses-1]; lcs]
    for (a, b, off) in links, k in 1:3
        xa, xb = x[3 * (a - 1) + k], x[3 * (b - 1) + k]
        push!(F, @NLexpression(model, xb - xa - off[k] + 0.1 * sin(xa)))
    end
    return MathOptNLSModel(model, F)
end
build_jump_pose_chain(n_poses::Int) = build_jump_pose_chain(n_poses, get_chain_measurements(n_poses)..., generate_chain_start_vars(n_poses))

# The SecondOrderOptimization row's configuration (IND4): NLLSModel's recommendoptimizer at the largest size, N = 10000,
# with numthreads = 1, evaluated 2026-11-19 at NLLSModel 78a4ef5 (Julia 1.13.3); rules F_wellconditioned, RS_hessian, L_sparse, I_dogleg
const POSE_CHAIN_SOO = (; iterator = :dogleg, linsolver = :ldl, formulation = :hessian, reduction = :none, storage = :sparse)

function create_pose_chain_problem()
    ProblemDefinition(
        "Nonlinear 3D Pose Chain",
        :large_sparse,
        Any[50, 100, 200, 400, 800, 1200, 2000, 3500, 5000, 7500, 10000],
        n_poses -> begin
            link_offsets, lcs = get_chain_measurements(n_poses)
            start_vars = generate_chain_start_vars(n_poses)

            # Model 1: NLLSModel, sparse block tridiagonal with loop closures
            nlls_prob = build_chain_nlls(n_poses, link_offsets, lcs, start_vars)
            nt = benchmark_numthreads()
            f_nlls, fdf_nlls!, x0_nlls, H_proto_chain = NLLSModel.optimvars(nlls_prob; unfixed=nothing, numthreads=nt)
            n_tot_vars = 3 * n_poses
            g_nlls = zeros(Float64, n_tot_vars)
            H_buf_chain = H_proto_chain === nothing ? zeros(Float64, n_tot_vars, n_tot_vars) : deepcopy(H_proto_chain)
            m_nlls = ModelDefinition(
                "NLLSModel (Sparse)",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob, nt),
                () -> (fdf_nlls!(g_nlls, H_buf_chain, x0_nlls), H_buf_chain),
                () -> copyto!(nlls_prob.variables, start_vars)
            )

            # Model 2: Standalone (Sparse): the NLLSModel model's own costs, their residuals and Jacobians filled cost by
            # cost by NLLSModel's computeresidual and computeresjac (autodiff), in a plain loop, into a sparsity pattern
            # computed once (IND2)
            lsp = standalone_problem((get(nlls_prob.costs, BenchChainAnchor), get(nlls_prob.costs, BenchChainLink)), start_vars;
                                     sparse=true)
            r_buf = zeros(Float64, length(lsp.y))
            g_buf = zeros(Float64, n_tot_vars)
            x0_sa = copy(lsp.x)
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
                () -> copyto!(lsp.x, x0_sa)
            )

            m_jump = jump_model("JuMP", build_jump_pose_chain(n_poses, link_offsets, lcs, start_vars), x0_sa)

            return [m_jump, m_nlls, m_lso]   # alphabetical (IND8)
        end,
        # The standard rows but Optim (NewtonTrustRegion), which needs a dense Hessian (a feature limit)
        filter(o -> o.name != "Optim (NewtonTrustRegion)", get_standard_optimizers(POSE_CHAIN_SOO)),
        "Poses N";
        # Derivatives (DM1): every cost has at most 6 inputs
        derivatives = :autodiff
    )
end
