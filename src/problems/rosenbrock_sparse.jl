# Multi-dimensional Rosenbrock Sparse (Large Sparse, from Gist 789e85)
using Static, StaticArrays, LinearAlgebra, SparseArrays
using NLLSModels, LeastSquaresOptim, JuMP, Ipopt, JSOSolvers, NLPModels, NLPModelsJuMP, SecondOrderOptimization
const MOI = JuMP.MOI

const rosen_diag_w_sparse = 1.0
const rosen_offdiag_w_sparse = 10.0

rosen_sparse_startpoint(n::Int) = Float64[i % 2 == 0 ? 1.0 : -1.2 for i in 1:n]

struct RosenDiagSparse <: NLLSModels.AbstractResidual
    weight::Float64
    varind::Int
end
Base.eltype(::RosenDiagSparse) = Float64
NLLSModels.ndeps(::RosenDiagSparse) = static(1)
NLLSModels.nres(::RosenDiagSparse) = static(1)
NLLSModels.varindices(res::RosenDiagSparse) = res.varind
NLLSModels.getvars(res::RosenDiagSparse, vars::Vector) = (vars[res.varind]::Float64,)
NLLSModels.computeresidual(res::RosenDiagSparse, x) = res.weight * (x - 1.0)

struct RosenOffDiagSparse <: NLLSModels.AbstractResidual
    weight::Float64
    varind::SVector{2, Int}
end
Base.eltype(::RosenOffDiagSparse) = Float64
NLLSModels.ndeps(::RosenOffDiagSparse) = static(2)
NLLSModels.nres(::RosenOffDiagSparse) = static(1)
NLLSModels.varindices(res::RosenOffDiagSparse) = res.varind
NLLSModels.getvars(res::RosenOffDiagSparse, vars::Vector) = (vars[res.varind[1]]::Float64, vars[res.varind[2]]::Float64)
NLLSModels.computeresidual(res::RosenOffDiagSparse, x, y) = res.weight * (y - x^2)

function rosenbrock_sparse_res!(out, x)
    n = length(x)
    @inbounds for k in 1:n-1
        out[2*k - 1] = rosen_diag_w_sparse * (x[k] - 1.0)
        out[2*k]     = rosen_offdiag_w_sparse * (x[k+1] - x[k]^2)
    end
    out[2*n - 1] = rosen_diag_w_sparse * (x[n] - 1.0)
    return out
end

function rosenbrock_sparse_jac!(out, x)
    n = length(x)
    @inbounds for k in 1:n-1
        out.nzval[3*k - 2] = rosen_diag_w_sparse
        out.nzval[3*k - 1] = -2.0 * rosen_offdiag_w_sparse * x[k]
        out.nzval[3*k]     = rosen_offdiag_w_sparse
    end
    out.nzval[end] = rosen_diag_w_sparse
    return out
end

function build_sparse_lso(n::Int)
    len = 2 * n - 1
    rows = vcat(collect(Iterators.flatten([(2*k-1, 2*k, 2*k) for k in 1:(n-1)])), len)
    cols = vcat(collect(Iterators.flatten([(k, k, k+1) for k in 1:(n-1)])), n)
    J = SparseArrays.sparse(rows, cols, zeros(3*n - 2), len, n)
    return LeastSquaresProblem(x=rosen_sparse_startpoint(n), f! = rosenbrock_sparse_res!, g! = rosenbrock_sparse_jac!, J=J, output_length=len)
end

function build_sparse_nlls(n::Int)
    costs = NLLSModels.CostStruct{Union{RosenDiagSparse, RosenOffDiagSparse}}()
    costs.data[RosenDiagSparse] = RosenDiagSparse[RosenDiagSparse(rosen_diag_w_sparse, k) for k in 1:n]
    costs.data[RosenOffDiagSparse] = RosenOffDiagSparse[RosenOffDiagSparse(rosen_offdiag_w_sparse, SVector(k, k+1)) for k in 1:n-1]
    return NLLSProblem(rosen_sparse_startpoint(n), costs)
end

function build_sparse_jso(n::Int)
    model = Model()
    x0 = rosen_sparse_startpoint(n)
    @variable(model, x[i = 1:n], start = x0[i])
    @NLexpression(model, FA[k = 1:(n - 1)], rosen_offdiag_w_sparse * (x[k + 1] - x[k]^2))
    @expression(model, FB[k = 1:n], rosen_diag_w_sparse * (x[k] - 1.0))
    return MathOptNLSModel(model, [FA; FB])
end

