defmodule CWMP.Protocol.Messages.AddObjectRequest do
  @derive [Poison.Encoder]
  defstruct objectname: nil,
            parameterkey: nil
end
