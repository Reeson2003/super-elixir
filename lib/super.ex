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

  def ends_with_a(list) do
    sort(
      list,
      %{"class_a" => [], "class_b" => []},
      fn element ->
        {name, _} = element
        name = Atom.to_string(name)
        if String.ends_with?(name, "a") do
          "class_a"
        else
          "class_b"
        end
      end
    )
  end

  def girls_to_a_boys_to_b(list) do
    sort(
      list,
      %{"class_a" => [], "class_b" => []},
      fn element -> case element do
                      {_, "female"} -> "class_a"
                      {_, "male"} -> "class_b"
                    end
      end
    )
  end

  defp sort(list, map, sorting_fn) do
    if Enum.empty?(list) do
      map
    else
      sort(
        List.delete(list, List.first(list)),
        put(map, sorting_fn.(List.first(list)), List.first(list)),
        sorting_fn
      )
    end
  end

  defp put(map, key, value) do
    Map.put(map, key, List.wrap(Map.get(map, key)) ++ [value])
  end

end
