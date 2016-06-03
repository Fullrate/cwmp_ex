defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.GetQueuedTransfersResponse do
  import XmlBuilder

  use CWMP.Protocol.GenerateHelpers

  def generate(req) do
    element("cwmp:GetQueuedTransfersResponse", [buildQueuedTransferList(req.transferlist)])
  end

  defp buildQueuedTransferList(transferlist) do
    list=for t <- transferlist, do: element(:QueuedTransferStruct, [
      element(:CommandKey, t.commandkey),
      element(:State, integerValue(t.state, fn(x) -> x in 1..3 end))])
    element(:TransferList,%{"SOAP-ENC:arrayType": "cwmp:QueuedTransferStruct[#{length(list)}]"},[list])
  end
end

