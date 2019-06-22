defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
    def main() do
        replication_count = IO.gets("") |> process_from_stdin
        numbers = read_numbers([])

        output = replicate_list(numbers, replication_count)

        print_output(output)
    end

    # Algorithm Section
    def replicate_list([], _count), do: []
    def replicate_list([n | rest], count) do
        List.duplicate(n, count) ++ replicate_list(rest, count)
    end

    # IO Processing Helperes:
    defp read_numbers([:eof | rest]), do: Enum.reverse(rest)
    defp read_numbers(numbers) do
        new_number = IO.gets("") |> process_from_stdin
        read_numbers([new_number | numbers])
    end

    defp print_output([]), do: []
    defp print_output([n | rest]) do
        IO.puts(n)
        print_output(rest)
    end

    defp process_from_stdin(:eof), do: :eof
    defp process_from_stdin(input) do
        input
        |> String.trim
        |> String.to_integer
    end
end

# Solution.main()