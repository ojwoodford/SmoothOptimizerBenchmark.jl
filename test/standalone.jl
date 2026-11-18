using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# Small hand-built costs for the Standalone model (DM2), defined at top level (methods cannot be added inside a testset)
const SAB = SmoothOptimizerBenchmark
const SAN = SAB.NLLSModel
const SAS = SAB.StaticArrays

# A scalar residual on one scalar variable: a·x² − 1
struct SAQuad <: SAN.AbstractResidual
    a::Float64
    v::Int
end
SAN.ndeps(::SAQuad) = SAB.static(1)
SAN.nres(::SAQuad) = SAB.static(1)
SAN.varindices(c::SAQuad) = c.v
SAN.getvars(c::SAQuad, vars::AbstractVector) = (vars[c.v]::Float64,)
SAN.computeresidual(c::SAQuad, x) = c.a * x^2 - 1.0
Base.eltype(::SAQuad) = Float64

# Two residuals on two scalar variables, which may be the same one: (x·y, x − y³)
struct SAPair <: SAN.AbstractResidual
    v::SAS.SVector{2, Int}
end
SAN.ndeps(::SAPair) = SAB.static(2)
SAN.nres(::SAPair) = SAB.static(2)
SAN.varindices(c::SAPair) = c.v
SAN.getvars(c::SAPair, vars::AbstractVector) = (vars[c.v[1]]::Float64, vars[c.v[2]]::Float64)
SAN.computeresidual(::SAPair, x, y) = SAS.SVector(x * y, x - y^3)
Base.eltype(::SAPair) = Float64

# A scalar residual on an SVector{2} variable: p₁·exp(p₂·t) − y
struct SAExp <: SAN.AbstractResidual
    t::Float64
    y::Float64
    v::Int
end
SAN.ndeps(::SAExp) = SAB.static(1)
SAN.nres(::SAExp) = SAB.static(1)
SAN.varindices(c::SAExp) = c.v
SAN.getvars(c::SAExp, vars::AbstractVector) = (vars[c.v]::SAS.SVector{2, Float64},)
SAN.computeresidual(c::SAExp, p) = SAS.SVector(p[1] * exp(p[2] * c.t) - c.y)
Base.eltype(::SAExp) = Float64

# The same residual with a Huber kernel, for `fudged`
struct SAExpRobust <: SAN.AbstractResidual
    t::Float64
    y::Float64
end
SAN.ndeps(::SAExpRobust) = SAB.static(1)
SAN.nres(::SAExpRobust) = SAB.static(1)
SAN.varindices(::SAExpRobust) = 1
SAN.getvars(::SAExpRobust, vars::AbstractVector) = (vars[1]::SAS.SVector{2, Float64},)
SAN.computeresidual(c::SAExpRobust, p) = SAS.SVector(p[1] * exp(p[2] * c.t) - c.y)
SAN.robustkernel(::SAExpRobust) = SAN.Huber2oKernel(0.1)
Base.eltype(::SAExpRobust) = Float64

# A run-time-length variable with a Vector residual (x .^ 2 .- c, of run-time length) and a hand-written Matrix
# Jacobian, each cost owning its buffers
struct SADyn <: SAN.AbstractResidual
    c::Vector{Float64}
    r::Vector{Float64}
    J::Matrix{Float64}
end
SADyn(c::Vector{Float64}) = SADyn(c, zeros(length(c)), zeros(length(c), length(c)))
SAN.ndeps(::SADyn) = SAB.static(1)
SAN.nres(c::SADyn) = length(c.c)
SAN.varindices(::SADyn) = 1
SAN.getvars(::SADyn, vars::AbstractVector) = (vars[1]::Vector{Float64},)
# (Loops, not broadcasts: on Julia 1.10 with --check-bounds=yes, as Pkg.test runs, `c.r .= x .^ 2 .- c.c` allocates 16
# bytes per call, which the allocation tests below would charge to the Standalone model)
function SAN.computeresidual(c::SADyn, x::Vector{Float64})
    for k in eachindex(x)
        c.r[k] = x[k]^2 - c.c[k]
    end
    return c.r
end
function SAN.computeresjac(::SAB.StaticInt{1}, c::SADyn, x::Vector{Float64})
    SAN.computeresidual(c, x)
    fill!(c.J, 0.0)
    for k in eachindex(x)
        c.J[k, k] = 2x[k]
    end
    return c.r, c.J
end
Base.eltype(::SADyn) = Float64

