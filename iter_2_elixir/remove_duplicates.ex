defmodule RemoveDuplicates do
  def run(input) ,do: deduplicate(input, [])

  defp deduplicate([], seen_elements), do: Enum.reverse seen_elements
  defp deduplicate([elem | rest], seen_elements) do
    if elem in seen_elements do
      deduplicate(rest, seen_elements)
    else  
      deduplicate(rest, [elem | seen_elements])
    end
  end
end
