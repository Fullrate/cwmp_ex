defmodule CWMP.Protocol.Parser.Messages.GetAllQueuedTransfers do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetAllQueuedTransfers

  def initial_acc do
    %GetAllQueuedTransfers{}
  end

end

