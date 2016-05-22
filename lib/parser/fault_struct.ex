defmodule FaultStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.FaultStruct

  def initial_acc do
    %FaultStruct{}
  end

  def end_element(state, ['FaultCode']) do
    case Integer.parse(state.last_text) do
      {val, ""} when val >= 0 -> update_acc(state, fn cur -> %FaultStruct{cur | code: val} end)
      _ -> raise "Invalid fault code"
    end
  end

  def end_element(state, ['FaultString']) do
    update_acc(state, fn acc -> %FaultStruct{acc | string: state.last_text} end)
  end
end
