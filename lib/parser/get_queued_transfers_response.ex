defmodule CWMP.Protocol.Parser.Messages.GetQueuedTransfersResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetQueuedTransfersResponse

  def initial_acc do
    %GetQueuedTransfersResponse{}
  end

  def start_element(state, ['QueuedTransferStruct', 'TransferList'], _attribs, _uri) do
    push_handler(state, CWMP.Protocol.Parser.Messages.QueuedTransferStruct)
  end

  def end_element(state, ['QueuedTransferStruct', 'TransferList']) do
    update_acc(state, fn acc -> %GetQueuedTransfersResponse{acc | transferlist: acc.transferlist ++ [state.last_acc]} end)
  end
end

