defmodule CWMP.Protocol.Parser.Messages.GetParameterValues do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetParameterValues

  def initial_acc do
    %GetParameterValues{}
  end

  def end_element(state, ['string', 'ParameterNames']) do
    update_acc(state, fn acc -> %GetParameterValues{acc | parameters: acc.parameters ++ [state.last_text]} end)
  end
end

