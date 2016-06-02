defmodule CWMP.Protocol.Parser.Messages.InstallOpStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.InstallOpStruct

  def initial_acc do
    %InstallOpStruct{}
  end

  def end_element(state, ['URL']) do
    update_acc(state, fn acc -> %InstallOpStruct{acc | url: state.last_text} end)
  end

  def end_element(state, ['UUID']) do
    update_acc(state, fn acc -> %InstallOpStruct{acc | uuid: state.last_text} end)
  end

  def end_element(state, ['Username']) do
    update_acc(state, fn acc -> %InstallOpStruct{acc | username: state.last_text} end)
  end

  def end_element(state, ['Password']) do
    update_acc(state, fn acc -> %InstallOpStruct{acc | password: state.last_text} end)
  end

  def end_element(state, ['ExecutionEnvRef']) do
    update_acc(state, fn acc -> %InstallOpStruct{acc | execution_env_ref: state.last_text} end)
  end

end
