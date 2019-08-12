defmodule Ekaterinburg do

  def start_server do
    state = %{
      :accept => [],
      :reject => []
    }
    loop(state)
  end

  def loop(state) do
    state = receive do
      add = {:add, _} -> handle_message(add, state)
      read = {:read} -> handle_message(read, state)
    end
    loop(state)
  end

  def handle_message({:add, name}, %{:accept => accept, :reject => reject} = state) do
    if String.contains?(name, "hram") do
      IO.puts("Добавить нельзя  #{name}")
      Map.put(state, :reject, List.wrap(reject) ++ [name])
    else
      IO.puts("Добавлено успешно  #{name}")
      Map.put(state, :accept, List.wrap(accept) ++ [name])
    end
  end

  def handle_message({:read}, %{:accept => accept, :reject => reject} = state) do
    IO.puts("В Екатеринбурге сейчас есть #{Enum.join(accept, ", ")} Пытались добавить #{Enum.join(reject, ", ")} ")
    state
  end

end
