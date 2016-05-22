defmodule CWMP.Protocol.Messages.FaultStruct do
  @derive [Poison.Encoder]
  defstruct code:         nil,
            string:       nil
end
