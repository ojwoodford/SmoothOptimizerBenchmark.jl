# The Standalone model, built from the costs (DM2)
#
# A problem's costs are defined once, as NLLSModel residual types. The NLLSModel model uses them as NLLSModel does; the
# Standalone model is a LeastSquaresOptim `LeastSquaresProblem` whose `f!` and `g!` fill the residual vector and the
# Jacobian by calling the same per-cost functions (`computeresidual`, `computeresjac`), cost by cost, in a plain
# single-threaded loop: no threads, no BLAS. In an autodiff problem `computeresjac` is NLLSModel's own automatic
# differentiation, in an analytic one the problem's hand-written method, so every model evaluates a cost with the same
# code. Internal.

# The flags with every one of a cost's dependencies unfixed, 2^ndeps − 1, known at compile time
@inline allunfixed(::StaticInt{N}) where {N} = static((1 << N) - 1)

# Writing a flat point into a scratch copy of the variables, one method per supported layout
const STANDALONE_LAYOUTS = "a Vector{Float64} (one scalar variable per entry), a Vector{SVector{N, Float64}}, or a one-element Vector{Vector{Float64}}"

standalone_layout_supported(::Vector{Float64}) = true
standalone_layout_supported(::Vector{SVector{N, Float64}}) where {N} = true
standalone_layout_supported(v::Vector{Vector{Float64}}) = length(v) == 1
standalone_layout_supported(_) = false

unflatten!(vars::Vector{Float64}, x) = copyto!(vars, x)
function unflatten!(vars::Vector{SVector{N, Float64}}, x) where {N}
    @inbounds for k in eachindex(vars)
        o = (k - 1) * N
        vars[k] = SVector{N, Float64}(ntuple(i -> x[o + i], Val(N)))
    end
    return vars
end
unflatten!(vars::Vector{Vector{Float64}}, x) = (copyto!(vars[1], x); vars)

# The scalar inputs of variable `v`
varwidth(v) = Int(dynamic(nvars(v)))

# The variables a cost depends on, as a tuple of indices (`varindices` may be an Int, an SVector or a tuple)
depindices(cost) = Tuple(NLLSModel.varindices(cost))

# max_cost_inputs(costs::Tuple, vars0::AbstractVector) -> Int
# The largest number of scalar inputs of any cost: the total `nvars` of the variables it depends on (DM1's rule, against
# AUTODIFF_MAX_INPUTS)
max_cost_inputs(costs::Tuple, vars0::AbstractVector) =
    maximum((max_cost_inputs(c, vars0) for c in costs); init=0)
max_cost_inputs(costs::AbstractVector, vars0::AbstractVector) =
    maximum((sum(k -> varwidth(vars0[k]), depindices(c); init=0) for c in costs); init=0)

# What `f!` and `g!` share: the costs, the scratch variables, where each cost's rows and each variable's columns start
struct StandaloneLayout{C <: Tuple, V, R <: Tuple}
    costs::C          # one vector of residuals per concrete residual type
    vars::V           # scratch variables, written from x at the start of each call
    firstrow::R       # per vector of costs, the first row of each cost
    firstcol::Vector{Int}   # per variable, its first flat column
    m::Int
    n::Int
    fudged::Bool
end

# f!(r, x): every cost's residual, in loop order
struct StandaloneResiduals{L <: StandaloneLayout}
    layout::L
end

# g!(J, x): every cost's Jacobian, added into its rows and its variables' columns. `pos` is empty for a dense J, and for
# a sparse J the position in nonzeros(J) of every entry, in the order the fill loop visits them
struct StandaloneJacobian{L <: StandaloneLayout}
    layout::L
    sparse::Bool
    pos::Vector{Int}
    nnz::Int
end

function (f::StandaloneResiduals)(r::AbstractVector, x::AbstractVector)
    L = f.layout
    length(r) == L.m && length(x) == L.n || throw(DimensionMismatch("Standalone f!: r has length $(length(r)) and x $(length(x)); expected $(L.m) and $(L.n)"))
    unflatten!(L.vars, x)
    residuals_all!(r, L, L.costs, L.firstrow)
    return r
end

@inline residuals_all!(r, L, ::Tuple{}, ::Tuple{}) = nothing
@inline function residuals_all!(r, L, costs::Tuple, rows::Tuple)
    residuals_costs!(r, L, first(costs), first(rows))
    return residuals_all!(r, L, Base.tail(costs), Base.tail(rows))
end

