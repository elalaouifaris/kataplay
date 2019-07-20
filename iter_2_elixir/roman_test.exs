Code.load_file("roman.ex", __DIR__)

ExUnit.start()
ExUnit.configure(exclude: :pending, true: true)

defmodule RomanTest do
  use ExUnit.Case

  def arabic >>> roman do
    assert Roman.numerals(arabic) == roman
  end

  test "units counting with I" do
    1 >>> "I"
    3 >>> "III"
  end

  test "fives counting with V" do
    5 >>> "V"
    7 >>> "VII"
  end

  test "four is expressed as IV" do
    4 >>> "IV"
  end

  test "tens counting with X" do
    10 >>> "X"
    20 >>> "XX"
  end

  test "nine is expressed as IX" do
    9 >>> "IX"
  end
end
