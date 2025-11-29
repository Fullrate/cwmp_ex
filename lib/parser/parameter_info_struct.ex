defmodule CWMP.Protocol.Parser.Messages.ParameterInfoStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.ParameterInfoStruct

  def initial_acc do
    %ParameterInfoStruct{}
  end

  def end_element(state, ['Name']) do
    update_acc(state, fn acc -> %ParameterInfoStruct{acc | name: state.last_text} end)
  end

  def end_element(state, ['Writable']) do
    update_acc(state, fn acc -> %ParameterInfoStruct{acc | writable: boolValue(state.last_text)} end)
  end
end
