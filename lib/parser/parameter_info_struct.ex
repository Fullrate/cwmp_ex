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
    val = case state.last_text do
      "0" -> false
      "1" -> true
      _ -> raise "Invalid value '#{state.last_text}' for writable"
    end
    update_acc(state, fn acc -> %ParameterInfoStruct{acc | writable: val} end)
  end
end
