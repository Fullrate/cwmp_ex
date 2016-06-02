defmodule CWMP.Protocol.Parser.Messages.ChangeDUState do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.ChangeDUState

  def initial_acc do
    %ChangeDUState{}
  end

  def start_element(state, ['InstallOpStruct', 'Operations'], _attribs) do
    push_handler(state, CWMP.Protocol.Parser.Messages.InstallOpStruct)
  end

  def start_element(state, ['UpdateOpStruct', 'Operations'], _attribs) do
    push_handler(state, CWMP.Protocol.Parser.Messages.UpdateOpStruct)
  end

  def start_element(state, ['UninstallOpStruct', 'Operations'], _attribs) do
    push_handler(state, CWMP.Protocol.Parser.Messages.UninstallOpStruct)
  end

  def end_element(state, ['InstallOpStruct', 'Operations']) do
    update_acc(state, fn acc -> %ChangeDUState{acc | operations: acc.operations ++ [state.last_acc]} end)
  end

  def end_element(state, ['UpdateOpStruct', 'Operations']) do
    update_acc(state, fn acc -> %ChangeDUState{acc | operations: acc.operations ++ [state.last_acc]} end)
  end

  def end_element(state, ['UninstallOpStruct', 'Operations']) do
    update_acc(state, fn acc -> %ChangeDUState{acc | operations: acc.operations ++ [state.last_acc]} end)
  end

  def end_element(state, ['CommandKey']) do
    update_acc(state, fn cur -> %ChangeDUState{cur | commandkey: state.last_text} end)
  end

end

