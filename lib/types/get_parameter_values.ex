defmodule CWMP.Protocol.Messages.GetParameterValues do
  @derive [Poison.Encoder]
  defstruct parameters: []
end
