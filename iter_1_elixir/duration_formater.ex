defmodule DurationFormater do
  @label %{
    unit: "1",
    plural: "s",
    and:  " and ",
    separator: ", ",
    now: "now",
    second: "second",
    minute: "minute",
    hour: "hour",
    day: "day"
  }

  @in_seconds %{
    second: 1,
    minute: 60,
    hour: 60 * 60,
    day: 60 * 60 * 24
  }

  @duration_types [:day, :hour, :minute, :second]

  def format_duration(0), do: @label.now
  def format_duration(seconds) do
    decompose_duration(seconds, @duration_types)
    |> format_output()
  end

  defp decompose_duration(0, _types), do: []
  defp decompose_duration(seconds, [duration_type | rest_of_types]) do
    main_part = div(seconds, @in_seconds[duration_type]) 
    rest_part = rem(seconds, @in_seconds[duration_type])

    cond do
      main_part == 0 ->
        decompose_duration(rest_part, rest_of_types)

      main_part == 1 ->
        [{@label.unit, @label[duration_type]} |
          decompose_duration(rest_part, rest_of_types)]

      main_part > 1 ->
        [{main_part, @label[duration_type], @label.plural} |
          decompose_duration(rest_part, rest_of_types)]
    end
  end


  defp format_output([before_last, last | []]) do
    format_output([before_last]) <> @label.and <> format_output([last])
  end
  defp format_output([{count, label}| []]), do: "#{count} #{label}"
  defp format_output([{count, label, plural}| []]), do: "#{count} #{label}#{plural}"
  defp format_output([portion | rest]) do
    format_output([portion]) <> @label.separator <> format_output(rest)
  end
end
