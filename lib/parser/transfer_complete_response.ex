defmodule CWMP.Protocol.Parser.Messages.TransferCompleteResponse do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.TransferCompleteResponse

  def initial_acc do
    %TransferCompleteResponse{}
  end
end

