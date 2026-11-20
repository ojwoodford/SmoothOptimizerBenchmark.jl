# 1D ODE Boundary Value Problem (Bratu equation with a linear reaction term, Large Sparse Tridiagonal)
# Models nonlinear thermal diffusion / combustion with heat loss:
#   -u''(x) + c * u(x) = \lambda * exp(u(x)),  x in [0, (N + 1)h],  u(0) = u((N + 1)h) = 0
# Discretized using standard 2nd-order central differences across N interior grid points a fixed distance h apart, so the
# domain grows with N. A fixed spacing keeps the conditioning fixed (cond(J) about 1 + 4/(h²(c − eᵘ)), 116 to 157 from
# NumPy, and flat once the domain is longer than the damping length): with a fixed domain the residuals carry 1/h² and
# cond(J) grows as N² (`improvements.md` item 30). The discrete system has an exact solution between 0 and the constant
# solving c·u = λeᵘ (0.357), so the minimum cost is 0.
using Static, StaticArrays, LinearAlgebra, SparseArrays
using NLLSModel, LeastSquaresOptim, JuMP, Ipopt, JSOSolvers, NLPModels, NLPModelsJuMP, SecondOrderOptimization

const bratu_lambda_default = 1.0
# The grid spacing and the reaction coefficient, the same at every size (CN4)
const ODE_BVP_SPACING = 0.1
const ODE_BVP_REACTION = 4.0
const ODE_BVP_INV_H2 = 1.0 / ODE_BVP_SPACING^2

ode_bvp_startpoint(n::Int) = zeros(Float64, n)

struct ODEBVPInternalResidual <: AbstractResidual
    inv_h2::Float64
    reaction::Float64
    lambda::Float64
    varind::SVector{3, Int}
end
Base.eltype(::ODEBVPInternalResidual) = Float64
NLLSModel.ndeps(::ODEBVPInternalResidual) = static(3)
NLLSModel.nres(::ODEBVPInternalResidual) = static(1)
NLLSModel.varindices(r::ODEBVPInternalResidual) = r.varind
NLLSModel.getvars(r::ODEBVPInternalResidual, vars::AbstractVector) = (vars[r.varind[1]]::Float64, vars[r.varind[2]]::Float64, vars[r.varind[3]]::Float64)
NLLSModel.computeresidual(r::ODEBVPInternalResidual, u_prev, u_curr, u_next) =
    (-u_prev + 2.0 * u_curr - u_next) * r.inv_h2 + r.reaction * u_curr - r.lambda * exp(u_curr)

struct ODEBVPBoundaryResidual <: AbstractResidual
    inv_h2::Float64
    reaction::Float64
    lambda::Float64
    varind::SVector{2, Int}
    is_left::Bool
end
Base.eltype(::ODEBVPBoundaryResidual) = Float64
NLLSModel.ndeps(::ODEBVPBoundaryResidual) = static(2)
NLLSModel.nres(::ODEBVPBoundaryResidual) = static(1)
NLLSModel.varindices(r::ODEBVPBoundaryResidual) = r.varind
NLLSModel.getvars(r::ODEBVPBoundaryResidual, vars::AbstractVector) = (vars[r.varind[1]]::Float64, vars[r.varind[2]]::Float64)
function NLLSModel.computeresidual(r::ODEBVPBoundaryResidual, u1, u2)
    if r.is_left
        return (2.0 * u1 - u2) * r.inv_h2 + r.reaction * u1 - r.lambda * exp(u1)
    else
        return (-u1 + 2.0 * u2) * r.inv_h2 + r.reaction * u2 - r.lambda * exp(u2)
    end
end

function build_sparse_ode_bvp_nlls(n::Int, lambda::Float64=bratu_lambda_default)
    inv_h2, c = ODE_BVP_INV_H2, ODE_BVP_REACTION
    costs = NLLSModel.CostStruct{Union{ODEBVPBoundaryResidual, ODEBVPInternalResidual}}()
    if n == 1
        push!(get(costs, ODEBVPBoundaryResidual), ODEBVPBoundaryResidual(inv_h2, c, lambda, SVector(1, 1), true))
    elseif n == 2
        push!(get(costs, ODEBVPBoundaryResidual), ODEBVPBoundaryResidual(inv_h2, c, lambda, SVector(1, 2), true))
        push!(get(costs, ODEBVPBoundaryResidual), ODEBVPBoundaryResidual(inv_h2, c, lambda, SVector(1, 2), false))
    else
        push!(get(costs, ODEBVPBoundaryResidual), ODEBVPBoundaryResidual(inv_h2, c, lambda, SVector(1, 2), true))
        for i in 2:n-1
            push!(get(costs, ODEBVPInternalResidual), ODEBVPInternalResidual(inv_h2, c, lambda, SVector(i-1, i, i+1)))
        end
        push!(get(costs, ODEBVPBoundaryResidual), ODEBVPBoundaryResidual(inv_h2, c, lambda, SVector(n-1, n), false))
    end
    return NLLSModel.Model(ode_bvp_startpoint(n), costs)
