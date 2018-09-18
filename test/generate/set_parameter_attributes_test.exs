defmodule CWMP.Protocol.Generator.SetParameterAttributesTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_7bfc27c1f4f0a2c1d775f8aa1840439e</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:SetParameterAttributes>
      <ParameterList SOAP-ENC:arrayType="cwmp:SetParameterAttributesStruct[1]">
        <SetParameterAttributesStruct>
          <Name>Device.Test</Name>
          <NotificationChange>0</NotificationChange>
          <Notification>2</Notification>
          <AccessListChange>1</AccessListChange>
          <AccessList>
            <string>Subscriber</string>
          </AccessList>
        </SetParameterAttributesStruct>
      </ParameterList>
    </cwmp:SetParameterAttributes>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates SetParameterAttributes request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_7bfc27c1f4f0a2c1d775f8aa1840439e"},%CWMP.Protocol.Messages.SetParameterAttributes{parameters: [
        %CWMP.Protocol.Messages.SetParameterAttributesStruct{
          name: "Device.Test",
          notification_change: false,
          notification: 2,
          accesslist_change: true,
          accesslist: ["Subscriber"]
        }
      ]}) == @sample)
  end

end
