defmodule CWMP.Protocol.Messages.AllQueuedTransferStruct do
  @derive [Poison.Encoder]
  defstruct commandkey:      nil,
            state:           0,
            is_download:     false,
            filetype:        nil,
            filesize:        0,
            target_filename: nil
end
