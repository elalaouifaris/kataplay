defmodule Roman do
  def numerals(number) do
    String.duplicate("I", number)
    |> String.replace("IIIII", "V")
    |> String.replace("IIII", "IV")
    |> String.replace("VV", "X")
    |> String.replace("VIV", "IX")
  end
end
