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
    minute: 60
  }

  def format_duration(0), do: @label.now
  def format_duration(seconds) do
    decompose_duration(seconds)
    |> format_output()
  end

  defp decompose_duration(seconds) do
    minute_part = div(seconds, @in_seconds.minute) 
    second_part = rem(seconds, @in_seconds.minute)

    cond do
      seconds == 0 ->
        []

      seconds == 1 ->
        [{@label.unit, @label.second}]

      seconds == @in_seconds.minute ->
        [{@label.unit, @label.minute} | decompose_duration(second_part)]

      seconds > @in_seconds.minute ->
        [{minute_part, @label.minute, @label.plural} | decompose_duration(second_part)]

      true ->
        [{seconds, @label.second, @label.plural}]
    end
  end

  defp format_output([before_last, last | []]) do
    format_output([before_last]) <> @label.and <> format_output([last])
  end
  defp format_output([{count, label}| []]), do: "#{count} #{label}"
  defp format_output([{count, label, plural}| []]), do: "#{count} #{label}#{plural}"
end
