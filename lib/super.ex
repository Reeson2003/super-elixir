defmodule Super do
  def ekaterinburg(list) do
    Enum.filter(list, fn (x) -> !String.starts_with?(x, "hram") end)
  end

  def fizzbuzz(x) do
    n = if rem(x, 5) == 0 && rem(x, 3) == 0 do
      "FizzBuzz"
    else
      if rem(x, 3) == 0 do
        "Fizz"
      else
        if rem(x, 5) == 0 do
          "Buzz"
        else
          x
        end
      end
    end
    IO.inspect(n)
  end

  def fizzbuzz_2(x) do
    n = case {rem(x, 5), rem(x, 3)} do
      {0, 0} -> "FizzBuzz"
      {_, 0} -> "Fizz"
      {0, _} -> "Buzz"
      {_, _} -> x
    end
    IO.inspect(n)
  end

  def fizzbuzz_3(x) do
    n = cond do
      rem(x, 5) == 0 && rem(x, 3) == 0 -> "FizzBuzz"
      rem(x, 5) == 0 -> "Buzz"
      rem(x, 3) == 0 -> "Fizz"
      true -> x
    end
    IO.inspect(n)
  end

  def ends_with_a_to_a(list) do
    sort(
      list,
      %{"class_a" => [], "class_b" => []},
      fn pupil ->
        {name, _} = pupil
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
      fn pupil -> case pupil do
                    {_, "female"} -> "class_a"
                    {_, "male"} -> "class_b"
                  end
      end
    )
  end

  def girls_love_maths(list) do
    map = girls_to_a_boys_to_b(list)
    girls = Map.get(map, "class_a")
    List.foldl(
      girls,
      %{},
      fn girl, map ->
        {name, _} = girl
        name = Atom.to_string(name)
        if Map.size(map) > 0 && rem(Map.size(map), 2) == 0 do
          Map.put(map, name, "algebra")
        else
          Map.put(map, name, "geometry")
        end
      end
    )
  end

  defp sort(list, map, sorting_fn) do
    if Enum.empty?(list) do
      map
    else
      next = List.first(list)
      sort(
        List.delete(list, next),
        put(map, sorting_fn.(next), next),
        sorting_fn
      )
    end
  end

  defp put(map, key, value) do
    list = Map.get(map, key)
    Map.put(map, key, List.wrap(list) ++ [value])
  end

end
