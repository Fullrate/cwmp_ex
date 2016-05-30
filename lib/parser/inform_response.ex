defmodule CWMP.Protocol.Parser.Messages.InformResponse do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.InformResponse

  def initial_acc do
    %InformResponse{}
  end

  def end_element(state, ['MaxEnvelopes']) do
    me=integerValue(state.last_text)
    update_acc(state, fn acc -> %InformResponse{acc | max_envelopes: me} end)
  end

end

