defmodule CWMP.Protocol.Parser.Messages.Upload do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.Upload

  def initial_acc do
    %Upload{}
  end

  def end_element(state, ['CommandKey']) do
    update_acc(state, fn cur -> %Upload{cur | commandkey: state.last_text} end)
  end

  def end_element(state, ['FileType']) do
    if hd(to_charlist(state.last_text)) in [49,50,51,52,88] do
      update_acc(state, fn cur -> %Upload{cur | filetype: state.last_text} end)
    else
      raise "Invalid filetype"
    end
  end

  # can not be empty...
  def end_element(state, ['URL']) do
    update_acc(state, fn cur -> %Upload{cur | url: state.last_text} end)
  end

  def end_element(state, ['Username']) do
    update_acc(state, fn cur -> %Upload{cur | username: state.last_text} end)
  end

  def end_element(state, ['Password']) do
    update_acc(state, fn cur -> %Upload{cur | password: state.last_text} end)
  end

  def end_element(state, ['DelaySeconds']) do
    ds=integerValue(state.last_text)
    update_acc(state, fn cur -> %Upload{cur | delay_seconds: ds} end)
  end

end

