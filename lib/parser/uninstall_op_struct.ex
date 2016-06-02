defmodule CWMP.Protocol.Parser.Messages.UninstallOpStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.UninstallOpStruct

  def initial_acc do
    %UninstallOpStruct{}
  end

  def end_element(state, ['URL']) do
    update_acc(state, fn acc -> %UninstallOpStruct{acc | url: state.last_text} end)
  end

  def end_element(state, ['UUID']) do
    update_acc(state, fn acc -> %UninstallOpStruct{acc | uuid: state.last_text} end)
  end

  def end_element(state, ['ExecutionEnvRef']) do
    update_acc(state, fn acc -> %UninstallOpStruct{acc | execution_env_ref: state.last_text} end)
  end

end
