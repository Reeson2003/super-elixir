defmodule Super.MixProject do
  use Mix.Project

  def project do
    [
      app: :super,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [mod: {Super.Application, []}, extra_applications: [:cowboy, :plug]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:plug_cowboy, "~> 1.0"},
      {:plug, "~> 1.5"}
    ]
  end
end
