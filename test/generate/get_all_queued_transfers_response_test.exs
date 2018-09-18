defmodule CWMP.Protocol.Generator.GetAllQueuedTransfersResponseTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:GetAllQueuedTransfersResponse>
      <TransferList SOAP-ENC:arrayType="cwmp:AllQueuedTransferStruct[2]">
        <AllQueuedTransferStruct>
          <CommandKey>cmdkey</CommandKey>
          <State>1</State>
          <IsDownload>1</IsDownload>
          <FileType>1 Firmware Upgrade Image</FileType>
          <FileSize>123456</FileSize>
          <TargetFileName>image</TargetFileName>
        </AllQueuedTransferStruct>
        <AllQueuedTransferStruct>
          <CommandKey>cmdkey2</CommandKey>
          <State>3</State>
          <IsDownload>0</IsDownload>
          <FileType>2 Web Content</FileType>
          <FileSize>654321</FileSize>
          <TargetFileName/>
        </AllQueuedTransferStruct>
      </TransferList>
    </cwmp:GetAllQueuedTransfersResponse>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates GetAllQueuedTransfersResponse request" do
    assert(CWMP.Protocol.Generator.generate!(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.GetAllQueuedTransfersResponse{
        transferlist: [
          %CWMP.Protocol.Messages.AllQueuedTransferStruct{
            commandkey: "cmdkey",
            state: 1,
            is_download: true,
            filetype: "1 Firmware Upgrade Image",
            filesize: 123456,
            target_filename: "image"},
          %CWMP.Protocol.Messages.AllQueuedTransferStruct{
            commandkey: "cmdkey2",
            state: 3,
            is_download: false,
            filetype: "2 Web Content",
            filesize: 654321}
        ]
      }) == @sample)
  end

end
