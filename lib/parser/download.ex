defmodule CWMP.Protocol.Parser.Messages.Download do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.Download

  def initial_acc do
    %Download{}
  end

  def end_element(state, ['CommandKey']) do
    update_acc(state, fn cur -> %Download{cur | commandkey: state.last_text} end)
  end

  def end_element(state, ['FileType']) do
    if hd(to_char_list(state.last_text)) in [49,50,51,52,53,88] do
      update_acc(state, fn cur -> %Download{cur | filetype: state.last_text} end)
    else
      raise "Invalid filetype"
    end
  end

  # can not be empty...
  def end_element(state, ['URL']) do
    update_acc(state, fn cur -> %Download{cur | url: state.last_text} end)
  end

  def end_element(state, ['FileSize']) do
    fs=integerValue(state.last_text)
    update_acc(state, fn cur -> %Download{cur | filesize: fs} end)
  end

  def end_element(state, ['Username']) do
    update_acc(state, fn cur -> %Download{cur | username: state.last_text} end)
  end

  def end_element(state, ['Password']) do
    update_acc(state, fn cur -> %Download{cur | password: state.last_text} end)
  end

  def end_element(state, ['DelaySeconds']) do
    ds=integerValue(state.last_text)
    update_acc(state, fn cur -> %Download{cur | delay_seconds: ds} end)
  end

  def end_element(state, ['TargetFileName']) do
    update_acc(state, fn cur -> %Download{cur | target_filename: state.last_text} end)
  end

  def end_element(state, ['SuccessURL']) do
    update_acc(state, fn cur -> %Download{cur | success_url: state.last_text} end)
  end

  def end_element(state, ['FailureURL']) do
    update_acc(state, fn cur -> %Download{cur | failure_url: state.last_text} end)
  end

end

