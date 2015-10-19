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
    minus = try do
              :math.sqrt(multiplied - 4)
            rescue
              ArithmeticError -> false
            end
    (plus == round(plus)) || (minus == round(minus))
  end

  def get_fib_ish_sequence(num) do
    if is_fibonacci?(num) do
      build_fib_ish_string(1, num)
    else
      counterpart = find_factors(num)
      |> Enum.flat_map(fn(x) -> [x, Kernel.trunc(num/x)] end)
      # |> Enum.concat(Enum.map(fn(x) -> [x, Kernel.trunc(num/x)] end))
      |> Enum.find(num, fn(x) -> is_fibonacci?(x)end)
      if counterpart == num do
        build_fib_ish_string(counterpart, counterpart)
      else
       build_fib_ish_string(Kernel.trunc(num/counterpart), num)
      end
    end
  end

  def build_fib_ish_string(start, target, previous_list \\ [0]) do
    cond do
      hd(previous_list) == target ->
        previous_list
        |> Enum.reduce("", fn(x, acc) -> to_string(x) <> " " <> acc end)
        |> IO.puts
      hd(previous_list) == 0 ->
        build_fib_ish_string(start, target, [start|previous_list])
      true ->
        [first | rest] = previous_list
        build_fib_ish_string(start, target, [(first + hd(rest))|previous_list])
    end
  end

end

FibonacciIsh.get_fib_ish_sequence(0)
IO.puts("---------------------------")
FibonacciIsh.get_fib_ish_sequence(578)
IO.puts("---------------------------")
FibonacciIsh.get_fib_ish_sequence(123456789)
IO.puts("---------------------------")