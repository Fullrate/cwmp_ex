defmodule CWMP.Protocol.Messages.Upload do
  @derive [Poison.Encoder]
  defstruct commandkey: "",
            filetype: nil,
            url: nil,
            username: "",
            password: "",
            delay_seconds: 0
end
