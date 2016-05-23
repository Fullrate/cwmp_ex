defmodule CWMP.Protocol.Messages.InformResponse do
  @derive [Poison.Encoder]
  defstruct max_envelopes:  1
end
