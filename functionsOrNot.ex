input_array = IO.read(:stdio, :all) |> String.split("\n")

[_ | groups] =
  input_array
  |> tl()
  |> Enum.map_join(
    ".",
    &try do
      String.to_integer(&1)
      'x'
    rescue
      ArgumentError -> &1
    end
  )
  |> String.split("x")

defmodule Solution do
  def functions_or_not(groups) do
    groups
    |> Enum.map(fn x ->
      if Solution.function?(x), do: "YES", else: "NO"
    end)
  end

  def function?(str_pairs) do
    str_pairs
    |> String.split(".")
    |> Enum.filter(&(&1 != ""))
    |> Enum.group_by(fn x ->
      [a, _] = String.split(x, " ")
      a
    end)
    |> Enum.map(fn {_, x} -> Enum.uniq(x) |> length == 1 end)
    |> Enum.uniq()
    |> (fn x -> Enum.at(x, 0) and x |> length == 1 end).()
  end
end

Solution.functions_or_not(groups)
|> Enum.each(&IO.puts/1)
