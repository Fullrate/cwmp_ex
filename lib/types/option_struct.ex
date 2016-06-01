defmodule CWMP.Protocol.Messages.OptionStruct do
  @derive [Poison.Encoder]

  @moduledoc """

  This structure is for the SetVouchers method
  and is to be contains within a XMLSignatureStruct.

  """
  defstruct v_serial_num:   nil, # string(64)
            deviceid:       %CWMP.Protocol.Messages.DeviceIdStruct{},
            option_ident:   nil, # string(64)
            option_desc:    nil, # string(256)
            start_date:     %Timex.DateTime{},
            duration:       0, # unsignedInt
            duration_units: nil, # string
            mode:           nil, # string
            transferable:   false, # boolean
            sha1_digest:    nil # string
end
