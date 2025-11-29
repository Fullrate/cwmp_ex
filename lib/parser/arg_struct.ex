defmodule CWMP.Protocol.Parser.Messages.ArgStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.ArgStruct

  def initial_acc do
    %ArgStruct{}
  end

  def end_element(state, ['Name']) do
    update_acc(state, fn acc -> %ArgStruct{acc | name: state.last_text} end)
  end

  def end_element(state, ['Value']) do
    update_acc(state, fn acc -> %ArgStruct{acc | value: state.last_text} end)
  end
end
