defmodule CWMP.Protocol.Parser.GetQueuedTransfersResponseTest do
  use ExUnit.Case, async: true

  @sample """
  <SOAP-ENV:Envelope
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
    <SOAP-ENV:Header>
      <cwmp:ID SOAP-ENV:mustUnderstand="1">API_28edd28d788a784422413db3914c34b0</cwmp:ID>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
      <cwmp:GetQueuedTransfersResponse>
        <TransferList SOAP-ENC:arrayType="cwmp:QueuedTransferStruct[2]">
          <QueuedTransferStruct>
            <CommandKey>cmdkey</CommandKey>
            <State>2</State>
          </QueuedTransferStruct>
          <QueuedTransferStruct>
            <CommandKey>cmdkey2</CommandKey>
            <State>3</State>
          </QueuedTransferStruct>
        </TransferList>
      </cwmp:GetQueuedTransfersResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""

  @sample_result {:ok,%{entries: [%CWMP.Protocol.Messages.GetQueuedTransfersResponse{transferlist: [
          %CWMP.Protocol.Messages.QueuedTransferStruct{commandkey: "cmdkey", state: 2},
          %CWMP.Protocol.Messages.QueuedTransferStruct{commandkey: "cmdkey2", state: 3}
        ]}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_28edd28d788a784422413db3914c34b0",
      session_timeout: 30, no_more_requests: false}}}

  test "parses GetQueuedTransfers response" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end
