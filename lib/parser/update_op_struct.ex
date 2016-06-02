defmodule CWMP.Protocol.Parser.Messages.UpdateOpStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.UpdateOpStruct

  def initial_acc do
    %UpdateOpStruct{}
  end

  def end_element(state, ['URL']) do
    update_acc(state, fn acc -> %UpdateOpStruct{acc | url: state.last_text} end)
  end

  def end_element(state, ['UUID']) do
    update_acc(state, fn acc -> %UpdateOpStruct{acc | uuid: state.last_text} end)
  end

  def end_element(state, ['Username']) do
    update_acc(state, fn acc -> %UpdateOpStruct{acc | username: state.last_text} end)
  end

  def end_element(state, ['Password']) do
    update_acc(state, fn acc -> %UpdateOpStruct{acc | password: state.last_text} end)
  end

  def end_element(state, ['Version']) do
    update_acc(state, fn acc -> %UpdateOpStruct{acc | version: state.last_text} end)
  end

end