# A function barrier: the element type of `costs` is concrete here
function residuals_costs!(r, L::StandaloneLayout, costs::AbstractVector, rows::Vector{Int})
    vars = L.vars
    @inbounds for c in eachindex(costs)
        cost = costs[c]
        res = NLLSModel.computeresidual(cost, NLLSModel.getvars(cost, vars)...)
        r0 = rows[c] - 1
        if L.fudged
            r[r0 + 1] = fudged_residual(NLLSModel.robustkernel(cost), res[1])
        else
            for i in 1:Int(dynamic(NLLSModel.nres(cost)))
                r[r0 + i] = res[i]
            end
        end
    end
    return nothing
end

function (g::StandaloneJacobian)(J::AbstractMatrix, x::AbstractVector)
    L = g.layout
    length(x) == L.n || throw(DimensionMismatch("Standalone g!: x has length $(length(x)); expected $(L.n)"))
    check_jacobian(g, J)
    unflatten!(L.vars, x)
    zero_jacobian!(J)
    jacobian_all!(J, g.pos, 0, L, L.costs, L.firstrow)
    return J
end

function check_jacobian(g::StandaloneJacobian, J::Matrix{Float64})
    size(J) == (g.layout.m, g.layout.n) || throw(DimensionMismatch("Standalone g!: J is $(size(J)); expected $((g.layout.m, g.layout.n))"))
    g.sparse && throw(ArgumentError("Standalone g!: this problem's Jacobian is sparse; got a dense J"))
    return nothing
end
function check_jacobian(g::StandaloneJacobian, J::SparseMatrixCSC{Float64, Int})
    size(J) == (g.layout.m, g.layout.n) || throw(DimensionMismatch("Standalone g!: J is $(size(J)); expected $((g.layout.m, g.layout.n))"))
    g.sparse || throw(ArgumentError("Standalone g!: this problem's Jacobian is dense; got a sparse J"))
    nnz(J) == g.nnz || throw(ArgumentError(
        "Standalone g!: J has $(nnz(J)) stored entries; the pattern this problem was built with has $(g.nnz)"))
    return nothing
end
check_jacobian(::StandaloneJacobian, J) = throw(ArgumentError("Standalone g!: J must be a Matrix{Float64} or a SparseMatrixCSC{Float64, Int}; got $(typeof(J))"))

zero_jacobian!(J::Matrix{Float64}) = fill!(J, 0.0)
zero_jacobian!(J::SparseMatrixCSC) = fill!(nonzeros(J), 0.0)

@inline jacobian_all!(J, pos, p, L, ::Tuple{}, ::Tuple{}) = p
@inline function jacobian_all!(J, pos, p, L, costs::Tuple, rows::Tuple)
    p = jacobian_costs!(J, pos, p, L, first(costs), first(rows))
    return jacobian_all!(J, pos, p, L, Base.tail(costs), Base.tail(rows))
end

# Add a value into the Jacobian: at (i, j) of a dense J; at the next stored position of a sparse one
@inline addentry!(J::Matrix{Float64}, pos, p, i, j, v) = (@inbounds J[i, j] += v; p)
@inline function addentry!(J::SparseMatrixCSC, pos, p, i, j, v)
    p += 1
    @inbounds nonzeros(J)[pos[p]] += v
    return p
end

# A function barrier: the element type of `costs` is concrete here
function jacobian_costs!(J, pos, p, L::StandaloneLayout, costs::AbstractVector, rows::Vector{Int})
    vars = L.vars
    @inbounds for c in eachindex(costs)
        cost = costs[c]
        res, jac = NLLSModel.computeresjac(allunfixed(NLLSModel.ndeps(cost)), cost, NLLSModel.getvars(cost, vars)...)
        scale = L.fudged ? fudged_scale(NLLSModel.robustkernel(cost), res[1]) : 1.0
        r0 = rows[c] - 1
        M = Int(dynamic(NLLSModel.nres(cost)))
        jl = 0
        for v in depindices(cost)
            c0 = L.firstcol[v] - 1
            for jj in 1:varwidth(vars[v])
                jl += 1
                for i in 1:M
                    p = addentry!(J, pos, p, r0 + i, c0 + jj, scale * jac[i, jl])
                end
            end
        end
    end
    return p
end

