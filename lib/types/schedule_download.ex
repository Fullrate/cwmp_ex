defmodule CWMP.Protocol.Messages.ScheduleDownload do
  @derive [Poison.Encoder]
  defstruct commandkey: "",
            filetype: nil,
            url: nil,
            username: "",
            password: "",
            filesize: 0,
            target_filename: nil,
            timewindowlist: []
end
