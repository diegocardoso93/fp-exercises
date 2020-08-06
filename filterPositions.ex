elements = IO.read(:stdio, :all)
  |> String.split("\n")
  |> Enum.map(fn x -> Integer.parse(x) |> elem(0) end)

defmodule Solution do
    def filter_odd_ignore_first(elements) do
        elements
        |> Enum.with_index
        |> Enum.filter(fn {_x, i} -> odd_ignore_first?(i) end)
        |> Enum.flat_map(fn {x, _i} -> [x] end)
        |> Enum.join("\n")
        |> IO.write
    end

    def odd_ignore_first?(n), do: n > 0 && rem(n, 2) != 0
end

Solution.filter_odd_ignore_first(elements)

