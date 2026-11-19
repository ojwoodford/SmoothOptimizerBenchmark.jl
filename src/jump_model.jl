# The JuMP models (IND3)
#
# A problem's JuMP model is its residuals written as JuMP expressions (`@NLexpression`, or `@expression` where they are
# affine), wrapped by NLPModelsJuMP's `MathOptNLSModel`, the native model of JSOSolvers, Ipopt, MadNLP and CaNNOLeS.
# JuMP differentiates its own expressions: its derivatives do not follow the problem's derivative mode (item 27, as
# restated 2026-11-19). The variables are in the Standalone model's order, so a point handed back needs no conversion.

"""
    jump_model(name, nls::MathOptNLSModel, x0) -> ModelDefinition

The `ModelDefinition` of a JuMP model: the model benchmark's cost (`obj`) and cost-and-linear-system (`obj`, `grad!` and
the exact Hessian, `hess_coord!`), both at the start `x0` with JuMP's cache cleared first, and `reset!`, which puts `x0`
back as the start. Internal.
"""
function jump_model(name::String, nls, x0::Vector{Float64})
    g = zeros(Float64, nls.meta.nvar)
    h_vals = zeros(Float64, nls.meta.nnzh)
    return ModelDefinition(
        name,
        nls,
        () -> begin
            reset_nlp_cache!(nls)
            NLPModels.obj(nls, x0)
        end,
        () -> begin
            reset_nlp_cache!(nls)
            c = NLPModels.obj(nls, x0)
            NLPModels.grad!(nls, x0, g)
            NLPModels.hess_coord!(nls, x0, h_vals)
            return (c, h_vals)
        end,
        () -> begin
            copyto!(nls.meta.x0, x0)
            reset_nlp_cache!(nls)
        end
    )
end
