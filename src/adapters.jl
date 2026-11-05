# Adapters for third-party optimization problem abstractions
using SecondOrderOptimization
using LeastSquaresOptim
using NLPModels
using LinearAlgebra
using StaticArrays
using NLLSModels
using Optim

"""
    SecondOrderOptimization.optimize!(lsp::LeastSquaresProblem, options::OptimizationOptions=OptimizationOptions(); kwargs...)

Optimizes a `LeastSquaresOptim.LeastSquaresProblem` in-place using `SecondOrderOptimization.optimize!`.
"""
function SecondOrderOptimization.optimize!(lsp::LeastSquaresProblem, options::OptimizationOptions=OptimizationOptions(); kwargs...)
    m = length(lsp.y)
    n = length(lsp.x)
    r_buffer = zeros(Float64, m)
    J_buffer = zeros(Float64, m, n)
    f(x) = begin
        lsp.f!(r_buffer, x)
        return 0.5 * sum(abs2, r_buffer)
    end
    fdf!(g, H, x) = begin
        lsp.f!(r_buffer, x)
        lsp.g!(J_buffer, x)
        mul!(g, J_buffer', r_buffer)
        mul!(H, J_buffer', J_buffer)
        return 0.5 * sum(abs2, r_buffer)
    end
    return SecondOrderOptimization.optimize!(f, fdf!, lsp.x, options; kwargs...)
end

function SecondOrderOptimization.optimize(lsp::LeastSquaresProblem, options::OptimizationOptions=OptimizationOptions(); kwargs...)
    return SecondOrderOptimization.optimize!(deepcopy(lsp), options; kwargs...)
end

"""
    SecondOrderOptimization.optimize!(nlp::AbstractNLPModel, options::OptimizationOptions=OptimizationOptions(); kwargs...)

Optimizes an unconstrained `NLPModels.AbstractNLPModel` in-place using `SecondOrderOptimization.optimize!`.
"""
function SecondOrderOptimization.optimize!(nlp::AbstractNLPModel, options::OptimizationOptions=OptimizationOptions(); kwargs...)
    if nlp.meta.ncon != 0
        error("Constrained NLPModels are not supported by SecondOrderOptimization")
    end
    f(x) = NLPModels.obj(nlp, x)
    H_low = NLPModels.hess(nlp, nlp.meta.x0)
    H_prototype = Matrix(Symmetric(H_low, :L))
    fdf!(g, H, x) = begin
        NLPModels.grad!(nlp, x, g)
        H_x = NLPModels.hess(nlp, x)
        copyto!(H, Symmetric(H_x, :L))
        return NLPModels.obj(nlp, x)
    end
    return SecondOrderOptimization.optimize!(f, fdf!, nlp.meta.x0, options; H=H_prototype, kwargs...)
end

function SecondOrderOptimization.optimize(nlp::AbstractNLPModel, options::OptimizationOptions=OptimizationOptions(); kwargs...)
    x0 = copy(nlp.meta.x0)
    f(x) = NLPModels.obj(nlp, x)
    H_low = NLPModels.hess(nlp, x0)
    H_prototype = Matrix(Symmetric(H_low, :L))
    fdf!(g, H, x) = begin
        NLPModels.grad!(nlp, x, g)
        H_x = NLPModels.hess(nlp, x)
        copyto!(H, Symmetric(H_x, :L))
        return NLPModels.obj(nlp, x)
    end
    return SecondOrderOptimization.optimize(f, fdf!, x0, options; H=H_prototype, kwargs...)
end

"""
    SecondOrderOptimization.optimize!(prob::NLLSProblem, options::OptimizationOptions=OptimizationOptions(); unfixed=nothing, kwargs...)

Optimizes an `NLLSModels.NLLSProblem` in-place using `SecondOrderOptimization.optimize!`.
"""
function SecondOrderOptimization.optimize!(prob::NLLSProblem, options::OptimizationOptions=OptimizationOptions(); unfixed=nothing, kwargs...)
    f, fdf!, x0, H = NLLSModels.optimvars(prob, unfixed)
    return SecondOrderOptimization.optimize!(f, fdf!, x0, options; H=H, kwargs...)
end

function SecondOrderOptimization.optimize(prob::NLLSProblem, options::OptimizationOptions=OptimizationOptions(); unfixed=nothing, kwargs...)
    p = deepcopy(prob)
    return SecondOrderOptimization.optimize!(p, options; unfixed=unfixed, kwargs...)
end

"""
    optimize_optim(lsp::LeastSquaresProblem, method=Optim.NewtonTrustRegion(); kwargs...)

Optimizes a `LeastSquaresProblem` using `Optim.jl`.
"""
function optimize_optim(lsp::LeastSquaresProblem, method=Optim.NewtonTrustRegion(); kwargs...)
    x0 = copy(lsp.x)
    m = length(lsp.y)
    n = length(x0)
    r_buffer = zeros(Float64, m)
    J_buffer = zeros(Float64, m, n)
    f(x) = begin
        lsp.f!(r_buffer, x)
        return 0.5 * sum(abs2, r_buffer)
    end
    g!(g, x) = begin
        lsp.f!(r_buffer, x)
        lsp.g!(J_buffer, x)
        mul!(g, J_buffer', r_buffer)
    end
    h!(H, x) = begin
        lsp.g!(J_buffer, x)
        mul!(H, J_buffer', J_buffer)
    end
    return Optim.optimize(f, g!, h!, x0, method; kwargs...)
end

"""
    optimize_optim(f, g!, h!, x0, method=Optim.NewtonTrustRegion(); kwargs...)

Direct Optim runner.
"""
function optimize_optim(f::Function, g!::Function, h!::Function, x0::AbstractVector, method=Optim.NewtonTrustRegion(); kwargs...)
    return Optim.optimize(f, g!, h!, copy(x0), method; kwargs...)
end
