defmodule CWMP.Protocol.Parser.Messages.AddObjectResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.AddObjectResponse

  def initial_acc do
    %AddObjectResponse{}
  end

  def end_element(state, ['InstanceNumber']) do
    case Integer.parse(state.last_text) do
      {val, ""} when val > 0 -> update_acc(state, fn cur -> %AddObjectResponse{cur | instance_number: val} end)
      _ -> raise "Invalid status value"
    end
  end

  def end_element(state, ['Status']) do
    case Integer.parse(state.last_text) do
      {val, ""} when val in 0..1 -> update_acc(state, fn cur -> %AddObjectResponse{cur | status: val} end)
      _ -> raise "Invalid status value"
    end
  end
end

