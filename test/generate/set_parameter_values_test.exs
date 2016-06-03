defmodule CWMP.Protocol.Generator.SetParameterValuesTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:SetParameterValues>
\t\t\t<ParameterList SOAP-ENC:arrayType="cwmp:ParameterValueStruct[2]">
\t\t\t\t<ParameterValueStruct>
\t\t\t\t\t<Name>InternetGatewayDevice.X_5067F0_AccessServiceCfg.SshPort</Name>
\t\t\t\t\t<Value xsi:type="xsd:int">2225</Value>
\t\t\t\t</ParameterValueStruct>
\t\t\t\t<ParameterValueStruct>
\t\t\t\t\t<Name>InternetGatewayDevice.X_5067F0_AccessServiceCfg.SshStatus</Name>
\t\t\t\t\t<Value xsi:type="xsd:string">ALLOW_ALL</Value>
\t\t\t\t</ParameterValueStruct>
\t\t\t</ParameterList>
\t\t\t<ParameterKey></ParameterKey>
\t\t</cwmp:SetParameterValues>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates SetParameterValues request" do
    assert(CWMP.Protocol.Generator.generate(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.SetParameterValues{parameters: [%CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.X_5067F0_AccessServiceCfg.SshPort", type: "xsd:int", value: "2225"},%CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.X_5067F0_AccessServiceCfg.SshStatus", type: "xsd:string", value: "ALLOW_ALL"}]}) == @sample)
  end

end
