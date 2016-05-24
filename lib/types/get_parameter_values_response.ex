defmodule CWMP.Protocol.Messages.GetParameterValuesResponse do
  @derive [Poison.Encoder]
  defstruct parameters: []
end
