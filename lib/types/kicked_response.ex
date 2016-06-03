defmodule CWMP.Protocol.Messages.KickedResponse do
  @derive [Poison.Encoder]
  defstruct next_url: nil
end
