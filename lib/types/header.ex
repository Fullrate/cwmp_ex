defmodule CWMP.Protocol.Messages.Header do
  @derive [Poison.Encoder]
  defstruct id: nil,
            hold_requests: false,
            session_timeout: 30
end
