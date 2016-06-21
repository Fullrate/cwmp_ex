defmodule CWMP.Protocol.Generator.GetRPCMethodsResponseTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:GetRPCMethodsResponse>
\t\t\t<MethodList>
\t\t\t\t<string>Foo</string>
\t\t\t\t<string>Bar</string>
\t\t\t</MethodList>
\t\t</cwmp:GetRPCMethodsResponse>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates GetRPCMethods response" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"}, %CWMP.Protocol.Messages.GetRPCMethodsResponse{methods: ["Foo","Bar"]}) == @sample)
  end

end
