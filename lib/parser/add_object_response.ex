defmodule CWMP.Protocol.Parser.Messages.AddObjectResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.AddObjectResponse

  def initial_acc do
    %AddObjectResponse{}
  end

  def end_element(state, ['InstanceNumber']) do
    update_acc(state, fn cur -> %AddObjectResponse{cur | instance_number: integerValue(state.last_text, fn(x) -> x > 0 end)} end)
  end

  def end_element(state, ['Status']) do
    update_acc(state, fn cur -> %AddObjectResponse{cur | status: integerValue(state.last_text, fn(x) -> x in 0..1 end)} end)
  end
end

