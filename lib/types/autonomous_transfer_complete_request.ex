defmodule CWMP.Protocol.Messages.AutonomousTransferCompleteRequest do
  @derive [Poison.Encoder]
  defstruct announce_url:    nil,
            transfer_url:    nil,
            is_download:     false,
            filetype:        nil,
            filesize:        nil,
            target_filename: nil,
            fault_struct:    %CWMP.Protocol.Messages.FaultStruct{},
            start_time:      %Timex.DateTime{},
            complete_time:   %Timex.DateTime{}
end
