defmodule CWMP.Protocol.Parser.Messages.GetQueuedTransfers do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetQueuedTransfers

  def initial_acc do
    %GetQueuedTransfers{}
  end

end

