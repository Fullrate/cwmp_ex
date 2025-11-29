defmodule CWMP.Protocol.Messages.GetParameterAttributes do
  @derive [Poison.Encoder]
  defstruct parameters: []
end
