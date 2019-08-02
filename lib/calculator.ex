defmodule Calculator do
  def start_link do
    Task.start_link(fn -> loop({0, 0}) end)
  end

  defp loop({initial, total}) do
    receive do
      {:get, caller} ->
        send caller, total
        loop({initial, total})
      {:add} ->
        loop({initial, total + 1})
      {:reset} ->
        loop({initial, initial})
    end
  end
end
