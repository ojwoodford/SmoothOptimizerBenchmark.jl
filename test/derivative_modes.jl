using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

const DMB = SmoothOptimizerBenchmark
const DMN = DMB.NLLSModel
const DMS = DMB.StaticArrays

# The Standalone model of a problem's models when it is built by standalone_problem (DM2), else nothing
dm_standalone(models) = (i = findfirst(m -> m.model isa DMB.LeastSquaresProblem && m.model.f! isa DMB.StandaloneResiduals, models);
                         i === nothing ? nothing : models[i])
# The NLLSModel model of a problem's models (the first, as the SecondOrderOptimization rows' routing takes), else nothing
dm_nlls(models) = (i = findfirst(m -> m.model isa DMN.Model, models); i === nothing ? nothing : models[i])
# The costs and variables a problem's models evaluate: the Standalone model's, else the NLLSModel model's
function dm_costs(models)
    sa = dm_standalone(models)
    sa !== nothing && return sa.model.f!.layout.costs, sa.model.f!.layout.vars
    nl = dm_nlls(models)
    return values(nl.model.costs), nl.model.variables
end

# The method of computeresjac that evaluates the first cost of each vector, with every dependency unfixed
dm_methods(costs, vars) = [which(DMN.computeresjac, Tuple{typeof(DMB.allunfixed(DMN.ndeps(first(cv)))), typeof(first(cv)),
    map(typeof, DMN.getvars(first(cv), vars))...}) for cv in costs if !isempty(cv)]

rel(a, b) = DMB.norm(a - b) / max(DMB.norm(b), floatmin())

# Residuals and Jacobian of an NLLSModel model (its flat callbacks, one thread) and of a Standalone model, at x
function dm_resjac(m::DMN.Model, x)
    cb = DMN.nls_callbacks(deepcopy(m); numthreads=DMB.static(1))
    r, J = zeros(cb.nequ), copy(cb.J0)
    cb.res!(r, x)
    cb.jac!(J, x)
    return r, Matrix(J)
end
function dm_resjac(lsp::DMB.LeastSquaresProblem, x)
    r, J = zeros(length(lsp.y)), deepcopy(lsp.J)
    lsp.f!(r, x)
    lsp.g!(J, x)
    return r, Matrix(J)
end

# Central differences of a residual on one SVector variable, and its Jacobian from computeresjac
function dm_fd_check(res, x::DMS.SVector{N, Float64}; h=1e-6) where {N}
    r0, J = DMN.computeresjac(DMB.static(1), res, x)
    Jfd = zeros(length(r0), N)
    for k in 1:N
        e = DMS.SVector{N, Float64}(ntuple(i -> i == k ? h : 0.0, N))
        Jfd[:, k] = (DMN.computeresidual(res, x + e) - DMN.computeresidual(res, x - e)) / 2h
    end
    return rel(Matrix(J), Jfd), r0, J
end

const DM_MODES = Dict(
    "Exponential Curve Fitting" => :autodiff, "Robust Exponential Curve Fitting" => :autodiff,
    "1D ODE Boundary Value Problem" => :autodiff, "Dense Multi-dimensional Rosenbrock" => :autodiff,
    "Sparse Multi-dimensional Rosenbrock" => :autodiff, "Nonlinear 3D Pose Chain" => :autodiff,
    "Ill-Conditioned Polynomial Fitting" => :analytic, "Multilateration" => :analytic,
    "Dense Affine Alignment" => :analytic, "Robust Procrustes on SO(d)" => :analytic,
    "Sparse Bundle Adjustment" => :mixed)

