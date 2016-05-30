defmodule CWMP.Protocol.Parser.Messages.SetParameterAttributesResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.SetParameterAttributesResponse

  def initial_acc do
    %SetParameterAttributesResponse{}
  end
end

