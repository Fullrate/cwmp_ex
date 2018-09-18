defmodule CWMP.Protocol.Generator.ScheduleDownloadTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:ScheduleDownload>
      <CommandKey>CommandKey</CommandKey>
      <FileType>1 Firmware Upgrade Image</FileType>
      <URL>http://example.com</URL>
      <Username>user</Username>
      <Password>pass</Password>
      <FileSize>100</FileSize>
      <TargetFileName>foo</TargetFileName>
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
</SOAP-ENV:Envelope>|

  test "generates full ScheduleDownload request" do
    assert(CWMP.Protocol.Generator.generate!(
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
