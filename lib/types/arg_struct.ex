defmodule CWMP.Protocol.Messages.ArgStruct do
  @derive [Poison.Encoder]
  defstruct name:         nil,
            value:        nil
end
