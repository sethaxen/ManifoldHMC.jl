module ManifoldHMC

using Documenter
using SimpleTraits
using Markdown: @doc_str
using Manifolds: Manifold, IsDecoratorManifold, base_manifold, similar_result

include("flow.jl")

end # module
