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
    case Integer.parse(state.last_text) do
      {val, ""} when val in 0..1 -> case val do
        0 -> update_acc(state, fn cur -> %SetParameterAttributesStruct{cur | notification_change: false} end)
        _ -> update_acc(state, fn cur -> %SetParameterAttributesStruct{cur | notification_change: true} end)
      end
      _ -> raise "Invalid NotificationChange value: #{state.last_text}"
    end
  end

  # Notification must be int, 0-6 in value
  def end_element(state, ['Notification']) do
    case Integer.parse(state.last_text) do
      {val, ""} when val in 0..6 -> update_acc(state, fn cur -> %SetParameterAttributesStruct{cur | notification: val} end)
      _ -> raise "Invalid Notification value: #{state.last_text}"
    end
  end

  def end_element(state, ['AccessListChange']) do
    case Integer.parse(state.last_text) do
      {val, ""} when val in 0..1 -> case val do
        0 -> update_acc(state, fn cur -> %SetParameterAttributesStruct{cur | accesslist_change: false} end)
        _ -> update_acc(state, fn cur -> %SetParameterAttributesStruct{cur | accesslist_change: true} end)
      end
      _ -> raise "Invalid AccessListChange value: #{state.last_text}"
    end
  end

  def end_element(state, ['string','AccessList']) do
    update_acc(state, fn acc -> %SetParameterAttributesStruct{acc | accesslist: acc.accesslist ++ [state.last_text]} end)
  end
end
