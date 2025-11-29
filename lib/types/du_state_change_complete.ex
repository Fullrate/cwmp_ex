defmodule CWMP.Protocol.Messages.DUStateChangeComplete do
  @derive [Poison.Encoder]
  defstruct commandkey: nil,
            results: []
end
