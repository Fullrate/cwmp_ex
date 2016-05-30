defmodule CWMP.Protocol.Messages.GetRPCMethodsResponse do
  @derive [Poison.Encoder]
  defstruct methods: []
end
