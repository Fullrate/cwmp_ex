defmodule CWMP.Protocol.Messages.FaultRequest do
  @derive [Poison.Encoder]
  defstruct detail:      %CWMP.Protocol.Messages.FaultStruct{},
            faultcode:   nil,
            faultstring: nil
end
