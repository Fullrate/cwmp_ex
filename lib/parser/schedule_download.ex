defmodule CWMP.Protocol.Parser.Messages.ScheduleDownload do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.ScheduleDownload

  def initial_acc do
    %ScheduleDownload{}
  end

  def start_element(state, ['TimeWindowStruct', 'TimeWindowList'], _attribs, _uri) do
    push_handler(state, CWMP.Protocol.Parser.Messages.TimeWindowStruct)
  end

  def end_element(state, ['CommandKey']) do
    update_acc(state, fn cur -> %ScheduleDownload{cur | commandkey: state.last_text} end)
  end

  def end_element(state, ['FileType']) do
    if hd(to_charlist(state.last_text)) in [49,50,51,52,53,88] do
      update_acc(state, fn cur -> %ScheduleDownload{cur | filetype: state.last_text} end)
    else
      raise "Invalid filetype"
    end
  end

  # can not be empty...
  def end_element(state, ['URL']) do
    update_acc(state, fn cur -> %ScheduleDownload{cur | url: state.last_text} end)
  end

  def end_element(state, ['FileSize']) do
    fs=integerValue(state.last_text)
    update_acc(state, fn cur -> %ScheduleDownload{cur | filesize: fs} end)
  end

  def end_element(state, ['Username']) do
    update_acc(state, fn cur -> %ScheduleDownload{cur | username: state.last_text} end)
  end

  def end_element(state, ['Password']) do
    update_acc(state, fn cur -> %ScheduleDownload{cur | password: state.last_text} end)
  end

  def end_element(state, ['TargetFileName']) do
    update_acc(state, fn cur -> %ScheduleDownload{cur | target_filename: state.last_text} end)
  end

  def end_element(state, ['TimeWindowStruct', 'TimeWindowList']) do
    update_acc(state, fn acc -> %ScheduleDownload{acc | timewindowlist: acc.timewindowlist ++ [state.last_acc]} end)
  end

end

