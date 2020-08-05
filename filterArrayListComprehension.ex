input = IO.read(:stdio, :all)
  |> String.split("\n")
  |> Enum.map(fn x -> Integer.parse(x) |> elem(0) end)
  
[delimiter | elements] = input

defmodule Solution do
    def filter_array(d, elements) do
        IO.write(
            (for n <- elements, less_than?(n, d), do: n)
            |> Enum.join("\n")
        )
    end

    def less_than?(n, d), do: n < d
end

Solution.filter_array(delimiter, elements)
