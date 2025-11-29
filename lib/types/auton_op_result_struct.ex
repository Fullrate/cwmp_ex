defmodule CWMP.Protocol.Messages.AutonOpResultStruct do
  @derive [Poison.Encoder]
  defstruct uuid:                    nil,
            deployment_unit_ref:     nil,
            version:                 nil,
            current_state:           nil,
            resolved:                false,
            execution_unit_ref_list: nil,
            start_time:              nil,
            complete_time:           nil,
            fault:                   %CWMP.Protocol.Messages.FaultStruct{},
            operation_performed:     nil
end
