defmodule CWMP.Protocol.Generator.AddObjectTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:AddObject>
\t\t\t<ObjectName>Device.Test.</ObjectName>
\t\t\t<ParameterKey>ParamKey</ParameterKey>
\t\t</cwmp:AddObject>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates AddObject request" do
    assert(CWMP.Protocol.Generator.add_object(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.AddObjectRequest{objectname: "Device.Test.", parameterkey: "ParamKey"}) == @sample)
  end

  @sample2 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:AddObject>
\t\t\t<ObjectName>Device.Test.</ObjectName>
\t\t</cwmp:AddObject>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates 2nd AddObject request" do
    assert(CWMP.Protocol.Generator.add_object(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.AddObjectRequest{objectname: "Device.Test."}) == @sample2)
  end

  test "raise on 3nd AddObject request" do
    assert(catch_error(CWMP.Protocol.Generator.add_object(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.AddObjectRequest{objectname: "Device.Test"}))==%RuntimeError{message: "invalid objectname [Device.Test] - must end in ."})
  end

end
