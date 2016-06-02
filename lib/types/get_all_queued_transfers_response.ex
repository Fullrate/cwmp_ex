defmodule CWMP.Protocol.Messages.GetAllQueuedTransfersResponse do
  @derive [Poison.Encoder]
  defstruct transferlist: []
end
