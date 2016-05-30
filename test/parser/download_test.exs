defmodule CWMP.Protocol.Parser.DownloadTest do
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
      <cwmp:Download>
        <CommandKey>cmdkey</CommandKey>
        <FileType>1 Firmware Upgrade Image</FileType>
        <URL>http://example.com/url</URL>
        <Username>user</Username>
        <Password>pass</Password>
        <FileSize>123456</FileSize>
        <TargetFileName>image</TargetFileName>
        <DelaySeconds>5</DelaySeconds>
        <SuccessURL>http://example.com/success</SuccessURL>
        <FailureURL>http://example.com/failure</FailureURL>
      </cwmp:Download>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result %{entries: [%CWMP.Protocol.Messages.Download{
        commandkey: "cmdkey",
        filetype: "1 Firmware Upgrade Image",
        url: "http://example.com/url",
        username: "user",
        password: "pass",
        filesize: 123456,
        target_filename: "image",
        delay_seconds: 5,
        success_url: "http://example.com/success",
        failure_url: "http://example.com/failure"
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_aa0642e34b23820801e7642ad7cb536c",
      session_timeout: 30, no_more_requests: false}}

  test "parse Download request, full" do
    assert(CWMP.Protocol.Parser.parse(@sample)==@sample_result)
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
      <cwmp:Download>
        <CommandKey>cmdkey</CommandKey>
        <FileType>1 Firmware Upgrade Image</FileType>
        <URL>http://example.com/url</URL>
        <Username>user</Username>
        <Password>pass</Password>
        <FileSize>foo</FileSize>
        <TargetFileName>image</TargetFileName>
        <DelaySeconds>5</DelaySeconds>
        <SuccessURL>http://example.com/success</SuccessURL>
        <FailureURL>http://example.com/failure</FailureURL>
      </cwmp:Download>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  test "raise Download request, invalid FileSize" do
    assert(catch_error(CWMP.Protocol.Parser.parse(@sample2))==%RuntimeError{message: "Integer value does not parse"})
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
      <cwmp:Download>
        <CommandKey>cmdkey</CommandKey>
        <FileType>1 Firmware Upgrade Image</FileType>
        <URL>http://example.com/url</URL>
        <FileSize>123456</FileSize>
      </cwmp:Download>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample3_result %{entries: [%CWMP.Protocol.Messages.Download{
        commandkey: "cmdkey",
        filetype: "1 Firmware Upgrade Image",
        url: "http://example.com/url",
        filesize: 123456,
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_aa0642e34b23820801e7642ad7cb536c",
      session_timeout: 30, no_more_requests: false}}

  test "parse Download request, small" do
    assert(CWMP.Protocol.Parser.parse(@sample3)==@sample3_result)
  end
end
