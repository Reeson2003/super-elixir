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
    sort(list, fn {key, _} -> String.ends_with?(Atom.to_string(key), "a") end)
  end

  def girls_to_a_boys_to_b(list) do
    sort(list, fn {_, value} -> value == "female" end)
  end

  defp sort(list, sort_fn) do
    class_a = Enum.filter(list, sort_fn)
    class_b = Enum.reject(list, sort_fn)
    %{"class_a" => class_a, "class_b" => class_b}
  end

  def girls_love_maths(list) do
    map = girls_to_a_boys_to_b(list)
    girls = Map.get(map, "class_a")
    List.foldl(
      girls,
      %{},
      fn {name, _}, map ->
        name = Atom.to_string(name)
        if rem(Map.size(map) + 1, 3) == 0 do
          Map.put(map, name, "algebra")
        else
          Map.put(map, name, "geometry")
        end
      end
    )
  end

end
