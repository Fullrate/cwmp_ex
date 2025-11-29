defmodule CWMP.Protocol.Parser.Messages.ScheduleInform do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.ScheduleInform

  def initial_acc do
    %ScheduleInform{}
  end

  def end_element(state, ['DelaySeconds']) do
    ds=integerValue(state.last_text,fn(x) -> x >= 0 end)
    update_acc(state, fn acc -> %ScheduleInform{acc | delay_seconds: ds} end)
  end

  def end_element(state, ['CommandKey']) do
    update_acc(state, fn acc -> %ScheduleInform{acc | commandkey: state.last_text} end)
  end
end

