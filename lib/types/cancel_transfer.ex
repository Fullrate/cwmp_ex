defmodule CWMP.Protocol.Messages.CancelTransfer do
  @derive [Poison.Encoder]
  defstruct commandkey: ""
end
