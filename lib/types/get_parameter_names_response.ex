defmodule CWMP.Protocol.Messages.GetParameterNamesResponse do
  @derive [Poison.Encoder]
  defstruct parameters: []
end