@testset "One derivative mode per problem (DM11)" begin
    byname = Dict(p.name => p for p in problems)
    @test Set(keys(byname)) == Set(keys(DM_MODES))
    for (name, mode) in DM_MODES
        @test byname[name].derivatives === mode
    end
    @test [p.name for p in problems if p.derivatives === :mixed] == ["Sparse Bundle Adjustment"]

    # The rule, at the largest size, for every problem whose costs a model of the benchmark lists (the ODE BVP's are
    # built directly: its largest size also builds a JuMP model)
    rule_problems = ["Exponential Curve Fitting", "Robust Exponential Curve Fitting", "1D ODE Boundary Value Problem",
        "Dense Multi-dimensional Rosenbrock", "Sparse Multi-dimensional Rosenbrock", "Ill-Conditioned Polynomial Fitting",
        "Multilateration"]
    for name in rule_problems
        prob = byname[name]
        sz = last(prob.default_sizes)
        if name == "1D ODE Boundary Value Problem"
            p = DMB.build_sparse_ode_bvp_nlls(sz)
            costs, vars = values(p.costs), p.variables
        else
            costs, vars = dm_costs(prob.generate_models(sz))
        end
        @test (DMB.max_cost_inputs(Tuple(costs), vars) <= DMB.AUTODIFF_MAX_INPUTS) == (prob.derivatives === :autodiff)
    end
    # Affine alignment's one variable has n(n + 1) inputs (its Standalone model is not built by standalone_problem: DM10
    # was not committed); robust Procrustes' rotation has d(d − 1)/2
    @test last(byname["Dense Affine Alignment"].default_sizes)^2 + last(byname["Dense Affine Alignment"].default_sizes) > DMB.AUTODIFF_MAX_INPUTS
    dmax = last(byname["Robust Procrustes on SO(d)"].default_sizes)
    @test dmax * (dmax - 1) ÷ 2 > DMB.AUTODIFF_MAX_INPUTS

    # No hand-written derivative in an autodiff problem, one in an analytic problem: the method of computeresjac each
    # residual type of the problem's models is evaluated with
    for name in [rule_problems; "Nonlinear 3D Pose Chain"]
        prob = byname[name]
        costs, vars = dm_costs(prob.generate_models(first(prob.default_sizes)))
        for meth in dm_methods(costs, vars)
            @test meth.module === (prob.derivatives === :autodiff ? DMN : DMB)
        end
    end
    proc = byname["Robust Procrustes on SO(d)"]
    for m in filter(m -> m.model isa DMN.Model, proc.generate_models(first(proc.default_sizes)))
        for meth in dm_methods(values(m.model.costs), m.model.variables)
            @test meth.module === DMB
        end
    end

    # The models agree: the cost, Jᵀr and JᵀJ of the NLLSModel model and of the Standalone model, at the start and at a
    # perturbed point, at the smallest size and a larger one
    for name in ["Exponential Curve Fitting", "1D ODE Boundary Value Problem", "Dense Multi-dimensional Rosenbrock",
                 "Sparse Multi-dimensional Rosenbrock", "Ill-Conditioned Polynomial Fitting", "Multilateration"]
        prob = byname[name]
        for sz in prob.default_sizes[[1, 4]]
            models = prob.generate_models(sz)
            nl, sa = dm_nlls(models), dm_standalone(models)
            @test nl !== nothing && sa !== nothing
            x0 = copy(sa.model.x)
            @test x0 == DMB.soo_solution(nl.model)
            for x in (x0, x0 .+ 0.1 .* randn(DMB.MersenneTwister(7), length(x0)))
                r1, J1 = dm_resjac(nl.model, x)
                r2, J2 = dm_resjac(sa.model, x)
                @test rel(0.5 * sum(abs2, r2), 0.5 * sum(abs2, r1)) <= 1e-10
                @test rel(J2' * r2, J1' * r1) <= 1e-10
                @test rel(J2' * J2, J1' * J1) <= 1e-10
            end
        end
    end
    # Robust curve fitting: the cost and the gradient (the fudged Hessian differs by design), from the models' closures
    rprob = byname["Robust Exponential Curve Fitting"]
    for sz in rprob.default_sizes[[1, 4]]
        models = rprob.generate_models(sz)
        m_nlls = only(filter(m -> m.name == "NLLSModel (Static)", models))
        m_sa = only(filter(m -> m.name == "Standalone (fudged)", models))
        for p in ([1.0, 1.0, 1.0], [1.7, 1.2, 0.6])
            m_nlls.model.variables[1] = DMS.SVector{3}(p)
            copyto!(m_sa.model.x, p)
            c_nlls = DMN.cost(m_nlls.model)
            m_nlls.eval_cost_and_linear_system()
            g_nlls = copy(m_nlls.eval_cost_and_linear_system.g_nlls)
            c_sa, (g_sa, _) = m_sa.eval_cost_and_linear_system()
            @test rel(c_sa, c_nlls) <= 1e-10
            @test rel(g_sa, g_nlls) <= 1e-10
        end
        m_nlls.reset!()
        m_sa.reset!()
    end

    # Each analytic Jacobian is right, and of the types the autodiff path returned
    V, y = DMB.polyfit_data(60)
    N = DMB.POLYFIT_NCOEFFS
    pres = DMB.PolyFitResidual(DMS.SVector{N}(view(V, 17, :)), y[17])
    e, r0, J = dm_fd_check(pres, DMS.SVector{N, Float64}(range(-1, 1; length=N)))
    @test e <= 1e-7
    @test r0 isa DMS.SVector{1, Float64} && J isa DMS.SMatrix{1, N, Float64, N}
    for d in (2, 9, 16)
        rng = DMB.MersenneTwister(d)
        mres = DMB.MultilaterationResidual{d}(DMS.SVector{d, Float64}(4 .* DMB.normalize(randn(rng, d))), 3.5)
        e, r0, J = dm_fd_check(mres, DMS.SVector{d, Float64}(randn(rng, d)))
        @test e <= 1e-7
        @test r0 isa DMS.SVector{1, Float64} && J isa DMS.SMatrix{1, d, Float64, d}
    end

    # Routing: on every problem with both models the SecondOrderOptimization rows (those without an explicit model) run
    # on the NLLSModel model and LeastSquaresOptim's on the Standalone one; on the ODE BVP and the Rosenbrocks, JSOSolvers,
    # Ipopt, MadNLP and CaNNOLeS run on the JuMP model
    for name in ["Exponential Curve Fitting", "Robust Exponential Curve Fitting", "1D ODE Boundary Value Problem",
                 "Dense Multi-dimensional Rosenbrock", "Sparse Multi-dimensional Rosenbrock", "Ill-Conditioned Polynomial Fitting",
                 "Multilateration"]
        prob = byname[name]
        models = prob.generate_models(first(prob.default_sizes))
        nl = dm_nlls(models)
        sa = only(filter(m -> m.model isa DMB.LeastSquaresProblem, models))
        target = get_standard_optimizer_model(models, prob.category)
        @test target === sa
        jump = findfirst(m -> m.name == "NLPModels (MathOptNLSModel)", models)
        for o in prob.compatible_optimizers
            o.model_name === nothing || continue
            got = DMB.resolve_optimizer_model(o, target, models)
            if startswith(o.name, "SecondOrderOptimization")
                @test got === nl
            elseif startswith(o.name, "LeastSquaresOptim")
                @test got === sa
            elseif jump !== nothing && any(p -> startswith(o.name, p), ("JSOSolvers", "Ipopt", "MadNLP", "CaNNOLeS"))
                @test got === models[jump]
            end
        end
        if name in ("1D ODE Boundary Value Problem", "Dense Multi-dimensional Rosenbrock", "Sparse Multi-dimensional Rosenbrock")
            @test jump !== nothing
        end
    end
end
