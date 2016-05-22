defmodule CWMP.Protocol.Messages.AutonomousTransferCompleteRequest do
  @derive [Poison.Encoder]
  defstruct announce_url:   nil,
            transfer_url:   nil,
            is_download:    false,
            filetype:       nil,
            filesize:       nil,
            targetfilename: nil,
            fault_struct:   %CWMP.Protocol.Messages.FaultStruct{},
            start_time:     nil,
            complete_time:  nil
end
