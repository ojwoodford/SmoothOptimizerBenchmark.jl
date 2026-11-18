# The harness's own evaluation of the point a row stopped at (IT1)
#
# Each adapter hands back the point it stopped at through the `solution` keyword, as a flat Vector{Float64} in the
# layout of the model it ran on; the model's `to_point` maps it to the layout of the problem's standard model, and the
# problem's one evaluator, built from that standard model, computes the cost there. So every row of a problem and size
# is evaluated by the same code, outside the timed region, and rows differ only by where they stopped.

"""
    point_evaluator(m::ModelDefinition) -> PointEvaluator

The evaluator of the problem's points, built from its standard model `m` (`get_standard_optimizer_model`), reset to
the start first: the cost ``\\tfrac12\\|r(x)\\|^2`` (the robust cost on the robust problems) at a point `x` in `m`'s
layout, and the start in that layout. A model type without a method has none (`nothing`): its rows' costs are `NaN`.
"""
function point_evaluator(m::ModelDefinition)
    m.reset!()
    return point_evaluator(m.model)
end
point_evaluator(::Any) = nothing

# A LeastSquaresProblem (the Standalone models): its own residual and Jacobian functions, which every adapter calls on a
# copy. On robust curve fitting this is the fudged model, whose residuals and Jacobian carry the kernel's weights
function point_evaluator(lsp::LeastSquaresProblem)
    f!, g! = lsp.f!, lsp.g!
    r = zeros(Float64, length(lsp.y))
    J = deepcopy(lsp.J)
    return PointEvaluator(x -> (f!(r, x); 0.5 * sum(abs2, r)), Vector{Float64}(lsp.x),
        x -> (f!(r, x); g!(J, x); (copy(r), copy(J))))
end

# BundleAdjustmentModels: its residuals and sparse Jacobian, at a vector of the points' coordinates followed by the
# cameras'
function point_evaluator(bam::BundleAdjustmentModel)
    nls = deepcopy(bam)
    m, n, nnzj = nls.nls_meta.nequ, nls.meta.nvar, nls.nls_meta.nnzj
    r = zeros(Float64, m)
    rows, cols, vals = Vector{Int}(undef, nnzj), Vector{Int}(undef, nnzj), zeros(Float64, nnzj)
    NLPModels.jac_structure_residual!(nls, rows, cols)
    resjac(x) = begin
        NLPModels.residual!(nls, x, r)
        NLPModels.jac_coord_residual!(nls, x, vals)
        return copy(r), sparse(rows, cols, vals, m, n)
    end
    return PointEvaluator(x -> (NLPModels.residual!(nls, x, r); 0.5 * sum(abs2, r)), copy(nls.meta.x0), resjac)
end

# An NLLSModel (a problem whose only model it is): its flat residual and Jacobian callbacks, on one thread, at the
# variables flattened in order (`soo_solution`)
function point_evaluator(m::NLLSModel.Model)
    cb = NLLSModel.nls_callbacks(deepcopy(m); numthreads=static(1))
    r = zeros(Float64, cb.nequ)
    J = copy(cb.J0)
    return PointEvaluator(x -> (cb.res!(r, x); 0.5 * sum(abs2, r)), copy(cb.x0),
        x -> (cb.res!(r, x); cb.jac!(J, x); (copy(r), copy(J))))
end

# The start and final costs of a row, from the problem's evaluator and the point the row handed back. A row that did
# not hand one back (a skip, an error, an adapter that returned none) keeps NaN as its final cost
function evaluated_result(r::OptimizerResult, point::Vector{Float64}, model::ModelDefinition, evaluator)
    evaluator === nothing && return with_costs(r, NaN, NaN)
    start_cost = evaluator.cost(evaluator.x0)
    final_cost = (r.status in (:skipped, :error) || isempty(point)) ? NaN : evaluator.cost(model.to_point(point))
    return with_costs(r, start_cost, final_cost)
end
