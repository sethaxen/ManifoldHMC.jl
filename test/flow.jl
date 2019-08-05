#####
##### Tests for flow defaults
#####

struct CircleTest <: Manifold end

struct CircleDecoratorTest <: Manifold end

base_manifold(M::CircleDecoratorTest) = CircleTest()

@traitimpl IsDecoratorManifold{CircleDecoratorTest}

function exp!(M::CircleTest, y, x, v, t::Real)
    θ = norm(v)
    u = θ == 0 ? zero(v) : v ./ θ
    α = θ * t
    y .= cos(α) * x + sin(α) * u
    return y
end

types = [Vector{Float64},
         SizedVector{2, Float64},
         MVector{2, Float64},
         Vector{Float32},
         SizedVector{2, Float32},
         MVector{2, Float32}]

@testset "geodesic_flow default" begin
    M = CircleTest()
    x₀ = normalize(randn(2))
    v₀ = normalize((I-x₀*x₀') * randn(2))

    for T in types
        @testset "Type $T" begin
            x, v = geodesic_flow(M, convert(T, x₀), convert(T, v₀), eltype(T)(π))

            @test x ≈ -x₀
            @test v ≈ -v₀
        end
    end
end

@testset "geodesic_flow decorator default" begin
    M = CircleDecoratorTest()
    x₀ = normalize(randn(2))
    v₀ = normalize((I-x₀*x₀') * randn(2))

    for T in types
        @testset "Type $T" begin
            x, v = geodesic_flow(M, convert(T, x₀), convert(T, v₀), eltype(T)(π))

            @test x ≈ -x₀
            @test v ≈ -v₀
        end
    end
end
