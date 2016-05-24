defmodule CWMP.Protocol.Messages.GetParameterValuesStruct do
  @derive [Poison.Encoder]
  defstruct name:         nil,
            type:         nil
end
