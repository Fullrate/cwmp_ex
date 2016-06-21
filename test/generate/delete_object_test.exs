defmodule CWMP.Protocol.Generator.DeleteObjectTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:DeleteObject>
\t\t\t<ObjectName>Device.Test.</ObjectName>
\t\t\t<ParameterKey>ParamKey</ParameterKey>
\t\t</cwmp:DeleteObject>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates DeleteObject request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.DeleteObject{object_name: "Device.Test.", parameter_key: "ParamKey"}) == @sample)
  end

  @sample2 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:DeleteObject>
\t\t\t<ObjectName>Device.Test.</ObjectName>
\t\t</cwmp:DeleteObject>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates 2nd DeleteObject request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.DeleteObject{object_name: "Device.Test."}) == @sample2)
  end

  test "raise on 3nd DeleteObject request" do
    assert(catch_error(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.DeleteObject{object_name: "Device.Test"}))==%RuntimeError{message: "invalid object_name [Device.Test] - must end in ."})
  end

end
