defmodule CWMP.Protocol.Parser.Messages.GetOptionsResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetOptionsResponse

  def initial_acc do
    %GetOptionsResponse{}
  end

  def start_element(state, ['OptionStruct', 'OptionList'], _params) do
    push_handler(state, CWMP.Protocol.Parser.Messages.OptionStruct)
  end

  def end_element(state, ['OptionStruct', 'OptionList']) do
    update_acc(state, fn acc -> %GetOptionsResponse{acc | optionlist: acc.optionlist ++ [state.last_acc]} end)
  end
end

