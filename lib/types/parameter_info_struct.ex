defmodule CWMP.Protocol.Messages.ParameterInfoStruct do
  @derive [Poison.Encoder]
  defstruct name:        nil,
            writable:    nil
end
