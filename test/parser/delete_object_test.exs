defmodule CWMP.Protocol.Parser.DeleteObjectTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
    <SOAP-ENV:Header>
      <cwmp:ID SOAP-ENV:mustUnderstand="1">API_aa0642e34b23820801e7642ad7cb536c</cwmp:ID>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
      <cwmp:DeleteObject>
        <ObjectName>Device.Test.</ObjectName>
        <ParameterKey>ParamKey</ParameterKey>
      </cwmp:DeleteObject>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result {:ok,%{cwmp_version: "urn:dslforum-org:cwmp-1-0", entries: [%CWMP.Protocol.Messages.DeleteObject{
        object_name: "Device.Test.",
        parameter_key: "ParamKey"
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_aa0642e34b23820801e7642ad7cb536c",
      session_timeout: 30, no_more_requests: false}}}

  test "parses DeleteObject request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end
