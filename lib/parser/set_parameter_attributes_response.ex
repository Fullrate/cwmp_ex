defmodule CWMP.Protocol.Parser.Messages.SetParameterAttributesResponseRequest do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.SetParameterAttributesResponse

  def initial_acc do
    %SetParameterAttributesResponse{}
  end
end

