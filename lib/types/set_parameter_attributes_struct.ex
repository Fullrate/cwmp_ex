defmodule CWMP.Protocol.Messages.SetParameterAttributesStruct do
  @derive [Poison.Encoder]
  defstruct name:                nil,
            notification_change: nil,
            notification:        [],
            accesslist_change:   nil,
            accesslist:          []
end
