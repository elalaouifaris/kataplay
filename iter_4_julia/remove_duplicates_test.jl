using Test
include("remove_duplicates.jl")

@testset "Do nothing to lists with no duplication" begin
  @test Duplicates.remove([]) == []
  @test Duplicates.remove([1, "a", 4]) == [1, "a", 4]
end

@testset "Retain first occurence of an element only" begin
  @test Duplicates.remove([1, 1, 1]) == [1]
end
