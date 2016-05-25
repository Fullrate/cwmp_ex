defmodule CWMP.Protocol.Parser.Messages.ParameterValueStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.ParameterValueStruct

  def initial_acc do
    %ParameterValueStruct{}
  end

  def start_element(state, ['Value'], attribs) do
    case for {:attribute, 'type', _, _, val} <- attribs, do: val do
      [val | _] -> update_acc(state, fn acc -> %ParameterValueStruct{acc | type: "#{val}"} end)
      _ -> state
    end
  end

  def end_element(state, ['Name']) do
    update_acc(state, fn acc -> %ParameterValueStruct{acc | name: state.last_text} end)
  end

  def end_element(state, ['Value']) do
    update_acc(state, fn acc -> %ParameterValueStruct{acc | value: state.last_text} end)
  end
end
