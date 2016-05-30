defmodule CWMP.Protocol.Messages.Fault do
  @derive [Poison.Encoder]
  defstruct detail:      %CWMP.Protocol.Messages.FaultStruct{},
            faultcode:   nil,
            faultstring: nil
end
