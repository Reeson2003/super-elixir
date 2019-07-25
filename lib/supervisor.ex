defmodule Super.Supervisor do
  use Supervisor
  require Logger

  def start_link(args) do
    Supervisor.start_link(__MODULE__, [args], name: __MODULE__)
  end

  def init(_args) do
    Supervisor.init(children(), strategy: :rest_for_one)
  end

  def children() do
    [
      Plug.Adapters.Cowboy.child_spec(
        scheme: :http,
        plug: Super.Router,
        options: [
          port: 4433
        ]
      )
    ]
  end
end
