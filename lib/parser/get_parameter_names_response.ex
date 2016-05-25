defmodule CWMP.Protocol.Parser.Messages.GetParameterNamesResponseRequest do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetParameterNamesResponse

  def initial_acc do
    %GetParameterNamesResponse{}
  end

  def start_element(state, ['ParameterInfoStruct', 'ParameterList'], _attribs) do
    push_handler(state, CWMP.Protocol.Parser.Messages.ParameterInfoStruct)
  end

  def end_element(state, ['ParameterInfoStruct', 'ParameterList']) do
    update_acc(state, fn acc -> %GetParameterNamesResponse{acc | parameters: acc.parameters ++ [state.last_acc]} end)
  end
end

