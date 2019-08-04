defmodule Super do
  #  def ekaterinburg(list) do
  #    Enum.filter(list, fn (x) -> !String.starts_with?(x, "hram") end)
  #  end
  #
  #  def fizzbuzz(x) do
  #    n = if rem(x, 5) == 0 && rem(x, 3) == 0 do
  #      "FizzBuzz"
  #    else
  #      if rem(x, 3) == 0 do
  #        "Fizz"
  #      else
  #        if rem(x, 5) == 0 do
  #          "Buzz"
  #        else
  #          x
  #        end
  #      end
  #    end
  #    IO.inspect(n)
  #  end
  #
  #  def fizzbuzz_2(x) do
  #    n = case {rem(x, 5), rem(x, 3)} do
  #      {0, 0} -> "FizzBuzz"
  #      {_, 0} -> "Fizz"
  #      {0, _} -> "Buzz"
  #      {_, _} -> x
  #    end
  #    IO.inspect(n)
  #  end
  #
  #  def fizzbuzz_3(x) do
  #    n = cond do
  #      rem(x, 5) == 0 && rem(x, 3) == 0 -> "FizzBuzz"
  #      rem(x, 5) == 0 -> "Buzz"
  #      rem(x, 3) == 0 -> "Fizz"
  #      true -> x
  #    end
  #    IO.inspect(n)
  #  end


  #{:alica, "female"}
  def girls_to_a_boys_to_b(list) do
    Super.sort(
      list,
      %{"class_a" => [], "class_b" => []},
      fn element -> case element do
                      {_, "female"} -> "class_a"
                      {_, "male"} -> "class_b"
                    end
      end
    )
  end

  def sort(list, map, predicate) do
    if Enum.empty?(list) do
      map
    else
      Super.sort(
        List.delete(list, List.first(list)),
        Super.put(List.first(list), predicate.(List.first(list)), map),
        predicate
      )
    end
  end

  def put(element, key, map) do
    Map.put(map, key, List.wrap(Map.get(map, key)) ++ [element])
  end

end
