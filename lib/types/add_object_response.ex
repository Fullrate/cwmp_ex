defmodule CWMP.Protocol.Messages.AddObjectResponse do
  @derive [Poison.Encoder]
  defstruct instance_number: nil,
            status: 0
end
