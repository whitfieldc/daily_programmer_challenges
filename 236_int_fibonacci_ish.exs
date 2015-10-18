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
    (root..2)
  end

  def find_factors(num) do
    num
    |>get_range_from_one_to_sqrt
    |> Stream.filter(fn(x) -> rem(num, x) == 0 end)
    |> Enum.to_list
  end

  def is_fibonacci?(candidate) do
    multiplied = 5*candidate*candidate
    plus = :math.sqrt(multiplied + 4)
    minus = :math.sqrt(multiplied - 4)
    (plus == round(plus)) || (minus == round(minus))
  end

  def determine_fib_factor_and_counterpart(num) do
    if is_fibonacci?(num) do
      [1, num]
    else
      counterpart = find_factors(num)
      |> Enum.map(fn(x) -> Kernel.trunc(num/x) end)
      |> Enum.find(num, fn(x) -> is_fibonacci?(x)end)
      if counterpart == num do
        counterpart
      else
        [Kernel.trunc(num/counterpart), counterpart]
      end
    end
  end

  # def print_fib_ish_string(num) do

  # end

end

# FibonacciIsh.get_range_from_one_to_sqrt(9)
FibonacciIsh.determine_fib_factor_and_counterpart(21)
FibonacciIsh.determine_fib_factor_and_counterpart(84)