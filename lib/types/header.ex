defmodule CWMP.Protocol.Messages.Header do
  defstruct id: nil,
            hold_requests: false,
            session_timeout: 30
end
