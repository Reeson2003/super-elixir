defmodule Super.Application do
  use Application

  def start(_type, args) do
    {:ok, pid} = Calculator.start_link
    Process.register(pid, :calc)
    Super.Supervisor.start_link(args)
  end
end
