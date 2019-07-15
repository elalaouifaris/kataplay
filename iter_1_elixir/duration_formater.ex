defmodule DurationFormater do
  @label %{
    unit: "1",
    plural: "s",
    and:  " and ",
    now: "now",
    second: "second",
    minute: "minute"
  }

  @in_seconds %{
    minute: 60,
    second: 1
  }

  @duration_types [:minute, :second]

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
end
