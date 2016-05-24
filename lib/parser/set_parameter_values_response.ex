defmodule CWMP.Protocol.Parser.Messages.SetParameterValuesResponseRequest do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.SetParameterValuesResponse

  def initial_acc do
    %SetParameterValuesResponse{}
  end

  def end_element(state, ['Status']) do
    case Integer.parse(state.last_text) do
      {val, ""} when val >= 0 -> update_acc(state, fn cur -> %SetParameterValuesResponse{cur | status: val} end)
      _ -> raise "Invalid status value"
    end
  end
end