function create_rosenbrock_sparse_problem()
    ProblemDefinition(
        "Sparse Multi-dimensional Rosenbrock",
        :large_sparse,
        [16, 64, 256],
        n -> begin
            x0 = rosen_sparse_startpoint(n)
            len = 2 * n - 1

            # Model 1: NLLSModels Problem
            nlls_prob = build_sparse_nlls(n)
            m_nlls = ModelDefinition(
                "NLLSModels",
                nlls_prob,
                () -> NLLSModels.cost(nlls_prob),
                () -> (NLLSModels.cost(nlls_prob), nothing),
                () -> copyto!(nlls_prob.variables, x0)
            )

            # Model 2: LeastSquaresOptim Sparse
            lsp = build_sparse_lso(n)
            r_buf = zeros(Float64, len)
            m_lso = ModelDefinition(
                "LeastSquaresOptim (Sparse)",
                lsp,
                () -> begin
                    rosenbrock_sparse_res!(r_buf, lsp.x)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    rosenbrock_sparse_res!(r_buf, lsp.x)
                    rosenbrock_sparse_jac!(lsp.J, lsp.x)
                    return (0.5 * sum(abs2, r_buf), (r_buf, lsp.J))
                end,
                () -> copyto!(lsp.x, x0)
            )

            # Model 3: NLPModels Sparse
            nls = build_sparse_jso(n)
            g_nlp = zeros(Float64, n)
            m_nlp = ModelDefinition(
                "NLPModels (MathOptNLSModel)",
                nls,
                () -> NLPModels.obj(nls, x0),
                () -> begin
                    c = NLPModels.obj(nls, x0)
                    NLPModels.grad!(nls, x0, g_nlp)
                    return (c, g_nlp)
                end,
                () -> copyto!(nls.meta.x0, x0)
            )

            return [m_nlls, m_lso, m_nlp]
        end,
        [
            OptimizerDefinition("SecondOrderOptimization (Sparse LM)", model_def -> begin
                p = deepcopy(model_def.model)
                opt = OptimizationOptions(iterator = :levenbergmarquardt, linsolver = :ldl, maxiters=5000)
                _, res = SecondOrderOptimization.optimize!(p, opt)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, res.bestcost < 1e-4)
            end),
            OptimizerDefinition("LeastSquaresOptim (Sparse LM)", model_def -> begin
                n = length(rosen_sparse_startpoint(model_def.model isa NLLSProblem ? length(model_def.model.variables) : (model_def.model isa LeastSquaresProblem ? length(model_def.model.x) : model_def.model.meta.nvar)))
                lsp = build_sparse_lso(n)
                start_c = 0.5 * sum(abs2, rosenbrock_sparse_res!(zeros(2*n - 1), lsp.x))
                res = LeastSquaresOptim.optimize!(lsp, LeastSquaresOptim.LevenbergMarquardt(); iterations=5000)
                return OptimizerResult(0.0, 0, 0, res.iterations, start_c, res.ssr * 0.5, res.converged)
            end),
            OptimizerDefinition("Ipopt", model_def -> begin
                n = length(rosen_sparse_startpoint(model_def.model isa NLLSProblem ? length(model_def.model.variables) : (model_def.model isa LeastSquaresProblem ? length(model_def.model.x) : model_def.model.meta.nvar)))
                model = Model(Ipopt.Optimizer)
                x0 = rosen_sparse_startpoint(n)
                @variable(model, x[i in 1:n], start = x0[i])
                @variable(model, residuals[1:2*n-1])
                @constraints(model, begin
                    [k in 1:(n - 1)], residuals[k] == rosen_offdiag_w_sparse * (x[k + 1] - x[k]^2) 
                    [k in 1:n], residuals[n-1+k] == rosen_diag_w_sparse * (x[k] - 1.0)
                end)
                @objective(model, Min, 0.5 * sum(residuals .^ 2))
                set_silent(model)
                JuMP.optimize!(model)
                start_c = 0.5 * sum(abs2, rosenbrock_sparse_res!(zeros(2*n - 1), x0))
                return OptimizerResult(0.0, 0, 0, MOI.get(model, MOI.BarrierIterations()), start_c, objective_value(model), true)
            end),
            OptimizerDefinition("JSOSolvers (trunk)", model_def -> begin
                n = length(rosen_sparse_startpoint(model_def.model isa NLLSProblem ? length(model_def.model.variables) : (model_def.model isa LeastSquaresProblem ? length(model_def.model.x) : model_def.model.meta.nvar)))
                nls = build_sparse_jso(n)
                res = JSOSolvers.trunk(nls)
                start_c = NLPModels.obj(nls, rosen_sparse_startpoint(n))
                return OptimizerResult(0.0, 0, 0, res.iter, start_c, res.objective, res.status == :first_order)
            end),
            OptimizerDefinition("JSOSolvers (tron)", model_def -> begin
                n = length(rosen_sparse_startpoint(model_def.model isa NLLSProblem ? length(model_def.model.variables) : (model_def.model isa LeastSquaresProblem ? length(model_def.model.x) : model_def.model.meta.nvar)))
                nls = build_sparse_jso(n)
                res = JSOSolvers.tron(nls)
                start_c = NLPModels.obj(nls, rosen_sparse_startpoint(n))
                return OptimizerResult(0.0, 0, 0, res.iter, start_c, res.objective, res.status == :first_order)
            end)
        ]
    )
end
