defmodule CWMP.Protocol.Generator.InformResponseTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">1</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:InformResponse>
\t\t\t<MaxEnvelopes>1</MaxEnvelopes>
\t\t</cwmp:InformResponse>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates inform response" do
    assert(CWMP.Protocol.generate!(%CWMP.Protocol.Messages.Header{id: "1"},%CWMP.Protocol.Messages.InformResponse{max_envelopes: "1"}) == @sample)
  end

end
