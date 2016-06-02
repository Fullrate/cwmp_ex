defmodule CWMP.Protocol.Parser.GetAllQueuedTransfersResponseTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
    <SOAP-ENV:Header>
      <cwmp:ID SOAP-ENV:mustUnderstand="1">API_953323a9b674bb42b7cad250b2cf0607</cwmp:ID>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
      <cwmp:GetAllQueuedTransfersResponse>
        <TransferList SOAP-ENC:arrayType="cwmp:AllQueuedTransferStruct[0002]">
          <AllQueuedTransferStruct>
            <CommandKey>cmdkey</CommandKey>
            <State>2</State>
            <IsDownload>1</IsDownload>
            <FileType>1 Firmware Upgrade Image</FileType>
            <FileSize>123456</FileSize>
            <TargetFileName>image</TargetFileName>
          </AllQueuedTransferStruct>
          <AllQueuedTransferStruct>
            <CommandKey>cmdkey2</CommandKey>
            <State>3</State>
            <IsDownload>0</IsDownload>
            <FileType>3 Vendor Configuration File</FileType>
            <FileSize>1234</FileSize>
            <TargetFileName/>
          </AllQueuedTransferStruct>
        </TransferList>
      </cwmp:GetAllQueuedTransfersResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""

  @sample_result %{entries: [%CWMP.Protocol.Messages.GetAllQueuedTransfersResponse{
        transferlist: [
          %CWMP.Protocol.Messages.AllQueuedTransferStruct{
            commandkey: "cmdkey",
            state: 2,
            is_download: true,
            filetype: "1 Firmware Upgrade Image",
            filesize: 123456,
            target_filename: "image"
          },
          %CWMP.Protocol.Messages.AllQueuedTransferStruct{
            commandkey: "cmdkey2",
            state: 3,
            is_download: false,
            filetype: "3 Vendor Configuration File",
            filesize: 1234,
            target_filename: ""
          },
        ]}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_953323a9b674bb42b7cad250b2cf0607",
      session_timeout: 30, no_more_requests: false}}

  test "parses GetAllQueuedTransfersResponse" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end
