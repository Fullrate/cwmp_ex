defmodule CWMP.Protocol.Messages.ScheduleInform do
  @derive [Poison.Encoder]
  defstruct delay_seconds: 0,
            commandkey: nil
end
