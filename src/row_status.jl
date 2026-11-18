# A row's status, decided by the harness from the evaluated cost (IT4)
#
# The maintainer's tests (2026-11-18), not measured: a row that claims convergence is `ok` if its final cost is at most
# max(reference × (1 + STATUS_COST_RTOL), STATUS_COST_ATOL); otherwise `local_minimum` if the Gauss–Newton model predicts
# a cost reduction below STATIONARITY_RTOL × its cost from the point, and `above_reference` if not
const STATUS_COST_RTOL = 1e-8
const STATUS_COST_ATOL = 1e-6
const STATIONARITY_RTOL = 1e-8

passes_cost_test(cost, reference) = isfinite(cost) && cost <= max(reference * (1 + STATUS_COST_RTOL), STATUS_COST_ATOL)

"""
    predicted_reduction_ratio(evaluator, x) -> Float64

The cost reduction the Gauss–Newton model predicts from `x`, relative to the cost there: with `r` and `J` the weighted
residuals and Jacobian (`evaluator.resjac`), `δ = J \\ r` by a rank-revealing QR (pivoted dense QR, or SPQR for a sparse
`J`), and the ratio is `½ rᵀ(Jδ) / cost(x)`: `½‖r‖²` minus the least cost of the linearized problem, over the cost. No
`JᵀJ` is formed, and a rank-deficient `J` (bundle adjustment's gauge) is handled.
"""
function predicted_reduction_ratio(evaluator, x::AbstractVector{Float64})
    r, J = evaluator.resjac(x)
    δ = J isa SparseMatrixCSC ? qr(J) \ r : qr(J, ColumnNorm()) \ r
    return 0.5 * dot(r, J * δ) / evaluator.cost(x)
end

# The reference cost at a size: the known minimum, or else the lowest final cost of any row that handed back a point
function reference_cost(results::AbstractDict, points::AbstractDict, known)
    known === nothing || return Float64(known)
    costs = [r.final_cost for (name, r) in results if haskey(points, name) && !isempty(first(points[name])) && isfinite(r.final_cost)]
    return isempty(costs) ? NaN : minimum(costs)
end

"""
    assign_statuses!(results, points, evaluator, known_reference) -> results

Decides the status of every row at one size once all of them have run (IT4). `points` maps a row's name to the point it
handed back and the model it ran on; `known_reference` is the problem's known minimum (`nothing`: the best row's cost).
A row whose solver claims convergence keeps `:ok` only if its cost passes the cost test, and otherwise becomes
`:local_minimum` or `:above_reference` by the stationarity test; a row that did not converge keeps its status, with
"cost test passes" added to its message when it does.
"""
function assign_statuses!(results::AbstractDict, points::AbstractDict, evaluator, known_reference)
    reference = reference_cost(results, points, known_reference)
    for (name, r) in collect(results)
        r.status in (:skipped, :error) && continue
        passes = passes_cost_test(r.final_cost, reference)
        if r.status === :ok
            passes && continue
            point, model = get(points, name, (Float64[], nothing))
            ratio = (evaluator === nothing || isempty(point) || !isfinite(r.final_cost)) ? NaN :
                predicted_reduction_ratio(evaluator, model.to_point(point))
            status = ratio < STATIONARITY_RTOL ? :local_minimum : :above_reference
            note = @sprintf("claimed convergence at cost %.6e, above the reference %.6e; predicted reduction / cost %.2e", r.final_cost, reference, ratio)
            results[name] = with_status(r, status, isempty(r.message) ? note : r.message * "; " * note)
        elseif passes
            results[name] = with_status(r, r.status, isempty(r.message) ? "cost test passes" : r.message * "; cost test passes")
        end
    end
    return results
end
