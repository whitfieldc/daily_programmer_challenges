pieces = ["O", "I", "S", "Z", "L", "J", "T"]

defmodule PrintFiftyTetris do

  def print_random_order(previous, letters, n) when n <= 7 do
    letters
    |> Enum.shuffle
    |> Enum.slice(0..n-1)
    |> Enum.reduce(fn(first, second) -> first <> second end)
    |> _concat_two_strings(previous)##concat current with previous
    |> IO.puts
  end

  def print_random_order(previous, letters, n) do
    letters
    |> Enum.shuffle
    |> Enum.reduce(fn(first, second) -> first <> second end)
    |> _concat_two_strings(previous)
    |> print_random_order(letters, n-7)
  end

  defp _concat_two_strings(first, second)do
    first <> second
  end

end

PrintFiftyTetris.print_random_order("", pieces, 50)