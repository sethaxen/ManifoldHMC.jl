module ManifoldHMC

using Documenter
using SimpleTraits
using LinearAlgebra
using Markdown: @doc_str
using Manifolds:
    Manifold,
    IsDecoratorManifold,
    Euclidean,
    Sphere,
    ProductManifold,
    base_manifold,
    similar_result,
    project_point!,
    project_tangent!,
    exp!
using ForwardDiff
using DiffResults

include("flow.jl")

include("manifolds.jl")

end # module
