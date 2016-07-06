defmodule CWMP.Protocol.Generator.FaultTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<SOAP-ENV:Fault>
\t\t\t<faultcode>Server</faultcode>
\t\t\t<faultstring>CWMP fault</faultstring>
\t\t\t<detail>
\t\t\t\t<cwmp:Fault>
\t\t\t\t\t<FaultCode>8000</FaultCode>
\t\t\t\t\t<FaultString>Method not supported</FaultString>
\t\t\t\t</cwmp:Fault>
\t\t\t</detail>
\t\t</SOAP-ENV:Fault>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates Fault response" do
    assert(CWMP.Protocol.Generator.generate!(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.Fault{faultcode: "Server", faultstring: "CWMP fault", detail:
        %CWMP.Protocol.Messages.FaultStruct{code: "8000", string: "Method not supported"}}) == @sample)
  end

end
