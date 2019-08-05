using ManifoldHMC

using SimpleTraits
using Random
using LinearAlgebra
using Manifolds: Manifold, Euclidean, Sphere, IsDecoratorManifold
using Manifolds: Manifold, IsDecoratorManifold
import Manifolds: base_manifold, exp!
using StaticArrays
using ForwardDiff
using Test

include("flow.jl")
include("manifolds.jl")

using Test
