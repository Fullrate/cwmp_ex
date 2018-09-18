defmodule CWMP.Protocol.Generator.AutonomousTransferCompleteTest do
  use ExUnit.Case, async: true
  import TestHelpers

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:AutonomousTransferComplete>
      <AnnounceURL>http://example.com/announce</AnnounceURL>
      <TransferURL>http://example.com/transfer</TransferURL>
      <IsDownload>1</IsDownload>
      <FileType>1 Firmware Upgrade Image</FileType>
      <FileSize>154321</FileSize>
      <TargetFileName>image</TargetFileName>
      <FaultStruct>
        <FaultCode>0</FaultCode>
        <FaultString></FaultString>
      </FaultStruct>
      <StartTime>2015-01-19T23:08:24Z</StartTime>
      <CompleteTime>2015-01-19T23:18:24Z</CompleteTime>
    </cwmp:AutonomousTransferComplete>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates AutonomousTransferComplete request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"}, %CWMP.Protocol.Messages.AutonomousTransferComplete{
      announce_url: "http://example.com/announce",
      transfer_url: "http://example.com/transfer",
      is_download: true,
      filetype: "1 Firmware Upgrade Image",
      filesize: 154321,
      target_filename: "image",
      fault_struct: %CWMP.Protocol.Messages.FaultStruct{ code: 0, string: "" },
      start_time: generate_datetime({{19,1,2015},{23,8,24}}),
      complete_time: generate_datetime({{19,1,2015},{23,18,24}})
    }) == @sample)
  end

  @sample2 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:AutonomousTransferComplete>
      <AnnounceURL>http://example.com/announce</AnnounceURL>
      <TransferURL>http://example.com/transfer</TransferURL>
      <IsDownload>0</IsDownload>
      <FileType>1 Firmware Upgrade Image</FileType>
      <FileSize>154321</FileSize>
      <TargetFileName>image</TargetFileName>
      <FaultStruct>
        <FaultCode>0</FaultCode>
        <FaultString></FaultString>
      </FaultStruct>
      <StartTime>1970-01-01T00:00:00Z</StartTime>
      <CompleteTime>2015-01-19T23:18:24Z</CompleteTime>
    </cwmp:AutonomousTransferComplete>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates 2nd AutonomousTransferComplete request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"}, %CWMP.Protocol.Messages.AutonomousTransferComplete{
      announce_url: "http://example.com/announce",
      transfer_url: "http://example.com/transfer",
      is_download: false,
      filetype: "1 Firmware Upgrade Image",
      filesize: 154321,
      target_filename: "image",
      fault_struct: %CWMP.Protocol.Messages.FaultStruct{ code: 0, string: "" },
      complete_time: generate_datetime({{19,1,2015},{23,18,24}})
    }) == @sample2)
  end

  @sample3 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:AutonomousTransferComplete>
      <AnnounceURL>http://example.com/announce</AnnounceURL>
      <TransferURL>http://example.com/transfer</TransferURL>
      <IsDownload>0</IsDownload>
      <FileType>1 Firmware Upgrade Image</FileType>
      <FileSize>154321</FileSize>
      <TargetFileName>image</TargetFileName>
      <FaultStruct>
        <FaultCode>0</FaultCode>
        <FaultString></FaultString>
      </FaultStruct>
      <StartTime>1970-01-01T00:00:00Z</StartTime>
      <CompleteTime>1970-01-01T00:00:00Z</CompleteTime>
    </cwmp:AutonomousTransferComplete>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates 3rd AutonomousTransferComplete request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"}, %CWMP.Protocol.Messages.AutonomousTransferComplete{
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
