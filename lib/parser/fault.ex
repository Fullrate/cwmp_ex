defmodule CWMP.Protocol.Parser.Messages.Fault do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.Fault

  def initial_acc do
    %Fault{}
  end

  def start_element(state, ['Fault', 'detail'], _attribs) do
    push_handler(state, FaultStruct)
  end

  def end_element(state, ['faultcode']) do
    update_acc(state, fn acc -> %Fault{acc | faultcode: state.last_text} end)
  end

  def end_element(state, ['faultstring']) do
    update_acc(state, fn acc -> %Fault{acc | faultstring: state.last_text} end)
  end

  def end_element(state, ['Fault', 'detail']) do
    update_acc(state, fn acc -> %Fault{acc | detail: state.last_acc} end)
  end
end
