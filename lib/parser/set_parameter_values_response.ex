defmodule CWMP.Protocol.Parser.Messages.SetParameterValuesResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.SetParameterValuesResponse

  def initial_acc do
    %SetParameterValuesResponse{}
  end

  def end_element(state, ['Status']) do
    update_acc(state, fn cur -> %SetParameterValuesResponse{cur | status: integerValue(state.last_text,fn(x) -> x in 0..1 end)} end)
  end
end

