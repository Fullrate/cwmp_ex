defmodule CWMP.Protocol.Parser.SetParameterAttributesTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
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
</SOAP-ENV:Envelope>
"""

  @sample_result {:ok,%{cwmp_version: "urn:dslforum-org:cwmp-1-0", entries: [%CWMP.Protocol.Messages.SetParameterAttributes{
        parameters: [ %CWMP.Protocol.Messages.SetParameterAttributesStruct{
            accesslist: ["Subscriber"],
            accesslist_change: true,
            name: "Device.Test",
            notification: 2,
            notification_change: false}]}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_7bfc27c1f4f0a2c1d775f8aa1840439e",
      session_timeout: 30, no_more_requests: false}}}

  test "parses SetParameterAttributes request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end
