defmodule CWMP.Protocol.Messages.UpdateOpStruct do
  @derive [Poison.Encoder]
  defstruct url:               nil,
            uuid:              nil,
            username:          nil,
            password:          nil,
            version:           nil
end
