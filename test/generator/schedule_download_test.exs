defmodule CWMP.Protocol.Generator.ScheduleDownloadTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:ScheduleDownload>
\t\t\t<CommandKey>CommandKey</CommandKey>
\t\t\t<FileType>1 Firmware Upgrade Image</FileType>
\t\t\t<URL>http://example.com</URL>
\t\t\t<Username>user</Username>
\t\t\t<Password>pass</Password>
\t\t\t<FileSize>100</FileSize>
\t\t\t<TargetFileName>foo</TargetFileName>
\t\t\t<TimeWindowList SOAP-ENC:arrayType="cwmp:TimeWindowStruct[1]">
\t\t\t\t<TimeWindowStruct>
\t\t\t\t\t<WindowStart>5</WindowStart>
\t\t\t\t\t<WindowEnd>45</WindowEnd>
\t\t\t\t\t<WindowMode>1 At Any Time</WindowMode>
\t\t\t\t\t<UserMessage>A message</UserMessage>
\t\t\t\t\t<MaxRetries>-1</MaxRetries>
\t\t\t\t</TimeWindowStruct>
\t\t\t</TimeWindowList>
\t\t</cwmp:ScheduleDownload>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates full ScheduleDownload request" do
    assert(CWMP.Protocol.Generator.schedule_download(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.ScheduleDownload{
        commandkey: "CommandKey",
        filetype: "1 Firmware Upgrade Image",
        url: "http://example.com",
        username: "user",
        password: "pass",
        filesize: 100,
        target_filename: "foo",
        timewindowlist: [%CWMP.Protocol.Messages.TimeWindowStruct{
          window_start: 5,
          window_end: 45,
          window_mode: "1 At Any Time",
          user_message: "A message",
          max_retries: -1}]
        }) == @sample)
  end

end
