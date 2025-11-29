defmodule CWMP.Protocol.Parser.Messages.GetRPCMethods do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetRPCMethods

  def initial_acc do
    %GetRPCMethods{}
  end

end

