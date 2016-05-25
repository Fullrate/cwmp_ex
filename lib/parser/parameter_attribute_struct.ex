defmodule CWMP.Protocol.Parser.Messages.ParameterAttributeStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.ParameterAttributeStruct

  def initial_acc do
    %ParameterAttributeStruct{}
  end

  def end_element(state, ['Name']) do
    update_acc(state, fn acc -> %ParameterAttributeStruct{acc | name: state.last_text} end)
  end

  # Notification must be int, 0-6 in value
  def end_element(state, ['Notification']) do
    case Integer.parse(state.last_text) do
      {val, ""} when val in 0..6 -> update_acc(state, fn cur -> %ParameterAttributeStruct{cur | notification: val} end)
      _ -> raise "Invalid notification value: #{state.last_text}"
    end
  end

  def end_element(state, ['string','AccessList']) do
    update_acc(state, fn acc -> %ParameterAttributeStruct{acc | accesslist: acc.accesslist ++ [state.last_text]} end)
  end
end
