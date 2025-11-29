defmodule CWMP.Protocol.Messages.TimeWindowStruct do
  @derive [Poison.Encoder]
  defstruct window_start: 0,
            window_end:   0,
            window_mode:  nil,
            user_message: nil,
            max_retries:  -1
end
