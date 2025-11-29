defmodule CWMP.Protocol.Messages.ParameterAttributeStruct do
  @derive [Poison.Encoder]
  defstruct name:         nil,
            notification: 0,
            accesslist:   []
end
