defmodule CWMP.Protocol.Messages.UploadResponse do
  @derive [Poison.Encoder]
  defstruct status: 0,
            start_time: nil,
            complete_time: nil
end
