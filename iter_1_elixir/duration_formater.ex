defmodule DurationFormater do
  @duration_name %{
    now: "now",
    second: "second"
  }

  def format_duration(0), do: @duration_name.now
  def format_duration(1), do: "1 #{@duration_name.second}"
  def format_duration(seconds), do: "#{seconds} #{@duration_name.second}s"
end
