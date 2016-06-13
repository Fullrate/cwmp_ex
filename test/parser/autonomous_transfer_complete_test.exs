defmodule CWMP.Protocol.Parser.AutonomousTransferCompleteTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">1</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
                <cwmp:AutonomousTransferComplete>
                        <AnnounceURL>http://example.com/announce</AnnounceURL>
                        <TransferURL>http://example.com/transfer</TransferURL>
                        <IsDownload>1</IsDownload>
                        <FileType>1 Firmware Upgrade Image</FileType>
                        <FileSize>10000</FileSize>
                        <TargetFileName>/bin/image</TargetFileName>
                        <FaultStruct>
                                <FaultCode>0</FaultCode>
                                <FaultString></FaultString>
                        </FaultStruct>
                        <StartTime>2016-04-07T08:43:49Z</StartTime>
                        <CompleteTime>2016-04-07T08:45:06Z</CompleteTime>
                </cwmp:AutonomousTransferComplete>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result {:ok,%{entries: [%CWMP.Protocol.Messages.AutonomousTransferComplete{complete_time: %Timex.DateTime{calendar: :gregorian,
          day: 7, hour: 8, minute: 45, month: 4, millisecond: 0, second: 6,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2016},
          start_time: %Timex.DateTime{calendar: :gregorian,
          day: 7, hour: 8, minute: 43, month: 4, millisecond: 0, second: 49,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2016},
      announce_url: "http://example.com/announce",
      transfer_url: "http://example.com/transfer",
      is_download: true,
      filetype: "1 Firmware Upgrade Image",
      filesize: 10000,
      target_filename: "/bin/image",
      fault_struct: %CWMP.Protocol.Messages.FaultStruct{code: 0, string: ""}}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "1",
      session_timeout: 30, no_more_requests: false}}}

  test "parses autonomous transfer complete request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end
