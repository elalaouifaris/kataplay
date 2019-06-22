Code.load_file("template.exs", __DIR__)

ExUnit.start()
ExUnit.configure(trace: true, exclude: :pending)

defmodule ListReplicationTest do
  use ExUnit.Case

  test "replicate 1 number once" do
    assert Solution.replicate_list([2], 1) == [2]
  end

  test "replicate 1 number multiple times" do
    assert Solution.replicate_list([2], 3) == [2, 2, 2]
  end

  test "replicate multiple number multiple times" do
    assert Solution.replicate_list([2, 5], 3) == [2, 2, 2, 5, 5, 5]
  end
end