defmodule CWMP.Protocol.Generator do
  import XmlBuilder

  @moduledoc """
  Generation of CWMP XML messages, from Elixir data structures.
  """

  @doc """
  Generates a CWMP envelope from an Elixir data structure.
  """
  def generate!(head, req, version \\ "1-4") do
    element('SOAP-ENV:Envelope',
      %{
        'xmlns:SOAP-ENV': "http://schemas.xmlsoap.org/soap/envelope/",
        'xmlns:SOAP-ENC': "http://schemas.xmlsoap.org/soap/encoding/",
        'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
        'xmlns:xsd': "http://www.w3.org/2001/XMLSchema",
        'xmlns:cwmp': "urn:dslforum-org:cwmp-#{version}"
      },
      [ element('SOAP-ENV:Header', [CWMP.Protocol.Generate.generate(head)]), element('SOAP-ENV:Body', [CWMP.Protocol.Generate.generate(req)]) ] ) |> generate;
  end

  @doc """
  Non-throwing version of generate!.
  """
  def generate(head, req, version \\ "1-4") do
    try do
      {:ok, generate!(head, req, version)}
    rescue
      err -> {:error, err}
    end
  end
end
