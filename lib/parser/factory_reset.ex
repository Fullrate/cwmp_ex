defmodule CWMP.Protocol.Parser.Messages.FactoryReset do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.FactoryReset

  def initial_acc do
    %FactoryReset{}
  end

end

