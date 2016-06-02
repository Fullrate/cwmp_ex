defmodule CWMP.Protocol.Parser.Messages.CancelTransferResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.CancelTransferResponse

  def initial_acc do
    %CancelTransferResponse{}
  end

end

