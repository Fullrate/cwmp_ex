defmodule CWMP.Protocol.Parser.Messages.GetAllQueuedTransfersResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetAllQueuedTransfersResponse

  def initial_acc do
    %GetAllQueuedTransfersResponse{}
  end

  def start_element(state, ['AllQueuedTransferStruct', 'TransferList'], _attribs, _uri) do
    push_handler(state, CWMP.Protocol.Parser.Messages.AllQueuedTransferStruct)
  end

  def end_element(state, ['AllQueuedTransferStruct', 'TransferList']) do
    update_acc(state, fn acc -> %GetAllQueuedTransfersResponse{acc | transferlist: acc.transferlist ++ [state.last_acc]} end)
  end
end

