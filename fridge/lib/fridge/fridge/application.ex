defmodule Fridge.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Fridge, name: Fridge}
    ]

    opts = [strategy: :one_for_one, name: Fridge.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
