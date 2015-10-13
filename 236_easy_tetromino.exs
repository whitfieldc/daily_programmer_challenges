pieces = ["O", "I", "S", "Z", "L", "J", "T"]

times = [:a, :b, :c, :d, :e, :f, :g]

times
  |> Enum.map(fn(spot) ->
    pieces
    |> Enum.shuffle
    |> Enum.reduce(fn(first, second) -> first <> second end)
  end)
  |> Enum.reduce(fn(first, second) -> first <> second end)
  |> IO.puts