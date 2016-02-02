defmodule CWMP.Protocol.Messages.ParameterValueStruct do
  @derive [Poison.Encoder]
  defstruct name:         nil,
            type:         nil,
            value:        nil
end
