defmodule CWMP.Protocol.Messages.GetQueuedTransfersResponse do
  @derive [Poison.Encoder]
  defstruct transferlist: []
end
