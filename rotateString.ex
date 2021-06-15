[_t_head | s_tail] = IO.read(:stdio, :all) |> String.split("\n")

defmodule Solution do
  def rotate_strings(list) do
    list
    |> Enum.map(&Solution.rotate_string/1)
  end

  def rotate_string(str) do
    list = String.to_charlist(str)

    list
    |> Enum.with_index()
    |> Enum.map(fn {_, i} ->
      "#{Enum.slice(list, (i + 1)..Enum.count(list))}" <> "#{Enum.slice(list, 0..i)}"
    end)
    |> Enum.join(" ")
  end
end

Solution.rotate_strings(s_tail)
|> Enum.each(fn x -> IO.puts(x) end)
