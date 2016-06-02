defmodule CWMP.Protocol.Parser.Messages.CancelTransfer do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.CancelTransfer

  def initial_acc do
    %CancelTransfer{}
  end

  def end_element(state, ['CommandKey']) do
    update_acc(state, fn cur -> %CancelTransfer{cur | commandkey: state.last_text} end)
  end

end