#     standalone_problem(costs::Tuple, vars0::AbstractVector; sparse::Bool = false, fudged::Bool = false) -> LeastSquaresProblem
#
# The Standalone model of a problem: a `LeastSquaresProblem` whose `f!` and `g!` evaluate the costs in `costs` (a tuple of
# vectors of residuals, one vector per concrete residual type, the same objects the NLLSModel model is built from) one
# after another, with NLLSModel's `computeresidual` and `computeresjac`, single-threaded.
#
# - The point `x` is the variables `vars0` (in the NLLSModel model's layout) flattened in order, each by `flat_point`.
#   `vars0` is a `Vector{Float64}`, a `Vector{SVector{N, Float64}}` or a one-element `Vector{Vector{Float64}}`.
# - Costs take consecutive rows, in the order of `costs`, `nres` each; `g!` adds each cost's Jacobian into its rows and
#   its variables' columns (adding, since a cost may name a variable twice).
# - `sparse = true`: `J` is a `SparseMatrixCSC` whose pattern is computed once, here, with the position of every entry.
# - `fudged = true`: each (scalar) residual `r` is replaced by `fudged_residual(kernel, r)` and its row of `J` scaled by
#   `fudged_scale(kernel, r)`, with `kernel = NLLSModel.robustkernel(cost)`, so that ½‖r̃‖² is the robust cost.
#
# `f!` and `g!` are callable structs holding a scratch copy of the variables, so `deepcopy` of the problem copies it with
# them. After a warm-up call they allocate nothing.
function standalone_problem(costs::Tuple, vars0::AbstractVector; sparse::Bool=false, fudged::Bool=false)
    standalone_layout_supported(vars0) || throw(ArgumentError(
        "standalone_problem: the variables are a $(typeof(vars0)) of length $(length(vars0)); supported: $(STANDALONE_LAYOUTS)"))
    all(c -> c isa AbstractVector, costs) || throw(ArgumentError("standalone_problem: costs must be a tuple of vectors of residuals; got $(typeof(costs))"))
    widths = [varwidth(v) for v in vars0]
    firstcol = cumsum([1; widths])[1:end-1]
    n = sum(widths; init=0)
    m = 0
    firstrow = map(costs) do cv
        rows = Vector{Int}(undef, length(cv))
        for (c, cost) in enumerate(cv)
            NLLSModel.ndeps(cost) isa StaticInt || throw(ArgumentError("standalone_problem: ndeps($(typeof(cost))) must be a StaticInt; got $(NLLSModel.ndeps(cost))"))
            deps = depindices(cost)
            length(deps) == Int(dynamic(NLLSModel.ndeps(cost))) || throw(ArgumentError(
                "standalone_problem: $(typeof(cost)) has ndeps = $(NLLSModel.ndeps(cost)) but varindices $(NLLSModel.varindices(cost))"))
            all(k -> 1 <= k <= length(vars0), deps) || throw(ArgumentError(
                "standalone_problem: a $(typeof(cost)) depends on variables $(deps); there are $(length(vars0))"))
            M = Int(dynamic(NLLSModel.nres(cost)))
            fudged && M != 1 && throw(ArgumentError("standalone_problem: fudged = true needs scalar residuals; a $(typeof(cost)) has nres = $M"))
            rows[c] = m + 1
            m += M
        end
        rows
    end
    L = StandaloneLayout(costs, deepcopy(vars0), firstrow, firstcol, m, n, fudged)
    x0 = reduce(vcat, [flat_point(v) for v in vars0]; init=Float64[])
    if sparse
        J, pos = standalone_pattern(L)
        jac! = StandaloneJacobian(L, true, pos, nnz(J))
    else
        J = zeros(Float64, m, n)
        jac! = StandaloneJacobian(L, false, Int[], m * n)
    end
    return LeastSquaresProblem(x=x0, f! = StandaloneResiduals(L), g! = jac!, J=J, output_length=m)
end

# The sparsity pattern, from one structural pass over the costs in the fill loop's order, and the position in
# nonzeros(J) of every entry the loop visits (duplicates share one)
function standalone_pattern(L::StandaloneLayout)
    I, Jc = Int[], Int[]
    for (cv, rows) in zip(L.costs, L.firstrow)
        for (c, cost) in enumerate(cv)
            M = Int(dynamic(NLLSModel.nres(cost)))
            for v in depindices(cost), jj in 1:varwidth(L.vars[v]), i in 1:M
                push!(I, rows[c] - 1 + i)
                push!(Jc, L.firstcol[v] - 1 + jj)
            end
        end
    end
    J = SparseArrays.sparse(I, Jc, zeros(Float64, length(I)), L.m, L.n)
    rv = rowvals(J)
    pos = Vector{Int}(undef, length(I))
    for p in eachindex(I)
        rng = nzrange(J, Jc[p])
        k = searchsortedfirst(view(rv, rng), I[p])
        pos[p] = first(rng) + k - 1
    end
    return J, pos
end