end

function build_sparse_ode_bvp_jso(n::Int, lambda::Float64=bratu_lambda_default)
    inv_h2, c = ODE_BVP_INV_H2, ODE_BVP_REACTION
    model = JuMP.Model()
    x0 = ode_bvp_startpoint(n)
    @variable(model, u[i = 1:n], start = x0[i])
    if n == 1
        @NLexpression(model, F[1], 2.0 * u[1] * inv_h2 + c * u[1] - lambda * exp(u[1]))
    else
        @NLexpression(model, F_left, (2.0 * u[1] - u[2]) * inv_h2 + c * u[1] - lambda * exp(u[1]))
        @NLexpression(model, F_mid[i = 2:n-1], (-u[i-1] + 2.0 * u[i] - u[i+1]) * inv_h2 + c * u[i] - lambda * exp(u[i]))
        @NLexpression(model, F_right, (-u[n-1] + 2.0 * u[n]) * inv_h2 + c * u[n] - lambda * exp(u[n]))
    end
    exprs = n == 1 ? [F[1]] : [F_left; [F_mid[i] for i in 2:n-1]; F_right]
    return MathOptNLSModel(model, exprs)
end

# The SecondOrderOptimization row's configuration (IND4, re-derived by CN4 for the fixed spacing): NLLSModel's
# recommendoptimizer at the largest size, N = 32768, with numthreads = 1, evaluated 2026-11-20 at NLLSModel d2e4374
# (Julia 1.13.3); rules F_wellconditioned, RS_hessian, L_sparse, I_lm (a solve, 1.0 ms, costs less than a linearization,
# 1.5 ms)
const ODE_BVP_SOO = (; iterator = :levenbergmarquardt, linsolver = :ldl, formulation = :hessian, reduction = :none, storage = :sparse)

function create_ode_bvp_problem()
    ProblemDefinition(
        "1D ODE Boundary Value Problem",
        :large_sparse,
        Any[32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768],
        n -> begin
            x0 = ode_bvp_startpoint(n)

            # Model 1: NLLSModel Problem
            nlls_prob = build_sparse_ode_bvp_nlls(n)
            nt = benchmark_numthreads()
            f_nlls, fdf_nlls!, x0_nlls, H_proto_nlls = NLLSModel.optimvars(nlls_prob; unfixed=nothing, numthreads=nt)
            g_nlls = zeros(Float64, n)
            H_buf_nlls = H_proto_nlls === nothing ? zeros(Float64, n, n) : deepcopy(H_proto_nlls)
            m_nlls = ModelDefinition(
                "NLLSModel (Sparse)",
                nlls_prob,
                () -> NLLSModel.cost(nlls_prob, nt),
                () -> (fdf_nlls!(g_nlls, H_buf_nlls, x0_nlls), H_buf_nlls),
                () -> copyto!(nlls_prob.variables, x0)
            )

            # Model 2: Standalone (Sparse): the NLLSModel model's own costs, in the order of its CostStruct, their residuals
            # and Jacobians filled cost by cost by NLLSModel's computeresidual and computeresjac (autodiff), in a plain loop,
            # into a sparsity pattern computed once (DM5)
            lsp = standalone_problem((get(nlls_prob.costs, ODEBVPBoundaryResidual), get(nlls_prob.costs, ODEBVPInternalResidual)), x0;
                                     sparse=true)
            r_buf = zeros(Float64, n)
            g_buf = zeros(Float64, n)
            m_lso = ModelDefinition(
                "Standalone (Sparse)",
                lsp,
                () -> begin
                    lsp.f!(r_buf, lsp.x)
                    return 0.5 * sum(abs2, r_buf)
                end,
                () -> begin
                    lsp.f!(r_buf, lsp.x)
                    lsp.g!(lsp.J, lsp.x)
                    mul!(g_buf, lsp.J', r_buf)
                    H_sp = lsp.J' * lsp.J
                    return (0.5 * sum(abs2, r_buf), H_sp)
                end,
                () -> copyto!(lsp.x, x0)
            )

            # Model 3: JuMP, as a MathOptNLSModel, at every size (its build was measured, IND3, decision 18)
            m_jump = jump_model("JuMP", build_sparse_ode_bvp_jso(n), x0)

            return ModelDefinition[m_jump, m_nlls, m_lso]   # alphabetical (IND8)
        end,
        get_standard_optimizers(ODE_BVP_SOO),
        "Grid Points N",
        # The discretized equations have an exact solution: zero residuals (IT4)
        _ -> 0.0;
        # Derivatives (DM1): every cost has at most 3 inputs
        derivatives = :autodiff
    )
end
