# Adapters for third-party optimization problem abstractions
using SecondOrderOptimization
using LeastSquaresOptim
using NLPModels
using LinearAlgebra

"""
    SecondOrderOptimization.optimize(lsp::LeastSquaresProblem, options::OptimizationOptions=OptimizationOptions(); kwargs...)

Optimizes a `LeastSquaresOptim.LeastSquaresProblem` using `SecondOrderOptimization.optimize`.
"""
function SecondOrderOptimization.optimize(lsp::LeastSquaresProblem, options::OptimizationOptions=OptimizationOptions(); kwargs...)
    x0 = copy(lsp.x)
    m = length(lsp.y)
    n = length(x0)
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
    return SecondOrderOptimization.optimize(f, fdf!, x0, options; kwargs...)
end

"""
    SecondOrderOptimization.optimize(nlp::AbstractNLPModel, options::OptimizationOptions=OptimizationOptions(); kwargs...)

Optimizes an unconstrained `NLPModels.AbstractNLPModel` using `SecondOrderOptimization.optimize`.
"""
function SecondOrderOptimization.optimize(nlp::AbstractNLPModel, options::OptimizationOptions=OptimizationOptions(); kwargs...)
    if nlp.meta.ncon != 0
        error("Constrained NLPModels are not supported by SecondOrderOptimization")
    end
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
