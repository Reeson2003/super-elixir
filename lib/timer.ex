defmodule Timer do

  def delay(pid, millis) do
    Task.start(fn -> loop(pid, :os.system_time(:millisecond) + millis) end)
  end

  defp loop(pid, timeout) do
    if :os.system_time(:millisecond) > timeout do
      notify(pid)
    else
      loop(pid, timeout)
    end
  end

  defp notify(pid) do
    send(pid, :timeout)
  end

end
