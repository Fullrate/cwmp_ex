defmodule CWMP.Protocol.Parser.Messages.GetParameterAttributesResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetParameterAttributesResponse

  def initial_acc do
    %GetParameterAttributesResponse{}
  end

  def start_element(state, ['ParameterAttributeStruct', 'ParameterList'], _attribs, _uri) do
    push_handler(state, CWMP.Protocol.Parser.Messages.ParameterAttributeStruct)
  end

  def end_element(state, ['ParameterAttributeStruct', 'ParameterList']) do
    update_acc(state, fn acc -> %GetParameterAttributesResponse{acc | parameters: acc.parameters ++ [state.last_acc]} end)
  end
end

