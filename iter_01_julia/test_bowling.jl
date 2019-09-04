include("bowling.jl")

using Test

function check_score(game, score)
  Bowling.score(game) == score
end

@testset "Score evaluation without optional rolls" begin
  @test Bowling.score("11|11|11|11|11|11|11|11|11|11||") == 20
  @test Bowling.score("-1|11|11|11|11|11|11|11|11|11||") == 19
end

@testset "Score evaluation spare rolls" begin
  @test Bowling.score("1/|11|11|11|11|11|11|11|11|11||") == 29
  @test Bowling.score("1/|2/|11|11|11|11|11|11|11|11||") == 39
end

@testset "Score evaluation strike rolls" begin
  @test_skip Bowling.score("X|11|11|11|11|11|11|11|11|11||") == 30
end
