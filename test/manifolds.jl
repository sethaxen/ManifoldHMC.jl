#####
##### Tests for basic manifold functionality
#####

types = [Vector{Float64},
         SizedVector{3, Float64},
         MVector{3, Float64},
         Vector{Float32},
         SizedVector{3, Float32},
         MVector{3, Float32}]

@testset "Euclidean" begin
    M = Euclidean(3)
    base_points = [randn(3) for _=1:3]
    t = rand()

    for T in types
        @testset "Type $T" begin
            x₀ = convert(T, base_points[1])
            v₀ = convert(T, base_points[2])
            p₀ = convert(T, base_points[3])

            x, p = cogeodesic_flow(M, x₀, p₀, t)
            @test x ≈ x₀ + t * p₀
            @test p ≈ p₀

            x, v = geodesic_flow(M, x₀, v₀, t)
            @test x ≈ x₀ + t * v₀
            @test v ≈ v₀
        end
    end
end

@testset "Sphere" begin
    M = Sphere(3)

    base_points = [normalize(randn(3))]
    Π = I - base_points[1] * base_points[1]'
    push!(base_points, normalize(Π * randn(3)))
    push!(base_points, normalize(Π * randn(3)))

    for T in types
        @testset "Type $T" begin
            x₀ = convert(T, base_points[1])
            v₀ = convert(T, base_points[2])
            p₀ = convert(T, base_points[3])
            t = eltype(T)(π)

            x, p = cogeodesic_flow(M, x₀, p₀, t)
            @test x ≈ -x₀
            @test p ≈ -p₀

            x, v = geodesic_flow(M, x₀, v₀, t)
            @test x ≈ -x₀
            @test v ≈ -v₀
        end
    end
end
