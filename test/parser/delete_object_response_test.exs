defmodule CWMP.Protocol.Parser.DeleteObjectResponseTest do
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
      <cwmp:DeleteObjectResponse>
        <Status>0</Status>
      </cwmp:DeleteObjectResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result {:ok,%{entries: [%CWMP.Protocol.Messages.DeleteObjectResponse{
        status: 0
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_aa0642e34b23820801e7642ad7cb536c",
      session_timeout: 30, no_more_requests: false}}}

  test "parses DeleteObjectResponse request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

  @sample2 """
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
      <cwmp:DeleteObjectResponse>
        <Status>1</Status>
      </cwmp:DeleteObjectResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample2_result {:ok,%{entries: [%CWMP.Protocol.Messages.DeleteObjectResponse{
        status: 1
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_aa0642e34b23820801e7642ad7cb536c",
      session_timeout: 30, no_more_requests: false}}}

  test "parses 2nd DeleteObjectResponse request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

  @sample3 """
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
      <cwmp:DeleteObjectResponse>
        <Status>2</Status>
      </cwmp:DeleteObjectResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  test "raise RuntimeError on DeleteObjectResponse request parse" do
    assert(catch_error(CWMP.Protocol.Parser.parse(@sample3)) == %RuntimeError{message: "Integer does not validate"})
  end

end
