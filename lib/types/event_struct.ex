defmodule CWMP.Protocol.Messages.EventStruct do
  @derive [Poison.Encoder]
  defstruct code:         "",
            command_key:  ""
end
