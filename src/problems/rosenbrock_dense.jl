# Multi-dimensional Rosenbrock Dense (Large Dense, from Gist 789e85)
using Static, StaticArrays, LinearAlgebra
using NLLSModels, LeastSquaresOptim, JuMP, Ipopt, JSOSolvers, NLPModels, NLPModelsJuMP, SecondOrderOptimization
const MOI = JuMP.MOI

const rosen_diag_w_dense = 1.2
const rosen_offdiag_w_dense = 1.0

rosen_startpoint(n::Int) = Float64[i % 2 == 0 ? 1.0 : -1.2 for i in 1:n]

struct RosenDiagDense <: NLLSModels.AbstractResidual
    weight::Float64
    varind::Int
end
Base.eltype(::RosenDiagDense) = Float64
NLLSModels.ndeps(::RosenDiagDense) = static(1)
NLLSModels.nres(::RosenDiagDense) = static(1)
NLLSModels.varindices(res::RosenDiagDense) = res.varind
NLLSModels.getvars(res::RosenDiagDense, vars::Vector) = (vars[res.varind]::Float64,)
NLLSModels.computeresidual(res::RosenDiagDense, x) = res.weight * (x - 1.0)

struct RosenOffDiagDense <: NLLSModels.AbstractResidual
    weight::Float64
    varind::SVector{2, Int}
end
Base.eltype(::RosenOffDiagDense) = Float64
NLLSModels.ndeps(::RosenOffDiagDense) = static(2)
NLLSModels.nres(::RosenOffDiagDense) = static(1)
NLLSModels.varindices(res::RosenOffDiagDense) = res.varind
NLLSModels.getvars(res::RosenOffDiagDense, vars::Vector) = (vars[res.varind[1]]::Float64, vars[res.varind[2]]::Float64)
NLLSModels.computeresidual(res::RosenOffDiagDense, x, y) = res.weight * (y - x^2)

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
    costs = NLLSModels.CostStruct{Union{RosenDiagDense, RosenOffDiagDense}}()
    costs.data[RosenDiagDense] = RosenDiagDense[RosenDiagDense(rosen_diag_w_dense, k) for k in 1:n]
    costs.data[RosenOffDiagDense] = vcat(collect(Iterators.flatten([[RosenOffDiagDense(rosen_offdiag_w_dense, SVector(j, k)) for k in j+1:n] for j in 1:n-1])))
    return NLLSProblem(rosen_startpoint(n), costs)
end

