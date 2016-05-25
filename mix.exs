defmodule CWMP.Protocol.Mixfile do
  use Mix.Project

  def project do
    [app: :cwmp_ex,
     version: "0.0.6",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :tzdata, :timex, :erlsom]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:mix_test_watch, "~> 0.2", only: :dev},
     {:poison, "~> 2.0"},
     {:timex, "~> 1.0"},
     {:xml_builder, github: "joshnuss/xml_builder"},
     {:erlsom, github: "willemdj/erlsom"}]
  end
end
