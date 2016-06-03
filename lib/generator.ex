defmodule CWMP.Protocol.Generator do
  import XmlBuilder

  @moduledoc """

  Generates XML messages from elixir structures

  """

  def generate(header, req, version \\ "1-4") do
    envelope(header,CWMP.Protocol.Generate.generate(req),version)
  end

  defp envelope(head,body,version \\ "1-4") do
    header=CWMP.Protocol.Generate.generate(head)
    element('SOAP-ENV:Envelope',
      %{
        'xmlns:SOAP-ENV': "http://schemas.xmlsoap.org/soap/envelope/",
        'xmlns:SOAP-ENC': "http://schemas.xmlsoap.org/soap/encoding/",
        'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
        'xmlns:xsd': "http://www.w3.org/2001/XMLSchema",
        'xmlns:cwmp': "urn:dslforum-org:cwmp-#{version}"
      },
      [ element('SOAP-ENV:Header', [header]), element('SOAP-ENV:Body', [body]) ] ) |> generate;
  end
end
