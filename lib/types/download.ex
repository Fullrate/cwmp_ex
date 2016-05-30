defmodule CWMP.Protocol.Messages.Download do
  @derive [Poison.Encoder]
  defstruct commandkey: "",
            filetype: nil,
            url: nil,
            username: "",
            password: "",
            filesize: 0,
            target_filename: nil,
            delay_seconds: 0,
            success_url: nil,
            failure_url: nil
end
