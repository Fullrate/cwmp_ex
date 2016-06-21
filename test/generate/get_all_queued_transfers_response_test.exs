defmodule CWMP.Protocol.Generator.GetAllQueuedTransfersResponseTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:GetAllQueuedTransfersResponse>
\t\t\t<TransferList SOAP-ENC:arrayType="cwmp:AllQueuedTransferStruct[2]">
\t\t\t\t<AllQueuedTransferStruct>
\t\t\t\t\t<CommandKey>cmdkey</CommandKey>
\t\t\t\t\t<State>1</State>
\t\t\t\t\t<IsDownload>1</IsDownload>
\t\t\t\t\t<FileType>1 Firmware Upgrade Image</FileType>
\t\t\t\t\t<FileSize>123456</FileSize>
\t\t\t\t\t<TargetFileName>image</TargetFileName>
\t\t\t\t</AllQueuedTransferStruct>
\t\t\t\t<AllQueuedTransferStruct>
\t\t\t\t\t<CommandKey>cmdkey2</CommandKey>
\t\t\t\t\t<State>3</State>
\t\t\t\t\t<IsDownload>0</IsDownload>
\t\t\t\t\t<FileType>2 Web Content</FileType>
\t\t\t\t\t<FileSize>654321</FileSize>
\t\t\t\t\t<TargetFileName/>
\t\t\t\t</AllQueuedTransferStruct>
\t\t\t</TransferList>
\t\t</cwmp:GetAllQueuedTransfersResponse>
\t</SOAP-ENV:Body>
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
