defmodule CWMP.Protocol.Parser.Messages.ChangeDUStateResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.ChangeDUStateResponse

  def initial_acc do
    %ChangeDUStateResponse{}
  end

end

