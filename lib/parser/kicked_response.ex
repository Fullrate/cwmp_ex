defmodule CWMP.Protocol.Parser.Messages.KickedResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.KickedResponse

  def initial_acc do
    %KickedResponse{}
  end

  def end_element(state, ['NextURL']) do
    update_acc(state, fn cur -> %KickedResponse{cur | next_url: state.last_text} end)
  end

end

