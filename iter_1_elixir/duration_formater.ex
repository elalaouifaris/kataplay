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
    day: "day",
    year: "year"
  }

  @in_seconds %{
    second: 1,
    minute: 60,
    hour: 60 * 60,
    day: 60 * 60 * 24,
    year: 60 * 60 * 24 * 365
  }

  @duration_types [:year, :day, :hour, :minute, :second]

  def format_duration(0), do: @label.now
  def format_duration(seconds) do
    seconds
    |> decompose_duration(@duration_types)
    |> format_output()
  end

  defp decompose_duration(0, _types), do: []
  defp decompose_duration(seconds, [duration_type | rest_of_types]) do
    type_count = div(seconds, @in_seconds[duration_type]) 
    rest_count = rem(seconds, @in_seconds[duration_type])

    cond do
      type_count == 0 ->
        decompose_duration(rest_count, rest_of_types)

      type_count >= 1 ->
        [{duration_type, type_count} |
          decompose_duration(rest_count, rest_of_types)]
    end
  end


  defp format_output([{duration_type, 1}| []]), do: "#{@label.unit} #{@label[duration_type]}"
  defp format_output([{duration_type, count}| []]), do: "#{count} #{@label[duration_type]}#{@label.plural}"
  defp format_output([before_last, last | []]) do
    format_output([before_last]) <> @label.and <> format_output([last])
  end
  defp format_output([portion | rest]) do
    format_output([portion]) <> @label.separator <> format_output(rest)
  end
end
