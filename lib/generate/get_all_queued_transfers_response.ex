defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.GetAllQueuedTransfersResponse do
  import XmlBuilder

  use CWMP.Protocol.GenerateHelpers

  def generate(req) do
    transferlist=for t <- req.transferlist, do: generateTransferStruct(t)

    element("cwmp:GetAllQueuedTransfersResponse", [
      element(:TransferList, %{"SOAP-ENC:arrayType": "cwmp:AllQueuedTransferStruct[#{length(transferlist)}]"}, transferlist)])
  end

  defp generateTransferStruct( ts ) do
    if ts.filetype == nil do
      raise "Filetype can not be nil"
    end
    if not hd(to_char_list(ts.filetype)) in [49,50,51,52,53,54,55,88] do
      raise "Invalid filetype"
    end
    filesize=integerValue(ts.filesize, fn(x) -> x>=0 end)
    element(:AllQueuedTransferStruct, [
      element(:CommandKey, ts.commandkey),
      element(:State, integerValue(ts.state, fn(x) -> x in 1..3 end)),
      element(:IsDownload, boolValue(ts.is_download)),
      element(:FileType, ts.filetype),
      element(:FileSize, filesize),
      element(:TargetFileName, ts.target_filename)])
  end

end
