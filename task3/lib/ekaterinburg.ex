defmodule Ekaterinburg do

  def start_server do
    state = %{
      :accept => [],
      :reject => []
    }
    loop(state)
  end

  def loop(state) do
    loop(
      receive do
        {:add, data} -> handle_message(data, state)
        {:read} -> handle_message(state)
      end
    )
  end

  def handle_message(name, state) do
    accept = Map.get(state, :accept)
    reject = Map.get(state, :reject)
    if String.contains?(name, "hram") do
      IO.puts("Добавить нельзя  #{name}")
      Map.put(state, :reject, List.wrap(reject) ++ [name])
    else
      IO.puts("Добавлено успешно  #{name}")
      Map.put(state, :accept, List.wrap(accept) ++ [name])
    end
  end

  def handle_message(state) do
    accept = Map.get(state, :accept)
    reject = Map.get(state, :reject)
    IO.puts("В Екатеринбурге сейчас есть #{Enum.join(accept, ", ")} Пытались добавить #{Enum.join(reject, ", ")} ")
    state
  end

end
