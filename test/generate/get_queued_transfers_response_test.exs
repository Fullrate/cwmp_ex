defmodule CWMP.Protocol.Generator.GetQueuedTransfersResponseTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_7bfc27c1f4f0a2c1d775f8aa1840439e</cwmp:ID>
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
</SOAP-ENV:Envelope>|

  test "generates GetQueuedTransfersResponse" do
    assert(CWMP.Protocol.Generator.generate!(
      %CWMP.Protocol.Messages.Header{id: "API_7bfc27c1f4f0a2c1d775f8aa1840439e"},
      %CWMP.Protocol.Messages.GetQueuedTransfersResponse{
        transferlist: [
          %CWMP.Protocol.Messages.QueuedTransferStruct{commandkey: "cmdkey", state: 2},
          %CWMP.Protocol.Messages.QueuedTransferStruct{commandkey: "cmdkey2", state: 3}
        ]}) == @sample)
  end

end
