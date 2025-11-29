defmodule CWMP.Protocol.Messages.DeviceIdStruct do
  @derive [Poison.Encoder]
  defstruct manufacturer:   nil,
            oui:            nil,
            product_class:  nil,
            serial_number:  nil
end