function build_jso_dense(n::Int)
    model = Model()
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
        :large_dense,
        [2, 4, 8, 16],
        n -> begin
            x0 = rosen_startpoint(n)
            m_len = n + ((n - 1) * n) >> 1

            # Model 1: NLLSModels
            nlls_prob = build_nlls_dense(n)
            m_nlls = ModelDefinition(
                "NLLSModels",
                nlls_prob,
                () -> NLLSModels.cost(nlls_prob),
                () -> (NLLSModels.cost(nlls_prob), nothing),
                () -> copyto!(nlls_prob.variables, x0)
            )

            # Model 2: LeastSquaresOptim
            r_buf = zeros(Float64, m_len)
            x_lso = copy(x0)
            lsp = LeastSquaresProblem(x=x_lso, f! = rosenbrock_dense_res!, output_length=m_len, autodiff=:forward)
            m_lso = ModelDefinition(
                "LeastSquaresOptim",
                lsp,
                () -> begin
                    rosenbrock_dense_res!(r_buf, x_lso)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    rosenbrock_dense_res!(r_buf, x_lso)
                    return (0.5 * sum(abs2, r_buf), r_buf)
                end,
                () -> copyto!(x_lso, x0)
            )

            # Model 3: NLPModels / MathOptNLSModel
            nls = build_jso_dense(n)
            g_nlp = zeros(Float64, n)
            H_nlp = zeros(Float64, n, n)
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
            OptimizerDefinition("SecondOrderOptimization (LM)", model_def -> begin
                p = deepcopy(model_def.model)
                opt = OptimizationOptions(iterator=:levenbergmarquardt, maxiters=5000)
                _, res = SecondOrderOptimization.optimize!(p, opt)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, res.bestcost < 1e-4)
            end),
            OptimizerDefinition("LeastSquaresOptim (LM)", model_def -> begin
                n = length(rosen_startpoint(model_def.model isa NLLSProblem ? length(model_def.model.variables) : (model_def.model isa LeastSquaresProblem ? length(model_def.model.x) : model_def.model.meta.nvar)))
                m_len = n + ((n - 1) * n) >> 1
                lsp = LeastSquaresProblem(x=rosen_startpoint(n), f! = rosenbrock_dense_res!, output_length=m_len, autodiff=:forward)
                start_c = 0.5 * sum(abs2, rosenbrock_dense_res!(zeros(m_len), lsp.x))
                res = LeastSquaresOptim.optimize!(lsp, LeastSquaresOptim.LevenbergMarquardt(); iterations=5000)
                return OptimizerResult(0.0, 0, 0, res.iterations, start_c, res.ssr * 0.5, res.converged)
            end),
            OptimizerDefinition("Ipopt", model_def -> begin
                n = length(rosen_startpoint(model_def.model isa NLLSProblem ? length(model_def.model.variables) : (model_def.model isa LeastSquaresProblem ? length(model_def.model.x) : model_def.model.meta.nvar)))
                model = Model(Ipopt.Optimizer)
                x0 = rosen_startpoint(n)
                @variable(model, x[i in 1:n], start = x0[i])
                len = n + ((n - 1) * n) >> 1
                @variable(model, residuals[1:len])
                idx = 0
                for j in 1:n-1
                    for k in j+1:n
                        idx += 1
                        @constraint(model, residuals[idx] == rosen_offdiag_w_dense * (x[k] - x[j]^2))
                    end
                end
                @constraint(model, [k in 1:n], residuals[idx+k] == rosen_diag_w_dense * (x[k] - 1.0))
                @objective(model, Min, 0.5 * sum(residuals .^ 2))
                set_silent(model)
                JuMP.optimize!(model)
                start_c = 0.5 * sum(abs2, rosenbrock_dense_res!(zeros(len), x0))
                return OptimizerResult(0.0, 0, 0, MOI.get(model, MOI.BarrierIterations()), start_c, objective_value(model), true)
            end),
            OptimizerDefinition("JSOSolvers (trunk)", model_def -> begin
                n = length(rosen_startpoint(model_def.model isa NLLSProblem ? length(model_def.model.variables) : (model_def.model isa LeastSquaresProblem ? length(model_def.model.x) : model_def.model.meta.nvar)))
                nls = build_jso_dense(n)
                res = JSOSolvers.trunk(nls)
                start_c = NLPModels.obj(nls, rosen_startpoint(n))
                return OptimizerResult(0.0, 0, 0, res.iter, start_c, res.objective, res.status == :first_order)
            end),
            OptimizerDefinition("JSOSolvers (tron)", model_def -> begin
                n = length(rosen_startpoint(model_def.model isa NLLSProblem ? length(model_def.model.variables) : (model_def.model isa LeastSquaresProblem ? length(model_def.model.x) : model_def.model.meta.nvar)))
                nls = build_jso_dense(n)
                res = JSOSolvers.tron(nls)
                start_c = NLPModels.obj(nls, rosen_startpoint(n))
                return OptimizerResult(0.0, 0, 0, res.iter, start_c, res.objective, res.status == :first_order)
            end),
            OptimizerDefinition("SecondOrderOptimization (Dogleg)", model_def -> begin
                p = deepcopy(model_def.model)
                opt = OptimizationOptions(iterator=:dogleg, maxiters=5000)
                _, res = SecondOrderOptimization.optimize!(p, opt)
                return OptimizerResult(0.0, 0, 0, res.niterations, res.startcost, res.bestcost, true)
            end)
        ]
    )
end
