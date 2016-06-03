defmodule CWMP.Protocol.Generator.GetParameterValuesResponseTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_7bfc27c1f4f0a2c1d775f8aa1840439e</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:GetParameterValuesResponse>
\t\t\t<ParameterList SOAP-ENC:arrayType="cwmp:ParameterValueStruct[1]">
\t\t\t\t<ParameterValueStruct>
\t\t\t\t\t<Name>Device.Test</Name>
\t\t\t\t\t<Value xsi:type="xsd:int">1</Value>
\t\t\t\t</ParameterValueStruct>
\t\t\t</ParameterList>
\t\t</cwmp:GetParameterValuesResponse>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates GetParameterValuesResponse request" do
    assert(CWMP.Protocol.Generator.generate(%CWMP.Protocol.Messages.Header{id: "API_7bfc27c1f4f0a2c1d775f8aa1840439e"},%CWMP.Protocol.Messages.GetParameterValuesResponse{parameters: [
      %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.Test", type: "xsd:int", value: "1"}
    ]}) == @sample)
  end

end
