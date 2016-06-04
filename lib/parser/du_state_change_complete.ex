defmodule CWMP.Protocol.Parser.Messages.DUStateChangeComplete do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.DUStateChangeComplete

  def initial_acc do
    %DUStateChangeComplete{}
  end

  def start_element(state, ['OpResultStruct', 'Results'], _attribs) do
    push_handler(state, CWMP.Protocol.Parser.Messages.OpResultStruct)
  end

  def end_element(state, ['OpResultStruct', 'Results']) do
    update_acc(state, fn acc -> %DUStateChangeComplete{acc | results: acc.results ++ [state.last_acc]} end)
  end

  def end_element(state, ['CommandKey']) do
    update_acc(state, fn cur -> %DUStateChangeComplete{cur | commandkey: state.last_text} end)
  end

end

