defmodule CWMP.Protocol.Messages.DownloadResponse do
  @derive [Poison.Encoder]
  defstruct status: 0,
            start_time: nil,
            complete_time: nil
end
