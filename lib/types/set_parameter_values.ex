defmodule CWMP.Protocol.Messages.SetParameterValues do
  @derive [Poison.Encoder]
  defstruct parameters: [],
            parameter_key: ""
end
