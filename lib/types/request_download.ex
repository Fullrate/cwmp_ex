defmodule CWMP.Protocol.Messages.RequestDownload do
  @derive [Poison.Encoder]
  defstruct filetype: nil,
            filetype_arg: []
end
