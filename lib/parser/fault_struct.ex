defmodule FaultStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.FaultStruct

  def initial_acc do
    %FaultStruct{}
  end

  def end_element(state, ['FaultCode']) do
    update_acc(state, fn cur -> %FaultStruct{cur | code: integerValue(state.last_text, fn(x) -> x >= 0 end)} end)
  end

  def end_element(state, ['FaultString']) do
    update_acc(state, fn acc -> %FaultStruct{acc | string: state.last_text} end)
  end
end
