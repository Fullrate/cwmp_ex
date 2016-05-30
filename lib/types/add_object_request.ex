defmodule CWMP.Protocol.Messages.AddObject do
  @derive [Poison.Encoder]
  defstruct object_name: nil,
            parameter_key: nil
end
