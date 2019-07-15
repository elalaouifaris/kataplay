defmodule DurationFormater do
  @label %{
    unit: "1",
    and:  " and ",
    separator: ", ",
    now: "now",
    second:  %{singular: "second",  plural: "seconds"},
    minute:  %{singular: "minute",  plural: "minutes"},
    hour:    %{singular: "hour",    plural: "hours"},
    day:     %{singular: "day",     plural: "days"},
    year:    %{singular: "year",    plural: "years"},
    century: %{singular: "century", plural: "centuries"}
  }

  @in_seconds [
    century: 60 * 60 * 24 * 365 * 100,
    year:    60 * 60 * 24 * 365,
    day:     60 * 60 * 24,
    hour:    60 * 60,
    minute:  60,
    second:   1
  ]

  @duration_types Keyword.keys @in_seconds

  def format_duration(seconds) do
    seconds
    |> decompose_duration(@duration_types)
    |> format_output()
  end

  defp decompose_duration(0, @duration_types), do: :now
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


  defp format_output(:now), do: @label.now
  defp format_output([{duration_type, 1}| []]) do
    "#{@label.unit} #{@label[duration_type].singular}"
  end
  defp format_output([{duration_type, count}| []]) do
    "#{count} #{@label[duration_type].plural}"
  end
  defp format_output([before_last, last | []]) do
    format_output([before_last]) <> @label.and <> format_output([last])
  end
  defp format_output([portion | rest]) do
    format_output([portion]) <> @label.separator <> format_output(rest)
  end
end
