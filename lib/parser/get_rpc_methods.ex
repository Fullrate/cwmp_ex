defmodule CWMP.Protocol.Parser.Messages.GetRPCMethodsResponseRequest do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetRPCMethods

  def initial_acc do
    %GetRPCMethods{}
  end

  def end_element(state, ['string', 'MethodList']) do
    update_acc(state, fn acc -> %GetRPCMethods{acc | methods: acc.methods ++ [state.last_text]} end)
  end
end

