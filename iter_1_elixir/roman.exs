defmodule Roman do
  @codec %{
    1000 => "M",
    500  => "D",
    100  => "C",
    50   => "L",
    10   => "X",
    5    => "V",
    1    => "I",
    }

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(n) when n >= 1000,   do: @codec[1000] <> numerals(n - 1000)
  def numerals(n) when n >= 900,    do: @codec[100]  <> @codec[1000] <> numerals(n - 900)
  def numerals(n) when n >= 500,    do: @codec[500]  <> numerals(n - 500)
  def numerals(n) when n >= 400,    do: @codec[100]  <> @codec[500]  <> numerals(n - 400)
  def numerals(n) when n >= 100,    do: @codec[100]  <> numerals(n - 100)
  def numerals(n) when n >= 90,     do: @codec[10]   <> @codec[100]  <> numerals(n - 90)
  def numerals(n) when n >= 50,     do: @codec[50]   <> numerals(n - 50)
  def numerals(n) when n >= 40,     do: @codec[10]   <> @codec[50]   <> numerals(n - 40)
  def numerals(n) when n >= 10,     do: @codec[10]   <> numerals(n - 10)
  def numerals(n) when n in [9, 4], do: @codec[1]    <> @codec[n + 1] 
  def numerals(n) when n >= 5,      do: @codec[5]    <> numerals(n - 5)
  def numerals(n) when n >= 1,      do: @codec[1]    <> numerals(n - 1)
  def numerals(0),                  do: ""
end
