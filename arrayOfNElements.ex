[amount] = IO.read(:stdio, :all)
  |> String.split("\n")
  |> Enum.map(fn x -> Integer.parse(x) |> elem(0) end)

defmodule Solution do
    def array_n(n) do
        n |> replicate(1) |> IO.inspect(limit: :infinity)
    end

    def replicate(0, _), do: []
    def replicate(n, x), do: for _ <- 1..n, do: x
end

Solution.array_n(amount)
