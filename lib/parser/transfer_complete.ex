defmodule CWMP.Protocol.Parser.Messages.TransferComplete do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.TransferComplete

  def initial_acc do
    %TransferComplete{}
  end

  def start_element(state, ['FaultStruct'], _attribs) do
    push_handler(state, FaultStruct)
  end

  def end_element(state, ['FaultStruct']) do
    update_acc(state, fn acc -> %TransferComplete{acc | fault_struct: state.last_acc} end)
  end

  def end_element(state, ['StartTime']) do
    update_acc(state, fn cur -> %TransferComplete{cur | start_time: datetimeStructure(state.last_text)} end)
  end

  def end_element(state, ['CompleteTime']) do
    update_acc(state, fn cur -> %TransferComplete{cur | complete_time: datetimeStructure(state.last_text)} end)
  end

  def end_element(state, ['CommandKey']) do
    update_acc(state, fn cur -> %TransferComplete{cur | command_key: state.last_text} end)
  end
end

