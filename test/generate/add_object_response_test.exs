defmodule CWMP.Protocol.Generator.AddObjectResponseTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:AddObjectResponse>
\t\t\t<InstanceNumber>1</InstanceNumber>
\t\t\t<Status>0</Status>
\t\t</cwmp:AddObjectResponse>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates AddObjectResponse request" do
    assert(CWMP.Protocol.Generator.generate(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.AddObjectResponse{instance_number: "1", status: "0"}) == @sample)
  end

  @sample2 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:AddObjectResponse>
\t\t\t<InstanceNumber>100</InstanceNumber>
\t\t\t<Status>1</Status>
\t\t</cwmp:AddObjectResponse>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates 2nd AddObjectResponse request" do
    assert(CWMP.Protocol.Generator.generate(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.AddObjectResponse{instance_number: 100, status: 1}) == @sample2)
  end
  test "raise on AddObjectResponse request" do
    assert(catch_error(CWMP.Protocol.Generator.generate(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.AddObjectResponse{instance_number: "foo", status: "1"}))==%RuntimeError{message: "Integer value does not parse"})
  end

  test "raise on 2nd AddObjectResponse request" do
    assert(catch_error(CWMP.Protocol.Generator.generate(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.AddObjectResponse{instance_number: "0", status: "1"}))==%RuntimeError{message: "Integer does not validate"})
  end

  test "raise on 3rd AddObjectResponse request" do
    assert(catch_error(CWMP.Protocol.Generator.generate(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.AddObjectResponse{instance_number: "2", status: "2"}))==%RuntimeError{message: "Integer does not validate"})
  end
end
