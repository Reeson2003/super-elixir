defmodule Timer do
  def start_link do
    Task.start_link(fn -> loop([]) end)
  end

  def loop(subscribers) do
    receive do
      {:subscribe, {pid, time}} -> loop(subscribers ++ {pid, time})
      #      {:unsubscribe, pid} -> loop(subscribers -- {pid, _})
    end
    notify subscribers
  end

  def notify(subscribers) do
    now = :os.system_time(:millisecond)
    Enum.each(subscribers, fn subscriber -> IO.inspect subscriber end)
    loop subscribers
  end
end
