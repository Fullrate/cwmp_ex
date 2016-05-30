defmodule CWMP.Protocol.Messages.DeleteObject do
  @derive [Poison.Encoder]
  defstruct object_name: nil,
            parameter_key: nil
end
