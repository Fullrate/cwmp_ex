defmodule CWMP.Protocol.Mixfile do
  use Mix.Project

  def project do
    [app: :cwmp_ex,
     version: "0.1.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :tzdata, :timex, :erlsom]]
  end

  defp deps do
    [{:mix_test_watch, "~> 0.2", only: :dev},
     {:poison, "~> 2.0"},
     {:timex, "~> 2.1.5"},
     {:xml_builder, github: "joshnuss/xml_builder"},
     {:erlsom, github: "willemdj/erlsom"}]
  end
end
