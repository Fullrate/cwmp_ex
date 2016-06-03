defmodule CWMP.Protocol.Parser.Messages.Kicked do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.Kicked

  def initial_acc do
    %Kicked{}
  end

  def end_element(state, ['Command']) do
    update_acc(state, fn cur -> %Kicked{cur | command: state.last_text} end)
  end

  def end_element(state, ['Referer']) do
    update_acc(state, fn cur -> %Kicked{cur | referer: state.last_text} end)
  end

  def end_element(state, ['Arg']) do
    update_acc(state, fn cur -> %Kicked{cur | arg: state.last_text} end)
  end

  def end_element(state, ['Next']) do
    update_acc(state, fn cur -> %Kicked{cur | next: state.last_text} end)
  end

end
