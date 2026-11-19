# Which model each optimizer row runs on (IND1)
#
# Each optimizer runs on its package's native model, and on the problem's Standalone model if its package has none or the
# problem has none of them (maintainer, 2026-11-19). A row's package is the part of its name before " (". The table below
# gives, for each package, the names of its native models in order of preference: the first the problem has is the
# model the row runs on. A row's explicit `model_name` wins over the table. Every name is matched exactly.

"""
    NATIVE_MODELS

Package ⇒ the names of its native models, in order of preference (IND1). A row whose package has none, or whose
problem has none of them, runs on the problem's Standalone model (`STANDALONE_MODELS`). Internal.
"""
const NATIVE_MODELS = (
    "CaNNOLeS" => ("BundleAdjustmentModels", "JuMP (fudged)", "JuMP"),
    "Ipopt" => ("BundleAdjustmentModels", "JuMP (fudged)", "JuMP"),
    "JSOSolvers" => ("BundleAdjustmentModels", "JuMP (fudged)", "JuMP"),
    "LeastSquaresOptim" => (),
    "MadNLP" => ("BundleAdjustmentModels", "JuMP (fudged)", "JuMP"),
    "Manopt" => ("Manifolds",),
    "NonlinearSolve" => (),
    "Optim" => (),
    "SecondOrderOptimization" => ("NLLSModel (Specialized)", "NLLSModel (Static)", "NLLSModel (Sparse)", "NLLSModel"),
)

# The Standalone models, in order of preference: a problem has at most one of them
const STANDALONE_MODELS = ("Standalone (fudged)", "Standalone (Sparse)", "Standalone")

# The models a problem's points can be evaluated on (`get_standard_optimizer_model`), in order of preference
const STANDARD_MODELS = ("Manifolds", STANDALONE_MODELS..., "BundleAdjustmentModels")

"""
    row_package(name) -> String

The package of an optimizer row: the part of its name before `" ("`, or the whole name if it has none.
"""
row_package(name::AbstractString) = String(first(split(name, " ("; limit=2)))

# The native models of a package, by its name in the table; an ArgumentError for a package the table does not list
function native_models(package::AbstractString)
    idx = findfirst(p -> first(p) == package, NATIVE_MODELS)
    idx === nothing && throw(ArgumentError("The package $(repr(package)) is not in the pairing table; its packages are " *
        join(repr.(first.(NATIVE_MODELS)), ", ")))
    return last(NATIVE_MODELS[idx])
end

# The first model of `models` whose name is in `names`, taking `names` in order, or nothing
function first_model(names, models::Vector{<:ModelDefinition})
    for name in names
        idx = findfirst(m -> m.name == name, models)
        idx === nothing || return models[idx]
    end
    return nothing
end

"""
    resolve_optimizer_model(opt::OptimizerDefinition, models::Vector{<:ModelDefinition}) -> ModelDefinition

The model `opt.optimize` is given (IND1). A row with a `model_name` runs on the model of exactly that name. Otherwise
the row's package (`row_package`) is looked up in `NATIVE_MODELS`, and the row runs on the first of the package's native
models that `models` has, or else on the problem's Standalone model. An `ArgumentError` if the row names a model the
problem does not have, if its package is not in the table, or if it has neither a native model nor a Standalone one.
"""
function resolve_optimizer_model(opt::OptimizerDefinition, models::Vector{<:ModelDefinition})
    model_names() = join(repr.(getfield.(models, :name)), ", ")
    if opt.model_name !== nothing
        idx = findfirst(m -> m.name == opt.model_name, models)
        idx === nothing && throw(ArgumentError("Optimizer row $(repr(opt.name)) asks for the model $(repr(opt.model_name)), " *
            "which this problem does not have; its models are $(model_names())"))
        return models[idx]
    end
    m = first_model(native_models(row_package(opt.name)), models)
    m === nothing || return m
    m = first_model(STANDALONE_MODELS, models)
    m === nothing || return m
    throw(ArgumentError("Optimizer row $(repr(opt.name)) has no model on this problem: none of its package's native " *
        "models and no Standalone model; its models are $(model_names())"))
end

"""
    get_standard_optimizer_model(models::Vector{<:ModelDefinition}) -> ModelDefinition

The problem's standard model, from which the point evaluator is built (IT1): the first of `"Manifolds"`, the Standalone
models and `"BundleAdjustmentModels"` that `models` has, matched by exact name. An `ArgumentError` if it has none.
"""
function get_standard_optimizer_model(models::Vector{<:ModelDefinition})
    m = first_model(STANDARD_MODELS, models)
    m === nothing && throw(ArgumentError("No standard model among $(join(repr.(getfield.(models, :name)), ", ")); " *
        "expected one of $(join(repr.(STANDARD_MODELS), ", "))"))
    return m
end
