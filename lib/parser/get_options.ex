defmodule CWMP.Protocol.Parser.Messages.GetOptions do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetOptions

  def initial_acc do
    %GetOptions{}
  end

  def end_element(state, ['OptionName']) do
    update_acc(state, fn cur -> %GetOptions{cur | option_name: state.last_text} end)
  end
end

