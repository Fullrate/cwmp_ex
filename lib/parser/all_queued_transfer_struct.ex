defmodule CWMP.Protocol.Parser.Messages.AllQueuedTransferStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.AllQueuedTransferStruct

  def initial_acc do
    %AllQueuedTransferStruct{}
  end

  def end_element(state, ['CommandKey']) do
    update_acc(state, fn acc -> %AllQueuedTransferStruct{acc | commandkey: state.last_text} end)
  end

  def end_element(state, ['State']) do
    update_acc(state, fn acc -> %AllQueuedTransferStruct{acc | state: integerValue(state.last_text, fn(x) -> x in 1..3 end)} end)
  end

  def end_element(state, ['IsDownload']) do
    update_acc(state, fn acc -> %AllQueuedTransferStruct{acc | is_download: boolValue(state.last_text)} end)
  end

  def end_element(state, ['FileType']) do
    if hd(to_charlist(state.last_text)) not in [49,50,51,52,53,54,55,88] do
      raise "Invalid filetype"
    end
    update_acc(state, fn acc -> %AllQueuedTransferStruct{acc | filetype: state.last_text} end)
  end

  def end_element(state, ['FileSize']) do
    update_acc(state, fn acc -> %AllQueuedTransferStruct{acc | filesize: integerValue(state.last_text, fn(x) -> x >= 0 end)} end)
  end

  def end_element(state, ['TargetFileName']) do
    update_acc(state, fn acc -> %AllQueuedTransferStruct{acc | target_filename: state.last_text} end)
  end

end
