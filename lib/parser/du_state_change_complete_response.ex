defmodule CWMP.Protocol.Parser.Messages.DUStateChangeCompleteResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.DUStateChangeCompleteResponse

  def initial_acc do
    %DUStateChangeCompleteResponse{}
  end

end

