defmodule CWMP.Protocol.Generator do
  def inform_response(header, resp) do
    envelope(header,CWMP.Protocol.Generator.Messages.InformResponse.generate(resp))
  end

  @moduledoc """

  Wraps the SOAP Envelope around the meat of the request

  """
  defp envelope(head,body) do
    header=CWMP.Protocol.Generator.Messages.Header.generate(head)
    ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
  <SOAP-ENV:Header>
    #{header}
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    #{body}
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
|
  end
end
