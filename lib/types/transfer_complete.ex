defmodule CWMP.Protocol.Messages.TransferComplete do
  @derive [Poison.Encoder]
  defstruct command_key:    nil,
            fault_struct:   %CWMP.Protocol.Messages.FaultStruct{},
            start_time:     nil,
            complete_time:  nil
end
