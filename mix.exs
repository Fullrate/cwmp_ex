defmodule CWMP.Protocol.Mixfile do
  use Mix.Project

  def project do
    [app: :cwmp_ex,
     version: "0.2.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "A module that implements the CWMP protocol",
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: [:logger, :erlsom]]
  end

  defp package do
    [
      maintainers: ["Jesper Dalberg"],
      licenses: ["Artistic"],
      links: %{"GitHub" => "https://github.com/Fullrate/cwmp_ex"}
    ]
  end

  defp deps do
    [{:mix_test_watch, "~> 0.2", only: :dev},
     {:poison, "~> 2.0"},
     {:xml_builder, "~> 0.0.9"},
     {:erlsom, "~> 1.4.1"},
     {:ex_doc, "~> 0.15.0"},
   ]
  end
end
