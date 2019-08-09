defmodule Gift do

  def say(message) do
    IO.puts("[#{inspect self}] Мне подарили: #{message}")
  end

  def sort(list) do
    odd = Enum.filter(list, fn n -> rem(n, 2) == 0 end)
    IO.inspect Enum.sort(odd)
  end

end
