defmodule CWMP.Protocol.Parser.Messages.SetParameterAttributesStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.SetParameterAttributesStruct

  def initial_acc do
    %SetParameterAttributesStruct{}
  end

  def end_element(state, ['Name']) do
    update_acc(state, fn acc -> %SetParameterAttributesStruct{acc | name: state.last_text} end)
  end

  def end_element(state, ['NotificationChange']) do
    update_acc(state, fn cur -> %SetParameterAttributesStruct{cur | notification_change: boolValue(state.last_text)} end)
  end

  # Notification must be int, 0-6 in value
  def end_element(state, ['Notification']) do
    update_acc(state, fn cur -> %SetParameterAttributesStruct{cur | notification: integerValue(state.last_text,fn(x) -> x in 0..6 end)} end)
  end

  def end_element(state, ['AccessListChange']) do
    update_acc(state, fn cur -> %SetParameterAttributesStruct{cur | accesslist_change: boolValue(state.last_text)} end)
  end

  def end_element(state, ['string','AccessList']) do
    update_acc(state, fn acc -> %SetParameterAttributesStruct{acc | accesslist: acc.accesslist ++ [state.last_text]} end)
  end
end
