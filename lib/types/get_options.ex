defmodule CWMP.Protocol.Messages.GetOptions do
  @derive [Poison.Encoder]
  defstruct option_name: nil # string(64)
end
