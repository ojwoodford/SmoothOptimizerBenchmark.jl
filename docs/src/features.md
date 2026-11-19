# Package Features

The benchmark's tables show how fast each package is on the problems it can run. This page shows what each package can run: which kinds of variable, derivative, robust kernel and constraint a modelling package can express, and which steps, constraints and linear solvers an optimizer offers. It is the reason behind every row that is missing from a problem's table.

Packages marked † are not run by the benchmark. Their columns are from their documentation alone, and there are no measurements to set beside them.

**Reading the tables.** ✓: supported; the tick links to the documentation, or to the benchmark problem that exercises the feature. ✗: not supported in the version given. ~: partly supported, or only with a further package or a reformulation; the number beside it refers to a note under the table. A feature that is planned but not released is ✗, in our own packages as in the others.

**Corrections.** If you maintain or use one of these packages and a cell is wrong or out of date, please open an issue at [SmoothOptimizerBenchmark.jl](https://github.com/ojwoodford/SmoothOptimizerBenchmark.jl/issues) with a link to the documentation that shows it.

Speed is not on this page. Whether evaluation or iteration allocates, and how each package scales with problem size, is measured on the [problem pages](index.md).

## Modelling packages

A modelling package is where the problem is written down: its variables, its costs, and how their derivatives are obtained. Several of the packages here are also optimizers; this table is about the problem description each accepts.

### Key

| Column | Package | Version | A problem is written as |
|:---|:---|:---|:---|
| JuMP | JuMP.jl, with NLPModelsJuMP.jl to reach NLPModels solvers | 1.32.1 (NLPModelsJuMP 0.13.6) | algebraic expressions |
| LSOptim | LeastSquaresOptim.jl (`LeastSquaresProblem`; the benchmark's "Standalone" models) | 0.8.10 | a residual function, optionally a Jacobian function |
| Manopt | Manopt.jl objectives on Manifolds.jl | 0.6.15 (Manifolds 0.11.38) | cost and derivative functions on a manifold |
| NLLSModel | NLLSModel.jl | 0.1.0 at `ebf8f1d` | Julia types for variables and costs, added to a `Model` |
| NonlinSolve | NonlinearSolve.jl (`NonlinearLeastSquaresProblem`) | 4.32.0 | a residual function |
| Optim | Optim.jl (objective types from NLSolversBase.jl) | 2.3.2 (NLSolversBase 8.0.1) | a cost function, optionally gradient and Hessian functions |
| ADNLP† | ADNLPModels.jl | 0.8.15 | a cost or residual function, differentiated automatically |
| Exa† | ExaModels.jl | 0.15.0 | algebraic expressions over iterators |
| Optimization† | Optimization.jl (`OptimizationFunction`) | 5.9.1 (SciMLBase 3.58.0) | a cost function and a choice of differentiation backend |
| RoME† | RoME.jl with IncrementalInference.jl | 0.25.0 (IncrementalInference 0.37.2) | a factor graph of variables and factors |

BundleAdjustmentModels.jl, which the benchmark uses for bundle adjustment, is a collection of ready-made problems behind the NLPModels interface and not a way of writing new ones, so it has no column.

### What the rows mean

**Problem class**
- *Least-squares residuals are first class.* The user supplies a residual vector, and the package knows the cost is half its squared norm, so that an optimizer can be given the residual and its Jacobian.
- *General scalar costs.* The user can supply a cost that is not a sum of squares, with its gradient and Hessian.

**Variables**
- *Manifold variables.* A variable can live on a manifold (a rotation, a pose, a unit vector) and be updated through a minimal tangent-space step, without constraints or renormalization by the user.
- *Variable blocks of different types and sizes.* One problem can hold variables of several types and dimensions (say poses, points and a scalar), each addressed as itself, not as a slice the user cuts from one flat vector.
- *Fix a subset of variables.* Chosen variables can be held constant for a solve without rebuilding the problem.

**Structure**
- *Explicit variable-to-cost graph.* The user states which variables each cost depends on, and the package keeps that bipartite graph. Sparsity, threading and elimination can be read from it without detection.
- *Sparse Jacobian or Hessian.* The package can evaluate into sparse storage.
- *Block-sparse storage.* The package stores the Jacobian or Hessian as dense blocks, one per pair of variables that share a cost, not as scalar entries.

**Derivatives**
- *Automatic.* Derivatives are computed by automatic differentiation of the user's function.
- *Automatic, sparse.* Automatic differentiation that computes only the structural non-zeros, with the structure found by the package.
- *Hand-written derivatives.* The user can supply a Jacobian, gradient or Hessian.
- *Exact second derivatives.* The Hessian of the cost itself is available, not only the Gauss–Newton approximation `JᵀJ`.
- *Operator products.* Jacobian-vector, transposed-Jacobian-vector or Hessian-vector products are available without forming the matrix.

**Robust kernels**
- *Fixed kernels.* A robust kernel (Huber, Geman–McClure and so on) is declared on a residual, and the package applies it to cost and derivatives. Any least-squares package can be given a robust cost by rewriting the residuals by hand, as the benchmark's "fudged" rows do; that is not a tick.
- *Second-order correction.* The kernel's second derivative enters the Hessian (the Triggs correction), not only the reweighting.
- *Adaptive kernels.* A kernel's parameters are variables of the problem and are optimized with the rest.

Manopt is the one package here that supports robust kernels through its optimization interface and not in the model: its Levenberg–Marquardt solver takes a robustifier for each block of residuals, so the kernels are available to that solver only. The benchmark's Robust Procrustes problem uses it that way.

**Constraints**
- *Bounds on variables.* Lower and upper bounds can be stated on variables.
- *Equality constraints.* Constraints `c(x) = 0` can be stated.
- *Nonlinear inequality constraints.* Constraints `c(x) ≤ 0` with nonlinear `c` can be stated.

Whether a stated constraint is then enforced depends on the optimizer: see the next table.

**Evaluation**
- *Multithreaded evaluation.* The package evaluates costs and derivatives on several threads itself.
- *GPU evaluation.* The package evaluates the model on a GPU.

### Table

| Feature | JuMP | LSOptim | Manopt | NLLSModel | NonlinSolve | Optim | ADNLP† | Exa† | Optimization† | RoME† |
|:---|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| **Problem class** |  |  |  |  |  |  |  |  |  |  |
| Least-squares residuals are first class | [~](https://github.com/JuliaSmoothOptimizers/NLPModelsJuMP.jl/blob/v0.13.6/docs/src/tutorial.md#L161-L170) (1) | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L58-L63) | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/src/solvers/LevenbergMarquardt.jl#L201-L212) | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L31-L35) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/basics/nonlinear_problem.md#L55) | ✗ | [✓](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl/blob/v0.8.15/docs/src/index.md#L39) | ✗ | ✗ | [✓](https://github.com/JuliaRobotics/IncrementalInference.jl/blob/IncrementalInference-v0.37.2/IncrementalInference/src/parametric/services/ParametricManopt.jl#L459-L461) |
| General scalar costs | [✓](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/nonlinear.md#L15-L29) | ✗ | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/gradient_descent.md#L1) | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L398-L406) | ✗ | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/user/minimization.md#L1-L12) | [✓](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl/blob/v0.8.15/docs/src/index.md#L39) | [✓](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/README.md#L15) | [✓](https://github.com/SciML/SciMLBase.jl/blob/v3.58.0/src/scimlfunctions.jl#L2251-L2252) | ✗ |
| **Variables** |  |  |  |  |  |  |  |  |  |  |
| Manifold variables | ✗ | ✗ | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/LevenbergMarquardt.md#L31-L37) | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/test/tallproblems.jl#L36-L54) | ✗ | [~](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/algo/manifolds.md#L1-L30) (2) | ✗ | ✗ | [~](https://github.com/SciML/Optimization.jl/blob/v5.9.1/docs/src/optimization_packages/manopt.md#L1-L4) (3) | [✓](https://github.com/JuliaRobotics/IncrementalInference.jl/blob/IncrementalInference-v0.37.2/IncrementalInference/src/parametric/services/ParametricManopt.jl#L445-L447) |
| Variable blocks of different types and sizes | [~](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/variables.md#L800) (4) | ✗ | [~](https://github.com/JuliaManifolds/Manifolds.jl/blob/v0.11.38/docs/src/manifolds/product.md#L1) (5) | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L2-L12) | ✗ | ✗ | ✗ | [~](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/docs/src/guide.jl#L32-L35) (4) | ✗ | [✓](https://github.com/JuliaRobotics/IncrementalInference.jl/blob/IncrementalInference-v0.37.2/IncrementalInference/src/parametric/services/ParametricManopt.jl#L445-L452) |
| Fix a subset of variables | [✓](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/variables.md#L512-L545) | ✗ | ✗ | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/keywords.jl#L57-L58) | ✗ | ✗ | [~](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl/blob/v0.8.15/docs/src/sparsity_pattern.md#L38-L44) (6) | ✗ | ✗ | [✓](https://github.com/JuliaRobotics/IncrementalInference.jl/blob/IncrementalInference-v0.37.2/IncrementalInference/src/ExportAPI.jl#L111-L112) |
| **Structure** |  |  |  |  |  |  |  |  |  |  |
| Explicit variable-to-cost graph | [~](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/nonlinear.md#L204-L207) (7) | ✗ | ✗ | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L6-L11) | ✗ | ✗ | ✗ | [~](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/README.md#L31-L32) (7) | ✗ | [✓](https://github.com/JuliaRobotics/IncrementalInference.jl/blob/IncrementalInference-v0.37.2/IncrementalInference/src/parametric/services/ParametricManopt.jl#L456-L457) |
| Sparse Jacobian or Hessian | [✓](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/nonlinear.md#L204-L207) | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L5) | ✗ | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L208-L209) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/basics/sparsity_detection.md#L1-L3) | [✓](problems/pose_chain.md) | [✓](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl/blob/v0.8.15/docs/src/sparse.md#L1-L3) | [✓](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/README.md#L32) | [✓](https://github.com/SciML/SciMLBase.jl/blob/v3.58.0/src/scimlfunctions.jl#L2265) | [✓](https://github.com/JuliaRobotics/IncrementalInference.jl/blob/IncrementalInference-v0.37.2/IncrementalInference/src/parametric/services/ParametricManopt.jl#L435) |
| Block-sparse storage | ✗ | ✗ | ✗ | [~](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L208-L209) (8) | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ |
| **Derivatives** |  |  |  |  |  |  |  |  |  |  |
| Automatic | [✓](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/nonlinear.md#L204-L207) | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L26) | [~](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/tutorials/AutomaticDifferentiation.qmd#L12) (9) | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L370-L373) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/basics/autodiff.md#L1) | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/user/gradientsandhessians.md#L19-L22) | [✓](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl/blob/v0.8.15/docs/src/backend.md#L10-L14) | [✓](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/README.md#L31-L32) | [✓](https://github.com/SciML/Optimization.jl/blob/v5.9.1/docs/src/API/ad.md#L3-L5) | [✓](https://github.com/JuliaRobotics/IncrementalInference.jl/blob/IncrementalInference-v0.37.2/IncrementalInference/src/parametric/services/ParametricManopt.jl#L309-L318) |
| Automatic, sparse | [✓](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/nonlinear.md#L204-L207) | ✗ | ✗ | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L370-L373) (10) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/basics/sparsity_detection.md#L1-L3) | ✗ | [✓](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl/blob/v0.8.15/docs/src/sparse.md#L1-L3) | [✓](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/README.md#L32) | [✓](https://github.com/SciML/Optimization.jl/blob/v5.9.1/docs/src/API/reexports.md#L42) | [✓](https://github.com/JuliaRobotics/IncrementalInference.jl/blob/IncrementalInference-v0.37.2/IncrementalInference/src/parametric/services/ParametricManopt.jl#L300-L307) |
| Hand-written derivatives | [~](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/nonlinear.md#L618) (11) | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L63) | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/src/solvers/LevenbergMarquardt.jl#L229-L235) | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L370-L373) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/basics/nonlinear_functions.md#L1-L5) | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/user/gradientsandhessians.md#L2-L5) | ✗ | [~](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/docs/src/oracle.jl#L1-L7) (12) | [✓](https://github.com/SciML/SciMLBase.jl/blob/v3.58.0/src/scimlfunctions.jl#L2251-L2253) | ✗ |
| Exact second derivatives | [✓](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/nonlinear.md#L204-L207) | ✗ | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/trust_regions.md#L33) | [~](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L398-L405) (13) | ✗ | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/algo/newton.md#L14-L17) | [✓](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl/blob/v0.8.15/docs/src/backend.md#L14) | [✓](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/README.md#L31) | [✓](https://github.com/SciML/SciMLBase.jl/blob/v3.58.0/src/scimlfunctions.jl#L2252) | ✗ |
| Operator products | [✓](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/nlp.md#L574-L580) | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L37-L43) | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/trust_regions.md#L33) | ✗ | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/api/SciMLJacobianOperators.md#L7) | [~](https://github.com/JuliaNLSolvers/NLSolversBase.jl/blob/v8.0.1/src/objective_types/incomplete.jl#L27) (14) | [✓](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl/blob/v0.8.15/docs/src/backend.md#L10-L20) | [✓](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/docs/src/guide.jl#L140-L141) | [✓](https://github.com/SciML/SciMLBase.jl/blob/v3.58.0/src/scimlfunctions.jl#L2253) | ✗ |
| **Robust kernels** |  |  |  |  |  |  |  |  |  |  |
| Fixed kernels | ✗ | ✗ | [~](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/src/solvers/LevenbergMarquardt.jl#L258-L262) (15) | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L84-L94) | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ |
| Second-order correction | ✗ | ✗ | [~](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/src/commons/sub_objectives.jl#L495-L501) (15) | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L97-L106) | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ |
| Adaptive kernels | ✗ | ✗ | ✗ | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L133-L142) | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ |
| **Constraints** |  |  |  |  |  |  |  |  |  |  |
| Bounds on variables | [✓](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/variables.md#L469) | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L27) | [~](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/generalized_cauchy_direction_subsolver.md#L16) (16) | [~](https://github.com/ojwoodford/OptimizationVariableInterface.jl/blob/cd7c159c82ae64c0e0e2926583ff4e85107484ab/src/OptimizationVariableInterface.jl#L198-L203) (17) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/tutorials/bound_constraints.md#L1-L3) | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/user/minimization.md#L80) | [✓](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl/blob/v0.8.15/src/nlp.jl#L44-L49) | [✓](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/docs/src/guide.jl#L33-L35) | [✓](https://github.com/SciML/Optimization.jl/blob/v5.9.1/docs/src/getting_started.md#L166-L172) | ✗ |
| Equality constraints | [✓](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/nonlinear.md#L30-L52) | ✗ | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/augmented_Lagrangian_method.md#L1) | ✗ | ✗ | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/examples/ipnewton_basics.jl#L19) | [✓](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl/blob/v0.8.15/src/nlp.jl#L44-L49) | [✓](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/docs/src/guide.jl#L52-L63) | [✓](https://github.com/SciML/Optimization.jl/blob/v5.9.1/docs/src/tutorials/constraints.md#L86) | ✗ |
| Nonlinear inequality constraints | [✓](https://github.com/jump-dev/JuMP.jl/blob/v1.32.1/docs/src/manual/nonlinear.md#L30-L52) | ✗ | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/augmented_Lagrangian_method.md#L1) | ✗ | ✗ | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/examples/ipnewton_basics.jl#L144-L166) | [✓](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl/blob/v0.8.15/src/nlp.jl#L44-L49) | [✓](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/docs/src/guide.jl#L52-L66) | [✓](https://github.com/SciML/Optimization.jl/blob/v5.9.1/docs/src/tutorials/constraints.md#L38) | ✗ |
| **Evaluation** |  |  |  |  |  |  |  |  |  |  |
| Multithreaded evaluation | ✗ | ✗ | ✗ | [✓](https://github.com/ojwoodford/NLLSModel.jl/blob/ebf8f1d1509eed3f31ac18b7950ddbb7e419906c/src/docstrings.jl#L354-L360) | ✗ | ✗ | ✗ | [✓](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/README.md#L33) | ✗ | [~](https://github.com/JuliaRobotics/IncrementalInference.jl/blob/IncrementalInference-v0.37.2/IncrementalInference/src/services/SolverAPI.jl#L12) (18) |
| GPU evaluation | ✗ | ✗ | ✗ | ✗ | [~](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/tutorials/nonlinear_solve_gpus.md#L1-L3) (19) | ✗ | ✗ | [✓](https://github.com/madsuite-org/ExaModels.jl/blob/v0.15.0/README.md#L33) | [~](https://github.com/SciML/Optimization.jl/blob/v5.9.1/docs/src/API/ad.md#L7) (19) | ✗ |

Notes

1. JuMP has no notion of a residual; NLPModelsJuMP's `MathOptNLSModel` takes a JuMP model and a list of residual expressions.
2. Optim has a manifold option (sphere, Stiefel, and their products and powers) for its first-order methods, not for its Newton methods.
3. Through OptimizationManopt.jl.
4. Scalar variables in named containers of any shape; every variable is a real number.
5. Through product and power manifolds (Manifolds.jl).
6. By setting a variable's lower and upper bounds equal.
7. The package derives the dependence of each expression on each scalar variable; the user does not state or address blocks.
8. Only when variables are eliminated: the Hessian is then a `SchurBlockHessian` from BlockLinearSystems.jl, which stores the eliminated variables' blocks and their coupling as dense blocks. Without elimination a sparse Hessian is a `SparseMatrixCSC`.
9. Through ManifoldDiff.jl and a differentiation backend.
10. Each cost is differentiated densely in its own variables, and the graph places the blocks; nothing is detected or coloured.
11. Through user-defined operators with their derivatives.
12. Through oracle blocks (`VectorNonlinearOracle`), which carry their own derivative callbacks.
13. For a general cost (`AbstractCost`), whose Hessian is computed exactly. A residual's Hessian is the Gauss–Newton `JᵀJ`, with the robust kernel's correction.
14. NLSolversBase.jl's objective types can carry a Hessian-vector product (`only_fg_and_hvp!`), but no solver that Optim exports uses one.
15. In the optimizer, not the model: see the paragraph above the table.
16. As constraints of a constrained objective, or by choosing a manifold that is the feasible set (for a box, Manifolds.jl's `Hyperrectangle`).
17. By parameterization: variable types that cannot leave their domain (`BoundedReal`, `BoundedVector`, `ZeroToInfScalar` and `ZeroToOneScalar` from OptimizationVariableInterface.jl). There are no bound constraints or multipliers.
18. Its nonparametric tree solve runs cliques on several threads (`multithread = true`); its parametric least-squares solve does not thread.
19. The functions may operate on GPU arrays if the user's code and the differentiation backend allow it; the package has no GPU evaluation of its own.

## Optimizers

An optimizer takes a cost with its derivatives and returns a minimizer. This table is about what each can be given, which steps it takes, and how it solves the linear system inside each step.

### Key

| Column | Package | Version |
|:---|:---|:---|
| CaNNOLeS | CaNNOLeS.jl | 0.8.0 |
| Ipopt | Ipopt.jl | 1.16.0 (Ipopt 3.14.19) |
| JSO | JSOSolvers.jl, the solvers `trunk` and `tron` | 0.14.9 |
| LSOptim | LeastSquaresOptim.jl | 0.8.10 |
| MadNLP | MadNLP.jl | 0.11.0 |
| Manopt | Manopt.jl | 0.6.15 |
| NonlinSolve | NonlinearSolve.jl | 4.32.0 |
| Optim | Optim.jl | 2.3.2 |
| SOO | SecondOrderOptimization.jl, with DampedLinearSolve.jl and BlockLinearSystems.jl | 0.1.0 at `741d209` (DampedLinearSolve 0.1.0 at `2f005d4`, BlockLinearSystems 0.2.0 at `0ec268b`) |
| LsqFit† | LsqFit.jl | 0.16.1 |
| NLopt† | NLopt.jl, its gradient-based algorithms | 1.2.1 (NLopt 2.11.0) |
| Percival† | Percival.jl | 0.7.7 |

### What the rows mean

**Objective**
- *General scalar objective.* Minimizes a cost that is not a sum of squares, from its gradient and second-order information.
- *Least squares from the residual and Jacobian.* Takes a residual and its Jacobian and computes each step from the Jacobian itself (by QR, by an augmented system or by a Krylov method on `J`), so that `JᵀJ` is never formed and the conditioning is that of `J`, not its square.

**Step**
- *Newton.* Uses the exact Hessian of the cost, or products with it.
- *Gauss–Newton, undamped.* For least squares: the step from `JᵀJ` alone, with no damping.
- *Levenberg.* Damps with a multiple of the identity, `JᵀJ + λI`.
- *Marquardt.* Damps with a multiple of a diagonal scaling taken from the problem, such as `JᵀJ + λ·diag(JᵀJ)`.
- *Dogleg trust region.* Powell's dogleg between the steepest-descent and Newton or Gauss–Newton steps.
- *Other trust region.* A trust-region subproblem solved another way: truncated conjugate gradients (Steihaug–Toint), or a near-exact solution.
- *Line search.* Globalizes by searching along the step.
- *Quasi-Newton.* Builds its second-order model from gradients (BFGS, L-BFGS, SR1).
- *Interior point.* A barrier method for inequality constraints and bounds.
- *Augmented Lagrangian.* Enforces constraints through a sequence of penalized unconstrained or bound-constrained problems.
- *Geodesic acceleration.* The second-order correction to the Levenberg–Marquardt step of Transtrum and Sethna.

**Constraints enforced**
- *Bounds.* Solves with bounds on variables.
- *Equality.* Solves with equality constraints.
- *Nonlinear inequality.* Solves with nonlinear inequality constraints.

**Variables**
- *Manifold updates.* The optimizer computes a step in the tangent space and applies it through the variable's own update (a retraction), so a manifold variable stays on its manifold.
- *Variable blocks of different types and sizes.* The point being optimized can be a collection of variables of several types, not one flat vector.

**Linear solve**
- *Static systems for small problems.* For a problem of small fixed size, the linear system and its factorization live on the stack, with no heap allocation.
- *Dense factorization.* Cholesky, LDLᵀ, LU or QR of a dense matrix.
- *Sparse direct factorization.* A sparse factorization of the Hessian, the normal equations or a KKT system.
- *Sparse QR of the Jacobian.* A sparse QR factorization of `J` itself.
- *Iterative (Krylov).* Solves the step by a Krylov method (CG, MINRES, LSMR and so on).
- *Matrix-free.* Needs only products with the Jacobian or Hessian, never the matrix.
- *Elimination of a block of variables.* Eliminates a block of variables from each step and solves a reduced system in the rest: the Schur complement on the normal equations, or QR elimination on the Jacobian. This is what makes bundle adjustment tractable.
- *Choice of linear-solver backend.* The user can choose between several linear solvers for the same step.

**Other**
- *GPU.* Iterations run on a GPU.
- *Element types other than `Float64`.* Works in `Float32`, `BigFloat` or another real type.
- *Covariance of the estimate.* Returns the covariance of the solution, or its standard errors, after a least-squares fit.

### Table

| Feature | CaNNOLeS | Ipopt | JSO | LSOptim | MadNLP | Manopt | NonlinSolve | Optim | SOO | LsqFit† | NLopt† | Percival† |
|:---|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| **Objective** |  |  |  |  |  |  |  |  |  |  |  |  |
| General scalar objective | ✗ | [✓](https://github.com/coin-or/Ipopt/blob/releases/3.14.19/doc/main.dox#L34-L49) | [✓](https://github.com/JuliaSmoothOptimizers/JSOSolvers.jl/blob/v0.14.9/src/trunk.jl#L50-L52) | ✗ | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/index.md#L3-L5) | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/gradient_descent.md#L1) | ✗ | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/user/minimization.md#L1-L12) | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/objectives.jl#L2-L9) | ✗ | [✓](https://github.com/jump-dev/NLopt.jl/blob/v1.2.1/README.md#L10-L17) | [✓](https://github.com/JuliaSmoothOptimizers/Percival.jl/blob/v0.7.7/src/method.jl#L69-L71) |
| Least squares from the residual and Jacobian | [✓](https://github.com/JuliaSmoothOptimizers/CaNNOLeS.jl/blob/v0.8.0/src/CaNNOLeS.jl#L994-L996) | ✗ | [✓](https://github.com/JuliaSmoothOptimizers/JSOSolvers.jl/blob/v0.14.9/src/trunkls.jl#L53-L62) | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L35-L37) | ✗ | ✗ | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/NonlinearSolveBase-v2.55.1/lib/NonlinearSolveBase/src/descent/damped_newton.jl#L7-L12) | ✗ | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/objectives.jl#L58-L63) | ✗ | ✗ | ✗ |
| **Step** |  |  |  |  |  |  |  |  |  |  |  |  |
| Newton | [✓](https://github.com/JuliaSmoothOptimizers/CaNNOLeS.jl/blob/v0.8.0/src/CaNNOLeS.jl#L120) | [✓](https://github.com/coin-or/Ipopt/blob/releases/3.14.19/doc/options.dox#L1467-L1476) | [✓](https://github.com/JuliaSmoothOptimizers/JSOSolvers.jl/blob/v0.14.9/src/trunk.jl#L50-L52) | ✗ | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/algorithm.md#L145) | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/trust_regions.md#L1-L33) | ✗ | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/algo/newton.md#L14-L17) | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/docstrings.jl#L36) | ✗ | ✗ | [✓](https://github.com/JuliaSmoothOptimizers/Percival.jl/blob/v0.7.7/README.md#L9-L15) |
| Gauss–Newton, undamped | [✓](https://github.com/JuliaSmoothOptimizers/CaNNOLeS.jl/blob/v0.8.0/src/CaNNOLeS.jl#L120) | ✗ | ✗ | ✗ | ✗ | ✗ | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/solvers/nonlinear_least_squares_solvers.md#L26-L27) | ✗ | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/objectives.jl#L115-L116) | ✗ | ✗ | ✗ |
| Levenberg | ✗ | ✗ | ✗ | ✗ | ✗ | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/src/commons/sub_objectives.jl#L476-L487) | ✗ | ✗ | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/objectives.jl#L110-L118) | ✗ | ✗ | ✗ |
| Marquardt | ✗ | ✗ | ✗ | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/src/optimizer/levenberg_marquardt.jl#L82-L87) | ✗ | ✗ | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/NonlinearSolveFirstOrder-v2.10.0/lib/NonlinearSolveFirstOrder/src/levenberg_marquardt.jl#L24-L28) | ✗ | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/objectives.jl#L117-L118) | [✓](https://github.com/JuliaNLSolvers/LsqFit.jl/blob/v0.16.1/src/levenberg_marquardt.jl#L177-L191) | ✗ | ✗ |
| Dogleg trust region | ✗ | ✗ | ✗ | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L34) | ✗ | ✗ | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/NonlinearSolveFirstOrder-v2.10.0/lib/NonlinearSolveFirstOrder/src/trust_region.jl#L24-L29) | ✗ | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/docstrings.jl#L36) | ✗ | ✗ | ✗ |
| Other trust region | ✗ | ✗ | [✓](https://github.com/JuliaSmoothOptimizers/JSOSolvers.jl/blob/v0.14.9/src/trunk.jl#L50-L52) | ✗ | ✗ | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/trust_regions.md#L1-L20) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/NonlinearSolveFirstOrder-v2.10.0/lib/NonlinearSolveFirstOrder/src/trust_region.jl#L24-L28) | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/algo/newton_trust_region.md#L1) | ✗ | ✗ | ✗ | [✓](https://github.com/JuliaSmoothOptimizers/Percival.jl/blob/v0.7.7/README.md#L9-L15) |
| Line search | [✓](https://github.com/JuliaSmoothOptimizers/CaNNOLeS.jl/blob/v0.8.0/src/CaNNOLeS.jl#L1054) | [✓](https://github.com/coin-or/Ipopt/blob/releases/3.14.19/doc/main.dox#L53-L60) | ✗ | ✗ | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/algorithm.md#L281-L304) | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/commons/stepsizes.md#L1-L7) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/native/globalization.md#L12-L13) | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/algo/linesearch.md#L1) | ✗ | ✗ | [✓](https://github.com/stevengj/nlopt/blob/v2.11.0/doc/docs/NLopt_Algorithms.md#L354) | ✗ |
| Quasi-Newton | ✗ | [✓](https://github.com/coin-or/Ipopt/blob/releases/3.14.19/doc/options.dox#L1467-L1476) | ✗ (1) | ✗ | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/tutorials/quasi_newton.md#L1-L12) | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/quasi_Newton.md#L1) | [~](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/native/solvers.md#L54-L56) (2) | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/algo/lbfgs.md#L1) | ✗ | ✗ | [✓](https://github.com/stevengj/nlopt/blob/v2.11.0/doc/docs/NLopt_Algorithms.md#L358-L360) | [~](https://github.com/JuliaSmoothOptimizers/Percival.jl/blob/v0.7.7/src/method.jl#L170-L174) (3) |
| Interior point | ✗ | [✓](https://github.com/coin-or/Ipopt/blob/releases/3.14.19/doc/main.dox#L53-L60) | ✗ | ✗ | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/index.md#L4-L5) | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/interior_point_Newton.md#L1) | ✗ | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/algo/ipnewton.md#L1-L8) | ✗ | ✗ | ✗ | ✗ |
| Augmented Lagrangian | ✗ | ✗ | ✗ | ✗ | ✗ | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/augmented_Lagrangian_method.md#L1) | ✗ | ✗ | ✗ | ✗ | [✓](https://github.com/stevengj/nlopt/blob/v2.11.0/doc/docs/NLopt_Algorithms.md#L430) | [✓](https://github.com/JuliaSmoothOptimizers/Percival.jl/blob/v0.7.7/docs/src/index.md#L3-L14) |
| Geodesic acceleration | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/native/descent.md#L23-L26) | ✗ | ✗ | [✓](https://github.com/JuliaNLSolvers/LsqFit.jl/blob/v0.16.1/README.md#L126-L128) | ✗ | ✗ |
| **Constraints enforced** |  |  |  |  |  |  |  |  |  |  |  |  |
| Bounds | ✗ | [✓](https://github.com/coin-or/Ipopt/blob/releases/3.14.19/doc/main.dox#L34-L49) | [✓](https://github.com/JuliaSmoothOptimizers/JSOSolvers.jl/blob/v0.14.9/docs/src/solvers.md#L17-L18) | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L27) | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/algorithm.md#L12-L19) | [~](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/generalized_cauchy_direction_subsolver.md#L16) (4) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/solvers/bounded_solvers.md#L1-L9) | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/user/minimization.md#L80) | ✗ (5) | [✓](https://github.com/JuliaNLSolvers/LsqFit.jl/blob/v0.16.1/src/levenberg_marquardt.jl#L58-L59) | [✓](https://github.com/jump-dev/NLopt.jl/blob/v1.2.1/README.md#L16-L17) | [✓](https://github.com/JuliaSmoothOptimizers/Percival.jl/blob/v0.7.7/src/method.jl#L109) |
| Equality | [✓](https://github.com/JuliaSmoothOptimizers/CaNNOLeS.jl/blob/v0.8.0/docs/src/index.md#L10-L13) | [✓](https://github.com/coin-or/Ipopt/blob/releases/3.14.19/doc/main.dox#L34-L49) | ✗ | ✗ | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/algorithm.md#L12-L19) | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/augmented_Lagrangian_method.md#L1) | ✗ | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/examples/ipnewton_basics.jl#L19) | ✗ | ✗ | [✓](https://github.com/jump-dev/NLopt.jl/blob/v1.2.1/README.md#L16-L17) | [✓](https://github.com/JuliaSmoothOptimizers/Percival.jl/blob/v0.7.7/src/method.jl#L69-L71) |
| Nonlinear inequality | ✗ | [✓](https://github.com/coin-or/Ipopt/blob/releases/3.14.19/doc/main.dox#L34-L49) | ✗ | ✗ | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/algorithm.md#L12-L19) | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/augmented_Lagrangian_method.md#L1) | ✗ | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/examples/ipnewton_basics.jl#L144-L166) | ✗ | ✗ | [✓](https://github.com/jump-dev/NLopt.jl/blob/v1.2.1/README.md#L16-L17) | [✓](https://github.com/JuliaSmoothOptimizers/Percival.jl/blob/v0.7.7/src/method.jl#L13) |
| **Variables** |  |  |  |  |  |  |  |  |  |  |  |  |
| Manifold updates | ✗ | ✗ | ✗ | ✗ | ✗ | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/LevenbergMarquardt.md#L31-L37) | ✗ | [~](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/docs/src/algo/manifolds.md#L18-L19) (6) | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/objectives.jl#L68-L69) (7) | ✗ | ✗ | ✗ |
| Variable blocks of different types and sizes | ✗ | ✗ | ✗ | ✗ | ✗ | [~](https://github.com/JuliaManifolds/Manifolds.jl/blob/v0.11.38/docs/src/manifolds/product.md#L1) (8) | ✗ | ✗ | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/objectives.jl#L135-L136) | ✗ | ✗ | ✗ |
| **Linear solve** |  |  |  |  |  |  |  |  |  |  |  |  |
| Static systems for small problems | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/solvers/nonlinear_least_squares_solvers.md#L35-L36) (9) | ✗ | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/objectives.jl#L135-L140) (10) | ✗ | ✗ | ✗ |
| Dense factorization | ✗ | ✗ | ✗ | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L36) | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/index.md#L54) | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/src/solvers/LevenbergMarquardt.jl#L290-L292) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/solvers/nonlinear_least_squares_solvers.md#L38-L39) | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/src/multivariate/solvers/second_order/newton.jl#L80-L83) | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/objectives.jl#L105) | [✓](https://github.com/JuliaNLSolvers/LsqFit.jl/blob/v0.16.1/src/levenberg_marquardt.jl#L191) | [✓](https://github.com/stevengj/nlopt/blob/v2.11.0/doc/docs/NLopt_Algorithms.md#L356) | ✗ |
| Sparse direct factorization | [✓](https://github.com/JuliaSmoothOptimizers/CaNNOLeS.jl/blob/v0.8.0/docs/src/index.md#L17) | [✓](https://github.com/coin-or/Ipopt/blob/releases/3.14.19/doc/options.dox#L1123) | ✗ | ✗ | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/index.md#L52-L56) | ✗ | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/tutorials/large_systems.md#L222-L223) | [✓](problems/pose_chain.md) | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/docstrings.jl#L37) | ✗ | ✗ | ✗ |
| Sparse QR of the Jacobian | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/objectives.jl#L106) | ✗ | ✗ | ✗ |
| Iterative (Krylov) | ✗ | ✗ | [✓](https://github.com/JuliaSmoothOptimizers/JSOSolvers.jl/blob/v0.14.9/src/trunkls.jl#L3) | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L37) | ✗ | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/truncated_conjugate_gradient_descent.md#L1) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/tutorials/large_systems.md#L165) | ✗ | [~](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/docstrings.jl#L37) (11) | ✗ | ✗ | [✓](https://github.com/JuliaSmoothOptimizers/Percival.jl/blob/v0.7.7/src/method.jl#L104-L106) |
| Matrix-free | ✗ | ✗ | [✓](https://github.com/JuliaSmoothOptimizers/JSOSolvers.jl/blob/v0.14.9/docs/src/index.md#L18) | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L37-L43) | ✗ | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/docs/src/solvers/conjugate_residual.md#L1) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/api/SciMLJacobianOperators.md#L7) | ✗ | ✗ | ✗ | ✗ | [✓](https://github.com/JuliaSmoothOptimizers/Percival.jl/blob/v0.7.7/src/method.jl#L71) |
| Elimination of a block of variables | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/objectives.jl#L84-L91) (12) | ✗ | ✗ | ✗ |
| Choice of linear-solver backend | [✓](https://github.com/JuliaSmoothOptimizers/CaNNOLeS.jl/blob/v0.8.0/src/CaNNOLeS.jl#L121) | [✓](https://github.com/jump-dev/Ipopt.jl/blob/v1.16.0/README.md#L280-L305) | [✓](https://github.com/JuliaSmoothOptimizers/JSOSolvers.jl/blob/v0.14.9/src/trunkls.jl#L80-L82) | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/README.md#L35-L37) | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/index.md#L43-L56) | [✓](https://github.com/JuliaManifolds/Manopt.jl/blob/v0.6.15/src/solvers/LevenbergMarquardt.jl#L290-L292) | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/tutorials/large_systems.md#L222-L223) | ✗ | [✓](https://github.com/ojwoodford/SecondOrderOptimization.jl/blob/741d2099cc13acce08b8975c066db4e129453687/src/docstrings.jl#L37) | ✗ | ✗ | ✗ |
| **Other** |  |  |  |  |  |  |  |  |  |  |  |  |
| GPU | ✗ | ✗ | [~](https://github.com/JuliaSmoothOptimizers/JSOSolvers.jl/blob/v0.14.9/docs/src/floating-point-systems.md#L4-L13) (13) | ✗ | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/installation.md#L10-L15) | ✗ | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/tutorials/nonlinear_solve_gpus.md#L1-L3) | ✗ | ✗ | ✗ | ✗ | ✗ |
| Element types other than `Float64` | [✓](https://github.com/JuliaSmoothOptimizers/CaNNOLeS.jl/blob/v0.8.0/test/runtests.jl#L106) | ✗ | [✓](https://github.com/JuliaSmoothOptimizers/JSOSolvers.jl/blob/v0.14.9/docs/src/floating-point-systems.md#L1-L5) | [✓](https://github.com/matthieugomez/LeastSquaresOptim.jl/blob/v0.8.10/test/nonlinearsolvers.jl#L638-L639) | [✓](https://github.com/madsuite-org/MadNLP.jl/blob/v0.11.0/docs/src/tutorials/multiprecision.md#L12) | ✗ | [✓](https://github.com/SciML/NonlinearSolve.jl/blob/v4.32.0/docs/src/tutorials/nonlinear_solve_gpus.md#L66-L67) | [✓](https://github.com/JuliaNLSolvers/Optim.jl/blob/v2.3.2/test/multivariate/arbitrary_precision.jl#L10) | ✗ | [✓](https://github.com/JuliaNLSolvers/LsqFit.jl/blob/v0.16.1/test/curve_fit.jl#L21) | ✗ | ✗ |
| Covariance of the estimate | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | [✓](https://github.com/JuliaNLSolvers/LsqFit.jl/blob/v0.16.1/docs/src/getting_started.md#L49-L61) | ✗ | ✗ |

Notes

1. JSOSolvers has an `lbfgs` solver; the column describes `trunk` and `tron`, which the benchmark runs.
2. Broyden-type updates of the Jacobian, for root finding.
3. Through a quasi-Newton model wrapped around the subproblem (the `subproblem_modifier` keyword, with NLPModelsModifiers.jl).
4. On a box domain (Manifolds.jl's `Hyperrectangle`) in its quasi-Newton and Levenberg–Marquardt solvers, and as constraints in its constrained solvers (augmented Lagrangian, exact penalty, interior point).
5. Bounds are met by parameterizing the variable so that it cannot leave its domain (see note 17 of the modelling table), which needs no support from the optimizer.
6. First-order methods only.
7. The optimizer calls the `update` of each variable (OptimizationVariableInterface.jl). Any model whose variables implement it can use this; NLLSModel's do.
8. Through product and power manifolds.
9. For problems stated on static arrays, with its `Simple` solvers.
10. Needs a starting point of static size (a number, an `SVector` or a tuple of them); the objective can be hand-written. Among the modelling packages, NLLSModel supplies one when the unfixed variables are static and small, and evaluates into static storage.
11. With Krylov.jl loaded: `:cg` and `:minres` on a Hessian, `:lsmr` on a Jacobian.
12. Needs the model to say which variables are eliminated, by handing over a `SchurBlockHessian` or `SchurBlockJacobian` from BlockLinearSystems.jl. Among the modelling packages only NLLSModel builds one, from its variable-to-cost graph; a hand-written objective can.
13. Its documentation runs `trunk` on GPU arrays (an ExaModels model on CUDA); it says nothing of `tron`. It has no GPU linear solver of its own.

## Which optimizer accepts which model

The first two tables are about the packages. This one is about the benchmark: for each kind of model the benchmark builds, how it reaches each optimizer the benchmark runs. A dash is why that optimizer has no row on that model's problems.

- **native**: the optimizer's own interface takes the model as it is, or through an extension that one of the two packages ships.
- **NLPModels**: the model is, or is wrapped by its own package as, an NLPModels.jl model, and the optimizer takes NLPModels.
- **adapter**: the benchmark converts the model to what the optimizer takes; the adapter is in `src/adapters.jl`.
- **—**: not possible, or not done.

### Table

| Model | CaNNOLeS | Ipopt | JSO | LSOptim | MadNLP | Manopt | NonlinSolve | Optim | SOO |
|:---|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| `BundleAdjustmentModel` | NLPModels | adapter | NLPModels (1) | — (2) | adapter | — (3) | — (2) | — (4) | adapter |
| JuMP model (`MathOptNLSModel`) | NLPModels | NLPModels | NLPModels | — (2) | NLPModels (5) | — (3) | — (2) | adapter | adapter |
| `LeastSquaresProblem` ("Standalone") | adapter | adapter | adapter | native | adapter | — (3) | adapter | adapter | adapter |
| Manifolds.jl residual blocks | — | — | — | — | — | native (6) | — | — | — (7) |
| NLLSModel `Model`, Euclidean variables | NLPModels (8) | NLPModels | NLPModels | adapter | NLPModels | — (3) | adapter | adapter | native |
| NLLSModel `Model`, manifold variables | — | — | — | — | — | — (6) | — | — | native |

Notes

1. The benchmark defines the residual Jacobian products that BundleAdjustmentModels lacks (`jprod_residual!` and `jtprod_residual!`, in `src/adapters.jl`).
2. `optimize_least_squares` and `optimize_nonlinearsolve` take only a `LeastSquaresProblem` or an NLLSModel `Model`, and skip any other model.
3. Manopt runs only on the Robust Procrustes problem; nothing converts another kind of model for it.
4. `optimize_optim` asks an NLPModels model for its Hessian, which BundleAdjustmentModels does not define, and does not convert the model as `optimize_soo` does.
5. Wrapped in `UnconstrainedHessView` (`src/adapters.jl`), which works around NLPModelsJuMP 0.13.6's Lagrangian Hessian for an unconstrained `MathOptNLSModel`.
6. On Robust Procrustes the Manopt row runs on its native model, "Manifolds", the problem's residual blocks (`get_procrustes_manopt_components`); it does not take the NLLSModel `Model`.
7. The SecondOrderOptimization row on Robust Procrustes runs on its NLLSModel model; nothing converts Manopt's residual blocks for it.
8. Only for a model without robust kernels: CaNNOLeS is given NLLSModel's `NLLSNLSModel`, which takes linear kernels only. (JSOSolvers falls back to `NLPLSModel`, which takes any.)

The packages the benchmark does not run connect as follows. ADNLPModels produces NLPModels models, general and least-squares (`ADNLSModel`), so it reaches every optimizer that the JuMP row reaches. ExaModels produces general NLPModels models only, so it reaches all of them except CaNNOLeS, which needs a least-squares model. Optimization.jl is a front end that hands its problem to Optim, Ipopt, MadNLP, NLopt, Manopt and others through its own solver packages. RoME solves its factor graphs with its own inference, and with Manopt. LsqFit takes a model function and data; Percival takes NLPModels; NLopt takes cost and gradient functions.
