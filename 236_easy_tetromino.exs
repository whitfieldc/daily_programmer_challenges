pieces = ["O", "I", "S", "Z", "L", "J", "T"]

defmodule PrintFiftyTetris do

  def print_random_order(letters, n) when n <= 7 do
    letters
    |> Enum.shuffle
    |> Enum.slice(0..n-1)
    |> Enum.reduce(fn(first, second) -> first <> second end)
    |> IO.puts
  end

  def print_random_order(letters, n) do
    letters
    |> Enum.shuffle
    |> Enum.reduce(fn(first, second) -> first <> second end)
    |> IO.puts
    print_random_order(letters, n-7)
  end

end

PrintFiftyTetris.print_random_order(pieces, 50)