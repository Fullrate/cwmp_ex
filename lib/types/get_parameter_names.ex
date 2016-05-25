defmodule CWMP.Protocol.Messages.GetParameterNames do
  @derive [Poison.Encoder]
  defstruct parameter_path: nil,
            next_level: nil
end
