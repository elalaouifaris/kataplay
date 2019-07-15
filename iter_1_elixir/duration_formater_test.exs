Code.load_file("duration_formater.ex", __DIR__)
ExUnit.start()

defmodule DurationFormaterTest do
  use ExUnit.Case
  import DurationFormater, only: [format_duration: 1]

  test "format durations below 6 seconds" do
    assert format_duration(0) == "now" 
    assert format_duration(1) == "1 second"
    assert format_duration(3) == "3 seconds"
  end

end
