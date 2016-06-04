defmodule CWMP.Protocol.Parser.Messages.AutonomousDUStateChangeComplete do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.AutonomousDUStateChangeComplete

  def initial_acc do
    %AutonomousDUStateChangeComplete{}
  end

  def start_element(state, ['AutonOpResultStruct', 'Results'], _attribs) do
    push_handler(state, CWMP.Protocol.Parser.Messages.AutonOpResultStruct)
  end

  def end_element(state, ['AutonOpResultStruct', 'Results']) do
    update_acc(state, fn acc -> %AutonomousDUStateChangeComplete{acc | results: acc.results ++ [state.last_acc]} end)
  end

end

