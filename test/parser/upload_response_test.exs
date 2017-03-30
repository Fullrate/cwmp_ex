defmodule CWMP.Protocol.Parser.UploadResponseTest do
  use ExUnit.Case, async: true
  import TestHelpers

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
      <cwmp:UploadResponse>
        <Status>1</Status>
        <StartTime>2015-01-19T23:08:24</StartTime>
        <CompleteTime>2015-01-19T23:09:24</CompleteTime>
      </cwmp:UploadResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result {:ok,%{cwmp_version: "1-0", entries: [%CWMP.Protocol.Messages.UploadResponse{
        status: 1,
        complete_time: generate_datetime({{19,1,2015},{23,9,24}}),
        start_time: generate_datetime({{19,1,2015},{23,8,24}})
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_aa0642e34b23820801e7642ad7cb536c",
      session_timeout: 30, no_more_requests: false}}}

  test "parses UploadResponse" do
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
      <cwmp:UploadResponse>
        <Status>2</Status>
        <StartTime>2015-01-19T23:08:24</StartTime>
        <CompleteTime>2015-01-19T23:09:24</CompleteTime>
      </cwmp:UploadResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  test "raise, invalid status" do
    assert(catch_error(CWMP.Protocol.Parser.parse!(@sample2))==%RuntimeError{message: "Integer does not validate"})
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
      <cwmp:UploadResponse>
        <Status>1</Status>
        <CompleteTime>2015-01-19T23:09:24</CompleteTime>
      </cwmp:UploadResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result3 {:ok,%{cwmp_version: "1-0", entries: [%CWMP.Protocol.Messages.UploadResponse{
        status: 1,
        complete_time: generate_datetime({{19,1,2015},{23,9,24}}),
        start_time: nil
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_aa0642e34b23820801e7642ad7cb536c",
      session_timeout: 30, no_more_requests: false}}}

  test "parses UploadResponse request, missing StartTime" do
    assert(CWMP.Protocol.Parser.parse(@sample3) == @sample_result3)
  end

  @sample4 """
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
      <cwmp:UploadResponse>
        <Status>1</Status>
        <StartTime>foo</StartTime>
        <CompleteTime>2015-01-19T23:09:24</CompleteTime>
      </cwmp:UploadResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  test "parses UploadResponse request, invalid StartTime" do
    assert(catch_error(CWMP.Protocol.Parser.parse!(@sample4))==%RuntimeError{message: "timestring 'foo' is unparseable: :invalid_format"})
  end

end
