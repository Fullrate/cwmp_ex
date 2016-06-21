defmodule CWMP.Protocol.Parser.Messages.SetParameterValues do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.SetParameterValues

  def initial_acc do
    %SetParameterValues{}
  end

  def start_element(state, ['ParameterValueStruct', 'ParameterList'], _attribs, _uri) do
    push_handler(state, CWMP.Protocol.Parser.Messages.ParameterValueStruct)
  end

  def end_element(state, ['ParameterValueStruct', 'ParameterList']) do
    update_acc(state, fn acc -> %SetParameterValues{acc | parameters: acc.parameters ++ [state.last_acc]} end)
  end

  def end_element(state, ['ParameterKey']) do
    update_acc(state, fn cur -> %SetParameterValues{cur | parameter_key: state.last_text} end)
  end

end

