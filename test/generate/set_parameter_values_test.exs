defmodule CWMP.Protocol.Generator.SetParameterValuesTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:SetParameterValues>
      <ParameterList SOAP-ENC:arrayType="cwmp:ParameterValueStruct[2]">
        <ParameterValueStruct>
          <Name>InternetGatewayDevice.X_5067F0_AccessServiceCfg.SshPort</Name>
          <Value xsi:type="xsd:int">2225</Value>
        </ParameterValueStruct>
        <ParameterValueStruct>
          <Name>InternetGatewayDevice.X_5067F0_AccessServiceCfg.SshStatus</Name>
          <Value xsi:type="xsd:string">ALLOW_ALL</Value>
        </ParameterValueStruct>
      </ParameterList>
      <ParameterKey></ParameterKey>
    </cwmp:SetParameterValues>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates SetParameterValues request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.SetParameterValues{parameters: [%CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.X_5067F0_AccessServiceCfg.SshPort", type: "xsd:int", value: "2225"},%CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.X_5067F0_AccessServiceCfg.SshStatus", type: "xsd:string", value: "ALLOW_ALL"}]}) == @sample)
  end

end
