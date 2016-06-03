defmodule CWMP.Protocol.Messages.Kicked do
  @derive [Poison.Encoder]
  defstruct command: nil,
            referer: nil,
            arg: nil,
            next: nil
end
