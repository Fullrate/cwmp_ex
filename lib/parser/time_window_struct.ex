defmodule CWMP.Protocol.Parser.Messages.TimeWindowStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.TimeWindowStruct

  def initial_acc do
    %TimeWindowStruct{}
  end

  def end_element(state, ['WindowStart']) do
    update_acc(state, fn acc -> %TimeWindowStruct{acc | window_start: integerValue(state.last_text,fn(x) -> x >= 0 end)} end)
  end

  def end_element(state, ['WindowEnd']) do
    update_acc(state, fn acc -> %TimeWindowStruct{acc | window_end: integerValue(state.last_text,fn(x) -> x >= 0 end)} end)
  end

  def end_element(state, ['WindowMode']) do
    update_acc(state, fn acc -> %TimeWindowStruct{acc | window_mode: state.last_text} end)
  end

  def end_element(state, ['UserMessage']) do
    update_acc(state, fn acc -> %TimeWindowStruct{acc | user_message: state.last_text} end)
  end

  def end_element(state, ['MaxRetries']) do
    update_acc(state, fn acc -> %TimeWindowStruct{acc | max_retries: integerValue(state.last_text)} end)
  end

end
