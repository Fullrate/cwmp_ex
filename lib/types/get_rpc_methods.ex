defmodule CWMP.Protocol.Messages.GetRPCMethods do
  @derive [Poison.Encoder]
  defstruct methods: []
end
