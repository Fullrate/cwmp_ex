defmodule CWMP.Protocol.Parser.Messages.Reboot do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.Reboot

  def initial_acc do
    %Reboot{}
  end

  def end_element(state, ['CommandKey']) do
    update_acc(state, fn acc -> %Reboot{acc | commandkey: state.last_text} end)
  end
end

