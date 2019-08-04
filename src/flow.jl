#####
##### Methods for (co)geodesic flow
#####
##### These are temporary, until Manifolds.jl provides the same functionality
#####

export geodesic_flow, geodesic_flow!, cogeodesic_flow, cogeodesic_flow!

@doc doc"""
      geodesic_flow(M, x₀, v₀, t)

Follow the geodesic with initial point $x_0 \in M$ and velocity
$v_0 \in T_{x_0} M$ for time $t$, dragging $v_0$ along.
"""
function geodesic_flow(M, x₀, v₀, t)
      x = similar_result(M, geodesic_flow, x₀, t)
      v = similar_result(M, geodesic_flow, v₀, t)
      geodesic_flow!(M, x, v, x₀, v₀, t)
      return (x, v)
end

@doc doc"""
      geodesic_flow!(M, x, v, x₀, v₀, t)

Follow the geodesic with initial point $x_0 \in M$ and velocity
$v_0 \in T_{x_0} M$ for time $t$, dragging $v_0$ along. The resulting
point and tangent vector are stored in $x$ and $v$, respectively.
"""
function geodesic_flow! end

@traitfn function geodesic_flow!(M::MT,
                                 x,
                                 v,
                                 x₀,
                                 v₀,
                                 t) where {MT;!IsDecoratorManifold{MT}}
      error("geodesic_flow! not implemented for Manifold $(typeof(M)), input ",
            "point $(typeof(x₀)), input vector $(typeof(v₀)), time $t,
            output point $(typeof(x)), and output vector $(typeof(v))")
end

@traitfn function geodesic_flow!(M::MT,
                                 x,
                                 v,
                                 x₀,
                                 v₀,
                                 t) where {MT;IsDecoratorManifold{MT}}
      return geodesic_flow!(base_manifold(M), x, v, x₀, v₀, t)
end

@doc doc"""
      cogeodesic_flow(M, x₀, p₀, t)

Follow the geodesic with initial point $x_0 \in M$ and momentum
$p_0 \in T_{x_0}^* M$ for time $t$, dragging $p_0$ along.
"""
function cogeodesic_flow(M, x₀, p₀)
      x = similar_result(M, cogeodesic_flow, x₀)
      p = similar_result(M, cogeodesic_flow, p₀)
      cogeodesic_flow!(M, x, p, x₀, p₀)
      return (x, p)
end

@doc doc"""
      cogeodesic_flow!(M, x, p, x₀, p₀, t)

Follow the geodesic with initial point $x_0 \in M$ and momentum
$p_0 \in T_{x_0}^* M$ for time $t$, dragging $p_0$ along. The resulting
point and cotangent vector are stored in $x$ and $p$, respectively.
"""
function cogeodesic_flow! end

@traitfn function cogeodesic_flow!(M::MT,
                                   x,
                                   p,
                                   x₀,
                                   p₀,
                                   t) where {MT;!IsDecoratorManifold{MT}}
      error("cogeodesic_flow! not implemented for Manifold $(typeof(M)), ",
            "input point $(typeof(x₀)), input vector $(typeof(p₀)), time $t,",
            " output point $(typeof(x)), and output vector $(typeof(p))")
end

@traitfn function cogeodesic_flow!(M::MT,
                                   x,
                                   p,
                                   x₀,
                                   p₀,
                                   t) where {MT;IsDecoratorManifold{MT}}
      return cogeodesic_flow!(base_manifold(M), x, p, x₀, p₀, t)
end
