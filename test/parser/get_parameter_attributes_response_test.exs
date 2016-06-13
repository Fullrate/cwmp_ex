defmodule CWMP.Protocol.Parser.GetParameterAttributesResponseTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
    <SOAP-ENV:Header>
      <cwmp:ID SOAP-ENV:mustUnderstand="1">API_953323a9b674bb42b7cad250b2cf0607</cwmp:ID>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
      <cwmp:GetParameterAttributesResponse>
        <ParameterList SOAP-ENC:arrayType="cwmp:ParameterAttributeStruct[0002]">
          <ParameterAttributeStruct>
            <Name>InternetGatewayDevice.DeviceInfo.HardwareVersion</Name>
            <Notification>0</Notification>
            <AccessList SOAP-ENC:arrayType="xsd:string[1]">
              <string>Subscriber</string>
            </AccessList>
          </ParameterAttributeStruct>
          <ParameterAttributeStruct>
            <Name>InternetGatewayDevice.DeviceInfo.SoftwareVersion</Name>
            <Notification>2</Notification>
            <AccessList SOAP-ENC:arrayType="xsd:string[1]">
              <string>Subscriber</string>
            </AccessList>
          </ParameterAttributeStruct>
        </ParameterList>
      </cwmp:GetParameterAttributesResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""

  @sample_result {:ok,%{entries: [%CWMP.Protocol.Messages.GetParameterAttributesResponse{
        parameters: [%CWMP.Protocol.Messages.ParameterAttributeStruct{name: "InternetGatewayDevice.DeviceInfo.HardwareVersion",
            notification: 0,
            accesslist: ["Subscriber"]},
                    %CWMP.Protocol.Messages.ParameterAttributeStruct{name: "InternetGatewayDevice.DeviceInfo.SoftwareVersion",
            notification: 2,
            accesslist: ["Subscriber"]}]}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_953323a9b674bb42b7cad250b2cf0607",
      session_timeout: 30, no_more_requests: false}}}

  test "parses GetParameterAttributesResponse request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end
