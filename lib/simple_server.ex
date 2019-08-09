defmodule SimpleServer do

  def start_server do
    state = []
    loop(state)
  end

  def loop(state) do
    state = receive do
      example = {:name, _} -> handle_message(example, state)
      example = {:get_people, str} -> handle_message(example, state)
    end
    loop(state)
  end

  def handle_message({:name, name}, state) do
    List.wrap(state) ++ [name]
  end

  def handle_message({:get_people, str}, state) do
    IO.puts("#{str} #{Enum.join(state, ", ")}")
    state
  end
end
