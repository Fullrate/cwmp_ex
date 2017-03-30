defmodule CWMP.Protocol.Mixfile do
  use Mix.Project

  def project do
    [app: :cwmp_ex,
     version: "0.2.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :erlsom]]
  end

  defp deps do
    [{:mix_test_watch, "~> 0.2", only: :dev},
     {:poison, "~> 2.0"},
     {:xml_builder, github: "joshnuss/xml_builder"},
     {:erlsom, github: "willemdj/erlsom"}]
  end
end
