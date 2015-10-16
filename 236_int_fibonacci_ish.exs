#find factors of num
  #searching from 1 to sqrt(num)

#if (num/factor) is fibonacci, solution is fib(factor)
#else, solution is fib(num)
  #(5*factor^2 + 4) or (5*factor^2 -4) are perfect squares

#print fib(x) up to num

defmodule FibonacciIsh do
  def get_range_from_one_to_sqrt(num) do
    root = num
    |>:math.sqrt
    |>Float.ceil
    |>Kernel.trunc
    (1..root)
  end

  def find_factors(num) do
    range = get_range_from_one_to_sqrt(num)
    |> Stream.filter(fn(x) -> rem(num, x) == 0 end)
    |> Enum.to_list
  end

end

# FibonacciIsh.get_range_from_one_to_sqrt(9)
FibonacciIsh.find_factors(12)