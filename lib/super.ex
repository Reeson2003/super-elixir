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
    ends_with_a = Enum.filter(
      list,
      fn pupil ->
        ends_with_a?(pupil)
      end
    )
    not_ends_with_a = Enum.filter(
      list,
      fn pupil ->
        !ends_with_a?(pupil)
      end
    )
    %{"class_a" => ends_with_a, "class_b" => not_ends_with_a}
  end

  def girls_to_a_boys_to_b(list) do
    girls = Enum.filter(
      list,
      fn pupil ->
        female?(pupil)
      end
    )
    boys = Enum.filter(
      list,
      fn pupil ->
        !female?(pupil)
      end
    )
    %{"class_a" => girls, "class_b" => boys}
  end

  def girls_love_maths(list) do
    map = girls_to_a_boys_to_b(list)
    girls = Map.get(map, "class_a")
    List.foldl(
      girls,
      %{},
      fn girl, map ->
        name = name_as_string(girl)
        if rem(Map.size(map) + 1, 3) == 0 do
          Map.put(map, name, "algebra")
        else
          Map.put(map, name, "geometry")
        end
      end
    )
  end

  defp ends_with_a?(pupil) do
    name = name_as_string(pupil)
    String.ends_with?(name, "a")
  end

  defp name_as_string(pupil) do
    {name, _} = pupil
    Atom.to_string(name)
  end

  defp female?(pupil) do
    case pupil do
      {_, "female"} -> true
      {_, _} -> false
    end
  end

end
