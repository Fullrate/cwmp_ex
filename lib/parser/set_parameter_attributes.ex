defmodule CWMP.Protocol.Parser.Messages.SetParameterAttributes do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.SetParameterAttributes

  def initial_acc do
    %SetParameterAttributes{}
  end

  def start_element(state, ['SetParameterAttributesStruct', 'ParameterList'], _attribs) do
    push_handler(state, CWMP.Protocol.Parser.Messages.SetParameterAttributesStruct)
  end

  def end_element(state, ['SetParameterAttributesStruct', 'ParameterList']) do
    update_acc(state, fn acc -> %SetParameterAttributes{acc | parameters: acc.parameters ++ [state.last_acc]} end)
  end
end

