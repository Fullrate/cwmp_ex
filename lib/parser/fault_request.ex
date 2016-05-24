defmodule CWMP.Protocol.Parser.Messages.FaultRequest do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.FaultRequest

  def initial_acc do
    %FaultRequest{}
  end

  def start_element(state, ['Fault', 'detail'], _attribs) do
    push_handler(state, FaultStruct)
  end

  def end_element(state, ['faultcode']) do
    update_acc(state, fn acc -> %FaultRequest{acc | faultcode: state.last_text} end)
  end

  def end_element(state, ['faultstring']) do
    update_acc(state, fn acc -> %FaultRequest{acc | faultstring: state.last_text} end)
  end

  def end_element(state, ['Fault', 'detail']) do
    update_acc(state, fn acc -> %FaultRequest{acc | detail: state.last_acc} end)
  end
end
