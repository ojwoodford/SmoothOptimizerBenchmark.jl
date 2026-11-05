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
NLLSModel.getvars(r::BenchChainLink, vars::Vector) = (vars[r.varind[1]]::SVector{3, Float64}, vars[r.varind[2]]::SVector{3, Float64})
NLLSModel.computeresidual(r::BenchChainLink, a, b) = b - a - r.offset + 0.1 * sin.(a)
Base.eltype(::BenchChainLink) = Float64

struct BenchChainAnchor <: AbstractResidual end
NLLSModel.ndeps(::BenchChainAnchor) = static(1)
NLLSModel.nres(::BenchChainAnchor) = static(3)
NLLSModel.varindices(::BenchChainAnchor) = SVector(1)
NLLSModel.getvars(::BenchChainAnchor, vars::Vector) = (vars[1]::SVector{3, Float64},)
NLLSModel.computeresidual(::BenchChainAnchor, a) = a
Base.eltype(::BenchChainAnchor) = Float64

function generate_chain_start_vars(n_poses::Int)
    return [SVector(0.1 * i, sin(i + 1), cos(i)) for i in 1:n_poses]
end

function build_chain_nlls(n_poses::Int)
    start_vars = generate_chain_start_vars(n_poses)
    chain_prob = NLLSModel(SVector{3, Float64}, Union{BenchChainLink, BenchChainAnchor})
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

function create_pose_chain_problem()
    ProblemDefinition(
        "Nonlinear 3D Pose Chain",
        :large_sparse,
        [10, 20, 50],
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

            # Model 2: LeastSquaresOptim
            r_buf = zeros(Float64, m_res)
            x_lso = copy(x_flat)
            f!(r, x) = chain_residuals!(r, x, n_poses)
            lsp = LeastSquaresProblem(x=x_lso, f! = f!, output_length=m_res, autodiff=:forward)
            m_lso = ModelDefinition(
                "LeastSquaresOptim",
                lsp,
                () -> begin
                    f!(r_buf, x_lso)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    f!(r_buf, x_lso)
                    return (0.5 * sum(abs2, r_buf), r_buf)
                end,
                () -> copyto!(x_lso, x_flat)
            )

            return [m_nlls, m_lso]
        end,
        [
            OptimizerDefinition("SecondOrderOptimization (Sparse LM)", model_def -> begin
                p = deepcopy(model_def.model)
                opt = OptimizationOptions(iterator = :levenbergmarquardt, linsolver = :ldl)
                _, res = SecondOrderOptimization.optimize!(p, opt)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
            end),
            OptimizerDefinition("SecondOrderOptimization (Sparse Dogleg)", model_def -> begin
                p = deepcopy(model_def.model)
                opt = OptimizationOptions(iterator = :dogleg, linsolver = :ldl)
                _, res = SecondOrderOptimization.optimize!(p, opt)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
            end),
            OptimizerDefinition("LeastSquaresOptim (LM)", model_def -> begin
                n_poses = model_def.model isa NLLSModel ? length(model_def.model.variables) : (length(model_def.model.x) ÷ 3)
                start_vars = generate_chain_start_vars(n_poses)
                x_flat = reduce(vcat, [collect(v) for v in start_vars])
                m_res = 3 * n_poses
                lsp = LeastSquaresProblem(x=copy(x_flat), f! = (r, x) -> chain_residuals!(r, x, n_poses), output_length=m_res, autodiff=:forward)
                start_c = 0.5 * sum(abs2, chain_residuals!(zeros(m_res), x_flat, n_poses))
                res = LeastSquaresOptim.optimize!(lsp, LeastSquaresOptim.LevenbergMarquardt(); iterations=1000)
                return OptimizerResult(0.0, 0, 0, res.iterations, start_c, res.ssr * 0.5, res.converged)
            end)
        ]
    )
end
