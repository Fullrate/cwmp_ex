defmodule CWMP.Protocol.Parser.Messages.AutonomousTransferComplete do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.AutonomousTransferComplete

  def initial_acc do
    %AutonomousTransferComplete{}
  end

  def start_element(state, ['FaultStruct'], _attribs, _uri) do
    push_handler(state, FaultStruct)
  end

  def end_element(state, ['FaultStruct']) do
    update_acc(state, fn acc -> %AutonomousTransferComplete{acc | fault_struct: state.last_acc} end)
  end

  def end_element(state, ['StartTime']) do
    update_acc(state, fn cur -> %AutonomousTransferComplete{cur | start_time: datetimeStructure(state.last_text)} end)
  end

  def end_element(state, ['CompleteTime']) do
    update_acc(state, fn cur -> %AutonomousTransferComplete{cur | complete_time: datetimeStructure(state.last_text)} end)
  end

  def end_element(state, ['AnnounceURL']) do
    update_acc(state, fn cur -> %AutonomousTransferComplete{cur | announce_url: state.last_text} end)
  end

  def end_element(state, ['TransferURL']) do
    update_acc(state, fn cur -> %AutonomousTransferComplete{cur | transfer_url: state.last_text} end)
  end

  def end_element(state, ['FileType']) do
    update_acc(state, fn cur -> %AutonomousTransferComplete{cur | filetype: state.last_text} end)
  end

  def end_element(state, ['FileSize']) do
    update_acc(state, fn cur -> %AutonomousTransferComplete{cur | filesize: integerValue(state.last_text, fn(x) -> x >= 0 end)} end)
  end

  def end_element(state, ['TargetFileName']) do
    update_acc(state, fn cur -> %AutonomousTransferComplete{cur | target_filename: state.last_text} end)
  end

  def end_element(state, ['IsDownload']) do
    update_acc(state, fn cur -> %AutonomousTransferComplete{cur | is_download: boolValue(state.last_text)} end)
  end
end

