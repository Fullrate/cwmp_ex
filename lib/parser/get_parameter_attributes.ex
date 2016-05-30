defmodule CWMP.Protocol.Parser.Messages.GetParameterAttributes do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetParameterAttributes

  def initial_acc do
    %GetParameterAttributes{}
  end

  def end_element(state, ['string', 'ParameterNames']) do
    update_acc(state, fn acc -> %GetParameterAttributes{acc | parameters: acc.parameters ++ [state.last_text]} end)
  end
end

