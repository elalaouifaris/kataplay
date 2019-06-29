Code.load_file("remove_duplicates.ex", __DIR__)

ExUnit.start()

defmodule RmoveDuplicatesTest do
  use ExUnit.Case

  defp input >>> expected, do: RemoveDuplicates.run(input) == expected

  test "remove duplicates from a list with no duplications returns list unchanged" do
    assert [] >>> []
    assert [1] >>> [1]
    assert [1, 2, 3] >>> [1, 2, 3]
  end

  test "remove duplicates from a list with duplicates returns non duplicated list in the order of first appearance" do
    input = [3, 1, 1, 2, 1, 2, 5]
    expected = [3, 1, 2, 5]
    assert RemoveDuplicates.run(input) == expected
  end
end
