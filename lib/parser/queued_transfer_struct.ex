defmodule CWMP.Protocol.Parser.Messages.QueuedTransferStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.QueuedTransferStruct

  def initial_acc do
    %QueuedTransferStruct{}
  end

  def end_element(state, ['CommandKey']) do
    update_acc(state, fn acc -> %QueuedTransferStruct{acc | commandkey: state.last_text} end)
  end

  def end_element(state, ['State']) do
    s=integerValue(state.last_text, fn(x) -> x in 1..3 end)
    update_acc(state, fn acc -> %QueuedTransferStruct{acc | state: s} end)
  end

end
