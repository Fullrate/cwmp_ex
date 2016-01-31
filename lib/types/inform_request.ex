defmodule CWMP.Protocol.Messages.InformRequest do
  defstruct device_id:      %CWMP.Protocol.Messages.DeviceIdStruct{},
            events:         [],
            max_envelopes:  1,
            current_time:   nil,
            retry_count:    0,
            parameters:     []
end