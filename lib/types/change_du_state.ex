defmodule CWMP.Protocol.Messages.ChangeDUState do
  @derive [Poison.Encoder]
  defstruct commandkey: "",
            operations: []  # a list of either operations type
end
