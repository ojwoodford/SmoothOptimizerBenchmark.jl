# The conditioning of a problem at its solution (CN1 of the conditioning work): a test fixture, not package code
# (rules.md 11), loaded by test/conditioning.jl and by working scripts. Internal.
using LinearAlgebra, SparseArrays
using SmoothOptimizerBenchmark

const CNH = SmoothOptimizerBenchmark

# The problem's SecondOrderOptimization row
cn_soo_row(prob) = only(filter(o -> CNH.row_package(o.name) == "SecondOrderOptimization", prob.compatible_optimizers))

"""
    solution_point(prob, size) -> (x, iterations, status)

The point the SecondOrderOptimization row hands back (its `solution` keyword) on the model the pairing gives it, mapped
by that model's `to_point` to the standard model's layout, with the row's iterations and its status as the harness
decides it (against the problem's reference cost). Where the problem states its solution, `x` is that solution.
"""
function solution_point(prob, size)
    models = prob.generate_models(size)
    row = cn_soo_row(prob)
    m = CNH.resolve_optimizer_model(row, models)
    evaluator = CNH.point_evaluator(CNH.get_standard_optimizer_model(models))
    m.reset!()
    x = Float64[]
    r = row.optimize(m; time_limit=CNH.DEFAULT_MAXTIME, solution=x)
    r = CNH.evaluated_result(r, x, m, evaluator)
    results = Dict(row.name => r)
    CNH.assign_statuses!(results, Dict(row.name => (x, m)), evaluator, prob.reference_cost(size))
    stated = cn_stated_solution(prob, size)
    point = stated === nothing ? m.to_point(x) : stated
    return point, results[row.name].iterations, results[row.name].status
end
cn_stated_solution(prob, size) = hasproperty(prob, :reference_solution) ? prob.reference_solution(size) : nothing

"""
    solution_jacobian(prob, size; point = first(solution_point(prob, size))) -> J

The Jacobian the problem's point evaluator gives at `point` (with a robust kernel's weights applied).
"""
function solution_jacobian(prob, size; point=first(solution_point(prob, size)))
    models = prob.generate_models(size)
    evaluator = CNH.point_evaluator(CNH.get_standard_optimizer_model(models))
    _, J = evaluator.resjac(point)
    return J
end

# Whether J is symmetric tridiagonal
function cn_symtridiagonal(J)
    size(J, 1) == size(J, 2) || return false
    S = sparse(J)
    rows, cols, _ = findnz(S)
    all(abs.(rows .- cols) .<= 1) || return false
    return S == transpose(S)
end

"""
    jacobian_condition(J; nullity = 0) -> Float64

The largest singular value of `J` over its smallest but `nullity`, from `svdvals(Matrix(J))`; for a symmetric
tridiagonal `J` with more than 5000 columns, from the eigenvalues of its `SymTridiagonal`.
"""
function jacobian_condition(J; nullity::Integer=0)
    s = jacobian_singular_values(J)
    return s[1] / s[end - nullity]
end

# The singular values of J, largest first
function jacobian_singular_values(J)
    if size(J, 2) > 5000
        cn_symtridiagonal(J) || throw(ArgumentError("jacobian_condition: a J with $(size(J, 2)) columns must be symmetric tridiagonal"))
        S = sparse(J)
        T = SymTridiagonal(Vector(diag(S)), Vector(diag(S, 1)))
        return sort(abs.(eigvals(T)); rev=true)
    end
    return svdvals(Matrix(J))
end