# A cost that is not scalar under `fudged`, and one whose ndeps is not static
struct SADynDeps <: SAN.AbstractResidual end
SAN.ndeps(::SADynDeps) = 1
SAN.varindices(::SADynDeps) = 1
SAN.nres(::SADynDeps) = SAB.static(1)

# Central differences of f! at x
function sa_fd_jacobian(lsp, x; h=1e-6)
    m, n = length(lsp.y), length(x)
    J = zeros(m, n)
    rp, rm = zeros(m), zeros(m)
    for j in 1:n
        e = zeros(n); e[j] = h
        lsp.f!(rp, x + e)
        lsp.f!(rm, x - e)
        J[:, j] = (rp - rm) / 2h
    end
    return J
end

# Bytes allocated by f!(r, x) and g!(J, x), after a warm-up call, behind a function barrier (as static_buffers.jl)
sa_allocated_f(lsp, r, x) = (lsp.f!(r, x); @allocated lsp.f!(r, x))
sa_allocated_g(lsp, J, x) = (lsp.g!(J, x); @allocated lsp.g!(J, x))

@testset "The Standalone model, built from the costs (DM2)" begin
    sp = SAB.standalone_problem

    # Scalar variables, two cost types, one cost naming a variable twice (the ODE BVP's boundary cost at n = 1)
    costs = ([SAQuad(2.0, 1), SAQuad(0.5, 3)], [SAPair(SAS.SVector(1, 2)), SAPair(SAS.SVector(3, 3))])
    vars0 = [0.3, -0.7, 1.1]
    lsp = sp(costs, vars0)
    @test lsp.x == vars0 && lsp.x !== vars0
    @test length(lsp.y) == 6
    @test lsp.J isa Matrix{Float64} && size(lsp.J) == (6, 3)
    x = [0.4, 1.3, -0.6]
    r = zeros(6)
    lsp.f!(r, x)
    @test r ≈ [2 * 0.4^2 - 1, 0.5 * 0.6^2 - 1, 0.4 * 1.3, 0.4 - 1.3^3, 0.36, -0.6 + 0.216]
    J = zeros(6, 3)
    lsp.g!(J, x)
    @test J ≈ sa_fd_jacobian(lsp, x) rtol=1e-8
    @test J[5, 3] ≈ 2 * -0.6 && J[6, 3] ≈ 1 - 3 * 0.36   # the twice-named variable: both dependencies added
    # g! zeroes J first
    J2 = fill(7.0, 6, 3)
    lsp.g!(J2, x)
    @test J2 == J
    # Sparse: the same values, the pattern computed once, filled by position
    lsp_sp = sp(costs, vars0; sparse=true)
    @test lsp_sp.J isa SAB.SparseMatrixCSC{Float64, Int}
    @test SAB.nnz(lsp_sp.J) == 8   # (1,1) (2,3) (3,1) (3,2) (4,1) (4,2) (5,3) (6,3)
    Jsp = copy(lsp_sp.J)
    lsp_sp.g!(Jsp, x)
    @test Matrix(Jsp) == J
    rsp = zeros(6)
    lsp_sp.f!(rsp, x)
    @test rsp == r
    # A J without the prototype's pattern is refused
    @test_throws ArgumentError lsp_sp.g!(SAB.sparse(ones(6, 3)), x)
    @test_throws ArgumentError lsp.g!(SAB.sparse(ones(6, 3)), x)
    @test_throws DimensionMismatch lsp.g!(zeros(5, 3), x)
    @test_throws DimensionMismatch lsp.f!(zeros(5), x)
    @test SAB.max_cost_inputs(costs, vars0) == 2

    # An SVector variable, dense against sparse
    pts = [(0.1k, 2exp(-0.3 * 0.1k)) for k in 1:7]
    ecosts = ([SAExp(t, y, 2) for (t, y) in pts], [SAExp(t, y + 1, 1) for (t, y) in pts])
    evars0 = [SAS.SVector(1.0, 0.0), SAS.SVector(1.5, -0.2)]
    elsp = sp(ecosts, evars0)
    @test elsp.x == [1.0, 0.0, 1.5, -0.2]
    ex = [1.2, 0.1, 1.9, -0.4]
    eJ = zeros(14, 4)
    elsp.g!(eJ, ex)
    @test eJ ≈ sa_fd_jacobian(elsp, ex) rtol=1e-8
    @test all(iszero, eJ[1:7, 1:2]) && all(iszero, eJ[8:14, 3:4])
    elsp_sp = sp(ecosts, evars0; sparse=true)
    @test SAB.nnz(elsp_sp.J) == 28
    eJsp = copy(elsp_sp.J)
    elsp_sp.g!(eJsp, ex)
    @test Matrix(eJsp) == eJ
    @test SAB.max_cost_inputs(ecosts, evars0) == 2

    # A run-time-length variable: a Vector residual and a Matrix Jacobian
    dcosts = ([SADyn([1.0, 2.0, 3.0]), SADyn([0.5, 0.5, 0.5])],)
    dvars0 = [[1.0, 1.0, 1.0]]
    dlsp = sp(dcosts, dvars0)
    @test length(dlsp.y) == 6 && size(dlsp.J) == (6, 3)
    dx = [0.9, 1.4, -1.6]
    dr = zeros(6)
    dlsp.f!(dr, dx)
    @test dr ≈ [dx .^ 2 .- [1, 2, 3]; dx .^ 2 .- 0.5]
    dJ = zeros(6, 3)
    dlsp.g!(dJ, dx)
    @test dJ ≈ sa_fd_jacobian(dlsp, dx) rtol=1e-8
    @test SAB.max_cost_inputs(dcosts, dvars0) == 3

    # fudged: the formulas in curve_fitting_robust.jl's header, r̃ = sign(r)√ρ(r²), row scaled by ρ′(r²)|r|/√ρ(r²)
    fpts = [(0.2k, 2exp(-0.3 * 0.2k) + (isodd(k) ? 1.0 : 0.0)) for k in 1:6]
    fcosts = ([SAExpRobust(t, y) for (t, y) in fpts],)
    plain = ([SAExp(t, y, 1) for (t, y) in fpts],)
    fv0 = [SAS.SVector(1.0, 0.0)]
    flsp = sp(fcosts, fv0; fudged=true)
    plsp = sp(plain, fv0)
    fx = [1.7, -0.2]
    fr, pr = zeros(6), zeros(6)
    flsp.f!(fr, fx)
    plsp.f!(pr, fx)
    kern = SAN.Huber2oKernel(0.1)
    @test fr == [SAB.fudged_residual(kern, ri) for ri in pr]
    @test 0.5 * sum(abs2, fr) ≈ 0.5 * sum(ri -> SAB.robustify(kern, ri^2), pr) rtol=1e-14
    fJ, pJ = zeros(6, 2), zeros(6, 2)
    flsp.g!(fJ, fx)
    plsp.g!(pJ, fx)
    @test fJ == [SAB.fudged_scale(kern, pr[i]) * pJ[i, j] for i in 1:6, j in 1:2]
    @test any(i -> SAB.fudged_scale(kern, pr[i]) != 1, 1:6)   # some residuals are beyond the width

    # Construction errors, each up front
    @test_throws ArgumentError sp(costs, [SAS.SVector(1.0, 2.0), SAS.SVector(1.0, 2.0, 3.0)])   # mixed widths
    @test_throws ArgumentError sp(dcosts, [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0]])                    # two run-time variables
    @test_throws ArgumentError sp(costs, Any[0.3, -0.7, 1.1])
    @test_throws ArgumentError sp((SAQuad(1.0, 1),), [1.0])                                        # not a tuple of vectors
    @test_throws ArgumentError sp(([SAQuad(1.0, 4)],), vars0)                                      # no such variable
    @test_throws ArgumentError sp(([SAPair(SAS.SVector(1, 2))],), vars0; fudged=true)              # nres = 2 under fudged
    @test_throws ArgumentError sp(([SADynDeps()],), [1.0])                                         # ndeps not static

    # deepcopy (every adapter's): the copy has its own scratch variables, shared by its own f! and g!
    c = deepcopy(elsp)
    @test c.f!.layout === c.g!.layout
    @test c.f!.layout.vars !== elsp.f!.layout.vars
    before = copy(elsp.f!.layout.vars)
    c.g!(zeros(14, 4), [9.0, 9.0, 9.0, 9.0])
    @test elsp.f!.layout.vars == before
    @test c.f!.layout.vars == [SAS.SVector(9.0, 9.0), SAS.SVector(9.0, 9.0)]

    # Nothing allocates after one warm-up call (rules.md 21): static sizes, dense and sparse; a run-time variable whose
    # costs own their buffers
    @test sa_allocated_f(lsp, r, x) == 0
    @test sa_allocated_g(lsp, J, x) == 0
    @test sa_allocated_g(lsp_sp, Jsp, x) == 0
    @test sa_allocated_f(elsp, zeros(14), ex) == 0
    @test sa_allocated_g(elsp, eJ, ex) == 0
    @test sa_allocated_g(flsp, fJ, fx) == 0
    @test sa_allocated_f(dlsp, dr, dx) == 0
    @test sa_allocated_g(dlsp, dJ, dx) == 0
end
