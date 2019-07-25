defmodule Super.Application do
  use Application

  def start(_type, args) do
    Super.Supervisor.start_link(args)
  end
end
