#####
##### Add missing manifolds and methods for common manifolds
#####
##### These are temporary, until Manifolds.jl provides the same functionality
#####

#####
##### Euclidean space with default Euclidean metric
#####

function geodesic_flow!(M::Euclidean, x, v, x₀, v₀, t)
      @. x = x₀ + t * v₀
      copyto!(v, v₀)
      return (x, v)
end

function geodesic_flow(M::Euclidean, x₀, v₀, t)
      return (x₀ .+ t .* v₀, v₀)
end

cogeodesic_flow!(M::Euclidean, args...) = geodesic_flow!(M, args...)

cogeodesic_flow(M::Euclidean, args...) = geodesic_flow(M, args...)

#####
##### Sphere with default ambient Euclidean metric
#####

function geodesic_flow!(M::Sphere, x, v, x₀, v₀, t)
      α = norm(M, x₀, v₀)
      αt = α * t

      sinαt, cosαt = sincos(αt)
      sincαtoα = α == 0 ? one(α) : sinαt / α

      @. x = cosαt * x₀ + sincαtoα * v₀
      @. v = cosαt * v₀ - (α * sinαt) * x₀

      project_point!(M, x)
      project_tangent!(M, v, x, v)

      return (x, v)
end

cogeodesic_flow!(M::Sphere, args...) = geodesic_flow!(M, args...)
