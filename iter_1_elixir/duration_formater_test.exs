Code.load_file("duration_formater.ex", __DIR__)
ExUnit.start()

defmodule DurationFormaterTest do
  use ExUnit.Case
  import DurationFormater, only: [format_duration: 1]

  test "format durations below 60 seconds" do
    assert format_duration(0) == "now" 
    assert format_duration(1) == "1 second"
    assert format_duration(3) == "3 seconds"
  end

  test "format duration below 60 minutes" do
    assert format_duration(60) == "1 minute"
    assert format_duration(120) == "2 minutes"
    assert format_duration(121) == "2 minutes and 1 second"
  end

  test "format duration below 24 hours" do
    assert format_duration(60 * 60) == "1 hour"
    assert format_duration(60 * 60 + 60 + 1) == "1 hour, 1 minute and 1 second"
  end

  test "format duration below 365 days" do
    assert format_duration(60 * 60 * 24 * 2 + 60 * 60 * 3 + 3) == "2 days, 3 hours and 3 seconds"
  end

  test "format duration beyond a year" do
    assert format_duration(60 * 60 * 24 * 365 * 3 + 60 * 3 + 5) == "3 years, 3 minutes and 5 seconds"
  end
end
