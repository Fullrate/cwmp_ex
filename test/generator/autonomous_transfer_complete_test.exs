defmodule CWMP.Protocol.Generator.AutonomousTransferCompleteTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:AutonomousTransferComplete>
\t\t\t<AnnounceURL>http://example.com/announce</AnnounceURL>
\t\t\t<TransferURL>http://example.com/transfer</TransferURL>
\t\t\t<IsDownload>1</IsDownload>
\t\t\t<FileType>1 Firmware Upgrade Image</FileType>
\t\t\t<FileSize>154321</FileSize>
\t\t\t<TargetFileName>image</TargetFileName>
\t\t\t<FaultStruct>
\t\t\t\t<FaultCode>0</FaultCode>
\t\t\t\t<FaultString></FaultString>
\t\t\t</FaultStruct>
\t\t\t<StartTime>2015-01-19T23:08:24+00:00</StartTime>
\t\t\t<CompleteTime>2015-01-19T23:18:24+00:00</CompleteTime>
\t\t</cwmp:AutonomousTransferComplete>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates AutonomousTransferComplete request" do
    assert(CWMP.Protocol.Generator.autonomous_transfer_complete(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"}, %CWMP.Protocol.Messages.AutonomousTransferCompleteRequest{
      announce_url: "http://example.com/announce",
      transfer_url: "http://example.com/transfer",
      is_download: true,
      filetype: "1 Firmware Upgrade Image",
      filesize: 154321,
      target_filename: "image",
      fault_struct: %CWMP.Protocol.Messages.FaultStruct{ code: 0, string: "" },
      start_time: %Timex.DateTime{calendar: :gregorian,
          day: 19, hour: 23, minute: 8, month: 1, millisecond: 0, second: 24,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015},
      complete_time: %Timex.DateTime{calendar: :gregorian,
          day: 19, hour: 23, minute: 18, month: 1, millisecond: 0, second: 24,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015}
    }) == @sample)
  end

  @sample2 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:AutonomousTransferComplete>
\t\t\t<AnnounceURL>http://example.com/announce</AnnounceURL>
\t\t\t<TransferURL>http://example.com/transfer</TransferURL>
\t\t\t<IsDownload>0</IsDownload>
\t\t\t<FileType>1 Firmware Upgrade Image</FileType>
\t\t\t<FileSize>154321</FileSize>
\t\t\t<TargetFileName>image</TargetFileName>
\t\t\t<FaultStruct>
\t\t\t\t<FaultCode>0</FaultCode>
\t\t\t\t<FaultString></FaultString>
\t\t\t</FaultStruct>
\t\t\t<StartTime>1970-01-01T00:00:00+00:00</StartTime>
\t\t\t<CompleteTime>2015-01-19T23:18:24+00:00</CompleteTime>
\t\t</cwmp:AutonomousTransferComplete>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates 2nd AutonomousTransferComplete request" do
    assert(CWMP.Protocol.Generator.autonomous_transfer_complete(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"}, %CWMP.Protocol.Messages.AutonomousTransferCompleteRequest{
      announce_url: "http://example.com/announce",
      transfer_url: "http://example.com/transfer",
      is_download: false,
      filetype: "1 Firmware Upgrade Image",
      filesize: 154321,
      target_filename: "image",
      fault_struct: %CWMP.Protocol.Messages.FaultStruct{ code: 0, string: "" },
      complete_time: %Timex.DateTime{calendar: :gregorian,
          day: 19, hour: 23, minute: 18, month: 1, millisecond: 0, second: 24,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015}
    }) == @sample2)
  end

  @sample3 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:AutonomousTransferComplete>
\t\t\t<AnnounceURL>http://example.com/announce</AnnounceURL>
\t\t\t<TransferURL>http://example.com/transfer</TransferURL>
\t\t\t<IsDownload>0</IsDownload>
\t\t\t<FileType>1 Firmware Upgrade Image</FileType>
\t\t\t<FileSize>154321</FileSize>
\t\t\t<TargetFileName>image</TargetFileName>
\t\t\t<FaultStruct>
\t\t\t\t<FaultCode>0</FaultCode>
\t\t\t\t<FaultString></FaultString>
\t\t\t</FaultStruct>
\t\t\t<StartTime>1970-01-01T00:00:00+00:00</StartTime>
\t\t\t<CompleteTime>1970-01-01T00:00:00+00:00</CompleteTime>
\t\t</cwmp:AutonomousTransferComplete>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates 3rd AutonomousTransferComplete request" do
    assert(CWMP.Protocol.Generator.autonomous_transfer_complete(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"}, %CWMP.Protocol.Messages.AutonomousTransferCompleteRequest{
      announce_url: "http://example.com/announce",
      transfer_url: "http://example.com/transfer",
      is_download: false,
      filetype: "1 Firmware Upgrade Image",
      filesize: 154321,
      target_filename: "image",
      fault_struct: %CWMP.Protocol.Messages.FaultStruct{ code: 0, string: "" }
    }) == @sample3)
  end
end
