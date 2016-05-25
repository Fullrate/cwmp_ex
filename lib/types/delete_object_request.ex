defmodule CWMP.Protocol.Messages.DeleteObjectRequest do
  @derive [Poison.Encoder]
  defstruct objectname: nil,
            parameterkey: nil
end
