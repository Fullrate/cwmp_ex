defmodule CWMP.Protocol.Messages.QueuedTransferStruct do
  @derive [Poison.Encoder]
  defstruct commandkey:   nil,
            state:        1
end
