defmodule CWMP.Protocol.Parser.Messages.DeleteObjectResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.DeleteObjectResponse

  def initial_acc do
    %DeleteObjectResponse{}
  end

  def end_element(state, ['Status']) do
    update_acc(state, fn cur -> %DeleteObjectResponse{cur | status: integerValue(state.last_text, fn(x) -> x in 0..1 end)} end)
  end
end

