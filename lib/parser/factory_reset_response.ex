defmodule CWMP.Protocol.Parser.Messages.FactoryResetResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.FactoryResetResponse

  def initial_acc do
    %FactoryResetResponse{}
  end

end

