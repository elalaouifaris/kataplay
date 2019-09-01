include("bowling.jl")

using Test

function check_score(game, score)
  Bowling.score(game) == score
end

@testset "Score evaluation without optional rolls" begin
  @test check_score("11|11|11|11|11|11|11|11|11|11||", 20)
end