defmodule CWMP.Protocol.Generator.GetParameterAttributesResponseTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_7bfc27c1f4f0a2c1d775f8aa1840439e</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:GetParameterAttributesResponse>
\t\t\t<ParameterList SOAP-ENC:arrayType="cwmp:ParameterAttributeStruct[1]">
\t\t\t\t<ParameterAttributeStruct>
\t\t\t\t\t<Name>Device.Test</Name>
\t\t\t\t\t<Notification>1</Notification>
\t\t\t\t\t<AccessList>
\t\t\t\t\t\t<string>Subscriber</string>
\t\t\t\t\t</AccessList>
\t\t\t\t</ParameterAttributeStruct>
\t\t\t</ParameterList>
\t\t</cwmp:GetParameterAttributesResponse>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates GetParameterAttributesResponse request" do
    assert(CWMP.Protocol.Generator.generate(%CWMP.Protocol.Messages.Header{id: "API_7bfc27c1f4f0a2c1d775f8aa1840439e"},%CWMP.Protocol.Messages.GetParameterAttributesResponse{parameters: [
      %CWMP.Protocol.Messages.ParameterAttributeStruct{name: "Device.Test", notification: 1, accesslist: ["Subscriber"]}
    ]}) == @sample)
  end

end
