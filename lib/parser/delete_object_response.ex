defmodule CWMP.Protocol.Parser.Messages.DeleteObjectResponseRequest do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.DeleteObjectResponse

  def initial_acc do
    %DeleteObjectResponse{}
  end

  def end_element(state, ['Status']) do
    case Integer.parse(state.last_text) do
      {val, ""} when val in 0..1 -> update_acc(state, fn cur -> %DeleteObjectResponse{cur | status: val} end)
      _ -> raise "Invalid status value"
    end
  end
end

