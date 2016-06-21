defmodule CWMP.Protocol.Generator.GetParameterNamesResponseTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_7bfc27c1f4f0a2c1d775f8aa1840439e</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:GetParameterNamesResponse>
\t\t\t<ParameterList SOAP-ENC:arrayType="cwmp:ParameterInfoStruct[1]">
\t\t\t\t<ParameterInfoStruct>
\t\t\t\t\t<Name>Device.Test</Name>
\t\t\t\t\t<Writable>1</Writable>
\t\t\t\t</ParameterInfoStruct>
\t\t\t</ParameterList>
\t\t</cwmp:GetParameterNamesResponse>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates GetParameterNamesResponse request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_7bfc27c1f4f0a2c1d775f8aa1840439e"},%CWMP.Protocol.Messages.GetParameterNamesResponse{parameters: [
      %CWMP.Protocol.Messages.ParameterInfoStruct{name: "Device.Test", writable: 1}
    ]}) == @sample)
  end

  @sample2 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_7bfc27c1f4f0a2c1d775f8aa1840439e</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:GetParameterNamesResponse>
\t\t\t<ParameterList SOAP-ENC:arrayType="cwmp:ParameterInfoStruct[2]">
\t\t\t\t<ParameterInfoStruct>
\t\t\t\t\t<Name>Device.Test</Name>
\t\t\t\t\t<Writable>1</Writable>
\t\t\t\t</ParameterInfoStruct>
\t\t\t\t<ParameterInfoStruct>
\t\t\t\t\t<Name>Device.More.Test</Name>
\t\t\t\t\t<Writable>0</Writable>
\t\t\t\t</ParameterInfoStruct>
\t\t\t</ParameterList>
\t\t</cwmp:GetParameterNamesResponse>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates 2nd GetParameterNamesResponse request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_7bfc27c1f4f0a2c1d775f8aa1840439e"},%CWMP.Protocol.Messages.GetParameterNamesResponse{parameters: [
      %CWMP.Protocol.Messages.ParameterInfoStruct{name: "Device.Test", writable: 1},
      %CWMP.Protocol.Messages.ParameterInfoStruct{name: "Device.More.Test", writable: 0}
    ]}) == @sample2)
  end

  test "generates raise on GetParameterNamesResponse request" do
    assert(catch_error(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_7bfc27c1f4f0a2c1d775f8aa1840439e"}, %CWMP.Protocol.Messages.GetParameterNamesResponse{parameters: [%CWMP.Protocol.Messages.ParameterInfoStruct{name: "Device.Test", writable: "foo"}]})) == %RuntimeError{message: "Not a boolean value"})
  end

end
