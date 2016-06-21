defmodule CWMP.Protocol.Parser.UploadTest do
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
      <cwmp:Upload>
        <CommandKey>cmdkey</CommandKey>
        <FileType>1 Firmware Upgrade Image</FileType>
        <URL>http://example.com/url</URL>
        <Username>user</Username>
        <Password>pass</Password>
        <DelaySeconds>5</DelaySeconds>
      </cwmp:Upload>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result {:ok,%{cwmp_version: "1-0", entries: [%CWMP.Protocol.Messages.Upload{
        commandkey: "cmdkey",
        filetype: "1 Firmware Upgrade Image",
        url: "http://example.com/url",
        username: "user",
        password: "pass",
        delay_seconds: 5
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_aa0642e34b23820801e7642ad7cb536c",
      session_timeout: 30, no_more_requests: false}}}

  test "parse Upload request, full" do
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
      <cwmp:Upload>
        <CommandKey>cmdkey</CommandKey>
        <FileType>1 Firmware Upgrade Image</FileType>
        <URL>http://example.com/url</URL>
      </cwmp:Upload>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample2_result {:ok,%{cwmp_version: "1-0", entries: [%CWMP.Protocol.Messages.Upload{
        commandkey: "cmdkey",
        filetype: "1 Firmware Upgrade Image",
        url: "http://example.com/url"
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_aa0642e34b23820801e7642ad7cb536c",
      session_timeout: 30, no_more_requests: false}}}

  test "parse Upload request, small" do
    assert(CWMP.Protocol.Parser.parse(@sample2)==@sample2_result)
  end
end
