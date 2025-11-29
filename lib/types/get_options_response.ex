defmodule CWMP.Protocol.Messages.GetOptionsResponse do
  @derive [Poison.Encoder]
  defstruct optionlist: []
end
