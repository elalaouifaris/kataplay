import Base: +, *

codex = [
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  5 => "V",
  4 => "IV",
  1 => "I"
]
struct Roman
  n::Int
end

function roman_representation(number, codex_index=1)
  number == 0 && return ""
  number ≥ 5000 && return "Too Large for The Romans!"

  range_min, representation = codex[codex_index]
  if number ≥ range_min
    remaining = number - range_min
    string(representation, roman_representation(remaining, codex_index))
  else
    roman_representation(number, codex_index + 1)
  end
end

Base.show(io::IO, r::Roman) = print(io, roman_representation(r.n))

+(a::Roman, b::Roman) = Roman(a.n + b.n)
+(a::Integer, b::Roman) = Roman(a + b.n)
+(a::Roman, b::Integer) = Roman(a.n + b)

*(a::Roman, b::Roman) = Roman(a.n * b.n)