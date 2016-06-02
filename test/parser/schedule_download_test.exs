defmodule CWMP.Protocol.Parser.ScheduleDownloadTest do
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
      <cwmp:ScheduleDownload>
        <CommandKey>cmdkey</CommandKey>
        <FileType>1 Firmware Upgrade Image</FileType>
        <URL>http://example.com/url</URL>
        <Username>user</Username>
        <Password>pass</Password>
        <FileSize>123456</FileSize>
        <TargetFileName>image</TargetFileName>
        <TimeWindowList SOAP-ENC:arrayType="cwmp:TimeWindowStruct[1]">
          <TimeWindowStruct>
            <WindowStart>5</WindowStart>
            <WindowEnd>45</WindowEnd>
            <WindowMode>1 At Any Time</WindowMode>
            <UserMessage>A message</UserMessage>
            <MaxRetries>-1</MaxRetries>
          </TimeWindowStruct>
        </TimeWindowList>
      </cwmp:ScheduleDownload>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result %{entries: [%CWMP.Protocol.Messages.ScheduleDownload{
        commandkey: "cmdkey",
        filetype: "1 Firmware Upgrade Image",
        url: "http://example.com/url",
        username: "user",
        password: "pass",
        filesize: 123456,
        target_filename: "image",
        timewindowlist: [
          %CWMP.Protocol.Messages.TimeWindowStruct{
            window_start: 5,
            window_end: 45,
            window_mode: "1 At Any Time",
            user_message: "A message",
            max_retries: -1
          }
        ]
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_aa0642e34b23820801e7642ad7cb536c",
      session_timeout: 30, no_more_requests: false}}

  test "parse ScheduleDownload request, full" do
    assert(CWMP.Protocol.Parser.parse(@sample)==@sample_result)
  end

end
