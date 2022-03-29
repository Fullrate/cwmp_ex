defmodule CWMP.Protocol.Mixfile do
  use Mix.Project

  def project do
    [
      app: :cwmp_ex,
      version: "0.2.7",
      elixir: "~> 1.13",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: "A module that implements the CWMP protocol",
      package: package(),
      deps: deps()
    ]
  end

  def application do
    []
  end

  defp package do
    [
      maintainers: ["Jesper Dalberg"],
      licenses: ["Artistic"],
      links: %{"GitHub" => "https://github.com/Fullrate/cwmp_ex"}
    ]
  end

  def deps do
    [
      {:mix_test_watch, "~> 1.1.0", only: :dev},
      {:poison, "~> 5.0.0"},
      {:xml_builder, "~> 2.2.0"},
      {:erlsom, "~> 1.5.0"},
      {:ex_doc, "~> 0.28.3", only: :dev}
    ]
  end
end
