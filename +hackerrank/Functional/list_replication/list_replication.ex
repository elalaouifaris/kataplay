defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
    def main() do
        replication_count = IO.gets("") |> process_from_stdin
        read_numbers([])
        |> process_numbers(replication_count) 
    end

    defp read_numbers([:eof | rest]), do: rest
    defp read_numbers(numbers) do
        new_number = IO.gets("") |> process_from_stdin
        read_numbers([new_number | numbers])
    end
    
    defp process_numbers([], _count), do: []
    defp process_numbers([n | rest], count) do
        process_numbers(rest, count)
        print_number(n, count)
    end

    defp print_number(_, 0), do: []
    defp print_number(n, count) do
        print_number(n, count - 1)
        IO.puts(n)
    end

    defp process_from_stdin(:eof), do: :eof
    defp process_from_stdin(input) do
        input
        |> String.trim
        |> String.to_integer
    end
end

Solution.main()