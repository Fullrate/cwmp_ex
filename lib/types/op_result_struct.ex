defmodule CWMP.Protocol.Messages.OpResultStruct do
  @derive [Poison.Encoder]
  defstruct uuid:                    nil,
            deployment_unit_ref:     nil,
            version:                 nil,
            current_state:           nil,
            resolved:                false,
            execution_unit_ref_list: nil,
            start_time:              %Timex.DateTime{},
            complete_time:           %Timex.DateTime{},
            fault:                   %CWMP.Protocol.Messages.FaultStruct{}
end
