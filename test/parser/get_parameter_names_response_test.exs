defmodule CWMP.Protocol.Parser.GetParameterNamesResponseTest do
  use ExUnit.Case, async: true

  @sample """
  <SOAP-ENV:Envelope
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
    <SOAP-ENV:Header>
      <cwmp:ID SOAP-ENV:mustUnderstand="1">API_28edd28d788a784422413db3914c34b0</cwmp:ID>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
      <cwmp:GetParameterNamesResponse>
        <ParameterList SOAP-ENC:arrayType="cwmp:ParameterInfoStruct[0002]">
          <ParameterInfoStruct>
            <Name>InternetGatewayDevice.DeviceInfo.</Name>
            <Writable>0</Writable>
          </ParameterInfoStruct>
          <ParameterInfoStruct>
            <Name>InternetGatewayDevice.DeviceInfo.Manufacturer</Name>
            <Writable>1</Writable>
          </ParameterInfoStruct>
        </ParameterList>
      </cwmp:GetParameterNamesResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result %{entries: [%CWMP.Protocol.Messages.GetParameterNamesResponse{
        parameters: [%CWMP.Protocol.Messages.ParameterInfoStruct{name: "InternetGatewayDevice.DeviceInfo.",
            writable: false},
          %CWMP.Protocol.Messages.ParameterInfoStruct{name: "InternetGatewayDevice.DeviceInfo.Manufacturer",
            writable: true}]}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_28edd28d788a784422413db3914c34b0",
      session_timeout: 30, no_more_requests: false}}

  test "parses GetParameterNamesResponse request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end
