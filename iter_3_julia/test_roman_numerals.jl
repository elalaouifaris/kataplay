include("roman_numerals.jl")
using Test

function check_roman(number::Roman, printed::String)
  sprint(show, number) == printed
end

@testset "Roman numerals basic cases" begin
  @test check_roman(Roman(0), "")
  @test check_roman(Roman(1), "I")
  @test check_roman(Roman(4), "IV")
  @test check_roman(Roman(5), "V")
  @test check_roman(Roman(10), "X")
  @test check_roman(Roman(40), "XL")
  @test check_roman(Roman(50), "L")
  @test check_roman(Roman(90), "XC")
  @test check_roman(Roman(100), "C")
  @test check_roman(Roman(400), "CD")
  @test check_roman(Roman(500), "D")
  @test check_roman(Roman(900), "CM")
  @test check_roman(Roman(1000), "M")
  @test check_roman(Roman(5000), "Too Large for The Romans!")
end

@testset "Roman numerals composed numbers" begin
  @test check_roman(Roman(12), "XII")
  @test check_roman(Roman(120), "CXX")
  @test check_roman(Roman(3120), "MMMCXX")
end

@testset "Roman Numerals operations" begin
  @test check_roman(Roman(12) + Roman(4), "XVI")
  @test check_roman(Roman(12) +       4 , "XVI")
  @test check_roman(      12  + Roman(4), "XVI")

  @test check_roman(Roman(12) * Roman(4), "XLVIII")
end