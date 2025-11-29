defmodule CWMP.Protocol.Parser.Messages.GetRPCMethodsResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetRPCMethodsResponse

  def initial_acc do
    %GetRPCMethodsResponse{}
  end

  def end_element(state, ['string', 'MethodList']) do
    update_acc(state, fn acc -> %GetRPCMethodsResponse{acc | methods: acc.methods ++ [state.last_text]} end)
  end
end

