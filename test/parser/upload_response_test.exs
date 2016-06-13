defmodule CWMP.Protocol.Parser.UploadResponseTest do
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
      <cwmp:UploadResponse>
        <Status>1</Status>
        <StartTime>2015-01-19T23:08:24</StartTime>
        <CompleteTime>2015-01-19T23:09:24</CompleteTime>
      </cwmp:UploadResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result {:ok,%{entries: [%CWMP.Protocol.Messages.UploadResponse{
        status: 1,
        complete_time: %Timex.DateTime{calendar: :gregorian,
          day: 19, hour: 23, minute: 9, month: 1, millisecond: 0, second: 24,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015},
        start_time: %Timex.DateTime{calendar: :gregorian,
          day: 19, hour: 23, minute: 8, month: 1, millisecond: 0, second: 24,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015},
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_aa0642e34b23820801e7642ad7cb536c",
      session_timeout: 30, no_more_requests: false}}}

  test "parses DownloadResponse request" do
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
    assert(catch_error(CWMP.Protocol.Parser.parse(@sample2))==%RuntimeError{message: "Integer does not validate"})
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

  @sample_result3 {:ok,%{entries: [%CWMP.Protocol.Messages.UploadResponse{
        status: 1,
        complete_time: %Timex.DateTime{calendar: :gregorian,
          day: 19, hour: 23, minute: 9, month: 1, millisecond: 0, second: 24,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015},
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
    assert(catch_error(CWMP.Protocol.Parser.parse(@sample4))==%RuntimeError{message: "timestring 'foo' has unacceptable format"})
  end

end
